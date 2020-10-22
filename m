Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E8C295CDE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 12:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D86E6F5CE;
	Thu, 22 Oct 2020 10:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50044.outbound.protection.outlook.com [40.107.5.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDAE6F5CE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 10:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewG6lhmmBDEIbTND80Qs95kkbs5OJI+V26pBmWu65b8=;
 b=bYuX+3hevH7UYTPDTT67JPQGSmSnhDfoLhFcxWXMggxc+GQS1A7tqxvOLfQg7ibTjAH7oKCnAQXUxfQi1AklNB4l2xRGI5+xoQGL/8bsa1qzrDjszAqkNQsnmu4APQ9K5ApXMICcCDUZLaGakQkc+D/dadM0MtiJS8edYKDiqyU=
Received: from DB7PR05CA0004.eurprd05.prod.outlook.com (2603:10a6:10:36::17)
 by AM0PR08MB5074.eurprd08.prod.outlook.com (2603:10a6:208:157::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 10:44:48 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::a5) by DB7PR05CA0004.outlook.office365.com
 (2603:10a6:10:36::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Thu, 22 Oct 2020 10:44:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 10:44:47 +0000
Received: ("Tessian outbound a64c3afb6fc9:v64");
 Thu, 22 Oct 2020 10:44:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2802ca7aea2eb885
X-CR-MTA-TID: 64aa7808
Received: from e5da73ccfc50.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1DDC1A9F-9909-412F-A1BB-2C2869FF2B05.1; 
 Thu, 22 Oct 2020 10:44:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e5da73ccfc50.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 22 Oct 2020 10:44:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZs+aeJ+gXeWMkTPbs/U9h0CRIXePZbfh5WJXTFfzyvfyc8wscSeh5iMkAuorwN0wfT/Z92PQrPeN9zaTHy8oyL/IHpk4VeUg3UHqQFycPJNcszx97BGEqH89wZFZKfzWaJsjz8bXuAkX8xk0Xw8/JCoCtGFKvsXRXvB746HD3UW2R5GZIuiyvoHXszvP7N1ReKOvSROebyVjjmBML+VA6iGjogRsr5hIHL8PWCw85fDwnqfdfROTJnL7hIRYtnw816GtG7FxG7YYXCJnlIRkFoVYmWOARyu1s3gpVepTbOg2+Q9ezL4wu0Eve2wcQgh9j9fTiIqFt2ksLvx+eI1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewG6lhmmBDEIbTND80Qs95kkbs5OJI+V26pBmWu65b8=;
 b=D2rMkR1y4WC1Mtlc+kQKCB2vYj6vwn6re3LoTYyWz1C16cio4YYwHEYJYhC3nGhdwr1CWsixQqw6HTmCRV32uz8pF9VcZPbbFzkBRjxmgVcfqeWrltDkZGlYw9fp4Z+InQiULetsm0n62cJdqRznIyb/acEbx5aZvnR7UaesR+9VfopaGpZGN1Zn3zmEW3t+LsnwF0Qs13iEa2SoKiGJjtougY8g/ZcdtPCm6boPBsyxk9JNRZvwjbfBTG+Ek7XRrC3R4/zZDU42s3Io0sMYEJSwAaZ+djRSFgsGjCpjIDFXItJxvMkfPq0dsqAj6qKmEymRRLZ9Uft9nR8qhFZfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewG6lhmmBDEIbTND80Qs95kkbs5OJI+V26pBmWu65b8=;
 b=bYuX+3hevH7UYTPDTT67JPQGSmSnhDfoLhFcxWXMggxc+GQS1A7tqxvOLfQg7ibTjAH7oKCnAQXUxfQi1AklNB4l2xRGI5+xoQGL/8bsa1qzrDjszAqkNQsnmu4APQ9K5ApXMICcCDUZLaGakQkc+D/dadM0MtiJS8edYKDiqyU=
Authentication-Results-Original: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR0802MB2569.eurprd08.prod.outlook.com (2603:10a6:3:e1::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Thu, 22 Oct 2020 10:44:39 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::c131:4f64:a535:3b3a]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::c131:4f64:a535:3b3a%3]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 10:44:38 +0000
Date: Thu, 22 Oct 2020 11:44:36 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: document that user-space should avoid parsing
 EDIDs
Message-ID: <20201022104436.twbe6mhfqsei4hrk@DESKTOP-E1NTVVP.localdomain>
References: <V_APW3gKRhljvcmT28tGV3JkP7qW9Z7h45I-s2wiJvYhaaveCpYpg3tztZPsZVV2KV1NC7rUx08IUUgCJXzdRrWCsEGB0czq4ZozpdyVFLs=@emersion.fr>
Content-Disposition: inline
In-Reply-To: <V_APW3gKRhljvcmT28tGV3JkP7qW9Z7h45I-s2wiJvYhaaveCpYpg3tztZPsZVV2KV1NC7rUx08IUUgCJXzdRrWCsEGB0czq4ZozpdyVFLs=@emersion.fr>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-Originating-IP: [82.1.208.173]
X-ClientProxiedBy: LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::22) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (82.1.208.173) by
 LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 10:44:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c3d62177-f717-48a7-866e-08d876777f2c
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2569:|AM0PR08MB5074:
X-Microsoft-Antispam-PRVS: <AM0PR08MB50744BF1E6A27CBCF18EA94EF01D0@AM0PR08MB5074.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 9IdKmtO3Ct4hFz2R9xNXBDUszrxUfJaUGzJpamYhRJ9e2sdgDQnR3V727Ky740WTtbCTB5OGynWpcYdQdIBcY6pQK34JfbI+hPgeXIw6Xpvt442gqeIl5Fi5Euk9YnAQnSg/s3edSTHXw0rz5uE812i7BBl7wMMrouIxK7Y9AZ6IpRv01A3b13ijPs10FualJKTuixmrMj49eKRk31SPwK6+Lf31V3J6JnSqLSzjJgZKry1I5hpX0GjPxQEbknJd+XXsmbrTOoeSgu43XQIGqaPcWDcpe28St47IqbAfYRYK8d5M8UY+SyGRgQ/7yeKYPbgDMUy2pY380nyT9J1z7A==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(55016002)(186003)(26005)(6506007)(478600001)(52116002)(54906003)(16526019)(316002)(86362001)(44832011)(7696005)(8936002)(4326008)(956004)(2906002)(66946007)(9686003)(6916009)(8676002)(66556008)(5660300002)(66574015)(1076003)(66476007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: MW1FtOaRckP+1Hy8hrgldXkxAe1bAK6Z4FPE52J0GeKWKCHbwFd3U6yeVNyUNkmmnr7Ore8VLVVWK95wJgjDELJ0YUwRz0sFOPr7LsQEiJpLEeUA1wp2C3zzROSaaEpCAQGFpIMOg/iW8izApnfqbTuqNqo9KQGTQDW9QMfSFYEv6oKyO0zpVeEjMiQBIZst+RH9U6ABcmexKJpdnUD5qMCowyNOuh6gxA1GdEv3mTB0Vy1vmWriPj4Xw4XIy2si80uUhCVdJRnJ/wro2YU2VoeLiNVmjvIRBzSWW5Q3TFdCXl9rh9vrLufbtHzZp83eDEVF3+hrw9GZDVKtTu+rL2zrKMvOJTQ8n1HZi5eh2EkHVa2qUGRVGxc/pTnaqE+EdCbJWsRUtNa+LjAW73UmNDaRu0EtWdUs3MskdMxseVu1tRnXOHLapQx5JrX7K6Cex8tIbKQUWjohy3Xy2M9DThkFxgHKfgt0BrP0YhP/qnxDymD9YFM2WxwbNB8tNKLYTH9r1XlnvIlNGjfhzE1W/aSVQAiaEK4b9p7lMh/2+BtYe/vvqxQ7637Clv1N3PStqCgg1pTV/PBhxc4t9L+YevohD72ZGb381UAxBRWEwzsuNBaZv74QiqpZfE7iMdXfQlzg2xoOR9iX/UvfHNkY4A==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2569
Original-Authentication-Results: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: dc9f223b-1f44-4b09-6621-08d876777972
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qbX7yzuAF+Cd6vcsASwC46mq/WheQNfX/MDGkEhCNGv4MzBJOO9xlIl7etlYOBjZCQSK/J0tIsd7LdYTtS8ckGOSzzKV+ec6uu6awbo2FmBphlM2l3zQwqh71FwXclrSCk26DtT5hZgZLX4Rar/Yt5ZbkZ04W+3NT44hDtV+PYI/rxl19gvPfiJP97qcFurbYcnjZQ6A08hRQRgLZLQbzveHJtcXoSJ1Cwx6vBdY9srzyPwoPecJ4tEG2HLmtz3I70FQmxSjT9r80TzXkLvZK9K7TDOy3pnZ+yVgvFmXYmESDmz9C40X3spih2fMt3/zKyLpQnxdu4OboyOCVAew8Krgs1+Bs2n6XkuR/iflJxs7tk+48apQA0PrX9KmEGDBBcHtYOBjvznTCv73SUgUsg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966005)(956004)(6506007)(8676002)(2906002)(356005)(70586007)(9686003)(81166007)(82740400003)(82310400003)(70206006)(5660300002)(83380400001)(1076003)(186003)(16526019)(336012)(55016002)(54906003)(478600001)(47076004)(6862004)(8936002)(4326008)(86362001)(26005)(44832011)(316002)(7696005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 10:44:47.9665 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d62177-f717-48a7-866e-08d876777f2c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5074
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Daniel Vetter <daniel.vetter@intel.com>, nd@arm.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 22, 2020 at 10:34:44AM +0000, Simon Ser wrote:
> User-space should avoid parsing EDIDs for metadata already exposed via
> other KMS interfaces and properties. For instance, user-space should not
> try to extract a list of modes from the EDID: the kernel might mutate
> the mode list (because of link capabilities or quirks for instance).
> =

> Other metadata not exposed by KMS can be parsed by user-space. This
> includes for instance monitor identification (make/model/serial) and
> supported color-spaces.
> =

> v2: add short explanation why user-space shouldn't do this (Brian)

LGTM, thanks.

-Brian

> =

> Signed-off-by: Simon Ser <contact@emersion.fr>
> Suggested-by: Daniel Vetter <daniel.vetter@intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Cc: Ville Syrj=EF=BF=BDl=EF=BF=BD <ville.syrjala@linux.intel.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 5 +++++
>  1 file changed, 5 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 717c4e7271b0..1913d8b4e16a 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -960,6 +960,11 @@ static const struct drm_prop_enum_list dp_colorspace=
s[] =3D {
>   * 	drm_connector_update_edid_property(), usually after having parsed
>   * 	the EDID using drm_add_edid_modes(). Userspace cannot change this
>   * 	property.
> + *
> + * 	User-space should not parse the EDID to obtain information exposed v=
ia
> + * 	other KMS properties (because the kernel might apply limits, quirks =
or
> + * 	fixups to the EDID). For instance, user-space should not try to parse
> + * 	mode lists from the EDID.
>   * DPMS:
>   * 	Legacy property for setting the power state of the connector. For at=
omic
>   * 	drivers this is only provided for backwards compatibility with exist=
ing
> -- =

> 2.28.0
> =

> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
