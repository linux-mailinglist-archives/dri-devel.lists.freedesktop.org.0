Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5FD5629DE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 05:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D8810F2C7;
	Fri,  1 Jul 2022 03:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9891510F290
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 03:56:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A01HqYzkYpttYdLUc1a/KCdWuJS90lq4327y8dc1J57aDs2joanXb5dcMspYjqBQSiWFXQJ+HoH/DQ2QynDcbVtbtl27cg335hkLxrKuU6vKMcZOPGWVzhB+V8NO8u9hvHZ5FDhF04SWo/iyhZTd/KYo3L3+41pAd7m4XTbCmyiepEFmC642FRe+ZYqV/YqYA6NnS3c3bEb6MzWiUufmfrok0rH7jEsrWm+41vH9KeMcWZku2CWs5H9VXz3JwNBff0ovvMJlIsmhR0Mslx0auhTUKfldLMeAqsAqUtHGP8HZJFmE3ZGLOYB4n0w4Wnojj6GT3mxu0upVZFTt3g9Rvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xekHXkpfzQucdQjBFIIzExka3Mpzpg9G8swurEfFvGk=;
 b=Yd4FXOO2NCL85jwmobcRmN3NyQRzbLdSQXpCIWH8iW6KOObUb7U33o9EvraDK/LV7hD9gu2R+L6L08+3tk/tEIJhR3/fsh0Xfsgde/u8Cu5a74wWqWNGY029IDx/dNL1YDkoFiCms5vKPrIJ6sc1QaywgHSXxpGvN8hxWDNoTv9Eb6YihoQGk5zlaruUJYOyYXjjVPyVboBbhAfA236E04CmX0/YjCKyO9nC9K4bRtE53c3Eyvwa9LJJk3f4BVqHOYbAm5naM5sQawWfzDDmLqbBph4hhspkEMbBxyykG+ecvbCoeHLgiLgX+MdkwCotP50mK4bm/cpu1V1whFpF1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xekHXkpfzQucdQjBFIIzExka3Mpzpg9G8swurEfFvGk=;
 b=C2GgtwINo9KKjoMJJjSaMHrpmELa7W5mfPb1CeCwSU+MVWyIHyR3Qe4Q8PuLJvnTv92y4/Xua0wOaHsoD2pLSC5ZGH2/rBlgUFAlvD+adawbFlJq6IUQwowcQuzDIvB0HgxewHuD1KcBJBUG1MNqCcr2u14aHKy1hLjp1gPMHLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9122.eurprd04.prod.outlook.com (2603:10a6:102:22d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Fri, 1 Jul
 2022 03:56:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9%6]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 03:56:43 +0000
Message-ID: <cb147b78e9981fcb6e932f58c87c38c4f8dd7a37.camel@nxp.com>
Subject: Re: [PATCH 2/4] drm/lcdif: Consistently use plane timings
From: Liu Ying <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 01 Jul 2022 11:56:05 +0800
In-Reply-To: <20220630205728.128127-2-marex@denx.de>
References: <20220630205728.128127-1-marex@denx.de>
 <20220630205728.128127-2-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0165.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::21) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2eb40f82-aeac-4959-05d3-08da5b15b64b
