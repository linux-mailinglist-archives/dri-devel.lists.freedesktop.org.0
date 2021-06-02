Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A51C398FE2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 18:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB236EB14;
	Wed,  2 Jun 2021 16:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED5F6EB14;
 Wed,  2 Jun 2021 16:24:00 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 t10-20020a05683022eab0290304ed8bc759so2897999otc.12; 
 Wed, 02 Jun 2021 09:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cZmDB0R8MYQqdnFyr5kHgXADjM/v40Bk8pYmSEReiu8=;
 b=F2U7lDM58wl86JVA1xx0TFZsmY+sP2repFNTtnLXvAyoTyVb2DTr52JEIZr7nQzXZy
 P1kneitgTOhGVeSgMP1nlppsALjNo//w7ADbiCMxLeE+FqeNqWKc/+8Huo/0rofqphuO
 g14rUobx7YSbZqaQXt8mdxVRi2Z5MXfqHS3hAl+0Owh2keTbCkZyg4aH/CjfuX2hOkcr
 BMq4hwdV54azgJ0fwA/2+THNgEqPevpLeMVoBif67GgdcVLfVVe6U5iyOhX9NqftZ7FX
 OQsyvo81qBEfuURklq7nsVhmqx6tiTtq/yjGYxPY8h/JqmYT17nfjmW4OfpVHsRgVW67
 atbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cZmDB0R8MYQqdnFyr5kHgXADjM/v40Bk8pYmSEReiu8=;
 b=t6yIKjBTSZ19wPuRjNSaYb6f5R+rO40Eodk8O9yCG4hBuj9UnRLF9Oiue0VeSuGSv2
 Bi+b4c/7Vlm6PeEs3HQjuF/9gGDqmrk/ifW5h+kOgRz+M0kFs3qkMFuNWTFUGJvDw3vE
 zf8Tlv/VuFgT67GShPElC+gfnrEgu5ZgYsypyb2oQs1X7zNfAoX8sBqMp7D/KRC+WRmh
 DLCSHkJKtinkBNfNJUrmjTM8D3KFr3R0W3aZpDqjxQr8KzkSwlwZ4PPVQaxJEG5+lmZp
 muP3jC80MkwaIaFVqEsv5o9h4yxyIeFSPAWGtkk5ruefaoIRrJWOsKHP4Z6MkvrdLxC6
 E3TQ==
X-Gm-Message-State: AOAM533BOPACXfUGUCNFIwmGmP6RYhGpIctSE1395u3Z6vypCMo0gCBC
 iY7JRgNZ2kflxsYUliFYcwQ41noaj8iL3HkrFfo9ioljEuM=
X-Google-Smtp-Source: ABdhPJz1BaV5VzBqVZFn1mtftXfq2NvR/yvqHSfO4Le2Pj/qDgFg26ZzK8ynsMmLvPKySfldKZGgP9zN7tvy/eu1WKg=
X-Received: by 2002:a9d:6548:: with SMTP id q8mr26590805otl.311.1622651039670; 
 Wed, 02 Jun 2021 09:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-17-lee.jones@linaro.org>
In-Reply-To: <20210602143300.2330146-17-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Jun 2021 12:23:48 -0400
Message-ID: <CADnq5_MHcth1p_00d=0ey+kg8o=_ZQk4t-RcU7zx3fb+35uy+g@mail.gmail.com>
Subject: Re: [RESEND 16/26] drm/amd/display/dc/dce/dce_transform: Remove
 superfluous re-initialisation of DCFE_MEM_LIGHT_SLEEP_CNTL,
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 2, 2021 at 10:33 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.c:374:22: wa=
rning: no previous prototype for =E2=80=98mod_hdcp_hdcp1_get_link_encryptio=
n_status=E2=80=99
>  In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce=
60_resource.c:28:
>  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:568:43: w=
arning: initialized field overwritten [-Woverride-init]
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:157:14: =
note: in expansion of macro =E2=80=98mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL=E2=
=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.h:170:2: note=
: in expansion of macro =E2=80=98SRI=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:183:3: n=
ote: in expansion of macro =E2=80=98XFM_COMMON_REG_LIST_DCE60=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:187:3: n=
ote: in expansion of macro =E2=80=98transform_regs=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:568:43: n=
ote: (near initialization for =E2=80=98xfm_regs[0].DCFE_MEM_LIGHT_SLEEP_CNT=
L=E2=80=99)
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:157:14: =
note: in expansion of macro =E2=80=98mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL=E2=
=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.h:170:2: note=
: in expansion of macro =E2=80=98SRI=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:183:3: n=
ote: in expansion of macro =E2=80=98XFM_COMMON_REG_LIST_DCE60=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:187:3: n=
ote: in expansion of macro =E2=80=98transform_regs=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:645:43: w=
arning: initialized field overwritten [-Woverride-init]
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Mauro Rossi <issor.oruam@gmail.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dce/dce_transform.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h b/drivers=
/gpu/drm/amd/display/dc/dce/dce_transform.h
> index cbce194ec7b82..e98b5d4141739 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h
> @@ -166,8 +166,7 @@
>         SRI(SCL_F_SHARP_CONTROL, SCL, id)
>
>  #define XFM_COMMON_REG_LIST_DCE60(id) \
> -       XFM_COMMON_REG_LIST_DCE60_BASE(id), \
> -       SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
> +       XFM_COMMON_REG_LIST_DCE60_BASE(id)

I believe DCFE_MEM_LIGHT_SLEEP_CNTL should be kept here and it should
be removed from
XFM_COMMON_REG_LIST_DCE60_BASE() to align with other asics.

Alex

>  #endif
>
>  #define XFM_SF(reg_name, field_name, post_fix)\
> --
> 2.31.1
>
