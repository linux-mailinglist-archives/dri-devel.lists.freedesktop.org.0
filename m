Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12D4B17918
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 00:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF6610E7F5;
	Thu, 31 Jul 2025 22:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NUErS4Ip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7025C10E7F5
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 22:25:50 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b34a8f69862so191491a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 15:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1754000746; x=1754605546;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2avQs/u8C93T263u55Hd3Byk2Z7uAe/YLQBzzdrt6j0=;
 b=NUErS4IpU1TeTVH6ftIVzXecG0hSHqC7bbQrscqVNdrUypswH3IctPMJln5rjRINRs
 Dk/K4eN7UePLptNYpCZNEwsUuRGcyRrIYwHu6OFmMOYMXqRVbWBGnpnqYHIjcW6YYean
 OHKof+5jDIHAE8zOlp/L/IP3IcYR+uygBx0yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754000746; x=1754605546;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2avQs/u8C93T263u55Hd3Byk2Z7uAe/YLQBzzdrt6j0=;
 b=jdXIzhiJGgJK86+ppmeXWU+Dbylobb6VmDhaWeOTQUQEziJAkVsd3UOFK5LGdxbyRo
 No0W2dc99wnIl3TwFwpWznEcDFdynoGx7UUu1JT+5ayaR6zhSnTesLznaKvGDLRWSmEc
 PVXyacefr7ztFsKnDYSMo9yJfW6pKqXiebAz5gMG5959uAwDSkuCpo5MN0brJgImDQq0
 tyHUDmIGXLClcK4onDrXWAlEgFzQRIAFI9Zr7Ua3Ew8RpI2ofrzhCmXOOCplUeJyA59j
 nBWbFjQ6UE8KTt1E2AdZjlMre3bqcVvTJh96TqmO4G4PY9bBMJYgd4EBoEX2M1JEMUoO
 vNsw==
X-Gm-Message-State: AOJu0YzDZmdVAYHQdcg4rDC3iBQkVtAF0a0EsmTWVdxr604BPPHCz5gN
 toNkU1Ee85/hHpe8Ltu9dQl9Rv8mQqJuAyk92cpvGX+RixvG7rKeQLj789lDTqgIb4fqh8TNTRW
 HFxc=
X-Gm-Gg: ASbGncsKuQyxVArvCbFMu+Tqgif5Qd1wSvM0/pTKQAKbs2RoYlkZ+lYjVH4q86QCUxZ
 rGhOZlgx+Z3SzTmTuZHknF3VIP87PYi70uVQPBIsclvYDMm+ZL7V0ogIY+/7JG8Zb5JitGbL12S
 LglL14JSNH/aV6TUqvYm9n1pkn3sPogDPz5kG+/TTDYJw3zIN0nrOlMQjIO1MPsmRhul1cNCUCx
 GsMhCCYhoyMid3l79zYmEsH9OMaKnegQXM43oaroeDBqOF2yonaWxZiCs0cbZIRJOr6ZYCtoOPx
 DjnBPpJRNp6f1o/yYFpVIv8fx7al/pecU6ufOqPTIKqPZhhzS8C7TbMwfxBvcOh+fQ7ccve47nm
 Eqv7PzBkYyShyGcBuD0IHFo9SclsRISE5CFjSZYwW5B08a73pR3fXfvuqmmJVvg==
X-Google-Smtp-Source: AGHT+IGStOFlH4WstCGLdvoARGEdBVXgfF6Qd6GGjnydZAxF5tQlFMxnGnRQxfNvZpitzmZ85BCTxw==
X-Received: by 2002:a17:90b:43:b0:311:f99e:7f57 with SMTP id
 98e67ed59e1d1-31f5de494b0mr11392008a91.23.1754000745816; 
 Thu, 31 Jul 2025 15:25:45 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com.
 [209.85.216.49]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63da565bsm5707112a91.4.2025.07.31.15.25.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 15:25:44 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-3190fbe8536so185947a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 15:25:44 -0700 (PDT)
X-Received: by 2002:a17:90b:250a:b0:313:dcf4:37bc with SMTP id
 98e67ed59e1d1-31f5de59cf0mr7700439a91.34.1754000743815; Thu, 31 Jul 2025
 15:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250731215635.206702-1-alex.vinarskis@gmail.com>
 <20250731215635.206702-3-alex.vinarskis@gmail.com>
In-Reply-To: <20250731215635.206702-3-alex.vinarskis@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Jul 2025 15:25:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBaNJ7VKmJ5oqEb_HxEKrpRWmaSCkVejvRwjMVdvUdqw@mail.gmail.com>
X-Gm-Features: Ac12FXyO7QutJwaatVpGbTWcIaoRXNZfqpiuPLqpynloYzM1ku_IwCQ5zDIp86s
Message-ID: <CAD=FV=WBaNJ7VKmJ5oqEb_HxEKrpRWmaSCkVejvRwjMVdvUdqw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: samsung,atna40ct06:
 document ATNA40CT06
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

Hi,

On Thu, Jul 31, 2025 at 2:56=E2=80=AFPM Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> The Samsung ATNA40CT06 panel is a 14" AMOLED eDP panel. It is
> similar to the ATNA33XC20 except that it is larger and has a
> different resolution. It is found in some arm64 laptops, eg.
> Asus Zenbook A14 UX3407QA.
>
> Raw panel edid:
>
> 00 ff ff ff ff ff ff 00 4c 83 0d 42 00 00 00 00
> 00 22 01 04 b5 1e 13 78 02 0c f1 ae 52 3c b9 23
> 0c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 42 3c 80 a0 70 b0 24 40 30 20
> 88 00 2e bd 10 00 00 1b 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fc
> 00 41 54 4e 41 34 30 43 54 30 36 2d 30 20 01 7d
>
> 70 20 79 02 00 20 00 0c 4c 83 00 0d 42 00 00 00
> 00 00 22 00 21 00 1d ca 0b 5e 07 80 07 b0 04 00
> e1 fa 51 cb 13 b9 3d d2 0c 01 45 54 40 5e d0 60
> 18 10 23 78 26 00 09 07 06 03 00 00 00 50 00 00
> 22 00 14 8d 5a 02 85 7f 07 9f 00 2f 00 1f 00 af
> 04 23 00 07 00 07 00 81 00 0b e3 05 80 00 e6 06
> 05 01 74 60 02 2e 00 06 00 45 40 5e d0 60 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b0 90
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml   | 2 ++
>  1 file changed, 2 insertions(+)

Pushed this to drm-misc-next:

[2/3] dt-bindings: display: panel: samsung,atna40ct06: document ATNA40CT06
      commit: d7c2aad1254a1b4e6d76947cbdd18813b02a0e24
