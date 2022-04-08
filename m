Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF82A4F98C7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 16:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D5B10E4E0;
	Fri,  8 Apr 2022 14:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C53410E4E7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 14:58:42 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id s11so10879077qtc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 07:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oK4c0Q5n4J9QZqL0KRS62UFXdtvmGL0QpHUG9UqlFtM=;
 b=JiaoeEJ/h9I9ehyz8BB6b9aKvzhlWiELooPvTLvhQPWAibE2DQQfgLRqmoAyu/5dvT
 rnPF14ChjvoWWRTv1O1+XGk7d7CJaDjrPBzhI5kNAqSbVvHLEDKlSwnepynKSS382oJy
 KRSei97PDYMYZ94FSluYQxLrD913+mXOOxVOtoZkWB3KA5eS5WrnMIHM2QkMCAAs7Dbu
 7bmklpOVzpmMLTFCXp1ZBNeN4XW577KkV4MJy3932uMLZ3wmLOWREGM25Ndko/6r690q
 r5EPs7PQTXDQR5cT4l3+GmWBYArICqxEdbETXBxTRdr6Q6Dhix31+mOqoVVKgySLNTpy
 VmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oK4c0Q5n4J9QZqL0KRS62UFXdtvmGL0QpHUG9UqlFtM=;
 b=TjGGiF9Cx0HcI4gxMNrGmZUDKv+CKMgeae/f4RoIthdmQ/WFNoK6wDi+CD1G4pL8LL
 yBRSmnWVNviALMyIU117Jjlur8TLx+PgxT6cLCIQs+wU6rLCx//VlDQQws5W7dwN7wMP
 SYVOMNcycmIcPmmjroo9wC+RNuMhWQOu3w6lJj0iTvrFQ3AzpcZSiEbP3IqbhWKuWHtk
 Vf7rXl1BpyB3g4drj87+RUfamyMuQiRco+ATg4+RMhJ4uURpy2maao8FFeIC73bzFnXs
 pkchsTbQeYeD22LTgc/BTcBauXfWX4mWazae99qKTf5ml0JQUeeWhaf8G1ywypWBtFep
 mLtQ==
X-Gm-Message-State: AOAM533Oa3tjmbbLyB9aXLKnLsIb1cpxKJQHPz+koXKV1rh9uwH8mX98
 UNtYd+JrHnuC8Sreb65ooB0LxMpt9HQF9E36TxVwsw==
X-Google-Smtp-Source: ABdhPJz4zF64TRpqJTVRBI33gdjEupkPabNbuA0AKMSnErc+1tO72wtp19hJVfKoDbuiPTth9omw+T8ZHl/AJ/7gkmg=
X-Received: by 2002:ac8:5a46:0:b0:2e2:2edd:374 with SMTP id
 o6-20020ac85a46000000b002e22edd0374mr16119166qta.295.1649429920056; Fri, 08
 Apr 2022 07:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
 <392b933f-760c-3c81-1040-c514045df3da@linaro.org>
 <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
 <CAA8EJppt9XONbgtKfmHmN+==QNqiVJeb8GKJFdZm=yyY-tgmHQ@mail.gmail.com>
 <CAD=FV=U5-sTDLYdkeJWLAOG-0wgxR49VxtwUyUO7z2PuibLGsg@mail.gmail.com>
 <CAA8EJppgfYgQjG8A4LsR-1wmBj3Ku3eO8cKfAYhxjWXL7e3eHg@mail.gmail.com>
 <CAD=FV=V=a1CnT8fqTJR40WoS3BaDQ3xZ=HnHVHqZh=MEmVUZBA@mail.gmail.com>
 <3e5fa57f-d636-879a-b98f-77323d07c156@linaro.org>
 <CAD=FV=Uibu-kZyix7K4_WVc-+C8xpzTqU4WFy7O=6sukMZrX5g@mail.gmail.com>
 <MW4PR02MB7186245772DAC3E04FA8D1C0E1E69@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAD=FV=Wk3U7_bVdiCPp8iQ4bcCA_Botemu4pwHeRtgBa3Xk6KQ@mail.gmail.com>
 <c4f086ce-c56f-f7c9-4092-7f2432330d50@quicinc.com>
 <CAD=FV=UmU_BVUaL_X75yOEvQPtGUBTR5-jiVWBHq7uSRt6HM4Q@mail.gmail.com>
 <225d2c0a-42ec-28ad-688c-e7e9e2035ee1@quicinc.com>
 <CAD=FV=W=WjSACHvRDFBnkLUp-LU2c4XMu3=FTzTx=zexNF5PAw@mail.gmail.com>
 <CAA8EJpqLZ9up4euGEbhf5QyBqm4tJuLcHi7D+0Si7ak9Jej52w@mail.gmail.com>
 <CAD=FV=XwOzsRf7RnvyBjr5TtedMhC0LJFKoK9tp-kw1eEyuJmQ@mail.gmail.com>
 <CAA8EJprb5UF24WRNvGaY_hSqW--NPd=9=8AaPYWSMbUumNn+dQ@mail.gmail.com>
 <CAD=FV=UG7k4A+hMXxwju-0mLddD1oJdGngXMkMA-dO3AxOx0rQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UG7k4A+hMXxwju-0mLddD1oJdGngXMkMA-dO3AxOx0rQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Apr 2022 17:58:28 +0300
