Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB72C25824C
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 22:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F2989449;
	Mon, 31 Aug 2020 20:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA38893A8;
 Mon, 31 Aug 2020 20:10:51 +0000 (UTC)
IronPort-SDR: XOSIYKm6eyn88EpooyK2v2eHB9Mxzo6/HoxJUYNBjTPqXzknADKRApsqfdx00yrgzHPY0Xvg48
 GUSPLOebFUpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="221281853"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="221281853"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 13:10:49 -0700
IronPort-SDR: xBp13awyPeYmzYaX/ogTafdsIMAREmREOxIj9VdOox4y4WQ164Frp2YXir4rM6+FHOu72wXSCT
 Go57oNt1NJ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="501966620"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga005.fm.intel.com with ESMTP; 31 Aug 2020 13:10:49 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 31 Aug 2020 13:10:06 -0700
Received: from fmsmsx151.amr.corp.intel.com (10.18.125.4) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 31 Aug 2020 13:10:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 FMSMSX151.amr.corp.intel.com (10.18.125.4) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 31 Aug 2020 13:10:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 31 Aug 2020 13:10:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAkNT4e7HVPIB+9ZAgCRal4Q7OURZltqQ6bFVzwyeHwADMsAG2hLcV2qqQqiO1ibQCa8eQ2m3EVI4H1c1I85/2tC6MHjLSrkutcqXprEUQhWGXNQxrl2JM/lt6oq/UpkaYk7IKUABVwWtQmCSjEqvtYeJmEdkkeHAzmPZXJKm/htcJRJ36CgC6LBzrxlSe5I4WaRFsSTyjYbeZZTQUdu2JUzerNO490kcox5gJP07/znf3q3WWew/S651Pa+aHriRA5Bn9SAn5Ns5KHSxDDdk/o9pSKrt8E1VVjlc8gZH/kRPEFo5xp5bmGGVm7mk7CD02ZGZy6dxTAKHbLplN2o7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3GfsCaqiHZyh5CHT+MMOUJDddJYGQtiNpyllGqjMVo=;
 b=JUCHd5oTodBULR5ucl1gtJcsdMbPwtqFB26xYeLjQ7NPm+WSi6FtmIypnsW8nPBXElerkhdv6FiWI3fv+IRIdimjZTe0YriHd96bei+BkcHp/7ueoLX4nvoJd27ANc+o6x2OHqtyK+MfmHoKGY7g/M1omw/yJmk7+eAHkJ5wCfBt/HH6ObWWOhcM0MXG6fkTJ9obOo+t/WHrt3AP7a682cSHDGTno2oYe8PY0Hn25v2kjWgNDgNORo/LdHaPwC+PrsOb1GLhQRwwW0S+jK3SE39dEQu5fSNev6Bs/9+LG54+RvN0tmngIC+hHMXuNO5y0XkKte6DTNREqtzT4PeppQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3GfsCaqiHZyh5CHT+MMOUJDddJYGQtiNpyllGqjMVo=;
 b=D8opiQbpD1QN9dYSDU5eAzSdVrMovXH3kTZLAOf82BsQE1WaiYMRDp0r5aZD0uTQwYCZiWH/JS5912MHGuVYi0tAgU3yCdKaytDzO1Uxeeoc5Ze+o9Y5/FTdLU/wtOEqWqvErtmN/MbwDTNG2YduhwIQq/Ln1sIM7oVa0IaTCDU=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BY5PR11MB3974.namprd11.prod.outlook.com (2603:10b6:a03:183::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Mon, 31 Aug
 2020 20:10:02 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::1d4e:2269:63d7:f2d6]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::1d4e:2269:63d7:f2d6%6]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 20:10:02 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH v6] drm/kmb: Add support for KeemBay Display
Thread-Topic: [PATCH v6] drm/kmb: Add support for KeemBay Display
Thread-Index: AQHWb2DV6DDX0y3uB0GJRQb6kPNEUqlBfRIAgAZQaNA=
Date: Mon, 31 Aug 2020 20:10:02 +0000
Message-ID: <BY5PR11MB4182C36038EA51C401200CFB8C510@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <1597096418-28937-1-git-send-email-anitha.chrisanthus@intel.com>
 <1597096418-28937-2-git-send-email-anitha.chrisanthus@intel.com>
 <20200820201014.GA205582@ravnborg.org>
In-Reply-To: <20200820201014.GA205582@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.151.242.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc5ce2c0-1b84-450c-bab7-08d84de9d885
x-ms-traffictypediagnostic: BY5PR11MB3974:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB3974B579D0B857E2E058EA4A8C510@BY5PR11MB3974.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T3d/WcobdjZePHCrdpu55LJnFIilhhb32VXwOjY7E1r1HkLml+/sj3A6wamR0jSQLy9kUdVXew8G5Njx/rJzEoDnd8//PzgdxdFVa+mn96Wx7UXOrBMmWvE4nRQ2JK2N/0/iqgmcvgrfcPgTc3ULzctt7k+l7YoioLT6AwAtDt26p5qWcwDZe46ovPGX6WO2+1kN9vNoYTOOir7UGiQkKLKEdhb7TJ5daAGgCnPQ2Wc4vKAClrqXkKmNkf39APBD7GwZ+yg/1A6EtLkOox1MtqkwEQKgdDf11F9jF9DfZjtwLycnyqkUAZxXxp+JnBwlB9AdFfDLV905QHVe3xxRHA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(54906003)(71200400001)(186003)(316002)(83380400001)(86362001)(2906002)(53546011)(6506007)(4326008)(8936002)(26005)(9686003)(7696005)(8676002)(52536014)(33656002)(30864003)(55016002)(478600001)(5660300002)(66446008)(66946007)(66556008)(6916009)(64756008)(76116006)(66476007)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: UtFww2CWQT78UsEETvrmbL6WCqISFVz//Kv1UfEW4kIrmppIOizs6nBNdhusX3RwF/yq+HNwgP0qJn4BrDfRq4e6FUb0e+2grBZewWB4riNWmQB5lhE7oLe+lWxcCV2cVuEgsr2bG+6YeJCwT3TdbRpgGF6QtCOD3cbn/AAvdBtEdbCkZ3KKxPb6Pp7x3i7hpBKs1lmgbdkonC6GvDQcd3f9NXQR31u1uMWVQ7x9jzeihUw0RnP1TzWIVksq+sAk9+PVJKAAP93TKMlTm7Kcr5qyBWzBMA8UDYSGfWUfuR5NKVAqVDnBkv/dumqpHwumgBGKi4KYvX9Vqy/CAqLN7MCFsm/wD16aqlythgh1/6o0bEGO5zopN5Mo9s97QJGr7EXFNuvHL8bKj3WRXoO73iACIrCJZYnW+DbQow59fr41sJKSSFZWSJZLaPUfkOqsBmTjm6/mJ0Wu4mJGQbNGQkbPmPJ9V+RVdH5LOt70pr2CF3QwysT/+I8oVh24U1S0bJcXiAw1PkFMPcNApIlHebJKS1DIcf00g6frgVK92XJj2YrSoSIY9TvKr9Wfme4tH2fnPPSk/1EbiXG/jKe266MGpqKyh2MIhCMjEHR3Dbwv48X++o/tPZOdKWQGtNdX/6t+tq21OUJmXThe/NgVpA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5ce2c0-1b84-450c-bab7-08d84de9d885
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 20:10:02.6477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NRAmmqTZ2f7bi+jCm/UttFOWQF7q06lfPL3HPYP29uc9Rt4Wc49yIobXQ4fjRZTaDxW0VPDs0sQamn/dLm5trJrRjFylr5zywMfMMZp4V8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3974
X-OriginatorOrg: intel.com
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
Cc: "Vetter, Daniel" <daniel.vetter@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,
Thanks a lot for the review. I will address your comments in v7. 
For those that are not addressed, please see my reply inline.

Regards,
Anitha

> -----Original Message-----
> From: Sam Ravnborg <sam@ravnborg.org>
> Sent: Thursday, August 20, 2020 1:10 PM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: dri-devel@lists.freedesktop.org; Paauwe, Bob J
> <bob.j.paauwe@intel.com>; Dea, Edmund J <edmund.j.dea@intel.com>;
> Vetter, Daniel <daniel.vetter@intel.com>; intel-gfx@lists.freedesktop.org
> Subject: Re: [PATCH v6] drm/kmb: Add support for KeemBay Display
> 
> Hi Anitha.
> 
> Feedback on kmb_dsi.
> 
> The main feedback can be found after the kmb_dsi_init function.
> The highligt of the feedback is that, in my opinion, the
> best would be to use the drm_bridge abstraction for the kmb_dsi.
> Maybe because I am biased - and this is just overhead.
> But it just looks simpler to me.
 Mipi dsi is very time sensitive and any delay can cause problems.
 As soon as it's initialized it expects LCD controller to be up and running
 especially the LCD_TIMING_GEN_TRIG, a slight delay and lots of issues.
 It is tightly coupled in the hardware with LCD and let's keep it that
 way in the software too.
 
> There are several chunks of code surrounded by #ifdef.
> It would be good if they could all be handled so no more #ifdef are
> required.
> 
> There is also a lot of debug prints. Maybe this can be trimmed now that
> the driver works?
> 
> There is a lot of variables that should all be included in a struct
> kmb_dsi that should be allocated in the probe function (if this becomes
> a bridge driver).
> 
> I hope this does not scare you away! If I am right about the ocnversion
> to a drm_bridge, then I hope it is semi trivial to do.
> All the hard HW init stuff is done.
> 
> 	Sam
> 
> > diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c
> b/drivers/gpu/drm/kmb/kmb_dsi.c
> > new file mode 100644
> > index 0000000..21745ae
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_dsi.c
> > @@ -0,0 +1,1828 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2019-2020 Intel Corporation
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/slab.h>
> > +#include <linux/spinlock.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_edid.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#include "kmb_drv.h"
> > +#include "kmb_dsi.h"
> > +#include "kmb_regs.h"
> > +
> > +static int hw_initialized;
> > +/* #define MIPI_TX_TEST_PATTERN_GENERATION */
> > +/* #define DPHY_GET_FSM */
> > +/* #define DPHY_READ_TESTCODE */
> > +
> > +static struct mipi_dsi_host *dsi_host;
> > +static struct mipi_dsi_device *dsi_device;
> > +
> > +/* Default setting is 1080p, 4 lanes */
> > +#define IMG_HEIGHT_LINES  1080
> > +#define IMG_WIDTH_PX      1920
> > +#define MIPI_TX_ACTIVE_LANES 4
> > +
> > +struct mipi_tx_frame_section_cfg mipi_tx_frame0_sect_cfg = {
> > +	.width_pixels = IMG_WIDTH_PX,
> > +	.height_lines = IMG_HEIGHT_LINES,
> > +	.data_type = DSI_LP_DT_PPS_RGB888_24B,
> > +	.data_mode = MIPI_DATA_MODE1,
> > +	.dma_packed = 0
> > +};
> > +
> > +struct mipi_tx_frame_cfg mipitx_frame0_cfg = {
> > +	.sections[0] = &mipi_tx_frame0_sect_cfg,
> > +	.sections[1] = NULL,
> > +	.sections[2] = NULL,
> > +	.sections[3] = NULL,
> > +	.vsync_width = 5,
> > +	.v_backporch = 36,
> > +	.v_frontporch = 4,
> > +	.hsync_width = 44,
> > +	.h_backporch = 148,
> > +	.h_frontporch = 88
> > +};
> > +
> > +struct mipi_tx_dsi_cfg mipitx_dsi_cfg = {
> > +	.hfp_blank_en = 0,
> > +	.eotp_en = 0,
> > +	.lpm_last_vfp_line = 0,
> > +	.lpm_first_vsa_line = 0,
> > +	.sync_pulse_eventn = DSI_VIDEO_MODE_NO_BURST_EVENT,
> > +	.hfp_blanking = SEND_BLANK_PACKET,
> > +	.hbp_blanking = SEND_BLANK_PACKET,
> > +	.hsa_blanking = SEND_BLANK_PACKET,
> > +	.v_blanking = SEND_BLANK_PACKET,
> > +};
> > +
> > +struct mipi_ctrl_cfg mipi_tx_init_cfg = {
> > +	.index = MIPI_CTRL6,
> > +	.type = MIPI_DSI,
> > +	.dir = MIPI_TX,
> > +	.active_lanes = MIPI_TX_ACTIVE_LANES,
> > +	.lane_rate_mbps = MIPI_TX_LANE_DATA_RATE_MBPS,
> > +	.ref_clk_khz = MIPI_TX_REF_CLK_KHZ,
> > +	.cfg_clk_khz = MIPI_TX_CFG_CLK_KHZ,
> > +	.data_if = MIPI_IF_PARALLEL,
> > +	.tx_ctrl_cfg = {
> > +			.frames[0] = &mipitx_frame0_cfg,
> > +			.frames[1] = NULL,
> > +			.frames[2] = NULL,
> > +			.frames[3] = NULL,
> > +			.tx_dsi_cfg = &mipitx_dsi_cfg,
> > +			.line_sync_pkt_en = 0,
> > +			.line_counter_active = 0,
> > +			.frame_counter_active = 0,
> > +			.tx_always_use_hact = 1,
> > +			.tx_hact_wait_stop = 1,
> > +			}
> > +};
> > +
> > +struct  mipi_hs_freq_range_cfg {
> > +	u16 default_bit_rate_mbps;
> > +	u8 hsfreqrange_code;
> > +};
> > +
> > +struct vco_params {
> > +	u32 freq;
> > +	u32 range;
> > +	u32 divider;
> > +};
> > +
> > +static struct vco_params vco_table[] = {
> > +	{52, 0x3f, 8},
> > +	{80, 0x39, 8},
> > +	{105, 0x2f, 4},
> > +	{160, 0x29, 4},
> > +	{210, 0x1f, 2},
> > +	{320, 0x19, 2},
> > +	{420, 0x0f, 1},
> > +	{630, 0x09, 1},
> > +	{1100, 0x03, 1},
> > +	{0xffff, 0x01, 1},
> > +};
> > +
> > +static struct mipi_hs_freq_range_cfg
> > +mipi_hs_freq_range[MIPI_DPHY_DEFAULT_BIT_RATES] = {
> > +	{.default_bit_rate_mbps = 80, .hsfreqrange_code = 0x00},
> > +	{.default_bit_rate_mbps = 90, .hsfreqrange_code = 0x10},
> > +	{.default_bit_rate_mbps = 100, .hsfreqrange_code = 0x20},
> > +	{.default_bit_rate_mbps = 110, .hsfreqrange_code = 0x30},
> > +	{.default_bit_rate_mbps = 120, .hsfreqrange_code = 0x01},
> > +	{.default_bit_rate_mbps = 130, .hsfreqrange_code = 0x11},
> > +	{.default_bit_rate_mbps = 140, .hsfreqrange_code = 0x21},
> > +	{.default_bit_rate_mbps = 150, .hsfreqrange_code = 0x31},
> > +	{.default_bit_rate_mbps = 160, .hsfreqrange_code = 0x02},
> > +	{.default_bit_rate_mbps = 170, .hsfreqrange_code = 0x12},
> > +	{.default_bit_rate_mbps = 180, .hsfreqrange_code = 0x22},
> > +	{.default_bit_rate_mbps = 190, .hsfreqrange_code = 0x32},
> > +	{.default_bit_rate_mbps = 205, .hsfreqrange_code = 0x03},
> > +	{.default_bit_rate_mbps = 220, .hsfreqrange_code = 0x13},
> > +	{.default_bit_rate_mbps = 235, .hsfreqrange_code = 0x23},
> > +	{.default_bit_rate_mbps = 250, .hsfreqrange_code = 0x33},
> > +	{.default_bit_rate_mbps = 275, .hsfreqrange_code = 0x04},
> > +	{.default_bit_rate_mbps = 300, .hsfreqrange_code = 0x14},
> > +	{.default_bit_rate_mbps = 325, .hsfreqrange_code = 0x25},
> > +	{.default_bit_rate_mbps = 350, .hsfreqrange_code = 0x35},
> > +	{.default_bit_rate_mbps = 400, .hsfreqrange_code = 0x05},
> > +	{.default_bit_rate_mbps = 450, .hsfreqrange_code = 0x16},
> > +	{.default_bit_rate_mbps = 500, .hsfreqrange_code = 0x26},
> > +	{.default_bit_rate_mbps = 550, .hsfreqrange_code = 0x37},
> > +	{.default_bit_rate_mbps = 600, .hsfreqrange_code = 0x07},
> > +	{.default_bit_rate_mbps = 650, .hsfreqrange_code = 0x18},
> > +	{.default_bit_rate_mbps = 700, .hsfreqrange_code = 0x28},
> > +	{.default_bit_rate_mbps = 750, .hsfreqrange_code = 0x39},
> > +	{.default_bit_rate_mbps = 800, .hsfreqrange_code = 0x09},
> > +	{.default_bit_rate_mbps = 850, .hsfreqrange_code = 0x19},
> > +	{.default_bit_rate_mbps = 900, .hsfreqrange_code = 0x29},
> > +	{.default_bit_rate_mbps = 1000, .hsfreqrange_code = 0x0A},
> > +	{.default_bit_rate_mbps = 1050, .hsfreqrange_code = 0x1A},
> > +	{.default_bit_rate_mbps = 1100, .hsfreqrange_code = 0x2A},
> > +	{.default_bit_rate_mbps = 1150, .hsfreqrange_code = 0x3B},
> > +	{.default_bit_rate_mbps = 1200, .hsfreqrange_code = 0x0B},
> > +	{.default_bit_rate_mbps = 1250, .hsfreqrange_code = 0x1B},
> > +	{.default_bit_rate_mbps = 1300, .hsfreqrange_code = 0x2B},
> > +	{.default_bit_rate_mbps = 1350, .hsfreqrange_code = 0x3C},
> > +	{.default_bit_rate_mbps = 1400, .hsfreqrange_code = 0x0C},
> > +	{.default_bit_rate_mbps = 1450, .hsfreqrange_code = 0x1C},
> > +	{.default_bit_rate_mbps = 1500, .hsfreqrange_code = 0x2C},
> > +	{.default_bit_rate_mbps = 1550, .hsfreqrange_code = 0x3D},
> > +	{.default_bit_rate_mbps = 1600, .hsfreqrange_code = 0x0D},
> > +	{.default_bit_rate_mbps = 1650, .hsfreqrange_code = 0x1D},
> > +	{.default_bit_rate_mbps = 1700, .hsfreqrange_code = 0x2E},
> > +	{.default_bit_rate_mbps = 1750, .hsfreqrange_code = 0x3E},
> > +	{.default_bit_rate_mbps = 1800, .hsfreqrange_code = 0x0E},
> > +	{.default_bit_rate_mbps = 1850, .hsfreqrange_code = 0x1E},
> > +	{.default_bit_rate_mbps = 1900, .hsfreqrange_code = 0x2F},
> > +	{.default_bit_rate_mbps = 1950, .hsfreqrange_code = 0x3F},
> > +	{.default_bit_rate_mbps = 2000, .hsfreqrange_code = 0x0F},
> > +	{.default_bit_rate_mbps = 2050, .hsfreqrange_code = 0x40},
> > +	{.default_bit_rate_mbps = 2100, .hsfreqrange_code = 0x41},
> > +	{.default_bit_rate_mbps = 2150, .hsfreqrange_code = 0x42},
> > +	{.default_bit_rate_mbps = 2200, .hsfreqrange_code = 0x43},
> > +	{.default_bit_rate_mbps = 2250, .hsfreqrange_code = 0x44},
> > +	{.default_bit_rate_mbps = 2300, .hsfreqrange_code = 0x45},
> > +	{.default_bit_rate_mbps = 2350, .hsfreqrange_code = 0x46},
> > +	{.default_bit_rate_mbps = 2400, .hsfreqrange_code = 0x47},
> > +	{.default_bit_rate_mbps = 2450, .hsfreqrange_code = 0x48},
> > +	{.default_bit_rate_mbps = 2500, .hsfreqrange_code = 0x49}
> > +};
> > +
> > +union mipi_irq_cfg int_cfg = {
> > +	.irq_cfg.frame_done = 1,
> > +	.irq_cfg.ctrl_error = 1,
> > +};
> > +
> > +static enum drm_mode_status
> > +kmb_dsi_mode_valid(struct drm_connector *connector,
> > +		   struct drm_display_mode *mode)
> There is a third argument in latest drm code.
 drm_connector_mode_valid() calls connector->mode_valid() with 2 arguments.

