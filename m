Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD733925DD
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 06:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF876EE17;
	Thu, 27 May 2021 04:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606466EE15;
 Thu, 27 May 2021 04:07:27 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 n3-20020a9d74030000b029035e65d0a0b8so3170037otk.9; 
 Wed, 26 May 2021 21:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=biRP26rVUcCDUxlQKzqIiq6xaK3uwBrV/Qk9YlWx7iU=;
 b=Lvc/0ad2S41Y2inaGB+y3ko0vNk5/5PGoyTFgSAHppOljYZ8gdf8OttN1r7sGmXs4n
 GaZwmgTrDi97eVBMTi5c0TaQniyI2gX8fwXLfagTgEq3YVYBAvz8byoKJxWU25L30hDw
 bpclaMU2tQNt5tFOZhHNq2DihxDLxbO+ebX9+fF35alvl9+l4aRM0ZOSnfff/+UyFvrL
 n/gvNTbEQad8hEoUixsGpaGDtcA5EnIipLBfeXQ95JFIXar1GNZ/np9EqpprnXycsIM6
 +1H02NoCXcxx0xv30QR4AzlW02rVsSgmIwz7073qZ1axPAYh7RqJYWnztUUcsYAgh5YE
 uywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=biRP26rVUcCDUxlQKzqIiq6xaK3uwBrV/Qk9YlWx7iU=;
 b=c6uFOQzOxPLRFRU6lTI7iz0EkVMttwR5TvEJaUtJ+IEAhmmYYZYXn0mufBWK3LieEK
 Vj/YDrVBLvs2sPTT9UxBbhmSrMvN7ENSrr5v30KCqmjUlTufQIo0/KZ7lP8GqcP4ztBg
 XOvmRxHBNbIYTxfnLNcwGNGflXxElN56sYL558G+4l+5CrdSA7wvnxKLKuiktGJgzqvU
 jgNnSYCc5nNXknGABQeLbNqViEP6Dh+yUCTP5t6w3RcPY/bEHyjname8JcR5ndmyYSqD
 7jfN9V9L2FcjIewBMlOJczfp1vIFPiR7PmCBusH7qStw+j2elJrY+piZ7l1AqotiuQCr
 ZQUw==
X-Gm-Message-State: AOAM532J3ZbzkcnoKtRF6spKkZZejTFz9Td7hPveZqpZF+/84UzBPMPJ
 CQgpE0w63ZH7cqafzfmkuSwFhL0MajeFymS+Vik=
X-Google-Smtp-Source: ABdhPJzEfSXRivAnJdi6SeTD/+1xR9TKlmVtvSYaYLngnkYXEQ1fhBNMVCyLnuQnerV4Vl0wz/a7inrtQalD/snllf0=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr1241846oti.23.1622088446582; 
 Wed, 26 May 2021 21:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-16-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-16-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 May 2021 00:07:15 -0400
Message-ID: <CADnq5_PjO_KWOU1y8kXDV77Pm56vzhGxaWow7-GFGSxqGsMr9g@mail.gmail.com>
Subject: Re: [PATCH 15/34] drm/amd/display/dc/dce110/dce110_hw_sequencer:
 Include our own header
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
7:6: warning: no previous prototype for =E2=80=98dce110_edp_wait_for_T12=E2=
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
>  drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c =
b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> index 5ddeee96bf235..9219db79f32b6 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> @@ -63,6 +63,8 @@
>
>  #include "atomfirmware.h"
>
> +#include "dce110_hw_sequencer.h"
> +
>  #define GAMMA_HW_POINTS_NUM 256
>
>  /*
> --
> 2.31.1
>
