Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53D04C875C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 10:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A22E10E5BE;
	Tue,  1 Mar 2022 09:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40087.outbound.protection.outlook.com [40.107.4.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CED10E5C8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 09:07:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcgFXsG3B2xBNH9H/uKIFJ3s6g3GQTI3P8TD7kBQjXQrkmDnnKqt9t9NnJzCdNembHDfBT4INdmT8adyESOnXxxRG+L9avQ/geAIkOc0xH3uNeUZYSG5p1ICri75vvw+31w4CqL5h6jEfOiNsllgC61IIhKyyDsI0YBYzZJ3ae9t/OQD//PRIsnj66Na6ALpRawdrL56u1OFjtBbcW3UwOKFJbTqsnTtT7kxROqIp0CCQPLCniqbN0CECTGG/CztDzV8tLm86Z0IU9VqTqgQq1Ncec1SJiWPbv4Vqlaaqsnx6aFwSqvcVNiKASx0mh6qBZH6N4af6aYaVUu2pcdZFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=216MVLc9inij4J/WR/HXOP5RTry1N/LZevU2swycnXM=;
 b=hu4zhroPJatbA0aCIc0VnCxu2X318eVGEjVG9ZujWyfXIUNsEVdN+ANk8ciZIWqyw1SH8mnaJ/vwNzAWZTi9VTrh23GCvDgT134glY1d6kT0MndTVJna5PfQ/mDhwtLGrmc1jsY/Ehzrdou+vxqe3faHOF3sEJobK3jwbQjMN4zwT+u8e0VCnA1MNgrpICoB+MbnVJUdD4jQfHPeiL3M4DZtZ1xnf00PtiAJLC9I+jhJquhVPup3Sw/p3wWC+lXbATSyye6wQcYDr0+F/WLBTjHgru2yLV7DoNBA8OnSovz839r7d99B6egv1zNlJNAgsa2qG8hpdNk/rogeteA2Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=216MVLc9inij4J/WR/HXOP5RTry1N/LZevU2swycnXM=;
 b=MZla0GdRX37rZBpEfyuELZ1Q11nX856wBTSyJDfCdorOdqTaA2v0tTod3wOsL6bZtj2eFvDDR6aFjThSUdzIUDbUz00HdB/2DGIXFrD4ABPz71cTy6D9DE1yccssTBrvuGzF3HBr351/e0qescbOOXt2gGhqDt+3mSn/zAcMkH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
 by AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 09:07:06 +0000
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::2c87:5af4:1b63:d8ec]) by DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::2c87:5af4:1b63:d8ec%3]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 09:07:06 +0000
Message-ID: <e69997e327e7c259925efa43138a807277c520fd.camel@oss.nxp.com>
Subject: Re: [PATCH] drm/bridge: nwl-dsi: switch to devm_drm_of_get_bridge
From: Liu Ying <victor.liu@oss.nxp.com>
To: =?ISO-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>, 
 andrzej.hajda@intel.com
