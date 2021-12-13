Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C021472A1F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 11:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BE410E706;
	Mon, 13 Dec 2021 10:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80044.outbound.protection.outlook.com [40.107.8.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876BD10E706
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 10:32:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/xw7FOmATlCLZZgTc9ikXIfUR6w8IPfEgtzYSqYWWwWPWfw9oDEw3/dpI1rQRIAJbwb3ZMQvHayTstCC2awCen3zaDY64ijnjDLjm6jiZ1V7dMdifsqa1XjHREbP+nfJXKdqHACFCmSh/Y9EZ8czkVGIFxW5z5orftzhkYmfBt5xjR0Fk3Fp+CRbSIja0zZ179VPBy3r4lp2ZKRhoEQ23btqQpaF+Ynl0FPSv3SOokurZgp4vdrNgRislMTcuh2gccmFNShr+dYFDLliU8JtI1zuedZ7LR/Qehewqs1aLU2AwUItew5ifRnwM9pocahh5lzv0Gd2meEZUIKYRDavg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEEUj2EtEx1NSCmSILDPbL877dEpZQILvvsp+XJ84+U=;
 b=R8TX0YQhkRYxHEGc2ye7bHdXyCN4jTP7884U92IuRtUId48pAPNJYSaGYv3cOX+cWs0EodnMMBhtUZ03/OcZNA5BURBxWmT2TAiP8TNYNr0y19r3NBkQp7ld1BB2kkxqkKVAeLYT/YSEzLlmdHNlQqVqQyLpHrvQwa45e0b0wBMZwgjefozHPy9vB1Ro07hyWN41/kaakqVp1E2fdCVAGxsa9ZQJ3BhuIR3inVwaOMSuryzPaIKxxsYAtVNQA8mgV2Db9mDzPfjDcmHVv3k+q5Bsb1uhL5l+W4oq5IymkaT8/pgFmZyLKEzHf47dBOzX0eLdoE145btDsL1zXNWdqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEEUj2EtEx1NSCmSILDPbL877dEpZQILvvsp+XJ84+U=;
 b=TMynpm8aotdrRvYoB9q69lltbmGqYNS0JP/Keim59+79xj+Il8BV4cD/LiXtbTyePW3UYGSCnM/y8EpEhFwMeXDMgF4ysky7HHJErwx8Qb0zMvdqi3gbRIO7PQvPJXi1/QftkjjaZoykw2iXLEGea57IsGe3sYWw14FnBJQ9d1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB4527.eurprd04.prod.outlook.com
 (2603:10a6:803:6d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 10:32:09 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::fcd1:8e71:da22:d292]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::fcd1:8e71:da22:d292%6]) with mapi id 15.20.4755.028; Mon, 13 Dec 2021
 10:32:09 +0000
