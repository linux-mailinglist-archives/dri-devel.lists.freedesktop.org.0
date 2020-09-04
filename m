Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DAA25D561
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 11:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388C76E030;
	Fri,  4 Sep 2020 09:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576696E02E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 09:46:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j2so6074792wrx.7
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 02:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iVx7hC5Z+ZE9a7SrgsdYEtoRluDNQl4XcnFv96CEECo=;
 b=GkEwuFZ2XgoFCAbgB9JFRh7/4rIuBnkk7B3WowF0Ouo7ZwRGjDRK2ZDlmZJ2RLg/On
 nrfPdZUS/h6zd7gpkrNCNoCHNFDi305JAdVAde3a7doEtdHs0smrUnlcdJG+pKDd/cO7
 z7gpywm58gbc6ZQtGbyM4abXSOAwVd/o12b8eqbMIFpwHGPaugZDkoyz3B5fyVcPllbH
 rhj30xsmlH1C15HVBRhssiDsZvK16TDN6lMszim4cQjNM01buVbRtafq3/3c+yhlPLjS
 mzWOjOvn/OLzZPG+rs7d835O+afcHy1Qx9kDXY5pA1V4bgiKpFHrAZ3z4gH8TtH47vbm
 sVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iVx7hC5Z+ZE9a7SrgsdYEtoRluDNQl4XcnFv96CEECo=;
 b=af2eR+M4y7JXv8aYIlC6pq5LCqSg6oSnAC5YHNrUNjE5eDZfp1E/7vtBryZqmKAoUy
 FAwXHjxLPjzsibyBlVX+H9tcA8gHLZFjsI4fkvQCP2HIn/8WaEUtxqDgIQ71gHARYG2p
 pQWhFR8MbYJF5FrzTMN+dXOvMdLIqZRCh95Dwnxk9dMDlBTrhdpB9R02cwnpocCPBBQn
 BLCa5u+gzIV1Rk0pZnkj7p2MvpP1lnimA2NfpSXcPfhobHr84o1maOILMLYloaZk4dM+
 atWuhXTq0fkuGvIiqNHGjfhWqtZDXmxfd14WsWNCKd6QKbWnS5Z0eQJR9lr2TVRlHReq
 5wBw==
X-Gm-Message-State: AOAM533htqavFUcV3Dvq71tK2dWGw27+UAmegfBKCKxMpYvE88Flu2yV
 coXo1cd5AGFEkyox4s6R8YDZ6Z7IsXR8T2aTrnGpxw==
X-Google-Smtp-Source: ABdhPJwptTnuYBF7f+Osku8uKwpWjtboRQN9W4oEJ9YqWxV4nkxW6SWMHqNqVamQSLiM39jayeQ7YaNuePi+ebV3FW8=
X-Received: by 2002:a5d:4949:: with SMTP id r9mr7050780wrs.27.1599212800728;
 Fri, 04 Sep 2020 02:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <d757ddd6549da140f178563e5fd2bf1d129913fd.1599120059.git-series.maxime@cerno.tech>
In-Reply-To: <d757ddd6549da140f178563e5fd2bf1d129913fd.1599120059.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 4 Sep 2020 10:46:26 +0100
Message-ID: <CAPY8ntC_Tobv+4TtgtYhvAst00_zsfxZdZd=torcb57SQ0CMQA@mail.gmail.com>
Subject: Re: [PATCH v5 75/80] drm/vc4: hdmi: Add pixel BVB clock control
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Thu, 3 Sep 2020 at 09:03, Maxime Ripard <maxime@cerno.tech> wrote:
>
> From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
>
> The BCM2711 has another clock that needs to be ramped up depending on the
> pixel rate: the pixel BVB clock. Add the code to adjust that clock when
> changing the mode.
>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> [Maxime: Changed the commit log, used clk_set_min_rate]
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> Link: https://lore.kernel.org/r/20200901040759.29992-3-hoegeun.kwon@samsung.com
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
>  2 files changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index ab7abb409de2..39508107dafd 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -54,6 +54,7 @@
>  #include "vc4_regs.h"
>
>  #define CEC_CLOCK_FREQ 40000
> +#define VC4_HSM_MID_CLOCK 149985000

I didn't flag it earlier, but this is a bit of a weird name for the
define. I know it wants to be concise, but it made me do a double take
as to what it is for.
I'm currently applying all these patches to our Raspberry Pi tree and
actually CEC needs a fixed HSM on Pi0-3 to avoid recomputing all the
timings. So I have a VC4_HSM_CLOCK define which is the fixed clock
rate for Pi 0-3.
This one is more a threshold for HSM to control BVB, and my brain
starts to hurt over what it should be called.

Unless there are other comments around this patchset (and I hope to
read through the remaining ones today), then I don't consider it a
blocker, but we can probably do better as and when we add the next
threshold for 4k60.
My current understanding is that the clock has to be an integer divide
of 600MHz, and at least the pixel rate / 2, so the only link to HSM is
due to HSM being 101% of pixel rate, but I will try to find
confirmation of that.

>
>  static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
>  {
> @@ -344,6 +345,7 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder)
>         HDMI_WRITE(HDMI_VID_CTL,
>                    HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
>
> +       clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
>         clk_disable_unprepare(vc4_hdmi->hsm_clock);
>         clk_disable_unprepare(vc4_hdmi->pixel_clock);
>
> @@ -516,6 +518,27 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder)
>                 return;
>         }
>
> +       /*
> +        * FIXME: When the pixel freq is 594MHz (4k60), this needs to be setup
> +        * at 150MHz.
> +        */

Typo here. For 4k60 we need 300MHz (pixel clock / 2)

Otherwise
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> +       ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock,
> +                              (hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
> +       if (ret) {
> +               DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
> +               clk_disable_unprepare(vc4_hdmi->hsm_clock);
> +               clk_disable_unprepare(vc4_hdmi->pixel_clock);
> +               return;
> +       }
> +
> +       ret = clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
> +       if (ret) {
> +               DRM_ERROR("Failed to turn on pixel bvb clock: %d\n", ret);
> +               clk_disable_unprepare(vc4_hdmi->hsm_clock);
> +               clk_disable_unprepare(vc4_hdmi->pixel_clock);
> +               return;
> +       }
> +
>         if (vc4_hdmi->variant->reset)
>                 vc4_hdmi->variant->reset(vc4_hdmi);
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 34138e0dd4a6..59639b405b7f 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -119,6 +119,7 @@ struct vc4_hdmi {
>         struct clk *pixel_clock;
>         struct clk *hsm_clock;
>         struct clk *audio_clock;
> +       struct clk *pixel_bvb_clock;
>
>         struct debugfs_regset32 hdmi_regset;
>         struct debugfs_regset32 hd_regset;
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
