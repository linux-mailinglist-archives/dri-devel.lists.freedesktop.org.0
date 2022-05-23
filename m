Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D2531F51
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 01:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E070110E4EE;
	Mon, 23 May 2022 23:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCD510E4EE
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 23:43:13 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id h9so9164578qtx.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 16:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vo71c+n/wCWfUYChsCch/TOZTAc6RqS7hic8WUvcoIw=;
 b=b1HZCTlc0FaASasHRCD5Y4kmWzTiLs2LaQl7/CXAt9GX3aDYUTR+mEWyBmw6QyDjt0
 kqoqMhMB7Pb3sbK/HKSgcZG0lKxupwMeKXRmTekoG+0tSkivdjQZ4FQVz23bKT9fKurd
 gFH178OzpkErKGL+s0tqPjvX6Q/YMAxaQ0BoEB5n8E3Z34ZOQsdTCMGjsAQxXESXvteq
 vNVOIS9eoKRtkaVRQ4oz4jZMWxwJHYLdIuxnM3g2JKYoP8Yr+Gx2yzwrrrYIOiQe99ET
 7UXJKrS42Tnbe12+4yhg0jflTmXsJbahMHsA1CgFxMKNVA/2xzXV1sWrEPEVqWdPse5m
 iRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vo71c+n/wCWfUYChsCch/TOZTAc6RqS7hic8WUvcoIw=;
 b=fjwqr0MnjdUDMB9X2Yw2UlMuDsQ11qlSdYXiAn4EMvADJgy2ewb54iVUQkI/ddVk7m
 /r401LL1V5j+p0W8gyqi4UgaklWysPnq2vPg5ZHmi+jJXEeTrjPIuoP2Rd7DNHuKmGc1
 l3eAN2QG2l9yxNKRndJGu/2zSuwGQJ5r2UErvCX1dpDc6m22Z+g209OHEJwXh1L4OCy4
 rZgHqJBZjvsIIDnAixd/Ds8QLfzUwHAoUZ23cDhFGfZ6bpWSulusXuRNEuKYp85Z6DhR
 //n78DQxnX01KLPUVyF23UavJaPSLQ0tOzT6YcvDroVcxhtzPEGVjqfOhNA3U/tyB7hq
 ZphA==
X-Gm-Message-State: AOAM533RGDw0P8BD4BC1yj36Nq3njKKm/MPm2GCQaLllGcOceAg0jvXR
 SC1p3+y9E0YftO+0Y8I0DScwiZH6e7B9ayWolXSW2Q==
X-Google-Smtp-Source: ABdhPJzUW9RhiGAZVdELoGYpBS6ZpU1N20WruTBeXfIZLJ+KEXjedEvFNxLgd/OJk3jzcNbkBvu6dH9ebgySiUvx914=
X-Received: by 2002:ac8:5e54:0:b0:2f3:f4ee:efbd with SMTP id
 i20-20020ac85e54000000b002f3f4eeefbdmr17894617qtx.295.1653349392378; Mon, 23
 May 2022 16:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220523213837.1016542-1-marijn.suijten@somainline.org>
In-Reply-To: <20220523213837.1016542-1-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 May 2022 02:43:01 +0300
Message-ID: <CAA8EJprEjOWRh98V3sprjXZJZMeR25Bz1U3a_uX_KhRbU48srQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm/msm/dsi_phy: Replace parent names with clk_hw
 pointers
To: Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
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
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 24 May 2022 at 00:38, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> As stated in [1] I promised to tackle and send this series.
>
> parent_hw pointers are easier to manage and cheaper to use than
> repeatedly formatting the parent name and subsequently leaving the clk
> framework to perform lookups based on that name.
>
> This series starts out by adding extra constructors for divider, mux and
> fixed-factor clocks that have parent_hw(s) pointer argument(s) instead
> of some DT index or name.  Followed by individual patches performing the
> conversion, one DSI PHY at a time.
>
> dsi_phy_28nm_8960 includes an extra fixup to replace "eternal"
> devm_kzalloc allocations (for the lifetime of the device) with
> stack-local char arrays, like all the other DSI PHY drivers.
>
> I couldn't help but notice that clock names are wildly varying:
>
> - Some use underscores in the _clk suffix where others have nothing;
> - Some have an _ after the %d, others have not;
> - Some use a _pll suffix after dsi%d or even _phy_pll suffix.
>
> Are there any thoughts or feelings towards unifying these?
> Theoretically no clock names are used anywhere in the kernel, and
> everything is based on a phandle + index in DT (I have yet to validate
> this).  Obviously no .name/.fw_name will be updated to not break DT.

I'd say, leave them as is. Even if they are historical, we don't have
a strong pressure to change them.

Significant number of older platforms still use names to identify the
clock. And moreover apq8096/msm8960 uses dsi1/dsi2 instead of
dsi0/dsi1.

Probably we should call the next cycle "The Cycle of clocks cleaning".
I can volunteer to take care of 8960/8064/8016/8996, as at least I can
test them. But if you wish, you (or anybody else of course) can take
any of these platforms too, just ping me, so that I won't spend time
duplicating somebody's efforts.

> Which, by the way, is there a particular reason for:
>
>   #define DSI_BYTE_PLL_CLK              0
>   #define DSI_PIXEL_PLL_CLK             1
>
> To not be in the dt-bindings and used in the DT?

Before my restructure of the DSI PHY subsys, each driver defined them
separately. And the idea of moving them to a dt-bindings header didn't
come to my mind. Feel free to do so, it looks like a good idea.
Just as a note, DP PHY also uses 0 for the link clock and 1 for the
pixel clock. What do you think about having a single header for these
names?

>
> And with enough future improvements out of the way, let's round out this
> patch-series by stating that it has been successfully tested on:
>
> - Sony Nile Discovery (Xperia XA2 Ultra): 14nm;
> - Sony Seine PDX201 (Xperia 10II): 14nm;
> - Sony Loire Suzu (Xperia X): 28nm.
>
> And no diff is observed in debugfs's clk_summary.
>
> Unfortunately all other devices in my collection with a 7/10nm DSI PHY
> have a DSC panel which we have yet to get working.

I will test it on RB3 (10nm) and RB5 (7nm) during one of the next few days.

>
> [1]: https://lore.kernel.org/linux-arm-msm/20220502214235.s5plebunh4ttjhge@SoMainline.org/
>
> Marijn Suijten (9):
>   clk: divider: Introduce devm_clk_hw_register_divider_parent_hw()
>   clk: mux: Introduce devm_clk_hw_register_mux_parent_hws()
>   clk: fixed-factor: Introduce *clk_hw_register_fixed_factor_parent_hw()
>   drm/msm/dsi_phy_28nm: Replace parent names with clk_hw pointers
>   drm/msm/dsi_phy_28nm_8960: Replace parent names with clk_hw pointers
>   drm/msm/dsi_phy_28nm_8960: Use stack memory for temporary clock names
>   drm/msm/dsi_phy_14nm: Replace parent names with clk_hw pointers
>   drm/msm/dsi_phy_10nm: Replace parent names with clk_hw pointers
>   drm/msm/dsi_phy_7nm: Replace parent names with clk_hw pointers
>
>  drivers/clk/clk-fixed-factor.c                | 57 ++++++++++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 92 ++++++++-----------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 36 ++++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 52 +++++------
>  .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 26 ++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 92 +++++++++----------
>  include/linux/clk-provider.h                  | 34 +++++++
>  7 files changed, 209 insertions(+), 180 deletions(-)
>
> --
> 2.36.1



-- 
With best wishes
Dmitry
