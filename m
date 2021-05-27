Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4A1392649
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 06:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0BD6EE22;
	Thu, 27 May 2021 04:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9DB6EE22;
 Thu, 27 May 2021 04:25:24 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id h9so3882963oih.4;
 Wed, 26 May 2021 21:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HlEEB7m4vbuZJ5U/IF3dSwz8wK0GbasA4XFoALDTWL8=;
 b=W5/+NkQahCgvZZ1x00cU/xU8h+8cEB/LHC5TNOw+Qcu43GEXKib+gni+t4UUYVyU4b
 FADaYkMAkf8n+5lPiHn9m+W+H90W/b4+4FFG1IhqblRjXl+llnwhZu+vXnhdi5E2btqk
 j2ebfn+If6EBldLbq5k4BPeGxAAzl84vP4VWe2xjRf1rEt3JbuqWusKzzRv3TsxB3qgz
 mkHT7vJ60Ml3mnW0UYPWWKOmAHFYD6tyohnS/NWdv82NutAwQmL1MIyJZ/y3B1SsSTAR
 KHTxUhr6/fXZaWhQJo0h4Ldg4iX5E6VgzBCWqsqFGk3mgABntDMN0AlzvPNf5MFgudsg
 sEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HlEEB7m4vbuZJ5U/IF3dSwz8wK0GbasA4XFoALDTWL8=;
 b=OjZ5oakAUmLUeQzQ28dYmOdnT6NUi6dFSQ3u4n/jzsvmfvBgEwIRDPXk0JHdIL05KL
 z8f1JQ1pxr7Nv7nmTZaEn/ts2sli9s5Y7zL6rIQB6W7pTeqOyz+dutIkQVAxai6ZA64d
 4TlW7mFXHW5mW60hlpOj+YMxq23+xo1jgs+6dja5RB6KyMqrwMPthdyB1P19EBnOw+vs
 dYN5ICO3l3pfkqlTTWBDxQDBlwkU2/Uw50OKvni4cHVtRu077SSCaIdTgA+Tde2qLpid
 O5nXUNRyy+rZgHUiIIH7E9J6xlEJSXYEexjaTuezP2p0KMOyfY7eigefPsx19zFYh+Xy
 c2aw==
X-Gm-Message-State: AOAM532Jm5p1m085ItpRQRHwyhsyVByD0B7efwJbOC8vGngziRaiVdOf
 bDApFvlJfRHNjwjDpGaH7TZQSiisJLWMxR76Xw8=
X-Google-Smtp-Source: ABdhPJzJ+S3b+XHZOW81VUxJ1mHkElsf0B94rZZm/7C5niMZ+YtERtmHEKDtM8Uc8rDW/9L+Ulyr21pntbu0H/HCLJk=
X-Received: by 2002:a05:6808:1592:: with SMTP id
 t18mr1076858oiw.123.1622089524295; 
 Wed, 26 May 2021 21:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-22-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-22-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 May 2021 00:25:13 -0400
Message-ID: <CADnq5_O0upD-8xOmzd+jGdozS=F9k0+xTTOWYm29Xwop4Th9zg@mail.gmail.com>
Subject: Re: [PATCH 21/34] drm/amd/display/dc/dce110/dce110_hw_sequencer:
 Include header containing our prototypes
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
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:92=
9:6: warning: no previous prototype for =E2=80=98dce110_edp_wait_for_T12=E2=
=80=99 [-Wmissing-prototypes]
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> index 9219db79f32b6..1ef1b1b33fb09 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> @@ -64,6 +64,7 @@
>  #include "atomfirmware.h"
>
>  #include "dce110_hw_sequencer.h"
> +#include "dcn10/dcn10_hw_sequencer.h"
>
>  #define GAMMA_HW_POINTS_NUM 256
>
> --
> 2.31.1
>
