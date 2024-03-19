Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3706F87F4C9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 01:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C2710E9A9;
	Tue, 19 Mar 2024 00:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cyXuGAqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E2210E9A9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 00:55:24 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-60a0579a931so49296697b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 17:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710809723; x=1711414523; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IJp2wlS1QcmyKoSILRJh4VbMcwABTvJV1wN+wh3MV9E=;
 b=cyXuGAqZmiHxqjtjGhHKamIOShrJ6X3q72rqg+bG98IPQe6XHgYOF5gSTcl/p8Ex6f
 ZCpHVcS5jtwF+nTjlF5IofWTKKa1uCmDwV8lvkxoI5EmHi4Tc82s6NL34I84jNTD8NRL
 +ERrfFz9iWhk1zVvTFH6y0EmtgZPEylwuBjk2ipG45h28tFxOC2fOSFUTLmTc8dILxOr
 mXqBTeZRdLqor7Dyur7TINrYILjtO6wup8BWZ8PKepsinDIRrf7pZHo0DmzTWBnnlCMh
 BFCKIP6y5AYiwvuIOrws2pPkrMhqbCQYXpK36x36/pXeEeYkjp2gnjDll3oXJH8DAae7
 S8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710809723; x=1711414523;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IJp2wlS1QcmyKoSILRJh4VbMcwABTvJV1wN+wh3MV9E=;
 b=SxOAQ/FcRnkbUMA9K9VCC8+8YX0wGGpjVqI+qYhnGY+R7ZNVukWNFeVvL/Kn8BV/fN
 lsOOGM1sASDpxt8G3oZj6uBczjIPSKxjKOrtXd/5CAw4iCnxe/HpOEkwCdtDpPfjBUxy
 RCViOK7pwpBFqKX14nTxIOaXWpPYPaPptqWKbkCRKZ+2stuVPRmqwT+MVk1bZAvar4a7
 upNQHcPb9U+056dTy3c+U/kc05tWylFV4dmLPeSPHXTc0ZKPzcNzWuyBQK4fRecz5IIS
 SgqHHXaEF1yLBxhT0zAtE+RVfZCMgAF1QauUeCtF7H7kNtQD2id312gmMk3APzTsF/wV
 o4og==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz7i5r5h233gohOtuOH8s/tOA0CjeSEFu57IPY4fXM/quOOBUPL8iyFIRzyNU+R0Apbh6LDHDH4TX9qPZcsuEkmqYnaDOTHi91OPwm1tW+
X-Gm-Message-State: AOJu0YySq5rGLY0xtpExbd1piVs3cx5RuyezuYzZeTnsiROuuJKmAkX9
 GNlXuLIMAmNdEWsBwWk8iylbRRKI5vbV9/Eky0UgDTgBuqDAX2SNW7qyeNo2diek/CBkW4EI/Zj
 NUM52E53fYT8AnMGgDOhWe1TzR50dvRbtW3M/zA==
X-Google-Smtp-Source: AGHT+IEGKYwv10lcfsSdgNSEMTidawwMjd39KQKkAtnp/4ZbSUUFgDbTKVLqQgyVWylbNRxZHqjPhJycsO3zJfAmsks=
X-Received: by 2002:a0d:fd87:0:b0:609:e4b4:c2fb with SMTP id
 n129-20020a0dfd87000000b00609e4b4c2fbmr12750368ywf.27.1710809723036; Mon, 18
 Mar 2024 17:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid>
 <e2319b19-d999-24e7-48fa-bbc19bbfbeea@quicinc.com>
In-Reply-To: <e2319b19-d999-24e7-48fa-bbc19bbfbeea@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 02:55:11 +0200
Message-ID: <CAA8EJppau--vt3RLkH96K0SF2x-QGWz+5U8tErvLFDvz-GQN4Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/dp: Delete the old 500 ms wait for eDP HPD
 in aux transfer
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Johan Hovold <johan@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Mar 2024 at 02:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> +bjorn, johan as fyi for sc8280xp
>
> On 3/15/2024 2:36 PM, Douglas Anderson wrote:
> > Before the introduction of the wait_hpd_asserted() callback in commit
> > 841d742f094e ("drm/dp: Add wait_hpd_asserted() callback to struct
> > drm_dp_aux") the API between panel drivers and DP AUX bus drivers was
> > that it was up to the AUX bus driver to wait for HPD in the transfer()
> > function.
> >
> > Now wait_hpd_asserted() has been added. The two panel drivers that are
> > DP AUX endpoints use it. See commit 2327b13d6c47 ("drm/panel-edp: Take
> > advantage of wait_hpd_asserted() in struct drm_dp_aux") and commit
> > 3b5765df375c ("drm/panel: atna33xc20: Take advantage of
> > wait_hpd_asserted() in struct drm_dp_aux"). We've implemented
> > wait_hpd_asserted() in the MSM DP driver as of commit e2969ee30252
> > ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()"). There is
> > no longer any reason for long wait in the AUX transfer() function.
> > Remove it.
> >
> > NOTE: the wait_hpd_asserted() is listed as "optional". That means it's
> > optional for the DP AUX bus to implement. In the case of the MSM DP
> > driver we implement it so we can assume it will be called.
> >
>
> How do we enforce that for any new edp panels to be used with MSM, the
> panels should atleast invoke wait_hpd_asserted()?
>
> I agree that since MSM implements it, even though its listed as
> optional, we can drop this additional wait. So nothing wrong with this
> patch for current users including sc8280xp, sc7280 and sc7180.
>
> But, does there need to be some documentation that the edp panels not
> using the panel-edp framework should still invoke wait_hpd_asserted()?
>
> Since its marked as optional, what happens if the edp panel driver,
> skips calling wait_hpd_asserted()?

It is optional for the DP AUX implementations, not for the panel to be called.

>
> Now, since the wait from MSM is removed, it has a potential to fail.
>
> > ALSO NOTE: the wait wasn't actually _hurting_ anything and wasn't even
> > causing long timeouts, but it's still nice to get rid of unneeded
> > code. Specificaly it's not truly needed because to handle other DP
> > drivers that can't power on as quickly (specifically parade-ps8640) we
> > already avoid DP AUX transfers for eDP panels that aren't powered
> > on. See commit 8df1ddb5bf11 ("drm/dp: Don't attempt AUX transfers when
> > eDP panels are not powered").
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >   drivers/gpu/drm/msm/dp/dp_aux.c | 17 -----------------
> >   1 file changed, 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> > index 75c51f3ee106..ecefd1922d6d 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> > @@ -313,23 +313,6 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
> >               goto exit;
> >       }
> >
> > -     /*
> > -      * For eDP it's important to give a reasonably long wait here for HPD
> > -      * to be asserted. This is because the panel driver may have _just_
> > -      * turned on the panel and then tried to do an AUX transfer. The panel
> > -      * driver has no way of knowing when the panel is ready, so it's up
> > -      * to us to wait. For DP we never get into this situation so let's
> > -      * avoid ever doing the extra long wait for DP.
> > -      */
> > -     if (aux->is_edp) {
> > -             ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog,
> > -                                                             500000);
> > -             if (ret) {
> > -                     DRM_DEBUG_DP("Panel not ready for aux transactions\n");
> > -                     goto exit;
> > -             }
> > -     }
> > -
> >       dp_aux_update_offset_and_segment(aux, msg);
> >       dp_aux_transfer_helper(aux, msg, true);
> >



-- 
With best wishes
Dmitry
