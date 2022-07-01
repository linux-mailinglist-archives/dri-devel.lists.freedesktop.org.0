Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF2F562A11
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 06:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B46610F6EB;
	Fri,  1 Jul 2022 04:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3AE10F6BF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 04:01:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrP2yJqGUocMZmRKb/2TmkIunIf8TqL/pL8E1NpSsdhYahMnFUeodzzwoEl8mc32GFDpHJdEgV2pUqc5U5xsnCEH7Sncez0HtL6Nc0G75hoAVAF7bnu8k0n8s+cfQS6EeisKbf3lN++ivgeYfIwLRj58I7dfGBprUbASU7lmZ/zVZUR/6ybX4F14meqxBwC2BDQEQfNqQgL/JsYrcQ7RAogFRWMGPnPohqZOYbDXIEw2YoW+jNjd3AClvruUzbgMXASJclZ3UhxbHwSxYzgQmjSNANHx4rBfogTuZWR33hgZdrE5PREODn2JY7jXC4CZDebKSZVkIGI+8b4WMqCenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MS4uo0RhEokU56CfHgaT3IaDnU/bWmqanfoPxD1stwQ=;
 b=FVGTSzLfWW3H5tFwi+KScdLTPa/YgsaYWOKMzo6ckpasz98D1ONyOUYHcRucWqEZEeX4wtFsnX9SrywG/FcJKKGz8Rw3XAl0At0hlIxxFlbZq/5NsLu6a2+sany+Es51vRxeRHcYGp5B88cE3Y8T9XO0UenYHwYqX1nQ4mIOj7eLitO/IG/8+WqqkK3kmh2TrOVeuhAwyZZ4BKsbVP2x5LfhEfYAx2XauobspPIQ1t5m+nTddRxQ9IyD4eL2AWbFErGHZat+D69Cn4qruyHv+SviyG9EnkxNaq2QZH+5Dgu72iRopOVxT7tu803roXcDSRa12ZUU6lvr4hAPuX+f3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MS4uo0RhEokU56CfHgaT3IaDnU/bWmqanfoPxD1stwQ=;
 b=XtXPO7uNjG2pY8j0I3gEOdLTaLYhs5s4FqSr3WBAMv7lrnmMa7hVt+EsTi8DEhVCKwNB787n9ziD8bjUcxekC5RGnNWI4zjmhR1ptp2gRszR68USeWA1EW/r9BCqhJl8Rak1syN6bJMdblQg1x5Z+2EU6hImK4oQEARVPFZKvFk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9122.eurprd04.prod.outlook.com (2603:10a6:102:22d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Fri, 1 Jul
 2022 04:00:58 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9%6]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 04:00:58 +0000
Message-ID: <b1d4291ac8701ffaeadecc93c49974a20af030fb.camel@nxp.com>
Subject: Re: [PATCH 4/4] drm/lcdif: switch to devm_drm_of_get_bridge
From: Liu Ying <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 01 Jul 2022 12:00:19 +0800
In-Reply-To: <20220630205728.128127-4-marex@denx.de>
References: <20220630205728.128127-1-marex@denx.de>
 <20220630205728.128127-4-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096::25) To
 AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a631c156-a0d3-40c4-36b3-08da5b164dc0
