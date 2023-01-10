Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1AF66437E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 15:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3B710E0C3;
	Tue, 10 Jan 2023 14:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2082.outbound.protection.outlook.com [40.107.13.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B59210E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 14:43:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNTtNnRSUKqlx7IjCjz9poygtw3hkaR2F8GpE/CWr3vjA7C+BT1MvUUwcBUPyjEZp6PyxXv7Aqe6IVZSj28TK/m2Sqi9E/yfJCfkCBaY0n1hOCEnCg6cABHcDrjkfFiQKonkvjbDY8zAjAxGZ53kCQKDjlJj1InUU4PKbQj+vwc7+OdsCj7M+ysPscbytF/2AufE5gfyw6dHMc3xdtLfYV9P6+YxI+juOTaVzDlFszND8NhFBjXWF8N8tJyD/UhMI+PUI3yawDiE5F5i5oOxwqIz8X4J8q9F8DFEQPaDqLafbuVR65ol9wLENrWm4zWXobmUEVjrypade7NvYhGPjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96bwDdwXHskrhTMU6aMPULt4fwTYIgS0dSqBcrABpXY=;
 b=XaQpWUio0K0hHvaRZGGOBPpI5V5yAP3WkGs9EpWTy+FSbkNzklQlmT7qYCNRmO545CyM49hzKK0gbKM50qKQzIgJxroX8ld0OmuRTfj2abs0/zWL7VvCHZmqRCzfgxiS6oBiUIYMmu7G/HW9RuhVaEmMkiZfZspIEjKNg0zdIjSK9FtcwA/UeaPQu1iQPHGnfWeO5KdmHkjYEEypfQykSjbjHXU6vZyzC1jQZLatfPvCklaFZ4lt2yS7Q1lFACUreRW1pk80v7576489oIhLVW6gYj4IFzuaCXOQXutCz6qGFTDnuvE1cQc/svEJBbiI911n4OZlx5F0HLk5y26X9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96bwDdwXHskrhTMU6aMPULt4fwTYIgS0dSqBcrABpXY=;
 b=MiwPEyWrEy/5tWOvknr0BZQKPjgVVi67mLUrgvwWyrL9Ogxd+vxTjPD3+SU90e8hHdglA4aouOs6jIEjbG8Bmuh6vYBrRXuA6zGCHTis5sGYtUjuPVil5Jkx8wPux99fpin94bxFuEoMSFh1hrsCS80hxebleA5ufa3cNfr+b/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by DB8PR04MB7148.eurprd04.prod.outlook.com
 (2603:10a6:10:12d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 14:43:13 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::738c:a9cb:7b8b:4033]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::738c:a9cb:7b8b:4033%5]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 14:43:13 +0000
