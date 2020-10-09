Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBCB2886D9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 12:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E357D6ECB1;
	Fri,  9 Oct 2020 10:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30043.outbound.protection.outlook.com [40.107.3.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F4C6ECB2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFSZaqR/C/X/lq/DdMZeFcVp25LHccEDc7LNBmdcoPU=;
 b=JFkrLBvOm8Xjt94YXt0p3hld+hvQik7SDSDjgJHNKnVwNnkvHg1fSncYKH5FVXXXK4fbGlSo/0QolfhYfL0/0Dgb9Jq70KscgPMHYaAP6hH8dK8A/f5mjgWqGYeq7ZT6Ld2xdH/qmjLiG+0MUq4Cu9F78dhtU279PxfHmOrKIwo=
Received: from AM5PR04CA0036.eurprd04.prod.outlook.com (2603:10a6:206:1::49)
 by DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Fri, 9 Oct
 2020 10:25:36 +0000
Received: from AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::b6) by AM5PR04CA0036.outlook.office365.com
 (2603:10a6:206:1::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Fri, 9 Oct 2020 10:25:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT010.mail.protection.outlook.com (10.152.16.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Fri, 9 Oct 2020 10:25:34 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Fri, 09 Oct 2020 10:25:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b11d78d97c0a081
X-CR-MTA-TID: 64aa7808
Received: from aad29e6fe881.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D12EAA03-B938-4D36-8A3E-BC5D495EE1AD.1; 
 Fri, 09 Oct 2020 10:25:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aad29e6fe881.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Oct 2020 10:25:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpbVfRhhi1V7IvEw6SzMeEAYGvbW2XEMDckDQg9SNoT5lLIT432a/KNq/PpRCI1hWAtCOChHUKAJX/KcrhueDDrki7SQbuw+9+pW4YAeEACR+9NTjQDheeQHrn8lfpUGVPpgrJO3v7ulTdfCJvL7p8ysG07xdLpqU/mFYzpRcrltBAeLK6i6NnjIF15Tc26zDVoDGoINQXER74Ag1ddX7v3IdZJpkZdtqgOzWrVR7cZ+hCUaGPcJ9UR2VE+93Gbn8vvtrxLVWjIeGH0Gv3hNkjqRK+diTzlXy5ccV7Bot6ne4Zvzabsp8x/pmPnqMBlJZ4QGbjuzKUNeQyySHeUs9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFSZaqR/C/X/lq/DdMZeFcVp25LHccEDc7LNBmdcoPU=;
 b=E2K2r542uK9ki2XbsOy8CeVWEJNX7pG7X1x/T18lGMKgLTb1nB/Nfh4NPi6uvwLFyjJu6qOveu4DTHnnn8gWrCa/WF6wOTkpvFogtxrugLnK9w0buhkTUom1aaEVbIPr4GAJXYYzbnFrxS/pnzNElxP85e94XiPPCQjFQ6hSppTcF7CbSIqR1VCZ1zuGyoQG/Bskz6/gvEZA9XhuH8lyMpRM6mkmpWoOP/Dir7N8LDxE9oEXeCQkaBlB51TJm59vMxuEsCatzIxXQ/m2L643x1/FgNdWYKsgRZlMSBD7LG3PPjPrjAg9UPc/0CXrR5T0OvBa2AQ1bAo3jsPJU8ZHfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFSZaqR/C/X/lq/DdMZeFcVp25LHccEDc7LNBmdcoPU=;
 b=JFkrLBvOm8Xjt94YXt0p3hld+hvQik7SDSDjgJHNKnVwNnkvHg1fSncYKH5FVXXXK4fbGlSo/0QolfhYfL0/0Dgb9Jq70KscgPMHYaAP6hH8dK8A/f5mjgWqGYeq7ZT6Ld2xdH/qmjLiG+0MUq4Cu9F78dhtU279PxfHmOrKIwo=
Authentication-Results-Original: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR0801MB1849.eurprd08.prod.outlook.com (2603:10a6:3:89::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.21; Fri, 9 Oct 2020 10:25:26 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::5034:ca82:7e1:7e6f]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::5034:ca82:7e1:7e6f%7]) with mapi id 15.20.3433.044; Fri, 9 Oct 2020
 10:25:26 +0000
