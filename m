Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5D364C52C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 09:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D238810E228;
	Wed, 14 Dec 2022 08:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3553E10E228
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 08:39:04 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2B4FD3F3E7;
 Wed, 14 Dec 2022 09:38:30 +0100 (CET)
Date: Wed, 14 Dec 2022 09:38:28 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [RFC PATCH 5/6] drm/msm/dsi: Flip greater-than check for
 slice_count and slice_per_intf
Message-ID: <20221214083828.3jblczd5h5vyp3o5@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jani Nikula <jani.nikula@intel.com>,
 sunliming <sunliming@kylinos.cn>, Sam Ravnborg <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-6-marijn.suijten@somainline.org>
 <c5e33d9f-0dc4-fdd2-244a-3d463be1c4e8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5e33d9f-0dc4-fdd2-244a-3d463be1c4e8@linaro.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>, Vinod Koul <vkoul@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, sunliming <sunliming@kylinos.cn>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-12-14 01:02:14, Konrad Dybcio wrote:
> 
> 
> On 14.12.2022 00:22, Marijn Suijten wrote:
> > According to downstream /and the comment copied from it/ this comparison
> > should be the other way around.  In other words, when the panel driver
> > requests to use more slices per packet than what could be sent over this
> > interface, it is bumped down to only use a single slice per packet (and
> > strangely not the number of slices that could fit on the interface).
> > 
> > Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

> > ---
> Missing s-o-b

Thanks for catching, checkpatch would've pointed this out (in addition
to a typo in the cover letter) if I had ran it.

> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index 0686c35a6fd4..9bdfa0864cdf 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -855,11 +855,11 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
> >  	 */
> >  	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
> >  
> > -	/* If slice_per_pkt is greater than slice_per_intf
> > +	/* If slice_count is greater than slice_per_intf
> >  	 * then default to 1. This can happen during partial
> >  	 * update.
> >  	 */
> > -	if (slice_per_intf > dsc->slice_count)
> > +	if (dsc->slice_count > slice_per_intf)
> >  		dsc->slice_count = 1;
> >  
> >  	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
