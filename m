Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66D92C395D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 07:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B436E82F;
	Wed, 25 Nov 2020 06:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20083.outbound.protection.outlook.com [40.107.2.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9976E82F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 06:56:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FceQIQnWEODtRIZpWTcmQEjQ8ABa7afL776qSGwthvfP02GskNVPhIEAvQcX+C1feqisoEiHKuaNUysWMgnMlK8Pc8MJXk8HJ3fG3LCoWeorswHwggtxulcT34zevaUirrYWraGrUxdW+tPqLtxjk37HrWKL2RG25ltIsU7209eH0u3JrksYgr8WAx+dOamPvOz2CVBbWGCYPKZx/RlBCGqR6Biun4B6/aODMfk/4GZ7dDIKTJnBH09mv08TSgalq1MZneXOgTfaApRvO8ueL0JYt+/YU+9YRsnKDfNrNIVUIaTA8LDxzQPDrv/S7RWNgS90K03NS0Zi7mlp834N6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MseMAGZT4T6Fqxyf2w3x609VhB8PNzryjkZfyfhK6FI=;
 b=EuwikqNVpC2Mh18HHaiUGJcOUoZBETew2zC97hlGJzpizckrNo220hFn272EVbIpkqX6oKmJCMGZKUGSEpsIo2LJqhkbaj/ojSI/ZTTTe0Qo868a+n1MFfaUsvbXIONjugzL0N9DVSAiXGEo7TY4lCTkzXPWpHwZx6EGTu8FQNwtOpjK5igFEekYWmrNFV9Fl04ERQ8aeGXFQSmq8nmCl0ViazaYEUtF+ro4VLTEJnJAQR3I23jzyeHqU1dqPR8AGHpOJ+64R60SHnHPw9tr3cWU3GGvjBOhmuuJrO5lIX3dZVJ3KsXlNVXreo5ctLmZilsj690pVjxmpy3Wd6Iq7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MseMAGZT4T6Fqxyf2w3x609VhB8PNzryjkZfyfhK6FI=;
 b=PBmKBy4DNzb7S55hqBp4whQLZf7vzu/QlEeFWA9DDIDp1oY+b+42f1mag3V/vxf1DUA+ypdy44wfpslRPJvfvYtKmMJJUJLYQEzWK1rwo3i756FTx/85G41Vw+yx2mptEviYxLKpwv1vKuC4mVTIREO5tEXVW+sLOoTj+Ntr59Y=
Authentication-Results: mntre.com; dkim=none (message not signed)
 header.d=none;mntre.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB4399.eurprd04.prod.outlook.com
 (2603:10a6:803:6e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.25; Wed, 25 Nov
 2020 06:55:54 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::41ff:37e2:c7f5:56a1]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::41ff:37e2:c7f5:56a1%5]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 06:55:54 +0000
