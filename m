Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD4C8804EE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 19:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB35510FC66;
	Tue, 19 Mar 2024 18:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BfIpktMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755F010FC66
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 18:35:48 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-60a0a1bd04eso62446447b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 11:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710873347; x=1711478147; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Rl/lQ7Cc4c2hO/fqExBYwIoyN+wDkSHsXx0gNDbMeuA=;
 b=BfIpktMnGoUv6Xyb4F4xlJ7gWIpU66bsFgIgfbB7QAsFS0yl3Q1o5l4760iT1HTuV0
 51Zxu5mOasGtlZZIZohzj2oteDpQlvZSKSoLPBFoM68OIyfkAMp+ba6eflVw16RJh9jn
 +jhqz6mk7O3Dg0mZu35xAW+8IIKtg3jrxGvobXbZ+OmMsi84w4Y4c/hbsgYc0pymKHlb
 U9y4Uf5SB2mtoedpT/UwY0Otzj9qNuIuIKF0dg1dl+AqR+LUOFWJCFnBaLSfoFBtHsZp
 EMM1v7DUOUskdPPli+4O6w0LJApbLcAVOppVOdQn76opJNYlsl/Odl9id8Nws6FxbHek
 wCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710873347; x=1711478147;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rl/lQ7Cc4c2hO/fqExBYwIoyN+wDkSHsXx0gNDbMeuA=;
 b=rCiju0m1xrL/wbFG/vxNyD26CogU4jwD99rq3vQiRxXvGD1PFFH1kRVx08Y5EngIJc
 xfIWq1ZPq4V14mqXgey+A8LROx9qCuqrBD+/W3Yhfna8JORkIfEwZtxVZQXGmdj4LXMl
 nDtMwqnAUUdubCmrsFGoQ2H9ZT2vOdR2/AskBKU87LomywkpEZtAkYC8KdVIkfg6GgmM
 HvvfruLkmjFEDBMsTwnzbEDW+80sM+Fgg1DvATRv9UuHh17SQWr3Bp56+LJWKk06+KRu
 9ToD0Rcawh0fIXNpZvVwof6stHN9RHqNNUTcCISeUxg5sxZsnwWk3PHEgRFJI6QxTTVy
 hj6A==
X-Gm-Message-State: AOJu0YwggAyk+rFz6sZakx0rY21XtgcGjmUwq7V6cXfuzEuO5UAx1MPT
 +kfjqEP+jX0vxv37+QubUjweXBLd+xrG9I4UL3RrXhn0vVvYJM1ztZa1OK5QM4xDzLfwlcVSLWw
 VePAEgtWiLlZVJv4ePRpWT8qjxTXTfaiV8FpvgQ==
X-Google-Smtp-Source: AGHT+IHepHkMu9ldn57yrc+Ity8F4+LF2O/kh+sFvEN/Qqu/19Kr2md5XAj4OM7RQRke7LidV/dc8JD+dKGi+/3Ipfo=
X-Received: by 2002:a25:870a:0:b0:dcc:6d85:586a with SMTP id
 a10-20020a25870a000000b00dcc6d85586amr11027642ybl.49.1710873347086; Tue, 19
 Mar 2024 11:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240319111432.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
In-Reply-To: <20240319111432.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 20:35:35 +0200
Message-ID: <CAA8EJpq-NjmYkWHAVsuP5jA_Z7Xx0jCiqEDgU-0ni9BCg7Opuw@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: Clarify that wait_hpd_asserted() is not optional
 for panels
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
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

On Tue, 19 Mar 2024 at 20:15, Douglas Anderson <dianders@chromium.org> wrote:
>
> In response to my patch removing the "wait for HPD" logic at the
> beginning of the MSM DP transfer() callback [1], we had some debate
> about what the "This is an optional function" meant in the
> documentation of the wait_hpd_asserted() callback. Let's clarify.
>
> As talked about in the MSM DP patch [1], before wait_hpd_asserted()
> was introduced there was no great way for panel drivers to wait for
> HPD in the case that the "built-in" HPD signal was used. Panel drivers
> could only wait for HPD if a GPIO was used. At the time, we ended up
> just saying that if we were using the "built-in" HPD signal that DP
> AUX controllers needed to wait for HPD themselves at the beginning of
> their transfer() callback. The fact that the wait for HPD at the
> beginning of transfer() was awkward/problematic was the whole reason
> wait_hpd_asserted() was added.
>
> Let's make it obvious that if a DP AUX controller implements
> wait_hpd_asserted() that they don't need a loop waiting for HPD at the
> start of their transfer() function. We'll still allow DP controllers
> to work the old way but mark it as deprecated.
>
> [1] https://lore.kernel.org/r/20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I would consider changing the docs to say that implementing
> wait_hpd_asserted() is actually _required_ for any DP controllers that
> want to support eDP panels parented on the DP AUX bus. The issue is
> that one DP controller (tegra/dpaux.c, found by looking for those that
> include display/drm_dp_aux_bus.h) does populate the DP AUX bus but
> doesn't implement wait_hpd_asserted(). I'm actually not sure how/if
> this work on tegra since I also don't see any delay loop for HPD in
> tegra's transfer() callback. For now, I've left wait_hpd_asserted() as
> optional and described the old/deprecated way things used to work
> before wait_hpd_asserted().
>
>  include/drm/display/drm_dp_helper.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index a62fcd051d4d..b170efa1f5d2 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -422,7 +422,13 @@ struct drm_dp_aux {
>          * @wait_hpd_asserted: wait for HPD to be asserted
>          *
>          * This is mainly useful for eDP panels drivers to wait for an eDP
> -        * panel to finish powering on. This is an optional function.
> +        * panel to finish powering on. It is optional for DP AUX controllers
> +        * to implement this function but required for DP AUX endpoints (panel
> +        * drivers) to call it after powering up but before doing AUX transfers.
> +        * If a DP AUX controller does not implement this function then it
> +        * may still support eDP panels that use the AUX controller's built-in
> +        * HPD signal by implementing a long wait for HPD in the transfer()
> +        * callback, though this is deprecated.

It doesn't cover a valid case when the panel driver handles HPD signal
on its own.

>          *
>          * This function will efficiently wait for the HPD signal to be
>          * asserted. The `wait_us` parameter that is passed in says that we
> --
> 2.44.0.291.gc1ea87d7ee-goog
>


-- 
With best wishes
Dmitry
