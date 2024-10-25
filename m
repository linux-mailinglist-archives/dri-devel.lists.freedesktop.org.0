Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570939B0003
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 12:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB0110EA74;
	Fri, 25 Oct 2024 10:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U4VEzoXZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5BA10EA73;
 Fri, 25 Oct 2024 10:23:03 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5c8ae7953b2so351647a12.2; 
 Fri, 25 Oct 2024 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729851782; x=1730456582; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bnkdO6Jy0sXnfoOSgtNQYJZ7CVRF7LOljIZq+ZsRPk8=;
 b=U4VEzoXZ23R3YCAIDW3jHdPOt+/hrvqjJ/OUhpEtcEOkvJUdP+YHOx9m0IfrpD9ZoS
 1P4PufgP/zPou4ql+XuTmXY+9DV5ppNZ/Z1JsxAdyBc4iblaTwL9ENd72V1MhUncasOb
 ZxEn4hD4JF2WUE+aeaPM//2RBRt52t57Z4xUCsLaRkqK45cdJu9COLgpJhG9+3Y/8t5L
 N8tg8tGR7RF/2munfrMLFdR7sCaEwlxNEa4ehZtZBgh3GNRXjHcQZ4AZBeyE0YQjl86O
 JSEi1qLlCf1tVNXlniHGu6tSqc0FCtbnNXdE6hzG+VtLsOEED+Mnu/qU25SCTP6NuLUi
 lraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729851782; x=1730456582;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bnkdO6Jy0sXnfoOSgtNQYJZ7CVRF7LOljIZq+ZsRPk8=;
 b=ZSrV9zsosCd+cxJG9b4ZJHsO8gJbpjZ+nXCzhyYw893mHGqKTGGH0MIf3/84+FKxwy
 HU4LICabQx9QpY3fvnFwTlVuzXt0Zi7fsfM/wJFzw80HidW6YqLhto2DfQeuqSJ94nTz
 aZIFz1Oc9h197lrgUTytFqCXq9Koik3F7iHq7ZPEAOhK/5+h3lXZYgLuKD2TxaNV1du/
 mjp6BDO5kZLz3x/TjWT5tnpPddBcD45vgeypmHlii8wHJYAAVJKbQS110qcsY9hbqz4T
 gsVvUvW5CRpLCb9kBrlL4Y2Wwi+V+tMpBOvxCbsj9Pf1La8U6JjUdcGTJ+u/mBKIrXPP
 z4iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg72atAhRNvOiTSPiShrbaPcc42UvhaqinXbIDgL1/TnLWp1+qia/BN6l4XB48mSE83uF67ONkAak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhG710vx2nCxJvSPXlrUT6OyUjznMn+G9iY7AAvEMm/91NSFLf
 +mFVqFCufAf0azfxMKMw+l9kkxO72DNcvk+3Nga23EfvOcrjmAoxBjAO2jP780yf3batPCoSdGX
 mmyK9EAaU+DZ+4ZpZ9vkLflu1IY8=
X-Google-Smtp-Source: AGHT+IE19YlxJrEhP/YgcDzsfmbB5gNCiSp7f0yLUwN1VUNglua/7q8w7KD66z/Rfkvundi0lzlHm0MwwuxbjG3fjfk=
X-Received: by 2002:a05:6402:27c8:b0:5c9:6b2b:5502 with SMTP id
 4fb4d7f45d1cf-5cbb8571c15mr326256a12.3.1729851781550; Fri, 25 Oct 2024
 03:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241025060244.535406-1-Qiang.Yu@amd.com>
In-Reply-To: <20241025060244.535406-1-Qiang.Yu@amd.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 25 Oct 2024 06:22:24 -0400
Message-ID: <CAAxE2A6MZOod5V3dNmtCkh9jJwFm3qRxicUPwp1Dz841JnO5bg@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add AMD_FMT_MOD_TILE_GFX9_4K_D_X
To: Qiang Yu <Qiang.Yu@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, 
 Qiang Yu <yuq825@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>

BTW, we don't have to define everything here. We can use most of the
32 values freely.

Marek

On Fri, Oct 25, 2024 at 2:03=E2=80=AFAM Qiang Yu <Qiang.Yu@amd.com> wrote:
>
> From: Qiang Yu <qiang.yu@amd.com>
>
> This is used when radeonsi export small texture's modifier
> to user with eglExportDMABUFImageQueryMESA().
>
> mesa changes is available here:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31658
>
> Signed-off-by: Qiang Yu <qiang.yu@amd.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.=
h
> index 78abd819fd62..70f3b00b0681 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -1516,6 +1516,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 mod=
ifier)
>   * 64K_D_2D on GFX12 is identical to 64K_D on GFX11.
>   */
>  #define AMD_FMT_MOD_TILE_GFX9_64K_D 10
> +#define AMD_FMT_MOD_TILE_GFX9_4K_D_X 22
>  #define AMD_FMT_MOD_TILE_GFX9_64K_S_X 25
>  #define AMD_FMT_MOD_TILE_GFX9_64K_D_X 26
>  #define AMD_FMT_MOD_TILE_GFX9_64K_R_X 27
> --
> 2.43.0
>
