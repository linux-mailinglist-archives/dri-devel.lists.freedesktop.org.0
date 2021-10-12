Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C3342AF79
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 00:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303306E9EB;
	Tue, 12 Oct 2021 22:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B47A6E9E5;
 Tue, 12 Oct 2021 22:03:10 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id g6so1742355ybb.3;
 Tue, 12 Oct 2021 15:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ftKqaoZGMToDPlxiMR/hkrcdIKvYqHccSfyT6Zdak+w=;
 b=E2K/JHuLWHAwGOkBErV9EIGjL9VxVIkjV11E47Q6tcWifgmKKAy6QICUVuaLCRLHbF
 R2U0RxE4dVCzStCO7WkICmdqS765g4VZXWge7Dup+ZVu2hjTiQEL1cE+KNeHswmICc7O
 svaU3l0FSfV+ldc9E1X32nqUCaih8gUr48KlEucXIFpMJcpzZ4SrNkiGcyolcknqdJ7f
 x6oHH3XRVozET6g8BzwjTz7XW/9NuR9SujfBnT21XYh0oE5zn0olT4gDd5MbVpkDDcJf
 beQAqv6AegrhN/wtJsLIZ+ydJZX70UcWq6cc2kC9Ddr+1H42wIhWqfx2kSRFAAdWVRAG
 Q+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ftKqaoZGMToDPlxiMR/hkrcdIKvYqHccSfyT6Zdak+w=;
 b=nOBjM4WnOsSOKQ0lvnpslJA42nHQ9wcDiWCyMrfin1rVjd9zSktBKNxbTMMAQmBvwz
 Ys3hoSsTfE+KPELBimdKvgzM9M4KgQ+mpj5G/kvznv2C/BrMsQg5SPZUjqhi+e4FZ6lU
 ZPCTdPxRQkTpXjVb/JuwmRcF37GzFbCgPx2Z+AuomLGwwfpIhK/RSIaF3/+rjvDMzBEE
 g9SmaPUgnQeTwyuqeLCXOCblfxgtWvTtfNjxPlkxO9BRKG635KBOrqfkEBUEbJHr34i2
 MD7hR5OCurUip8/A1cSiGfK7MTHwBjhSHjGGSgRUbPIgjr9s8tzCCLASubHEktJbsWL/
 PyjQ==
X-Gm-Message-State: AOAM530HAYeU69mEG07Vj58hfp+IxJUzJr5ELcTaeOEVMsWmnNt2vaLu
 B+djz/B+D765NAbXsx+OE6bx9ZB0hL7DL9dXik6WzB1v
X-Google-Smtp-Source: ABdhPJzw6ADZ1dpJOkdrPmTrdt2J53tEY05Emb4iJxrIIwJ77Ol4xtvXG3biqdksy3qqRPnIlIgTb9kBkCt/R+OYf70=
X-Received: by 2002:a25:e6d0:: with SMTP id
 d199mr29939096ybh.527.1634076189634; 
 Tue, 12 Oct 2021 15:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211012133334.1737918-1-kherbst@redhat.com>
In-Reply-To: <20211012133334.1737918-1-kherbst@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 13 Oct 2021 08:02:58 +1000
Message-ID: <CACAvsv47Xn07zM8pSqAAbTktjySaBeW_swrZAGjrfAVUnzdHzw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/mmu/gp100: remove unused variable
To: Karol Herbst <kherbst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 DRI <dri-devel@lists.freedesktop.org>, 
 ML nouveau <nouveau@lists.freedesktop.org>
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

On Tue, 12 Oct 2021 at 23:33, Karol Herbst <kherbst@redhat.com> wrote:
>
> Fixes a compilation issue introduced because I forgot to test with WERROR
> enabled.
>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: DRI <dri-devel@lists.freedesktop.org>
> Cc: nouveau@lists.freedesktop.org
> Fixes: 404046cf4805 ("drm/nouveau/mmu/gp100-: drop unneeded assignment in the if condition.")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> index 2b21f43069aa..17899fc95b2d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> @@ -488,7 +488,7 @@ gp100_vmm_fault_cancel(struct nvkm_vmm *vmm, void *argv, u32 argc)
>                 struct gp100_vmm_fault_cancel_v0 v0;
>         } *args = argv;
>         int ret = -ENOSYS;
> -       u32 inst, aper;
> +       u32 aper;
>
>         if ((ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false)))
>                 return ret;
> --
> 2.31.1
>
