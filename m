Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D5516666D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 19:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D68A6EE44;
	Thu, 20 Feb 2020 18:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C276EE44
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 18:40:52 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id c16so5812762ioh.6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 10:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2s51MiHzgQaPN//35RjJcvytweOlOXi+IR77LYRzRUs=;
 b=WQ0Mua4MkpgQ4gA22HGfM2M1BSwlmm+u4G53PRKZuhYIvfSrX+TwZfqWhxaSWzZgVE
 w5v5OAIwUoa19QEXXxLyuwKDsOaMfyFaJXz+XKxhgFBKoqBhvoqGFWkpEkOVACPyaVK2
 SdP6tQ3hbO/cL5+4WEqhhS64BPbivURcQy/4vZlWW+W6r2mXUlG5gCoiPXvKylkGiC7n
 0KT2WZ90R68rq7tVAyWM2UCyxehjCTYjyiumnUaDR5NEX+qO0E8WuPCGu5N1e12dFUME
 v8I2v78TzTu/hfQdBxiEiMn7wXcnFxiPIxJfHpHHTK7EtWpSXmnuJ/u8nux1hPrpXn2Z
 J5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2s51MiHzgQaPN//35RjJcvytweOlOXi+IR77LYRzRUs=;
 b=UnWtTzplPfjrsZSx5BWuGnPYFhFDYwZ/ezG02UxCC3KzOH5upqA4iGcqXv7p6tr5HR
 vHqrOUq423vy5HnVw6uyVeDZsC02+/UltdPBb1iO01QTb1We/NEDHgpkXek87gMmf0rf
 WRsUuTrtdfywI7gzer3SM6+RvRw42fyxHKqSF9S9rNaDQlYrrtlzzNw7nyerTyCPLkJN
 IB5X1a3Iuazo3HIASOeQT78JEClll/7LPwpBORlvfM7fHMmkvGfy7Zmke8L5TEddomGi
 NfDr+SHvIzbtPIW3PDqJDKfi8+foS1B3Z0nXtXSFuosy5i2lVNgmVOZUQj9z3XAsaiia
 iZVQ==
X-Gm-Message-State: APjAAAVAQRAH1VP7Spuoh1/p/Y2V27wizlaKy1fTXEDunEcMQ/BaRiWA
 Czg26nx1/rwt8yjIn9tCbcBM7GBjhmk3jg0TxXk=
X-Google-Smtp-Source: APXvYqxhRpVUo1si6a1JW2JsNN1rAHL3IWCutONCT9yhuvhW7JGecZ1qIlC1+FnYBLwgKC+qfldtjwG+AZZ0w5jvbpU=
X-Received: by 2002:a5d:8555:: with SMTP id b21mr25728594ios.200.1582224051378; 
 Thu, 20 Feb 2020 10:40:51 -0800 (PST)
MIME-Version: 1.0
References: <VI1PR0802MB22374AD8B80182D2F186ABB483130@VI1PR0802MB2237.eurprd08.prod.outlook.com>
In-Reply-To: <VI1PR0802MB22374AD8B80182D2F186ABB483130@VI1PR0802MB2237.eurprd08.prod.outlook.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 20 Feb 2020 10:40:40 -0800
Message-ID: <CAPaKu7Rqbw=v7Cr4ksh+C1FMHEcCK=yZ9DARLMmTH38Gt_-F+A@mail.gmail.com>
Subject: Re: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
To: Guillaume Gardet <Guillaume.Gardet@arm.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, nd <nd@arm.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Catalin Marinas <Catalin.Marinas@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 4:44 AM Guillaume Gardet
<Guillaume.Gardet@arm.com> wrote:
>
> Hi,
>
> With (guest) kernel 5.5+ with qemu/kvm on arm64, I get lots of display corruptions leading to this kind of screen:
> https://openqa.opensuse.org/tests/1174521#step/yast2_i/24
Looking at the screenshot, it seems cacheline-related?

There was a change of memory type

  https://lists.freedesktop.org/archives/dri-devel/2019-August/233456.html

While the guest memory type is ignored on Intel, it is honored on ARM.
This attempt to fix it

  https://lists.freedesktop.org/archives/dri-devel/2019-December/248271.html

does not seem to land.


>
> I git bisected it to commit c66df701e783bc666593e6e665f13670760883ee
> **********
> drm/virtio: switch from ttm to gem shmem helpers
>
>   virtio-gpu basically needs a sg_table for the bo, to tell the host where
>   the backing pages for the object are.  So the gem shmem helpers are a
>   perfect fit.  Some drm_gem_object_funcs need thin wrappers to update the
>   host state, but otherwise the helpers handle everything just fine.
>
>   Once the fencing was sorted the switch was surprisingly easy and for the
>   most part just removing the ttm code.
>
>   v4: fix drm_gem_object_funcs name.
>
>   Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>   Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>   Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
>   Link: http://patchwork.freedesktop.org/patch/msgid/20190829103301.3539-15-kraxel@redhat.com
> **********
>
> I also tested kernel 5.6-rc2 which has the same bug.
> Without kvm, the display is fine.
>
> Regards,
> Guillaume
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
