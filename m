Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C40E934FC6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 17:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8ED10E983;
	Thu, 18 Jul 2024 15:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EbE45cdK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282BF10E0EE;
 Thu, 18 Jul 2024 15:18:33 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-70364e06dc6so532778a34.0; 
 Thu, 18 Jul 2024 08:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721315912; x=1721920712; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C3pgAhn8Hz+xMofFbtGLdx5btdIDRNI5147fpowYYlc=;
 b=EbE45cdKFJ3dfmtTtWo7HUlws0Kn5RXcwTYADKcztTM8HUPmTkxBfzBApvyUdsjaq0
 bW5+fjKHauEafUSTE/rIC2+pTuoK79PK2i4uMMBSUt3tcFx46qwBHlnt3wdxYESdYOVO
 BdPu1uJiCZB1jxKaAuQTb+f7dmL0m6dJdWMTT75OL3octI3fD4oxx4CPy1BpkALdwOkA
 9+UFBIAnHALbWtt4/mngJMkh0QOLNMRPdMpEA+RWGuQDaS8ZqwVhwLNweNaJLRkJ97uy
 Q08G3RPP/58jskAildZ/2kp0Dcsti2KPiGvLQbxfZEhIpcXoJcL53w7yesx+I/mEsx3D
 dATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721315912; x=1721920712;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C3pgAhn8Hz+xMofFbtGLdx5btdIDRNI5147fpowYYlc=;
 b=BvIcpr/wSQXzU7XrVu8SFdsiFuhJfgcUteAnM1yKc7XcRQ7mhixic86WbcLw53K6rp
 YY2dWSQbixbOAO10wdneZYmQsW/0tfR4/2T6eLguKIoXGjUvrBAeKeRTo+vUzvm5NElb
 eu+ODVH+UuHCpqkExPqDlA2R1X4ABLKhSV6F/grHkaowtJr10T60HtbS/70WG2Sclk0s
 QH+cyfsQBNuafXunyOu52+M3Ak3WLl0cUCJgtv5wxBv7V+j5BKvtkXZ0FteQF8w9PCn3
 r2qblo3UgASlQZrj+6AO2rOMC6ikkw5y0wvBIK0HlwaKDLZVD58Vfn6BfkBEYQQutEwK
 uV4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeiWqry/Alm37NQODkf9fNSMKyjpjVowYInJXeIbYkrM0SkPstTxmGLoflwELaHSaF9Uznomu+1+ejhmyvQ+fb96pe5K5Jlp0iZ13zIod1ipykggFp0TTlrx19n9R8r4lPrw4W1wdkWxQWca3CTQ==
X-Gm-Message-State: AOJu0YynLdqbt2qTSLs0GGJYjdWbsg/dkWunJP+ggUoi/LVZnPX56wFg
 otzJ9yDIafZwavCHEd3JR7U/ncNvbTV+x5Nr67uXYCY93jWUCKajs7t7zocr2RFFKiw+oT51hGJ
 TaKc1ef8RtTqfqwRvyQm0ONjLoQ4=
X-Google-Smtp-Source: AGHT+IFOthVJdopFJZrEzMNq3d436b+HpYYgi68VAUJis86seEnZpukZJnPvnMc2OxyBw33I3huvcQ3qV0dx69VJDqo=
X-Received: by 2002:a05:6830:441e:b0:703:5ac3:3e4e with SMTP id
 46e09a7af769-708e3798c15mr5541746a34.7.1721315912272; Thu, 18 Jul 2024
 08:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240718141141.872558-1-make24@iscas.ac.cn>
In-Reply-To: <20240718141141.872558-1-make24@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Jul 2024 11:18:18 -0400
Message-ID: <CADnq5_NOBrCQ7vK3WCMJ-0TS+9B5Kq0L0MB4=xriPNXdRLmfhQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amdgpu: fix a possible null pointer dereference
To: Ma Ke <make24@iscas.ac.cn>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, srinivasan.shanmugam@amd.com, 
 chenjiahao16@huawei.com, aurabindo.pillai@amd.com, Jammy.Zhou@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Thu, Jul 18, 2024 at 10:12=E2=80=AFAM Ma Ke <make24@iscas.ac.cn> wrote:
>
> In amdgpu_connector_add_common_modes(), the return value of drm_cvt_mode(=
)
> is assigned to mode, which will lead to a NULL pointer dereference on
> failure of drm_cvt_mode(). Add a check to avoid npd.
>
> Cc: stable@vger.kernel.org
> Fixes: d38ceaf99ed0 ("drm/amdgpu: add core driver (v4)")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v3:
> - added Cc stable line.
> Changes in v2:
> - modified the patch according to suggestions;
> - added Fixes line.
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_connectors.c
> index 9caba10315a8..25b51b600f6f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -458,6 +458,9 @@ static void amdgpu_connector_add_common_modes(struct =
drm_encoder *encoder,
>                         continue;
>
>                 mode =3D drm_cvt_mode(dev, common_modes[i].w, common_mode=
s[i].h, 60, false, false, false);
> +               if (!mode)
> +                       return;
> +
>                 drm_mode_probed_add(connector, mode);
>         }
>  }
> --
> 2.25.1
>
