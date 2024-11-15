Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D657D9CEFBE
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 16:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEE710E891;
	Fri, 15 Nov 2024 15:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lo+1jFUx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D24210E891
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 15:24:19 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2fb4af0b6beso32766501fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 07:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731684257; x=1732289057; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ucx6B/JNPInEFsSvEI7ykSi0Caq6EWc3TFtRreEO100=;
 b=Lo+1jFUxCZJrJn3+ACvAyJvtw1OEW2J6bXMdpgEJTT7ETSvp8CzO5ZVB4XB4WpA745
 9xTepYpa2XZTm21n32gKA/hWj8v6jQdbJPL9xIZRaxF+/y5SRhi2SCoofbTyly9HXfzi
 vWRT36f2MYvP99bRCKNYYakKtr6Hr80xyyMylQ/na6WjZ6oTHaMXIoQ/enPyLxdKDiR5
 FSd3QLm/Azrkn19Q+C+LtSA9uWifL4lM4oXqVb4/9R6RhDXyJzRe9DuZrH9sS/9ThT8I
 7mf/7rRuaOEfd/mHYDbhYW7RQHW+u7PzkFHq+HmmI/NhIUFezOXTTsJI/kaymlcB5MDC
 DviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731684257; x=1732289057;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ucx6B/JNPInEFsSvEI7ykSi0Caq6EWc3TFtRreEO100=;
 b=nw3qOefejV+Q8UGIwdRGGhLh75TH/U80uH/BnYuSHcDMLCczteRMGUVSFhs7Ek+sFY
 WAAhl2ITA7SzYEAiI+LvaF/XcB3uGxUUZYQqjkz5yi0M4YM9UqEbPsXqthUr5RQvG8ie
 oBEhW17ZeRpheOsyGIfVNi4xGE88BJ65vSf1pzEhvVB1y0WV2eOxOtMZJtW1xuws92vx
 Yes+4tdw4mvOSlDLZ2XKwE2GNphmslesx/Iv+GEnrWC1BuzDY3MCZWa5st/+u8Ix4wwV
 mA6bun7OeS1teSXdoUa509ss5WnhNx9ITM46UOJKfX+aQEQx+CG5eC45zEuimX2LZBY4
 f7dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5pa52QmBxwzQDgLgXfRlgPURpn+ikozfTZCPOax00OVpaMt43qitVkaKstWnIS4LmVPqtbunJuts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIiygu8EBVFC3uWfmdg3MxhLm1GLKr7z0udX3hVdGms76btUCj
 Y5o5oCtX9nemhtPr83Yc4edpgDVj7F6gO5x3QvKymT78c9drDztTrY3E26gMtoLyBKoqqJk1uye
 20Uo1nNV1liaIXuCdfsAACjjlAjg=
X-Google-Smtp-Source: AGHT+IEq+4+ZiT7fatSpyDHwGTKw9bmCk8H4bY8Ywl4dnVqzNvEW7tC37RSxM+cvzrfByPvlrPEQcRJGzEGaIAKa/ms=
X-Received: by 2002:a2e:9a0f:0:b0:2fb:6110:c5df with SMTP id
 38308e7fff4ca-2ff606db449mr31887351fa.31.1731684257169; Fri, 15 Nov 2024
 07:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20241115094045.7491-1-zhujun2@cmss.chinamobile.com>
In-Reply-To: <20241115094045.7491-1-zhujun2@cmss.chinamobile.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 15 Nov 2024 07:24:02 -0800
Message-ID: <CAF6AEGt2wHzMn2jF=P2+U5f4KQTE-8nTg4FUyF4oipkdqhYktQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix spelling mistake "swtich" to "switch"
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: quic_abhinavk@quicinc.com, sean@poorly.run, konradybcio@kernel.org, 
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org, airlied@gmail.com, 
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

The "upstream" for the gpu related .xml files is in mesa because they
are used by the usermode (gl/vk) drivers:

https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/freedreno/register=
s/adreno/adreno_pm4.xml?ref_type=3Dheads#L573

Things should be fixed/changed there, otherwise the change will get
reverted/overridden the next time the xml files are sync'd from mesa.

BR,
-R

On Fri, Nov 15, 2024 at 1:40=E2=80=AFAM Zhu Jun <zhujun2@cmss.chinamobile.c=
om> wrote:
>
> There is a spelling mistake, Please fix it.
>
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>  drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/driver=
s/gpu/drm/msm/registers/adreno/adreno_pm4.xml
> index cab01af55d22..d28fac3fb6a8 100644
> --- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
> +++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
> @@ -563,7 +563,7 @@ xsi:schemaLocation=3D"https://gitlab.freedesktop.org/=
freedreno/ rules-fd.xsd">
>         <value name=3D"IN_IB_END" value=3D"0x0a" variants=3D"A6XX-"/>
>         <!-- handles IFPC save/restore -->
>         <value name=3D"IN_GMU_INTERRUPT" value=3D"0x0b" variants=3D"A6XX-=
"/>
> -       <!-- preemption/context-swtich routine -->
> +       <!-- preemption/context-switch routine -->
>         <value name=3D"IN_PREEMPT" value=3D"0x0f" variants=3D"A6XX-"/>
>
>         <!-- TODO do these exist on A5xx? -->
> --
> 2.17.1
>
>
>
