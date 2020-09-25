Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0832F27868F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 14:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C946ECB9;
	Fri, 25 Sep 2020 12:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0196.hostedemail.com
 [216.40.44.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F68C6ECA4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 12:02:33 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id B368518225647;
 Fri, 25 Sep 2020 12:02:30 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:968:988:989:1260:1277:1311:1313:1314:1345:1359:1381:1437:1515:1516:1518:1534:1539:1567:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3866:3867:3868:3871:4250:4321:5007:6691:6737:10004:10400:10848:11026:11232:11473:11657:11658:11914:12043:12048:12296:12297:12740:12760:12895:13069:13161:13229:13311:13357:13439:14659:14721:21080:21451:21627:30012:30054:30070:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: apple13_2f1784c27167
X-Filterd-Recvd-Size: 1751
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Fri, 25 Sep 2020 12:02:28 +0000 (UTC)
Message-ID: <c28eae83c4297e14ed039eb00154d3a7e0fddaaa.camel@perches.com>
Subject: Re: [PATCH] drm/stm: dsi: Use dev_ based logging
From: Joe Perches <joe@perches.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Antonio Borneo <antonio.borneo@st.com>, Vincent
 Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 dri-devel@lists.freedesktop.org,  linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Fri, 25 Sep 2020 05:02:27 -0700
In-Reply-To: <20200925102233.18016-1-yannick.fertre@st.com>
References: <20200925102233.18016-1-yannick.fertre@st.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-09-25 at 12:22 +0200, Yannick Fertre wrote:
> Standardize on the dev_ based logging and drop the include of drm_print.h.
> Remove useless dsi_color_from_mipi function.
[]
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
[]
> -	DRM_DEBUG_DRIVER("pll_in %ukHz pll_out %ukHz lane_mbps %uMHz\n",
> -			 pll_in_khz, pll_out_khz, *lane_mbps);
> +	dev_dbg(dsi->dev, "pll_in %ukHz pll_out %ukHz lane_mbps %uMHz\n", pll_in_khz, pll_out_khz,
> +		*lane_mbps);

The line wrapping change here is pretty pointless and IMO
makes the code harder to read.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