> > +{
> > +	struct drm_device *dev = connector->dev;
> > +	struct drm_mode_config *mode_config = &dev->mode_config;
> > +
> > +	if (mode->hdisplay < mode_config->min_width ||
> > +	    mode->hdisplay > mode_config->max_width)
> > +		return MODE_BAD_HVALUE;
> > +
> > +	if (mode->vdisplay < mode_config->min_height ||
> > +	    mode->vdisplay > mode_config->max_height)
> > +		return MODE_BAD_VVALUE;
> > +
> > +	return MODE_OK;
> > +}
> > +
> > +static int kmb_dsi_get_modes(struct drm_connector *connector)
> > +{
> > +	int num_modes = 0;
> > +
> > +	num_modes = drm_add_modes_noedid(connector,
> > +					 connector->dev-
> >mode_config.max_width,
> > +			 connector->dev->mode_config.max_height);
> > +
> > +	DRM_INFO("width=%d height=%d\n",
> > +		 connector->dev->mode_config.max_width,
> > +		 connector->dev->mode_config.max_height);
> > +	DRM_INFO("num modes=%d\n", num_modes);
> > +
> > +	return num_modes;
> > +}
> > +
> > +void kmb_dsi_host_unregister(void)
> > +{
> > +	mipi_dsi_host_unregister(dsi_host);
> > +	kfree(dsi_host);
> > +}
> > +
> > +static void kmb_dsi_connector_destroy(struct drm_connector
> *connector)
> > +{
> > +	struct kmb_connector *kmb_connector =
> to_kmb_connector(connector);
> > +
> > +	drm_connector_cleanup(connector);
> > +	kfree(kmb_connector);
> > +}
> > +
> > +static void kmb_dsi_encoder_destroy(struct drm_encoder *encoder)
> > +{
> > +	struct kmb_dsi *kmb_dsi = to_kmb_dsi(encoder);
> > +
> > +	if (!kmb_dsi)
> > +		return;
> > +
> > +	kfree(kmb_dsi->dsi_host);
> > +
> > +	drm_encoder_cleanup(encoder);
> > +
> > +	kmb_dsi_connector_destroy(&kmb_dsi->attached_connector-
> >base);
> > +
> > +	kfree(kmb_dsi);
> > +	if (!dsi_device)
> > +		kfree(dsi_device);
> > +}
> > +
> > +static const struct drm_encoder_funcs kmb_dsi_funcs = {
> > +	.destroy = kmb_dsi_encoder_destroy,
> > +};
> > +
> > +static const struct
> > +drm_connector_helper_funcs kmb_dsi_connector_helper_funcs = {
> > +	.get_modes = kmb_dsi_get_modes,
> > +	.mode_valid = kmb_dsi_mode_valid,
> > +};
> > +
> > +static const struct drm_connector_funcs kmb_dsi_connector_funcs = {
> > +	.destroy = kmb_dsi_connector_destroy,
> > +	.fill_modes = drm_helper_probe_single_connector_modes,
> > +	.reset = drm_atomic_helper_connector_reset,
> > +	.atomic_destroy_state =
> drm_atomic_helper_connector_destroy_state,
> > +	.atomic_duplicate_state =
> drm_atomic_helper_connector_duplicate_state,
> > +};
> > +
> > +static ssize_t kmb_dsi_host_transfer(struct mipi_dsi_host *host,
> > +				     const struct mipi_dsi_msg *msg)
> > +{
> > +	return 0;
> > +}
> > +
> > +static int kmb_dsi_host_attach(struct mipi_dsi_host *host,
> > +			       struct mipi_dsi_device *dev)
> > +{
> > +	return 0;
> > +}
> > +
> > +static int kmb_dsi_host_detach(struct mipi_dsi_host *host,
> > +			       struct mipi_dsi_device *dev)
> > +{
> > +	return 0;
> > +}
> > +
> > +static const struct mipi_dsi_host_ops kmb_dsi_host_ops = {
> > +	.attach = kmb_dsi_host_attach,
> > +	.detach = kmb_dsi_host_detach,
> > +	.transfer = kmb_dsi_host_transfer,
> > +};
> > +
> > +static struct kmb_dsi_host *kmb_dsi_host_init(struct drm_device
> *drm,
> > +					      struct kmb_dsi *kmb_dsi)
> > +{
> > +	struct kmb_dsi_host *host;
> > +
> > +	host = kzalloc(sizeof(*host), GFP_KERNEL);
> > +	if (!host)
> > +		return NULL;
> > +
> > +	host->base = dsi_host;
> > +	host->base->ops = &kmb_dsi_host_ops;
> > +	host->kmb_dsi = kmb_dsi;
> > +
> > +	host->base->dev = drm->dev;
> > +
> > +	dsi_device->host = host->base;
> > +	host->device = dsi_device;
> > +	return host;
> > +}
> > +
> > +struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev)
> > +{
> If this becomes a bridge driver, then part of this belongs in the probe
> function.
> 
> > +	struct drm_bridge *bridge = NULL;
> > +	struct device_node *encoder_node;
> > +
> > +	/* Create and register MIPI DSI host */
> > +	if (!dsi_host) {
> > +		dsi_host = kzalloc(sizeof(*dsi_host), GFP_KERNEL);
> > +		if (!dsi_host)
> > +			return ERR_PTR(-ENOMEM);
> > +
> > +		dsi_host->ops = &kmb_dsi_host_ops;
> > +
> > +		if (!dsi_device) {
> > +			dsi_device = kzalloc(sizeof(*dsi_device),
> GFP_KERNEL);
> > +			if (!dsi_device) {
> > +				kfree(dsi_host);
> > +				return ERR_PTR(-ENOMEM);
> > +			}
> > +		}
> > +
> > +		dsi_host->dev = dev;
> > +		mipi_dsi_host_register(dsi_host);
> > +	}
> > +	/* Find ADV7535 node and initialize it */
> > +	encoder_node = of_parse_phandle(dev->of_node, "encoder-slave",
> 0);
> > +
> > +	if (!encoder_node) {
> > +		DRM_ERROR("Failed to get bridge info from DT\n");
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	/* Locate drm bridge from the hdmi encoder DT node */
> > +	bridge = of_drm_find_bridge(encoder_node);
> > +	of_node_put(encoder_node);
> > +	if (!bridge) {
> > +		DRM_INFO("Wait for external bridge driver DT\n");
> > +		return ERR_PTR(-EPROBE_DEFER);
> > +	}
> > +	return bridge;
> > +}
> > +
> > +u32 mipi_get_datatype_params(u32 data_type, u32 data_mode,
> > +			     struct mipi_data_type_params *params)
> static
> 
> > +{
> > +	struct mipi_data_type_params data_type_param;
> > +
> > +	switch (data_type) {
> > +	case DSI_LP_DT_PPS_YCBCR420_12B:
> > +		data_type_param.size_constraint_pixels = 2;
> > +		data_type_param.size_constraint_bytes = 3;
> > +		switch (data_mode) {
> > +			/* Case 0 not supported according to MDK */
> > +		case 1:
> > +		case 2:
> > +		case 3:
> > +			data_type_param.pixels_per_pclk = 2;
> > +			data_type_param.bits_per_pclk = 24;
> > +			break;
> > +		default:
> > +			DRM_ERROR("DSI: Invalid data_mode %d\n",
> data_mode);
> > +			return -EINVAL;
> > +		};
> > +		break;
> > +	case DSI_LP_DT_PPS_YCBCR422_16B:
> > +		data_type_param.size_constraint_pixels = 2;
> > +		data_type_param.size_constraint_bytes = 4;
> > +		switch (data_mode) {
> > +			/* Case 0 and 1 not supported according
> > +			 * to MDK
> > +			 */
> > +		case 2:
> > +			data_type_param.pixels_per_pclk = 1;
> > +			data_type_param.bits_per_pclk = 16;
> > +			break;
> > +		case 3:
> > +			data_type_param.pixels_per_pclk = 2;
> > +			data_type_param.bits_per_pclk = 32;
> > +			break;
> > +		default:
> > +			DRM_ERROR("DSI: Invalid data_mode %d\n",
> data_mode);
> > +			return -EINVAL;
> > +		};
> > +		break;
> > +	case DSI_LP_DT_LPPS_YCBCR422_20B:
> > +	case DSI_LP_DT_PPS_YCBCR422_24B:
> > +		data_type_param.size_constraint_pixels = 2;
> > +		data_type_param.size_constraint_bytes = 6;
> > +		switch (data_mode) {
> > +			/* Case 0 not supported according to MDK */
> > +		case 1:
> > +		case 2:
> > +		case 3:
> > +			data_type_param.pixels_per_pclk = 1;
> > +			data_type_param.bits_per_pclk = 24;
> > +			break;
> > +		default:
> > +			DRM_ERROR("DSI: Invalid data_mode %d\n",
> data_mode);
> > +			return -EINVAL;
> > +		};
> > +		break;
> > +	case DSI_LP_DT_PPS_RGB565_16B:
> > +		data_type_param.size_constraint_pixels = 1;
> > +		data_type_param.size_constraint_bytes = 2;
> > +		switch (data_mode) {
> > +		case 0:
> > +		case 1:
> > +			data_type_param.pixels_per_pclk = 1;
> > +			data_type_param.bits_per_pclk = 16;
> > +			break;
> > +		case 2:
> > +		case 3:
> > +			data_type_param.pixels_per_pclk = 2;
> > +			data_type_param.bits_per_pclk = 32;
> > +			break;
> > +		default:
> > +			DRM_ERROR("DSI: Invalid data_mode %d\n",
> data_mode);
> > +			return -EINVAL;
> > +		};
> > +		break;
> > +	case DSI_LP_DT_PPS_RGB666_18B:
> > +		data_type_param.size_constraint_pixels = 4;
> > +		data_type_param.size_constraint_bytes = 9;
> > +		data_type_param.bits_per_pclk = 18;
> > +		data_type_param.pixels_per_pclk = 1;
> > +		break;
> > +	case DSI_LP_DT_LPPS_RGB666_18B:
> > +	case DSI_LP_DT_PPS_RGB888_24B:
> > +		data_type_param.size_constraint_pixels = 1;
> > +		data_type_param.size_constraint_bytes = 3;
> > +		data_type_param.bits_per_pclk = 24;
> > +		data_type_param.pixels_per_pclk = 1;
> > +		break;
> > +	case DSI_LP_DT_PPS_RGB101010_30B:
> > +		data_type_param.size_constraint_pixels = 4;
> > +		data_type_param.size_constraint_bytes = 15;
> > +		data_type_param.bits_per_pclk = 30;
> > +		data_type_param.pixels_per_pclk = 1;
> > +		break;
> > +	default:
> > +		DRM_ERROR("DSI: Invalid data_type %d\n", data_type);
> > +		return -EINVAL;
> > +	};
> > +
> > +	*params = data_type_param;
> > +	return 0;
> > +}
> > +
> > +static u32 compute_wc(u32 width_px, u8 size_constr_p, u8
> size_constr_b)
> > +{
> > +	/* Calculate the word count for each long packet */
> > +	return (((width_px / size_constr_p) * size_constr_b) & 0xffff);
> > +}
> > +
> > +static u32 compute_unpacked_bytes(u32 wc, u8 bits_per_pclk)
> > +{
> > +	/* Number of PCLK cycles needed to transfer a line
> > +	 * with each PCLK cycle, 4 Bytes are sent through the PPL module
> > +	 */
> > +	return ((wc * 8) / bits_per_pclk) * 4;
> > +}
> > +
> > +static u32 mipi_tx_fg_section_cfg_regs(struct kmb_drm_private *kmb,
> > +				       u8 frame_id, u8 section,
> > +				       u32 height_lines, u32 unpacked_bytes,
> > +				       struct mipi_tx_frame_sect_phcfg
> *ph_cfg)
> > +{
> > +	u32 cfg = 0;
> > +	u32 ctrl_no = MIPI_CTRL6;
> > +	u32 reg_adr;
> > +
> > +	/* Frame section packet header */
> > +	/* Word count bits [15:0] */
> > +	cfg = (ph_cfg->wc & MIPI_TX_SECT_WC_MASK) << 0;
> > +
> > +	/* Data type (bits [21:16]) */
> > +	cfg |= ((ph_cfg->data_type & MIPI_TX_SECT_DT_MASK)
> > +		<< MIPI_TX_SECT_DT_SHIFT);
> > +
> > +	/* Virtual channel (bits [23:22]) */
> > +	cfg |= ((ph_cfg->vchannel & MIPI_TX_SECT_VC_MASK)
> > +		<< MIPI_TX_SECT_VC_SHIFT);
> > +
> > +	/* Data mode (bits [24:25]) */
> > +	cfg |= ((ph_cfg->data_mode & MIPI_TX_SECT_DM_MASK)
> > +		<< MIPI_TX_SECT_DM_SHIFT);
> > +	if (ph_cfg->dma_packed)
> > +		cfg |= MIPI_TX_SECT_DMA_PACKED;
> > +
> > +	drm_dbg(&kmb->drm,
> > +		"ctrl=%d frame_id=%d section=%d cfg=%x packed=%d\n",
> > +		  ctrl_no, frame_id, section, cfg, ph_cfg->dma_packed);
> > +	kmb_write_mipi(kmb,
> > +		       (MIPI_TXm_HS_FGn_SECTo_PH(ctrl_no, frame_id,
> section)),
> > +		       cfg);
> > +
> > +	/* Unpacked bytes */
> > +
> > +	/* There are 4 frame generators and each fg has 4 sections
> > +	 * There are 2 registers for unpacked bytes (# bytes each
> > +	 * section occupies in memory)
> > +	 * REG_UNPACKED_BYTES0: [15:0]-BYTES0, [31:16]-BYTES1
> > +	 * REG_UNPACKED_BYTES1: [15:0]-BYTES2, [31:16]-BYTES3
> > +	 */
> > +	reg_adr =
> > +	    MIPI_TXm_HS_FGn_SECT_UNPACKED_BYTES0(ctrl_no,
> > +						 frame_id) + (section / 2) * 4;
> > +	kmb_write_bits_mipi(kmb, reg_adr, (section % 2) * 16, 16,
> > +			    unpacked_bytes);
> > +	drm_dbg(&kmb->drm,
> > +		"unpacked_bytes = %d, wordcount = %d\n",
> unpacked_bytes,
> > +		  ph_cfg->wc);
> > +
> > +	/* Line config */
> > +	reg_adr = MIPI_TXm_HS_FGn_SECTo_LINE_CFG(ctrl_no, frame_id,
> section);
> > +	kmb_write_mipi(kmb, reg_adr, height_lines);
> > +	return 0;
> > +}
> > +
> > +static u32 mipi_tx_fg_section_cfg(struct kmb_drm_private *kmb,
> > +				  u8 frame_id, u8 section,
> > +				  struct mipi_tx_frame_section_cfg
> *frame_scfg,
> > +				  u32 *bits_per_pclk, u32 *wc)
> > +{
> > +	u32 ret = 0;
> > +	u32 unpacked_bytes;
> > +	struct mipi_data_type_params data_type_parameters;
> > +	struct mipi_tx_frame_sect_phcfg ph_cfg;
> > +
> > +	ret = mipi_get_datatype_params(frame_scfg->data_type,
> > +				       frame_scfg->data_mode,
> > +				       &data_type_parameters);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Packet width has to be a multiple of the minimum packet width
> > +	 * (in pixels) set for each data type
> > +	 */
> > +	if (frame_scfg->width_pixels %
> > +	    data_type_parameters.size_constraint_pixels != 0)
> > +		return -EINVAL;
> > +
> > +	*wc = compute_wc(frame_scfg->width_pixels,
> > +			 data_type_parameters.size_constraint_pixels,
> > +			 data_type_parameters.size_constraint_bytes);
> > +	unpacked_bytes = compute_unpacked_bytes(*wc,
> > +
> 	data_type_parameters.bits_per_pclk);
> > +	ph_cfg.wc = *wc;
> > +	ph_cfg.data_mode = frame_scfg->data_mode;
> > +	ph_cfg.data_type = frame_scfg->data_type;
> > +	ph_cfg.dma_packed = frame_scfg->dma_packed;
> > +	ph_cfg.vchannel = frame_id;
> > +
> > +	mipi_tx_fg_section_cfg_regs(kmb, frame_id, section,
> > +				    frame_scfg->height_lines,
> > +				    unpacked_bytes, &ph_cfg);
> > +
> > +	/* Caller needs bits_per_clk for additional caluclations */
> > +	*bits_per_pclk = data_type_parameters.bits_per_pclk;
> > +
> > +	return 0;
> > +}
> > +
> > +static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *kmb, u8
> frame_gen,
> > +				struct mipi_tx_frame_timing_cfg *fg_cfg)
> > +{
> > +	u32 sysclk;
> > +	u32 ppl_llp_ratio;
> > +	u32 ctrl_no = MIPI_CTRL6, reg_adr, val, offset;
> > +
> > +	/* 500 Mhz system clock minus 50 to account for the difference in
> > +	 * MIPI clock speed in RTL tests
> > +	 */
> > +	sysclk = kmb->sys_clk_mhz - 50;
> > +
> > +	/* PPL-Pixel Packing Layer, LLP-Low Level Protocol
> > +	 * Frame genartor timing parameters are clocked on the system
> clock,
> > +	 * whereas as the equivalent parameters in the LLP blocks are
> clocked
> > +	 * on LLP Tx clock from the D-PHY - BYTE clock
> > +	 */
> > +
> > +	/* Multiply by 1000 to maintain precision */
> > +	ppl_llp_ratio = ((fg_cfg->bpp / 8) * sysclk * 1000) /
> > +	    ((fg_cfg->lane_rate_mbps / 8) * fg_cfg->active_lanes);
> > +
> > +	drm_dbg(&kmb->drm, "ppl_llp_ratio=%d\n", ppl_llp_ratio);
> > +	drm_dbg(&kmb->drm, "bpp=%d sysclk=%d lane-rate=%d active-
> lanes=%d\n",
> > +		fg_cfg->bpp, sysclk, fg_cfg->lane_rate_mbps,
> > +		 fg_cfg->active_lanes);
> > +
> > +	/* Frame generator number of lines */
> > +	reg_adr = MIPI_TXm_HS_FGn_NUM_LINES(ctrl_no, frame_gen);
> > +	kmb_write_mipi(kmb, reg_adr, fg_cfg->v_active);
> > +
> > +	/* vsync width
> > +	 * There are 2 registers for vsync width (VSA in lines for
> > +	 * channels 0-3)
> > +	 * REG_VSYNC_WIDTH0: [15:0]-VSA for channel0, [31:16]-VSA for
> channel1
> > +	 * REG_VSYNC_WIDTH1: [15:0]-VSA for channel2, [31:16]-VSA for
> channel3
> > +	 */
> > +	offset = (frame_gen % 2) * 16;
> > +	reg_adr = MIPI_TXm_HS_VSYNC_WIDTHn(ctrl_no, frame_gen / 2);
> > +	kmb_write_bits_mipi(kmb, reg_adr, offset, 16, fg_cfg-
> >vsync_width);
> > +
> > +	/* vertical backporch (vbp) */
> > +	reg_adr = MIPI_TXm_HS_V_BACKPORCHESn(ctrl_no, frame_gen /
> 2);
> > +	kmb_write_bits_mipi(kmb, reg_adr, offset, 16, fg_cfg-
> >v_backporch);
> > +
> > +	/* vertical frontporch (vfp) */
> > +	reg_adr = MIPI_TXm_HS_V_FRONTPORCHESn(ctrl_no, frame_gen /
> 2);
> > +	kmb_write_bits_mipi(kmb, reg_adr, offset, 16, fg_cfg-
> >v_frontporch);
> > +
> > +	/* vertical active (vactive) */
> > +	reg_adr = MIPI_TXm_HS_V_ACTIVEn(ctrl_no, frame_gen / 2);
> > +	kmb_write_bits_mipi(kmb, reg_adr, offset, 16, fg_cfg->v_active);
> > +
> > +	/* hsync width */
> > +	reg_adr = MIPI_TXm_HS_HSYNC_WIDTHn(ctrl_no, frame_gen);
> > +	kmb_write_mipi(kmb, reg_adr,
> > +		       (fg_cfg->hsync_width * ppl_llp_ratio) / 1000);
> > +
> > +	/* horizontal backporch (hbp) */
> > +	reg_adr = MIPI_TXm_HS_H_BACKPORCHn(ctrl_no, frame_gen);
> > +	kmb_write_mipi(kmb, reg_adr,
> > +		       (fg_cfg->h_backporch * ppl_llp_ratio) / 1000);
> > +
> > +	/* horizontal frontporch (hfp) */
> > +	reg_adr = MIPI_TXm_HS_H_FRONTPORCHn(ctrl_no, frame_gen);
> > +	kmb_write_mipi(kmb, reg_adr,
> > +		       (fg_cfg->h_frontporch * ppl_llp_ratio) / 1000);
> > +
> > +	/* horizontal active (ha) */
> > +	reg_adr = MIPI_TXm_HS_H_ACTIVEn(ctrl_no, frame_gen);
> > +
> > +	/* convert h_active which is wc in bytes to cycles */
> > +	val = (fg_cfg->h_active * sysclk * 1000) /
> > +	    ((fg_cfg->lane_rate_mbps / 8) * fg_cfg->active_lanes);
> > +	val /= 1000;
> > +	kmb_write_mipi(kmb, reg_adr, val);
> > +
> > +	/* llp hsync width */
> > +	reg_adr = MIPI_TXm_HS_LLP_HSYNC_WIDTHn(ctrl_no, frame_gen);
> > +	kmb_write_mipi(kmb, reg_adr, fg_cfg->hsync_width * (fg_cfg->bpp
> / 8));
> > +
> > +	/* llp h backporch */
> > +	reg_adr = MIPI_TXm_HS_LLP_H_BACKPORCHn(ctrl_no, frame_gen);
> > +	kmb_write_mipi(kmb, reg_adr, fg_cfg->h_backporch * (fg_cfg->bpp
> / 8));
> > +
> > +	/* llp h frontporch */
> > +	reg_adr = MIPI_TXm_HS_LLP_H_FRONTPORCHn(ctrl_no,
> frame_gen);
> > +	kmb_write_mipi(kmb, reg_adr,
> > +		       fg_cfg->h_frontporch * (fg_cfg->bpp / 8));
> > +}
> > +
> > +static void mipi_tx_fg_cfg(struct kmb_drm_private *kmb, u8
> frame_gen,
> > +			   u8 active_lanes, u32 bpp, u32 wc,
> > +			   u32 lane_rate_mbps, struct mipi_tx_frame_cfg
> *fg_cfg)
> > +{
> > +	u32 i, fg_num_lines = 0;
> > +	struct mipi_tx_frame_timing_cfg fg_t_cfg;
> > +
> > +	/* Calculate the total frame generator number of
> > +	 * lines based on it's active sections
> > +	 */
> > +	for (i = 0; i < MIPI_TX_FRAME_GEN_SECTIONS; i++) {
> > +		if (fg_cfg->sections[i])
> > +			fg_num_lines += fg_cfg->sections[i]->height_lines;
> > +	}
> > +
> > +	fg_t_cfg.bpp = bpp;
> > +	fg_t_cfg.lane_rate_mbps = lane_rate_mbps;
> > +	fg_t_cfg.hsync_width = fg_cfg->hsync_width;
> > +	fg_t_cfg.h_backporch = fg_cfg->h_backporch;
> > +	fg_t_cfg.h_frontporch = fg_cfg->h_frontporch;
> > +	fg_t_cfg.h_active = wc;
> > +	fg_t_cfg.vsync_width = fg_cfg->vsync_width;
> > +	fg_t_cfg.v_backporch = fg_cfg->v_backporch;
> > +	fg_t_cfg.v_frontporch = fg_cfg->v_frontporch;
> > +	fg_t_cfg.v_active = fg_num_lines;
> > +	fg_t_cfg.active_lanes = active_lanes;
> > +
> > +	/* Apply frame generator timing setting */
> > +	mipi_tx_fg_cfg_regs(kmb, frame_gen, &fg_t_cfg);
> > +}
> > +
> > +static void mipi_tx_multichannel_fifo_cfg(struct kmb_drm_private
> *kmb,
> > +					  u8 active_lanes, u8 vchannel_id)
> > +{
> > +	u32 fifo_size, fifo_rthreshold;
> > +	u32 ctrl_no = MIPI_CTRL6;
> > +
> > +	/* Clear all mc fifo channel sizes and thresholds */
> > +	kmb_write_mipi(kmb, MIPI_TX_HS_MC_FIFO_CTRL_EN, 0);
> > +	kmb_write_mipi(kmb, MIPI_TX_HS_MC_FIFO_CHAN_ALLOC0, 0);
> > +	kmb_write_mipi(kmb, MIPI_TX_HS_MC_FIFO_CHAN_ALLOC1, 0);
> > +	kmb_write_mipi(kmb, MIPI_TX_HS_MC_FIFO_RTHRESHOLD0, 0);
> > +	kmb_write_mipi(kmb, MIPI_TX_HS_MC_FIFO_RTHRESHOLD1, 0);
> > +
> > +	fifo_size = ((active_lanes > MIPI_D_LANES_PER_DPHY) ?
> > +		     MIPI_CTRL_4LANE_MAX_MC_FIFO_LOC :
> > +		     MIPI_CTRL_2LANE_MAX_MC_FIFO_LOC) - 1;
> > +
> > +	/* MC fifo size for virtual channels 0-3
> > +	 * REG_MC_FIFO_CHAN_ALLOC0: [8:0]-channel0, [24:16]-channel1
> > +	 * REG_MC_FIFO_CHAN_ALLOC1: [8:0]-2, [24:16]-channel3
> > +	 */
> > +	SET_MC_FIFO_CHAN_ALLOC(kmb, ctrl_no, vchannel_id, fifo_size);
> > +
> > +	/* Set threshold to half the fifo size, actual size=size*16 */
> > +	fifo_rthreshold = ((fifo_size) * 8) & BIT_MASK_16;
> > +	SET_MC_FIFO_RTHRESHOLD(kmb, ctrl_no, vchannel_id,
> fifo_rthreshold);
> > +
> > +	/* Enable the MC FIFO channel corresponding to the Virtual Channel
> */
> > +	kmb_set_bit_mipi(kmb,
> MIPI_TXm_HS_MC_FIFO_CTRL_EN(ctrl_no),
> > +			 vchannel_id);
> > +}
> > +
> > +static void mipi_tx_ctrl_cfg(struct kmb_drm_private *kmb, u8 fg_id,
> > +			     struct mipi_ctrl_cfg *ctrl_cfg)
> > +{
> > +	u32 sync_cfg = 0, ctrl = 0, fg_en;
> > +	u32 ctrl_no = MIPI_CTRL6;
> > +
> > +	/* MIPI_TX_HS_SYNC_CFG */
> > +	if (ctrl_cfg->tx_ctrl_cfg.line_sync_pkt_en)
> > +		sync_cfg |= LINE_SYNC_PKT_ENABLE;
> > +	if (ctrl_cfg->tx_ctrl_cfg.frame_counter_active)
> > +		sync_cfg |= FRAME_COUNTER_ACTIVE;
> > +	if (ctrl_cfg->tx_ctrl_cfg.line_counter_active)
> > +		sync_cfg |= LINE_COUNTER_ACTIVE;
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->v_blanking)
> > +		sync_cfg |= DSI_V_BLANKING;
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hsa_blanking)
> > +		sync_cfg |= DSI_HSA_BLANKING;
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hbp_blanking)
> > +		sync_cfg |= DSI_HBP_BLANKING;
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hfp_blanking)
> > +		sync_cfg |= DSI_HFP_BLANKING;
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->sync_pulse_eventn)
> > +		sync_cfg |= DSI_SYNC_PULSE_EVENTN;
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->lpm_first_vsa_line)
> > +		sync_cfg |= DSI_LPM_FIRST_VSA_LINE;
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->lpm_last_vfp_line)
> > +		sync_cfg |= DSI_LPM_LAST_VFP_LINE;
> > +
> > +	/* Enable frame generator */
> > +	fg_en = 1 << fg_id;
> > +	sync_cfg |= FRAME_GEN_EN(fg_en);
> > +
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_always_use_hact)
> > +		sync_cfg |= ALWAYS_USE_HACT(fg_en);
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_hact_wait_stop)
> > +		sync_cfg |= HACT_WAIT_STOP(fg_en);
> > +
> > +	drm_dbg(&kmb->drm, "sync_cfg=%d fg_en=%d\n", sync_cfg,
> fg_en);
> > +
> > +	/* MIPI_TX_HS_CTRL */
> > +
> > +	/* type:DSI, source:LCD */
> > +	ctrl = HS_CTRL_EN | TX_SOURCE;
> > +	ctrl |= LCD_VC(fg_id);
> > +	ctrl |= ACTIVE_LANES(ctrl_cfg->active_lanes - 1);
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->eotp_en)
> > +		ctrl |= DSI_EOTP_EN;
> > +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hfp_blank_en)
> > +		ctrl |= DSI_CMD_HFP_EN;
> > +
> > +	/*67 ns stop time */
> > +	ctrl |= HSEXIT_CNT(0x43);
> > +
> > +	kmb_write_mipi(kmb, MIPI_TXm_HS_SYNC_CFG(ctrl_no),
> sync_cfg);
> > +	kmb_write_mipi(kmb, MIPI_TXm_HS_CTRL(ctrl_no), ctrl);
> > +}
> > +
> > +#ifdef MIPI_TX_TEST_PATTERN_GENERATION
> > +static void mipi_tx_hs_tp_gen(struct kmb_drm_private *kmb, int vc,
> > +			      int tp_sel, u32 stripe_width, u32 color0,
> > +			      u32 color1, u32 ctrl_no)
> > +{
> > +	int val = 0;
> > +
> > +	/* Select test pattern mode on the virtual channel */
> > +	val = TP_SEL_VCm(vc, tp_sel);
> > +
> > +	/* Configure test pattern colors */
> > +	kmb_write_mipi(kmb, MIPI_TXm_HS_TEST_PAT_COLOR0(ctrl_no),
> color0);
> > +	kmb_write_mipi(kmb, MIPI_TXm_HS_TEST_PAT_COLOR1(ctrl_no),
> color1);
> > +
> > +	/* Enable test pattern generation on the virtual channel */
> > +	val |= TP_EN_VCm(vc);
> > +	kmb_write_mipi(kmb, MIPI_TXm_HS_TEST_PAT_CTRL(ctrl_no),
> val);
> > +}
> > +#endif
> > +
> > +static u32 mipi_tx_init_cntrl(struct kmb_drm_private *kmb,
> > +			      struct mipi_ctrl_cfg *ctrl_cfg)
> > +{
> > +	u32 ret = 0;
> > +	u8 active_vchannels = 0;
> > +	u8 frame_id, sect;
> > +	u32 bits_per_pclk = 0;
> > +	u32 word_count = 0;
> > +	struct mipi_tx_frame_cfg *frame;
> > +
> > +	/* This is the order to initialize MIPI TX:
> > +	 * 1. set frame section parameters
> > +	 * 2. set frame specific parameters
> > +	 * 3. connect lcd to mipi
> > +	 * 4. multi channel fifo cfg
> > +	 * 5. set mipitxcctrlcfg
> > +	 */
> > +
> > +	for (frame_id = 0; frame_id < 4; frame_id++) {
> > +		frame = ctrl_cfg->tx_ctrl_cfg.frames[frame_id];
> > +
> > +		/* Find valid frame, assume only one valid frame */
> > +		if (!frame)
> > +			continue;
> > +
> > +		/* Frame Section configuration */
> > +		/* TODO - assume there is only one valid section in a frame,
> > +		 * so bits_per_pclk and word_count are only set once
> > +		 */
> > +		for (sect = 0; sect < MIPI_CTRL_VIRTUAL_CHANNELS;
> sect++) {
> > +			if (!frame->sections[sect])
> > +				continue;
> > +
> > +			ret = mipi_tx_fg_section_cfg(kmb, frame_id, sect,
> > +						     frame->sections[sect],
> > +						     &bits_per_pclk,
> > +						     &word_count);
> > +			if (ret)
> > +				return ret;
> > +		}
> > +
> > +		/* Set frame specific parameters */
> > +		mipi_tx_fg_cfg(kmb, frame_id, ctrl_cfg->active_lanes,
> > +			       bits_per_pclk, word_count,
> > +			       ctrl_cfg->lane_rate_mbps, frame);
> > +
> > +		active_vchannels++;
> > +
> > +		/* Stop iterating as only one virtual channel
> > +		 * shall be used for LCD connection
> > +		 */
> > +		break;
> > +	}
> > +
> > +	if (active_vchannels == 0)
> > +		return -EINVAL;
> > +	/* Multi-Channel FIFO Configuration */
> > +	mipi_tx_multichannel_fifo_cfg(kmb, ctrl_cfg->active_lanes,
> frame_id);
> > +
> > +	/* Frame Generator Enable */
> > +	mipi_tx_ctrl_cfg(kmb, frame_id, ctrl_cfg);
> > +
> > +#ifdef MIPI_TX_TEST_PATTERN_GENERATION
> > +	mipi_tx_hs_tp_gen(kmb, 0, MIPI_TX_HS_TP_V_STRIPES,
> > +			  0x8, 0xff, 0xff00, MIPI_CTRL6);
> > +#endif
> > +
> > +	drm_dbg(&kmb->drm, "IRQ_STATUS = 0x%x\n",
> > +		GET_MIPI_TX_HS_IRQ_STATUS(kmb, MIPI_CTRL6));
> > +
> > +	return ret;
> > +}
> > +
> > +#ifdef DPHY_READ_TESTCODE
> > +int dphy_read_testcode(struct kmb_drm_private *kmb, int dphy_sel,
> > +		       int test_code)
> > +{
> > +	u32 reg_wr_data;
> > +	u32 reg_rd_data;
> > +	int data;
> > +
> > +	reg_wr_data = dphy_sel;
> > +	kmb_write_mipi(kmb, DPHY_TEST_CTRL1, reg_wr_data);
> > +
> > +	data = 0;
> > +	reg_wr_data = 0;
> > +	reg_rd_data = 0;
> > +
> > +	if (((dphy_sel >> 0 & 0x1) == 1) | ((dphy_sel >> 4 & 0x1) == 1) |
> > +	    ((dphy_sel >> 8 & 0x1) == 1))
> > +		reg_wr_data |= data << 0;
> > +	if (((dphy_sel >> 1 & 0x1) == 1) | ((dphy_sel >> 5 & 0x1) == 1) |
> > +	    ((dphy_sel >> 9 & 0x1) == 1))
> > +		reg_wr_data |= data << 8;
> > +	if (((dphy_sel >> 2 & 0x1) == 1) | ((dphy_sel >> 6 & 0x1) == 1) |
> > +	    ((dphy_sel >> 10 & 0x1) == 1))
> > +		reg_wr_data |= data << 16;
> > +	if (((dphy_sel >> 3 & 0x1) == 1) | ((dphy_sel >> 7 & 0x1) == 1) |
> > +	    ((dphy_sel >> 11 & 0x1) == 1))
> > +		reg_wr_data |= data << 24;
> > +
> > +	if ((dphy_sel >> 0 & 0xf) > 0)
> > +		kmb_write_mipi(kmb, DPHY_TEST_DIN0_3, reg_wr_data);
> > +	if ((dphy_sel >> 4 & 0xf) > 0)
> > +		kmb_write_mipi(kmb, DPHY_TEST_DIN4_7, reg_wr_data);
> > +	if ((dphy_sel >> 8 & 0x3) > 0)
> > +		kmb_write_mipi(kmb, DPHY_TEST_DIN8_9, reg_wr_data);
> > +
> > +	reg_wr_data = 0;
> > +	reg_wr_data = (dphy_sel | dphy_sel << 12);
> > +	kmb_write_mipi(kmb, DPHY_TEST_CTRL1, reg_wr_data);
> > +
> > +	reg_wr_data = 0;
> > +	reg_wr_data = dphy_sel << 12;
> > +	kmb_write_mipi(kmb, DPHY_TEST_CTRL1, reg_wr_data);
> > +
> > +	reg_wr_data = 0;
> > +	kmb_write_mipi(kmb, DPHY_TEST_CTRL1, reg_wr_data);
> > +
> > +	data = test_code >> 8 & 0xf;
> > +	reg_wr_data = 0;
> > +
> > +	if (((dphy_sel >> 0 & 0x1) == 1) | ((dphy_sel >> 4 & 0x1) == 1) |
> > +	    ((dphy_sel >> 8 & 0x1) == 1))
> > +		reg_wr_data |= data << 0;
> > +	if (((dphy_sel >> 1 & 0x1) == 1) | ((dphy_sel >> 5 & 0x1) == 1) |
> > +	    ((dphy_sel >> 9 & 0x1) == 1))
> > +		reg_wr_data |= data << 8;
> > +	if (((dphy_sel >> 2 & 0x1) == 1) | ((dphy_sel >> 6 & 0x1) == 1) |
> > +	    ((dphy_sel >> 10 & 0x1) == 1))
> > +		reg_wr_data |= data << 16;
> > +	if (((dphy_sel >> 3 & 0x1) == 1) | ((dphy_sel >> 7 & 0x1) == 1) |
> > +	    ((dphy_sel >> 11 & 0x1) == 1))
> > +		reg_wr_data |= data << 24;
> > +
> > +	if ((dphy_sel >> 0 & 0xf) > 0)
> > +		kmb_write_mipi(kmb, DPHY_TEST_DIN0_3, reg_wr_data);
> > +	if ((dphy_sel >> 4 & 0xf) > 0)
> > +		kmb_write_mipi(kmb, DPHY_TEST_DIN4_7, reg_wr_data);
> > +	if ((dphy_sel >> 8 & 0x3) > 0)
> > +		kmb_write_mipi(kmb, DPHY_TEST_DIN8_9, reg_wr_data);
> > +
> > +	reg_wr_data = 0;
> > +	reg_wr_data = dphy_sel;
> > +	kmb_write_mipi(kmb, DPHY_TEST_CTRL1, reg_wr_data);
> > +
> > +	data = test_code & 0xff;
> > +	reg_wr_data = 0;
> > +
> > +	if (((dphy_sel >> 0 & 0x1) == 1) | ((dphy_sel >> 4 & 0x1) == 1) |
> > +	    ((dphy_sel >> 8 & 0x1) == 1))
> > +		reg_wr_data |= data << 0;
> > +	if (((dphy_sel >> 1 & 0x1) == 1) | ((dphy_sel >> 5 & 0x1) == 1) |
> > +	    ((dphy_sel >> 9 & 0x1) == 1))
> > +		reg_wr_data |= data << 8;
> > +	if (((dphy_sel >> 2 & 0x1) == 1) | ((dphy_sel >> 6 & 0x1) == 1) |
> > +	    ((dphy_sel >> 10 & 0x1) == 1))
> > +		reg_wr_data |= data << 16;
> > +	if (((dphy_sel >> 3 & 0x1) == 1) | ((dphy_sel >> 7 & 0x1) == 1) |
> > +	    ((dphy_sel >> 11 & 0x1) == 1))
> > +		reg_wr_data |= data << 24;
> > +
> > +	if ((dphy_sel >> 0 & 0xf) > 0)
> > +		kmb_write_mipi(kmb, DPHY_TEST_DIN0_3, reg_wr_data);
> > +	if ((dphy_sel >> 4 & 0xf) > 0)
> > +		kmb_write_mipi(kmb, DPHY_TEST_DIN4_7, reg_wr_data);
> > +	if ((dphy_sel >> 8 & 0x3) > 0)
> > +		kmb_write_mipi(kmb, DPHY_TEST_DIN8_9, reg_wr_data);
> > +
> > +	reg_wr_data = 0;
> > +	reg_wr_data = (dphy_sel | dphy_sel << 12);
> > +	kmb_write_mipi(kmb, DPHY_TEST_CTRL1, reg_wr_data);
> > +
> > +	reg_wr_data = 0;
> > +	reg_wr_data = dphy_sel << 12;
> > +	kmb_write_mipi(kmb, DPHY_TEST_CTRL1, reg_wr_data);
> > +
> > +	reg_wr_data = 0;
> > +	kmb_write_mipi(kmb, DPHY_TEST_CTRL1, reg_wr_data);
> > +
> > +	if ((dphy_sel >> 0 & 0xf) > 0)
> > +		reg_rd_data = kmb_read_mipi(kmb,
> DPHY_TEST_DOUBT0_3);
> > +	if ((dphy_sel >> 4 & 0xf) > 0)
> > +		reg_rd_data = kmb_read_mipi(kmb,
> DPHY_TEST_DOUBT4_7);
> > +	if ((dphy_sel >> 8 & 0x3) > 0)
> > +		reg_rd_data = kmb_read_mipi(kmb,
> DPHY_TEST_DOUBT8_9);
> > +
> > +	if (((dphy_sel >> 0 & 0x1) == 1) | ((dphy_sel >> 4 & 0x1) == 1) |
> > +	    ((dphy_sel >> 8 & 0x1) == 1))
> > +		data = reg_rd_data >> 0;
> > +	if (((dphy_sel >> 1 & 0x1) == 1) | ((dphy_sel >> 5 & 0x1) == 1) |
> > +	    ((dphy_sel >> 9 & 0x1) == 1))
> > +		data = reg_rd_data >> 8;
> > +	if (((dphy_sel >> 2 & 0x1) == 1) | ((dphy_sel >> 6 & 0x1) == 1) |
> > +	    ((dphy_sel >> 10 & 0x1) == 1))
> > +		data = reg_rd_data >> 16;
> > +	if (((dphy_sel >> 3 & 0x1) == 1) | ((dphy_sel >> 7 & 0x1) == 1) |
> > +	    ((dphy_sel >> 11 & 0x1) == 1))
> > +		data = reg_rd_data >> 24;
> > +
> > +	return data;
> > +}
> > +#endif
> > +
> > +static void test_mode_send(struct kmb_drm_private *kmb, u32
> dphy_no,
> > +			   u32 test_code, u32 test_data)
> > +{
> > +	if (test_code != TEST_CODE_FSM_CONTROL)
> > +		drm_dbg(&kmb->drm,
> > +			"test_code = %02x, test_data = %08x\n", test_code,
> > +			 test_data);
> > +	/* Steps to send test code:
> > +	 * - set testclk HIGH
> > +	 * - set testdin with test code
> > +	 * - set testen HIGH
> > +	 * - set testclk LOW
> > +	 * - set testen LOW
> > +	 */
> > +
> > +	/* Set testclk high */
> > +	SET_DPHY_TEST_CTRL1_CLK(kmb, dphy_no);
> > +
> > +	/* Set testdin */
> > +	SET_TEST_DIN0_3(kmb, dphy_no, test_code);
> > +
> > +	/* Set testen high */
> > +	SET_DPHY_TEST_CTRL1_EN(kmb, dphy_no);
> > +
> > +	/* Set testclk low */
> > +	CLR_DPHY_TEST_CTRL1_CLK(kmb, dphy_no);
> > +
> > +	/* Set testen low */
> > +	CLR_DPHY_TEST_CTRL1_EN(kmb, dphy_no);
> > +
> > +	if (test_code) {
> > +		/*  Steps to send test data:
> > +		 * - set testen LOW
> > +		 * - set testclk LOW
> > +		 * - set testdin with data
> > +		 * - set testclk HIGH
> > +		 */
> > +
> > +		/* Set testen low */
> > +		CLR_DPHY_TEST_CTRL1_EN(kmb, dphy_no);
> > +
> > +		/* Set testclk low */
> > +		CLR_DPHY_TEST_CTRL1_CLK(kmb, dphy_no);
> > +
> > +		/* Set data in testdin */
> > +		kmb_write_mipi(kmb,
> > +			       DPHY_TEST_DIN0_3 + ((dphy_no / 0x4) * 0x4),
> > +			       test_data << ((dphy_no % 4) * 8));
> > +
> > +		/* Set testclk high */
> > +		SET_DPHY_TEST_CTRL1_CLK(kmb, dphy_no);
> > +	}
> > +}
> > +
> > +static inline void
> > +	set_test_mode_src_osc_freq_target_low_bits(struct
> kmb_drm_private *kmb,
> > +						   u32 dphy_no,
> > +						   u32 freq)
> > +{
> > +	/* Typical rise/fall time=166, refer Table 1207 databook,
> > +	 * sr_osc_freq_target[7:0]
> > +	 */
> > +	test_mode_send(kmb, dphy_no,
> TEST_CODE_SLEW_RATE_DDL_CYCLES,
> > +		       (freq & 0x7f));
> > +}
> > +
> > +static inline void
> > +	set_test_mode_src_osc_freq_target_hi_bits(struct
> kmb_drm_private *kmb,
> > +						  u32 dphy_no,
> > +						  u32 freq)
> > +{
> > +	u32 data;
> > +
> > +	/* Flag this as high nibble */
> > +	data = ((freq >> 6) & 0x1f) | (1 << 7);
> > +
> > +	/* Typical rise/fall time=166, refer Table 1207 databook,
> > +	 * sr_osc_freq_target[11:7]
> > +	 */
> > +	test_mode_send(kmb, dphy_no,
> TEST_CODE_SLEW_RATE_DDL_CYCLES, data);
> > +}
> > +
> > +static void mipi_tx_get_vco_params(struct vco_params *vco)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(vco_table); i++) {
> > +		if (vco->freq < vco_table[i].freq) {
> > +			*vco = vco_table[i];
> > +			return;
> > +		}
> > +	}
> > +
> > +	WARN_ONCE(1, "Invalid vco freq = %u for PLL setup\n", vco->freq);
> > +}
> > +
> > +static void mipi_tx_pll_setup(struct kmb_drm_private *kmb, u32
> dphy_no,
> > +			      u32 ref_clk_mhz, u32 target_freq_mhz)
> > +{
> > +	u32 best_n = 0, best_m = 0;
> > +	u32 n = 0, m = 0, div = 0, delta, freq = 0, t_freq;
> > +	u32 best_freq_delta = 3000;
> > +
> > +	/* pll_ref_clk: - valid range: 2~64 MHz; Typically 24 MHz
> > +	 * Fvco: - valid range: 320~1250 MHz (Gen3 D-PHY)
> > +	 * Fout: - valid range: 40~1250 MHz (Gen3 D-PHY)
> > +	 * n: - valid range [0 15]
> > +	 * N: - N = n + 1
> > +	 *      -valid range: [1 16]
> > +	 *      -conditions: - (pll_ref_clk / N) >= 2 MHz
> > +	 *              -(pll_ref_clk / N) <= 8 MHz
> > +	 * m: valid range [62 623]
> > +	 * M: - M = m + 2
> > +	 *      -valid range [64 625]
> > +	 *      -Fvco = (M/N) * pll_ref_clk
> > +	 */
> > +	struct vco_params vco_p = {
> > +		.range = 0,
> > +		.divider = 1,
> > +	};
> > +
> > +	vco_p.freq = target_freq_mhz;
> > +	mipi_tx_get_vco_params(&vco_p);
> > +
> > +	/* Search pll n parameter */
> > +	for (n = PLL_N_MIN; n <= PLL_N_MAX; n++) {
> > +		/* Calculate the pll input frequency division ratio
> > +		 * multiply by 1000 for precision -
> > +		 * no floating point, add n for rounding
> > +		 */
> > +		div = ((ref_clk_mhz * 1000) + n) / (n + 1);
> > +
> > +		/* Found a valid n parameter */
> > +		if ((div < 2000 || div > 8000))
> > +			continue;
> > +
> > +		/* Search pll m parameter */
> > +		for (m = PLL_M_MIN; m <= PLL_M_MAX; m++) {
> > +			/* Calculate the Fvco(DPHY PLL output frequency)
> > +			 * using the current n,m params
> > +			 */
> > +			freq = div * (m + 2);
> > +			freq /= 1000;
> > +
> > +			/* Trim the potential pll freq to max supported */
> > +			if (freq > PLL_FVCO_MAX)
> > +				continue;
> > +
> > +			delta = abs(freq - target_freq_mhz);
> > +
> > +			/* Select the best (closest to target pll freq)
> > +			 * n,m parameters so far
> > +			 */
> > +			if (delta < best_freq_delta) {
> > +				best_n = n;
> > +				best_m = m;
> > +				best_freq_delta = delta;
> > +			}
> > +		}
> > +	}
> > +
> > +	/* Program vco_cntrl parameter
> > +	 * PLL_VCO_Control[5:0] = pll_vco_cntrl_ovr,
> > +	 * PLL_VCO_Control[6]   = pll_vco_cntrl_ovr_en
> > +	 */
> > +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_VCO_CTRL,
> (vco_p.range
> > +								| (1 << 6)));
> > +
> > +	/* Program m, n pll parameters */
> > +	drm_dbg(&kmb->drm, "m = %d n = %d\n", best_m, best_n);
> > +
> > +	/* PLL_Input_Divider_Ratio[3:0] = pll_n_ovr */
> > +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_INPUT_DIVIDER,
> > +		       (best_n & 0x0f));
> > +
> > +	/* m - low nibble PLL_Loop_Divider_Ratio[4:0]
> > +	 * pll_m_ovr[4:0]
> > +	 */
> > +	test_mode_send(kmb, dphy_no,
> TEST_CODE_PLL_FEEDBACK_DIVIDER,
> > +		       (best_m & 0x1f));
> > +
> > +	/* m - high nibble PLL_Loop_Divider_Ratio[4:0]
> > +	 * pll_m_ovr[9:5]
> > +	 */
> > +	test_mode_send(kmb, dphy_no,
> TEST_CODE_PLL_FEEDBACK_DIVIDER,
> > +		       ((best_m >> 5) & 0x1f) |
> PLL_FEEDBACK_DIVIDER_HIGH);
> > +
> > +	/* Enable overwrite of n,m parameters :pll_n_ovr_en,
> pll_m_ovr_en */
> > +	test_mode_send(kmb, dphy_no,
> TEST_CODE_PLL_OUTPUT_CLK_SEL,
> > +		       (PLL_N_OVR_EN | PLL_M_OVR_EN));
> > +
> > +	/* Program Charge-Pump parameters */
> > +
> > +	/* pll_prop_cntrl-fixed values for prop_cntrl from DPHY doc */
> > +	t_freq = target_freq_mhz * vco_p.divider;
> > +	test_mode_send(kmb, dphy_no,
> > +
> TEST_CODE_PLL_PROPORTIONAL_CHARGE_PUMP_CTRL,
> > +		       ((t_freq > 1150) ? 0x0C : 0x0B));
> > +
> > +	/* pll_int_cntrl-fixed value for int_cntrl from DPHY doc */
> > +	test_mode_send(kmb, dphy_no,
> TEST_CODE_PLL_INTEGRAL_CHARGE_PUMP_CTRL,
> > +		       0x00);
> > +
> > +	/* pll_gmp_cntrl-fixed value for gmp_cntrl from DPHY doci */
> > +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_GMP_CTRL,
> 0x10);
> > +
> > +	/* pll_cpbias_cntrl-fixed value for cpbias_cntrl from DPHY doc */
> > +	test_mode_send(kmb, dphy_no,
> TEST_CODE_PLL_CHARGE_PUMP_BIAS, 0x10);
> > +
> > +	/* pll_th1 -Lock Detector Phase error threshold,
> > +	 * document gives fixed value
> > +	 */
> > +	test_mode_send(kmb, dphy_no,
> TEST_CODE_PLL_PHASE_ERR_CTRL, 0x02);
> > +
> > +	/* PLL Lock Configuration */
> > +
> > +	/* pll_th2 - Lock Filter length, document gives fixed value */
> > +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_LOCK_FILTER,
> 0x60);
> > +
> > +	/* pll_th3- PLL Unlocking filter, document gives fixed value */
> > +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_UNLOCK_FILTER,
> 0x03);
> > +
> > +	/* pll_lock_sel-PLL Lock Detector Selection,
> > +	 * document gives fixed value
> > +	 */
> > +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_LOCK_DETECTOR,
> 0x02);
> > +}
> > +
> > +#ifdef DPHY_GET_FSM
> > +static void dphy_get_fsm(struct kmb_drm_private *kmb, u32 dphy_no)
> > +{
> > +	test_mode_send(kmb, dphy_no, TEST_CODE_FSM_CONTROL,
> 0x80);
> > +
> > +	drm_dbg(&kmb->drm, "dphy %d fsm_state = 0%x\n", dphy_no,
> > +		kmb_read_mipi(kmb, DPHY_TEST_DOUBT4_7));
> > +}
> > +#endif
> > +
> > +static void dphy_init_sequence(struct kmb_drm_private *kmb,
> > +			       struct mipi_ctrl_cfg *cfg, u32 dphy_no,
> > +			       int active_lanes, enum dphy_mode mode)
> > +{
> 
> This function is too long.
> Try to:
> - drop irrelevant debug prints
> - make a few helpers - maybe the long if () else if () else could cll
>   functions.
> 
> > +	u32 test_code = 0, test_data = 0, val;
> > +	int i = 0;
> > +
> > +	drm_info(&kmb->drm,
> > +		 "dphy=%d mode=%d active_lanes=%d\n", dphy_no, mode,
> > +		 active_lanes);
> > +	drm_dbg(&kmb->drm, "MIPI_DPHY_STAT0_4_7 = 0x%x)\n",
> > +		kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7));
> > +
> > +	/* Set D-PHY in shutdown mode */
> > +	/* Assert RSTZ signal */
> > +	CLR_DPHY_INIT_CTRL0(kmb, dphy_no, RESETZ);
> > +
> > +	/* Assert SHUTDOWNZ signal */
> > +	CLR_DPHY_INIT_CTRL0(kmb, dphy_no, SHUTDOWNZ);
> > +	val = kmb_read_mipi(kmb, DPHY_INIT_CTRL0);
> > +
> > +	drm_dbg(&kmb->drm, "DPHY_INIT_CTRL0 = 0x%x\n", val);
> > +
> > +	/* Init D-PHY_n
> > +	 * Pulse testclear signal to make sure the d-phy configuration
> > +	 * starts from a clean base
> > +	 */
> > +	CLR_DPHY_TEST_CTRL0(kmb, dphy_no);
> > +	ndelay(15);
> > +	SET_DPHY_TEST_CTRL0(kmb, dphy_no);
> > +	ndelay(15);
> > +	CLR_DPHY_TEST_CTRL0(kmb, dphy_no);
> > +	ndelay(15);
> > +
> > +	drm_dbg(&kmb->drm, "DPHY_TEST_CTRL0=0x%x\n",
> > +		kmb_read_mipi(kmb, DPHY_TEST_CTRL0));
> > +
> > +	/* Set mastermacro bit - Master or slave mode */
> > +	test_code = TEST_CODE_MULTIPLE_PHY_CTRL;
> > +
> > +	/* DPHY has its own clock lane enabled (master) */
> > +	if (mode == MIPI_DPHY_MASTER)
> > +		test_data = 0x01;
> > +	else
> > +		test_data = 0x00;
> > +
> > +	/* Send the test code and data */
> > +	test_mode_send(kmb, dphy_no, test_code, test_data);
> > +
> > +	/* Set the lane data rate */
> > +	for (i = 0; i < MIPI_DPHY_DEFAULT_BIT_RATES; i++) {
> > +		if (mipi_hs_freq_range[i].default_bit_rate_mbps <
> > +		    cfg->lane_rate_mbps)
> > +			continue;
> > +
> > +		/* Send the test code and data */
> > +		/* bit[6:0] = hsfreqrange_ovr bit[7] = hsfreqrange_ovr_en
> */
> > +		test_code = TEST_CODE_HS_FREQ_RANGE_CFG;
> > +		test_data = (mipi_hs_freq_range[i].hsfreqrange_code &
> 0x7f) |
> > +		    (1 << 7);
> > +		test_mode_send(kmb, dphy_no, test_code, test_data);
> > +		break;
> > +	}
> > +
> > +	/* High-Speed Tx Slew Rate Calibration
> > +	 * BitRate: > 1.5 Gbps && <= 2.5 Gbps: slew rate control OFF
> > +	 */
> > +	if (cfg->lane_rate_mbps > 1500) {
> > +		/* Bypass slew rate calibration algorithm
> > +		 * bits[1:0} srcal_en_ovr_en, srcal_en_ovr
> > +		 */
> > +		test_code = TEST_CODE_SLEW_RATE_OVERRIDE_CTRL;
> > +		test_data = 0x02;
> > +		test_mode_send(kmb, dphy_no, test_code, test_data);
> > +
> > +		/* Disable slew rate calibration */
> > +		test_code = TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL;
> > +		test_data = 0x00;
> > +		test_mode_send(kmb, dphy_no, test_code, test_data);
> > +	} else if (cfg->lane_rate_mbps > 1000) {
> > +		/* BitRate: > 1 Gbps && <= 1.5 Gbps: - slew rate control ON
> > +		 * typical rise/fall times: 166 ps
> > +		 */
> > +
> > +		/* Do not bypass slew rate calibration algorithm
> > +		 * bits[1:0}=srcal_en_ovr_en, srcal_en_ovr, bit[6]=sr_range
> > +		 */
> > +		test_code = TEST_CODE_SLEW_RATE_OVERRIDE_CTRL;
> > +		test_data = (0x03 | (1 << 6));
> > +		test_mode_send(kmb, dphy_no, test_code, test_data);
> > +
> > +		/* Enable slew rate calibration */
> > +		test_code = TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL;
> > +		test_data = 0x01;
> > +		test_mode_send(kmb, dphy_no, test_code, test_data);
> > +
> > +		/* Set sr_osc_freq_target[6:0] low nibble
> > +		 * typical rise/fall time=166, refer Table 1207 databook
> > +		 */
> > +		test_code = TEST_CODE_SLEW_RATE_DDL_CYCLES;
> > +		test_data = (0x72f & 0x7f);
> > +		test_mode_send(kmb, dphy_no, test_code, test_data);
> > +
> > +		/* Set sr_osc_freq_target[11:7] high nibble
> > +		 * Typical rise/fall time=166, refer Table 1207 databook
> > +		 */
> > +		test_code = TEST_CODE_SLEW_RATE_DDL_CYCLES;
> > +		test_data = ((0x72f >> 6) & 0x1f) | (1 << 7);
> > +		test_mode_send(kmb, dphy_no, test_code, test_data);
> > +	} else {
> > +		/* lane_rate_mbps <= 1000 Mbps
> > +		 * BitRate:  <= 1 Gbps:
> > +		 * - slew rate control ON
> > +		 * - typical rise/fall times: 225 ps
> > +		 */
> > +
> > +		/* Do not bypass slew rate calibration algorithm */
> > +		test_code = TEST_CODE_SLEW_RATE_OVERRIDE_CTRL;
> > +		test_data = (0x03 | (1 << 6));
> > +		test_mode_send(kmb, dphy_no, test_code, test_data);
> > +
> > +		/* Enable slew rate calibration */
> > +		test_code = TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL;
> > +		test_data = 0x01;
> > +		test_mode_send(kmb, dphy_no, test_code, test_data);
> > +
> > +		/* Typical rise/fall time=255, refer Table 1207 databook */
> > +		test_code = TEST_CODE_SLEW_RATE_DDL_CYCLES;
> > +		test_data = (0x523 & 0x7f);
> > +		test_mode_send(kmb, dphy_no, test_code, test_data);
> > +
> > +		/* Set sr_osc_freq_target[11:7] high nibble */
> > +		test_code = TEST_CODE_SLEW_RATE_DDL_CYCLES;
> > +		test_data = ((0x523 >> 6) & 0x1f) | (1 << 7);
> > +		test_mode_send(kmb, dphy_no, test_code, test_data);
> > +	}
> > +
> > +	/* Set cfgclkfreqrange */
> > +	val = (((cfg->cfg_clk_khz / 1000) - 17) * 4) & 0x3f;
> > +	SET_DPHY_FREQ_CTRL0_3(kmb, dphy_no, val);
> > +
> > +	drm_dbg(&kmb->drm, "DPHY_FREQ = 0x%x\n",
> > +		kmb_read_mipi(kmb, DPHY_FREQ_CTRL0_3 + 4));
> > +	drm_dbg(&kmb->drm, "MIPI_DPHY_STAT0_4_7 = 0x%x)\n",
> > +		kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7));
> > +
> > +	/* Enable config clk for the corresponding d-phy */
> > +	kmb_set_bit_mipi(kmb, DPHY_CFG_CLK_EN, dphy_no);
> > +
> > +	drm_dbg(&kmb->drm, "DPHY_CFG_CLK_EN = 0x%x\n",
> > +		kmb_read_mipi(kmb, DPHY_CFG_CLK_EN));
> > +
> > +	/* PLL setup */
> > +	if (mode == MIPI_DPHY_MASTER) {
> > +		/* Set PLL regulator in bypass */
> > +		test_code = TEST_CODE_PLL_ANALOG_PROG;
> > +		test_data = 0x01;
> > +		test_mode_send(kmb, dphy_no, test_code, test_data);
> > +
> > +		/* PLL Parameters Setup */
> > +		mipi_tx_pll_setup(kmb, dphy_no, cfg->ref_clk_khz / 1000,
> > +				  cfg->lane_rate_mbps / 2);
> > +
> > +		/* Set clksel */
> > +		kmb_write_bits_mipi(kmb, DPHY_INIT_CTRL1,
> > +				    PLL_CLKSEL_0, 2, 0x01);
> > +
> > +		/* Set pll_shadow_control */
> > +		kmb_set_bit_mipi(kmb, DPHY_INIT_CTRL1,
> PLL_SHADOW_CTRL);
> > +
> > +		drm_dbg(&kmb->drm, "DPHY_INIT_CTRL1 = 0x%x\n",
> > +			kmb_read_mipi(kmb, DPHY_INIT_CTRL1));
> > +	}
> > +
> > +	drm_dbg(&kmb->drm, "MIPI_DPHY_STAT0_4_7 = 0x%x)\n",
> > +		kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7));
> > +
> > +//#define MIPI_TX_FORCE_VOD
> > +#ifdef MIPI_TX_FORCE_VOD
> > +#define MIPI_TX_VOD_LVL	450
> > +#define TEST_CODE_BANDGAP 0x24
> > +	/* Set bandgap/VOD level */
> > +	switch (MIPI_TX_VOD_LVL) {
> > +	case 200:
> > +		test_data = 0x00;
> > +		break;
> > +	case 300:
> > +		test_data = 0x20;
> > +		break;
> > +	case 350:
> > +		test_data = 0x40;
> > +		break;
> > +	case 450:
> > +		test_data = 0x60;
> > +		break;
> > +	case 400:
> > +	default:
> > +		test_data = 0x70;
> > +		break;
> > +	}
> > +	test_mode_send(kmb, dphy_no, TEST_CODE_BANDGAP, test_data);
> > +#endif
> > +
> > +	/* Send NORMAL OPERATION test code */
> > +	test_code = 0x0;
> > +	test_data = 0x0;
> > +	test_mode_send(kmb, dphy_no, test_code, test_data);
> > +
> > +	/* Configure BASEDIR for data lanes
> > +	 * NOTE: basedir only applies to LANE_0 of each D-PHY.
> > +	 * The other lanes keep their direction based on the D-PHY type,
> > +	 * either Rx or Tx.
> > +	 * bits[5:0]  - BaseDir: 1 = Rx
> > +	 * bits[9:6] - BaseDir: 0 = Tx
> > +	 */
> > +	drm_dbg(&kmb->drm, "MIPI_DPHY_STAT0_4_7 = 0x%x)\n",
> > +		kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7));
> > +
> > +	kmb_write_bits_mipi(kmb, DPHY_INIT_CTRL2, 0, 9, 0x03f);
> > +	ndelay(15);
> > +
> > +	/* Enable CLOCK LANE
> > +	 * Clock lane should be enabled regardless of the direction
> > +	 * set for the D-PHY (Rx/Tx)
> > +	 */
> > +	kmb_set_bit_mipi(kmb, DPHY_INIT_CTRL2, 12 + dphy_no);
> > +
> > +	drm_dbg(&kmb->drm, "DPHY_INIT_CTRL2 = 0x%x\n",
> > +		kmb_read_mipi(kmb, DPHY_INIT_CTRL2));
> > +
> > +	/* Enable DATA LANES */
> > +	kmb_write_bits_mipi(kmb, DPHY_ENABLE, dphy_no * 2, 2,
> > +			    ((1 << active_lanes) - 1));
> > +
> > +	drm_dbg(&kmb->drm,
> > +		"DPHY_ENABLE = 0x%x\n", kmb_read_mipi(kmb,
> DPHY_ENABLE));
> > +	ndelay(15);
> > +
> > +	/* Take D-PHY out of shutdown mode */
> > +	/* Deassert SHUTDOWNZ signal */
> > +	drm_dbg(&kmb->drm, "MIPI_DPHY_STAT0_4_7 = 0x%x)\n",
> > +		kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7));
> > +	SET_DPHY_INIT_CTRL0(kmb, dphy_no, SHUTDOWNZ);
> > +	ndelay(15);
> > +
> > +	/* Deassert RSTZ signal */
> > +	SET_DPHY_INIT_CTRL0(kmb, dphy_no, RESETZ);
> > +	drm_dbg(&kmb->drm, "DPHY_INIT_CTRL0 = 0x%x\n",
> > +		kmb_read_mipi(kmb, DPHY_INIT_CTRL0));
> > +}
> > +
> > +static void dphy_wait_fsm(struct kmb_drm_private *kmb, u32
> dphy_no,
> > +			  enum dphy_tx_fsm fsm_state)
> > +{
> > +	enum dphy_tx_fsm val = DPHY_TX_POWERDWN;
> > +	int i = 0;
> > +	int status = 1;
> > +
> > +	do {
> > +		test_mode_send(kmb, dphy_no,
> TEST_CODE_FSM_CONTROL, 0x80);
> > +
> > +		val = GET_TEST_DOUT4_7(kmb, dphy_no);
> > +		i++;
> > +		if (i > TIMEOUT) {
> > +			status = 0;
> > +			break;
> > +		}
> > +	} while (val != fsm_state);
> > +
> > +	drm_dbg(&kmb->drm, "%s: dphy %d val = %x\n", __func__,
> dphy_no, val);
> > +	drm_info(&kmb->drm, "********** DPHY %d WAIT_FSM %s
> **********\n",
> > +		 dphy_no, status ? "SUCCESS" : "FAILED");
> > +}
> > +
> > +static void wait_init_done(struct kmb_drm_private *kmb, u32
> dphy_no,
> > +			   u32 active_lanes)
> > +{
> > +	u32 stopstatedata = 0;
> > +	u32 data_lanes = (1 << active_lanes) - 1;
> > +	int i = 0, val;
> > +	int status = 1;
> > +
> > +	drm_dbg(&kmb->drm, "dphy=%d active_lanes=%d
> data_lanes=%d\n", dphy_no,
> > +		active_lanes, data_lanes);
> > +
> > +	do {
> > +		val = kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7);
> > +		stopstatedata = GET_STOPSTATE_DATA(kmb, dphy_no) &
> data_lanes;
> > +
> > +		/* TODO-need to add a time out and return failure */
> > +		i++;
> > +
> > +		if (i > TIMEOUT) {
> > +			status = 0;
> > +
> > +			drm_info(&kmb->drm,
> > +				 "! WAIT_INIT_DONE: TIMING
> OUT!(err_stat=%d)",
> > +				 kmb_read_mipi(kmb,
> MIPI_DPHY_ERR_STAT6_7));
> > +			drm_dbg(&kmb->drm,
> > +				"MIPI_DPHY_STAT0_4_7 = 0x%x)\n", val);
> > +			drm_dbg(&kmb->drm,
> > +				"stopdata = 0x%x data_lanes=0x%x\n",
> > +				 stopstatedata, data_lanes);
> > +
> > +			break;
> > +		}
> > +
> > +		if (i < 3) {
> > +			drm_dbg(&kmb->drm,
> > +				"stopdata = 0x%x data_lanes=0x%x\n",
> > +				 stopstatedata, data_lanes);
> > +			drm_dbg(&kmb->drm,
> > +				"MIPI_DPHY_STAT0_4_7 = 0x%x)\n", val);
> > +		}
> > +	} while (stopstatedata != data_lanes);
> > +
> > +	drm_info(&kmb->drm, "********** DPHY %d INIT - %s
> **********\n",
> > +		 dphy_no, status ? "SUCCESS" : "FAILED");
> > +}
> > +
> > +static void wait_pll_lock(struct kmb_drm_private *kmb, u32 dphy_no)
> > +{
> > +	int i = 0;
> > +	int status = 1;
> > +
> > +	do {
> > +		/* TODO-need to add a time out and return failure */
> > +		i++;
> > +		if (i > TIMEOUT) {
> > +			status = 0;
> > +
> > +			drm_info(&kmb->drm, "%s: timing out", __func__);
> > +			drm_dbg(&kmb->drm,
> > +				"%s : PLL_LOCK = 0x%x ", __func__,
> > +				kmb_read_mipi(kmb, DPHY_PLL_LOCK));
> > +
> > +			break;
> > +		}
> > +
> > +		if ((i % 100) == 0)
> > +			drm_dbg(&kmb->drm,
> > +				"%s : PLL_LOCK = 0x%x\n", __func__,
> > +				kmb_read_mipi(kmb, DPHY_PLL_LOCK));
> > +	} while (!GET_PLL_LOCK(kmb, dphy_no));
> > +
> > +	drm_info(&kmb->drm, "***** PLL Locked for DPHY %d - %s
> *****\n",
> > +		 dphy_no, status ? "SUCCESS" : "FAILED");
> > +}
> > +
> > +static u32 mipi_tx_init_dphy(struct kmb_drm_private *kmb,
> > +			     struct mipi_ctrl_cfg *cfg)
> > +{
> > +	u32 dphy_no = MIPI_DPHY6;
> > +
> > +	drm_info(&kmb->drm,
> > +		 "active_lanes=%d lane_rate=%d\n", cfg->active_lanes,
> > +		MIPI_TX_LANE_DATA_RATE_MBPS);
> > +
> > +	/* Multiple D-PHYs needed */
> > +	if (cfg->active_lanes > MIPI_DPHY_D_LANES) {
> > +		/*
> > +		 *Initialization for Tx aggregation mode is done according to
> > +		 *a. start init PHY1
> > +		 *b. poll for PHY1 FSM state LOCK
> > +		 *   b1. reg addr 0x03[3:0] - state_main[3:0] == 5 (LOCK)
> > +		 *c. poll for PHY1 calibrations done :
> > +		 *   c1. termination calibration lower section: addr 0x22[5]
> > +		 *   - rescal_done
> > +		 *   c2. slewrate calibration (if data rate < = 1500 Mbps):
> > +		 *     addr 0xA7[3:2] - srcal_done, sr_finished
> > +		 *d. start init PHY0
> > +		 *e. poll for PHY0 stopstate
> > +		 *f. poll for PHY1 stopstate
> > +		 */
> > +		/* PHY #N+1 ('slave') */
> > +
> > +		dphy_init_sequence(kmb, cfg, dphy_no + 1,
> > +				   (cfg->active_lanes - MIPI_DPHY_D_LANES),
> > +				   MIPI_DPHY_SLAVE);
> > +		dphy_wait_fsm(kmb, dphy_no + 1, DPHY_TX_LOCK);
> > +
> > +		/* PHY #N master */
> > +		dphy_init_sequence(kmb, cfg, dphy_no,
> MIPI_DPHY_D_LANES,
> > +				   MIPI_DPHY_MASTER);
> > +
> > +		/* Wait for DPHY init to complete */
> > +		wait_init_done(kmb, dphy_no, MIPI_DPHY_D_LANES);
> > +		wait_init_done(kmb, dphy_no + 1,
> > +			       cfg->active_lanes - MIPI_DPHY_D_LANES);
> > +		wait_pll_lock(kmb, dphy_no);
> > +		wait_pll_lock(kmb, dphy_no + 1);
> > +		dphy_wait_fsm(kmb, dphy_no, DPHY_TX_IDLE);
> > +	} else {		/* Single DPHY */
> > +		dphy_init_sequence(kmb, cfg, dphy_no, cfg->active_lanes,
> > +				   MIPI_DPHY_MASTER);
> > +		dphy_wait_fsm(kmb, dphy_no, DPHY_TX_IDLE);
> > +		wait_init_done(kmb, dphy_no, cfg->active_lanes);
> > +		wait_pll_lock(kmb, dphy_no);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +void connect_lcd_to_mipi(struct kmb_drm_private *kmb)
> static
> 
> > +{
> > +	/* DISABLE MIPI->CIF CONNECTION */
> > +	kmb_write_msscam(kmb, MSS_MIPI_CIF_CFG, 0);
> > +
> > +	/* ENABLE LCD->MIPI CONNECTION */
> > +	kmb_write_msscam(kmb, MSS_LCD_MIPI_CFG, 1);
> > +
> > +	/* DISABLE LCD->CIF LOOPBACK */
> > +	kmb_write_msscam(kmb, MSS_LOOPBACK_CFG, 0);
> > +}
> > +
> > +int kmb_dsi_hw_init(struct drm_device *dev, struct drm_display_mode
> *mode)
> > +{
> > +	struct kmb_drm_private *kmb = to_kmb(dev);
> > +	u64 data_rate;
> > +
> > +	mipi_tx_init_cfg.active_lanes = MIPI_TX_ACTIVE_LANES;
> > +
> > +	if (mode) {
> I cannot see this function being called without a mode.
> 
> > +		mipi_tx_frame0_sect_cfg.width_pixels = mode-
> >crtc_hdisplay;
> > +		mipi_tx_frame0_sect_cfg.height_lines = mode-
> >crtc_vdisplay;
> > +		mipitx_frame0_cfg.vsync_width =
> > +		    mode->crtc_vsync_end - mode->crtc_vsync_start;
> > +		mipitx_frame0_cfg.v_backporch =
> > +		    mode->crtc_vtotal - mode->crtc_vsync_end;
> > +		mipitx_frame0_cfg.v_frontporch =
> > +		    mode->crtc_vsync_start - mode->crtc_vdisplay;
> > +		mipitx_frame0_cfg.hsync_width =
> > +		    mode->crtc_hsync_end - mode->crtc_hsync_start;
> > +		mipitx_frame0_cfg.h_backporch =
> > +		    mode->crtc_htotal - mode->crtc_hsync_end;
> > +		mipitx_frame0_cfg.h_frontporch =
> > +		    mode->crtc_hsync_start - mode->crtc_hdisplay;
> > +
> > +		/* Lane rate = (vtotal*htotal*fps*bpp)/4 / 1000000
> > +		 * to convert to Mbps
> > +		 */
> > +		data_rate = ((((u32)mode->crtc_vtotal *
> > +				(u32)mode->crtc_htotal) *
> > +				(u32)(drm_mode_vrefresh(mode)) *
> > +			      MIPI_TX_BPP) / mipi_tx_init_cfg.active_lanes) /
> > +		    1000000;
> > +
> > +		drm_info(&kmb->drm, "htotal=%d vtotal=%d
> refresh=%d\n",
> > +			 mode->crtc_htotal, mode->crtc_vtotal,
> > +			 drm_mode_vrefresh(mode));
> > +		drm_info(&kmb->drm, "data_rate=%u active_lanes=%d\n",
> > +			 (u32)data_rate, mipi_tx_init_cfg.active_lanes);
> > +
> > +		/* When late rate < 800, modeset fails with 4 lanes,
> > +		 * so switch to 2 lanes
> > +		 */
> > +		if (data_rate < 800) {
> > +			mipi_tx_init_cfg.active_lanes = 2;
> > +			mipi_tx_init_cfg.lane_rate_mbps = data_rate * 2;
> > +		} else {
> > +			mipi_tx_init_cfg.lane_rate_mbps = data_rate;
> > +		}
> > +		drm_info(&kmb->drm,
> > +			 "lane rate=%d\n",
> mipi_tx_init_cfg.lane_rate_mbps);
> > +		drm_dbg(&kmb->drm,
> > +			"vfp= %d vbp= %d vsyc_len=%d hfp=%d hbp=%d
> hsync_len=%d lane-rate=%d",
> > +		     mipitx_frame0_cfg.v_frontporch,
> > +		     mipitx_frame0_cfg.v_backporch,
> > +		     mipitx_frame0_cfg.vsync_width,
> > +		     mipitx_frame0_cfg.h_frontporch,
> > +		     mipitx_frame0_cfg.h_backporch,
> > +		     mipitx_frame0_cfg.hsync_width,
> > +		     mipi_tx_init_cfg.lane_rate_mbps);
> > +	}
> > +
> > +	if (hw_initialized)
> > +		return 0;
> > +
> > +	kmb_write_mipi(kmb, DPHY_ENABLE, 0);
> > +	kmb_write_mipi(kmb, DPHY_INIT_CTRL0, 0);
> > +	kmb_write_mipi(kmb, DPHY_INIT_CTRL1, 0);
> > +	kmb_write_mipi(kmb, DPHY_INIT_CTRL2, 0);
> > +
> > +	/* Initialize mipi controller */
> > +	mipi_tx_init_cntrl(kmb, &mipi_tx_init_cfg);
> > +
> > +	/* Dphy initialization */
> > +	mipi_tx_init_dphy(kmb, &mipi_tx_init_cfg);
> > +	drm_dbg(&kmb->drm, "IRQ_STATUS = 0x%x\n",
> > +		GET_MIPI_TX_HS_IRQ_STATUS(kmb, MIPI_CTRL6));
> > +
> > +	connect_lcd_to_mipi(kmb);
> > +
> > +#ifdef MIPI_TX_TEST_PATTERN_GENERATION
> > +	mipi_tx_hs_tp_gen(kmb, 0, MIPI_TX_HS_TP_V_STRIPES,
> > +			  0x15, 0xff, 0xff00, MIPI_CTRL6);
> > +
> > +	drm_dbg(&kmb->drm, "IRQ_STATUS = 0x%x\n",
> > +		GET_MIPI_TX_HS_IRQ_STATUS(kmb, MIPI_CTRL6));
> > +#endif //MIPI_TX_TEST_PATTERN_GENERATION
> > +
> > +	hw_initialized = true;
> > +
> > +	drm_dbg(&kmb->drm, "MIPI_TXm_HS_CTRL = 0x%x\n",
> > +		kmb_read_mipi(kmb, MIPI_TXm_HS_CTRL(6)));
> > +	drm_dbg(&kmb->drm, "MIPI LOOP BACK = %x\n",
> > +		kmb_read_mipi(kmb, MIPI_CTRL_DIG_LOOPBACK));
> > +	drm_info(&kmb->drm, "mipi hw_initialized = %d\n",
> hw_initialized);
> > +
> > +	return 0;
> > +}
> > +
> > +int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
> > +{
> > +	struct kmb_dsi *kmb_dsi;
> > +	struct drm_encoder *encoder;
> > +	struct kmb_connector *kmb_connector;
> > +	struct drm_connector *connector;
> > +	struct kmb_dsi_host *host;
> > +	int ret = 0;
> > +
> > +	kmb_dsi = kzalloc(sizeof(*kmb_dsi), GFP_KERNEL);
> > +	if (!kmb_dsi) {
> > +		DRM_ERROR("failed to allocate kmb_dsi\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	kmb_connector = kzalloc(sizeof(*kmb_connector), GFP_KERNEL);
> > +	if (!kmb_connector) {
> > +		kfree(kmb_dsi);
> > +		DRM_ERROR("failed to allocate kmb_connector\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	kmb_dsi->attached_connector = kmb_connector;
> > +
> > +	host = kmb_dsi_host_init(dev, kmb_dsi);
> > +	if (!host) {
> > +		DRM_ERROR("Failed to allocate host\n");
> > +		kfree(kmb_dsi);
> > +		kfree(kmb_connector);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	kmb_dsi->dsi_host = host;
> > +	connector = &kmb_connector->base;
> > +	encoder = &kmb_dsi->base;
> > +	encoder->possible_crtcs = 1;
> > +	encoder->possible_clones = 0;
> > +
> > +	drm_encoder_init(dev, encoder, &kmb_dsi_funcs,
> DRM_MODE_ENCODER_DSI,
> > +			 "MIPI-DSI");
> Use drm_simple_encoder(). See other drivers how to do it.
I see that drm_simple_encoder() is used when the driver is either a bridge driver or component driver. Since this is not either, we can keep the drm_encoder_init() as in icl_dsi.c
> 
> 
> > +
> > +	drm_connector_init(dev, connector, &kmb_dsi_connector_funcs,
> > +			   DRM_MODE_CONNECTOR_DSI);
> > +
> > +	drm_connector_helper_add(connector,
> &kmb_dsi_connector_helper_funcs);
> > +
> > +	drm_info(dev, "connector = %s encoder = %s\n", connector->name,
> > +		 encoder->name);
> > +
> > +	ret = drm_connector_attach_encoder(connector, encoder);
> > +	drm_info(dev, "connector->encoder = 0x%p ret = %d\n",
> > +		 connector->encoder,
> > +		 ret);
> > +
> > +	/* Link drm_bridge to encoder */
> > +	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> 
> This sequence is not optimal and not right.
> The new way, which new drivers shall use, is to let the bridge drivers
> provide
> relevant operations and then the display driver uses
> drm_bridge_connector_init()
> to create the connector.
> 
> See for example mtk_dsi_encoder_init()
> 
> The current design uses a thight coupling between the display driver and
> the kmb_dsi. I may be biased but to me it seems easier to make kmb_dsi
> a real bridge driver so we have a chain of bridges like this:
> 
> --------------------+   +----------------+   +----------------+
>                     |   |                |   |                |
>  kmb display driver +---+ kmb_dsi bridge +---+ adv7535 bridge +== HDMI
>                     |   |                |   |                |
> --------------------+   +----------------+   +----------------+
> 
As per our discussions through private emails, we will keep the current design for mipi dsi.

> adv7535 then provides get_edit, detect, and hot-plug detect operations
> to be used by the connector.
> 
> 
> 
> 
> > +	if (ret) {
> > +		DRM_ERROR("failed to attach bridge to MIPI\n");
> > +		drm_encoder_cleanup(encoder);
> > +		return ret;
> > +	}
> > +	drm_info(dev, "Bridge attached : SUCCESS\n");
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h
> b/drivers/gpu/drm/kmb/kmb_dsi.h
> > new file mode 100644
> > index 0000000..c980823
> > --- /dev/null
> > +++ b/drivers/gpu/drm/kmb/kmb_dsi.h
> > @@ -0,0 +1,370 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only
> > + *
> > + * Copyright (c) 2019-2020 Intel Corporation
> > + */
> > +
> > +#ifndef __KMB_DSI_H__
> > +#define __KMB_DSI_H__
> > +
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_modes.h>
> > +#include "kmb_drv.h"
> > +
> > +/* MIPI TX CFG*/
> > +#define MIPI_TX_LANE_DATA_RATE_MBPS 891
> > +#define MIPI_TX_REF_CLK_KHZ         24000
> > +#define MIPI_TX_CFG_CLK_KHZ         24000
> > +#define MIPI_TX_BPP		    24
> > +
> > +/* DPHY Tx test codes*/
> > +#define TEST_CODE_FSM_CONTROL				0x03
> > +#define TEST_CODE_MULTIPLE_PHY_CTRL			0x0C
> > +#define TEST_CODE_PLL_PROPORTIONAL_CHARGE_PUMP_CTRL	0x0E
> > +#define TEST_CODE_PLL_INTEGRAL_CHARGE_PUMP_CTRL		0x0F
> > +#define TEST_CODE_PLL_VCO_CTRL				0x12
> > +#define TEST_CODE_PLL_GMP_CTRL				0x13
> > +#define TEST_CODE_PLL_PHASE_ERR_CTRL			0x14
> > +#define TEST_CODE_PLL_LOCK_FILTER			0x15
> > +#define TEST_CODE_PLL_UNLOCK_FILTER			0x16
> > +#define TEST_CODE_PLL_INPUT_DIVIDER			0x17
> > +#define TEST_CODE_PLL_FEEDBACK_DIVIDER			0x18
> > +#define   PLL_FEEDBACK_DIVIDER_HIGH			BIT(7)
> > +#define TEST_CODE_PLL_OUTPUT_CLK_SEL			0x19
> > +#define   PLL_N_OVR_EN					BIT(4)
> > +#define   PLL_M_OVR_EN					BIT(5)
> > +#define TEST_CODE_VOD_LEVEL				0x24
> > +#define TEST_CODE_PLL_CHARGE_PUMP_BIAS			0x1C
> > +#define TEST_CODE_PLL_LOCK_DETECTOR			0x1D
> > +#define TEST_CODE_HS_FREQ_RANGE_CFG			0x44
> > +#define TEST_CODE_PLL_ANALOG_PROG			0x1F
> > +#define TEST_CODE_SLEW_RATE_OVERRIDE_CTRL		0xA0
> > +#define TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL		0xA3
> > +#define TEST_CODE_SLEW_RATE_DDL_CYCLES			0xA4
> > +
> > +/* DPHY params */
> > +#define PLL_N_MIN	0
> > +#define PLL_N_MAX	15
> > +#define PLL_M_MIN	62
> > +#define PLL_M_MAX	623
> > +#define PLL_FVCO_MAX	1250
> > +
> > +#define TIMEOUT		600
> > +
> > +#define MIPI_TX_FRAME_GEN				4
> > +#define MIPI_TX_FRAME_GEN_SECTIONS			4
> > +#define MIPI_CTRL_VIRTUAL_CHANNELS			4
> > +#define MIPI_D_LANES_PER_DPHY				2
> > +#define MIPI_CTRL_2LANE_MAX_MC_FIFO_LOC			255
> > +#define MIPI_CTRL_4LANE_MAX_MC_FIFO_LOC			511
> > +/* 2 Data Lanes per D-PHY */
> > +#define MIPI_DPHY_D_LANES				2
> > +#define MIPI_DPHY_DEFAULT_BIT_RATES			63
> > +
> > +#define to_kmb_connector(x) container_of(x, struct kmb_connector,
> base)
> > +#define to_kmb_host(x) container_of(x, struct kmb_dsi_host, base)
> > +#define to_kmb_dsi(x) container_of(x, struct kmb_dsi, base)
> > +
> > +struct kmb_connector;
> > +struct kmb_dsi_host;
> > +
> > +struct kmb_dsi {
> > +	struct drm_encoder base;
> > +	struct kmb_connector *attached_connector;
> > +	struct kmb_dsi_host *dsi_host;
> > +	struct drm_bridge *bridge;
> > +};
> > +
> > +struct kmb_dsi_host {
> > +	struct mipi_dsi_host *base;
> > +	struct kmb_dsi *kmb_dsi;
> > +	struct mipi_dsi_device *device;
> > +};
> > +
> > +struct kmb_connector {
> > +	struct drm_connector base;
> > +	struct drm_encoder *encoder;
> > +	struct drm_display_mode *fixed_mode;
> > +};
> > +
> > +/* DPHY Tx test codes */
> > +
> > +enum mipi_ctrl_num {
> > +	MIPI_CTRL0 = 0,
> > +	MIPI_CTRL1,
> > +	MIPI_CTRL2,
> > +	MIPI_CTRL3,
> > +	MIPI_CTRL4,
> > +	MIPI_CTRL5,
> > +	MIPI_CTRL6,
> > +	MIPI_CTRL7,
> > +	MIPI_CTRL8,
> > +	MIPI_CTRL9,
> > +	MIPI_CTRL_NA
> > +};
> Not used?
It is used
> > +
> > +enum mipi_dphy_num {
> > +	MIPI_DPHY0 = 0,
> > +	MIPI_DPHY1,
> > +	MIPI_DPHY2,
> > +	MIPI_DPHY3,
> > +	MIPI_DPHY4,
> > +	MIPI_DPHY5,
> > +	MIPI_DPHY6,
> > +	MIPI_DPHY7,
> > +	MIPI_DPHY8,
> > +	MIPI_DPHY9,
> > +	MIPI_DPHY_NA
> > +};
> Not used?
It is used
> > +
> > +enum mipi_dir {
> > +	MIPI_RX,
> > +	MIPI_TX
> > +};
> > +
> > +enum mipi_ctrl_type {
> > +	MIPI_DSI,
> > +	MIPI_CSI
> > +};
> > +
> > +enum mipi_data_if {
> > +	MIPI_IF_DMA,
> > +	MIPI_IF_PARALLEL
> > +};
> > +
> > +enum mipi_data_mode {
> > +	MIPI_DATA_MODE0,
> > +	MIPI_DATA_MODE1,
> > +	MIPI_DATA_MODE2,
> > +	MIPI_DATA_MODE3
> > +};
> > +
> > +enum mipi_dsi_video_mode {
> > +	DSI_VIDEO_MODE_NO_BURST_PULSE,
> > +	DSI_VIDEO_MODE_NO_BURST_EVENT,
> > +	DSI_VIDEO_MODE_BURST
> > +};
> > +
> > +enum mipi_dsi_blanking_mode {
> > +	TRANSITION_TO_LOW_POWER,
> > +	SEND_BLANK_PACKET
> > +};
> > +
> > +enum mipi_dsi_eotp {
> > +	DSI_EOTP_DISABLED,
> > +	DSI_EOTP_ENABLES
> > +};
> > +
> > +enum mipi_dsi_data_type {
> > +	DSI_SP_DT_RESERVED_00 = 0x00,
> > +	DSI_SP_DT_VSYNC_START = 0x01,
> > +	DSI_SP_DT_COLOR_MODE_OFF = 0x02,
> > +	DSI_SP_DT_GENERIC_SHORT_WR = 0x03,
> > +	DSI_SP_DT_GENERIC_RD = 0x04,
> > +	DSI_SP_DT_DCS_SHORT_WR = 0x05,
> > +	DSI_SP_DT_DCS_RD = 0x06,
> > +	DSI_SP_DT_EOTP = 0x08,
> > +	DSI_LP_DT_NULL = 0x09,
> > +	DSI_LP_DT_RESERVED_0A = 0x0a,
> > +	DSI_LP_DT_RESERVED_0B = 0x0b,
> > +	DSI_LP_DT_LPPS_YCBCR422_20B = 0x0c,
> > +	DSI_LP_DT_PPS_RGB101010_30B = 0x0d,
> > +	DSI_LP_DT_PPS_RGB565_16B = 0x0e,
> > +	DSI_LP_DT_RESERVED_0F = 0x0f,
> > +
> > +	DSI_SP_DT_RESERVED_10 = 0x10,
> > +	DSI_SP_DT_VSYNC_END = 0x11,
> > +	DSI_SP_DT_COLOR_MODE_ON = 0x12,
> > +	DSI_SP_DT_GENERIC_SHORT_WR_1PAR = 0x13,
> > +	DSI_SP_DT_GENERIC_RD_1PAR = 0x14,
> > +	DSI_SP_DT_DCS_SHORT_WR_1PAR = 0x15,
> > +	DSI_SP_DT_RESERVED_16 = 0x16,
> > +	DSI_SP_DT_RESERVED_17 = 0x17,
> > +	DSI_SP_DT_RESERVED_18 = 0x18,
> > +	DSI_LP_DT_BLANK = 0x19,
> > +	DSI_LP_DT_RESERVED_1A = 0x1a,
> > +	DSI_LP_DT_RESERVED_1B = 0x1b,
> > +	DSI_LP_DT_PPS_YCBCR422_24B = 0x1c,
> > +	DSI_LP_DT_PPS_RGB121212_36B = 0x1d,
> > +	DSI_LP_DT_PPS_RGB666_18B = 0x1e,
> > +	DSI_LP_DT_RESERVED_1F = 0x1f,
> > +
> > +	DSI_SP_DT_RESERVED_20 = 0x20,
> > +	DSI_SP_DT_HSYNC_START = 0x21,
> > +	DSI_SP_DT_SHUT_DOWN_PERIPH_CMD = 0x22,
> > +	DSI_SP_DT_GENERIC_SHORT_WR_2PAR = 0x23,
> > +	DSI_SP_DT_GENERIC_RD_2PAR = 0x24,
> > +	DSI_SP_DT_RESERVED_25 = 0x25,
> > +	DSI_SP_DT_RESERVED_26 = 0x26,
> > +	DSI_SP_DT_RESERVED_27 = 0x27,
> > +	DSI_SP_DT_RESERVED_28 = 0x28,
> > +	DSI_LP_DT_GENERIC_LONG_WR = 0x29,
> > +	DSI_LP_DT_RESERVED_2A = 0x2a,
> > +	DSI_LP_DT_RESERVED_2B = 0x2b,
> > +	DSI_LP_DT_PPS_YCBCR422_16B = 0x2c,
> > +	DSI_LP_DT_RESERVED_2D = 0x2d,
> > +	DSI_LP_DT_LPPS_RGB666_18B = 0x2e,
> > +	DSI_LP_DT_RESERVED_2F = 0x2f,
> > +
> > +	DSI_SP_DT_RESERVED_30 = 0x30,
> > +	DSI_SP_DT_HSYNC_END = 0x31,
> > +	DSI_SP_DT_TURN_ON_PERIPH_CMD = 0x32,
> > +	DSI_SP_DT_RESERVED_33 = 0x33,
> > +	DSI_SP_DT_RESERVED_34 = 0x34,
> > +	DSI_SP_DT_RESERVED_35 = 0x35,
> > +	DSI_SP_DT_RESERVED_36 = 0x36,
> > +	DSI_SP_DT_SET_MAX_RETURN_PKT_SIZE = 0x37,
> > +	DSI_SP_DT_RESERVED_38 = 0x38,
> > +	DSI_LP_DT_DSC_LONG_WR = 0x39,
> > +	DSI_LP_DT_RESERVED_3A = 0x3a,
> > +	DSI_LP_DT_RESERVED_3B = 0x3b,
> > +	DSI_LP_DT_RESERVED_3C = 0x3c,
> > +	DSI_LP_DT_PPS_YCBCR420_12B = 0x3d,
> > +	DSI_LP_DT_PPS_RGB888_24B = 0x3e,
> > +	DSI_LP_DT_RESERVED_3F = 0x3f
> > +};
> > +
> > +enum mipi_tx_hs_tp_sel {
> > +	MIPI_TX_HS_TP_WHOLE_FRAME_COLOR0 = 0,
> > +	MIPI_TX_HS_TP_WHOLE_FRAME_COLOR1,
> > +	MIPI_TX_HS_TP_V_STRIPES,
> > +	MIPI_TX_HS_TP_H_STRIPES,
> > +};
> > +
> > +enum dphy_mode {
> > +	MIPI_DPHY_SLAVE = 0,
> > +	MIPI_DPHY_MASTER
> > +};
> > +
> > +enum dphy_tx_fsm {
> > +	DPHY_TX_POWERDWN = 0,
> > +	DPHY_TX_BGPON,
> > +	DPHY_TX_TERMCAL,
> > +	DPHY_TX_TERMCALUP,
> > +	DPHY_TX_OFFSETCAL,
> > +	DPHY_TX_LOCK,
> > +	DPHY_TX_SRCAL,
> > +	DPHY_TX_IDLE,
> > +	DPHY_TX_ULP,
> > +	DPHY_TX_LANESTART,
> > +	DPHY_TX_CLKALIGN,
> > +	DPHY_TX_DDLTUNNING,
> > +	DPHY_TX_ULP_FORCE_PLL,
> > +	DPHY_TX_LOCK_LOSS
> > +};
> > +
> > +struct mipi_data_type_params {
> > +	u8 size_constraint_pixels;
> > +	u8 size_constraint_bytes;
> > +	u8 pixels_per_pclk;
> > +	u8 bits_per_pclk;
> > +};
> > +
> > +struct mipi_tx_dsi_cfg {
> > +	u8 hfp_blank_en;	/*horizontal front porch blanking enable */
> > +	u8 eotp_en;	/*End of transmission packet enable */
> > +	/*last vertical front porch blanking mode */
> > +	u8 lpm_last_vfp_line;
> > +	/*first vertical sync active blanking mode */
> > +	u8 lpm_first_vsa_line;
> > +	u8 sync_pulse_eventn;	/*sync type */
> > +	u8 hfp_blanking;	/*horizontal front porch blanking mode */
> > +	u8 hbp_blanking;	/*horizontal back porch blanking mode */
> > +	u8 hsa_blanking;	/*horizontal sync active blanking mode */
> > +	u8 v_blanking;	/*vertical timing blanking mode */
> > +};
> > +
> > +struct mipi_tx_frame_section_cfg {
> > +	u32 dma_v_stride;
> > +	u16 dma_v_scale_cfg;
> > +	u16 width_pixels;
> > +	u16 height_lines;
> > +	u8 dma_packed;
> > +	u8 bpp;
> > +	u8 bpp_unpacked;
> > +	u8 dma_h_stride;
> > +	u8 data_type;
> > +	u8 data_mode;
> > +	u8 dma_flip_rotate_sel;
> > +};
> > +
> > +struct mipi_tx_frame_timing_cfg {
> > +	u32 bpp;
> > +	u32 lane_rate_mbps;
> > +	u32 hsync_width;
> > +	u32 h_backporch;
> > +	u32 h_frontporch;
> > +	u32 h_active;
> > +	u16 vsync_width;
> > +	u16 v_backporch;
> > +	u16 v_frontporch;
> > +	u16 v_active;
> > +	u8 active_lanes;
> > +};
> > +
> > +struct mipi_tx_frame_sect_phcfg {
> > +	u32 wc;
> > +	enum mipi_data_mode data_mode;
> > +	enum mipi_dsi_data_type data_type;
> > +	u8 vchannel;
> > +	u8 dma_packed;
> > +};
> > +
> > +struct mipi_tx_frame_cfg {
> > +	struct mipi_tx_frame_section_cfg
> *sections[MIPI_TX_FRAME_GEN_SECTIONS];
> > +	u32 hsync_width;	/*in pixels */
> > +	u32 h_backporch;	/*in pixels */
> > +	u32 h_frontporch;	/*in pixels */
> > +	u16 vsync_width;	/*in lines */
> > +	u16 v_backporch;	/*in lines */
> > +	u16 v_frontporch;	/*in lines */
> > +};
> > +
> > +struct mipi_tx_ctrl_cfg {
> > +	struct mipi_tx_frame_cfg *frames[MIPI_TX_FRAME_GEN];
> > +	struct mipi_tx_dsi_cfg *tx_dsi_cfg;
> > +	u8 line_sync_pkt_en;
> > +	u8 line_counter_active;
> > +	u8 frame_counter_active;
> > +	u8 tx_hsclkkidle_cnt;
> > +	u8 tx_hsexit_cnt;
> > +	u8 tx_crc_en;
> > +	u8 tx_hact_wait_stop;
> > +	u8 tx_always_use_hact;
> > +	u8 tx_wait_trig;
> > +	u8 tx_wait_all_sect;
> > +};
> > +
> > +/*configuration structure for MIPI control */
> > +struct mipi_ctrl_cfg {
> > +	/* controller index : CTRL6 for connecting to LCD */
> > +	u8 index;
> > +	u8 type;		/* controller type : MIPI_DSI */
> Some of the fields looks like they are only assigned but never used?
> 
> 
> > +	u8 dir;		/* controller direction : MIPI_TX */
> > +	u8 active_lanes;	/* # active lanes per controller 2/4 */
> > +	u32 lane_rate_mbps;	/*MBPS */
> > +	u32 ref_clk_khz;
> > +	u32 cfg_clk_khz;
> > +	u32 data_if;	/*MIPI_IF_DMA or MIPI_IF_PARALLEL */
> > +	struct mipi_tx_ctrl_cfg tx_ctrl_cfg;
> > +};
> > +
> > +/* Structure for storing user specified interrupts that are enabled */
> > +union mipi_irq_cfg {
> > +	u8 value;
> > +	struct {
> > +		u8 line_compare:1;
> > +		u8 dma_event:1;
> > +		u8 frame_done:1;
> > +		u8 ctrl_error:1;
> > +		u8 dphy_error:1;
> Most fields are not used??
> > +	} irq_cfg;
> > +};
> > +
> > +struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev);
> > +int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge);
> > +void kmb_plane_destroy(struct drm_plane *plane);
> Does not belong in this file
> 
> > +void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p);
> Does not exist - delete
> 
> > +void kmb_dsi_host_unregister(void);
> > +int kmb_dsi_hw_init(struct drm_device *dev, struct drm_display_mode
> *mode);
> > +#endif /* __KMB_DSI_H__ */
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
