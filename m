Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53EAA6C0FC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 18:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBB110E198;
	Fri, 21 Mar 2025 17:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OgnspWY8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558C810E167
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 15:58:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHoNfL8MfdYxWEbTr5Ol1WKkPgPmU5z0xMahw/nnz1TenEhVg3Jee6OU6rTnUkNKrFwPm70CVe4NmPq7WTYwi663z90NjfptIFmrO0dfSGmSgjWOD0Sgqu+ydNuHe2M5ksSPoMpdaVZapGTVab9UOd5GiLTa2/OQPSuVu89hk5NWYt3eMVO80/JTdzz2J/PYBxhYQyp1FDuuysWc2pFQzrK1TrZZtQrtQ+0ow0iDrM8yvlqCbBi362KtBFvbrPz6BDPVNVVEbMF1YwnN/y8JVKA1YhMvebZypKK8el5TvOwHT9EMwPminu7U9VZwWPC8/WKev9pdmJV3Xfddn27Pnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7un8zxAHgcWjno4YCM37F+HDnA1buGZiFJqdoadzdU=;
 b=T4yCmlzBhQVqvaUkyAP9f3KNYrQzTQQrFgNVrVwtBtlGjNxuEPM75rKQqcBEyte/d8n6PRSq36erDngnDbuOqlgucEChKgYSXxSoAKw4eDk4+xBz/omLVhmGjpOcbg8Si6DDGSXnWIlSmOHBXdJXQBZbkyDufYMRaIRMqX2R0r2adHUlKSf5wptWJxdMTP/8dX+/EPeGNsBGwD/3hfFjyRETYgk2GUDlEBZV6/FJ24QZrNGZJIm0kcF5ydEnSHsp6uISuGeIdH+2P5A+5jsxjNKtvT566cS3A3fmffrnhmEuCkg2UFXs1Tfc4jBe2DRs/MtdQAmduAGAJfTzOH3MIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7un8zxAHgcWjno4YCM37F+HDnA1buGZiFJqdoadzdU=;
 b=OgnspWY8kfeorC46H0+ck6O9he6dJj+lZjs6U7OSZFzoz5nSd3ahP1PLMR7Nm2J0rGZOiZVky/n8U3exaF8FhzQNdJ0SP2I+qABR9dZCk7QXu2+MkYF57+9CXnMxM/pKZVBK15KNnZwrVcYJGRrqtAJQdSDOeZvxB1c+qJ2Ozyc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB7972.jpnprd01.prod.outlook.com (2603:1096:604:1be::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 15:58:00 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 15:58:00 +0000
Date: Fri, 21 Mar 2025 16:57:47 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Support dmabuf import
Message-ID: <Z92Mez77lkypuOeo@tom-desktop>
References: <20250321104615.31809-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321104615.31809-1-laurent.pinchart+renesas@ideasonboard.com>
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbbea0a-af57-4bb9-27a4-08dd68912778
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|1800799024|376014|7053199007|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ROKvjouKMXb1GejXo1hMZujKp+BrAMvuGajbDKTY9UW5QmV7/zp64L1AYNw0?=
 =?us-ascii?Q?PxV6xoxvhI5mIh3jTVYuzBAepDtcpMmA4o0Y8b5j2WgD/HgAAMF58jOH3Wy+?=
 =?us-ascii?Q?xNuhtMsaHnNHjVpYE53PoCoD01opWCQLZPd7CYJHoH7/KOpxqb6vIav93f4U?=
 =?us-ascii?Q?GJaYvYHLBJXECOl6eQDXs9jbPnIobJUmhlUL29Cf4opjr1qsCsmwgaHLUTyJ?=
 =?us-ascii?Q?H4YfSgK/d8SIVDD7sfGS4xLbJ+NuEzgn3sF81QLmkdpqwKGPSnBQygb0c6Xu?=
 =?us-ascii?Q?G0xmMq5OZEtsIrwr8KnpfArsskvaAasu7GhJLhUdGfvAGyxecASRQWxeVzFs?=
 =?us-ascii?Q?gW2t/E6UJf/of4qqbWFNSqSK3XGqN6dXbtH6cYEno8yHVl0YJDg6zam9PvHl?=
 =?us-ascii?Q?edLUWT5l+v1jzTM1FVgV+0Ti+fPzDNpYRyg7OBzEw4ODf7pl7ZeibQyU4YKw?=
 =?us-ascii?Q?MiYWUuw8WKwltv2TXS+q1xvs4lPgTQEAmIMlzq+qJcJ7tP4hmr4kEZjMUsTM?=
 =?us-ascii?Q?4SBnMjSZwLosCSm4gH629a61FQ9pWpDv7wyu+1MotvOB1+lHmzIcrn1Tcj1q?=
 =?us-ascii?Q?K7Ggsqx8bP3/YwfNYPZxR4Cz+dnKyg4MzpNAC0h/FbDKooK0A/tMamBxKsIp?=
 =?us-ascii?Q?8EkrtFQo7DEqtvZx3YBwB5KRR2TxOmz7GfbDsBAQk45gjF1U6yNrKXWh5m9L?=
 =?us-ascii?Q?fFz9igC497nLmfNMH0NKYmpIDDh4o3MGcMnWUAx69jktPckxjXdg4eJj8VQQ?=
 =?us-ascii?Q?CvOccI1O5xGdPzEr38vbHT07fmelIzAG82Xt6YtW7fzpnjDldORPZ3MFXk25?=
 =?us-ascii?Q?8vUKrR3TJ78i7hq6GVj8ldGmuMoktGK4f6uSwmjHtHIc3VkRvvDIjmnFXtpf?=
 =?us-ascii?Q?5jYZojIXJzdi0tN0Hm0jKE27pB1YAOUX/45ZQtabdu8XvLKdZ+yOQ5dpQTo4?=
 =?us-ascii?Q?5kg8uOhgh4QFehWby/I+E1+ADhKNcj8qTrMSzWhLY2dW+g1/fkG4Wa4lRbOx?=
 =?us-ascii?Q?mO2o6MKNY22YAJFr2/ijloxeKAKIKA4W2yX6C3qSCBls4h9qgTA+0cFQ8V1H?=
 =?us-ascii?Q?1TvgLaMqy/Lh7JLeCPQtVoxlDOHTuP0InDtB9RP/RkxePg/MD8+Ilt6eakC9?=
 =?us-ascii?Q?BuA6kYYH0n6ymvQ3FCihXdfWKPU9JqCl+IvUi3zq3LWlLz+tKll3mm0oKkLT?=
 =?us-ascii?Q?is5yinU2PmFiw2AP83iNPXDDqzKrLtnzAmD2uW7ZrCdz0vonrveYuVQRzbdr?=
 =?us-ascii?Q?Md7mCLxCFGTKqGQs0o0uzznFOuKMwQgz7AfKvar3pHwQSuI22BhTgE7VfCgB?=
 =?us-ascii?Q?W3S967kbtr6Jgf8nfMW7PZn9C/SuAfVOr+gTKe8Hr8aFUzT3nES0bw3Oa4Yw?=
 =?us-ascii?Q?Spg3U80TpC4pgbdlalzeYGO1yF0asYHbdsDQdDt1xrJ+6Hwx9+VM2qz7zreB?=
 =?us-ascii?Q?4SzH7bcURUbIapuJnUi+q4dGM/lXSi3p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(1800799024)(376014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Z7qDP/4Kt/eS2EFGdNZeoE8zySda5H62qEoTNynEfMKju/9FXu3418g0HJG?=
 =?us-ascii?Q?Ki6lVWEClFbpwEobcXeMMjLI2ZnppVBQyRckAHqa+tvTAZgCpbsF6hVL8k8p?=
 =?us-ascii?Q?c2d8kfyYfgzLZ731684UXhpKDlWeQjayW/InbFMl2E4lFU1UH5RkB5wD0GEJ?=
 =?us-ascii?Q?jnisLgEq7q4ddZ3qFEaeTX0rUAPTAXmkOqU5J7WLxfgUQBlkGgFLPxn8kJlp?=
 =?us-ascii?Q?+veK8PyiMSCdXG+FE3ws37CxAH4o7JXCepJYz5q7S8XLOTve1CRumsd+v639?=
 =?us-ascii?Q?4BvcqJJSTCRhJRJ6KfwqaJvuM2rSuKz8gq8UFBJseD15tXf2uMPfLAa4c6L8?=
 =?us-ascii?Q?i6jter5OJbrUEWgB/Sy28a24TnGt0QMF/NnpxmAwKEhtHtMZjBCXIKQT0HqQ?=
 =?us-ascii?Q?X9qkkW40oXMtvVahY7aln6Wgtm5YlecZeHX9vyiNOlmDNMRw5ZjhhkCMuIz6?=
 =?us-ascii?Q?xUG3LbpdlcNVUAZt1II+6RQrXyLBRjEkZVyqhM2M6PNrCWSz//ZgF5U9AL1+?=
 =?us-ascii?Q?uy2R5UPn42rGiYZTxmxm7pkUawo5hU/I1yQQJAvuBm8kwTdFsSWLQhbESCmZ?=
 =?us-ascii?Q?HIACAVas3Lfmh3U/VaXrGprOnXKN+p8xB9sok9Itvm9zA5EhO89nFYAm/blz?=
 =?us-ascii?Q?Y5zNgV77nOCF0CUj2D/5v5ooOfVJMVnPTely03b0NMjhpmuoE1YUvnGeso5R?=
 =?us-ascii?Q?bI5nSEbvRuPzwQeVB56LY24SPvQCyOwr+uqVhlREDDfhrmV50QnosX6Rqiax?=
 =?us-ascii?Q?uYngTg22nTfeqIdtkZuTeqkNMDIqS4T/nYJwCRGYIJsaqYuLzKa5tqMIgQIf?=
 =?us-ascii?Q?+mdM9fl5MtvyAbgw2Vt1Wuw2AOwaoCtInngD2sboPqYyWcXbhc138CW1fEym?=
 =?us-ascii?Q?d5P5uscJM6Sc9IXDGEHeEpU9XGDBtNneA4HUqlE2J15gza4qwo2TcdjhWmBj?=
 =?us-ascii?Q?qZcQnPddxR90eJ6XcyWRimH51fXbnAO8210VhXjM+S+cBo4m8Ym4Hvy5QCb7?=
 =?us-ascii?Q?Jr6nIX9YRSr7JoEx1EA8DWdqg5WxdVrT6/4LxQ7GPq6VfSC+X1qJsqj59AXp?=
 =?us-ascii?Q?ZlCtuOhIp7OEBSmBdLGdIKt4SbyLVpbls3MZJkJe0jidO/21I5yHof3RRfGb?=
 =?us-ascii?Q?3+9jlZpIFdyEvNo6RWnuV5/7TT9QdFS7554ccLMmdth9n9P7+YNBfNmyyFrc?=
 =?us-ascii?Q?xR2BLoAvp/h9DB6HPZ/j9C/JBPY6OV0OYoCpOw7v2FlX+kVyXJrAnTw38+Y7?=
 =?us-ascii?Q?0KRRNRvKowkUq9CnYqIhxdwdj2hb8+aF+WCLqdqbbRbpQZ1lthZn4OJzpNYr?=
 =?us-ascii?Q?SwrubClm1SU9FjI4L8V3HoG+RqVEq+7y2gLabywo3fznxZdVz5wakFHW8ksI?=
 =?us-ascii?Q?0nb8boXaDUkUcjpD2FkGE+W+3kR+oxY/X9BHwW26cpWvRCvtcsoTotqxUHzD?=
 =?us-ascii?Q?CA7rRukqAsJurAyB/9tgNnHoiphZgQHH6i0u6eNeJyR8NaGFiTll/mkPHbjL?=
 =?us-ascii?Q?SZYT7fNHATifaJnuIWgifXlIKpPWEZF1dtRC/N9uJ++tg68K+UUef1eZvj04?=
 =?us-ascii?Q?3Qex8I9W5F04J6wtsoIf/oaFcXLQp8qCPaiFJGWCwo2I4lic0DI+4TQjGmJA?=
 =?us-ascii?Q?PNMdHhpM9M/z9Kjjpdfc6O4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbbea0a-af57-4bb9-27a4-08dd68912778
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 15:58:00.1818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fz1TgsXC62OIK7f1At4T7K+1Pme2/KmbOdI7QMQ51SIIhLMet15tjkfk4brEqGRsPVzFD9iab0MEYmQdeMfj/xKRNcJLu5+zbBgXa4cH9htKoGaKz87p7my3AjSb/jYm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7972
X-Mailman-Approved-At: Fri, 21 Mar 2025 17:12:40 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,
Thanks for your patch!

On Fri, Mar 21, 2025 at 12:46:15PM +0200, Laurent Pinchart wrote:
> The rz-du driver uses GEM DMA helpers, but does not implement the
> drm_driver .gem_prime_import_sg_table operation. This  prevents
> importing dmabufs. Fix it by implementing the missing operation using
> the DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE() helper macro.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I've tested this patch on RZ/G3E DSI.
I can see performance increment.
Thanks!

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> ---
> Kieran, would you be able to test this ?
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> index cbd9b9841267..5e40f0c1e7b0 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -79,7 +79,7 @@ DEFINE_DRM_GEM_DMA_FOPS(rzg2l_du_fops);
>  
>  static const struct drm_driver rzg2l_du_driver = {
>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> -	.dumb_create		= rzg2l_du_dumb_create,
> +	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(rzg2l_du_dumb_create),
>  	DRM_FBDEV_DMA_DRIVER_OPS,
>  	.fops			= &rzg2l_du_fops,
>  	.name			= "rzg2l-du",
> 
> base-commit: 9e75b6ef407fee5d4ed8021cd7ddd9d6a8f7b0e8
> -- 
> Regards,
> 
> Laurent Pinchart
> 

Thanks & Regards,
Tommaso

