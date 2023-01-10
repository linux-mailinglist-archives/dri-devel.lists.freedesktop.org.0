Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CF5664378
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 15:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49E910E5D5;
	Tue, 10 Jan 2023 14:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2047.outbound.protection.outlook.com [40.107.20.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BDF10E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 14:42:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asD/UQo7W3oP998LTqTJNcUUTE3VuYRERHU3ASZRbxP35WHgWvrVEzt4+fbkPwigBUu3Z+5KWdT9g8BQw9v59xO7CPLEZBYqbesKnD4VYQkv2tjAQFl/vDd7HoOt5VyyvCTSfblpOlGg2PcCEZZHKyb342qBwD5PNnmtzmXv4p5WHZp/UGZ97VPycJ4xOu2hl9sQ3+KQjFC05vp2qodINrW6CNzY1i3xfWG+eWifsio1z62eED8+6NCKJfnHNnk4iKf+ntDiJJ7Mxe3v+Sfqe4jrhB6r6LItns6+KKd1tDhP1JKT259kOcCErpM5sNwKMq9aJKbEAJNJn6uqqG2PZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYjbeHLmr6cKviawAVPw/+5d7Z47b4OFYi4TuKW/8yU=;
 b=iF/G2CyrIwsITeZOL5WDU7c0EhxIVMnumffFuqvWZN18lHUcamlWV1qS1G1e/m8pZ/uzE2BgxoDhAVJce4rOtz9SikEeXxfQDa6eFEjvstoJ5uNJEMqSASFO4WZNwsZ3E2VYGwoOH+6S6BMYGx3yvPXsMAcFWl8E8cC0gTYpUhMCRLsrza05r+GSlOoG1j8OhVASp9zdZR2ExCZfj14vKShzlGBUJwoJ+GIpt9NSAlOnMVxxm3c3Zdf9O4yVrYGXSwCt8riZKzpqAxsjLMkHOC4DjAE8QhYSjmw0+6KYfctFln1JIUwqh0c8bOHL7LfoHCPHxCu9fVhM0M9srMl35w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYjbeHLmr6cKviawAVPw/+5d7Z47b4OFYi4TuKW/8yU=;
 b=TDB4eIQsCSfXN+jxX5V7h1x4KKd/JdZ7YD5/ukAJJgD5mSLqWkBG3Qc4MkLj8i00ABli/w7OawjPm2UF3NXM+FmBkru0LGrBpWq3FWP4wfszxOZfB1ln0jt/9hSsl7UUQmfOdmaJD5BDnHZ031zy8Glxhs4+WjvZh9M4TSTa23M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by AM9PR04MB7700.eurprd04.prod.outlook.com
 (2603:10a6:20b:2db::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 14:42:24 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::738c:a9cb:7b8b:4033]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::738c:a9cb:7b8b:4033%5]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 14:42:24 +0000
Date: Tue, 10 Jan 2023 16:42:20 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/imx/dcss: Drop if blocks with always false
 condition
