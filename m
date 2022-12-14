Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496A164D012
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 20:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534B510E054;
	Wed, 14 Dec 2022 19:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2676B10E054;
 Wed, 14 Dec 2022 19:24:00 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7D8A920189;
 Wed, 14 Dec 2022 20:23:23 +0100 (CET)
Date: Wed, 14 Dec 2022 20:23:22 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 0/6] drm/msm: DSC Electric Boogaloo for sm8[12]50
Message-ID: <20221214192322.vs4tvhlzjc265bva@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <154b2e08-25a0-c8b7-1dc8-2d41b8787f05@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <154b2e08-25a0-c8b7-1dc8-2d41b8787f05@linaro.org>
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
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 freedreno@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-12-14 20:40:06, Dmitry Baryshkov wrote:
> On 14/12/2022 01:22, Marijn Suijten wrote:
> > This preliminary Display Stream Compression support package for
> > (initially tested on) sm8[12]50 is based on comparing DSC behaviour
> > between downstream and mainline.  Some new callbacks are added (for
> > binding blocks on active CTLs), logic bugs are corrected, zeroed struct
> > members are now assigned proper values, and RM allocation and hw block
> > retrieval now hand out (or not) DSC blocks without causing null-pointer
> > dereferences.
> > 
> > Unfortunately it is not yet enough to get rid of completely corrupted
> > display output on the boards I tested here:
> > - Sony Xperia 1 (sm8150), 1644x3840 or 1096x2560 pixels;
> > - Sony Xperia 5II (sm8250), 1080x2520, at 60 or 120Hz;
> > - (can include more Xperia boards if desired)
> > 
> > Both devices use the DUALPIPE_DSCMERGE topology downstream: dual LM, PP
> > and DSC, but only a single INTF/encoder/DSI-link.
> > 
> > Hopefully this spawns some community/upstream interest to help rootcause
> > our corruption issues (after we open a drm/msm report on GitLab for more
> > appropriate tracking).
> > 
> > The Sony Xperia XZ3 (sdm845) was fully tested and validated with this
> > series to not cause any regressions (an one of the math fixes now allows
> > us to change slice_count in the panel driver, which would corrupt
> > previously).
> > 
> > Marijn Suijten (6):
> >    drm/msm/dpu1: Implement DSC binding to PP block for CTL V1
> >    drm/msm/dpu1: Add DSC config for sm8150 and sm8250
> >    drm/msm/dpu1: Wire up DSC mask for active CTL configuration
> >    drm/msm/dsi: Use DSC slice(s) packet size to compute word count
> >    drm/msm/dsi: Flip greater-than check for slice_count and
> >      slice_per_intf
> >    drm/msm/dpu: Disallow unallocated (DSC) resources to be returned
> 
> General comment: patches with Fixes ideally should come first. Usually 
> they are picked into -fixes and/or stable kernels. If the Fixes patches 
> are in the middle of the series, one can not be sure that they do not 
> have dependencies on previous patches. If there is one, it should 
> probably be stated clearly to ease work on backporting them.

Ack, I may have rushed these RFC patches straight off my branches onto
the lists in hopes of sparking some suggestions on what may still be
broken or missing to get DSC working on sm[12]50, but will keep this in
mind for v2 after receiving some more review.

That said, any suggestions?

- Marijn