X-MS-TrafficTypeDiagnostic: PAXPR04MB9122:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rdrkk00Q89AmVgQJMBsA35jbv9Pd6c1Z4wqq7cVz4KZlBF/hSME1fwcaXJDu1X68B81Ja0tsrgXWrIEUPYIGA0paaOmvAK9+dC/GEwPgMxw37BxZKxRmopye7ijVCf6ePRZnGVjMvqXN5Zelg1P1lEW3xZdXoQMIvhSi1UfIdI72Yhh0GBHJ7xLoy9l02INDYedXqeikqefHDcZGF36+b+cHqpvzvmo4fxl+goRdBtblYgTnX8+te6Nt05StKUUQTmhdiLbRWm46qcc2hgzkDWe5ARhLnU6pL266awnoHgat7/mgd0AN3eB9Gjk07LFfR9uoYRyMn+ATo0FCGaEo+P9J/encu5QwPdSZdG8l8i6uNiGu+WXx5Fw1YqNKjd73hPM6wjqsT75vPhQIwuAA4RpjCCSaxC2MuAT+ZvekEXOAUzHFPQ+bdcjSgRmv/jTSlfHWKz9IYQ1n+7jlUEKHcuLhz6HdVsN7trs4rvOjY5OBPtsurtgBUvtmBIQbylAupN0oi9vYKVN9JIbgmeFsBaoDN023V5E56Gei41ZzN8n6Jd6EV/AMa/iEf0A0vZzCcd2Q8AOHCbCs+/5JTIqjZ6X+yAbUVXhbup/PSXhsxQTBvRgB3RDUZ/wxWPjdQh7CIU3U3H1XU04S+bnCsdkiEr0sy9hBeUv++oo+x/cgojL9cOC/T+1ZZee2Kqsy4jX3OwcYa++quuuHQTH+tDuKBpGN5KHxe10F1g0n1uisSjhyb6RGifsWwAgoYWDOobBRaGaCyxQvpM6VvbsFTGIGfK5FHAsloYP1o2MOGR44T53hNpK7lWufCTAfBrPB318UYtkRkmr+tde3xGFv8wQPow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(54906003)(316002)(4326008)(36756003)(38100700002)(86362001)(6666004)(2906002)(5660300002)(41300700001)(186003)(26005)(52116002)(2616005)(4744005)(38350700002)(6512007)(8676002)(66946007)(8936002)(66556008)(478600001)(6506007)(6486002)(66476007)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MS9XNDNUeWRRZ2haNUUwaWdqaVFUeUkvTnkvaUdLSUV1endHTWlnamFWcDJG?=
 =?utf-8?B?NmVodGdvM0FJR0twTEdVSmRqbmNaVmpvZy9Cbk45elJRK0NjVHViYzFuOVFK?=
 =?utf-8?B?TGN2ckg3TFhQRXpVRldXTlVmNW5DNndNd3VrNm9vOWNHWDloWDBnRjMwMnBQ?=
 =?utf-8?B?QUlEQ1FSU1NvVmN2a3dXeEFYcisvOWdmZnZmcmJBQWEwVHB6cW1pUEhUK1Q0?=
 =?utf-8?B?ZmwxY3A2czJzNEE5T1dkdUV1UnBKTXZqU1pKalFYSEhPdzNzaEFzVXV2WkNv?=
 =?utf-8?B?WmJxeTJ0aHVzUmFlMHRvRHNiK2N4OVkyaHdiYWh4Rlc1VmtQMmtKN3ZDSTI1?=
 =?utf-8?B?RHVUNnBXZGhUeGlqT0dGV3V2QWgwMkxUNkkrY2wzUUtvdUh3WWtIYTRiMkh6?=
 =?utf-8?B?bTh2WlZVL0V3b09jMVNKWnlCNUxmaVZzUy9KODdRL2owWDVKQzlYb3Flb29o?=
 =?utf-8?B?bHJ0OE9GelJlU281NXFRZ3BsTDVvak9pamVuVk8yaGkvbWw4Ly9VbWs4YXJ6?=
 =?utf-8?B?Rk9iN29ROHN1N05vaTRQUXRXWkJOUDlDVFBFNmlCQXpYT05STmEwc0lDV2tU?=
 =?utf-8?B?bU9IRExtU2xCekU3MmhiT3RIZGZ4NDdnQ3lKeVdmQmJTd0NiVkFVd291Rm5J?=
 =?utf-8?B?UUNqQnVrQTA5dTZ5aXNmOU1qbzRKOXFLRUVEWm1YRWpLZzNWT1g4RlFRaWZP?=
 =?utf-8?B?NjVtVGFyVVNGT1JVcXFDVTAxc0VLUUZzQ1p0VkRxMVdXK0RvTGN5M1FBWEMz?=
 =?utf-8?B?RFpHcUdSSnF2eEIrK2Y0ZFBWQ2s2Vjh6YjVkT25POUNML1kvSldnVzR3NGJv?=
 =?utf-8?B?eFVBbFVUa2RzVDVrbDlOS1JRd3UzZzJYcFl6cDd1eHBkTlptdlUzYzlKSHNp?=
 =?utf-8?B?dVpKNG5MZmJxWFJubmN4d3BqMHVFOGVaMGUwSnNBNkkvUVJLNnBVaDhTNlVQ?=
 =?utf-8?B?ZmdvcHQwSUNPUDZpSGZEcGY0bkFOUFdRcm5QQ0FncEpQYmp1RVNyOW8xVU9z?=
 =?utf-8?B?RjFINGRQd1pqbkpRNzdtMXJXUzZtc0FIZUdHczRIdVZpeXhSNkpKQkFjcTZl?=
 =?utf-8?B?UkdBN3hiMkpnL0VZMGo4dXpQUXRqS3pOMkZON0VleG10bkhqRFBuekhqdkVz?=
 =?utf-8?B?SnpDNS94OHBYR29vbVdTdFM4WkZHeldXVzBGcElJTkR5YVNLa3k4NTEwVzNJ?=
 =?utf-8?B?RjZGUy9ycURkL0ZUSnowZUZRY3VMblJIS1EvSWxtb0R2UmNISzNRZHRQUFJS?=
 =?utf-8?B?c2UzR1Ywbi9YQzducFhNMFZyN3BmVWF2aDV5emIyeEhENzZqT3BGbnNjQmRp?=
 =?utf-8?B?ZWh5TmRzVWdKY3Zzem9BVmo2OUpLQjZxYnROaXJPSkx1a2tYb0hZMkRNcHNO?=
 =?utf-8?B?T1htZzBRcGwyK001SXFjWDJWdnBaa1IzQURidnlIeXZIbFk1ZFM0dEdURGE5?=
 =?utf-8?B?WlJuQ3czSXhHbW40T0ZiVzNLVjMvQ1ltemtFUHFCNWRXc2FRTEJUWVF4WGpy?=
 =?utf-8?B?RTNOZzlwMFRIY01BeXZHREJPQzBRREVhY3pBS3I0NkJEZTluSnZLZ1JsT1E5?=
 =?utf-8?B?OFFaYTREd0t5Tks5WUpmM21mWVpwUWJCZjBkZGJYR3pMcFMxWm81WkNETlg1?=
 =?utf-8?B?cWFSV1lwVVBlekdiK0hvcVRjL2dYWFlUYzFBL0FhNWlOU1h4ZUc2cXlacWVF?=
 =?utf-8?B?N0ExQ3hvOUw4a1Y4VG5QNi9CbDIvOHdVd1Q3QUxQZnhZSkhOTjEvcE1nYmFZ?=
 =?utf-8?B?SG5pV0pmMXpuYUM0d3FqZlVaaEthMGp0K25LY1NJVkdON09TN2tIK0h1N09Y?=
 =?utf-8?B?elQ1RzE2b0p3UW5OYjlJWis5aUNaNE1ZdGNwU0VZN29WaVFNZGdnUnBLVGJi?=
 =?utf-8?B?b0s2R2w2K25hMC8yRGR6bEJ3UEdQcmNPRG16ZVduNWlUMUgzQ290Z3BpZ2h2?=
 =?utf-8?B?R3VZemhpTjlsQXQ5OVRYYWl1N1dlYnFjeTA1L3JYekhVZFUzaEpxNWFEcncv?=
 =?utf-8?B?eitBN2VtMk54OVA2dnVTR0szKy8vbmw3NkZkTUxMbExGYXhhRGYxZHhRSGhw?=
 =?utf-8?B?L3I1Q2VPWTFFUy8wdkxpTWo1OFZFc0FwWEJ5ZmUzVEVJa2R1SEZCWFBoS25z?=
 =?utf-8?Q?njjr6zOePyARWDuctpbObsMcJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb40f82-aeac-4959-05d3-08da5b15b64b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 03:56:43.8563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUhp1Rp5xXawIL/2irARsnlFRQhfPxo94Kv0d7YGaRnzHcrhUAfsq2cJCXRds29pDmEkFyVbsGYGjGMLmdlomw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9122
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
Cc: Peng Fan <peng.fan@nxp.com>, Martyn Welch <martyn.welch@collabora.com>,
 robert.foss@linaro.org, Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-06-30 at 22:57 +0200, Marek Vasut wrote:
> Drop the crtc_ prefix from mode, consistently use the plane one.

s/plane/plain/

Otherwise:
Reviewed-by: Liu Ying <victor.liu@nxp.com>

If you want to add my 'Reported-by: Liu Ying <victor.liu@oss.nxp.com>'
tag, you may add it.

> 
> Fixes: 9db35bb349a0e ("drm: lcdif: Add support for i.MX8MP LCDIF
> variant")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Martyn Welch <martyn.welch@collabora.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>


