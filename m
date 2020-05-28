Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B16F1E59D5
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290556E444;
	Thu, 28 May 2020 07:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80080.outbound.protection.outlook.com [40.107.8.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B616E174
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 02:56:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Btwn7NAKo/VBuHSoIuO8cqr13OY6xuvAiB2dMWxjuM7axHQpI3FTBdWTd/uIH/TtAJ8mtoERXvJKKAFZaYYouADvwqTvpgJ1iUYVqCLm01HmiZFHpylIDitAe8Q4oGi69SP8Bu7umpqm59ls5WwXsDmunn8bCU8n6GTNluYthtTaBVRnH+DHqGWuj4OPxFNrRoCSuf9uYrBUzJ3ZrAS87oKJIxT0WTkXjnFnx75Nm+sySHmVbirWxW3is38riEDWaq7jnFc6ReFP1Z1/k4TWUUAZleGiL5+d0p9V2O/V0ys3QwrlZbtY5LVLmfnV/bkaRPq9fJnysoG4g8S55HjgPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyNDxeBY9EglkFwnp4CQyThLsAI/PHV2j/GkZBEQZEw=;
 b=fVm0CUlrkqbcP09dsu0Redu6zevHpiPxeaRVgp9nc1zXPFBqbyiXUn421Szq5S6D2El0s1qku204fSJoATaeDTYIf22pmXlDjlJCA+OhMd4N1sqyIaYJg2SVRHjt1cfnU9u6R6B8BpNNXZX8cIBhnjlCXOg567e065qnZ/o/0WjEEOgSDV6tYDv19A3QgAPLerVBGBLnbz+d7FLmg8tDRsG6KLa3YZ56DOR/5cNJHb0tWwGimPHItWoOjhSILm//j/Vp+5TMX7G4WGzo4iop/8t76M2VkIXBdmN54m96O4e7POMu2Rz70ZPbV84mA4dhh8w8Pfhk/U8POSURw6fKSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyNDxeBY9EglkFwnp4CQyThLsAI/PHV2j/GkZBEQZEw=;
 b=WYeXn+g6ZSL9fb1/RGH3jqI9CzzQb7KXIgKE0rfQSHv2rCIYihhF0gZsdQwq7PGBSQ/7htrXB34b2IzjBjZK8JJ95m4r5Xa3rdZahB8oARYCZEb/x6HIMlZPGDo1FXCxPQ29d5nR/A1qbopMJ9jSRJgKzL+2/FpRl/wXAwEb4sA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6014.eurprd04.prod.outlook.com (2603:10a6:803:c9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Thu, 28 May
 2020 02:56:43 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38%5]) with mapi id 15.20.3021.030; Thu, 28 May 2020
 02:56:43 +0000
Message-ID: <e46c78dfddbc76a1e677f3ee6cc9d3816f67edc3.camel@nxp.com>
Subject: Re: [PATCH] drm/imx: imx-ldb: Remove the leftover
 LVDS_BIT_MAP_SPWG/JEIDA enums
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Date: Thu, 28 May 2020 10:55:55 +0800
In-Reply-To: <1589268078-19905-1-git-send-email-victor.liu@nxp.com>
References: <1589268078-19905-1-git-send-email-victor.liu@nxp.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
X-ClientProxiedBy: SG2PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::36) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR01CA0156.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Thu, 28 May 2020 02:56:41 +0000
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e59394ac-d6b0-4bc3-e7b8-08d802b2c064
X-MS-TrafficTypeDiagnostic: VI1PR04MB6014:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6014C1E6FD35C35DAEE5FC1C988E0@VI1PR04MB6014.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-Forefront-PRVS: 0417A3FFD2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nz/oyGrAaR+RsX7N7l4w0cai+vD8eWbyRuqdJjWmE7T3H1Dq6sKJl8qYpm+rJvdgiB8WMN1rS2vwqQ7PtbiaSf3Ylspq6HQItFFA9PSEcXo+LEoZevxriIXjwQKcMHkUTPa5epbpkCiDK4cO8QROsVTvkB1vzSVuOhILYJp2exqFwZ6rJRz+0s+Osx6Iy/ZJlbLiM2bkW+pbmos0ymPiPsMg3Dv0bKToa9Yer/1mld+KGoGujO6xlR7ASWV93DEG/UTIBr+48Z/C6YR86TY598eDQntWhnRv7oEwqqE76Pf0r+4fbz8/Ly6K8zlA+vs2Lb5d9bxzGQ7WERrkC2MGpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(8676002)(83380400001)(26005)(6512007)(66476007)(6666004)(66556008)(16526019)(478600001)(66946007)(316002)(6506007)(5660300002)(36756003)(2616005)(186003)(6916009)(8936002)(956004)(4326008)(52116002)(2906002)(6486002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: lt5H6iIYEgzgiaRhUA83MoxGZqz5tI/O3cz1iHMJLf+FT65IbBkK6UMQVQ20AOmKfx4enuW/H4V4+EVXA9HPI3UAx7RHI7Q6jQoSsgmqSGM5Pl/j1jUt6jZeTURFJZjPZwZamgcGhCyDlg33DSLvNzvJvHYlzRT3PyvTCYr5HG64QcQLxGJQoeofE361uyHJxTLEWUA7wik41qMDpY7Hx2hatrjpGkARc0oAxHLnslmgtcueK+ryMO+kvB/Pm/YYsR04dQjw0yR1a9GAk4wgYnynWAXN2eaFZfK2MJiTvUIo1+MBTt5NLuoB1QEK1DSUi1BMLiskYMch+dPv2L5jNxbhtxQ/2wE0fXX7SAoTBxWCDrX15knzB24BNuNW4Lx2bB1ZFdqqvuAp47vMYDbBtU33U/AhFsHkKzEb4EsBHBC75099oxEIdZM/2pDfdB5o3K7/rn3hsn3s+sgoXLZB6yfJkfiFVgLrbSmPnkFSg8U=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e59394ac-d6b0-4bc3-e7b8-08d802b2c064
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2020 02:56:43.1296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wIflL39tPLYWAHaE4ZAPHhT5Dil5aQldkc/bHwFfroZX1RwcegeQMYfXlOvFCG+gqoRhp2risC34CTJFBAi3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6014
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:53 +0000
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
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gentle ping...

On Tue, 2020-05-12 at 15:21 +0800, Liu Ying wrote:
> No one is using the LVDS_BIT_MAP_SPWG/JEIDA enums since a previous
> commit which changes the imx_ldb_bit_mappings[] array definition,
> so let's remove them.
> 
> Fixes: 5e501ed7253b ("drm/imx: imx-ldb: allow to determine bus format
> from the connected panel")
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/imx/imx-ldb.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-
> ldb.c
> index 4da22a9..19a00eb 100644
> --- a/drivers/gpu/drm/imx/imx-ldb.c
> +++ b/drivers/gpu/drm/imx/imx-ldb.c
> @@ -477,11 +477,6 @@ static int imx_ldb_register(struct drm_device
> *drm,
>  	return 0;
>  }
>  
> -enum {
> -	LVDS_BIT_MAP_SPWG,
> -	LVDS_BIT_MAP_JEIDA
> -};
> -
>  struct imx_ldb_bit_mapping {
>  	u32 bus_format;
>  	u32 datawidth;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
