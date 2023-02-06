Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC2768C77F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 21:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1947310E1A0;
	Mon,  6 Feb 2023 20:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821E610E1A0;
 Mon,  6 Feb 2023 20:19:49 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id bx13so10750509oib.13;
 Mon, 06 Feb 2023 12:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YsphjXkBI0H4ZtiynXrY+CUNXqadHKIdr07YXKhwtfE=;
 b=YXK1qFlepuupaxVP9x9mjLfXiDnmGMOvZsuRb0hoTLfq5WG6ZXqiDa04ySEr2vqpk9
 ZF65v0IvW9FA7g3tVwvxFIQ//7YLS+08w79hN02qd/UcUDeqgusRse2b+IKqUwjYGobi
 1Aqq41lrZGlOd8hnLM/ydHHLA668W8RjuI9tMa3D4Mf8gLTAtnCHvQiz7cnMclU3oRqs
 HFT7q48YHsHn5tyDUfC5M9amABgZLO0nsTF+YPdrhwrgEHA5JlxGYGrETDEyAz8Obl5P
 wytUHzUpnxshM3KdrkPqE9nkqskrkN2xl6g9mUR2ZaVMidRaaT0zCMVZp2IYz3VmHDOO
 chRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YsphjXkBI0H4ZtiynXrY+CUNXqadHKIdr07YXKhwtfE=;
 b=xyH9PtFhEIBWLhAjfeIIbAVfeNUJcx4Vj2N0tNQxD9T/f8k7yC2kqRtK+wIo6QMgyS
 9wgXWZSKkBgP0ByxQgdUTUekCK1lxb6C3ewqwOawFtXE3yqxtOJxQry7zaqHfYHvkKmd
 V8nCayuTxu1iFzFKjxj0MD1RRXoJ/Lf0zlvEDVlyJDuOe4qMj7wFw36oQBDclrmm3d0Q
 zDt0iyxnQWOCUK/V1d6EanTd/fkC6YpDbL3wN8nk+EZbGARHRZs44Sjj2dyB+MzQfsuB
 5YTsmHaC5inZZDG/exQLVKbfi2qwc2G4rcRVoeLzbBtslH1QqX1APUIyy4nlJMF6aCJJ
 KRnQ==
X-Gm-Message-State: AO0yUKVh494l+6dLhKjhzPstNDCuDcv7fvzVKThsnCuKF7tPjbpC57Sy
 WoI+I+rID/ZjBUonparuT4B5aZnRK/KXNq82BWOMtfe1
X-Google-Smtp-Source: AK7set+WPrOO0zrrwk4j2nVGXXhYKvVx98ndm/QUyGFVed5o9F7zj7oMb9r+YqcaGbMDbsjcmb6ZpDLGQB7AfbYBIAU=
X-Received: by 2002:a05:6808:6242:b0:378:4edd:a89c with SMTP id
 dt2-20020a056808624200b003784edda89cmr1267118oib.46.1675714788680; Mon, 06
 Feb 2023 12:19:48 -0800 (PST)
MIME-Version: 1.0
References: <20230204032735.22509-1-rdunlap@infradead.org>
In-Reply-To: <20230204032735.22509-1-rdunlap@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Feb 2023 15:19:37 -0500
Message-ID: <CADnq5_Ma+0pPtUP5CRpQUyh2NwMyz91D1-L-J5OwRAf9Ty5PXg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: add complete header search path
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: "Signed-off-by : Sung Joon Kim" <sungkim@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Feb 3, 2023 at 10:27 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> The path for the "mod_info_packet.h" header file is
> incomplete, so add its location to the header search path
> in the amdgpu Makefile.
>
> See on ARCH=3Dalpha (275 times in one build).
>
> In file included from ../drivers/gpu/drm/amd/amdgpu/amdgpu.h:90,
>                  from ../drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:43:
> ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.h:62:10: fat=
al error: mod_info_packet.h: No such file or directory
>    62 | #include "mod_info_packet.h"
>       |          ^~~~~~~~~~~~~~~~~~~
> compilation terminated.
>
> Fixes: 5b49da02ddbe ("drm/amd/display: Enable Freesync over PCon")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Signed-off-by: Sung Joon Kim <sungkim@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile |    1 +
>  1 file changed, 1 insertion(+)
>
> diff -- a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgp=
u/Makefile
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -34,6 +34,7 @@ ccflags-y :=3D -I$(FULL_AMD_PATH)/include/
>         -I$(FULL_AMD_PATH)/acp/include \
>         -I$(FULL_AMD_DISPLAY_PATH) \
>         -I$(FULL_AMD_DISPLAY_PATH)/include \
> +       -I$(FULL_AMD_DISPLAY_PATH)/modules/inc \
>         -I$(FULL_AMD_DISPLAY_PATH)/dc \
>         -I$(FULL_AMD_DISPLAY_PATH)/amdgpu_dm \
>         -I$(FULL_AMD_PATH)/amdkfd
