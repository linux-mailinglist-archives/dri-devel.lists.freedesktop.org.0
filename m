Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DA1973D66
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 18:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8708710E88B;
	Tue, 10 Sep 2024 16:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eQVRxNbM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1FA10E887;
 Tue, 10 Sep 2024 16:37:03 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2d8a9a15a7fso726449a91.0; 
 Tue, 10 Sep 2024 09:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725986223; x=1726591023; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lATwDGFeJ+qRWtCHldgAPm/E2odi0ls4dzip5e6x6e8=;
 b=eQVRxNbMdSnAxofSq8HP/G0ymKVjriVkGJ73vk4s3mzJrlkO7oBgjuDhqFKMZxn322
 fpwy5wH20ZKIeJ/h5pT14YYTUErCVLaNAgvavKTtU3oHv1SqkuBvAdoEKoCqMnjomtoW
 RXAyUds6iHuaJJgs88HI6yW4a2dGSxrnHwcxqB31X71pJ0BhKHs2yN9wQM+2Q1n3f8KX
 WHCoe14iFaapkynz+YtFEGfi2wF6UV6Jf0nTQqLvRQq82Q3lZae/aOIwRUrhNjNXxM53
 qPOfQgBlAehQd1aIRgD4VSiRUJ7VRVo39XIXLPEKYv1V29XyGASPAX/wtSYB5YgWyMVI
 ef1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725986223; x=1726591023;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lATwDGFeJ+qRWtCHldgAPm/E2odi0ls4dzip5e6x6e8=;
 b=r6gtN9G6XjdlL3DByvG3yS0+JUlZoKML/9GGhydqA+GRxEPtNqvuW0NNFvoZNzIaav
 TimyKDWiR5OgXza8sXBKaobDR3KjNbgoOKZmZtD/Ox6cjphKnItwQ8VrbiczSF+qkLtP
 eJLsE3G8v00F6cSJKxdV2MK6PGaA2RRKeTMd4kKzodiEiVkZlV1d4KfGT2XpP02IupNj
 cXq8ybJnatWybn3S53QTvw2NSrZ4hxxVxSd7a1YAeuKSmIUtFss0SH0/d0ezq/qWV6yv
 ACfiyjE0C9DTz9+lM6tXlmwO7EJ6PZ1APWmqoiMQOaOOoUi+QZPQh8yDlTnlLF2dsRMj
 8cHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRZ8eLH4UwKk4piZUKIXOGxRzpWTsK+m3EGPyG1IVyWi9N2C8b2UbL74RnaMI4blCGRfbKVi80@lists.freedesktop.org,
 AJvYcCWKZ3AHk/3YUpWwVYYkQMEiqT+aw4ReuORk1LTT2Cf/Wx+LlBXNT6UPsJqK9fom49Ieq1YsMzPl8F1f@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPW4dG3E7dAPzLdUXdJjki9AuGBAf9VJSOeuf50zLfB2/ZldZG
 VxJH8/SxqSRCfr6njKona+jGbbXhk86ZTYu/iF5gDqEn1XVNRSuChtuqePYhCpOeozdbZc0eXP5
 3kidZucHB97p8A+0xdlkzAVyX4fA=
X-Google-Smtp-Source: AGHT+IHPTQ2JXj6SfhMfrfcG/POT/OFolYS5tLjGM55IyUhR09RlxqVBqzO4qOkZODU36a/D31prVXKsvOwKe7zNexE=
X-Received: by 2002:a17:902:f542:b0:206:ad19:c0f2 with SMTP id
 d9443c01a7336-2074c5e61f1mr7305625ad.1.1725986222667; Tue, 10 Sep 2024
 09:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240812065656.GI13701@ZenIV>
 <20240812065906.241398-1-viro@zeniv.linux.org.uk>
 <57520a28-fff2-41ae-850b-fa820d2b0cfa@suse.de> <20240822152022.GU504335@ZenIV>
 <20240823015719.GV504335@ZenIV> <50379388-302d-420a-8397-163433c31bdc@suse.de>
 <20240823075331.GE1049718@ZenIV>
In-Reply-To: <20240823075331.GE1049718@ZenIV>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Sep 2024 12:36:51 -0400
Message-ID: <CADnq5_P+xddzv4WvV71sZwXStTg+g-AfwQbPBcbVg9NaV7p_Rw@mail.gmail.com>
Subject: Re: [PATCH 1/4] new helper: drm_gem_prime_handle_to_dmabuf()
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org
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

Thanks.  I cherry-picked these to my tree.  Sorry for the delay.

Alex

On Fri, Aug 23, 2024 at 3:53=E2=80=AFAM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> On Fri, Aug 23, 2024 at 09:21:14AM +0200, Thomas Zimmermann wrote:
>
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> > Thank you so much.
>
> OK, Acked-by added, branch force-pushed to
> git://git.kernel.org:/pub/scm/linux/kernel/git/viro/vfs.git #for-drm
>
> In case if anybody wants a signed pull request, see below; or just
> cherry-pick, etc. - entirely up to drm and amd folks...
>
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f01=
7b:
>
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git tags/pull-fo=
r-drm
>
> for you to fetch changes up to 30581926c42d1886cce2a04dcf615f551d829814:
>
>   amdgpu: get rid of bogus includes of fdtable.h (2024-08-23 03:46:46 -04=
00)
>
> ----------------------------------------------------------------
> get rid of racy manipulations of descriptor table in amdgpu
>
> ----------------------------------------------------------------
> Al Viro (4):
>       new helper: drm_gem_prime_handle_to_dmabuf()
>       amdgpu: fix a race in kfd_mem_export_dmabuf()
>       amdkfd CRIU fixes
>       amdgpu: get rid of bogus includes of fdtable.h
>
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 12 +---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c          |  1 -
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           | 64 ++++++++++++----=
-
>  drivers/gpu/drm/drm_prime.c                        | 84 ++++++++++++++--=
------
>  include/drm/drm_prime.h                            |  3 +
>  6 files changed, 106 insertions(+), 59 deletions(-)