Date: Wed, 25 Nov 2020 08:55:49 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: "Lukas F. Hartmann" <lukas@mntre.com>
Subject: Re: [RFC] dcss: fix attaching to sn56dsi86 bridge
Message-ID: <20201125065549.t36mg4nzyoug72yu@fsr-ub1864-141>
References: <20201124171956.981307-1-lukas@mntre.com>
Content-Disposition: inline
In-Reply-To: <20201124171956.981307-1-lukas@mntre.com>
User-Agent: NeoMutt/20171215
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM0PR03CA0019.eurprd03.prod.outlook.com
 (2603:10a6:208:14::32) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM0PR03CA0019.eurprd03.prod.outlook.com (2603:10a6:208:14::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 06:55:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a5437484-3a62-4c97-d63e-08d8910f26ed
X-MS-TrafficTypeDiagnostic: VI1PR04MB4399:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4399F29E44BADE67F46954A1BEFA0@VI1PR04MB4399.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QiBM2jzX5W+RiSaUlItQVOLt5vYCxvIM/tW4AkiMfN36nDZhdsshHNIyYS0oysI96kbhMflcor0Ko+OJSegVZ1S0cJQuMTkr/akbwCl1og4MoWH6e71+Izf71mLDh7H4K1zSDdgWjiOdzxJyfMbTnExBlwhIiKz7/2iI4RfcXrBUYgZYK2PbQK/7lQb0TxMTpx7QSy7nV4azNJU9dTSRsrwxrnMCcDVloURUttE3/pUxIuHzLhK3tpcDFHJL9ZKSckV/hzx3oS1T3vtUDqh+sS5QbQ65rWjA1R552gmLsmRTEzgMFOolwY/gcdDIy+Adngb9bkxk9fLGLEpWZJHrzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(66556008)(66946007)(55016002)(478600001)(956004)(52116002)(9686003)(83380400001)(4326008)(6496006)(5660300002)(2906002)(8936002)(1076003)(66476007)(44832011)(6916009)(8676002)(86362001)(7416002)(186003)(26005)(316002)(16526019)(54906003)(33716001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NBDQzQOomI6l75AhbNIeIgG06YnaeFmq5iC8aAdRGWjlQQPQpa4haoEMf6kY?=
 =?us-ascii?Q?3LMgayfY/tmoUhQzwq2YgUtMRdI9pkPCErqL6TAQR1CVSzodukPCHhzd8mob?=
 =?us-ascii?Q?z+evgN/dam4nPD7/E2MDKsFa8V2VQH2EzAvdi/wjKqjyjdClGaBrYdwyBCkq?=
 =?us-ascii?Q?vygVANq2GatIQSgVSoio2cAR9qqVD9M+YGGz/7hojHjwqY8kwM8NbFLQoBmH?=
 =?us-ascii?Q?CV75dbZ7pBIkf46mEvPojsBoitqdZ2SqCx+1qOQ8eVTsmkuDJNkG669jKaZ/?=
 =?us-ascii?Q?KsAmy78Ap8o+4+B8xIuIIXQ5cCpHIIsJJgnKIIjZkm9n38u9+hs1zQ7lgY30?=
 =?us-ascii?Q?rQvE+gUDXZuT32CENAecf+f7EXvhjauz4EQk/Yis9WaoJ6eQ/vYVdHl4Fb7Y?=
 =?us-ascii?Q?IQrvmT13+5+E6HBmvaWop6myOwPAskHKdspCCI+XNZPfUKA2hysm/S9gllr6?=
 =?us-ascii?Q?4Xpc64mK+gBQjOaa6Ucfchj2wAb667PqQRPIlas0z0Yvm0+RY/QclDANDAHY?=
 =?us-ascii?Q?Y6uIY1lrEn1qRD7p3/aXWB6tXYDcNXDjhzzwWVJQTjKxFuMzLTk90y3HdxLG?=
 =?us-ascii?Q?XSlHoLn2hQI3PUcs//oEaAZ7hVHc3SXUy+LWBdPRZHNimshS/IYVKJTjMmBR?=
 =?us-ascii?Q?67YYceOldSMAE4US9WxiNlMzFzA7CEkD1j4u8AaegsxRI9fmdpP61Mm1Z3P6?=
 =?us-ascii?Q?56V1vttRYOyOOu2q3IaoHwkdh8OuXGV8PIkhMIFKqYHdjGLkje+K8UjLX/bU?=
 =?us-ascii?Q?o8vg0svtFqE+uc/izC4Jd8JAUlqn/NWG+v7pVA21H+bHxaGIJ5OJGG4hKxn+?=
 =?us-ascii?Q?cO7cJXbBc+iOon+WY80RC2FHtLktBgZYzFKbn0PpSBtGRQXl6ApjftJzooaZ?=
 =?us-ascii?Q?B4jjvUjVDY8j7q45vAv7s/Hc7i9Fd/bZQHCnZJBa1laD4st9VePjbsP12a1J?=
 =?us-ascii?Q?cANvwZUQhh35dU6SeBx+oNjYWfvd3YwgA070lDknHiAX9uTs6VIsp3Z9UfFe?=
 =?us-ascii?Q?l55F?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5437484-3a62-4c97-d63e-08d8910f26ed
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 06:55:54.0231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YG8YaxpWQKd4i2VxoqsluNvQHjwYhlZAEpJpsP7JW8/fzbK6O/G8Z0l1dnvrGiOsR3Uqbyfuei8a4sUmLu6vUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4399
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 agx@sigxcpu.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, laurentiu.palcu@nxp.com,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lukas,

On Tue, Nov 24, 2020 at 06:19:57PM +0100, Lukas F. Hartmann wrote:
> The sn56dsi86 DSI to eDP bridge driver does not support attaching
> without a drm connector.

I think the SN65DSI86 driver is exactly what you should focus on, so
that it works when connector is optional. The ADV7511/ADV7533/ADV7535
driver provides the best example on how it should be done.

Thanks,
laurentiu

> This patch makes the attachment work. Required for the display chain
> in MNT Reform 2.0 (DCSS->NWL DSI->SN56DSI86->EDP).
> 
> Signed-off-by: Lukas F. Hartmann <lukas@mntre.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-kms.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> index 135a62366..4967f828b 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> @@ -82,6 +82,7 @@ static int dcss_kms_bridge_connector_init(struct dcss_kms_dev *kms)
>  	struct drm_crtc *crtc = (struct drm_crtc *)&kms->crtc;
>  	struct drm_panel *panel;
>  	struct drm_bridge *bridge;
> +	struct drm_connector_list_iter iter;
>  	int ret;
> 
>  	ret = drm_of_find_panel_or_bridge(ddev->dev->of_node, 0, 0,
> @@ -104,19 +105,19 @@ static int dcss_kms_bridge_connector_init(struct dcss_kms_dev *kms)
>  		return ret;
>  	}
> 
> -	ret = drm_bridge_attach(encoder, bridge, NULL,
> -				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>  	if (ret < 0) {
>  		dev_err(ddev->dev, "Unable to attach bridge %pOF\n",
>  			bridge->of_node);
>  		return ret;
>  	}
> 
> -	kms->connector = drm_bridge_connector_init(ddev, encoder);
> -	if (IS_ERR(kms->connector)) {
> -		dev_err(ddev->dev, "Unable to create bridge connector.\n");
> -		return PTR_ERR(kms->connector);
> -	}
> +	/*
> +	 * This hack to look up the connector is copied from mxsfb.
> +	 */
> +	drm_connector_list_iter_begin(ddev, &iter);
> +	kms->connector = drm_connector_list_iter_next(&iter);
> +	drm_connector_list_iter_end(&iter);
> 
>  	drm_connector_attach_encoder(kms->connector, encoder);
> 
> --
> 2.28.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
