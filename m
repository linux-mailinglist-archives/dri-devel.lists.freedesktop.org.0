Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B2155C0AC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 13:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85C210F40E;
	Tue, 28 Jun 2022 11:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B596811A231
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 11:28:59 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id q6so25026351eji.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 04:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rqVcJpXmSGHM7Xug1Bl66rqbVi1wrmeGRg2/Tsg9PRk=;
 b=IcnGqZup2pSZ2wFPVOPRyaCtjp0DTMd/7FPG0BDH0rFv5TbHOxc07PyYzLv8rDlVEa
 atLwmJ/Unlu9/2B/3TK9vt6vqgfJS9H51VbjVQQLTD8jfmJacZmfaLUd1XLfXxMkcil9
 8TN0kQ/mK5DjOWvhRei+AB99Zug99Qwu9fX62UKAX+grWj0C4gVhtEf312RnaMej+SF/
 6xQi8t388NLvF1hIHFC5yhsvGNeSADNhZIo+gOuWi/yMFjTMN+JcuxrcQ0z5i7Z0MlkJ
 yQBCOoiGPytgum8uDiN9g5vPOvRgWbZzfjYQYDSABAydt7/GuS1Q4P0lrJ4vn4C5ELyq
 65Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rqVcJpXmSGHM7Xug1Bl66rqbVi1wrmeGRg2/Tsg9PRk=;
 b=dLckk6f946TK/G1dAWteHjv3b9MO6pR8z2Z9bXd/CtXQAJgpPtmCOcjaCllJCH2qF0
 amYQDoa8u5t8oKT0MWbB8Wp9RuuRjCMl7peGzXRT+9awo5IZFOiGpBn9tgw5ey1TZFuG
 2gFiwQpqdCq7Ezmdxl3pMfXdF64FRgmZgjX3t9Ne53Jg+RCbwg9OYdmRPfXj+7O0khMy
 pw4j8oGYNxo2jrpqwwtt8pwAZco5dvaPLjnZnw0T+0T9691KKIXXaKUI2AinF9MfvjPD
 40nDV+/jmEEk6iZHfKG50Ze6EPH4+X29tntI1N59P2GsMn90+SDB/7xQoLYAAzu9d+WN
 8akw==
X-Gm-Message-State: AJIora9nm/2SGPWRfOMAmttRt9RQL6eLa9ThSXQzfdoGUZ2hxnyOij0g
 fZiCYxZ8g9IpjhWcbfTG+wq8I0NR3L24hCiE9z62GQ==
X-Google-Smtp-Source: AGRyM1uTXvCC0CnyVbFFcRV/3HV3twBtL01JkksUir1D11h0A9pXzMWmKYJiFT/r/DulzerrhMilT50XRgB74n2Slh8=
X-Received: by 2002:a17:906:c354:b0:726:3b55:7045 with SMTP id
 ci20-20020a170906c35400b007263b557045mr16815936ejb.723.1656415738150; Tue, 28
 Jun 2022 04:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220613144800.326124-1-maxime@cerno.tech>
 <20220613144800.326124-3-maxime@cerno.tech>
In-Reply-To: <20220613144800.326124-3-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jun 2022 12:28:42 +0100
Message-ID: <CAPY8ntDiKN+DigKAXnTj2VhnSfRPLJcwP5qgsw-GUv0foE3qaw@mail.gmail.com>
Subject: Re: [PATCH 02/33] drm/vc4: kms: Warn if clk_set_min_rate fails
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Jun 2022 at 15:48, Maxime Ripard <maxime@cerno.tech> wrote:
>
> We currently ignore the clk_set_min_rate return code assuming it would
> succeed. However, it can fail if we ask for a rate higher than the
> current maximum for example.
>
> Since we can't fail in atomic_commit, at least warn on failure.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_kms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index c169bd72e53b..7a7c90d8520b 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -405,7 +405,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
>                  * Do a temporary request on the core clock during the
>                  * modeset.
>                  */
> -               clk_set_min_rate(hvs->core_clk, core_rate);
> +               WARN_ON(clk_set_min_rate(hvs->core_clk, core_rate));
>         }
>
>         drm_atomic_helper_commit_modeset_disables(dev, state);
> @@ -438,7 +438,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
>                  * Request a clock rate based on the current HVS
>                  * requirements.
>                  */
> -               clk_set_min_rate(hvs->core_clk, new_hvs_state->core_clock_rate);
> +               WARN_ON(clk_set_min_rate(hvs->core_clk, new_hvs_state->core_clock_rate));
>
>                 drm_dbg(dev, "Core clock actual rate: %lu Hz\n",
>                         clk_get_rate(hvs->core_clk));
> --
> 2.36.1
>
