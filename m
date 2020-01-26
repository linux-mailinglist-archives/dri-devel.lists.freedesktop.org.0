Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E481149CD1
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2020 21:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2026EA0B;
	Sun, 26 Jan 2020 20:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26796E261;
 Sun, 26 Jan 2020 20:24:31 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id u10so3572923qvi.2;
 Sun, 26 Jan 2020 12:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ME4FWIQfzvJeEHuv2JAiBJBZaqQjrcSHDr0D02aLZEw=;
 b=TUFnoZKhlXaA5G5sVb9dSXeJMqtrMcZMXTKsbmPY+X3wd8mdMyrV616BUxVAbQG/fS
 ypgevf4KJbJUgnCxbmLG22OESvjPB6ASkjptJaDpp5qv/zSwNCSMwEJL+p0Cg0UxAQmf
 VYOq05G7rbPbztXxtz8Xe/SgcZ9rHWM4eDVre0NawewZrnp4sSph7jskiYfI/oQOYoWq
 7fT0sV1DVe5TmOL/XrSklJ4j/O65D6az8jxxQ4Tks47/3NBRjwbvqEz/wCEeF9NMBlMQ
 fxZ40j86Rz4M7AiySlf9M+Yk7J1pXA6Pg4T2EjHtQLQF9Mo4uX5DYljydBzQ8A/fW325
 u3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ME4FWIQfzvJeEHuv2JAiBJBZaqQjrcSHDr0D02aLZEw=;
 b=TZs1LHJ6ey0uPvaAwi5V0IeGG4bD0Xkj9uIPYpF2RgieFUmpfiZLEwpmTNnFfGgqQ4
 DODwHEzd1HNuqUU4a1vi41ygHXlWqnXrj1V7Zf4/cPcOby7PIeFTRf9wFqH/Ac357ki+
 IVRi6NlhvGguS0O24jk5yulR0GZHHkX39VMlqhignHQ3Ux11xz546INEUCXHS13gULu3
 mEvRexB8GCT6K9GTbu990ZfuzeiQcmho2576dvM5eHTEsZRXvPYPSI8/7VwYwNa7yquT
 NVHSjqba+iHrC9fYqa5DNLDlELOJQWSUax1jL+wiROQENVZY/BbTcEzCCX9s0DA6S8qf
 OJ7g==
X-Gm-Message-State: APjAAAU4MyC0b0u+zxGsYu0jzGwVxx0c+ekLwy2+az4lrb2EeXMv+1pW
 dRy0QkeTXh/K5NTH8q7hDY9GaGIa0dByXwjsNik=
X-Google-Smtp-Source: APXvYqxit6R4/wWMsgC2OK3rrJzCp7HCrPXT+29CSUqgeJf2zRr56y31722sHFJwjPpDuT8116COTdlqdIeYaZfBc6M=
X-Received: by 2002:a0c:a998:: with SMTP id a24mr14202122qvb.11.1580070270630; 
 Sun, 26 Jan 2020 12:24:30 -0800 (PST)
MIME-Version: 1.0
References: <20200116131157.13346-1-yuq825@gmail.com>
In-Reply-To: <20200116131157.13346-1-yuq825@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sun, 26 Jan 2020 12:24:04 -0800
Message-ID: <CA+E=qVfTyCCcnn5--xA=onVN0u-HGjE93_N8-5Ddz5n8AV=BXQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/lima: add heap buffer support
To: Qiang Yu <yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 16, 2020 at 5:12 AM Qiang Yu <yuq825@gmail.com> wrote:
>
> Support heap buffer allocation which can grow the back memory
> size when GP has an out of memory interrupt so that user don't
> need to allocate a very large buffer at the beginning.

Whole series:

Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>

> Qiang Yu (5):
>   drm/lima: update register info
>   drm/lima: add lima_vm_map_bo
>   drm/lima: support heap buffer creation
>   drm/lima: recover task by enlarging heap buffer
>   drm/lima: increase driver version to 1.1
>
>  drivers/gpu/drm/lima/lima_drv.c   |  16 +++-
>  drivers/gpu/drm/lima/lima_drv.h   |   1 +
>  drivers/gpu/drm/lima/lima_gem.c   | 130 ++++++++++++++++++++++++++++--
>  drivers/gpu/drm/lima/lima_gem.h   |   4 +
>  drivers/gpu/drm/lima/lima_gp.c    |  51 +++++++++++-
>  drivers/gpu/drm/lima/lima_mmu.c   |   5 ++
>  drivers/gpu/drm/lima/lima_mmu.h   |   1 +
>  drivers/gpu/drm/lima/lima_regs.h  |   1 +
>  drivers/gpu/drm/lima/lima_sched.c |  35 ++++++--
>  drivers/gpu/drm/lima/lima_sched.h |   6 ++
>  drivers/gpu/drm/lima/lima_vm.c    |  44 +++++++++-
>  drivers/gpu/drm/lima/lima_vm.h    |   1 +
>  include/uapi/drm/lima_drm.h       |   9 ++-
>  13 files changed, 284 insertions(+), 20 deletions(-)
>
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
