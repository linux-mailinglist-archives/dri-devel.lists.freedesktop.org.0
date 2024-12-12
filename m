Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 416CC9EF312
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 17:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9BC10E421;
	Thu, 12 Dec 2024 16:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TsVCV8c4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5566510E419;
 Thu, 12 Dec 2024 16:55:53 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2ee9b1a2116so67198a91.3; 
 Thu, 12 Dec 2024 08:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734022553; x=1734627353; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzlIoW7L3/4b18+N+ENiSNhzaS6ksog5gbyke7Oxry4=;
 b=TsVCV8c4VrthknyGtJC24tJnpe+PqYV39VNSVdwNAUoqNbrUJlcl/+70drKIBcbzs3
 oDoV1VvlC91UMnDhS+J0h7sgVoaE6ESJr9lBI9lj15mdRvWxavZqyojduPoa3n5oWSoZ
 s2m6M1S3G5RN4sbm/IAPjsfQ4AHLEuC0918VUA/CqtVv+gSx+E9+UBY3uEv3GIcYjFHU
 o2DTi1T94Rkv/5mG9K32i8k+zw61LmZt7weTGtudMRrhvB9tVqvdlMLZhTDp7FK73D7r
 w8zdoTdBVjXWlUwHRl+mEu1MGuuoV/fPMxMeUpYVGWSi7g/eA6Vl7VfvKj/VuTBTRaUv
 wE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734022553; x=1734627353;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kzlIoW7L3/4b18+N+ENiSNhzaS6ksog5gbyke7Oxry4=;
 b=E2uXpwq32EXDSFFtFZsP+CQucsonLc+4brFOeh6FRN94NvZKFQscckKTBhOie33Sgn
 kWqtZI2ZiGPY/V75m3HqwFc1/mHt43vaoivyW9g3LxKgEl1AcwUo01K5Y3f9nnL4n0LM
 FMqkTcG//NGaoXbAhmYmUm1wsafCbZnnxumF+nVy4B1y+/svoV3CiBqUSkbbICeeK9J5
 Hl1TCCFjEQwK6P+TiGDd+4erD7lB3uxUt+m2yb1UZQsD258OS8NmrVo6/11sRFwv7Qdx
 roelT2YzivBMMKefDY/S8UBiGLlLhFbq/0EuL+tS/QGSBBRyNDiQK4EI/orPLAzCbzmF
 Jshg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8J1qJqeSx3UA04qzRi6LfCOrB24f2Qyvj9glrwNHb6WhPoTlQMgse/Q7mG6j+r/OM4aPnrIWF@lists.freedesktop.org,
 AJvYcCWF6hxEQjVd0JtvtL9UKFKytAhBlOAaWDypfaWUeT0w+2KqHdYrmAwbAofEiKSsHzVjyG8mtnukgztz@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrnqWb8n1j44xfDsM0nekyeAoX1vSa7fZ2t6lIBEfUyMeukunJ
 wQtn+SMT5O5cCAMBUvPTUBTwgcqvBeCVhPYNCRU5Lo3/tv4VBg9CT4YIWyGdXTennfD7hZ1dEj9
 58WpHDmLLC2YJwRQCdNUzhSACl9Q=
X-Gm-Gg: ASbGncvMYZyVC73JdearJ8FLnehx9IX9IkNjIL/KwJeSJA0jkJlxrgdcURicW8qF/x4
 ehvTbFxIhwdxill+8HcOMp1YFWOZBMV62j4V7fQ==
X-Google-Smtp-Source: AGHT+IF+Mlf23HjLPaz0/T9fZnjcn4ERaK3oOO0keRJwk9CUb+mw8/2C78O2JyWTd+4U016kKdzujVlhA989rq5VYMI=
X-Received: by 2002:a17:90a:d993:b0:2ee:f64b:9aab with SMTP id
 98e67ed59e1d1-2f128048ed8mr4161251a91.6.1734022552742; Thu, 12 Dec 2024
 08:55:52 -0800 (PST)
MIME-Version: 1.0
References: <20241212014717.14286-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20241212014717.14286-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Dec 2024 11:55:41 -0500
Message-ID: <CADnq5_MvwHrnyr=0smZ7PqG8JqD1eXv55iK9kUi1qHtVHsE4Rw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: use swap() in
 update_phy_id_mapping()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Abaci Robot <abaci@linux.alibaba.com>
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

Applied.  Thanks!

On Wed, Dec 11, 2024 at 8:47=E2=80=AFPM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Use existing swap() function rather than duplicating its implementation.
>
> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c:185:47-48: WARNIN=
G opportunity for swap().
> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c:125:53-54: WARNIN=
G opportunity for swap().
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D12335
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/driv=
ers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
> index 309c7999faa6..6fdc306a4a86 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
> @@ -120,11 +120,8 @@ static void update_phy_id_mapping(struct amdgpu_devi=
ce *adev)
>         for (idx =3D connector_cnt; idx > 1 ; idx--) {
>                 for (idx_2 =3D 0; idx_2 < (idx - 1); idx_2++) {
>                         if (sort_connector[idx_2]->dc_link->link_enc_hw_i=
nst >
> -                               sort_connector[idx_2 + 1]->dc_link->link_=
enc_hw_inst) {
> -                               aconnector =3D sort_connector[idx_2];
> -                               sort_connector[idx_2] =3D sort_connector[=
idx_2 + 1];
> -                               sort_connector[idx_2 + 1] =3D aconnector;
> -                       }
> +                           sort_connector[idx_2 + 1]->dc_link->link_enc_=
hw_inst)
> +                               swap(sort_connector[idx_2], sort_connecto=
r[idx_2 + 1]);
>                 }
>         }
>
> @@ -180,11 +177,8 @@ static void update_phy_id_mapping(struct amdgpu_devi=
ce *adev)
>                                                 }
>                                         }
>
> -                                       if (swap) {
> -                                               aconnector =3D sort_conne=
ctor[j];
> -                                               sort_connector[j] =3D sor=
t_connector[j + 1];
> -                                               sort_connector[j + 1] =3D=
 aconnector;
> -                                       }
> +                                       if (swap)
> +                                               swap(sort_connector[j], s=
ort_connector[j + 1]);
>                                 }
>                         }
>
> --
> 2.32.0.3.g01195cf9f
>
