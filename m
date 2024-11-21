Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1329D5396
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 20:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C3410E196;
	Thu, 21 Nov 2024 19:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MvJQuCHb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1963510E196;
 Thu, 21 Nov 2024 19:50:28 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-83abe7fc77eso49280939f.0; 
 Thu, 21 Nov 2024 11:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732218627; x=1732823427; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iz3fx5gVJ4M22KYICfDKkgkAafxEBWal+eeMe1wl3mY=;
 b=MvJQuCHb/suRi+ZToW4XaisX0p+nJh4OPupWkVjzW7IqPNy3zGF9q2y7sEXFQukNL2
 PkskNtDEdmoUIHrSt0tiYr4FGwIz9Gxubr5BE3rbbP0tPNjkLxzx/iF82Z5BB3CXiM4E
 IEikHsMZcY5MyOtnRGbDIW1vNIICxpv+i4J6emYebDVWvc+Q1egKRyZgHNf9OXIxzJBZ
 I+Vh93B+e88YCr+anYglcDFaxcY1u17owm+ATzeMXRFEF4UPpIGFMCxrlnKC58626e9I
 cI45rm0alqJ6N/ewCS7AJB7B35MNg9RGAMvJB8OzSuSzsh2KjiYEA223+JYLxZw/WtIR
 Mlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732218627; x=1732823427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iz3fx5gVJ4M22KYICfDKkgkAafxEBWal+eeMe1wl3mY=;
 b=FkqQ1jZxADjzyFvff8acT6UOenEdwGPsbg4VO8V0uZVhkiCcZTi+sBd5CA2t0MT4GA
 jysF38aHjxI/UR7l3V0ADx74+P+38IsgAbcRWW3aATjRPZQowJMnQSmjW+dqgPeLkFX2
 b9tUsZNNujCpw6sV/eAvxbN9gfBgAXgKcWTfVJKs7g+KrxBjhase/2GWTcSpIzyyxg6K
 N+eAHquuGRz/NLMp07553JRLN2cFVOqIh4QJQEFl9KFdIgyAs7g//ijZl7M058Z9ouM/
 ug480DTvl9Uvm7ANvqZrllBQluWWKv0o71qemzTvAbi2sjIyGamlG3YW2IibyIBa0X+1
 B8rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTPCC9aMyLX8uewuqBm2yw1ZUH9IGjHKn8mEDiWy1Yp8q6GLQrPkIHBi7H+AziOcJgdtDiR0gVHQX4@lists.freedesktop.org,
 AJvYcCUendsa0ZhkBFzHsAbQxkZzq42muvIGL1WpyMTIznSAqlKtUVTfofSe2mcW1xBiMRjO0NI3mzavUMA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4rlF9/oQmWUK6hFoEI+KtP2iJi89bXdMWmqJbgzhWJpNZO8w4
 h+hk+8WTyh8eamFm1sW9GAXXpGT3REtySZCoyfdDDGgqw3lB13GRBIWML3o1v1TFiH0huL8AmGn
 BYduaz6GPUVQmj1KR3xZYPm78eiw=
X-Gm-Gg: ASbGncuzZTUQk/yDyogeWqtsiJjsaByNtqzyoO9Au8yh7GwCBgW5lVh5PSSKSzqs3x+
 n4tl5E7sUtKlBJUA2ljdAyxrLuYtRGsu8Fs/CA7VtbM/ngB4CSmtP40cNs1/Quw==
X-Google-Smtp-Source: AGHT+IEcsVwQ+z53GhnAADuTWAgvyRSNn8jsJyjBPVBj9ItLAQIvxVXOd4pN8tYTG8mbfrhPL5pOlY7qrsRsAh+b038=
X-Received: by 2002:a05:6602:1610:b0:83a:c242:82aa with SMTP id
 ca18e2360f4ac-83ecdd15ebcmr16360939f.13.1732218627229; Thu, 21 Nov 2024
 11:50:27 -0800 (PST)
MIME-Version: 1.0
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-4-4deb87be2498@linaro.org>
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-4-4deb87be2498@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 21 Nov 2024 11:50:14 -0800
Message-ID: <CAF6AEGtBVDERQjcoXriKK3d2VZy2QMUxZZJbFdSgbpvue=0QNA@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] drm/msm: adreno: add GMU_BW_VOTE feature flag
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org
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

On Tue, Nov 19, 2024 at 9:56=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> The Adreno GMU Management Unit (GNU) can also scale the DDR Bandwidth

nit, s/GNU/GMU/

> along the Frequency and Power Domain level, but by default we leave the
> OPP core vote for the interconnect ddr path.
>
> While scaling via the interconnect path was sufficient, newer GPUs
> like the A750 requires specific vote paremeters and bandwidth to
> achieve full functionality.
>
> While the feature will require some data in a6xx_info, it's safer
> to only enable tested platforms with this flag first.
>
> Add a new feature enabling DDR Bandwidth vote via GMU.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 4702d4cfca3b58fb3cbb25cb6805f1c19be2ebcb..394b96eb6c83354ae008b15b5=
62bedb96cd391dd 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -58,6 +58,7 @@ enum adreno_family {
>  #define ADRENO_FEAT_HAS_HW_APRIV               BIT(0)
>  #define ADRENO_FEAT_HAS_CACHED_COHERENT                BIT(1)
>  #define ADRENO_FEAT_PREEMPTION                 BIT(2)
> +#define ADRENO_FEAT_GMU_BW_VOTE                        BIT(3)
>
>  /* Helper for formating the chip_id in the way that userspace tools like
>   * crashdec expect.
>
> --
> 2.34.1
>
