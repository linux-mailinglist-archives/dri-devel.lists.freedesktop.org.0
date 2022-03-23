Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23734E54ED
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4100910E71C;
	Wed, 23 Mar 2022 15:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4AC10E750;
 Wed, 23 Mar 2022 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648048268; x=1679584268;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ak6vruZ0s0jfULNjhGFGclYiId7Hr9OSzLl3ubjhZxA=;
 b=FzaN92rWg6wJqHjnMWUdpKyw9H+xCBDt4/SgO8JCGbK5jBcKsoZHK1oZ
 mhyfs0QE7zNTBnC5QBXWewiK7rLDcOnWbrmq7614mWrJkY+DcdfEmEfqj
 kdEjlVSmr/7rma/HzVRKYV/ChN3q7AySSUiGGDNRjK6EUMm6jt0Wjk+E2
 vNeX5aIlz/Ik4yULYWRAKn58KL0Itx4DbsDUc/+nqXoTn6r9/C17aWhxE
 zqx+8+aQ7JbREGEGiVLbCzx8D/vPiKiFFVfDQ0b1ErlNYbCIQYw1L6xZV
 Uymx1Cdpxzgqp6lf5SsaJE/Tgpo4BjlSpCNigAgGFwcfd6PF9CjiQHIMo Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="238735960"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="238735960"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 08:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="692975118"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by fmsmga001.fm.intel.com with SMTP; 23 Mar 2022 08:10:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 17:10:56 +0200
Date: Wed, 23 Mar 2022 17:10:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 00/22] drm: Review of mode copies
Message-ID: <Yjs4gIBuftRyLElE@intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <Yi+9n0eGn3rNKb4X@intel.com>
 <CADnq5_NS07TPBWSnETRhjzqtX_oUuCu86ewurFT3MJO=PcLAuQ@mail.gmail.com>
 <Yjj+RSVBWk6UO2C7@intel.com>
 <e9937a37-70c8-cc6f-15f2-1dbbb7f1bfba@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9937a37-70c8-cc6f-15f2-1dbbb7f1bfba@linaro.org>
X-Patchwork-Hint: comment
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, Chen Feng <puck.chen@hisilicon.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nikola Cornij <nikola.cornij@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Tomi Valkeinen <tomba@kernel.org>, freedreno <freedreno@lists.freedesktop.org>,
 Sandy Huang <hjc@rock-chips.com>, Robert Foss <robert.foss@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 23, 2022 at 01:39:44PM +0300, Dmitry Baryshkov wrote:
> On 22/03/2022 01:37, Ville Syrjälä wrote:
> > On Tue, Mar 15, 2022 at 02:52:38PM -0400, Alex Deucher wrote:
> >> On Mon, Mar 14, 2022 at 6:12 PM Ville Syrjälä
> >> <ville.syrjala@linux.intel.com> wrote:
> >>>
> >>> On Fri, Feb 18, 2022 at 12:03:41PM +0200, Ville Syrjala wrote:
> >>>>    drm: Add drm_mode_init()
> >>>>    drm/bridge: Use drm_mode_copy()
> >>>>    drm/imx: Use drm_mode_duplicate()
> >>>>    drm/panel: Use drm_mode_duplicate()
> >>>>    drm/vc4: Use drm_mode_copy()
> >>> These have been pushed to drm-misc-next.
> >>>
> >>>>    drm/amdgpu: Remove pointless on stack mode copies
> >>>>    drm/amdgpu: Use drm_mode_init() for on-stack modes
> >>>>    drm/amdgpu: Use drm_mode_copy()
> >>> amdgpu ones are reviewed, but I'll leave them for the
> >>> AMD folks to push to whichever tree they prefer.
> >>
> >> I pulled patches 2, 4, 5 into my tree.
> > 
> > Thanks.
> > 
> >> For 3, I'm happy to have it
> >> land via drm-misc with the rest of the mode_init changes if you'd
> >> prefer.
> > 
> > Either way works for me. I don't yet have reviews yet for
> > the other drivers, so I'll proably hold off for a bit more
> > at least. And the i915 patch I'll be merging via drm-intel.
> > 
> >>>>    drm/radeon: Use drm_mode_copy()
> >>>>    drm/gma500: Use drm_mode_copy()
> >>>>    drm/tilcdc: Use drm_mode_copy()
> >>>>    drm/i915: Use drm_mode_copy()
> > 
> > Those are now all in.
> > 
> > Which leaves us with these stragglers:
> >>>>    drm/hisilicon: Use drm_mode_init() for on-stack modes
> 
> >>>>    drm/msm: Nuke weird on stack mode copy
> >>>>    drm/msm: Use drm_mode_init() for on-stack modes
> >>>>    drm/msm: Use drm_mode_copy()
> 
> These three patches went beneath my radar for some reason.
> 
> I have just sent a replacement for the first patch ([1]). Other two 
> patches can be pulled in msm/msm-next (or msm/msm-fixes) during the next 
> development cycle if that works for you.

That'll do fine for me. Thanks.

> 
> [1] https://patchwork.freedesktop.org/series/101682/
> 
> >>>>    drm/mtk: Use drm_mode_init() for on-stack modes
> >>>>    drm/rockchip: Use drm_mode_copy()
> >>>>    drm/sti: Use drm_mode_copy()
> >>>>    drm: Use drm_mode_init() for on-stack modes
> >>>>    drm: Use drm_mode_copy()
> > 
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
Ville Syrjälä
Intel
