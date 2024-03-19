Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1428805FA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 21:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E59310E1A3;
	Tue, 19 Mar 2024 20:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kLh4NvSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733CE10E1A3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 20:17:10 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dcbd1d4904dso5943840276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 13:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710879429; x=1711484229; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ntBkxE8u7HkxjCR8+UuIisU7oJnwNIoRXftVVWpOYDk=;
 b=kLh4NvShIpNCVeHuBOaLeS0WkVkZvzk4spqYXd7svy5137YkgMZdEERXsKxfjtw4UE
 tEIBo0/2EQ6ttA8uKBEPvHuK9fS3U0bem3JuX3NVVxmWByFGrXM3JXg5TO2KQRxxMZ8L
 czfv2TSW25QuYwwb7oKaPH9eab+cF3TJtcbzkRU5fRobdhYXUxydigwcotgYBIJ2S1TF
 OVjLnFBnNE98AYEao5PWHI3SGSt5XyS76xkoOadpv7/oqcSpD0Qh6HesP3V5uFDSGAq1
 ivQgdLZYX9WON6QjeT3fLbKaoLmZ1FHGb986zEwpe5yNmZ6YAiS3XSlhfTUQLuDv1ayd
 0ALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710879429; x=1711484229;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ntBkxE8u7HkxjCR8+UuIisU7oJnwNIoRXftVVWpOYDk=;
 b=e1pL9l+i0ypPVjStaGLikAu5XKPe2eKqb8f2h3Nffi/GhUl2jzCp34vyt/MNyv6I9o
 jfNz7I8NGOMbb3hBmO1XFRgCRVNbdgvfUM65meFHP8cKq8DCt+X5lciodL3Vjg1Ds6sR
 Bt50lUGT3sCGJI0gzJibpCQgCTTwmAqO08SeCtZUJcIdXOzDmNeutYIwXMHmXplxxpTe
 8/cC+Hv6sj16i3KM59HxS/i4Edr92rEP4psv9bqWz2Rp21Xafsp/XHwwLClY62qQscgj
 oRvBiZJNv4P7uv+rNTKAmFJAPoyHgHs+d9yYu4ggZratreIfemNHeoVZP9VRjU/6TAX4
 BSKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8T3xGzW3zBHs548TYW3XvNgwLOKcrtPV17GnhQGGfspjSiHexMg37j4bdlgapgv59B8lzzkiTIG9jNDiSgZrjrD2mPSsbxh4BjKuaiwex
X-Gm-Message-State: AOJu0Ywge6U1f67NixzDkd8ThRKHtLVJgWSZx6wsiKIbfXDGT/c3Ky6J
 IPdDuBFb15li640yVLqQQ8VC6QxtReGV/rKGToBt/9wcpFUAseWNoeqfm25lxHz1S4CRCj6yMMl
 auOFBGpStLOTFvHMa+lDJ0gXn9swt0rfBItPpYw==
X-Google-Smtp-Source: AGHT+IEC/8S1XzuUKIBHjwDEDs8hk7UZGlIr94dUBwWzeRONeAMI2NjyFhWsw04j3Py1cbxTRJVG16YKQF+I2sp93wo=
X-Received: by 2002:a25:c8c5:0:b0:dcc:1c6c:430d with SMTP id
 y188-20020a25c8c5000000b00dcc1c6c430dmr40218ybf.12.1710879429158; Tue, 19 Mar
 2024 13:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240319111432.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
 <CAA8EJpq-NjmYkWHAVsuP5jA_Z7Xx0jCiqEDgU-0ni9BCg7Opuw@mail.gmail.com>
 <2fa9a262-de60-2c1e-9ac3-1e478ec65bb8@quicinc.com>
In-Reply-To: <2fa9a262-de60-2c1e-9ac3-1e478ec65bb8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 22:16:58 +0200
Message-ID: <CAA8EJpqg+Di7PH2bmQ6uMidD3MhQ+N7w-1MWWEOBrH5DbsWSTA@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: Clarify that wait_hpd_asserted() is not optional
 for panels
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Imre Deak <imre.deak@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org
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

