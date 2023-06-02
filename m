Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6419A720330
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 15:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAB510E076;
	Fri,  2 Jun 2023 13:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4250410E058;
 Fri,  2 Jun 2023 13:24:32 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-bacfa9fa329so2191608276.0; 
 Fri, 02 Jun 2023 06:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685712271; x=1688304271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EK+51MW3toKtyRlc9EMV1WInm0ZLn2YavXgg/4Uqv7E=;
 b=j6Z3qR7XeHBUiZLFvnc5Bjm0eqg/PSMrQh2s+MMVUzSRB+Gz2f6Xm6fVTQuUdzRgI4
 RJMLDVTe/Abj6HxuC5s4GHX5MJSsRJP8ek4OgCO9BS7HFtzrtNPqqmPblgA9XxTA+JAC
 41hT08BwvaTSpWwbxacSu6vnuVYj1sSsHT3aGwlcQ54UC3B1R897s8JkxudyF4oeeiJg
 5dG9iMtyoQu280R+XzxMCju8+92cuwMrYWc0pgMSpt8Hzpegs+XXbPs+HYHUG7YvrO4X
 2G2f+V4FGn/msLSsNJfSyCMgbJfU468ZIbH/7OY22/Xrojgs+OS6WRjgm1obQfuzLVYr
 F3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685712271; x=1688304271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EK+51MW3toKtyRlc9EMV1WInm0ZLn2YavXgg/4Uqv7E=;
 b=DQSkvcSiXOma+aR5IWx7wEL7t+osejnD4V85L34K3jPlWD9JQ32gZO81XVU/dxvylw
 ATvSxxtyFMrJ5GLV0h0V7j4P+rO8yPAw2wd/JuhBuXKOqQmcSi5Kp81oL4BpdMIHHjaN
 Oy0Uckv7obAskWihw6ILR4Ae0aP6DY4HYmlpcNvU6zvr0K1tnpSMm7zFfhjv0ylkytbv
 1JxhLCJEzCIHWHAoT7KzZQ5d/hV2fxyD5QP4AWafQBxXAVg4hQc+O10Raa9qawbTBA7M
 Fofb9iXY2mvcrmBjKNgV30AObg+2ks6dnpszsyoqs1gPWKRdTkhzenyWWm57mEcvteP5
 9hug==
X-Gm-Message-State: AC+VfDxqB0ervdopdvOqmWKLEDoOsgxddDzDV85NFpkf81jqqSvxkAhV
 4W0abJh1vZQ9mrcCXoXBxcmQxIG27QgMpKqGSYoS43BJ
X-Google-Smtp-Source: ACHHUZ5ukYZeWQX4kVwhZtlf0is9pN/etZFtkxQqSNfPmK2uWdcjuNhvzS+lfgHmtEEaAxlybI6yZEc6Crg52jyXOOY=
X-Received: by 2002:a05:6870:e285:b0:199:ccad:7dcb with SMTP id
 v5-20020a056870e28500b00199ccad7dcbmr1561398oad.58.1685711783630; Fri, 02 Jun
 2023 06:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230602061753.116781-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230602061753.116781-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 2 Jun 2023 09:16:12 -0400
Message-ID: <CADnq5_N1+TUihtWtM6uLpKN3BMHEJCY1_KiX=M0btTTqcoXCGg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: clean up some inconsistent indenting
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

On Fri, Jun 2, 2023 at 2:18=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dpms.c:2377 link_set_d=
pms_on() warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D5376
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/link/link_dpms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c b/drivers/gp=
u/drm/amd/display/dc/link/link_dpms.c
> index 2963267fe74a..f7f1a1586f3b 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
> @@ -2374,8 +2374,8 @@ void link_set_dpms_on(
>                 }
>         }
>
> -               if (dc_is_virtual_signal(pipe_ctx->stream->signal))
> -                       return;
> +       if (dc_is_virtual_signal(pipe_ctx->stream->signal))
> +               return;
>
>         link_enc =3D link_enc_cfg_get_link_enc(link);
>         ASSERT(link_enc);
> --
> 2.20.1.7.g153144c
>
