Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C96996EB2A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 08:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A11F10E7FD;
	Fri,  6 Sep 2024 06:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TLa0NOki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0647210E7FD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 06:58:18 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-846c5995a6fso449946241.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 23:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725605897; x=1726210697; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8N8A0s45H/VLtj9tyWVe0GkyJaEn5PZatiSoHaZgnbA=;
 b=TLa0NOki/oBIzQLWuFzd1FN89pGZUJX++zRLJpJraAIuyT+ufvQWVTJnhaMTKuyhKL
 riY4WIVN0QbmhT+M3CdRF+QXCTQyiD6Pcas8BGn41mscTqOHMp2/NGa6R8H5M5S+OiCU
 5Ycaxwo3FLnC1MSiQSsHoOLNd40ZduP5aiPPWjDgsULzqlhzPvvzDNzcPzldbA6AxcUX
 THogRoYc612OZ8BeNmAClZ3A4Qyjs4FZEei95DZ+cVIvqyoSFNSVh/lrK1ssP4HxnDsL
 f4GLQo5laHOG+bq7iytvNfY5ixBGn/65Fbo+j9KDuxJKXo78uWEwkaFx61mxgmzF2HV8
 Amtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725605897; x=1726210697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8N8A0s45H/VLtj9tyWVe0GkyJaEn5PZatiSoHaZgnbA=;
 b=MHTi4ftqCkOQLX1gZ8KpMauay5ZelBX+rA9MbWsXDo1tjy3BqR3kftmr+BLqVQzJ0J
 29jtADjZ21K8kYWilIAyguw6Nxs2YHsk2pI78oX4MLT4P1rifc3XsjwXCO7gu5WOgI1s
 cDX6rY7tlbr9KFmVOz4B8EUreHnQN21MOZ5tdEeV6V/BlYxyOgLOqCQvEVNWSXeUWaSN
 VQR8NDbHlxokxQQAq/SONjj3H57ufDEZ0Gz8yhs3kWQX+0a5+JbmqujqUHgu5tfXxNjc
 NWXORthryN4ViNnCRKKs4ZVCQIC374sWE1LDac0CqceHyde60jBB+UyagMXWZ5YSDCBg
 Tknw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHJ9ga3xVnPoMjdqlZGKGla18mHQrOAmQvekTN7EumUXJL53VZDc/Szbc1Y7ngu3Pa9uZ+c1NaFE0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymBGScl19HLSdxI0qxSZjSn4/dv0AZR1k7CkDBOOPo2CxtxDtM
 Cl5Wr/kidTU5U6SaRs+yYQMjVyVseDKWQAA3NXz/5Gy0dZDC5mioH5Ehw1muLgrnd9UR87WW0TM
 mUgQGlJLsCLlWQUhIrbiMYtZP6xg=
X-Google-Smtp-Source: AGHT+IF1Fi/nDHguPritS3NX2mXODBmwKdzEwTEKlD8xdN4sfaoxulLn25xubO3nmPTVcNcapnLXl53HoDgmi4q0JOI=
X-Received: by 2002:a05:6122:915:b0:4fc:d9ef:3be6 with SMTP id
 71dfb90a1353d-50207af281dmr1797058e0c.2.1725605896653; Thu, 05 Sep 2024
 23:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240825090052.22135-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240825090052.22135-1-krzysztof.kozlowski@linaro.org>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 6 Sep 2024 15:57:40 +0900
Message-ID: <CAAQKjZP+1xRPBc+tfJ735AtEtBWwiLThbi_-SA28cQs0G66LOg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: MAINTAINERS: drop stale exynos file pattern
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Hi Krzysztof,

2024=EB=85=84 8=EC=9B=94 25=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 6:01, K=
rzysztof Kozlowski
<krzysztof.kozlowski@linaro.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> With last TXT binding converted to DT schema, all Samsung Exynos display
> bindings are in "samsung" directory, already present in maintainers
> entry.  Drop old "exynos" directory to fix get_maintainers.pl self-test
> warning:
>
>   ./MAINTAINERS:7539: warning: no file matches  F:      Documentation/dev=
icetree/bindings/display/exynos/
>
> Fixes: ad6d17e10306 ("dt-bindings: display: samsung,exynos5-dp: convert t=
o DT Schema")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied. Seems that RC7 is already late, so I have merged it into the
eynox-drm-next branch.

Thanks,
Inki Dae

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 028186bb4e8d..c75918994a53 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7536,7 +7536,6 @@ M:        Kyungmin Park <kyungmin.park@samsung.com>
>  L:     dri-devel@lists.freedesktop.org
>  S:     Supported
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exy=
nos.git
> -F:     Documentation/devicetree/bindings/display/exynos/
>  F:     Documentation/devicetree/bindings/display/samsung/
>  F:     drivers/gpu/drm/exynos/
>  F:     include/uapi/drm/exynos_drm.h
> --
> 2.43.0
>
>
