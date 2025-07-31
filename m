Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D50B17920
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 00:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF52110E26B;
	Thu, 31 Jul 2025 22:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SRRKL4gR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173C310E26B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 22:31:07 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-73e82d2ec9eso739791a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 15:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1754001065; x=1754605865;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JuzCKl0JWVA/Tt1eJjsJNxFRtsPec8WgVBQlmDXx0UY=;
 b=SRRKL4gRfM6Lhbo6Yc5WVYEApQH9tzCLW/+wFH6Sb3ovoGj4arJf2411jnk0XXTvj+
 l56MA2uTFkaNoThe2mjHR0yZ8i5RGsyvYsKOy2Hgz6tSO0PF8QLme38zfv9R1p4mh/oW
 gAjQKIk9w+A1G1TYRnroSwHs3lTs+9vOrG0Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754001065; x=1754605865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JuzCKl0JWVA/Tt1eJjsJNxFRtsPec8WgVBQlmDXx0UY=;
 b=HjAVM2npYmkgr11jRATr8kwtxLfh4X73GWYunNPjQYisIj874YUMUCS9hw7Z6YgpUR
 e8KsZ0QkewadONkE8Yye/KG3U8olQ4kEGvavVcOXPlxr9T5DaUadpER+YteKR60AaBBy
 JWns6gqpBaeW/H9bPOUQ90UV0164bTmTRbW8k6wYvFPfRFJz4KoPiNIL3nkjUG1sZ+6O
 /1t9dTzOCfQ3slGBIXj/6buBYR0WhIVB1+e3ugAZTUKHfJLzDPfcOok2xbuFpJt+Eyl9
 TVQ/xqugRiEOPKwo1E6RaA/I9/iRcmuByOwoe8q+pE/jei/u1K5t9IbDbxgL+7hdrCJ0
 nDNg==
X-Gm-Message-State: AOJu0YxYrRMD6Ucdpw3EwhJDfVVlDAFmlLIyqVBi30LBtbex0DwNf5ur
 FE0xVclpGtEbFPLgkIsUfRc9Q/ZMKyba3los3Pa+6zsdpvAlUUv/HCqmNidQOlaAxrMJigLo5mm
 b6p4=
X-Gm-Gg: ASbGnct0FMFB6KdvGUNztjKpATQEdzll/g8LfuQxa2wirCo62ZAJw1oMiYd5tQ3GVua
 mh9jzL8nYPM3vtouR++oovnEStqfu2UkduFuTaHGHLFiuegkFLde+LWvgi/GrVhyGQkwar8vy6k
 1kPIlfte2bQUR1uYDhohzJt+9xLliXijw+JfpnOJuMfkMV7zxddGNwVCGW5rvfE1sd2SpMlJSTk
 k9zGPORJ3b8utx4Cq1q6a93SkM02nmG7E+dRrei83W2cSL5TebNXiW6tm/D8+WFm8wPPUHgIIMl
 JfXXBeG3jLZ8O8ydv6Q26WyiFKKtADx7cwNWLLVHbtZnEAbrl4LSLLfWGOx7yy1BhkF6eaHS66o
 LqSLByBrPhD5WA0T+vcBM/JQ8eHKWT0qcbw5fMuvejUZ70jaAm/WP7t4WYFmo4XtHIqkEM0cx
X-Google-Smtp-Source: AGHT+IFHIynnTqoeZcVqoLYLjwOp2N0aXJNJ2pX5sxm6jUhoToUU94OjApVOV4iEzOo0RyRftlK5Bw==
X-Received: by 2002:a05:6830:3812:b0:73c:ee21:f360 with SMTP id
 46e09a7af769-7419400526fmr210055a34.20.1754001064636; 
 Thu, 31 Jul 2025 15:31:04 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com.
 [209.85.210.48]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-74186ca9602sm504905a34.8.2025.07.31.15.31.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 15:31:04 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-73e64e87d49so740336a34.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 15:31:03 -0700 (PDT)
X-Received: by 2002:a17:90b:1b06:b0:312:26d9:d5b2 with SMTP id
 98e67ed59e1d1-320fb58f639mr739004a91.0.1754000750319; Thu, 31 Jul 2025
 15:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250731215635.206702-1-alex.vinarskis@gmail.com>
 <20250731215635.206702-4-alex.vinarskis@gmail.com>
In-Reply-To: <20250731215635.206702-4-alex.vinarskis@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Jul 2025 15:25:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XkZk61ad-Sjywp7xUCzL=gfrOetAjdAgdBZS2euOx-Gw@mail.gmail.com>
X-Gm-Features: Ac12FXwjfUgMu3_9Fbku_FeVuAQoqm5uw9Nv7Nj3Y-NXJ8CPv5IPxq-hUPITQbg
Message-ID: <CAD=FV=XkZk61ad-Sjywp7xUCzL=gfrOetAjdAgdBZS2euOx-Gw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel-edp: Add BOE NV140WUM-N64
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
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

Hi,

On Thu, Jul 31, 2025 at 2:56=E2=80=AFPM Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> Timings taken from NV140WUM-N41. It is found in some arm64 laptops,
> eg. Asus Zenbook A14 UX3407QA.
>
> The raw edid of the panel is:
> 00 ff ff ff ff ff ff 00 09 e5 f6 0c 00 00 00 00
> 10 22 01 04 a5 1e 13 78 07 8e 95 a6 52 4c 9d 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 5d 30 80 a0 70 b0 28 40 30 20
> 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 28 3c 4a
> 4a 0f 01 0a 20 20 20 20 20 20 00 00 00 fe 00 3d
> 4c 33 30 20 20 20 20 20 20 20 20 ff 00 00 00 fc
> 00 4e 56 31 34 30 57 55 4d 2d 4e 36 34 0a 01 f8
>
> 70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
> 88 66 ea 51 cc 74 9d 66 52 0f 02 35 54 40 5e 40
> 5e 00 44 12 78 22 00 14 7f 5c 02 85 7f 07 9f 00
> 2f 00 1f 00 af 04 27 00 02 00 05 00 2b 00 0c 27
> 00 28 3b 00 00 27 00 28 2f 00 00 2e 00 06 00 44
> 40 5e 40 5e 81 00 1e 72 1a 00 00 03 71 28 3c 00
> 00 60 ff 60 ff 3c 00 00 00 00 e3 05 04 00 e6 06
> 01 01 60 60 ff 00 00 00 00 00 00 00 00 00 de 90
>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed this to drm-misc-next:

[3/3] drm/panel-edp: Add BOE NV140WUM-N64
      commit: 82928cc1c2b2be16ea6ee9e23799ca182e1cd37c
