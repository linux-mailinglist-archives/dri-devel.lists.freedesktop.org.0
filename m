Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F073925AA
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 05:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC1D6EC03;
	Thu, 27 May 2021 03:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEABD6EC03;
 Thu, 27 May 2021 03:55:02 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 o14-20020a4a384e0000b029020ec48a2358so814326oof.13; 
 Wed, 26 May 2021 20:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DYdOvbKIS1vZWONSAPvNPTiDzbelKy3t1aUeLsgWFhI=;
 b=kPGnlulp5k2F+B+K3fyRfScskNP8ZyHJoSJbo95tgoVtlPWnIWQMm4Pa6u9ilh9CHJ
 HVXsPASkp3wrDb1Yn/26wivV7jrv+xZPANfnvwcd+QZeMPonDhYsQR1afdCAzjhAThoj
 z4W0EbKuxEn1bQdk4qKBxvmv1TuZCpdG+jhfb/Pjb24sMBPCCSOPPlE9AsAX8NbEBY+P
 CI8Ix37uFTrUJ8KNa+JHjcHdSg65XZvQqBPmAM1jscOmSFCKBdA7YUiXfOkSA1nl+K0/
 jH54F+4j+8zWxf19n01IdshtAyjwtPuiSWPxAgzsF9OODng9Xnvit5YxgdUBMaSkVWDT
 +4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DYdOvbKIS1vZWONSAPvNPTiDzbelKy3t1aUeLsgWFhI=;
 b=LoPaEgEe1dWZZvsOxtGWxU11TTDkEneyyCpbZf0Su80MXauuTsmJIjNHJHe1bLvDQk
 QKGTDAypXJPQEzE6CRDVW1o6GF7CDxbcta0psiVmW/t5fCHhIg46wl7d0aFYIKX0ED40
 ftMaf54SDnbiEOsDkx2ukf03vo8lmevbQp6nTIAzxa+sRLm+Ti/M2Kd6mO7JTo8z8El0
 eDBnmZEzGY9rMZJ30McPpkQXeDeUthV2l6KeLbQW+/pw86TvWcsa8B1hbv0HTsNCDUwp
 IGIcs3QmjktuMNLRGKyzw7YfnN4knn1Wox9rnIkXa0bnIujVth4cEAon5yp1LdiCkqgT
 yiTA==
X-Gm-Message-State: AOAM531yM3rElOqENGCpMHg3cWxQ9UOa6LnEDJCcNOd51n9J4Ipl6Yes
 +hXa4cDXs1Q3DzADqz9MAgPGLIPnBtcEoHiCsKwC3059
X-Google-Smtp-Source: ABdhPJw6g2LITGmHYZhVJQjNCbEYY+uteLhXWlUvPhqUVuSZe5IwdkcB5EHEfuy02gyjwWePP3qG5xRWbOHESHpsJdg=
X-Received: by 2002:a4a:d085:: with SMTP id i5mr1199155oor.61.1622087702123;
 Wed, 26 May 2021 20:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-8-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-8-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 May 2021 23:54:51 -0400
Message-ID: <CADnq5_NU4fPUun-W2--KbpKP7yD1oD-tcQ=B82Apg6xiXR6+xQ@mail.gmail.com>
Subject: Re: [PATCH 07/34] drm/amd/pm/powerplay/hwmgr/vega20_hwmgr: Provide
 function name 'vega20_init_smc_table()'
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 26, 2021 at 4:47 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_hwmgr.c:781: war=
ning: expecting prototype for Initializes the SMC table and uploads it(). P=
rototype was for vega20_init_smc_table() instead
>
> Cc: Evan Quan <evan.quan@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c b/driv=
ers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
> index d3177a534fdf0..0791309586c58 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
> @@ -772,7 +772,7 @@ static int vega20_setup_default_dpm_tables(struct pp_=
hwmgr *hwmgr)
>  }
>
>  /**
> - * Initializes the SMC table and uploads it
> + * vega20_init_smc_table - Initializes the SMC table and uploads it
>   *
>   * @hwmgr:  the address of the powerplay hardware manager.
>   * return:  always 0
> --
> 2.31.1
>