Message-ID: <CAA8EJprLRiWrkqLG09UG1arDmo1fuq917ztfxts66p+AaYcYbA@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
To: Doug Anderson <dianders@chromium.org>
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
 <devicetree@vger.kernel.org>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Apr 2022 at 16:43, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Apr 8, 2022 at 5:20 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > > I guess my thought was that in DP you could still create the AUX bus
> > > at probe time. Then for DP you just return an instant "transfer
> > > failed" from the AUX bus if HPD isn't asserted. For eDP (as discussed
> > > elsewhere) when we try to do an AUX transfer then we delay until HPD
> > > is there.
> >
> > I think panel-edp would already handle the delay, so we do not need to
> > have this logic in the DP driver.
>
> There's a whole discussion about this between Stephen and me in patch
> #5 ("drm/msm/dp: wait for hpd high before any sink interaction").
> Basically:
>
> * If panel HPD is hooked up to the dedicated HPD pin on the eDP
> controller then the panel driver doesn't have a way to read it.

I refreshed that dialog. I must admit, I have missed the fact that the
HPD pin might not be visible as the GPIO pin.

> * We can't leverage the existing "HPD" query functions in DRM because
> those indicate whether a panel is _physically_ connected. For eDP, it
> always is.

Yes, I was thinking about (mis)using the
drm_bridge_connector_hpd_notify() for generic HPD-related
notifications (to tell eDP that it should check the current state). I
have abandoned that idea.

> For now the rule is that the AUX transfer function is in charge of
> waiting for HPD for eDP if the dedicated HPD pin is used. If we want
> to re-invent this we could, but that system works, isn't _too_ ugly,
> and we're already making big enough changes in this series.

The is_hpd_asserted() looks like a good callback for the aux bus.
It will allow the panel driver to check if the panel is powered up (in
the absence of the GPIO pin).

> > > So we can still acquire resources (clocks, PHY, io maps, etc) at probe
> > > time for DP and create the AUX bus, right? It will just return
> > > "-ENODEV" if HPD isn't asserted and you're DP?
> >
> > Yes, please. I still suppose that we'd need a separate case to
> > power_on eDP's PHY during the probe time. Maybe I'm mistaken here.
>
> I think the ideal way is to do it like Kieran's proposal for sn65dsi86:
>
> https://lore.kernel.org/r/20220317131250.1481275-4-kieran.bingham+renesas@ideasonboard.com/
>
> * When enabling HPD (physical hot plug detect) in the hpd_enable()
> callback you do a pm_runtime_get(). You do the
> pm_runtime_put_autosuspend() when disabling. This is only used for DP
> since we only provide DRM_BRIDGE_OP_HPD for DP, not for eDP.
>
> * We do a pm_runtime_get() / pm_runtime_put_autosuspend() in the AUX
> transfer routine. While holding the pm_runtime reference we check HPD.
> For DP we return immediately if HPD isn't asserted. For eDP, we delay.
>
> * We do the pm_runtime_get() in pre_enable and the pm_runtime_put() in
> post_disable. For DP this will add a 2nd refcount (since we probably
> were holding the reference for HPD). For eDP this will cause us to
> power on.
>
> * If there's any other time we need to read HW registers, and we
> aren't guaranteed to already have a pm_runtime reference (like during
> probe), we can do a temporary pm_runtime_get() /
> pm_runtime_put_autosuspend().

This looks good. I'd be more than welcome to review such series.

Note: I think this would require using
drm_bridge_connector_enable_hpd() in the DP code.
Hopefully at some point we would be able to move all
drm_bridge_connector calls to the core msm layer.
--
With best wishes
Dmitry