Date: Fri, 9 Oct 2020 11:25:23 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document that user-space should avoid parsing EDIDs
Message-ID: <20201009102523.efvrvznkt66ry24o@DESKTOP-E1NTVVP.localdomain>
References: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
Content-Disposition: inline
In-Reply-To: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0315.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::15) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LO2P265CA0315.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.21 via Frontend Transport; Fri, 9 Oct 2020 10:25:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 118ce154-b384-494d-00ae-08d86c3da88b
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1849:|DB8PR08MB5481:
X-Microsoft-Antispam-PRVS: <DB8PR08MB548167BABEB711EBE5DC81FAF0080@DB8PR08MB5481.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: b/F86M6QpOuZG4AQPLPXxqJRZBW9YtJWxcUdJ3O26br20YbKNJuMelu6KZPFV6/I0eaGhTtY2HOT8Ox9GsgSzaN0I2Kq4J41BmYoQYM+FPGBm6B5LBEdLiEq/0fpPrqO908CGkZJmgBv7LaLCTzrZzD5fdQnkMal88ATD0xZoOfLjB61iiR0OyAyYydVtAugxGMvytCWzp3t9mOqg0VOcq0FYnmEvIKe00/bmbVf0T8uN3mA71Jv6E+IyGhqGOT7Cug8Pv6CjBkjZLVhIpj/i9806Xn3fUnx8Ik93LkdEpYUq7jmKL5wbgqdN4uV/uudzlzwwAQ7PlfMAizonCM6bO0ttwq7o0HjmLcor9mDkTs=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(966005)(83380400001)(4326008)(478600001)(86362001)(5660300002)(66574015)(7696005)(52116002)(9686003)(66946007)(66556008)(66476007)(186003)(6506007)(16526019)(2906002)(44832011)(26005)(1076003)(956004)(8936002)(8676002)(55016002)(6916009)(54906003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: /Aj2g/i5ZxJfRKl9LrSrK+oLqatRzDERJ5+St/9/WK0FMObJ8qtvzUOlVpmQgdhxUmGP/GiceWgehS/KfrmLTIpvO5yNUquh+s+K+uSpBCOQSUv+pFkvjzjpKsQq/S3tVZD6RDszjvQB2MHtQWFAgKHSRc6qEB0pFgRaiNf+WBk3oYvKvdxnv6AJpR9TDdnygBcEzzMrtZ7oS/kG1m5KpIWFkd4I0nSSNl0ITNzaNbWv3Pa51ZOH9v/b70jbDBwPwvTsRpy6P9KAusWDmjvf31C6CbgDt+SjEjoROWdEa5q703m53QujqQ8x/DNIWGNR6NjPJtYyERkavFCVuOn1o+otZo3Tfo7nW+74uTc/HZTYDYSJZnmdaknxTcUYvSMEKFGQumkbd65FoXN8JWateCQ1oLIYS6d/ZwJhW3D9EX6wpJAtc9bKU6BvYG+x36dm7jqs23xYyfrZy33Oktk7vyQAfQHebrNtFp/zXMveSOijNIU+5NogpBQAIuxKPaN3HBg/Su1nYbZZS+N7A5mD1KVPmrvVOhgLHUscnIrzaNYghghj0qAUa1daYbK7FRdy0089tniKau9PTJUgmGj/6B8vzjkt0T+uza5Wp5Fbz640usONM8zneDqMwAbkWapHcmYKELYJ1dW8wX1Qg3XA9w==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1849
Original-Authentication-Results: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8cc2e1de-6084-4c63-a11f-08d86c3da2f4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iA3+97m4SSP8lfNNBMAqAx0PAkAt9o/+/Fb7n5U7+AbV2MSNzcbZLhnzMcv4C96Nn76jkvmHPVrVR0czRdDwkEHbGs9Mtrj/35WdGu7ELlkVHsScUMzjBD4FsVDlLTYymjHPao7aVTuruLivj1PD1IGuV1WXZvRYoNdiEhVGUpuXXrkwOy55HAJQ6xK/ocpof4bsP7MAuWoF5lf7TvBKFzP8RbYM4APUY8WVuLkkic3pr+SqmZ8K0ikyO7rqpsJGwzmgqls6O+C3t93jttkyyZbEPkh/4wZVpsDarDR77GEELn2pw+By0IuPOPrG6/Zz1TtXqtAMd+W+3B0NZPi6pT4axRgSirJdBQgaKoWNGuL7APF+WvlbBV2eQ2uejNXHpTi6E/Y0hCevq0vKgdwbmxiNxectSxwY0nRpc9OTcwxrPDB7k/5aXMuzsKhjrAgf
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966005)(54906003)(478600001)(36906005)(83380400001)(6862004)(316002)(186003)(5660300002)(2906002)(86362001)(81166007)(356005)(70586007)(70206006)(9686003)(956004)(82740400003)(1076003)(82310400003)(16526019)(26005)(44832011)(8936002)(7696005)(6506007)(8676002)(4326008)(336012)(55016002)(966005)(47076004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 10:25:34.8762 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 118ce154-b384-494d-00ae-08d86c3da88b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5481
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, nd@arm.com,
 dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 09:24:01AM +0000, Simon Ser wrote:
> User-space should avoid parsing EDIDs for metadata already exposed via
> other KMS interfaces and properties. For instance, user-space should not
> try to extract a list of modes from the EDID: the kernel might mutate
> the mode list (because of link capabilities or quirks for instance).
> =

> Other metadata not exposed by KMS can be parsed by user-space. This
> includes for instance monitor identification (make/model/serial) and
> supported color-spaces.
> =

> Signed-off-by: Simon Ser <contact@emersion.fr>
> Suggested-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Cc: Ville Syrj=EF=BF=BDl=EF=BF=BD <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 717c4e7271b0..00e58fd2d292 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -960,6 +960,10 @@ static const struct drm_prop_enum_list dp_colorspace=
s[] =3D {
>   * 	drm_connector_update_edid_property(), usually after having parsed
>   * 	the EDID using drm_add_edid_modes(). Userspace cannot change this
>   * 	property.
> + *
> + * 	User-space should not parse the EDID to obtain information exposed v=
ia
> + * 	other KMS properties. For instance, user-space should not try to par=
se
> + * 	mode lists from the EDID.

I assume that this is so that the kernel can apply quirks/limits in
cases where it knows it needs to? I think it would be nice to put at
least a few words indicating "why", otherwise this feels like an
arbitrary commandment with no justification.

Cheers,
-Brian

>   * DPMS:
>   * 	Legacy property for setting the power state of the connector. For at=
omic
>   * 	drivers this is only provided for backwards compatibility with exist=
ing
> -- =

> 2.28.0
> =

> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
