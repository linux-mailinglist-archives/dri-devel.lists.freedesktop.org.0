Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC46677B23
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 13:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EECA10E48B;
	Mon, 23 Jan 2023 12:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2098.outbound.protection.outlook.com [40.107.20.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD6610E48B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:38:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NK1OLpuaP2DD3xmm2aqbU8XA5Mke6Zs0cDpvA8PVYt9CzZTTnP8o2rJMS3cZzX0S/PCJr4J980sIMhw2IgBKkQvYqj9ecvnd3hZxX7C5zD2SiyYpLiGbz54sVJUDFX1/Z+moMTyWpN+xhsgQV/AZJp9c29NXmIatUvP0b6Ae9ufWXieCnyYNpaZ2OcGUDsgkPWI75RhUJeNm7q+cXOXikasYFpkkBV9Xm+z75lgIdu3ggYuGqoisrR5qaEx656je959KrbfN24sz+KHKAZAQDUR5QTY5+7hoQ+DSEftd4da8f0qlX+ids1GDbWpRKlqAlLm/b92/63NjWDzJXIPTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2af4X9XJOAmesoNenOfGSHIcBjV+We9972vlfMLShA=;
 b=Xo9zLexHrZHMnCSDU4aYOOduZWYchMe/FIBmQdu7KXB+ASY7HGGjPrhQybmC/1c8AjsWNPeOtIGDmmxGsv6pt60OV83Iu1PAQ0gqY76TUzjvALUwE/zBSzzXnLpxB06z4aP5G873zUMY6opT80n3DES7bU0dcoZkgqY4/VXNOpIInzTiwNUpg8/vpE4q4DtZajTQvH0Nr6AKAXUCJAvriy4bK+lQPpZSw/AOrX5NE05Rn5jU5tfsR8qcmgn3VBgyXfT4tvy5Lk3H59ohgpVpsS7qyFFwj5MdSTawumGf4ik6xOgIUwigVzOUQGYMbhowK0Cn8d3H6rrcdNfBWz1P6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2af4X9XJOAmesoNenOfGSHIcBjV+We9972vlfMLShA=;
 b=hqXGFeoGZk3D09FrSWCCJ/Y7X0b2Ae9DkD2BV5BQGh3VHemH5uPgOh4Yv0LODq/oedWO6LtS5JpaX/xI221pe2FdjhomAX66v3WhtVupvtnpW6ykDo2o+5ExgvrWCs2dSdu44OwVjF1CN7+QuylnkJ3ityCB5vmOXHpJuOvRmwA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by GV1PR10MB6395.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:87::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Mon, 23 Jan
 2023 12:38:37 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863%8]) with mapi id 15.20.6002.026; Mon, 23 Jan 2023
 12:38:37 +0000
