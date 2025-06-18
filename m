Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2971ADEE25
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F91910E836;
	Wed, 18 Jun 2025 13:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Y8NJ53qH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD06A10E839
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:42:54 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-22c33677183so60786035ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 06:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254174; x=1750858974;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tz0a9+M5C7nElDvvHd2ysFpCEWklRNzZpChi88lTTGs=;
 b=Y8NJ53qHOv1v14zfEU65bweejDs7PXdCuw3oOLtnSv+WliZno/YYHoO1okGP5NxW84
 glkGK7q0avmyPxfNDfJGo7SCjKRkfWU7kwzSWlfIpJNqdI8JIZKuhyCzsdGMnqIf5YYl
 Eb08NL13NDTN216W71FIN4s/WgDMK1/X5g5REs45UFANcyloFgM2QjLlwqQDkNX8pAI0
 eolc0d9XQBBEyRfZGr5YlAbv2+tGjnsaZWXxvx3GvStqIZlc+tkFht/WEG6LfEprK/Pg
 a+6560I2de9I5rNLUz7kly42oy+4PSsrOuOZ3czQDdwu3R6FeywXHmN9D0CaeJeiNUDP
 1gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750254174; x=1750858974;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tz0a9+M5C7nElDvvHd2ysFpCEWklRNzZpChi88lTTGs=;
 b=mmiO626v2YNzJSOu6isgmuWtK/Ryuq20YmjLBL4ZV7h/1eLzG4H9CZMC9foqzKNZp5
 2mPiniW3EzR+umZAr8OlFHcOnD0JYT4nhTTLNsm8iIactje92vIrpfD6LDVNJzaiClgS
 piDRUJJhwf01flMUUnvcW4uCe1rlpqADMrAUcpL8q/lvNqSVKnJM+LBzfAsa8LU4nYJS
 zOIxNQZHINziSALadD8Eu/2+jXpIeOrX731bvpLdlaLUuIoG2RFr5+qIlkr0RyD8tll+
 0s8RplXzCrdS0uNzdZVv4nQEC2SClu0WHclXDU/dLle8F3m0sjIb+ymS3uHFQro4GMc7
 SeFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvProAmlvBEeTHKHCsSxTWJ4BPIaPaiA70vo5rjDfrQzjeuKC5NLtV6nQXLLK89EtV3p22+8BMd6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUJr8q2Y266vP7UAWz5IZr0btRxFMS8e6mpQ0ko+tyKJMpawPy
 7Jc62+tTNJUb+8JVnuYJw9kXDewAR11Qb3BUWEwF3/PObgf+r1upgdkMm5XxjIy7X24B2a12SgI
 Jk12sUg8/RfkGDqAJo7cAspaa5pKuSdLn9iyayZTfUA==
X-Gm-Gg: ASbGnct53sRLSJjM3aIOwwe/wRhxWhE6/wr3Y2casfi7nljIdZ9Bf1VfntIRY5hPwi6
 62iY4LXS/PqO9M3dLe6kiiEzBlkut8qQNQT6zva+p+MCQ3GEPvJuMBXfUy8nziREJo5EjYG3xAS
 Ts+zg8TGx9HJCNGDuxq5MTU5466+2mvZphsc7VIiPNFTzNTLu42lMQfUkWelIuJ4LfR+zTW4gUA
 A==
X-Google-Smtp-Source: AGHT+IElrVhMfyL96c9QVT6DbL+Lc21boXjlquqgqsoD4fhNOqUmdIoDw1JXTFKsvyhQJ4W4uPfVUPd6XCcj78sx+6c=
X-Received: by 2002:a17:903:46c8:b0:234:c22:c612 with SMTP id
 d9443c01a7336-2366b17b6d8mr272722965ad.43.1750254174423; Wed, 18 Jun 2025
 06:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102230eucas1p2573610db9d4a9f3543d0048c30b2df9e@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <20250618-apr_14_for_sending-v5-5-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-5-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:42:40 +0200
X-Gm-Features: AX0GCFuzTphnup-dhM3gVd1jGswJjfqrqmNVH_fP0A_YpAvwshbZGGJ4zdPhw5k
Message-ID: <CAMRc=MfKx+S-8yYpab1YO0XsGN6a9-ybJpyRoyN6wCrKcm=j2w@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Wed, Jun 18, 2025 at 12:22=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Update the img,powervr-rogue.yaml to include the T-HEAD TH1520 SoC's
> specific GPU compatible string.
>
> The thead,th1520-gpu compatible, along with its full chain
> img,img-bxm-4-64, and img,img-rogue, is added to the
> list of recognized GPU types.
>
> The power-domains property requirement for img,img-bxm-4-64 is also
> ensured by adding it to the relevant allOf condition.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
