Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD003F0DBE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 23:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9596E8D7;
	Wed, 18 Aug 2021 21:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FF96E8D7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 21:51:48 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id h133so361677oib.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 14:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WrbViX0wQKvaWuCri+CZMKvsdsPMmbuJGU6REqdEujk=;
 b=gRJochQghrev713LVE7XNVqpfWWXVIyAf41WsqX4eUKV1pbw8wDGju2iA+oUaIo3ix
 ConEdxYiBmm4dBGFFVOiAA7xxs96VAsznRjW2hwZdQSAn/cegC16eU4NjwLtgN7vR/CT
 WsV3YQxSZn0cKR9dC5AyZzA8473gIaN7KXVrMErJrFSm1a52JXXcP3QBiXJWdDXAmdQr
 cLNfP4CX2Ec0VzQhh66J9XTaT5sJ6D7lgRjT0x41RqPuh6txxUCO8qZSj7j4cXc2NY2+
 YKQfFXarxLig+iT4qeGm9clvf3Z10R/gd36BP6Z1Fg/D298mW9ZnqEGAkJDd3E7MqhbT
 NX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WrbViX0wQKvaWuCri+CZMKvsdsPMmbuJGU6REqdEujk=;
 b=CZDuzTIDX33rFrVIeZBWavLWJ2tv1md4VZN1ZBGjXGP+0Gg4vSm/8NtIGcy8fnx4Z3
 rMSbhqevUBJLBCBjTpwJVGDad6DzwOLIxySXfmIv0vAsp+KMNBT7A6+kxrqpeckXT7Eq
 BlDde20y1+Tdmj9eprzOryuVc7TcMKUoqO/7EMecEtLGsDnJ8E88kVgjjKlBF6clM6rv
 hPnbu+mjNtL1OBaBSv4qusWFZQgbawiMZW7OmE0s+seSLgR8q88bHZAZfLbzjiXCGZyj
 a3umx9C0nVNGMuBLVfJImAzdg8PzqJClL0D9Qr+3OVY4TeYqpVHF9mu6WRcYFTblSxMS
 xpow==
X-Gm-Message-State: AOAM533aet5BPyRPyNPXbl8ScfSmmCplOaiM2CzBmsfiH7ZD1q1xZzY/
 ymGIBWpdEYinJQryhxsfCfKY+r0RU67TR/Fe1mI=
X-Google-Smtp-Source: ABdhPJyb/T3+O4GXm462bouKYg/m2oSAgVUac1M9v28NUTBTso2dAhydO9+ec4Xvzly/53MqwkSj1Nat/NIzcxop9vE=
X-Received: by 2002:a05:6808:1390:: with SMTP id
 c16mr216682oiw.123.1629323508125; 
 Wed, 18 Aug 2021 14:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210818124114.28545-1-lukas.bulwahn@gmail.com>
 <20210818124114.28545-3-lukas.bulwahn@gmail.com>
In-Reply-To: <20210818124114.28545-3-lukas.bulwahn@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Aug 2021 17:51:36 -0400
Message-ID: <CADnq5_MiTXcAu1kK3-9m=nFoT+SxF9SBv9wYgm2-WNVt_85RQA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm: amdgpu: remove obsolete reference to config CHASH
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Arnd Bergmann <arnd@arndb.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip@lists.infradead.org, 
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
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

Applied.  Thanks!

Alex

On Wed, Aug 18, 2021 at 8:41 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 04ed8459f334 ("drm/amdgpu: remove chash") removes the chash
> architecture and its corresponding config CHASH.
>
> There is still a reference to CHASH in the config DRM_AMDGPU in
> ./drivers/gpu/drm/Kconfig.
>
> Remove this obsolete reference to config CHASH.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  drivers/gpu/drm/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index f3bc90baca61..8fc40317f2b7 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -257,7 +257,6 @@ config DRM_AMDGPU
>         select HWMON
>         select BACKLIGHT_CLASS_DEVICE
>         select INTERVAL_TREE
> -       select CHASH
>         help
>           Choose this option if you have a recent AMD Radeon graphics card.
>
> --
> 2.26.2
>
