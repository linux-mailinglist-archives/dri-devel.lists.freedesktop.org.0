Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C736A984A29
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 19:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2FF10E0E4;
	Tue, 24 Sep 2024 17:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CLWX+8He";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2D910E0A5;
 Tue, 24 Sep 2024 17:13:42 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-718e0421143so1147438b3a.0; 
 Tue, 24 Sep 2024 10:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727198022; x=1727802822; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lj/V12T6EfI+QI2wyKU5Kn73QQVj+zol6mqHjdblGto=;
 b=CLWX+8He8s2dRIGZLWGkh/PCiC+I9NGXfQ1ty1CzEnRQNHwhZpgxpQyFG37jkWXDmK
 p6NK2z6+ryi8y9jkAWMLY+fc7J9GsLDWZHX/+GYulHMgnC5hfWFC/iaWR82AsDJ7d2Ct
 /TGTP4z52JJWviSVs2DyySeHJR/uivE1nqG6N/cwWJ1IXSfY5HIx6rVIYFkncnVayW3o
 dMAQdAZpIUnh9dIkW9q0JO76OCgDGwcrgo3xkn60RYPgM0sOgkkAPO2dtv6QET/xvsS3
 3G1F7ILqqDyt6fLKrTQmO4kfVULwD/dsTFme8WtoIafv//Lhaq1NppaYOOUzKvn7jWv8
 GP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727198022; x=1727802822;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lj/V12T6EfI+QI2wyKU5Kn73QQVj+zol6mqHjdblGto=;
 b=m28ox6XUmNE/j1wCn9aRh1ka4i6mS7yW2jiS3j3sKlZnpZp9EYaiLq29+xPjZeg1nO
 TSuH44ymfRH/9BlwcBYpl0qz5dGWUwNwlQz5bzWpzlta4qjfLQhF8Jr4gOBayrLy7Etz
 AZFI9PTxhlzov+ZuE0oW3D0oAlsGznniPRFXlUyN/6jsbDP37/0/QSur/W+U6XzrruQ6
 Yp3hYExfPF+uZyPby1YrUv6iFJKPHb21TTyltUQMGjFO22JLeiUx5djDHyBjjlPdFo7E
 Tl7D+ii8tQ514pALvTQYTM3Lxj5kNnv0YUnBS2y5D9vgQw2wUZ1Updi9c33q2CYIuPDW
 Dj2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA1JDWuCqZ7mjIOsrHs7PvFmJ9QMECG2EaAqRmkx5McaH567BZK5gDSVpfmMp7JRfoeape1GYP@lists.freedesktop.org,
 AJvYcCWzBmE+RyCq2K3ava1ksNAJsXSTdmXAP2XO0UUF6B5bUUQOOBgwqO1kQCTDM8TV1Fj73qXrmx4lM4nc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynHI79I4xY6LxlDFDqPVdJQ0hXcKXxONWzDHoIsCBho906s6DF
 ulLjDsihJEbpl3tE/R6iF09RI278yJo90/PB0ees2Gi6kKnpteohllN/zWfoG39zJy7U4qy9ulr
 hyxatXrXTGtvSi5+CxuEnO2yxpJo=
X-Google-Smtp-Source: AGHT+IH4fWFHQoJUk3/SiGUatRb9npkgwzfKLl7EBZNw0zDkLeUu/FDrWRYEvcJCfKvnWWpDFqETUvN5KHGUUPeQ/us=
X-Received: by 2002:a05:6a00:1149:b0:70d:140c:7369 with SMTP id
 d2e1a72fcca58-71b0ac5a8c4mr2343b3a.3.1727198021598; Tue, 24 Sep 2024 10:13:41
 -0700 (PDT)
MIME-Version: 1.0
References: <20240923012446.4965-1-linux@treblig.org>
In-Reply-To: <20240923012446.4965-1-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Sep 2024 13:13:29 -0400
Message-ID: <CADnq5_PxBfpG6C80Wcm50wLzz=4eEKsscuZXiQ=ZsG8=gULhRA@mail.gmail.com>
Subject: Re: [PATCH 0/5] AMDGPU deadcode
To: linux@treblig.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Sep 22, 2024 at 9:43=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> Hi,
>   This is a bunch of deadcode removal in amdgpu;
> some of the functions are ones which were previously
> used but haven't been for a while, others are functions
> that were added a few years ago and haven't ever been used.
>
>   There are some others that I've not removed, which have
> been added in the last few years but not been used,
> I was worried maybe there are patches in someones tree
> about to use them (e.g. amdgpu_lsdma_copy_mem, amdgpu_mes_reg_wait,
> amdgpu_ras_unbind_aca, amdgpu_seq64_alloc, and
> amdgpu_xcp_prepare_resume) - I'd be happy to take those as
> well.

There are patches in flight that make use of at least some of these.
For example, the seq64 functions are used by the user queues patches
which are being reviewed now.  Feel free to send out patches though if
you are inclined.  If someone has plans to use something, they can
bring that up in the patch review.

>
>   One other thing I wasn't sure of; I removed
> amdgpu_device_ip_is_idle
> which has been unused since about 2016, but does that make
> the 'is_idle' methods unused or is there something else that calls
> them?

They've been used on and off in proposed patches over the years.  Some
of the IP specific code may call the IP specific is idle functions
directly rather than using the callbacks.

Alex

>
> (Sent from this kernel booted on my RX550 GPU)
>
> Dave
>
> Dr. David Alan Gilbert (5):
>   drm/amdgpu: Remove unused amdgpu_device_ip_is_idle
>   drm/amdgpu: Remove unused amdgpu_atpx functions
>   drm/amdgpu: Remove unused amdgpu_gmc_vram_cpu_pa
>   drm/amdgpu: Remove unused amdgpu_gfx_bit_to_me_queue
>   drm/amdgpu: Remove unused amdgpu_i2c functions
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           | 10 --------
>  .../gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c  | 12 ---------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 24 ------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       | 10 --------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h       |  2 --
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       | 12 ---------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h       |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       | 25 -------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.h       |  4 ---
>  9 files changed, 100 deletions(-)
>
> --
> 2.46.1
>
