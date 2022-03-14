Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33704D7AA3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 07:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B08B10E1BE;
	Mon, 14 Mar 2022 06:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2113.outbound.protection.outlook.com [40.107.92.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF71F10E1BE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 06:04:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFm+2dJRQsLEOf3mjTuusYttKWlBvq+ar3jBpkt8yW9VnY5lXXeSsKh2kfpsl3+DVJICCAEuQ8T7/mWz287wE8pC/8oWyNNAEI/5CzZ6tlnpNskKGh/umXQA8mAqcL+LwxivG4X0QpHQEs5st03kUb54iSm07gb4Xb0fB/twOQU1wEhZX9bA6YmYdgc6XgZYMX1BgnBRRis45z9GwEVMiGRcO3mEw1ew2Om4KaAILroSWI/JW6tGygu+iwvyaPN5aiokxw1ohahR14Q752kU4tHM5OxffzgCtPvDBRDR3YoYbTJE0a/khJOdWsptb8Z5fPn6lshDcCE5cNCtlJ+QWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1EWuJCYgkEn7BWZMXXvwk512lxER99LoaJFjH5Vsp0=;
 b=VT7h2QiVI4iFxWzqcJEQFKG4vChK8hlIYQGXo+RvWkPtyyrHC868SNWdDgsZuHuMaX9T9yaZPTEJeFG5/9Ae/4ytz0m1upttFxxk6BQTqOd+VVpLwTUz8RqUQ2rsZR+hEc2g5nyv13jkMgWV4dn/SV0c8Ty9joQH+ubOrPQUg6tmT/+h8+ySQZCXG83TMWIvzd3t41vyW9D0Pn8yOWZJB77SQFL4Y/m/SGsOMK+NZVLiT8/4k4s0i1VbldIm7ED86UXqg3Hy2oV/NSDBXY+EFQBMarxu2csnO+aoXEZyQO52Jzw8CDVUPqWJ3Tm9WtjV5/HW8AOJD+88C38XWAI2Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1EWuJCYgkEn7BWZMXXvwk512lxER99LoaJFjH5Vsp0=;
 b=F0i4C7mUdKgjvu6+7tDG4OYTLiQ0m7Yk23H3nEM9+DxJu0idzfZqxhnDYBMUTu4BDLroaMC7mxN4CNhvsYWbzibqHjK6CyIqPC918uIDZUkInCWhu1JSJi2m/yJqMEnhO4TfDjv2YWeiFOlGVmfSs9ddYReWlS3+WI3Ruc3dEZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BN8PR04MB5651.namprd04.prod.outlook.com (2603:10b6:408:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 06:04:19 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 06:04:19 +0000
Date: Mon, 14 Mar 2022 14:04:11 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Fix not correct get property
 counts
Message-ID: <20220314060411.GA1456403@anxtwsw-Precision-3640-Tower>
References: <20220311103525.1431890-1-xji@analogixsemi.com>
 <Yis0KXVqZokrkoP7@ravnborg.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yis0KXVqZokrkoP7@ravnborg.org>
X-ClientProxiedBy: HK2PR02CA0218.apcprd02.prod.outlook.com
 (2603:1096:201:20::30) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efa4340b-464d-43be-9e23-08da05807a38
X-MS-TrafficTypeDiagnostic: BN8PR04MB5651:EE_
X-Microsoft-Antispam-PRVS: <BN8PR04MB5651E5E032F128CF97F33195C70F9@BN8PR04MB5651.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gni6gJJJDQHK9VnipZLR8t1PUY5a22KnPih1psIuSjFL2PerUCMjUOhNkHhsL7DmihvL3n5Mm2Ujr3h5xvFD2mTSaNA7LZnJxq1OyC+w6ThiwLP3Xwl3UM7JJRoSMQ1yNEmq7zTXg1/7fySy0d8qdL+y33ylwM6I3dE69ECqCVoQSNxhQlsU7USwzVWoEe1Qppqe5D3IwbQQsbf6upu+tjiiorEpI95FZW+wTFGTfYUcDf+ZyDw2NW8z+1SuOp+zHDnZRH9eH4ZwbNTBkq7FrouUd2/0Yf5yKxcYZw7u7fmIdqNhfoJIBV4KF5fxe3Zf6wrzYXUiFRzD1qsUBO666lpc1Al5YDq1vaH8Pwv98YHUNHJv5W8NA+gCxFOJLG8X9Q0JsENoFjwJ9LHNJqN607yHD8OdcI6/WRat4MSphCoEgq52WYNxW2Ll7qWkbeWjEo7sjTv+R7gF8utR1B3g9ZAkNlc5qHTGpyz8m+nvKxP1vMHMJ76NAhEqHbjS7EufSCG4CaOjxyohEGGQZMU8NUKt/fPzOUHswBIWhvyIQUkIhW3+lSH282WFTQXhv9b+SPRC/lyRM5TH8fbW563vKsNWvUdYVyDn9wS45elACAlPmp9+b0KBCOTtCqBbKEQNdGQwg26ov52+Lt4VwbgSz2qIIx8rRkAHqIgMDFEv9MagED2ovgEpMcL4VFX+Ya5P6drZ1ZZ2VKoY7sUPO72oSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(26005)(186003)(8676002)(66476007)(66556008)(4326008)(38100700002)(38350700002)(52116002)(55236004)(66946007)(8936002)(6666004)(6486002)(54906003)(1076003)(6916009)(508600001)(6506007)(86362001)(316002)(6512007)(9686003)(5660300002)(7416002)(33716001)(107886003)(33656002)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+dBXQ3uRzmG+QYRdtpBdPeAoGWmelgqwe4twqZD8Yr56kmEIR46mD3TMp2T1?=
 =?us-ascii?Q?Slx7C7fvdKEFTccRZPXeR01olvWJQtU8fpn6iEfOqZXyPaZuwPFNGWKPVWtr?=
 =?us-ascii?Q?pk3rKbqlZhtIbUf3hKCD3rgEJnZz1kVoPqti1GSJQgyA+E2dcViRfNclXzvw?=
 =?us-ascii?Q?Y0ILnINYjQprBfIovwJg5v4YLnzqJY7sQirC7jejfp/VexKOLQyX/YUAZXIQ?=
 =?us-ascii?Q?B/55nqowFMMuS9CHaFrvCZxecjPTxqYJIkb4qHmQ2pZ/8UD6e5iDhEd/t7JB?=
 =?us-ascii?Q?2MtP+04SyCXsyrz5qPZq0hTsSzV3XNj4myfd4ESjxK6zNsJfKr+6XlFgs7fL?=
 =?us-ascii?Q?uw+0EA3/eF3RIeMWlpcnd48qARof0NxEnmwBmACStvU4A/ivdLm/wHIjpsx4?=
 =?us-ascii?Q?MkSXEhQwkVEDRwMZpMNAlBPPM3a4MndM2uKlj4zEQoQ+j8c9ogoR4IJ5dpsm?=
 =?us-ascii?Q?jyZj9xKg5sj8XBpvJ0q6VdO7tGL7LWvHmMPutXrJpADzOmXpjkBij6YekYNc?=
 =?us-ascii?Q?Nctudu8hrLll7tvojE0QRvpNGdA/dMZA5qMWkcgSE0ZRrz7WJXEz8pWiBjJA?=
 =?us-ascii?Q?PRyEzYcUMi0YOzEdQONrHdLUV4Vzlo2u2bvUl/By0+zG7MknFuaTRbup91oM?=
 =?us-ascii?Q?kFyGpnl/emVHuzxiMWhvCz+9/xDS8P7Px3uHVMBBrCFoCOtfSGN08gUEwqho?=
 =?us-ascii?Q?ZuZoUGNQixFvCWkdYB5pmxi7P3HtmH+YBzfloSt5rQMG28ZDEu98UvFxK8HF?=
 =?us-ascii?Q?vvvWkPhY15VYiSYoUaD1eXjQa1aP5DVPBb9AClUNk70f+E5OlhKYmB8omvHH?=
 =?us-ascii?Q?HCLkDZxivAZhnXCXj6IC0LP+tkRiq6mXQfMEy3g3hTt9OY2uMyCpnupDBtFL?=
 =?us-ascii?Q?UKdA4d9taW6sekzOR4fM4w9GOK44+NZzQfUiSWqA0Ihhp0s5uRlq+vKQ4Ctn?=
 =?us-ascii?Q?tdCs+TgJRC6ygKL5wK3ornfIuD8obUK7o6L3ZN5Z097jIrZb5fgAHO1EupXX?=
 =?us-ascii?Q?hk7/nj9lJ+r3y9uHuhb6als2K2Zlky2Z1nT8OqrZsOrbkYhBjPwC406pKIyO?=
 =?us-ascii?Q?b6ytAbomtyQNru72wvP2VS2W1WKS385WMQdG/LV6gRLvwfhybjGErvllnYo0?=
 =?us-ascii?Q?9e9+J93A3h7FRJtSeNPEK6/y8LINB3BXAnAukpUMp29m7BbvdeX3ms8ihk2I?=
 =?us-ascii?Q?8MsSMsNUR4VoYVaK7Q0tknoye8OPjadi9AlcXHCeIYYBSiMKFVMbxJMFx6ce?=
 =?us-ascii?Q?aOZsXzOxJZpIxPLfRxlMvTktjfzUxCaEm5kiUfBSyhMQAnzoQU4SAPwC90/m?=
 =?us-ascii?Q?oYY2SzvF1cMFiee4tPmTyG3DixampCsKamCSnGiLRQhUyWdkr1eFjCn29rfQ?=
 =?us-ascii?Q?Xw3KTBeBenEJjc/+DCmfKUIcNTGQlzb1P1XbaqF8WTINGyG2rorOdbjyHtMZ?=
 =?us-ascii?Q?n61eHM5YZZrJcWFpzqfd8Km2VAgiHIrq?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efa4340b-464d-43be-9e23-08da05807a38
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 06:04:19.3329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4PZSTeDL5sOuUGUIGtJwMmJtzr8cXQBeOn+epnAOVrecMofrvaN8AH3oDpydipOmsn8wNCFmEeyUHmTo5ZJCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB5651
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 qwen@analogixsemi.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 mliu@analogixsemi.com, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, hsinyi@chromium.org,
 bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 11, 2022 at 12:36:09PM +0100, Sam Ravnborg wrote:
> Hi Xin.
> 
> On Fri, Mar 11, 2022 at 06:35:25PM +0800, Xin Ji wrote:
> > The property length which returns from "of_get_property", it means array
> > bytes count if the property has prefix as "/bits/ 8". The driver should
> > call function "of_property_read_u8_array" to get correct array value.
> > 
> > Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > 
> > ---
> > V1 -> V2: Fix Sam comment, use of_property_read_u8_array to get array
> > value
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
> >  drivers/gpu/drm/bridge/analogix/anx7625.h | 4 ++--
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index c6a9a02ed762..628cbf769141 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1598,8 +1598,8 @@ static int anx7625_get_swing_setting(struct device *dev,
> >  			num_regs = DP_TX_SWING_REG_CNT;
> >  
> >  		pdata->dp_lane0_swing_reg_cnt = num_regs;
> > -		of_property_read_u32_array(dev->of_node, "analogix,lane0-swing",
> > -					   pdata->lane0_reg_data, num_regs);
> > +		of_property_read_u8_array(dev->of_node, "analogix,lane0-swing",
> > +					  pdata->lane0_reg_data, num_regs);
> 
> The current implementation do a two step approach. First is find the
> number of elements and then read the elements.
> The number of elements is only used to limit what is read.
> 
> I suggest to use:
> 
> of_property_read_u8_array(dev->of_node, "analogix,lane0-swing",
> 			  pdata->lane0_reg_data, DP_TX_SWING_REG_CNT);
> 
> Then you a guaranteed to read at maximum DP_TX_SWING_REG_CNT entries.
> And as the number of elements is not stored anywhere that should be fine.
> 
> This looks simpler and matches what we for example do in
> drivers/gpu/drm/arm/malidp_drv.c - the only user in gpu/ of
> of_property_read_u8_array().
Hi Sam, the property is variable, so need two steps to approach, first
to get the property length, then to read the elements (the property
length may between 1 to DP_TX_SWING_REG_CNT). If directly to read the
element, I cannot exactly know how many registers need by configred.

Thanks,
Xin
> 
> 
> 	Sam
