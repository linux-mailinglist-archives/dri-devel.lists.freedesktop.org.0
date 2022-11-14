Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341046277F8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 09:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3240F10E081;
	Mon, 14 Nov 2022 08:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2117.outbound.protection.outlook.com [40.107.21.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CB510E081
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 08:42:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yqz7HAbk3wYFDSmvmFFgCfT/k5/Lwt94ifBm7pVcnAmQHLWl6ZunBnybtPs3gG+IQmjE7dNq0WtaF79cfxxYVL3LniSPLRbLqF/NDnoOOZf3QJ0sGAj3nY3SWdtD5KUfZtmDS2nlD7VNRPNsYxRF9AaNhzeG6l+q7HkHXdgTa85Y9WyzjwfdqFyWjCC8/txQbzaan28tn31Jm/Oqtb0W6AB9OnlEeLyMChVAQmjJiI7dy2olBFU8r32LDFjUPEWzZIZwGkhVyv8YXF2j3kcOKdAWriLc6v7X7R+fnSEqmibI4LABdIEqGRCMrzlwHHGCZl7hbOE9Sr8Dedk9yGciUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgVeKHC/gI6LYrPDTckMM3d4ld7fkhuwXz4UW7CrfEw=;
 b=LrbWX0w+QXeUCZrYVAjUchnMVCe0giS/9sl0lt/AD6wDj/XdZUdpuZoBcoTgHTKAgFWuo7FuO3uccmb1neufoJHpNCv1nm6mV5I1Pra0k8UlRhrIkJK117pwKCkIddssO8a/h2G0fTWHPiHpRquULxIERy/LmAQbGnZxZAp271ygbUgOCSFk8mqGdQGtumTUkUzH9QW6cHBjjjWFWXhhLuiIjsWmOrrggk3TaHLUpz8Yh1THu12oxLIe2YWUonAA9nakKEfAt7PdOXO7EGX8a42cmp6CNch71lfgay2fA5Qcn8GcvzdHnYJbaXHquzEcT5uXQROiM37FhmIO/wdnfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgVeKHC/gI6LYrPDTckMM3d4ld7fkhuwXz4UW7CrfEw=;
 b=HGAdUNQgqoJMv+b93ac+Gu5LV0hH7nlecHjq3ZeG62V8DpRbHyRoPLMQFAI7UHlpSS+VPOT785E1znvJsDM+nCy2SSSzaklxGNOe/y5rVvcHGmN2H80ROYgCXUVPtvm73WY2TWoOrpYYQccjYoaAWgY201QW9OBzv+HGIy4sY5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS4PR10MB6134.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:585::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 08:41:58 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 08:41:58 +0000
Message-ID: <abfb3397-a0b4-ce31-3b49-172d8256bee1@kontron.de>
Date: Mon, 14 Nov 2022 09:41:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 00/14] drm: bridge: Add Samsung MIPI DSIM bridge
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
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221110183853.3678209-1-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0013.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::23) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS4PR10MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 55d7c0ab-5c1d-43a5-aa74-08dac61c17cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J8Eq8rNysgEjGv6J3k+4GISX1D4ul/y4LlBAUf/ETt4qRziR832VEnqJiUyPyN14J6OMymHY6I6+AhcWHH6OcUzDSmutuycm55OHwoI2TodXJACjpI4wbxIR0NamXkI9d4y9E88dGeDhAeoF50BwXCHKxNSfKtIDXm0Ka6dTYN99OWPpr3RcG1XcQeKVpaUt78JEdY6//skV6eTTOXn1OGgOW3T1QaZ/5AS3dfchqo2IyRjFHa+hd3CwMdMX+/PkrvxMoYbX50N9xUwxy9/n4sPwCg+OGm0C5xOHF6u5Mj03SjjEX8ktZ0mY703LSNQtnIcLWZfGAUF1vCGAV+Whi3GPtYmc6HceIyQI825JpIR2gy81glMDpYIsuXh8p20iubkQTA097cMPke7CHxEE557Yak/rGLAtqkVP/3YBSZQ7RGr1zfaTAHQyfrJWyXp5dkarq4uqTODMi+8qAH+NbTSZP8cbC7Jzkgaxo1IfSWvnjIpZ1Vyrl34mLuzBIaGjHFtTOakdZVG6rPSNOhSghfM61tBLIIr1wd6rSR1In3hEeAZ1DTWFc7X+Y+/JTydIgpbG8ycOMgnVhEpmbKs5YxLuEkHSoXGARC4zR0tHtquR/P6wWY8rHBYMq11P7ALoYVjY0YKJsFDDI571z1oCEq+gctxDRgFzL4qlE8MpNXAD/fiB/Xe5GI+Z4aJgIGJ1Lf7l5xUbJfV8UfVBBRlobs2vEr98m8XSWDCiNjIcr5eqS+uETCf36kszIhIu+bcl/CI8ljjVgvnbeaEW16bDroPq0E2/bGDZ+ChGzS5DJyfLomsJbrMIAY9IugAh6YIA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199015)(186003)(44832011)(83380400001)(66556008)(36756003)(66946007)(2906002)(66476007)(110136005)(54906003)(8676002)(2616005)(6486002)(4326008)(316002)(26005)(6512007)(8936002)(921005)(7416002)(38100700002)(5660300002)(4744005)(86362001)(6506007)(53546011)(31696002)(31686004)(41300700001)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXMxOFo1RDV3TE9kVWUvOXRNelAvRkR2SEpVSm9TWGRxMmdOTDBra0VxUGpZ?=
 =?utf-8?B?TjNNUEFwaVlLSUdodWdCNFNyeGVGRW92d2NibFJENTZkTGlYbEtJalB5a1Fo?=
 =?utf-8?B?OGlESEpRbVJDMTM1dWh1MUswVU5qV25BVEROWTA1SzBsUDZFYXZaNm93aHZQ?=
 =?utf-8?B?VFBkdy9HdmNUNTF0UUs4MERyRVpHNUN0STJQQjRCd1hhZVBiZjcwNWYxSk41?=
 =?utf-8?B?cXFtNVZzakRnS1E3ZTUrdkNDQnNncUlXblcrSlljSFVOTWhsbVQ0ZEtLS01n?=
 =?utf-8?B?NmJGMXVUWllZOGgzczJnK2d0K0VGcE9NSTY4dnFaeWRDY2ZUUlpJMXk1UEdG?=
 =?utf-8?B?S2hqUHV2dDEzQnZUMnlINlJ0N3hCeTVXSCtnK3V5UjY2d3plR3NIY3k0UUFZ?=
 =?utf-8?B?bjU1cS9tTTRaMHJJaEp0NWQ0SW1rbTdRdXczcFBieDRhVmx1SW45QXNsYnNk?=
 =?utf-8?B?NFlnTDdkRU55dGRSWDFYaUhjeGhsenA3bjJDL0x2Yzh3OHJ5OEFtdEF2a2dI?=
 =?utf-8?B?Qm5DTzl1elJKODFETkZ1c21FMmhzV0RCK2VNYTNtWlZUOGdpQ2Qwc3k4MU03?=
 =?utf-8?B?aWJrR0FGUEYwTklka0ZDR1FKQ3NjQ0hzclBuTk9vMXcwdWc4ZTBESmc5bzYv?=
 =?utf-8?B?ZlEwRjJNbGRSTHlvTHNvQ2UyWXJrVVFad0VwYnB3VmR1MWlnbXN0RUJCdytI?=
 =?utf-8?B?cU5wNjA3Z0xsT3RXUnVUemFENC8rZ3VTVmF2cHFOd2paUUZSUHJDMHlEK3dn?=
 =?utf-8?B?Ti9PWG1iSEdaVUpRRnlkd1M2U1Y1QXNaNSthb0hmdU5CdGRCM1A4Rm9ZTWZN?=
 =?utf-8?B?djJDaTBtWUEvZkZxVDVFQmlnK2tSVXZWcGR2YlVmR2VMbWEzYTYxUFlNOEJX?=
 =?utf-8?B?Q3dIN2U2dm15OU5zWFRWVHd6TlVKbzdRc3JNWTM1b0YySzUxUmRGM3hkM1Q3?=
 =?utf-8?B?b0kyR096cStYYjB0VXlaTndIaEwyeklVTGZSeUhPVWxuZTM3V0JzdDhkbUZW?=
 =?utf-8?B?NVlzUEZGZm1kY1hNSjQyN0RCdHV4RXJGNGhrcGhLYzFOZkR2QWE3MzZRVXZ2?=
 =?utf-8?B?NTBhVnB1MFBvYk9KS1hHUWhGbDFQUlFFNndtR2tjMW5leFB5b3UyOVp2aFJm?=
 =?utf-8?B?c3N2ZlNxZU4yUjVsTkhsdTRkUHdka0xyM2Z2TXkzN3NuaXZKZWRLOEpRb1pj?=
 =?utf-8?B?VUc4bnpKdjk1ZjQzV255YWNKVzNUcmZ3UmlJNkN3SDB4c2pOV1ZEaGloQ1BD?=
 =?utf-8?B?bnllN1crei9aZTNDeUJCbTNOVEJEUFM5WGpobldGRDU4ZGI1a09BUklGR21M?=
 =?utf-8?B?cElOa1N6ckJVMjVJU2Ywc3g2RnZ4bVV0YW4wT3Y1RjhWeEF4azRrcE05V1Fx?=
 =?utf-8?B?QjB1Y2JBQVgvYnpmRjhCaHdYaWlsZnpvL0FRL1dGM24rUVdsUVhPNnYrQzFN?=
 =?utf-8?B?QjV5bHB3R3QxcVdiTklDMzJzSUhROXcwT1RQUjlpRkRHVEF1SnN2UXZ0SDdw?=
 =?utf-8?B?azAzQlhINVd2MXhRY25XclhJRGhlZGMvMU84dmhBR0NBd3FqK01XRjU0L2Fj?=
 =?utf-8?B?T2cxQ1h0aFpZdDFnQVBCajRtY0JHSkZQOHZHQ0ZoOTR3MDhLTi81dGR6eXZQ?=
 =?utf-8?B?MjRNZmJ1U0dQWXNWWWFlRUhoWTZuSzZNTmc1RDQxcVNwa2hsQ2RYM0NqL2Fq?=
 =?utf-8?B?dDlMRXcvYnFUQ3Y0bWZhL0ZYZ3EydVMxbE9rRVB1OUlHQUplNUdidkUvUmFN?=
 =?utf-8?B?Rkl2Z1VTOFE5NDdzVXV3cEU1VTUzcGxLbDI4UE83cW5FZjgxa0RnUXNMTDZQ?=
 =?utf-8?B?azJScDNrdk4yRDNPTkR4YVA4VlhmVDlEMlV0akJHSFNBOHVydjEyZ00wcnYz?=
 =?utf-8?B?M1R5Z1lFZXN2dUdCNnh4c3NUcXFvL3lWZmhzVzNVRUFaa2phcWlVQ0JXL1N3?=
 =?utf-8?B?UEt5Z0g2WmhFQXZHcGs3Y0FhZkd0NVF3NXFpODBRcEovcHZFNm9LWkZqM2V1?=
 =?utf-8?B?WXJhdUwxRzZwbzNSZW4xb3FZaCtSaWlYMndyT3ZHYnJzTWVzak1HekFJR1N0?=
 =?utf-8?B?Qmwwakh5YWhhajBMN2thTVZJbUIxays5K0FyWWIrcWVFaEVGZWFKWUJJU3Yx?=
 =?utf-8?B?RDBHT2dIK1cxaEljcksyVnMrcXlxeHBjZlQyWkNhYUtHOTZMSDFzRlBRUml2?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d7c0ab-5c1d-43a5-aa74-08dac61c17cc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 08:41:58.8269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sciVNjavcxEohRw9pZdpALVGlAyCu+en4dJHyExJc2faMEBHx0gRqWFGAQE1pqVDJPLqnYfOms+jUl44wnt/7GrbrIu9zvfhEctbdJDq7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6134
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

Hi Jagan,

On 10.11.22 19:38, Jagan Teki wrote:
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
> 
> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
> 
> Changes for v8:
> * fixed comment lines
> * fixed commit messages
> * fixed video mode bits
> * collect Marek Ack
> * fixed video mode bit names
> * update input formats logic
> * added imx8mplus support

Did you miss to collect all the Tested-by tags from v7, or did you drop
them deliberately?

Best regards
Frieder
