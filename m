Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A350D630C16
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 06:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A721010E25E;
	Sat, 19 Nov 2022 05:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352B810E25E;
 Sat, 19 Nov 2022 05:20:26 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id bj12so17581802ejb.13;
 Fri, 18 Nov 2022 21:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7Y4bxw1JD63M5XllY6npHcIrHCuFCtkIt2jLzNAtGRU=;
 b=exLzb3poQrwX0fkXQzG5mAxcKfcogKJp9nov8VgFXIyCExcSGg76o3gfk3lxW4TGq/
 5xNTWZqM33mWjFXrUkLSC6soMu7mSI8TX+/lMiKkDzXvt+BcnmFgvp6+6HUzQTJzMQJl
 R/LpBJNoKtKYYDvKcuSYG4Np++PnyHl7ixI3U3G7Ksm9Ep4dvMeY2WURxEsaA5JQgICU
 MOTfGU8w21ifwZUnzi73y76Wa8x5WHQJIbsFq+NMyaCcAGoptPLXnjLzenS8UDCS2pVA
 KSNMHLP8IRfTL5bgWTaCNPl64ZUuRl+X9vKzXjd1YEc1E/L3UPEJXw5l+O/19kFQhGG9
 Hyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Y4bxw1JD63M5XllY6npHcIrHCuFCtkIt2jLzNAtGRU=;
 b=xFPo3Y42U3Er3ZZXndHuXS3s1Q/C2F/Ak4+6r16/WvqwAWx+c60H9Vh7cAqtKMPsNv
 friiln6d150K0SqKTJ0tHrH8YoX31VNzf9IJqlBQ+oKyIiBlX5G1crQYi/gI73SQ4UEf
 HsVZY34P92T0o9H4nCxLl58Zf0KvqPSaiqFAFVLPUOTihc3JatK5+L0irOGm0E5CC17s
 AcH4LB++UdIgrgwEWvrnx7ierkQaVO8DTrvrcxIPIy+LtbWpmcQI7B91xh+8wuOsNYCu
 Pl41e5YSHAHRZfRojSPxAxEGMf5hDHCsijQrjOHZ61At4sDYS7/vQcwQkCwxeDbjJ7yV
 6zVw==
X-Gm-Message-State: ANoB5pkC07jUTfMHp4c8TOKiyJS/5E5Yquebu8iuc74aTEZHiGfojbA/
 +kmW3ODAhoXHdAoKRfFgCl1wacoV3zNv8/gGmto=
X-Google-Smtp-Source: AA0mqf6QeRRX0IlcllwtANP/CEQ4uvjC6o1p5svY601MJVeWZ30wxil0NldfeqRcJRaIQZIb3Z49UrIGJN0yANUpc7w=
X-Received: by 2002:a17:906:560e:b0:7a2:335e:90e2 with SMTP id
 f14-20020a170906560e00b007a2335e90e2mr8281399ejq.712.1668835224347; Fri, 18
 Nov 2022 21:20:24 -0800 (PST)
MIME-Version: 1.0
References: <20220819200928.401416-1-kherbst@redhat.com>
In-Reply-To: <20220819200928.401416-1-kherbst@redhat.com>
From: Computer Enthusiastic <computer.enthusiastic@gmail.com>
Date: Sat, 19 Nov 2022 06:20:10 +0100
Message-ID: <CAHSpYy182u=3g2dH+DRuoUSEBYYr8E571oHeN4y=wB1gCqbGEw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau: explicitly wait on the fence in
 nouveau_bo_move_m2mf
To: Karol Herbst <kherbst@redhat.com>, stable@vger.kernel.org
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Il giorno ven 19 ago 2022 alle ore 22:09 Karol Herbst
<kherbst@redhat.com> ha scritto:
>
> It is a bit unlcear to us why that's helping, but it does and unbreaks
> suspend/resume on a lot of GPUs without any known drawbacks.
>
> Cc: stable@vger.kernel.org # v5.15+
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/156
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 35bb0bb3fe61..126b3c6e12f9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -822,6 +822,15 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
>                 if (ret == 0) {
>                         ret = nouveau_fence_new(chan, false, &fence);
>                         if (ret == 0) {
> +                               /* TODO: figure out a better solution here
> +                                *
> +                                * wait on the fence here explicitly as going through
> +                                * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
> +                                *
> +                                * Without this the operation can timeout and we'll fallback to a
> +                                * software copy, which might take several minutes to finish.
> +                                */
> +                               nouveau_fence_wait(fence, false, false);
>                                 ret = ttm_bo_move_accel_cleanup(bo,
>                                                                 &fence->base,
>                                                                 evict, false,
> --
> 2.37.1
>

Could it be possible to make land the aforementioned patch to the
5.10.x kernel version ? It is currently for >= 5.15.x kernel version
only.

Thanks.
