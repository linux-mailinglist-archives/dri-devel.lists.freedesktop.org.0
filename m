Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2512357E6F1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 21:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A216C8B21B;
	Fri, 22 Jul 2022 19:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1582318B115;
 Fri, 22 Jul 2022 19:02:31 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id c72so4039463edf.8;
 Fri, 22 Jul 2022 12:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=avUZAWhiQeTD+s8eqp0tD4ouniDUp1tW0xSwM3iWcgw=;
 b=LQvK3/tRTOcgvuVGh+M5/GehEEKi8faPfo/xJ6f9D43mmpKXwOaISdjz4xj7ofQ3yW
 nPB0jd/IGzNmmADKc5f/o8Z1yT3yJ4Ca3eSheu30Eeovk4IgF8opO+bA5YqMns9iiHfR
 WMJs/ryDGoq7evSTWEfckh14Ncv8IdNXpgMI9u6EJSwT7BzPgKPloTVj3HFFgeZvQmYU
 e7nW2VAIZGhmkFVSt0X5l5kmtmuporEn8F86CAraj11WA4xluBQ1+iXMZ2A2ycS+rcv7
 Df9OlLO/B/s+Fo55AAmrAiuWWwOFeveMF6OGRk1yl4jArlzvpo39JhK5fc1Fvg3aqT/c
 b4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=avUZAWhiQeTD+s8eqp0tD4ouniDUp1tW0xSwM3iWcgw=;
 b=wX0FYVTlTUg0WKVRTzWV4iIvPKxsfheOUcJez0IeQj2R90uQCu+Hr2kL9D/JZsK1Vx
 N8x8biXv0L+Ozky2v+waIcB/waatb9BGy1yCwvZEggMrYmlrVUaPJIl28aVtjLdUK5EF
 wl6EjeNFvyQ1mJPp8Oo9BT1u6rl39SvCVuxY+hkCdZxw04KB5Lm7pdZWdSOuAalm6bEO
 RPCtjLGWfdI8nENNIh0EsCAXOZRtz6nSXjHGx+lxP0MbqlGmTTLU5EReSTPyZ/7xFWWo
 8veQRiEmO2BR2GuwEQAsg9Ba8ni2SqmefIspbaC561bs3WRwsa+yTyIgg86m2g4hoqWt
 93BQ==
X-Gm-Message-State: AJIora+nda7a5WkRqVc9h1UTWMRDPw/hHwOUerc7dPPNS6IAOCx5R4G0
 m/9JaDofzBtENzyqR92hlEHnpbLSelI5CAgJF0ixX6DJ
X-Google-Smtp-Source: AGRyM1vcdXkBOl/stulqTvLKIOZCE184bWWQit0ItjjwTNQf2Kc3Skz6cCZYUoQ9QmLUBeWNcN0z7ZoFi4KRjDqiH38=
X-Received: by 2002:a05:6402:d0a:b0:437:f9a1:8493 with SMTP id
 eb10-20020a0564020d0a00b00437f9a18493mr1289163edb.226.1658516549449; Fri, 22
 Jul 2022 12:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220721060946.46462-1-slark_xiao@163.com>
In-Reply-To: <20220721060946.46462-1-slark_xiao@163.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 22 Jul 2022 15:02:17 -0400
Message-ID: <CADnq5_PXyhGrU-XixQqDv+mdNU0rAqnGsVp2b_tfu=7h0COihA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Fix typo 'the the' in comment
To: Slark Xiao <slark_xiao@163.com>
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jul 21, 2022 at 3:26 AM Slark Xiao <slark_xiao@163.com> wrote:
>
> Replace 'the the' with 'the' in the comment.
>
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
>  drivers/gpu/drm/amd/include/atombios.h    | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index ff659d4f772b..8adeb7469f1e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -47,7 +47,7 @@
>   * for GPU/CPU synchronization.  When the fence is written,
>   * it is expected that all buffers associated with that fence
>   * are no longer in use by the associated ring on the GPU and
> - * that the the relevant GPU caches have been flushed.
> + * that the relevant GPU caches have been flushed.
>   */
>
>  struct amdgpu_fence {
> diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
> index 1f9df4e7509b..15943bc21bc5 100644
> --- a/drivers/gpu/drm/amd/include/atombios.h
> +++ b/drivers/gpu/drm/amd/include/atombios.h
> @@ -3255,8 +3255,8 @@ ucMaxNBVoltageHigh:     Voltage regulator dependent PWM value. High 8 bits of  t
>  ucMinNBVoltageHigh:     Voltage regulator dependent PWM value. High 8 bits of the value for the min voltage.Set this one to 0x00 if VC without PWM or no VC at all.
>
>
> -usInterNBVoltageLow:    Voltage regulator dependent PWM value. The value makes the the voltage >=Min NB voltage but <=InterNBVoltageHigh. Set this to 0x0000 if VC without PWM or no VC at all.
> -usInterNBVoltageHigh:   Voltage regulator dependent PWM value. The value makes the the voltage >=InterNBVoltageLow but <=Max NB voltage.Set this to 0x0000 if VC without PWM or no VC at all.
> +usInterNBVoltageLow:    Voltage regulator dependent PWM value. The value makes the voltage >=Min NB voltage but <=InterNBVoltageHigh. Set this to 0x0000 if VC without PWM or no VC at all.
> +usInterNBVoltageHigh:   Voltage regulator dependent PWM value. The value makes the voltage >=InterNBVoltageLow but <=Max NB voltage.Set this to 0x0000 if VC without PWM or no VC at all.
>  */
>
>
> --
> 2.25.1
>
