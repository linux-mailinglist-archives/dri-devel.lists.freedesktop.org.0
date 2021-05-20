Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11A238B721
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA86E6F4F8;
	Thu, 20 May 2021 19:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABFE6F4F8;
 Thu, 20 May 2021 19:17:05 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id h9so17452281oih.4;
 Thu, 20 May 2021 12:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Du5kz67a/iQ6a/NjTr+Df2buicUv7+vIDaRHiI4Tcpc=;
 b=WXsOHWQnfuFGEy/0apmg3pys11mvrLhSyFPuVqhVuh7E+rjuByzK56J+my50Jk/pEj
 OReru0IMuPnzI1aZb2My0T191LPM4bid2i8FL78Wpz1/eYdYfVzZ1qExUnGDLikO1Pgi
 KMvALHv7Mi8P1CJRvSqJRX+hQbk5EFGz4dmf3gJlQsNr0vXnpR+/QFo8Bc/ql3YUrTML
 EehvuwxUgeYpKr4xU9Su+R/6A/xMgF9OSInuCWd+oKiJH2MUyYQ32MGjFw0UIO1z+tgH
 nUZFaYMI9sJ3gK1sHEuGCiRiX5QIDGoWZmsGOrKzberNzmkexJLmikoP0bGWNENqF8mK
 Gb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Du5kz67a/iQ6a/NjTr+Df2buicUv7+vIDaRHiI4Tcpc=;
 b=AD6+XE6y2ztsykbUjIxqL57m/AD48FLPTfCZuPNrU9KtOKIVYtWift8tejx6R6OrR2
 SzC1NQep7F4BP/RaOXeO3UbwAgRANKELPIyjn7W7zJQCo+w8XIS027wUONHC1Ff8sd+t
 JKcHPfD3qv2ytismXJWMHsmjQbm6xOWV7+DjMhcbi2QkQgAmyvBxm+pB9h6cDQQ7hHqx
 RKgYu1UNc/AcEBQdoS1pA73LrlgMHRV2opsYjYlcZU+OP9f4dgYOZ0S3SUqy/fIeNdkf
 nLkAGwqtlJmTE/qnU3RTLXfDssb6Nr+FAyLIdyHQe2Tg+UcpiAYSswYmCx08U+RW3Ggb
 iOjQ==
X-Gm-Message-State: AOAM531fJCi51f8aOzU/Y7YZAEssQQvfXG0BdF429bk7y/cDc5dWF7/Y
 MzI2T1ilpHaCPx0eMQBCV/kIssbwTC/5t0QXcBojw0qX
X-Google-Smtp-Source: ABdhPJxdH46PVylAq5rTQ6Izow1yHwsSulVm3OW7d6kIYtHslqzWnlyagjo4KPAVAi6bcRGTXb2IYNf9hlUcE89yz7M=
X-Received: by 2002:a05:6808:1592:: with SMTP id
 t18mr2477039oiw.123.1621538225046; 
 Thu, 20 May 2021 12:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-21-lee.jones@linaro.org>
 <c2b7cf7c-0b37-3581-4a9c-368ca0b89a36@amd.com>
In-Reply-To: <c2b7cf7c-0b37-3581-4a9c-368ca0b89a36@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:16:53 -0400
Message-ID: <CADnq5_PJM7qiy-sK=KqgAjFKhwd7GPsVcsPfC4uOQw-2f+k1yA@mail.gmail.com>
Subject: Re: [PATCH 20/38] drm/radeon/radeon_vm: Fix function naming
 disparities
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!


On Thu, May 20, 2021 at 8:05 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 20.05.21 um 14:02 schrieb Lee Jones:
> > Fixes the following W=3D1 kernel build warning(s):
> >
> >   drivers/gpu/drm/radeon/radeon_vm.c:61: warning: expecting prototype f=
or radeon_vm_num_pde(). Prototype was for radeon_vm_num_pdes() instead
> >   drivers/gpu/drm/radeon/radeon_vm.c:642: warning: expecting prototype =
for radeon_vm_update_pdes(). Prototype was for radeon_vm_update_page_direct=
ory() instead
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/radeon/radeon_vm.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeo=
n/radeon_vm.c
> > index 2dc9c9f98049b..36a38adaaea96 100644
> > --- a/drivers/gpu/drm/radeon/radeon_vm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_vm.c
> > @@ -51,7 +51,7 @@
> >    */
> >
> >   /**
> > - * radeon_vm_num_pde - return the number of page directory entries
> > + * radeon_vm_num_pdes - return the number of page directory entries
> >    *
> >    * @rdev: radeon_device pointer
> >    *
> > @@ -626,7 +626,7 @@ static uint32_t radeon_vm_page_flags(uint32_t flags=
)
> >   }
> >
> >   /**
> > - * radeon_vm_update_pdes - make sure that page directory is valid
> > + * radeon_vm_update_page_directory - make sure that page directory is =
valid
> >    *
> >    * @rdev: radeon_device pointer
> >    * @vm: requested vm
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
