Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542703925AE
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 05:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF2B6EE13;
	Thu, 27 May 2021 03:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B786E6EE11;
 Thu, 27 May 2021 03:55:55 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id d21so3796318oic.11;
 Wed, 26 May 2021 20:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6I1MN4NFWb6xeVQSlutSgWAcmQk4ybiIdBPc7EssI9A=;
 b=AcnIsP/9H7cKkmwG+Xb4aLO5wf9oNSioM80yUY5janIGjdZ/jrOxGOjL+Q459ygwmE
 hYaaatUpYrIYD19ql0dLEwobOc1LyazLx6QHcWc2mTN9lBtAuw9fG+tY9cY9ja3/3hGm
 TZGmuYn9qiQyW6EhOzwJMyYLd0mmDmQdFxfXDDAGoOZHYIIjP0NSQfeBWRC3mx4ymoQq
 wcmUoXszHs7h5JSo5vEjJnUrKWbrn8pWKCcAq2+E5aDbFh++LiHNrpl0OY1NkWsgf8tW
 aCE8CrDpqfvxDOT1yBDCViP1aWs3UqpcyAE7A8jHdNVVkwn9D7alnNieXb963Gs6I2bg
 cw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6I1MN4NFWb6xeVQSlutSgWAcmQk4ybiIdBPc7EssI9A=;
 b=cUBTgIvYaWEwG4dTzOIYALrLL5zpgP1NaHrIbQpiZkU1zZFCXE0K0NRFUEyH/5DHf+
 9SyYDdMfqtO7vb92tOzjlgCa8CPbIbjltmaIVDmc/0bx5Qnmfk7u3+W5q6Y+VKet/nYL
 +9OOPK54Q1ikqecsEvWLFtIkl8ckwZt0ANKd5/wBKAbURHB+RloOBCDo3H3wz3PTD+yC
 xlspVdF2+zJ2FQAQaIXUJc2612GLTjbhyuizU4WLix0tQNFzIkkzITuu8gDOYw7Xmcjg
 BkWZNc3m5LjRdFpvESZRctjvKLnTaGOsw4x89m/5CJa7eqUn+nVP4kXX8BoHiXlodY2i
 vQCg==
X-Gm-Message-State: AOAM533ivCk1s/acA+PNGVvX1PLglJlDrxo46lCF6E0TGujjDNKJhp6M
 23a9dwUHrYNdY1efmwQMH6HzLgyvB6UGiROdnESa3D/Z
X-Google-Smtp-Source: ABdhPJyLCSQv/QKSuTRNjM9REWrV6LvELlWwO0q1KT5sPyqK1rH9VVCmNc0k3krS51ZcjSXmkdhBuwGUnFZY01qAZ2Q=
X-Received: by 2002:a05:6808:249:: with SMTP id
 m9mr1023562oie.120.1622087755096; 
 Wed, 26 May 2021 20:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-9-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-9-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 May 2021 23:55:44 -0400
Message-ID: <CADnq5_PFBMaeD-sFQ-=5RzcZX42=4dwYZvnZhW+X3mQ62=182w@mail.gmail.com>
Subject: Re: [PATCH 08/34] drm/amd/display/dc/bios/command_table_helper: Fix
 function name for 'dal_cmd_table_helper_transmitter_bp_to_atom()'
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 26, 2021 at 4:48 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table_helper.c:127=
: warning: expecting prototype for translate_transmitter_bp_to_atom(). Prot=
otype was for dal_cmd_table_helper_transmitter_bp_to_atom() instead
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/display/dc/bios/command_table_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper.c b=
/drivers/gpu/drm/amd/display/dc/bios/command_table_helper.c
> index 5b77251e05909..e317a36151477 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper.c
> @@ -114,7 +114,7 @@ bool dal_cmd_table_helper_controller_id_to_atom(
>  }
>
>  /**
> - * translate_transmitter_bp_to_atom - Translate the Transmitter to the
> + * dal_cmd_table_helper_transmitter_bp_to_atom - Translate the Transmitt=
er to the
>   *                                    corresponding ATOM BIOS value
>   * @t: transmitter
>   * returns: output digitalTransmitter
> --
> 2.31.1
>
