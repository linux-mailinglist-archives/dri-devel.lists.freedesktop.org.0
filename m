Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AB4177C6E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 17:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFBC6E918;
	Tue,  3 Mar 2020 16:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393286E918
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 16:52:29 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id h5so2850162vsc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 08:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FdVGhBj99FKiP7TEYcodNgPqXcs6kTpqaEfyncV1R9A=;
 b=kpmbfq41tXwdlemLwpRjvk0CaygW3ytHK02VBFiObmk6UtkuJMWfie+V/UkgB+cKDi
 TJo4FFeY8VItI6X5+GAhwIDIBMTG2JK9/1YAaolfJ3BWhTysAY7YojB9WnDX1jKnS5dl
 yf+WwTqTenL/D1j8M0aZwBRx6JOhTigh/7404U4ahsNiRR1///awmh2ikYt63y87+mxn
 /X/7S5V4/8EuudoPfAlBINhYIze3bdPgcDxbND0lBM5avxOuJBEMMf5boVmHu2QTJao3
 nPG5czFoJ2lvo9VKLqvIRiqgGQDmJGWZjLaG0XXIcoIz9jO7iOrhWTceawKUpbvNU86E
 cU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FdVGhBj99FKiP7TEYcodNgPqXcs6kTpqaEfyncV1R9A=;
 b=qJDkz7i2F6kl3aJUalRyujdSmLhvmToqvHO+QbjZcNnkRgv9Zmfjc1rZmzWh53gAqg
 urb5HRyjOD4JBf2W3Xn/bEJxpRXxty28kEu6/IVSKDeYjiRAp2p4dFKeQfYxUnr8iIrV
 kgCylGunaa7aOM3SAtXVnyXYaUkAfFS/ys/63KxCvWde6MPEc3+9DZRwZsmR3JhvNKaV
 heeRIEIt42tJR42U+Wom9LIxemBlyPDh9AUJBZIBxKRMtqfoyYH04KckE/bV+ioyefh9
 AEmTrii0EmSd+QQ8dNLKs+7hvVlH9obPkQAMWlOhr0rp7Rp65XddOtWFYhbREuDmHemE
 wxyQ==
X-Gm-Message-State: ANhLgQ1G0odyYTEGXs1TnR+vCY9XQ282jaYuJcPs28BjcIrOPjH87qEU
 br1u+Y7+lp4049y9IQN6BZQzHVRYJKJlspzRFE0=
X-Google-Smtp-Source: ADFU+vu+KmPTJmYwgVWlAeeU/9TvUE/xHPQR/xLfc4ygahlL8HhshS0SnpN3vD/sPf6pNobWFMCpiOIZpf+XL2t20vs=
X-Received: by 2002:a67:ab43:: with SMTP id k3mr3104596vsh.138.1583254348387; 
 Tue, 03 Mar 2020 08:52:28 -0800 (PST)
MIME-Version: 1.0
References: <20200303120136.18294-1-andrzej.p@collabora.com>
 <20200303120136.18294-4-andrzej.p@collabora.com>
In-Reply-To: <20200303120136.18294-4-andrzej.p@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 3 Mar 2020 16:51:56 +0000
Message-ID: <CACvgo52PpN2oqp9q5K_YSd+J1EQuzcmRyq4tPGu-T28ZHjFq4Q@mail.gmail.com>
Subject: Re: [PATCHv6 3/6] drm/arm/malidp: Factor-in framebuffer creation
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 James Wang <james.qian.wang@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Tue, 3 Mar 2020 at 12:01, Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> Consolidating framebuffer creation into one function will make it easier
> to transition to generic afbc-aware helpers.
>
I'd suggest keeping the refactor a bit simpler.
Say - first folds the functions together. Then do the modifier[0] reshuffle.

As-is the patch seems to introduce a leak:


> +               objs = drm_gem_object_lookup(file, mode_cmd->handles[0]);
> +               if (!objs) {
> +                       DRM_DEBUG_KMS("Failed to lookup GEM object\n");
> +                       return ERR_PTR(-EINVAL);
> +               }
>
> -       objs = drm_gem_object_lookup(file, mode_cmd->handles[0]);
> -       if (!objs) {
> -               DRM_DEBUG_KMS("Failed to lookup GEM object\n");
> -               return false;
> -       }
> +               if (objs->size < afbc_size) {
> +                       DRM_DEBUG_KMS("buffer size (%zu) too small for AFBC buffer size = %u\n",
> +                                     objs->size, afbc_size);
> +                       drm_gem_object_put_unlocked(objs);
> +                       return ERR_PTR(-EINVAL);
> +               }
>
We're missing the drm_gem_object_put_unlocked() after the if block.

> -       if (objs->size < afbc_size) {
> -               DRM_DEBUG_KMS("buffer size (%zu) too small for AFBC buffer size = %u\n",
> -                             objs->size, afbc_size);
>                 drm_gem_object_put_unlocked(objs);
> -               return false;
> -       }
> -
> -       drm_gem_object_put_unlocked(objs);
> -
... namely this one ^^.


-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
