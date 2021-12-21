Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E538147C3B5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 17:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA40F11ADE4;
	Tue, 21 Dec 2021 16:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B71911ADE7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 16:22:26 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A98263F659;
 Tue, 21 Dec 2021 17:22:22 +0100 (CET)
Date: Tue, 21 Dec 2021 17:22:21 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 0/2] Use "ref" clocks from firmware for DSI PLL VCO
 parent
Message-ID: <20211221162221.jkbpi3oehcrpnz2s@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Andy Gross <agross@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20210911131922.387964-1-marijn.suijten@somainline.org>
 <163165584152.763609.4056232270079096475@swboyd.mtv.corp.google.com>
 <20210918144038.6q352hzqopx7vvdu@SoMainline.org>
 <20211214194656.mayiy4xhcshjluwf@SoMainline.org>
 <69e44191-201f-8714-8a83-1a65a7026b54@linaro.org>
 <20211216004346.77383C36AE1@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216004346.77383C36AE1@smtp.kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, linux-clk@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-15 16:43:45, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2021-12-15 12:02:37)
> > On 14/12/2021 22:46, Marijn Suijten wrote:
> > > Hi all,
> > > 
> > > On 2021-09-18 16:40:38, Marijn Suijten wrote:
> > >> On 2021-09-14 14:44:01, Stephen Boyd wrote:
> > >>> Quoting Marijn Suijten (2021-09-11 06:19:19)
> > >>>> All DSI PHY/PLL drivers were referencing their VCO parent clock by a
> > >>>> global name, most of which don't exist or have been renamed.  These
> > >>>> clock drivers seem to function fine without that except the 14nm driver
> > >>>> for sdm6xx [1].
> > >>>>
> > >>>> At the same time all DTs provide a "ref" clock as per the requirements
> > >>>> of dsi-phy-common.yaml, but the clock is never used.  This patchset puts
> > >>>> that clock to use without relying on a global clock name, so that all
> > >>>> dependencies are explicitly defined in DT (the firmware) in the end.
> > >>>
> > >>> I can take this through clk tree if it helps avoid conflicts. There are
> > >>> some other patches to sdm660.c in the clk tree already.
> > >>
> > >> Might be useful to maintain proper ordering of these dependent patches
> > >> but it's up to Dmitry and Rob to decide, whom I'm sending this mail
> > >> directly to so that they can chime in.
> > > 
> > > Dependent patch [3] landed in 5.15 and [2] made it into 5.16 rc's - is
> > > it time to pick this series up and if so through what tree?
> > 
> > I'd also second the idea of merging these two patches into 5.17.
> > Most probably it'd be easier to merge both of them through the clk tree. 
> > Or we can take the first patch into drm-msm (but then we'd have a 
> > dependency between msm-next and clk-qcom-next).
> > 
> > Bjorn, Stephen?
> > 
> 
> Sounds fine to take through clk tree.

Thanks Stephen, would be great to take this in through the clk tree for
5.17.  I don't have anything to add that could possibly warrant a v3,
only msm8996 remains with the "xo" clock but that needs more work in
other drivers and is best dealt with separately.  Please take v2,
assuming there are enough acks/reviews :)

- Marijn
