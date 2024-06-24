Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A61491506A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B7F10E475;
	Mon, 24 Jun 2024 14:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KDB/RLEC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364BF10E473;
 Mon, 24 Jun 2024 14:45:35 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2c889d6995aso690179a91.3; 
 Mon, 24 Jun 2024 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719240334; x=1719845134; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4mDsOwzKtQuTbrnZkosOYMHtSypsAJlM4HZ6rzIl0Ik=;
 b=KDB/RLECoBkGMW9yLnzcD9kXP5CtuZ0oFmZ3f4gsqd4wnIWQ8QximF1lFvff4Q/SSn
 yE2kbwhfi8JH5g60YS5+U6v/qBLBKUutEfaC/ErSoq8vrn4pUMoTnUknwmgYxbC24tHp
 V9GoztqgASE6vn6MR4w3Tw3mKBLJkFOvvY4wl/FVYO8eTpkxWclg2dkGppgfdh57Y2B2
 5Jk+pdEg8Pq4fxAa5FidVA996Kgq9Nc+UDXaUP/fHpf11zry9VojRsMz0n/gC1Dh1dNe
 6Gw23b8ZLjWXioi5E/FKvcel88KM1xGtqhjPqkCZJ1IkM9gzCPqszvRuHbY2al62P4yV
 UaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240334; x=1719845134;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4mDsOwzKtQuTbrnZkosOYMHtSypsAJlM4HZ6rzIl0Ik=;
 b=eDIA6BRmtAd4DN5aAULwFy+MqDslGYMHMUKFPY+5SpFmVE6CnG+sUooZKOl/rajrRr
 nFBNusSS20moVJAA9xVu4cO10JfP7avofNkdKFD/9PZ4uFpWWr8YyYHdb5fCXYIKGimU
 ckBxpsmLtOw1P6bcDpNmian30Fzn8mNbzPSgoolpl46iCqw4Jo52INGNizXMe6+NOcc2
 eJ3Q6W8tRPKNkDICS262rFOsgt8jBrVSJMp/iZD3rnpv+vYoM1fuoLPxUmIokZ3IPeL7
 uFg8NjoUFwYUAYMZcXGLHIK5KWqJUsMLv56iMX9/76TPeYCnb1AYXJ3Op3C/zt5PIiB4
 WB8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzkFPeVieoJTt+CdjJ0mm8LJVlq3CNFxvqIaN3hqJcNAXWzYjUN1zRLa+LIa3dx9EFjhlzuZcmhrPJqkeyjQMhwbslcJZIC4pAOkOgiNiam/J+EmTprfgNLJIDexHUSIdpBdB8Qld3Y7w88h7ftQ==
X-Gm-Message-State: AOJu0YxqEXoY2YseUmSjMX7ZIoRZBsRxuKbDspLLBEmAAsJekSO82aBL
 dn/CbHQ4v7Lb/JZIRiGY++YYhgSyqvcZcZBIyDFsmoZnxwUZt3O2xzdhCsaAWVfFO8AWvUCdh4P
 F9eLcUugQc2EqOX9XNw8jguinKBY=
X-Google-Smtp-Source: AGHT+IH3bebP0lY82vBlI8fNjwjTmbTeUHhU1OC4AzvNPEhJLF7y9pOSUVbKPACUzSAvVhS9/A0KI7pXKbrOwgq+IQA=
X-Received: by 2002:a17:90b:1c0c:b0:2c2:e45b:ecd with SMTP id
 98e67ed59e1d1-2c86124b3eemr3530884a91.12.1719240334393; Mon, 24 Jun 2024
 07:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240624031158.98502-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240624031158.98502-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jun 2024 10:45:22 -0400
Message-ID: <CADnq5_O5eQ5oU7+oX+Hg8jsWY-9DLiRYJA6SOfotDQupnALgYA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Use ARRAY_SIZE for array length
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
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

On Sun, Jun 23, 2024 at 11:37=E2=80=AFPM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Use of macro ARRAY_SIZE to calculate array size minimizes
> the redundant code and improves code reusability.
>
> ./drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c:164:45-46: WARNING:=
 Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c:183:47-48: WARNING:=
 Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c:237:45-46: WARNING:=
 Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c:257:47-48: WARNING:=
 Use ARRAY_SIZE.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9405
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c b/driver=
s/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c
> index 1b2df97226a3..7ecf76aea950 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c
> @@ -161,8 +161,7 @@ static enum mod_hdcp_status read(struct mod_hdcp *hdc=
p,
>                 return MOD_HDCP_STATUS_DDC_FAILURE;
>
>         if (is_dp_hdcp(hdcp)) {
> -               int num_dpcd_addrs =3D sizeof(hdcp_dpcd_addrs) /
> -                       sizeof(hdcp_dpcd_addrs[0]);
> +               int num_dpcd_addrs =3D ARRAY_SIZE(hdcp_dpcd_addrs);
>                 if (msg_id >=3D num_dpcd_addrs)
>                         return MOD_HDCP_STATUS_DDC_FAILURE;
>
> @@ -180,8 +179,7 @@ static enum mod_hdcp_status read(struct mod_hdcp *hdc=
p,
>                         data_offset +=3D cur_size;
>                 }
>         } else {
> -               int num_i2c_offsets =3D sizeof(hdcp_i2c_offsets) /
> -                       sizeof(hdcp_i2c_offsets[0]);
> +               int num_i2c_offsets =3D ARRAY_SIZE(hdcp_i2c_offsets);
>                 if (msg_id >=3D num_i2c_offsets)
>                         return MOD_HDCP_STATUS_DDC_FAILURE;
>
> @@ -234,8 +232,7 @@ static enum mod_hdcp_status write(struct mod_hdcp *hd=
cp,
>                 return MOD_HDCP_STATUS_DDC_FAILURE;
>
>         if (is_dp_hdcp(hdcp)) {
> -               int num_dpcd_addrs =3D sizeof(hdcp_dpcd_addrs) /
> -                       sizeof(hdcp_dpcd_addrs[0]);
> +               int num_dpcd_addrs =3D ARRAY_SIZE(hdcp_dpcd_addrs);
>                 if (msg_id >=3D num_dpcd_addrs)
>                         return MOD_HDCP_STATUS_DDC_FAILURE;
>
> @@ -254,8 +251,7 @@ static enum mod_hdcp_status write(struct mod_hdcp *hd=
cp,
>                         data_offset +=3D cur_size;
>                 }
>         } else {
> -               int num_i2c_offsets =3D sizeof(hdcp_i2c_offsets) /
> -                       sizeof(hdcp_i2c_offsets[0]);
> +               int num_i2c_offsets =3D ARRAY_SIZE(hdcp_i2c_offsets);
>                 if (msg_id >=3D num_i2c_offsets)
>                         return MOD_HDCP_STATUS_DDC_FAILURE;
>
> --
> 2.20.1.7.g153144c
>
