Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D7D1B36F2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 07:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE8D6E215;
	Wed, 22 Apr 2020 05:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1616E215;
 Wed, 22 Apr 2020 05:51:54 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id q31so296318qvf.11;
 Tue, 21 Apr 2020 22:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YA9H2oMhqWVUhj44XPFSqUHe31PZ4JbN6bsP7nMhgPE=;
 b=O9yt4bJSLqk25Ud5fJDyBpQ4R+71xjGF229VG/2eoeIhAEQu+2Igl4DJznfuQ7vWRb
 bBpQAWEtm0Y89gMywKlvLLROPAJmK5+5/uZQCESP2AOS4unmrfrbdWwh5hy+hSs0g1g9
 bT3f0sDNK49DUQxrbgNjPYKhLYO7tYjPAmnCDond1yVDbwhbixQiX1KEchbpktEc1nEA
 KiAwU7TnEc0qM8FZFPlaHi6OaciTe+4FAlGCr+x5DbR9Jw+oVlZFfClLteq0UkCHlFi9
 8Xsv2EmAwH3LbXSxyWrbIDyVo1CE1LKbgp93FaJFnEfd0nmVj7NeLowtj1zt+gQNiohy
 MsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YA9H2oMhqWVUhj44XPFSqUHe31PZ4JbN6bsP7nMhgPE=;
 b=q32SYKkE86JPM+gFo1CN/5zatfHDDe8x7e9b5OOtvwgDmtEvmVxgvMJKuleGyG/42D
 RsxcDS6KP1Ayo4ZWchVygJ1+CuTqFMORjYP8fZCg/BeBnHMM5WvolHHcLpsnQ94ntK1i
 vAztzagoB6vyN6XWbpjn/Mnqeerc3Mp0IpjVpKOSAeuogyReESpPdJA12ecWMn0I1BIb
 Q8DFiz7ekENCk2CPbdMhkFcDWM0kNM7tVNCS8uawtbSOHGfmVX78YMy0LrYIBhYPWDUB
 DkVz91qKZQnzktt+lIOc8spK8Gxmdbpo51P6NOd5IRWtWk7PskU7omWRx6UW/vT20SAO
 fciA==
X-Gm-Message-State: AGi0PuaEdOQeO7VrujkWrUho24VECIkRLlxhDRMyOdkCyKIxbMl7ytod
 xjbiFlCTeA/CxDZjw1s8hQgQeiNZSiSszVdW2Pc=
X-Google-Smtp-Source: APiQypLSyuUTytxsXXPtyp7mT+L+5KiKnDoKOEIkQL0/+1yE1O9CRMFs2FEdmkhLPCsiwvrUHofEAdC0RRVAmCjPfPE=
X-Received: by 2002:a0c:c190:: with SMTP id n16mr9990733qvh.107.1587534713900; 
 Tue, 21 Apr 2020 22:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200421133551.31481-1-yuq825@gmail.com>
In-Reply-To: <20200421133551.31481-1-yuq825@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 21 Apr 2020 22:51:27 -0700
Message-ID: <CA+E=qVeokdECv-bmw1Nsne88xV53W-xGzL22mRs2zy301is77g@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] drm/lima: add suspend/resume support
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
 Bhushan Shah <bshah@kde.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 6:37 AM Qiang Yu <yuq825@gmail.com> wrote:
>
> Suspend need to wait running jobs finish and put hardware in
> poweroff state. Resume need to re-init hardware.
>
> v2:
> 1. add misc patches to prepare enable runtime pm
> 2. fix pmu command wait time out on mali400 gpu
> 3. do power and clock gating when suspend
> 4. do runtime pm
>
> Qiang Yu (10):
>   drm/lima: use module_platform_driver helper
>   drm/lima: print process name and pid when task error
>   drm/lima: check vm != NULL in lima_vm_put
>   drm/lima: always set page directory when switch vm
>   drm/lima: add lima_devfreq_resume/suspend
>   drm/lima: power down ip blocks when pmu exit
>   drm/lima: add resume/suspend callback for each ip
>   drm/lima: seperate clk/regulator enable/disable function

s/seperate/separate

I guess you can fix it before merging into drm-misc-next, no need to
respin whole patchset

>   drm/lima: add pm resume/suspend ops
>   drm/lima: enable runtime pm

Besides that, series is:

Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>

>  drivers/gpu/drm/lima/lima_bcast.c    |  25 +++-
>  drivers/gpu/drm/lima/lima_bcast.h    |   2 +
>  drivers/gpu/drm/lima/lima_devfreq.c  |  24 ++++
>  drivers/gpu/drm/lima/lima_devfreq.h  |   3 +
>  drivers/gpu/drm/lima/lima_device.c   | 199 ++++++++++++++++++++++-----
>  drivers/gpu/drm/lima/lima_device.h   |   5 +
>  drivers/gpu/drm/lima/lima_dlbu.c     |  17 ++-
>  drivers/gpu/drm/lima/lima_dlbu.h     |   2 +
>  drivers/gpu/drm/lima/lima_drv.c      |  40 +++---
>  drivers/gpu/drm/lima/lima_gp.c       |  21 ++-
>  drivers/gpu/drm/lima/lima_gp.h       |   2 +
>  drivers/gpu/drm/lima/lima_l2_cache.c |  37 +++--
>  drivers/gpu/drm/lima/lima_l2_cache.h |   2 +
>  drivers/gpu/drm/lima/lima_mmu.c      |  48 +++++--
>  drivers/gpu/drm/lima/lima_mmu.h      |   2 +
>  drivers/gpu/drm/lima/lima_pmu.c      |  77 ++++++++++-
>  drivers/gpu/drm/lima/lima_pmu.h      |   2 +
>  drivers/gpu/drm/lima/lima_pp.c       |  31 ++++-
>  drivers/gpu/drm/lima/lima_pp.h       |   4 +
>  drivers/gpu/drm/lima/lima_sched.c    |  63 ++++++---
>  drivers/gpu/drm/lima/lima_vm.h       |   3 +-
>  21 files changed, 496 insertions(+), 113 deletions(-)
>
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