Message-ID: <7d3d2ff3-961f-55e8-e36a-68a7304bd205@kontron.de>
Date: Mon, 23 Jan 2023 13:38:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v11 17/18] dt-bindings: display: exynos: dsim: Add NXP
 i.MX8M Plus support
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Fancy Fang <chen.fang@nxp.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
 <20230123122319.261341-18-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230123122319.261341-18-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0087.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::20) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|GV1PR10MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bfe35e8-9cbb-4d57-262d-08dafd3ebf91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H8+tVmrIR9vik9MFPJvU4JPyP2ZHw57HSUVzJ74XgMdAOOi45q6Fc2NSPh4XBwby09IuQ3nZYjgw8hQ+yY3y5HD0z84izpPUe9KHHeBn+0rGRth7nNVnnbc9nbTbZagc2AunKOWA7rG+7XYfLJqd4KrjV4ufkryc5R/G9C3cRcigLm2294gQ4lZwz7/8aVrziCedeuBkxRUvf8L7wO001dLDAvY/86vHfBvv5P49dETrPpZDDce9m7/7tBB8V3Huu6Q8cjK/s3Ez4XGhCwXXy3q37zQHwJ+D5Y6FTKdnQ8qCndtyBGAt5in7URSV7X1wbCxiPGjBYzRg5sz/ak9+bNpqG/YecjVlt+Mq+yFhYT4M1op+jpqWGvyx0RoX/Zsg0sl8OngP2HTt1w0myj4+5+DMSe097vkyeDni/3nt4f1GJAdyylm60tG9yZSSHdtvNTqD1XmigkHFvK7yIJdkJeIz/4Qo4PoI7kxY2wDxRkrtAw7xcdvX1vtj1du9YuRywd/kDNFDK6tZpmRWtxw+FMCcvsWMBaMmpeZb+mjGDHf7K+Xl2ErkgbYjz73MdoWuiN8ZcuePKSTnqBsZKn9jS188pGCI+uqOv4EaHoZEUZGSMH5tCL+f11NHEO6jQGuR7Exw3+spYVOrfAMrbuKAYbGiggcosNvlv9DpY27jJ3RkMNSrOWbCd82WzWdC1qAvB4w96bUS2iDKPu27tlNFVsF4RDsdnENUCLscWRnnAgVmsVNNNTaSApPO2wLYzObm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(5660300002)(7416002)(66946007)(6486002)(31696002)(66556008)(66476007)(478600001)(44832011)(8936002)(4326008)(8676002)(54906003)(110136005)(2616005)(316002)(86362001)(83380400001)(36756003)(41300700001)(31686004)(26005)(921005)(38100700002)(2906002)(6512007)(186003)(53546011)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU9valZ4MTZxaGxXcUw4WHNSK0MzSDQ0VmxrUFFHaHNXZ09BcTdFQnJ2R1RB?=
 =?utf-8?B?K3ZQY2NId2xFbSthbHZjQ1V2WnN0OGxEZ281ZVhpMUdJOXV3RlZQUnk5Z24r?=
 =?utf-8?B?eFk2VGFYYWdHQkRacEgwdmIwN0ltNGx3bXNuc2pLMHBFWXhRZjd0enNrV1NT?=
 =?utf-8?B?WWg5YUNxN0pKYndnbmxJNVI4OEY0bWIvT3dGQ3JEMll5ZC9Oek1Pek5scjYz?=
 =?utf-8?B?RTB5TjNqYlpOdG10dEY5ZU8yQVFQWFF0aHQ2Q1VNeU1wLzl1b1VhR0REQWNa?=
 =?utf-8?B?MzJxSnNmb2NxNUdOcDZqOUw5SXBNR2NONkFrUGpQNXZoODBqTTRXWnl1ZDRr?=
 =?utf-8?B?KzVRVGV6cGsvZnhVTTd3ZlhkY09qWXhYN3BFcGVuc0xhaThQT0ZGaktKYzBO?=
 =?utf-8?B?QmxUWldjREdTd0VqZEQ3eWtzV0paSHdSa1UwRU9lZElaSnZIb2J6dWFlZEFW?=
 =?utf-8?B?Qi9KV0dqNmVVL1FnUWUzM3NJdENQVW5qck1TMldYZTdZTUgwU2JycXVCanFP?=
 =?utf-8?B?YjhoSURNVDBxVjFZUGoyUXVWS0E3ZTQ2Z1dYaEJ4b1ErbTNyOWtrYUdiQnBZ?=
 =?utf-8?B?NHFKbWVIVTFBdmVVYUpreXpFaER5U2NtSTZLQmd2cGVhRHYxTVNWK1NBREpQ?=
 =?utf-8?B?bWI2N0VwQ293UnRXeUxFNWZpajFOc0JPVUNHempqb1I4cGVYLzBFU1h2ejlN?=
 =?utf-8?B?VlpSQlNROVBtd2xZZEpCMG9ZK21kaTVLTC9neEhFbnlZcFRFKzcwck43RHRH?=
 =?utf-8?B?TW94M3JFVThQRldvTzNsWVBlN1N0QXRWZEtjZlUrc3dDdVNSQmtwaUdOdyth?=
 =?utf-8?B?bGR1cUh0c2FPcjZBaUZ1UkxRcnMzN0duOGo0RGcwbFdjT3ltdmc1Z3o1UmVJ?=
 =?utf-8?B?VjN2cE13dU9DWkMwM3JVeC9VRG5aQ3htV3UrV0FtaFFnTk5jR0MwRXNpMnpP?=
 =?utf-8?B?RVdXMDdvcVgwYUN1cVdrRTZHYXdaU1paMWw5SHRjN2s1VlZJTmZaZUlRQnNK?=
 =?utf-8?B?R3BudkdQUFBQbEsyTWJmWGVaVWFCQndpazZSUGNNSHpoWFJyajJFR1g2VWtU?=
 =?utf-8?B?NGR6UHNjbEYzeWlaK1hCM21zM1ZJTlpKeTF2eFJ1UWwzaUlJVjVuS2x5V1BQ?=
 =?utf-8?B?b1BpK3FRZFgxR3FaVkowN0w3RWNoQmc4NG9YQW1XMGpJb3RnNU9nOG9zZHps?=
 =?utf-8?B?SFJIc0ZldlJaaFRuRUtETE9QcisrUGNrSE5YRS9iWktSbHJBdjlZaFJyTGVm?=
 =?utf-8?B?Qms2dGM5dW8ycVN3bmNMQUtMY2srV1g4SEFzdWt6R0p4cnRFM1M3T3hhejhN?=
 =?utf-8?B?eFZ0Vk8wYk95M1YxK1NjMm94SUtPTGJNU1dtQWRGb3pzVGE2M2xkdVpyREUr?=
 =?utf-8?B?WUh6TmhHRk5XZFluSkRlN0ZMcFpJQlI0Nm0rUGExVXlNZHIwR2V3amRrT2Yx?=
 =?utf-8?B?NVJnQ1QwU1A4MVR5bDRJT1lpUnE2VmQ2a0VUc2dFdVJKdnAyU1lNM0MrVjhn?=
 =?utf-8?B?a1F0RGFrQ3Q1QmpSbzNZY1JKV094aEh6dEZmZDdCakJyN0pxalpGOTZGNkE3?=
 =?utf-8?B?L2s1THZCMkI0Wkc2RWtpeHFkQitsamRMMm9DK3FmcU56NTk4MHM0N1NYUEVm?=
 =?utf-8?B?Q1NxeVhDYXRtRVVqMTB4MENNWVhnSTBuWHdWM1ArYmRCWm05cDZCZlBENzBD?=
 =?utf-8?B?Q0tPUHF4VWh3N0I4Z0ROYUNoM2xWZ2RzZThHK1pjcjFyMnRLQUtRdUlJU2lx?=
 =?utf-8?B?RlpaT25YTG9qMExNS2F4eS83OHR1d0tnUUU1VGxMUEMyK3NzcHk1RysvQzhY?=
 =?utf-8?B?cTNnczZQNzFjc0I1ZjNqdjRHTzNUVHdpMjRXQXhueTQ0cVljOHNsbWF2SXdB?=
 =?utf-8?B?RWZPSFZ1VVJNWUMvMlc0TUoyMENhYzdmbDJFa1dIMlIwTXVwTHJOMGZDZkx6?=
 =?utf-8?B?UUg2RkY3b1VyS1U5SnVGbEpsdzZnaHZJNk1QVHFWN01WaHJ4bkNOY0NEVE9m?=
 =?utf-8?B?K2JuRjVLczZuYXcwSDdlWCt1dXdVb3ZWbzJRZXpiT0J4S3VMQzNTeXp6cFM0?=
 =?utf-8?B?ZS8wZ0d1bTlHL0FGWTJGQ1B3YVIyZFV4aElTSXRhYWZBZE5lRktZWW9vUnA1?=
 =?utf-8?B?UzRtZ29uU08rYWxXTlFORFozemRQV1dIM3hSOGd0SXZBZUtOeXZGRmhKNnVy?=
 =?utf-8?B?d2c9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfe35e8-9cbb-4d57-262d-08dafd3ebf91
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 12:38:37.1512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbkeA8VWmhxghKPar3AIt1/aXJXzei1jVDq7bGZHDXEllls9RAxbXLr6YWDWyKlqesieFoSkEpU9eiWKVIXyWz5JuoTuzBHm2FNc0eZeLmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6395
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23.01.23 13:23, Jagan Teki wrote:
> Samsung MIPI DSIM bridge can also be found in i.MX8M Plus SoC.
> 
> Add dt-bingings for it.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v11:
> - collect ACK from Rob

Tag is missing

> Changes for v10, v9:
> - none
> 
>  Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> index 5133d4d39190..2a5f0889ec32 100644
> --- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> +++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> @@ -8,6 +8,7 @@ Required properties:
>  		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
>  		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
>  		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini/Nano SoCs */
> +		"fsl,imx8mp-mipi-dsim" /* for i.MX8M Plus SoCs */
>    - reg: physical base address and length of the registers set for the device
>    - interrupts: should contain DSI interrupt
>    - clocks: list of clock specifiers, must contain an entry for each required
