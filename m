Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C39B63DE04A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 21:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295D06E042;
	Mon,  2 Aug 2021 19:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807E86E042;
 Mon,  2 Aug 2021 19:47:45 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so7907674oth.7; 
 Mon, 02 Aug 2021 12:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9EloOkH9EJL2F5NVL64VIZ4xshby4tOjlxB4NCrtzaE=;
 b=YU2FdXOVDyC9vBd/POQ0s2qvjquWWwE20se1+RvMKmlDq0dBYJma0nqgVqvwIV8HJl
 l4agtO93VMfr4nJTR6MLKRcQcVUWHkxmc5qZFypvONt6x6HJgESG/1CruDDgwpXAexQN
 VQHHDFFbhFW4bOOu8QYclQaFLxmYZeCq+DOoW90L5uoxl9HzdQvsaEWi3ubDdfDsDnsI
 nEf5nWcS9Q3EQUQphuqDmvfpDqDYNxHAglskj8yxiOpJ1PPUkdcqNCEOSjtK76yGnhpK
 Ch511V+T1dEk1KKNuanlFCIoMyOJQwCW8+VJVmCupPQSmuIceplm8NVR6GwCKcW+eNXx
 dzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9EloOkH9EJL2F5NVL64VIZ4xshby4tOjlxB4NCrtzaE=;
 b=mZRxMW5bWh1I1JUhLl2B3vnlfn5XvhmAjYr+O9JewtDEvMOCuOeGJkL4PhTDi+uuF/
 Xi+81RxFwGP17E9mBjV5s/Q6TnGm6PyypRgHmphkVCQ2QUJRrv47DsQ73s1/O4Y2o1+Z
 qlG6G6aMRGraG7GBlrpry8pT9yGN3+d87cxWjcGeG0vnSjExXrfcRvFe9yBAttHf7jMC
 eLMwnLTBgQhJqP7lPT2t+O9V96ykVEF8ruK08NcywVmq0qdhzt9rUR+sd/1XX71lGSo6
 kD0T0VQVZE2n7Ryyt43mARH5os+6UxeZuE7k36jFVxb6cmsWutbs0G2aEpWgoBnsOLez
 uLwg==
X-Gm-Message-State: AOAM531GOFCm8+lPKNjUJB3gBRamQNQnT//fREL5ThS8iroTtEO3qTk9
 oCvLydcoDhUmKfSeP6ZQ/fJMrYDinunIddnA7lA=
X-Google-Smtp-Source: ABdhPJyxQMAgOK3LzYirZ79+WNjdqVnxB7JAikCoyYYkIZ1v0qE/3FWdwvn1LbhL3UIYqfuaA6qQX+uGWZL7Q0fGBT0=
X-Received: by 2002:a05:6830:1c2f:: with SMTP id
 f15mr13038536ote.23.1627933664802; 
 Mon, 02 Aug 2021 12:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210728001119.12807-1-Ryan.Taylor@amd.com>
In-Reply-To: <20210728001119.12807-1-Ryan.Taylor@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Aug 2021 15:47:33 -0400
Message-ID: <CADnq5_OLGOy2Q5+szu+L2ry+G2t-v2mqJQ29chaY9zT7Key1VQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/amdgpu: modernize virtual display feature
To: Ryan Taylor <Ryan.Taylor@amd.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Siqueira,
 Rodrigo" <rodrigo.siqueira@amd.com>
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

On Tue, Jul 27, 2021 at 8:11 PM Ryan Taylor <Ryan.Taylor@amd.com> wrote:
>
> The amdgpu vkms interface provides a virtual KMS interface for several use
> cases: devices without display hardware, platforms where the actual display
> hardware is not useful (e.g., servers), SR-IOV virtual functions, device
> emulation/simulation, and device bring up prior to display hardware being
> usable. We previously emulated a legacy KMS interface, but there was a desire
> to move to the atomic KMS interface. The vkms driver did everything we
> needed, but we wanted KMS support natively in the driver without buffer
> sharing and the ability to support an instance of VKMS per device. We first
> looked at splitting vkms into a stub driver and a helper module that other
> drivers could use to implement a virtual display, but this strategy ended up
> being messy due to driver specific callbacks needed for buffer management.
> Ultimately, it proved easier to import the vkms code as it mostly used core
> drm helpers anyway.

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> Ryan Taylor (3):
>   drm/amdgpu: create amdgpu_vkms (v4)
>   drm/amdgpu: cleanup dce_virtual
>   drm/amdgpu: replace dce_virtual with amdgpu_vkms (v3)
>
>  drivers/gpu/drm/amd/amdgpu/Makefile      |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h      |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c   |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 641 +++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h |  26 +
>  drivers/gpu/drm/amd/amdgpu/cik.c         |  10 +-
>  drivers/gpu/drm/amd/amdgpu/dce_virtual.c | 780 -----------------------
>  drivers/gpu/drm/amd/amdgpu/dce_virtual.h |  30 -
>  drivers/gpu/drm/amd/amdgpu/nv.c          |  22 +-
>  drivers/gpu/drm/amd/amdgpu/si.c          |   8 +-
>  drivers/gpu/drm/amd/amdgpu/soc15.c       |  10 +-
>  drivers/gpu/drm/amd/amdgpu/vi.c          |  14 +-
>  13 files changed, 703 insertions(+), 845 deletions(-)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
>  delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.c
>  delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.h
>
>
> base-commit: e0186426a7efeb506164da7d4a56cfdaea38b380
> --
> 2.32.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
