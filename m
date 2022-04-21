Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD3C50A433
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 17:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD08810E61C;
	Thu, 21 Apr 2022 15:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE8F10E867
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 15:29:59 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id v1so2819132ljv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 08:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rWHrkI/plHQsKHEeS5/0Rby949Lxiklh2NSSrLYMtUM=;
 b=ZhforE7iVW5RAp7ovyVF911uWEZSiPFqpwhnpmO8NbXTjh/OEabvdgvFeeGy86Iyjx
 ARnVvz6IBOS3JkLh8eCwYpnKjgfkxZmH6+UQBzOY/Gzk7bdYAcEzGeXpg+Nknw4p+8FC
 aqR5gA0GKGWQLbDBgz4ayC70r7I+L74SaskP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rWHrkI/plHQsKHEeS5/0Rby949Lxiklh2NSSrLYMtUM=;
 b=8BW2iTl81brO1oQ6fErVX6HuhNdCcbnbHcwLy0UXyEeFC43N0tj+pZuTSgjnIjMeRg
 Hz0fzOiqvLBurspOquv+GAb4L1jlURKA3CvXVNFZ1Oe4N5soiJubNnYKD6NJl+J47N4Q
 vepJR13R1kVmSGkvqaxDam+/UTLTIcyhjn9hK5uHqlQIf+qdG5yPiYXvD9gTwiAjiMd3
 +vaVBS6GAo2W+AEhlzUyvT72i5zR7HmFXnnyMMgkDdgqDKO1WiaOCMCAv90klzRjMUJY
 YbsuwPIY2THs+o+I0kOYCrgOFjzRXBXc/pGabEvR/Vj8FgJgCke7yXpsVGT+hFWfG//0
 u7rg==
X-Gm-Message-State: AOAM532VDsAgHMnJZrr0O6K3S075eCiXosf2J5NcRoR80nUB2JmoSJCF
 kpJ5JtZqy5i/BeDm1olG9mdIrHuvJOIDouulqD0=
X-Google-Smtp-Source: ABdhPJxqgnl/J+UNITVJC47sM35dEhx0u8SVZwbW8HFhnnr1oCmfiosiBAuZTUYfCpmSEwA3ie8vZQ==
X-Received: by 2002:a2e:a88b:0:b0:24b:5714:213d with SMTP id
 m11-20020a2ea88b000000b0024b5714213dmr159646ljq.412.1650554997092; 
 Thu, 21 Apr 2022 08:29:57 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 g16-20020a2eb5d0000000b0024dce02dbeasm717997ljn.20.2022.04.21.08.29.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 08:29:56 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id v1so2819015ljv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 08:29:56 -0700 (PDT)
X-Received: by 2002:a05:6000:1105:b0:20a:80b4:bcaf with SMTP id
 z5-20020a056000110500b0020a80b4bcafmr166285wrw.679.1650554634333; Thu, 21 Apr
 2022 08:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <1650551811-24319-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650551811-24319-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1650551811-24319-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Apr 2022 08:23:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UVmUG0t-8wFXT-NT1-naojeJ_gcd8eEVr96AnMos0m4A@mail.gmail.com>
Message-ID: <CAD=FV=UVmUG0t-8wFXT-NT1-naojeJ_gcd8eEVr96AnMos0m4A@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
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

On Thu, Apr 21, 2022 at 7:37 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The panel-edp enables the eDP panel power during probe, get_modes
> and pre-enable. The eDP connect and disconnect interrupts for the eDP/DP
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
> Changes in v8:
>   - add comment explaining the interrupt status return
>
> Changes in v7:
>   - reordered the patch in the series
>   - modified the return statement for isr
>   - connector check modified to just check for eDP
>
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 18 ++++++++++++------
>  drivers/gpu/drm/msm/dp/dp_display.c | 22 +++++++++++++++++++++-
>  2 files changed, 33 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index fac815f..3a298e9 100644
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
> @@ -599,13 +595,23 @@ u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
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
> +       /*
> +        * REG_DP_DP_HPD_INT_STATUS reports the status of all interrupts
> +        * irrespective of their masked status. The HW interrupt will not be
> +        * generated if an interrupt is masked. However, the interrupt status
> +        * bit in the register will still be set. The eDP controller driver
> +        * masks the plug and unplug interrupts unlike DP controller which
> +        * unmasks all the interrupts. So, do not report the status of the
> +        * masked interrupts.
> +        */
> +       return isr & (mask | ~DP_DP_HPD_INT_MASK);

What's still missing in your comments is why you aren't just doing
"return isr & mask;". In other words, why is the API for HPD bits
different from the API for non-HPD bits? What code out there wants to
know about non-HPD interrupts even if they are masked?

Actually, thinking about this more, my preference would be this:

a) Rename the existing function to dp_catalog_hpd_get_intr_status_raw()

b) Create a new function called dp_catalog_hpd_get_intr_status() whose
implementation is:

  return dp_catalog_hpd_get_intr_status_raw() & mask;

Then any callers who care about the raw status can be changed to call
dp_catalog_hpd_get_intr_status_raw(). If no callers need
dp_catalog_hpd_get_intr_status_raw() then you don't actually need to
create this function.

If you make that change then all of a sudden the API isn't weird/wonky
and you can just get rid of the comment I asked you to add.


-Doug