X-MS-TrafficTypeDiagnostic: PAXPR04MB9122:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zr70DAiXBhjf0320MgJxmbeFTTzUSkgP/yxQkzRwo+oHq6m/CLPadrWHZ8+eV5tMoGNviTZquCCD3hrrqdYzt5W64HjMj/JOqO0Q1dOHR66M9rBZdeYBCEq6I+qdKBm+dgQl4PlS8a7A0J/c4FhnhjI2QUbtxhLmpnVPv01XHJKO7pEhpcrcwLQYHXa8uf0kF/cG0yvzTdHEIbzinNsLvNhvXfdkLHlvl6csXUGaLcFR4pXfKnAeKj9VzyY3+iXFMY/TzEu9kaS1BFxD90n8eF4Pqj8ls7WUKM465dWn7IGmFK4YNseHOoR87MDGNFITp45jwc9HMh5ce4j0R+sGQZy/5A1NTRxVtTR14JBfDc9Zyeq9Cls65/CAhBEGWcconFjyjgVxxXLAiiI1AbPORTQC/gIG2B3JzEYutYA1bpXqYlQfkte2+QJXJL95xf7TOMVCcZgIcqOQprEJBJUlIalxOEvsirOHY6Q9z5A+u1WegSXYEUzj/nq1R2PKIgriqn1MXdZc73LsS9LKsfIj1QqCMIG56+0JT9nDUcJRPWGDA97SeZCTG9QXfNR4Bwptnfqr4aqziyOwDHFSarxqkKy7jWekGSkTH2cBQgMA1lkn3HveYTEnBkO5Wpz5X9JRf/PWznju3r3iKsYjgdaszlJ+2AqiyW7Zs8kFP0St93lwQt/CMiNhGnDC8xciTLuAXOP0st7LSanQzTncIdIokOy7SN2CLlfSm9c3YNp3MaC3mGpTtDkyfZJWlkkfVpawWRsHyLS07rb9gzjlfZ5LagpAZzjfBWPpHpu33kTwih0vdffYgyQKQf7GDBkETcK4BTUts4fLNfkxsU7PD1DaRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(54906003)(316002)(4326008)(36756003)(38100700002)(86362001)(6666004)(2906002)(5660300002)(41300700001)(186003)(26005)(52116002)(2616005)(4744005)(38350700002)(6512007)(8676002)(66946007)(8936002)(66556008)(478600001)(6506007)(6486002)(66476007)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTllV2w4UHgrZW1vZEJpT2ZMRnM3aldFUThpWWxxSzlyWUQzUTd2dTh3T082?=
 =?utf-8?B?WGxWeE5XTzRPSENSZ2gyblRLTDY0Z3d3R29wUTAybFRIR21qa01HbXp1TWQz?=
 =?utf-8?B?eDk5aTlabmlpNkVCendpVzBDY29hb0RrT09FckFaVnJETkdZd01mSFduUkxN?=
 =?utf-8?B?Mi85SzZENnZjTUtqZG91MEEyUVVMcVZzV3JSaGJza05NVzNvQ3BHbWJGcjNm?=
 =?utf-8?B?eXlSYVNmWTVRT2dVbEdvN2pkcFNSaU81SXJMcXZTVzdnN1JweFlmQzhWS2xV?=
 =?utf-8?B?NTlpbFNoNE5kQjhENUJDVlRxSElLQnJoL29wVkJWYUl2Y2ViVW5vRHE1bDdX?=
 =?utf-8?B?WUlrcmRTc1VjajJBSUxJeVYvR3FVUFU4d2ZqT3htNGNWVWRHMGFFMVdyb3dR?=
 =?utf-8?B?NkJwSjNmYUFhRGlRaCs0OEVSQjJDcDFZU2pyd0ZBWHQ3V2JmdHJHdmRHQ1NE?=
 =?utf-8?B?RldiWDJMeVZTYXJDZXRhUmdQc09Cc3VML2p5SW1iSzdhQVhEbmpzWjNCYkto?=
 =?utf-8?B?YU55S3dheEJhZHpoSGhGR21xOGVLenl6bDQ0RG0yZFJkR1U1QXo0TDROQ29q?=
 =?utf-8?B?VjdIR0lPNmxINitEL1BNTG9SMVhlQjY0UElPZ3MvQkJyZ2taeVF2U1NQWnRF?=
 =?utf-8?B?Q08rZlE3RFFucU1HUTMwQnRyZGNYb2FHb3liRUhHcnpSMVFzVHljdlBLOFhy?=
 =?utf-8?B?RUlSSjlaSHgwQjZEWDEvUXVaMHpkaGFhejZQOEFhOTBXRGRYQ3Y4c1VjYXhJ?=
 =?utf-8?B?WTI5UVZ4UFQrV3ZiT2orakxGQXhickxLeFBCVXE1aEhYOU5aMEgwa3lRNFY2?=
 =?utf-8?B?TlIwcUZZN3JJQitnbzRzMGYvNEhtOXVjMDJyWDd2WTVHWDdSbmFsSE94TlJK?=
 =?utf-8?B?Sm1VUDNKUmpqVnNvZDVrV1psOCt5RjUyMy9zbG1rNWxXeU51K2FwRjRtZTN5?=
 =?utf-8?B?ZElRZUlzSmM2SkNseTlXdVJUaWdwL2VseS9IWkFzai9ibnFCbi9Rak9iSTgw?=
 =?utf-8?B?VHkxVFFMbTdkZGpoaDIyYk1ObnRFOHFQZ2oyS25ydzlHTjRJUHZ0NklPR0JN?=
 =?utf-8?B?TzNYU3Q5OXBHV3phWkRVUC8xZlNBSHlyQmNkMk8vL1Zqb09INW1BN1RGRDFH?=
 =?utf-8?B?U25QMmpHdTlTTlpTT2RNTkh4S2FNUHRsUVM3NGxuSVRYbTRDeHZiYTZtMzlX?=
 =?utf-8?B?R05qb2ZvcWY2dE9uWmdZdUt5VENtNFRHbFdXc0VLVy8xQVN5ZXdMK0RTWjl5?=
 =?utf-8?B?NHVDTUxoejNvdjNFb1JvdEZYWXlDdUVDUjJQeFFZYkhETFpDem8wWTdYTDhv?=
 =?utf-8?B?ZHFFUCtjNzk3bm9laXlTRW1xUjVzTGdiVVFZaURIa1AvYkRMenB0VndzOGF6?=
 =?utf-8?B?aC9YZC9PTHI3dXlxWUliQmJrSUJMNWhxQWVleFJNUDZ2U0pwQkdsRk9qVVZG?=
 =?utf-8?B?SDN4Z0x1bmxHNlQzQzlDUkVuekFlbU5kVTZTTHdDNFJOTDhxZUt2N1VMK0di?=
 =?utf-8?B?VE9jRjlmNS9ySzdaMm03SThNZFgvL1ZBVTd1ckRVVW5CdlNqRzNvb2NMUkZq?=
 =?utf-8?B?Tnc0aUp2RFZCRG5vS2JFVkxyQ0xlaWkzUHdJVXBmajA0RXZ3WHlDNjB1MlpY?=
 =?utf-8?B?QVpSZzRIT3Z3UVNxWUZVM2tUd1VEZjZTREM1a1ZGZmJvMjZRRldqWHpabTZw?=
 =?utf-8?B?QVNHWW5Nd3Q1SWdZZENwaER5NjhIbFE0dnNoejNqUWNXSkJFeWNMTXljSmNh?=
 =?utf-8?B?WjR2R0xRcFk5VU1RZE1QM3ZzenB4UUtQWFJaQjl5SHdrdjFiUmcrY0hEeDQy?=
 =?utf-8?B?Sjd3ZXdpRlhRL0hrdnhzSVBzVUc1VjlWOFMvUzU2WXJMdTFhNUNBRjVYMFVw?=
 =?utf-8?B?ZkRVd2Z0NHhHbzNndkZLaUFlQTBVRmZMRU9xUE5sdGJZVjRPMlNwQlNINDhY?=
 =?utf-8?B?L1pWbWJzVHVyeUJzYlJSeUJqZzA4YVBEM1krVnQwTnQ0WjVoWWNja2VWWjFG?=
 =?utf-8?B?U1hxdVhZRlB4b2lWVDRhL0VySDgzY0VVRGRVeUZQRk40VGZsZXBFRndYdHNW?=
 =?utf-8?B?MFcwUENpSk9ncUJUUmJSWUgwSm53WWh1cjd1THpkQ29KUVhyalVkZURtMEs1?=
 =?utf-8?Q?6LffTNMhwSqMaqtPF93+CEAM6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a631c156-a0d3-40c4-36b3-08da5b164dc0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 04:00:57.9593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rQeLkU61Uq91w7Icbj5uzCDWcJDXptFKjd/2PodgX/yPp0fCAAaaH0/d/TdwBLX1hPRZ7dBhu7ZLDdxqQ7smA==
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
> The function "drm_of_find_panel_or_bridge" has been deprecated in
> favor of "devm_drm_of_get_bridge".
> 
> Switch to the new function and reduce boilerplate.
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

If you want to add my 'Reported-by: Liu Ying <victor.liu@oss.nxp.com>'
tag, you may add it.

Reviewed-by: Liu Ying <victor.liu@nxp.com>