Date: Tue, 10 Jan 2023 16:43:10 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/imx/dcss: Don't call dev_set_drvdata(..., NULL);
Message-ID: <20230110144310.37t5uj5j3vog6rzz@fsr-ub1664-121.ea.freescale.net>
References: <20221230130025.240776-1-u.kleine-koenig@pengutronix.de>
 <20221230130025.240776-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221230130025.240776-2-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: AM0PR02CA0220.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::27) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3902:EE_|DB8PR04MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd8aac4-ffbc-4d62-2553-08daf3190098
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cKjMIBV6TFMR+N+ULIcg9Warzgm3qZiCDpr+aJyhtp9LMkM26rqwJ7epnF/5/6r8VYzVU1xXNw3uygUGR/V/TJ53hSEYdckSUlvvNMB+o5yJ1hOAGOLEKrvMN72mO4qgcgpTsy7lXo+Qjwdui50SAYsQGPqFlKXnn6+xRkoKs3MmWEfPF+0Mxrg2GTghMF9fQbFnk6oHS8n3wVe2kCGeW5nSl6fnKtDgl93PkqN12xFp2f7YGpWZGVsdfk1waUrZlG3/MmQeLtV/2IGw7ojzRaYf2HjekMZFMegsgb2DI92aM1Mh+/b8m+n9IeWqjjkBOd/2InfNlDzZzseXmQ4MBuY5+fSmSJ7d5gLFOPiVMiBIYWMwE0wGG8ehWVBRt3b2sf2v4tH9tOfSzcKzimHACTdphs9HNtyhCuyjXRGiYLz8mC2Qo2B5yjOTttOvjRuZAD6c4hmlxJaie/Nfge4d+JYMTjn1UOc1K5VKwram2lcO8cQtii3Vn1vx6WmnwZM6CceWZG2z9RKW3LxUdyaJ7lz+PYwDtlKEAVP1NYkeuU4p1rz8AM0jHAPGB+sq1DoGF0SYwazCpLZ9AFGI4ErjpPKPkYKXfpxxtr529Yt8e3H2YcCGXbI6X4WylmwZm+wxTbe0Vm8VY3G+22WCs9V82g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199015)(186003)(26005)(8936002)(6512007)(6506007)(1076003)(9686003)(66946007)(5660300002)(6916009)(66476007)(66556008)(316002)(4326008)(86362001)(38100700002)(478600001)(6486002)(54906003)(41300700001)(8676002)(83380400001)(44832011)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?93WjiF3VJFSOPcrOAllqIfJsUwQMVrT8j4kf+EoYtq4jhoexYwu4DI5la4?=
 =?iso-8859-1?Q?D9PB9fdSrLVvMtwa/q7bPkx3aHrtTvghZDiawVkJmH21qhiHGCsE5NLrF2?=
 =?iso-8859-1?Q?sWXw5AhpsZHb7ncXQXc6FUZ1OW1jCnZcp0vDjajioxpz7z5hNipeDfU+XK?=
 =?iso-8859-1?Q?c1mJ8WvB0ruSYyx5749/pC5vQWlnofPZ4aLL3bE3yF5x8a9D4S9WB2gj0k?=
 =?iso-8859-1?Q?SF1AyVd9nTYH0PGzz69+RJi/feZ7zco0O1Z3a97UWIj3yDyZjdcDvE8NDE?=
 =?iso-8859-1?Q?73CnEMl0vXV0roaxErrmKOTnF8uY17i78YAqGiPXDdrOolgORSV47ZgJEr?=
 =?iso-8859-1?Q?3BatK3BrtywqTuSRlsJeqq209WbGe9WecmFtPHbm4fljnovg/stFA0eIcP?=
 =?iso-8859-1?Q?19qbyGbvyMI7OkPetX9GRuo/7Blj+4bUeR+9QSgoPgi3wYthBx3C5906CT?=
 =?iso-8859-1?Q?IH6zMff92u/9oVbpmP1Thungxkouvfh2hev/LSDOPNghtDibVncINEFHKL?=
 =?iso-8859-1?Q?plRlmM/EmX8N+WFYpNMZRGsTiQ+6Ez4XYEJV/R+Mtwc3PGe5+PYzqT11oq?=
 =?iso-8859-1?Q?NFGXTh7bVrcTBlNEqN7dqD/uMfsOniQnEw+cn4fmtl5eANmw0gOwE4vV/Z?=
 =?iso-8859-1?Q?wh2gGSeDRdvOL1RLbbsnGFT7kIpXT19w7ne8SrvdBfPmuT/HOCMzMXGKrp?=
 =?iso-8859-1?Q?ja+UQdZ4sKb3kIIyI1AS1V5YpNuSq9oRSjHmegsjnr7Of9QmrBHFkYR31c?=
 =?iso-8859-1?Q?fHj9C2hkdJHsrRdYAzuau33F8My6dqjOpIHkSMQxeXgoZ+WRlveZ8iif+v?=
 =?iso-8859-1?Q?vNBMDA9XjmT/2nT7SgxJjGmyB0xXilGWQ2ai20W+MRKnicawhmHrf1xutE?=
 =?iso-8859-1?Q?uajNSEowSNYPMn4JZJFLkOO1yzb8aMnJuV08oJfUvS8WoCZ4QYciihk6Sp?=
 =?iso-8859-1?Q?jIwCjshESWmUiMkmBDspkHgH5HthjahTl6VTAhq+OvM/t90sWHbNZhMFbf?=
 =?iso-8859-1?Q?uDEA3mUgraTNLaTgHUXzVfQcycU0k742nOj9sISQjuv33zJw5/H8EbgA8W?=
 =?iso-8859-1?Q?ipJUMbehlHfSUZYYhRRyPG5EWmxAGHVRS0lj6RN184liCY8ShTLRo7H4TR?=
 =?iso-8859-1?Q?CuJNl3/HUE4wF4zO+3FSJBi04V45OjrBeLCHDvEYI1WCbfQCOUY09Zc1Po?=
 =?iso-8859-1?Q?7BEH283ZJJbmCiQlqaiZ210yADv1x3TgOpMXMXe8yx5fIVutotlcHtnx15?=
 =?iso-8859-1?Q?GKVZI0oUJSjt15oOd6B3Hdpi8tam76kk/it2o8jq7h7B++MQee4gYcxDEA?=
 =?iso-8859-1?Q?chtzSkcH0EE79OgqiZN7eLfgxMJPtVse3KKDzjwipFB9GIAoZy3iBnZFRG?=
 =?iso-8859-1?Q?U/Pi6Pq+Hh91YJAhHUkGOazVdcyxfTHhXFyi30hZI5mGoG374km7L4odIb?=
 =?iso-8859-1?Q?AQW2UiQ3eZ9T2y1+3PN1zcY5LvQxvrFVDLkOiU6JKhNJM/O3cxmV5y5L/U?=
 =?iso-8859-1?Q?xvRG5EOhdjTHfKdLZQU2l8vKz2AkaBD1Zth95CsArp3mBtFhFrl3xcvNV9?=
 =?iso-8859-1?Q?5nK2ZBVKS+t46VBp5WiYhS0InZCIiBMvhwgVPlpaTDYKSFrnTxwokkvuS5?=
 =?iso-8859-1?Q?4haxBOaUD32HMYBmtntQ27f30JZFUBwtYjyYmBuh63l5nOmhgTucE62A?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd8aac4-ffbc-4d62-2553-08daf3190098
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 14:43:13.7299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1QhZsOJhqTO6/v7vWMA61Y/5EbpBPxHpIps2A4ljxac67K2jrDyHO+lSTKMH5iHVFSQFHd9dumnuA0RQZ6oug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7148
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

On Fri, Dec 30, 2022 at 02:00:25PM +0100, Uwe Kleine-König wrote:
> The driver core takes care about removing driver data, so this can be
> dropped from the driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Pushed to drm-misc-next.

Thanks,
laurentiu

> ---
>  drivers/gpu/drm/imx/dcss/dcss-drv.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> index 5c88eecf2ce0..3d5402193a11 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> @@ -74,8 +74,6 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
>  dcss_shutoff:
>  	dcss_dev_destroy(mdrv->dcss);
>  
> -	dev_set_drvdata(dev, NULL);
> -
>  err:
>  	kfree(mdrv);
>  	return err;
> @@ -88,8 +86,6 @@ static int dcss_drv_platform_remove(struct platform_device *pdev)
>  	dcss_kms_detach(mdrv->kms);
>  	dcss_dev_destroy(mdrv->dcss);
>  
> -	dev_set_drvdata(&pdev->dev, NULL);
> -
>  	kfree(mdrv);
>  
>  	return 0;
> -- 
> 2.38.1
> 
