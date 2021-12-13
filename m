Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF73472A54
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 11:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CEA10E62C;
	Mon, 13 Dec 2021 10:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150055.outbound.protection.outlook.com [40.107.15.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EA610E62C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 10:38:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1i5ABZ4rT3QVblgdYJy9b3ApwcIUHu1z5XkZOVUYaukWHZCaJKwB4qMYhFW6Kb0UR8CyfXToevnsPgXM1UPnhZQxso0ovmBfQF+9vageJN2Jc9DqkL5bfMYMs1hEUXwzo5JzRXBOIKztg1s3INyy6jK+NxOIbtX1Ee4qFbAX+5DCi6W1CFU4flBNwwAgLB14u5CO1J4MX0RSvAnkn0yJsjXk3SoQsSnGBGqXCyR2aasFIa/MErqClLZ4Vl4cAOef6+kwm3Od2ki6ETuU+lm3S7WfYKRepCc1LdC7rwLTyBWbYcrhLkLGZberl0gqru7cBeBZS7hKaLBt9KsEttM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0X+gMYRPMbW0LyfkCb0AhRwvj6NSPr6sjv6F+mJ50A=;
 b=XL/rfh+uoVbr9g6NzLd3vR/lBcphKvUoyf+isU9xgfHfx/jSNsqZGEzIeNJnH5KNrTkCOOZdIyShb1OTlRDqRS0haqWIHfLCLRcUqceODxn6jrYXrIg+CCJNrsYjIKdlrhC2+nVQY1/PZ+hY4NEo7aA27FhVW43kOpQ2+dO7YLrRVnyJZfJMuAAdtZhFPBdqO0pV79OyFJ0XWaq71+lLK/pjbhvzvZ1OE5nzwrIRbSUE+IrTNGuSGx0JC88jntdNN6liZVbkuKsh2K/ooV1/xPIAJQfybroEiLHynEHhGvKFCLrUGqeC9sKNbMh5tyX1znUreq2gyey8agZFx4tljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0X+gMYRPMbW0LyfkCb0AhRwvj6NSPr6sjv6F+mJ50A=;
 b=UlYD80ddRpkKS1qARdL1amY8OmY91bAps2uqfplcA3Fw/37ZIUtQGsGAzUur2aR3uet47bkFZQj6FIN9vN62ON40DR+UCxaYbejmK0/xnYvWuePBRskyiSb63rBwchDILViLr7P0U1aei9iboYojk1EkE6UmaKKAalZ5fV9ABHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB4781.eurprd04.prod.outlook.com
 (2603:10a6:803:51::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 10:38:52 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::fcd1:8e71:da22:d292]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::fcd1:8e71:da22:d292%6]) with mapi id 15.20.4755.028; Mon, 13 Dec 2021
 10:38:52 +0000
