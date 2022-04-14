Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E4D5018D4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 18:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6A010FEC9;
	Thu, 14 Apr 2022 16:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C7610FEC9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 16:39:51 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id lc2so11082166ejb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 09:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nYg934FepxhPHJYVYrZutxuJmtuv3DcX7+LrwvmwUiI=;
 b=eGFM3ztMn9Emo9AjWCLBFf6FEEMtubNIu4UVefX1GeJ26mF6dhm/kQWOM5JylyVuYl
 AHn+lsZ0Yi4quPDxF8v/hLAKDCzF3fDmkLwshBHfrSsZIyCpo3q5P97DH5qN01gnoVSV
 2s/CAcL2joy6KFQjXDYCrSGLKApreqzCGzpJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nYg934FepxhPHJYVYrZutxuJmtuv3DcX7+LrwvmwUiI=;
 b=ZCrdXZWo1n4nCaLNpW7B/e/Sj/Ihm1IOmnuGPPLj2rCwg2tPGP01gjkiomP+ERfjOo
 p64K8UhSYAlf3RpSZtQsNdyaxm2Bf1o1rt84G/O2ifXq6H272TqrimHssXMnragL3Ag7
 LmuIgq6kBbWR/UHK+pwGnumjSIdpxivwdF9ZXES8gRP7e3CkSbZ7kFfAfXWgCDsaYeUM
 Clc/4o8Qd1Y3ohKJyzm3O4RQCfMLHF/To9h1L8Kfivny9dL3Ih8EdzgWvJZn2LAzmj9L
 0KxOK+N9AT9nsnQOKm7pwrNglynGEkbXktdlLyPyED6DTHI/VEeJyFm+oq+VPJHGeMlE
 +S+g==
X-Gm-Message-State: AOAM530GFLP+mykd81B/c2VzGS2tkHAQ8BsWMTTSV8rjCPjS+0mrbdCO
 W4SplFDwW0YAsgNXbbFHvqnHcsHbu9wLXl7Y
X-Google-Smtp-Source: ABdhPJwssDZhVGwNoQoanb0wJhLjavL1dWEFoF2tyZAewB2ajyj24UjSHiAJLvbd2YWfYCU9Q/l/rA==
X-Received: by 2002:a17:907:728c:b0:6e8:bb41:7df8 with SMTP id
 dt12-20020a170907728c00b006e8bb417df8mr3012547ejc.688.1649954389873; 
 Thu, 14 Apr 2022 09:39:49 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 d7-20020a170906174700b006e80a7e3111sm825105eje.17.2022.04.14.09.39.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 09:39:49 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso6355693wml.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 09:39:49 -0700 (PDT)
X-Received: by 2002:a05:600c:502b:b0:38f:f7c6:3609 with SMTP id
 n43-20020a05600c502b00b0038ff7c63609mr3225672wmr.15.1649954388394; Thu, 14
 Apr 2022 09:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1649938766-6768-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Apr 2022 09:39:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uc+qVKH7fAkqtB+Y_jHpWXy5tOABRCN=8TH1bibAp+8Q@mail.gmail.com>
Message-ID: <CAD=FV=Uc+qVKH7fAkqtB+Y_jHpWXy5tOABRCN=8TH1bibAp+8Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 14, 2022 at 5:20 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The panel-edp enables the eDP panel power during probe, get_modes
> and enable.

Technically the panel-edp powers on the panel in pre_enable()


> The eDP connect and disconnect interrupts for the eDP/DP
> controller are directly dependent on panel power. As eDP display can be
> assumed as always connected, the controller driver can skip the eDP
> connect and disconnect interrupts. Any disruption in the link status
> will be indicated via the IRQ_HPD interrupts.
>
> So, the eDP controller driver can just enable the IRQ_HPD and replug
> interrupts. The DP controller driver still needs to enable all the
> interrupts.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>
> Changes in v7:
>   - reordered the patch in the series
>   - modified the return statement for isr
>   - connector check modified to just check for eDP
>
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  9 +++------
>  drivers/gpu/drm/msm/dp/dp_display.c | 22 +++++++++++++++++++++-
>  2 files changed, 24 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index fac815f..07f2389 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -569,10 +569,6 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
>
>         u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
>
> -       /* enable HPD plug and unplug interrupts */
> -       dp_catalog_hpd_config_intr(dp_catalog,
> -               DP_DP_HPD_PLUG_INT_MASK | DP_DP_HPD_UNPLUG_INT_MASK, true);
> -
>         /* Configure REFTIMER and enable it */
>         reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
>         dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
> @@ -599,13 +595,14 @@ u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
>  {
>         struct dp_catalog_private *catalog = container_of(dp_catalog,
>                                 struct dp_catalog_private, dp_catalog);
> -       int isr = 0;
> +       int isr, mask;
>
>         isr = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
>         dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
>                                  (isr & DP_DP_HPD_INT_MASK));
> +       mask = dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
>
> -       return isr;
> +       return isr & (mask | ~DP_DP_HPD_INT_MASK);

Please add a comment above this explaining what the goal of the above
statement is. I guess it's something like this, though you might want
to modify it to remove snark and insert the real reason unless you
like being snarky:

  /*
   * Report the raw status of all interrupts (AKA we still report the
   * interrupt as asserted even if it's masked) _except_ for HPD-related.
   * interrupts. We only report HPD-related interrupts if they're
   * unmasked. We do it this way because we thought it would be extra
   * confusing for readers of this code and we were bribed by Mordac to
   * confuse you.  OK, maybe that's not true. We actually do it this way
   * because of <insert your compelling reason here>.
   */

Along the same lines as my comments in patch #1, I don't have a great
feel for exactly when the various HPD bits are enabled / disabled and
it feels like it need to be made super obvious / well documented. That
being said, I'd be OK w/ that happening in the proposed cleanup.


-Doug
