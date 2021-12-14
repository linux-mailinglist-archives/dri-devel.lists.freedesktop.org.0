Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2044740F8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 11:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEFA10E412;
	Tue, 14 Dec 2021 10:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70082.outbound.protection.outlook.com [40.107.7.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD7D10E412
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0++1zUP4rBhNfAmc5gcbquat5bz0Ez8A23T93niadM=;
 b=dMCfqFUCnQ7DCswtUgpnP1HAzt8JQGCbpUTid9yCB9qisEIBsUY+PsHTulmJHvSO3bIPgsxDXmM0NssvYFNIufxG2BHm9syBUlxx7pFly68M8dgYBex7i34Pq7NFEV/M5f7ld7LqZErAmjrwKTN28yc6coSXvv7M7S/Uf2GU0Lo=
Received: from AS9PR06CA0381.eurprd06.prod.outlook.com (2603:10a6:20b:460::28)
 by HE1PR08MB2699.eurprd08.prod.outlook.com (2603:10a6:7:2b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.24; Tue, 14 Dec
 2021 10:59:25 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::e2) by AS9PR06CA0381.outlook.office365.com
 (2603:10a6:20b:460::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Tue, 14 Dec 2021 10:59:25 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.12 via Frontend Transport; Tue, 14 Dec 2021 10:59:23 +0000
Received: ("Tessian outbound c61f076cbd30:v110");
 Tue, 14 Dec 2021 10:59:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ddf12c7751255983
X-CR-MTA-TID: 64aa7808
Received: from 163d9da6a332.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6DD672C9-1834-468C-B916-3F9E4E0F8A09.1; 
 Tue, 14 Dec 2021 10:59:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 163d9da6a332.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 14 Dec 2021 10:59:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TuKtQEHrznrMTs5c6Yc+ufj/hyx0WRwEEC6+16N1qLmj0QQAe62oUgdJmdgpKLGvJ9/SBW7IciPBSDgwol8beGQHffWWZIkpnEhL+9TKCt3HrA29l0D4AtpDnnmxO4kLHYjPoMn7NWNVPwu9fxkQl++g3dao0l/fe2EWeLnu8Rwt4zbt16z82jIzdUBbs0m0MNBg52+3H8WyGu7QAPLxrHhcIQYKX8r8ywYmVLkdz8w6TAz0+lNTIRV9Zt++3o8DXyzXXHVOmWdYhUmzokWqTygB5amrftPYa0KUroKRqKJJzX6ceqtCucy/r1NCYeE8dLOXTpG7hO9Z6QKv/xP8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0++1zUP4rBhNfAmc5gcbquat5bz0Ez8A23T93niadM=;
 b=TgpTltiMmkGYCLWCbIq64r8qruTSqz6J1l8LqEqhUfWXqF3xXHt1KCK0q2UXTGw8cJkdhmjvz9iljN4F7IhtllKDLTFFugk9QIUd9wFNJsorILv+taMAjJVNIDiu/d/i4n7s61AnebNRwdame9p6NSFksKDnEv789nnwMr16jRDMdYp5w5Q3qKfPeygfEpupvleAFp0xt1Wn74GqAEP/gYlF1IIoXeTTvdqxGHRGta0ZGHc1ZBOuTB+TeInwGr3yH9g9+HkN9Ix/hSI2+n1g/nYJwac7OFOWeAlVyRTbr1Z4vuZnLa5DeSDpBPQrVAOVUez47EwIEYt0cBVcE2KpzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0++1zUP4rBhNfAmc5gcbquat5bz0Ez8A23T93niadM=;
 b=dMCfqFUCnQ7DCswtUgpnP1HAzt8JQGCbpUTid9yCB9qisEIBsUY+PsHTulmJHvSO3bIPgsxDXmM0NssvYFNIufxG2BHm9syBUlxx7pFly68M8dgYBex7i34Pq7NFEV/M5f7ld7LqZErAmjrwKTN28yc6coSXvv7M7S/Uf2GU0Lo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB6812.eurprd08.prod.outlook.com (2603:10a6:10:2a2::15)
 by DB8PR08MB4028.eurprd08.prod.outlook.com (2603:10a6:10:a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 10:59:14 +0000
Received: from DB9PR08MB6812.eurprd08.prod.outlook.com
 ([fe80::fd1d:c45:53d5:79eb]) by DB9PR08MB6812.eurprd08.prod.outlook.com
 ([fe80::fd1d:c45:53d5:79eb%9]) with mapi id 15.20.4778.013; Tue, 14 Dec 2021
 10:59:14 +0000
Date: Tue, 14 Dec 2021 10:59:10 +0000
From: Brian Starkey <brian.starkey@arm.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] drm/arm/mali: potential dereference of null pointer
Message-ID: <20211214105910.zwmrgcaswgrtnb5t@000377403353>
References: <20211214100000.23395-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214100000.23395-1-jiasheng@iscas.ac.cn>
X-ClientProxiedBy: LO4P123CA0367.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::12) To DB9PR08MB6812.eurprd08.prod.outlook.com
 (2603:10a6:10:2a2::15)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 46dc5ae4-bda0-4b2a-a3eb-08d9bef0c9fe
X-MS-TrafficTypeDiagnostic: DB8PR08MB4028:EE_|AM5EUR03FT044:EE_|HE1PR08MB2699:EE_
X-Microsoft-Antispam-PRVS: <HE1PR08MB2699DEB0D718BEBE147B383CF0759@HE1PR08MB2699.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uJ5TT/YH+MAhT6wgi3w+MfxpxTh1+Q4pOILrx/BuYKfXPvzRDdk2kFeyf8a6bkK/66FknfequgBdJ7IzkXTTt3jE2fk32mwNZ3Xi8bNTRiL3l0K0/3lVbA/tK88fehADXndzRBEZKNbefGzT25lbj8HtiSiYsP2PK+3jBo4bvbNn4NS9I6n7ZvhNv4TrKWjEssxYgNQtHYtYhBCPW09nPIvcKkO18Cx+arXYXZxmFBdQjcvBhqSw5gDjx3n+Q2G4CBmqv5GBfW1q0S2MqqSEjV6JlAEO70JWC8QC0ovjzadvslz6o9JzfY63CYj+E3O15ZE1nF8BjG67hmypvEuIAlRsk1iR9QzemimBYz/WXkcHu57OvnUfqjVrspvSczhxr99sl0eMKHIe5yqkwsggXJbx840IfsajCzfXpUCNwIY1tLaQu/lPFYMsIOOon8GlGN9oEPZ8Hjx+gmdHuK9nmjT40mS/z+/6mjqXcuCQm63cQO3RRqd1nO3SbuwzK2eJp9ndKKlEmXRRuM67edkbXQkpPVyJ9yTxG0Ix68gSgubXSe3HZ6fJLldqkVTfb4NnehRTQV6CDHKCEZcwIleF+tiGQ5jG3ox5cwJs9R6mZ0OBKkjW9Gqyzh9dYI5K31gpa1FruZ6KNd+9T9Fhu2G1unMw1vPptezkgEKbyyzS4GgMWssoX6bzTwon6oGmKiqp09GR1WMrAQUL0KcX3d14Ww==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB9PR08MB6812.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(6486002)(38100700002)(6666004)(38350700002)(33716001)(86362001)(83380400001)(66556008)(66476007)(508600001)(66946007)(186003)(6916009)(316002)(2906002)(1076003)(44832011)(52116002)(6512007)(26005)(9686003)(8936002)(8676002)(5660300002)(6506007)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4028
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6a1534bb-1364-48eb-7d06-08d9bef0c417
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FwRSxVdcvTYpDsbWNB35GXFJInU120710tw9sdRjEKURds/ig0KhQICnO/QiLatxBUKbXhFRnR+Oj5ORDPdpFNKyAI7ZwY+jv09dNx55IoMv+1XR5cegNu3qhW6gjaYH9nqk/A7+W+2pjYP8RU7KuEVlzF3VRDam2BOhyH9moRhsczItVxn24ePrLp0pw1kTdi/v6i1bzos4WVumVgAK1ej/mBTY7lIE8k18bQyicgZVqYi97HgQL+PC3HR2JjfyjHwK/lNHXv8hAi7qi2MSBdllSOrvFw5Ng+7WmkzZghe/zKfVa3LIioX7XxAPjpbzjhDBKyBnPGJvdthtaa+JLvzn93j4htSwwNXXCBUxnN8DYRo+yWyJP6sqw8mHJHuruUQVetWWKa25mPTco/MAtAXIDvyx3RFyOy7Xe8pwSVz2HYXTNcE6VuRpn2E2SM7OaPP/OZ220T+CXYh6rHAY3HjPTQe6koYRfcgW/YaQqfNQzXDIrFRjWndBtzxcul9YfXegdEWzGMj11lYGoCGGxXNLvyz6tQ3O7nYLKDYd4x6nubvkgryyk8x5jjkgoQlFZZX3Pkk2MVkSxZHwHkGPDIPgpOKJoSgfQxloh1doUsL3iaFWRxGbLt7ZjQ9xWExGEHzNhhujDtZYmmSlO8nOC8J9SWW4wZgbV7CjSKOmZ3qj3r3lWREQO1kPLfLPVjyiPrKnxaLnp2GSAS/qKs8w3ZrXAGb1BFoMgU1wR17jAJjW/yQ+GZDcYLlNUweBDy/+ayERQdAZxAJRWhZUPVvO3A==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(7916004)(36840700001)(46966006)(40470700001)(6486002)(5660300002)(26005)(186003)(8676002)(4326008)(81166007)(316002)(8936002)(63370400001)(2906002)(47076005)(63350400001)(40460700001)(6666004)(86362001)(82310400004)(70586007)(6862004)(33716001)(36860700001)(70206006)(356005)(6512007)(508600001)(6506007)(9686003)(336012)(83380400001)(1076003)(44832011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 10:59:23.9347 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46dc5ae4-bda0-4b2a-a3eb-08d9bef0c9fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2699
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nd@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jiasheng,

Thanks for the patch, that's a careless copy-paste on my part :-(

On Tue, Dec 14, 2021 at 06:00:00PM +0800, Jiasheng Jiang wrote:
> The return value of kzalloc() needs to be checked.
> To avoid use of null pointer '&mw_state->base' in case of the
> failure of alloc.
> 
> Fixes: 8cbc5caf36ef ("drm: mali-dp: Add writeback connector")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Reviewed-by: Brian Starkey <brian.starkey@arm.com>

>  drivers/gpu/drm/arm/malidp_mw.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
> index f5847a79dd7e..612d386ee7d2 100644
> --- a/drivers/gpu/drm/arm/malidp_mw.c
> +++ b/drivers/gpu/drm/arm/malidp_mw.c
> @@ -70,7 +70,11 @@ static void malidp_mw_connector_reset(struct drm_connector *connector)
>  		__drm_atomic_helper_connector_destroy_state(connector->state);
>  
>  	kfree(connector->state);
> -	__drm_atomic_helper_connector_reset(connector, &mw_state->base);
> +
> +	if (mw_state)
> +		__drm_atomic_helper_connector_reset(connector, &mw_state->base);
> +	else
> +		__drm_atomic_helper_connector_reset(connector, NULL);
>  }
>  
>  static enum drm_connector_status
> -- 
> 2.25.1
> 