Message-ID: <20230110144220.zxlnbuqmd2bqdib5@fsr-ub1664-121.ea.freescale.net>
References: <20221230130025.240776-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221230130025.240776-1-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: AM0PR04CA0072.eurprd04.prod.outlook.com
 (2603:10a6:208:1::49) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3902:EE_|AM9PR04MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a7a9299-283a-4092-92eb-08daf318e29b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EEX7GyjXlBQ+GWl3KIl2A8VeWmVE6ZJtl9zOsjwwYQnUptnThIFmDFTdmAPh4vbjw8H3pwmS/pH7rhraFgQDK5XA8u4TOVeXb+oGIYocExzhb3VfBw4+ySDhAXoLcYPDHTo8sYF+fm5/rc53FvNdoBOCc1WMKRKEWH/84ZeGBNIfK+tNZWDHZtJsoQZ0A7Sqvw5x5S7FxZZbq2BhVRiAVtHNzIfgeTizJmp38pO6qRWwLDKOjGn5uhT/Afc3GTSE8WwYwOyjlD9Phady3G+kvIRTc/AkmYhsE4EVWe+keSPwTh5a0RLdGnmouodMxLgnnsX9gygeqgmJPIBU1dF2JVJcx7Au9nNTfcfCBiMWBgn7Oizvz1oE0Wzh0+UcqPJrGXbBJ+xLt+KKGxJ0kmA1iQqKcSGAo5+vPEnyMhfUQk2BvpeX9H3atPmN0/iu4C5GzFsw5kRlEOTWNJjuFfJB5eCijve+1g2yXy4sIOyjkWqO/fSwkEDx4IT7QnVOks/sM7F2PTORDA62OH7nR1lWn+l1Jus7tAUt6NxbhOUGLQweENJw3M/VLoStBXM9/x0ODiGKSG1PYyKt68u+9/J4IqRcip5i8v+rPul1PGHIA2PBIPZR/yasi9wewcsNXTLp/7KQjffG5Q2r7+K1AIahjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199015)(6916009)(8676002)(66476007)(66946007)(66556008)(316002)(4326008)(54906003)(44832011)(2906002)(5660300002)(8936002)(41300700001)(83380400001)(6666004)(478600001)(6486002)(6506007)(1076003)(38100700002)(6512007)(9686003)(26005)(186003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uweKL2+fy8xtrtElMMLPsHPml+KxokPRp4Z5KO26lUeCD13uRdZ+/KLd5E?=
 =?iso-8859-1?Q?lM/MA8ZM/LTfATk1zVd6lgn202+6cAS2luGSAIgUgTTsEI6FMW/wv2Drpt?=
 =?iso-8859-1?Q?G6g2WeBMRlVvuTei7oG3d0x9eN4y6/sqoI3Ma7QhJ5Q3/3ghy1Ay43+MyM?=
 =?iso-8859-1?Q?OCZPJsk8M9UbMSNhSTF2F663gUe6lX7yNhHAirahy75XIEN7KEo4+Y5uow?=
 =?iso-8859-1?Q?oIefBeDpXiWNY1+h+wWx+Z4Ml8hazvHEfiPhwP05A7q2YCDmdSP1jQ3InB?=
 =?iso-8859-1?Q?j6lJ4UobScMcg0hgQ0HLD8ky/3ptTX8uA23TuXTGPes0IOElu9XvSaPQbQ?=
 =?iso-8859-1?Q?CWCPqfD8blKWuHzXF7N+SuLwO9msI6RYLRlEiq9ToHA0Onv+DwaW5rCoC5?=
 =?iso-8859-1?Q?teET+UMXgw2dYKIicqThmvaNqIWcek5XR72IbLwEvVcepJUx4mLlHgVyMc?=
 =?iso-8859-1?Q?F7ZfKcpZyDOdglZ51vJ0i9rX8zxzf6jnfkMJ3huWX1ZDceR179056Q17FK?=
 =?iso-8859-1?Q?XwgshnnAQsyBxYlQmgZfI3MHJAOdHQFKpa9VbAWktFWwkb3dZOSpx69k7T?=
 =?iso-8859-1?Q?JNeQt6eY7YzmpQ4//5AIYEUGEoENKFsbOxvh1Ig4ONtEt3CBg3GwUUfL/L?=
 =?iso-8859-1?Q?DDugh1zItku194L/ftbe//Z0YNpXqZ+cDdMKU8dwP1KxmDpt6vLqked+69?=
 =?iso-8859-1?Q?8YeWkWopavqg3Dny4uFMuGX/NbIFO6TjpZ0Vq1tqd1R4MXYqwjnCpkEXOj?=
 =?iso-8859-1?Q?z+//02MuNw3ymJ7EjscJt+SJ83w+IzvHakfDvFlA1yeEe3BnxBVPKKh8AE?=
 =?iso-8859-1?Q?Lin29/dWeJZjoNxCba/ek709zxyKNKvp+e7xKPkA6pZGSjmC3QdjAdp/Zm?=
 =?iso-8859-1?Q?ur9wot5P1cvjr5Pi0FSHrpzbBc1dhhRfTWFX/3+tqq04aUgw4mZYS3z32V?=
 =?iso-8859-1?Q?kPCNfabZbj7RJ5zYkaTqVQEwITlicPFDvEFozm5xSEVkAUmbdwHC4U6l1G?=
 =?iso-8859-1?Q?4L8QwW5FVtE+Te3+DzYAR2Z5Vd72J2jIHk1FlsRtYuhmE3uUg8LANAsrV+?=
 =?iso-8859-1?Q?+LaW3+s7yOBzt/92OWAuVeoy2BpkyEDNsRjC43KARnKYJCwbyfCfzSo3aY?=
 =?iso-8859-1?Q?FglUlrxI+BoT6KAw9OMk6rrgm1Ol+ppEwRtjgVBSWhzNd0TyVqP8ApoQUR?=
 =?iso-8859-1?Q?QnE63pCtwyq7T75iPcpA0dXjwXJSkohgO/09piC59DL9IgMmjAm3zPbeUJ?=
 =?iso-8859-1?Q?pQoRJFLuT3sRo75blbDBEXk5HmCiCDeAGfkyqTaldV68CAMueYCWzqsSYI?=
 =?iso-8859-1?Q?ZNfyQ4gR2aQplL920HFadsNQMHb/0BHaI5N1NQEtPOSp12ty0N1QQLth05?=
 =?iso-8859-1?Q?14I0THuu9skoDl3CPCphsxibGPtLn5paBxpZlgRdhBsv0DxOiqsARVIAuV?=
 =?iso-8859-1?Q?gU4sgg3BSlw9tb8jBEJZeMOZYTUbcBtOo3vJC+BFdYfDTxXxxP/QJTAZr7?=
 =?iso-8859-1?Q?R30RiUmLwL8NTQDY9ET1wtn8EbC9lhP4I2G8lqoW/ZTCUSb6zT6EstzamX?=
 =?iso-8859-1?Q?iPe+VSBhFGK+mJRM63QzrObSWsQbaMI7Py8wO8NA5JNA6yPNVXS6J8PAbD?=
 =?iso-8859-1?Q?N8EnMAYrq3eUPhnGY2MD5G6l7NXsdn7zup18fq0uC0IrOs/8yC10TB4A?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7a9299-283a-4092-92eb-08daf318e29b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 14:42:24.0925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6flATlP+DXpMOBl0RXlJwmR2W8DZEnfACPY5A+/Bh0zt9K2fSJsfcIM/rMvNM8a0MVtRYV8gTyej6qRg6QENA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7700
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
Cc: dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Dec 30, 2022 at 02:00:24PM +0100, Uwe Kleine-König wrote:
> dcss_drv_platform_remove() is only called for a device after
> dcss_drv_platform_probe() returned 0. In that case dev_set_drvdata() was
> called with a non-NULL value and so dev_get_drvdata() won't return NULL.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Pushed to drm-misc-next.

Thanks,
laurentiu

> ---
>  drivers/gpu/drm/imx/dcss/dcss-drv.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> index 1c70f70247f6..5c88eecf2ce0 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> @@ -85,9 +85,6 @@ static int dcss_drv_platform_remove(struct platform_device *pdev)
>  {
>  	struct dcss_drv *mdrv = dev_get_drvdata(&pdev->dev);
>  
> -	if (!mdrv)
> -		return 0;
> -
>  	dcss_kms_detach(mdrv->kms);
>  	dcss_dev_destroy(mdrv->dcss);
>  
> -- 
> 2.38.1
> 