Date: Mon, 13 Dec 2021 12:38:48 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <dev@lynxeye.de>
Subject: Re: [PATCH 2/2] drm/imx/dcss: select DRM_KMS_HELPER
Message-ID: <20211213103848.we37prwolpqddrc6@fsr-ub1664-121.ea.freescale.net>
References: <20211211221848.1665958-1-dev@lynxeye.de>
 <20211211221848.1665958-2-dev@lynxeye.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211211221848.1665958-2-dev@lynxeye.de>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM0PR02CA0025.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::38) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-121.ea.freescale.net (92.120.5.12) by
 AM0PR02CA0025.eurprd02.prod.outlook.com (2603:10a6:208:3e::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 10:38:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab8a4ac9-3b44-4f97-015e-08d9be24c12b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4781:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB47818D51DF35D8887E720030BE749@VI1PR04MB4781.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VGlNkdy+utyeIzCQx8DDIOw5Qiu+0IzRS6qX0S5rs5Hpc6iJNySzhV2BcqVA3avHw61UdKYAifh4Oebghghx6n4fJXXKpcU5Zv0oS4gQAaV3nMuUJ+AOBiIFiioqGGSVQI8F8ESaTuSyuALr2JSfudnoD1ALJu32jyLgDU+sbnCIgD8fcF2J56FcBO0Ek4D26pnGFhiceAvijh5BnvFdOBg3jp+JBxV3fG19z6+IyVj/L4NNZ/uXnqiphKfaUzyic8hVtZtxYEGLMWM3+wWwXyzNN0We1yqCyc+phQeAgBdpTm/vi7Z4RJVnR15LI3TGOg1J9B7V4TKp3r/i2d4jT352Q2qpf1UV1xAnqnSn5HqiC2TdU6aO1Nq7HZafOfsZk8yDnd6lgBMwO1kgPNowwBreA8C3d3KWCFxd693Yt6GrQurq79BDdgj5NlgFE9hYZSyHRQyjrcdMI+spsMwYoT+jYBRZ161qcPfKyu7GaJNoRsjKYrqUjYd+bXUK0bMmdGAgOdOChDyXzlqy5cMeXwADUiIpWTFMAGGtuOLKSIvtDSmRhQDuFAKDiLb12+Puu7paUKWJiAuw4/Rmw+CQC6gQI/lQd9iJKVs6UrV7L3yYsSW2bY9pYNvMtlLRMSXXDsGE+F6eivyr7+sZs11hGnLtT2grw5np+WGQ0oSrzdvnxg3hoVG225tmlGgoGFZA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4744005)(316002)(5660300002)(6916009)(6666004)(2906002)(52116002)(7696005)(186003)(956004)(1076003)(55016003)(86362001)(44832011)(66476007)(66946007)(26005)(6506007)(4326008)(38100700002)(38350700002)(8936002)(8676002)(9686003)(83380400001)(508600001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hEMPHF6AF3oFWbKxpSJOJVfKmZsfJGburd6JgNRL6uYqzunH8wdYEIvG3+Pu?=
 =?us-ascii?Q?CQwTy0yCddZobkEaroOscFrIPoNyDv7Ldq9FJsNT8Pn6cutPKumOPi8XHPrN?=
 =?us-ascii?Q?7CfNEPdvMOb7vHQ7TlxVHe+uRmiIjoJJ4NzBo4V6J25dYDQjN2xX7Q0I5hVq?=
 =?us-ascii?Q?5YhHmc1dSBrHnH3pgpt0/ZX0r6lKEo/vaG10MBAV6Yw2xg5MsO2iLlSYetS7?=
 =?us-ascii?Q?GejFU2DTMbUtrcAoZn62dendGy70BSG1UR9uq8CyFu9ww5+vcerUXqU9CZe3?=
 =?us-ascii?Q?cI+kd53x/V/Mm5oR/6sMojZIgfMUe8KZIB7Wxbsj8QyWew0byY0i7ChgbBXi?=
 =?us-ascii?Q?buN2jyYjpFzFWS0NxYxoed1qwpoPngLt+QO+Qg30fmVtP0yo+HcD+ft1Hpw2?=
 =?us-ascii?Q?kayYYHAuc94/NrxNrsdXn7UUeHZJH3qB2fl0cnk0SWxN15LW8MjAcoduXa/+?=
 =?us-ascii?Q?uPaWDHLeXDKOCdch+lt4tnhL3Tex5GWxXXsIL+G037ojhfhyL+TbrcyQB7RP?=
 =?us-ascii?Q?AnyguzdteUMRbu6kvnbvlrk7CvsyCIB8eb+nZAw1t23MaWIJG1dZLqY5h4sS?=
 =?us-ascii?Q?LSNesn7h4hGJHw601YWtxJHsEUkA9zdSsT1QVw6tLoSXGLRAhGdvOUqaeznH?=
 =?us-ascii?Q?Xe8NXxZ73ZxJSlioNKO3radGogdm+nPtkiMet17zhr7BEmCQFscdvghkK2Jt?=
 =?us-ascii?Q?k/qXMTGw8jgW8DVXniYEn8H2cNtRvJQJZs+1uQ4cylN8zbp7nq7SxtxOwKCR?=
 =?us-ascii?Q?bXToQkfZGZkYwddSTW3q2SrXhtnuW1Dln7RKDsK1gDaKtngvNCmaltsVa2cy?=
 =?us-ascii?Q?/tnV6NBaOskbUGj5oj0GzkdbzbGthWUff69IMulKNqCkal2NWvEc18SZ+xYo?=
 =?us-ascii?Q?dqj/mHzGFpv4hn+jLW9NQXHrwVhEC4zsBx/QgDk8q/qZREAGeqcN+BC90N8g?=
 =?us-ascii?Q?T4elDBF6PcsoPkFeaaqsz7uEWRNJxjdJpXEPRp036odfDZrNODkQuThkLa3B?=
 =?us-ascii?Q?5pcm3tgsLPUAAq8cm1rWnGvlWGlXFFMrQkMoGuxyuHXqJeJYsoysJk2WvLNI?=
 =?us-ascii?Q?O11qdVlBSZ1BU6nQu79fwc8N6ThwHdatkPYQtKNp8lhL03YTfeetqc5SGVh2?=
 =?us-ascii?Q?GjUk7CuoHKof8+nJD8kr6rVI59FyNiOti+fJWRsk8y020xNGzSPUtnfpf9En?=
 =?us-ascii?Q?/P5PZFecBmAOcxEh3TJ4NGf7YjBFmDy3P5k+od8mRm18iNuNhRMHE+yvCbi+?=
 =?us-ascii?Q?KuHVIvCZ2yL3IrMgseelpFdC05jFvhSfXMxAMhdjE3m/nx6N3GWyc3bMT4lU?=
 =?us-ascii?Q?zW9Hi7j8G/gX4py8mR++hXQY0dZGFOJWljCZq0aOldPisbGNKbHM2k0fBk1S?=
 =?us-ascii?Q?G6gl6p9OwMiNTYUmdTZoyZNszRK1dfpaPLVxrajXvx5zIJ71PdKN5HX5RJRM?=
 =?us-ascii?Q?H1vT8P0aYGSihWO4G3O6/1xFJ9EskA7Y7pYOAhqRQWCY0u3/hXAYef9zPh1B?=
 =?us-ascii?Q?HPt46nuE99qV3wXDCmGP5OXw9xI3Y4cWb1AhzKGvth33VLh7+VP5TOybz9cZ?=
 =?us-ascii?Q?ga/f3QhkOfc5miBOFibNFTSYm62EktBL96otQ4a5+qYmt7tzjpIVAyk9FgYb?=
 =?us-ascii?Q?xiOmVGZJaXoK28wdpAkzGZg=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8a4ac9-3b44-4f97-015e-08d9be24c12b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 10:38:52.0316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dEqp9H594a/LpJLQL7sVsD7+ieFwyP9Te/pPTdqptN6rhN2kAfymGmR6A2oBbt+FOOh5M68aooRNfFPRmHj6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4781
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

On Sat, Dec 11, 2021 at 11:18:48PM +0100, Lucas Stach wrote:
> DCSS can not be built without the DRM_KMS_HELPERs being available.
> Select this symbol to disallow this invalid configuration.
> 
> Signed-off-by: Lucas Stach <dev@lynxeye.de>
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Can you also push these 2 patches to drm-misc, when you have some time?

Thanks,
laurentiu

> ---
>  drivers/gpu/drm/imx/dcss/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
> index 2b17a964ff05..4c2158dc5540 100644
> --- a/drivers/gpu/drm/imx/dcss/Kconfig
> +++ b/drivers/gpu/drm/imx/dcss/Kconfig
> @@ -1,6 +1,7 @@
>  config DRM_IMX_DCSS
>  	tristate "i.MX8MQ DCSS"
>  	select IMX_IRQSTEER
> +	select DRM_KMS_HELPER
>  	select DRM_KMS_CMA_HELPER
>  	select VIDEOMODE_HELPERS
>  	depends on DRM && ARCH_MXC && ARM64
> -- 
> 2.31.1
> 
