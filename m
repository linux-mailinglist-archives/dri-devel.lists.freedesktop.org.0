Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EF2170563
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 18:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D576EB1B;
	Wed, 26 Feb 2020 17:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1E06EAF2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 17:04:09 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id e3so2873763lja.10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 09:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mr8lvq2fDYXhAJdmXkAUC+vxamh9dqETrrZbPIAeGrU=;
 b=dYbWmurNYAGSrGC/D0yi1ct8QBDR5H43h2ZeNWj3ADZ1j9/cc/kQWc0yjJ8ZKefZLj
 0vzxc6uXPRwMVQgDZ0xvZlqrgz5kH4P1adkBHD6yxOaaIq0NyI8LxlmnmEvk5A4X9LtL
 tfbBgXPnI4SoRROYdT+Vdo2vzankwnh4p7Qjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mr8lvq2fDYXhAJdmXkAUC+vxamh9dqETrrZbPIAeGrU=;
 b=RrGj4he+PAmpDvBRx/bLMxlL+BN/LdEOnHWGA7d4bpC/qkRBCefqS69M8U74OHOwE+
 OMRvq9K0PvfUrmjFBAUbvBlZKGjl3P//fmKxpWfxYSuQH+ZhNj8ud6ebigTjz8M4bHD1
 NOsyxW+REBhgrelhDO/aJ76mLSI7etWZpG21yfXysyYEpi/8VciOPUgKp/Nh3KI/Qxhy
 eltK1P/+hQ15vblDmPlQjPZ9fmg+TBf8Shs0WtfwNAbagt3+hk8CL5fgDHuED3Q1Mxd3
 Ozv8doa1Q7juHmHbIuPnbfYG14FWpAHHkmHDpFeI7EAlaTQaqbtnjxpqDSPkE/dCrFlH
 RSFg==
X-Gm-Message-State: ANhLgQ1hTshTfesn1qRVO27UjPKV86Wb8Z2Op23VY1xfhCPBWggaZ8Qt
 5+/WJk8CsVRn0BA4OY1k9ut0h1X7mVA=
X-Google-Smtp-Source: ADFU+vuEhvLoOIlV5L9CskRuIYGk5szzYN92vfTdafKlGbGUIc4IBf57M/4oxZHjV8izqlypyTTRUg==
X-Received: by 2002:a2e:6e19:: with SMTP id j25mr3616596ljc.95.1582736647810; 
 Wed, 26 Feb 2020 09:04:07 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id s21sm1537115lfb.27.2020.02.26.09.04.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 09:04:07 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id h23so3938406ljc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 09:04:07 -0800 (PST)
X-Received: by 2002:a2e:1459:: with SMTP id 25mr3674842lju.189.1582736646870; 
 Wed, 26 Feb 2020 09:04:06 -0800 (PST)
MIME-Version: 1.0
References: <20200226154752.24328-1-kraxel@redhat.com>
In-Reply-To: <20200226154752.24328-1-kraxel@redhat.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 26 Feb 2020 09:03:55 -0800
X-Gmail-Original-Message-ID: <CAAfnVBmNNB=jLP2bL6hTOfTQdF3jH9TrDjuHh6xb2k0p8s7E+A@mail.gmail.com>
Message-ID: <CAAfnVBmNNB=jLP2bL6hTOfTQdF3jH9TrDjuHh6xb2k0p8s7E+A@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] drm/virtio: fix mmap page attributes
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: Guillaume Gardet <Guillaume.Gardet@arm.com>, tzimmermann@suse.de,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 7:48 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> v5: rebase, add tags, add cc stable for 1+2, no code changes.
> v4: back to v2-ish design, but simplified a bit.
> v3: switch to drm_gem_object_funcs callback.
> v2: make shmem helper caching configurable.
>
> Gerd Hoffmann (3):
>   drm/shmem: add support for per object caching flags.
>   drm/virtio: fix mmap page attributes
>   drm/udl: simplify gem object mapping.

Series is:

Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>




>
>  include/drm/drm_gem_shmem_helper.h      |  5 ++
>  drivers/gpu/drm/drm_gem_shmem_helper.c  | 15 ++++--
>  drivers/gpu/drm/udl/udl_gem.c           | 62 ++-----------------------
>  drivers/gpu/drm/virtio/virtgpu_object.c |  1 +
>  4 files changed, 20 insertions(+), 63 deletions(-)
>
> --
> 2.18.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