Date: Mon, 13 Dec 2021 12:32:05 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <dev@lynxeye.de>
Subject: Re: [PATCH 1/2] drm/imx/dcss: add missing drm_bridge.h include
Message-ID: <20211213103205.46bfq5j5lj377l55@fsr-ub1664-121.ea.freescale.net>
References: <20211211221848.1665958-1-dev@lynxeye.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211211221848.1665958-1-dev@lynxeye.de>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM4PR0302CA0017.eurprd03.prod.outlook.com
 (2603:10a6:205:2::30) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-121.ea.freescale.net (92.120.5.12) by
 AM4PR0302CA0017.eurprd03.prod.outlook.com (2603:10a6:205:2::30) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 10:32:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfa0590e-6184-43ae-521e-08d9be23d13e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4527:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB452733AB61B7EF82EEFD0355BE749@VI1PR04MB4527.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ryM/BzIBI/Ji3jf91bNkIfFYGQgLDfx9vTeiDdNhlJPAhu29yU/K8jhHawRbCGLvhk5MSiqK4tKG/lPwVg5wNKlofsWR/kUZMaegaMlREE/r/ZqWENso87BbULfqzpeySlcIQzOywWrwVhXGf3u5TEwl0opQi3nEY0m2gmsS35QYRF5osHaZ5VoEnLOQbWzM6luLRfoh53gN0NptuGAK5aXkcadyx9zTKl6XQDC+cQK8xRYVhC9iw2K7SmcUn5Cy+R0Vn7WiZvvEztFKznYjGs++1C+zUKK+hFn3gLUOE8vv6hG10JiyC3bTnhZ2CSymGxzF75OVnTaS+IzB7K5nGhqU1UMmA8m87v55rzbLI1pWYRrPrPmeX+PVr61pSD1ovXjCks2kHkmEQMVsdBiOAN1Oz6oM79zZqSjIfXbPARpR7rhFumaZN+eJt9kUjEygQ6w2XzisKprV/H1RJ1Q+V34/uAGLqODYjq/va0SWUnk37lojSUfOXp37C5t4mz3i6s3X4KzKjxXUlIgCOfy/YCCe9MLA0i49gXRcNxcNOSMTuPIZ7U+L1AKkZ3cLpIyvtuSakhR8LQElVZbvddq4os/ep7TNnMCcYYH6RjepEqN7k6K4XGuk4nQXUu8VrTkS969bh/pIcR60BVBmrVqf/fZah+F9j1im9B/40hMIqqJg5/YWcgz9X+K9Gnw2tNyxnyYPDc51nWugBzMyNEDxxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(4744005)(2906002)(6666004)(86362001)(5660300002)(316002)(66946007)(956004)(186003)(44832011)(55016003)(66476007)(1076003)(9686003)(6506007)(508600001)(4326008)(8936002)(52116002)(7696005)(26005)(38350700002)(38100700002)(66556008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xjq2lW38txgtZwGGYd5z5R0/nocuD0mBNjZFdtPu41wQSDT8ga3LA0XvzNAX?=
 =?us-ascii?Q?MEsFTvyk8kZrMIbSTPPGhR8Zirh3yMhUZT4E4vzkQaFeb1/f8Ywp+EVlW15L?=
 =?us-ascii?Q?uXABPtd7IxV3QvBk9czPLozdoNdJRNiwCxpKJSmCHP8VDi0zuBEfOzLfXKrx?=
 =?us-ascii?Q?v8m5+3eCbjoFTAHO9+pD2uISDDW02yMa6pI9x4udd7AHBys91V+ssmOb8xIK?=
 =?us-ascii?Q?k5Za44aaTTMF8+OEcj/9ohJiko16IVxWIoznMsfqMDDCLvu+r0fBUOmvROfp?=
 =?us-ascii?Q?q0UKrzHBpJeL1gr3QQpMTAP4v4AAyRfd+y5CiFOnrDs9RYyrrC5hVlNmOo7T?=
 =?us-ascii?Q?79fwRqvvjB/NubXJfBKRfupPzJywfWXk3fakf5yKaC9wU4BeDnr4SpMfGPp0?=
 =?us-ascii?Q?e8Iw76ysE3GMH5QrtnhAw1N64ZISE4ZWMRXQWZt1TlZHAcvxd7ofTF1gwHqS?=
 =?us-ascii?Q?vagTpw92iq0VdTKiz+tByt3/k0kMYghQfKN3Ep8N0uILyAG4dUEmRiZbnlvM?=
 =?us-ascii?Q?ompNiBouQJU1DksUuC+7rs2OWBA7DTcfJqKSZZbmmmG1WvYkBGDpMTftjFOo?=
 =?us-ascii?Q?49pKj5lKpXs1T8dsuAS9GCa+ss73isqBeNNvsPH3U39NiONOcXU04U+C5sHV?=
 =?us-ascii?Q?MLSyue8+7vijdhhGTtvpxh1oesgoX5gIwytKc/phCNLHIvzQUomFRrh2Ii7z?=
 =?us-ascii?Q?4bwBapolxcqZLiK1pnsThqozmHPAcFN70vL3LaIGg9YQvRDTdy3sUpDpb4ZL?=
 =?us-ascii?Q?WwAy6zaMq8d98me3j2C0yBY83sntS+nYl8W3KT7BTeQ876Hj7FER3sg/JrgN?=
 =?us-ascii?Q?834MAMeoNU9rjNE9iPhfW7ruKQ7OA6UtE/AX5RrHsdO1Kwhw7iauPVnXAfor?=
 =?us-ascii?Q?rChA+VA2xWtGc56Idw8JDu6YUNJgPiVMHQZk4Q4EcgW5oOF/zPgmmggBAkl7?=
 =?us-ascii?Q?4nG+YDdck7/12+F+2g5KSNWDmzjYPHfH6VjG6a/Dhf2++keb0IDX0RSwerom?=
 =?us-ascii?Q?yrpF7kfqJo49voMM4WY/mG9sY424wDoiP+DfVPeJ6GwozJRk3Td5WHPnOST7?=
 =?us-ascii?Q?3beqIIqQXeetb0wLBnq2QpDM6ITLVtujTn3zJYcUHrD+dVQnfjGOBjDvZilL?=
 =?us-ascii?Q?5BpuOkUZ911/rtjcs/tQESi0ZpaZbYU3E+laXJyXYLA1XTbcUC/kX6Ewr+RJ?=
 =?us-ascii?Q?blLsTkyXwh9FN4j23ycILWAeoI2bTWUG211kJWSOGNSw5fSNGKkKSlXjdfEu?=
 =?us-ascii?Q?TM7iclu2mKAildwwqEGfaE73QVqSnCwbmKMLz1w6lAdDmziQhdUsjSIYvtZ3?=
 =?us-ascii?Q?Ye6b+KQEeiTEBGfEnRcGF3txPV1BrqcuLBDw5ana+OtdHkY4ZeMRrF9xIK3D?=
 =?us-ascii?Q?12uZISw2Ia02lXs6zrvcwG7gvymRf+I5TmR5qeVLAsyyeCNzfwt0xe30Ltg+?=
 =?us-ascii?Q?zveYzwEzZTTI6NtsZcwYjGoJfxql+4vFFO86OIQr5nXwmHgJxL++Df6XAe1a?=
 =?us-ascii?Q?u/m3R21FfULlHOF0ShUA1xjbG9P2aX0BWAGOrxEjIGQi9ZGthtzwKtVL2vrd?=
 =?us-ascii?Q?g4OswylVrvHXDj1MOy6xaTyRYv4aI0wxD3DLrsubizTkDGks5g06YupggXMj?=
 =?us-ascii?Q?7y5TyTs3lh3gceCeUgrkoOA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa0590e-6184-43ae-521e-08d9be23d13e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 10:32:09.6779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0xykKwlRnyOYdC2TaGlieBCWYmI7aaNcXuWtB3XNOZOH7y/gujrcxMtAdwkZU1RCAuUJILu0nBTs/7px23UXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4527
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Sat, Dec 11, 2021 at 11:18:47PM +0100, Lucas Stach wrote:
> This has been pulled in via some other include before, which is no
> longer true.
> 
> Signed-off-by: Lucas Stach <dev@lynxeye.de>
> ---
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

>  drivers/gpu/drm/imx/dcss/dcss-kms.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> index 9b84df34a6a1..96a9517021fe 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> @@ -5,6 +5,7 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_bridge_connector.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fb_helper.h>
> -- 
> 2.31.1
> 