Date: Tue, 01 Mar 2022 17:07:08 +0800
In-Reply-To: <20220228182226.21888-1-jose.exposito89@gmail.com>
References: <20220228182226.21888-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:194::6) To DB8PR04MB7051.eurprd04.prod.outlook.com
 (2603:10a6:10:fd::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c0ed134-6bea-43a2-1cb7-08d9fb62dbbd
X-MS-TrafficTypeDiagnostic: AS8PR04MB8609:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB86093F57EECD1B5586B7655DD9029@AS8PR04MB8609.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vfYvO74NwSpmCKs1tugcEfpIB3uFgJ2kAOuMiQ21f6e7TzKjBpGU+kPulJBHBWIJ3NF30IGFFjicvtUUhbZE/G10/6LY8ClltaZ7i5LU6rERGw7uQQiUYUMa2+sPdX8By9tGkzLcM7I50oFxtg3q81UQGSStCMz6C0Q/dwclwWeLFoRc9xlc+xwfv3IjhRhIqijpKfbnr5h9N+Ufw3g7SybRHGFhlUPvYdmkd/5zKGdDaT3csOzhfK85bx01zIQyXRyURxbDu9J3Q9tiEgCs83OmU0jqwact8U1DPwvbARKYG7nMv5gAMbEtdbzHYVqGHNSWp7+1uVDu6LmuE50S6hCn71+JjQ1qR1LoRRkR84je4ryGRKi1uKWW/yImFMlQMdJnaxgeboyoxYsrH61U3pYu8j03dtHJdtVpVPOlQt/p9zWfoVRb4vF0L45D2NLXRiAPPdmDaFtdgbpoQq80n0EzZHM5zEa/j1dp8CdT43zcGJef6/Pd7WRA4LXH5PG6iZG0U+GLkSnS9WxsuyF7T5ZMQbflULD8WXFfY0OAYfRj6aFtDyGtZ2eLXamHiodJBfRGa2CNBx0/RM2tDcq3XOQh9CJoxp8PZv8LTnd9kYAOsP+cIZW5FVf1u3fOxN3PwzW8+cfvTvL3T0V0RWpVXKuvhodOP5XW14NqCOCnt9J3Ad9Nge52t8QlGJnNGpmyw3nwfv4mVXOxuYXcQBQOKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB7051.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(38350700002)(2906002)(26005)(8936002)(2616005)(66946007)(8676002)(66476007)(4326008)(66556008)(316002)(6486002)(83380400001)(5660300002)(38100700002)(52116002)(6512007)(7416002)(186003)(6506007)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0ZXcUJIM2hkOC9WUG5meHFQSUJqLzk3WElWSEg1VFhkYUNmRTVuK0JmWGdY?=
 =?utf-8?B?RTlUbkRkMWJRN3gvMUVtc3NucGtPRmJzS21pZTFDYlhMbWo1V0lKSXh6bWlR?=
 =?utf-8?B?emltdkFPOTltME1aNmIwczhGQ0lYcXJVTm0wb3B2UFRvUDBTZSsra2VoTzZm?=
 =?utf-8?B?a084d1VoWUJoNG81MXg2cDhSVFJHVE5hVmNRcEN2eURjOU5yaWlOc3NSRnpY?=
 =?utf-8?B?QUF5NXFFTHZoNFdOZkhHZGlJNUJIZlJVbDNJZGVvUzJhdWdncU5XUTliQ1Bh?=
 =?utf-8?B?Nit6a3VnenFPSGVpdnNlS3FXSDZwMkszdHA2NmFVYjRzSEQ2VncwWXhuWml0?=
 =?utf-8?B?Z21RbC9Wa1htckpYaXlNSCtJMmRGSm5pZU56S3k3NW93dFFhN280aEI2TFZG?=
 =?utf-8?B?U3NmaUgvOFg4VjNldkVHSzZDeVpiQ1BrMHdjbmczMzcvWDRRRkRTMTRFMUV2?=
 =?utf-8?B?KzJINUg4Y3c3RlVNM0lBQXFBNkJsRFlONTJxZG1ydGdnK1JySlk1WnZkbEQ3?=
 =?utf-8?B?akI4bW92eTZVY3QwcUxqZURkMFRid3dpaEhPVnJaVForeDV4b0hsMDlYZ3B6?=
 =?utf-8?B?Q3B2YUVRUWdhNVJnWDJuYWVraWthUGFKaDlzUlQ0QkVDWEtiWG9pd1R0cnhX?=
 =?utf-8?B?TWlnWkozVWhCdy9qRHhpWHRQY2NZMzBWYVJEdGM2VWtrRDU2VGZTNE5QSXR6?=
 =?utf-8?B?RUFLT2Q3N0EwK2tWd0NyeCtHWkptTHJiaW5ZUkJRdm12Yk9VS0xmWFJRckdp?=
 =?utf-8?B?dXdHVG00Sml0NkxHcHNSUUNVK1Vsd1huanJmVklVTkY4WlJRRzFxVkxGaHdi?=
 =?utf-8?B?T2I0bm00RHVOR1E0R2VNZ1BGZlQzSGdyQmZKWTZVQ29nT0I4bG8vdlZ4aGNl?=
 =?utf-8?B?cUtmZGpxOWV6MmM0Vm5FMFVBRUx5UGZucG8wVUJaQ3RpM29hd2NGQ1ZHeXZH?=
 =?utf-8?B?R3ZlbUFYSXJOcE01cFRVWHhSVC9PVjhlN2NBZ21nb0p0aTdlRmZ2TzMrMER1?=
 =?utf-8?B?Z21CbjRXbU1GUStvTE82Qkg0elRUeFdMQjlRSnRKSUxnb2pabXpxUTYwc0VK?=
 =?utf-8?B?bmc0cXZjMHMzeDczVkFqN3lacHcrQXhyU1ZKdTZRYVVsai81WkZqQTJUbFZE?=
 =?utf-8?B?SVlwNHdUVEZhVkVuV1EyZGVNcnpZZjNrYWY5azJ3MW5lNEExRDVCYkZqc0ZG?=
 =?utf-8?B?RWpYTmFWbkRlNU44Sk1lVkt3VTlBVC9aR3dqL25JUnZUaThBK2xDWllpby84?=
 =?utf-8?B?RlM1azVhNFJFUmk1NlpEejRHVkZsV1BmTER2Z2VHRURXdG9CZklpWk1XNEZz?=
 =?utf-8?B?blZHRHlYR1hPdlRkcWxHamQ5UjlPU2pWMEt2b0N6QUtYT0Nta09LK1ZacjJq?=
 =?utf-8?B?N2lmdW0zdnlURkZSMFdFa0tFb3hJOFBtNkNncU1LcG15NnR0VTlYRURmRGJE?=
 =?utf-8?B?ZWt2cU5pOTlGd2JRWVVjUjVTMmpQYmp4M0YvVlNqeUhrNVE5U1RqSWVBQm8x?=
 =?utf-8?B?MnJvaU4va1YvL21rMGJ0WUh0a2VhbXJ5bzhmWHhmbTlkTlhDZ3g5MndzaWhT?=
 =?utf-8?B?aE14bENsNUpLaEh2YVBhSE5Qbm1RWnRla0FqTnU4dHphM081UkJpSUtKQmpq?=
 =?utf-8?B?enFPdDRCZVZYSEhZZjBSaGxZOGNObXUwUEM3L0Qvb211WXF4RzNBVlFIZHJi?=
 =?utf-8?B?T2l6U0o5TTdYVE80OE5ibFBsZEl1R2VkQXZNVEZpU0t6M2ZHRDJQclRhM0lY?=
 =?utf-8?B?MGNxcmU2ckhQYW1iVG9JMmIxYkNvM3hzTGRFcHFtWTIwV2o1ZUFHUTNVZ2ZI?=
 =?utf-8?B?TmYwSVNLTUJjL0FCVjdQczVtQTV2Z0NhbEhrWXR2amYwbmp3TmZZTmpYQ1ov?=
 =?utf-8?B?L2FUSFZ4UEFCUHNVRVowQ0pGSEg2NDZpNTBIYjJpU0p1UGhrTkVMQy9hSkV4?=
 =?utf-8?B?OFRjSElWSTNrSnVBelZxWUZBMHMwbG9IUWt6QW54MEtBUElsdjdMSFE1Qkdv?=
 =?utf-8?B?RDVUVXBiVHV6UGNrYk5EUEQ3VnRVTTlqNDBUdWQwUEdKOGxBa1QrQlNMa3lP?=
 =?utf-8?B?Z24xRyt3U3IyMFl1OHplUkw2RWRmcWtyWGwxeWlLeDBUbHV6Y25Pd043anJU?=
 =?utf-8?B?SGtKSGVzZ0RYOFNzeGJCS3piaEs1MHgyaHJrMjBGWGhVeHdBR0M2aEY4R1Q2?=
 =?utf-8?Q?wgt10KQy2MbliOU1z5ruD4Q=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0ed134-6bea-43a2-1cb7-08d9fb62dbbd
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 09:07:06.6605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4Cnp+KJqgArNagBSK3i4DXb1YhSOZPvCkE/HZFE7VWu48AHahQl4Ua6WN1V+uy+5KfGZMqCfeipHaXNeW76lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8609
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
Cc: jernej.skrabec@gmail.com, maxime@cerno.tech, narmstrong@baylibre.com,
 airlied@linux.ie, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 2022-02-28 at 19:22 +0100, José Expósito wrote:
> The function "drm_of_find_panel_or_bridge" has been deprecated in
> favor of "devm_drm_of_get_bridge".
> 
> Switch to the new function and reduce boilerplate.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

This doesn't apply to the latest drm-misc-next due to conflict with
commit 7b1534188c25 ("drm: bridge: nwl-dsi: Drop panel_bridge from
nwl_dsi").

> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index af07eeb47ca0..df3be9dd24fb 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -909,19 +909,12 @@ static int nwl_dsi_bridge_attach(struct drm_bridge *bridge,
>  {
>  	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
>  	struct drm_bridge *panel_bridge;
> -	struct drm_panel *panel;
> -	int ret;
>  
> -	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
> -					  &panel_bridge);
> -	if (ret)
> -		return ret;
> +	panel_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
> +					      1, 0);
> +	if (IS_ERR(panel_bridge))
> +		return PTR_ERR(panel_bridge);

Now that panel_bridge is resource managed, why not remove
drm_of_panel_bridge_remove() and its caller nwl_dsi_bridge_detach()?

Regards,
Liu Ying

>  
> -	if (panel) {
> -		panel_bridge = drm_panel_bridge_add(panel);
> -		if (IS_ERR(panel_bridge))
> -			return PTR_ERR(panel_bridge);
> -	}
>  	dsi->panel_bridge = panel_bridge;
>  
>  	if (!dsi->panel_bridge)