On Tue, 19 Mar 2024 at 21:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/19/2024 11:35 AM, Dmitry Baryshkov wrote:
> > On Tue, 19 Mar 2024 at 20:15, Douglas Anderson <dianders@chromium.org> wrote:
> >>
> >> In response to my patch removing the "wait for HPD" logic at the
> >> beginning of the MSM DP transfer() callback [1], we had some debate
> >> about what the "This is an optional function" meant in the
> >> documentation of the wait_hpd_asserted() callback. Let's clarify.
> >>
> >> As talked about in the MSM DP patch [1], before wait_hpd_asserted()
> >> was introduced there was no great way for panel drivers to wait for
> >> HPD in the case that the "built-in" HPD signal was used. Panel drivers
> >> could only wait for HPD if a GPIO was used. At the time, we ended up
> >> just saying that if we were using the "built-in" HPD signal that DP
> >> AUX controllers needed to wait for HPD themselves at the beginning of
> >> their transfer() callback. The fact that the wait for HPD at the
> >> beginning of transfer() was awkward/problematic was the whole reason
> >> wait_hpd_asserted() was added.
> >>
> >> Let's make it obvious that if a DP AUX controller implements
> >> wait_hpd_asserted() that they don't need a loop waiting for HPD at the
> >> start of their transfer() function. We'll still allow DP controllers
> >> to work the old way but mark it as deprecated.
> >>
> >> [1] https://lore.kernel.org/r/20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid
> >>
> >> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >> ---
> >> I would consider changing the docs to say that implementing
> >> wait_hpd_asserted() is actually _required_ for any DP controllers that
> >> want to support eDP panels parented on the DP AUX bus. The issue is
> >> that one DP controller (tegra/dpaux.c, found by looking for those that
> >> include display/drm_dp_aux_bus.h) does populate the DP AUX bus but
> >> doesn't implement wait_hpd_asserted(). I'm actually not sure how/if
> >> this work on tegra since I also don't see any delay loop for HPD in
> >> tegra's transfer() callback. For now, I've left wait_hpd_asserted() as
> >> optional and described the old/deprecated way things used to work
> >> before wait_hpd_asserted().
> >>
> >>   include/drm/display/drm_dp_helper.h | 8 +++++++-
> >>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> >> index a62fcd051d4d..b170efa1f5d2 100644
> >> --- a/include/drm/display/drm_dp_helper.h
> >> +++ b/include/drm/display/drm_dp_helper.h
> >> @@ -422,7 +422,13 @@ struct drm_dp_aux {
> >>           * @wait_hpd_asserted: wait for HPD to be asserted
> >>           *
> >>           * This is mainly useful for eDP panels drivers to wait for an eDP
> >> -        * panel to finish powering on. This is an optional function.
> >> +        * panel to finish powering on. It is optional for DP AUX controllers
> >> +        * to implement this function but required for DP AUX endpoints (panel
> >> +        * drivers) to call it after powering up but before doing AUX transfers.
> >> +        * If a DP AUX controller does not implement this function then it
> >> +        * may still support eDP panels that use the AUX controller's built-in
> >> +        * HPD signal by implementing a long wait for HPD in the transfer()
> >> +        * callback, though this is deprecated.
> >
> > It doesn't cover a valid case when the panel driver handles HPD signal
> > on its own.
> >
>
> This doc is only for wait_for_hpd_asserted(). If panel driver handles
> HPD signal on its own, this will not be called. Do we need a doc for that?

This comment declares that this callback must be called by the panel
driver: '...but required for DP AUX endpoints [...] to call it after
powering up but before doing AUX transfers.'

If we were to follow documentation changes from this patch, we'd have
to patch panel-edp to always call wait_for_hpd_asserted, even if HPD
GPIO is used. However this is not correct from my POV.

> >>           *
> >>           * This function will efficiently wait for the HPD signal to be
> >>           * asserted. The `wait_us` parameter that is passed in says that we
> >> --
> >> 2.44.0.291.gc1ea87d7ee-goog
> >>
> >
> >



-- 
With best wishes
Dmitry
