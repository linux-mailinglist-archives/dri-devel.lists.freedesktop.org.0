Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0970538B6C9
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30406F4E5;
	Thu, 20 May 2021 19:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE456F4E4;
 Thu, 20 May 2021 19:10:15 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 g7-20020a9d12870000b0290328b1342b73so7994998otg.9; 
 Thu, 20 May 2021 12:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qZmqhErjNw9NpB4sTEi7TBGKOlHWpPlsaMkchqCd25U=;
 b=VUk9UBH/QcIR0qeCSyhDdMQ/L42ux4gncCKIrTFJFcDzd6FRRipqIKh8piNmD1KJnl
 kmHeFjswq2lFGSXDBDXUCEt1dLMwk6XSOgtK6Ax11cwQyipfUaJRO0Z6bHFj7Sf19SoB
 LJASG5MubLxCC7Dv0UYkWWlAwT1hTF6AFdkCqD5f/pSvAHyVWMELpLmJaV8XQZIv7eMZ
 n7Fw0Xpf1bwMUgAOMFuUhGe6cIyjjTMicraKgLuYtwvFkS0D8jNaRI0I40CCB527W60y
 ptF9CSJPC7NFp2kmV0GTbc2GoN1Qc2vNoo3XHRFV7uD2bnguZGzpNtbozHgPPM7XHbnx
 MmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qZmqhErjNw9NpB4sTEi7TBGKOlHWpPlsaMkchqCd25U=;
 b=gqRImbYsI1OZz+rXSclsUnknz/Dtr5EfDp9/Qd0AxuWPA5+vb7YN+JF/wfLWMqrfsh
 1GEkVLMHIe7ggGj4bkLIvb5DMhFHC9UWij5qOWC5TBmcuhmd1P2wxezNMTKk8l4QDRA7
 htse51WxpDTzUT4CxJDG9tXpy1NwlubH0ch0R/Qs+Ox09GFxv/sdivPgw+Ha+pVCVkmM
 ltMSW1vcP2qDxFvqiKEKFcyOzDb3iOHh0Wyk4dZAOM9SmZsAsP5x4k3xFMcoPGtXqZfM
 E2J5OKIK9a6aLH56lwx3CtE9ZOh/V8q5oUnDkDYI6K/PgdhdTM7/25UWs0UZmpmXG+I4
 E1tg==
X-Gm-Message-State: AOAM532AbWUHx2gwmIe22gF/jss/pljlx7glQh7uJf0Js0O5GebIQhGN
 VdlZC0LXTD2qmf5eLU/2vDahM1p9U4TOeuWzSMs=
X-Google-Smtp-Source: ABdhPJwMqj/CKQBdLb7dxshnqMhIbg//f1Ttg3En9FmwFe/Hdagzvy9jXwWeDIpGu4wupnXvU9vTUoBsQYzf0ZLnT+8=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr5119212otl.132.1621537814661; 
 Thu, 20 May 2021 12:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-12-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-12-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:10:03 -0400
Message-ID: <CADnq5_P1zF2Pw5BW54n+XEXyfNOLRnEvsk_zzZcz0TuanobubA@mail.gmail.com>
Subject: Re: [PATCH 11/38] drm/amd/amdgpu/amdgpu_debugfs: Fix a couple of
 misnamed functions
To: Lee Jones <lee.jones@linaro.org>
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1004: warning: expecting pro=
totype for amdgpu_debugfs_regs_gfxoff_write(). Prototype was for amdgpu_deb=
ugfs_gfxoff_write() instead
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1053: warning: expecting pro=
totype for amdgpu_debugfs_regs_gfxoff_status(). Prototype was for amdgpu_de=
bugfs_gfxoff_read() instead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_debugfs.c
> index bcaf271b39bf5..a9bbb0034e1ec 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -990,7 +990,7 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file *f=
, char __user *buf,
>  }
>
>  /**
> - * amdgpu_debugfs_regs_gfxoff_write - Enable/disable GFXOFF
> + * amdgpu_debugfs_gfxoff_write - Enable/disable GFXOFF
>   *
>   * @f: open file handle
>   * @buf: User buffer to write data from
> @@ -1041,7 +1041,7 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struct f=
ile *f, const char __user *bu
>
>
>  /**
> - * amdgpu_debugfs_regs_gfxoff_status - read gfxoff status
> + * amdgpu_debugfs_gfxoff_read - read gfxoff status
>   *
>   * @f: open file handle
>   * @buf: User buffer to store read data in
> --
> 2.31.1
>
