Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFC7545DA4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 09:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BC510E6D5;
	Fri, 10 Jun 2022 07:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F9510E347;
 Fri, 10 Jun 2022 07:35:58 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DC1E31F714;
 Fri, 10 Jun 2022 09:35:54 +0200 (CEST)
Date: Fri, 10 Jun 2022 09:35:47 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 04/11] drm/msm/dsi/phy: Reindent and reflow multiline
 function calls
Message-ID: <20220610073547.meftbrcxk274kxhq@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Marek <jonathan@marek.ca>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20220601220747.1145095-1-marijn.suijten@somainline.org>
 <20220601220747.1145095-5-marijn.suijten@somainline.org>
 <CAA8EJpqU6y3YKfZpgKORCfns-LN81NhqOetQbBC_Z4gVdMQakg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqU6y3YKfZpgKORCfns-LN81NhqOetQbBC_Z4gVdMQakg@mail.gmail.com>
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
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-06-02 13:14:26, Dmitry Baryshkov wrote:
> On Thu, 2 Jun 2022 at 01:07, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > Patch 613cbd1da3c9 ("drm/msm/dsi: use devm_clk_*register to registe DSI
> > PHY clocks") introduced the devm_ prefix to clk_hw registration calls,
> > without updating the indentation of the arguments on the following
> > lines.
> >
> > Similarly e55b3fbbbbc8 ("drm/msm/dsi: drop PLL accessor functions")
> > moved from pll_write to dsi_phy_write without updating the indentation
> > of followup arguments either.
> >
> > Preparing for a series that heavily touches the clk calls, reflow and
> > reindent function calls that are adhering to an 80-char column limit by
> > spanning multiple lines.  Where function names are very long the
> > arguments are indented with a fixed number of two tab characters instead
> > of aligning with the opening parenthesis of the function call.
> >
> 
> I'm not a fan of reindenting the code, but let's do it.

I don't like it either, but it's better than trying to figure out how to
add and flow new arguments into the call-site while also leaving the
indentation in the same broken state.  At the same time it seems more
consistent to fix up most faults rather than only touching clk calls.

It's unfortunate that there's no proper autoformatter for C, that is
consistently used across the kernel tree.  Makes for a lot of mundane,
error-prone, manual work.  But alas.

- Marijn
