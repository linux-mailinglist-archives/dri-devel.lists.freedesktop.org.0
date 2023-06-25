Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BED473D340
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 21:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C9C10E192;
	Sun, 25 Jun 2023 19:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DEE10E0C6
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 19:18:33 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1F2803EEF7;
 Sun, 25 Jun 2023 21:18:31 +0200 (CEST)
Date: Sun, 25 Jun 2023 21:18:29 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 00/15] drm/msm: Add SM6125 MDSS/DPU hardware and enable
 Sony Xperia 10 II panel
Message-ID: <i5xxzhfhlwzoxlnezzgg42hzwzwfcgxv5gopqhb6vd3udz252b@wpznuvoleeta>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <035ffdd2-27e3-99bc-f8a4-41e66685db09@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <035ffdd2-27e3-99bc-f8a4-41e66685db09@linaro.org>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-24 03:42:46, Konrad Dybcio wrote:
> On 24.06.2023 02:40, Marijn Suijten wrote:
> > Bring up the SM6125 DPU now that all preliminary series (such as INTF
> > TE) have been merged (for me to test the hardware properly)
> We should not repeat the same mistake in the future.. Finding a
> balance between releasing early and releasing what we can declare
> working and tested code is hard, but we waaaaaaaay overstayed on
> this one..

I don't understand what you mean by "mistake" at all.  Yes the DPU
catalog portion of this series sat in my local branch for a very long
time.  Yes it had to be rebased on top of conflicts many many times.

However, that time has also been used to fix and extend DPU where
necessary, instead of submitting a half-broken or half-incomplete
catalog entry...

Re "we overstayed": you could have asked to clean up and send my patch,
so I don't take this as a mistake on my part as you are completely aware
of my time schedule ;)

> Konrad
> , and most

Also here, don't forget to re-quote my message if you break half-way in
the line.

> > other conflicting work (barring ongoing catalog *improvements*) has made
> > its way in as well or is still being discussed.
> 
> > 
> > The second part of the series complements that by immediately utilizing
> > this hardware in DT, and even enabling the MDSS/DSI nodes complete with
> > a 6.0" 1080x2520 panel for Sony's Seine PDX201 (Xperia 10 II).
> > 
> > The last patch ("sm6125-seine: Configure MDSS, DSI and panel") depends
> > on (an impending v2 of) my Sony panel collection series [1].
> > 
> > [1]: https://lore.kernel.org/linux-arm-msm/20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org/
> > 
> > ---
> > Marijn Suijten (15):
> >       arm64: dts: qcom: sm6125: Sort spmi_bus node numerically by reg
> >       dt-bindings: clock: qcom,dispcc-sm6125: Remove unused GCC_DISP_AHB_CLK
> >       dt-bindings: clock: qcom,dispcc-sm6125: Require GCC PLL0 DIV clock
> >       dt-bindings: clock: qcom,dispcc-sm6125: Allow power-domains property
> >       dt-bindings: display/msm: dsi-controller-main: Document SM6125
> >       dt-bindings: display/msm: sc7180-dpu: Describe SM6125
> >       dt-bindings: display/msm: Add SM6125 MDSS
> >       drm/msm/dpu: Add SM6125 support
> >       drm/msm/mdss: Add SM6125 support
> >       dt-bindings: msm: dsi-phy-14nm: Document SM6125 variant
> >       drm/msm/dsi: Add 14nm phy configuration for SM6125
> >       arm64: dts: qcom: sm6125: Switch fixed xo_board clock to RPM XO clock
> >       arm64: dts: qcom: sm6125: Add dispcc node
> >       arm64: dts: qcom: sm6125: Add display hardware nodes
> >       arm64: dts: qcom: sm6125-seine: Configure MDSS, DSI and panel
> > 
> >  .../bindings/clock/qcom,dispcc-sm6125.yaml         |  17 +-
> >  .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
> >  .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 +
> >  .../bindings/display/msm/qcom,sc7180-dpu.yaml      |   1 +
> >  .../bindings/display/msm/qcom,sm6125-mdss.yaml     | 206 +++++++++++++++++
> >  .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |  59 +++++
> >  arch/arm64/boot/dts/qcom/sm6125.dtsi               | 244 +++++++++++++++++++--
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 173 +++++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   6 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  15 ++
> >  drivers/gpu/drm/msm/msm_mdss.c                     |   8 +
> >  15 files changed, 712 insertions(+), 25 deletions(-)
> > ---
> > base-commit: 8d2be868b42c08290509c60515865f4de24ea704
> > change-id: 20230624-sm6125-dpu-aedc9637ee7b
> > 
> > Best regards,
