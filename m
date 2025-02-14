Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE1DA358A9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 09:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAE210E4A4;
	Fri, 14 Feb 2025 08:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAA210E486
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:25:13 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ab7483b9bf7so221529566b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 23:25:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739517912; x=1740122712;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l+sv0U2cyjukGfA/ZIjsFBOYnHcPPEH2EG7bSm4QAFU=;
 b=YJIrlQAID4Ma2VqIJnDjq4/i144mc5h4tBJ10F7dWYlm3NSnwPOaeoTsyJOMBf3dpJ
 0mEi1FsbQHYVO31TiZe5rlCv8u5QTOu+sCBdagXh1b2t3+mqgzKqs/oajDQ+8XSLuV4a
 Xd4Z4IzmLRMCozTpLFcRRHyrKBjazfpQOUu17A/VLsE7xfCCdDYbzZaIN3JrU6sWoL3Q
 B6SorQGpDPJ5ZnuLVDUvPUf0tSp0+y21n8Zt/lnMRw/JScuKDlWbMR+t+hueZNCVZBog
 1NidgFnE3TMJ1ASRg48lyANYs4E14YqUyLi5j7CWus2oT+m5Ibjjs8Ana4BirPXflrfO
 LAcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfHFoAE8l+8LT96T4XrLE9ZfY25faWCUyyNTCd8R4bKgEEbO72jSZ6WMRRq5LJpipFQfyDpTGrCoo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySKM/V9vtCC+G7oyiVpuIkHQgBjaKMd+mPXpYOdWPyuAlTCV2s
 t5QyWZulW22C8snUy8qsHlUmqtBgAxQcbskBpFTeLcAt3rtPt/Et0a+QHxirsRE=
X-Gm-Gg: ASbGncuNbbH9FJ8u85mNbRIc/4jmeIlcv/6QXT0HEjabfJHVot0oLRC9jTcdMIKQeOS
 gNBI3KqWyapEkxn5JJYbXGzM9lTHRspydqMFGpPOaLumXo88w0gwbnnP5rT2/Qoa6sB5mE/M5F7
 2gz717wQNtNAfm15Q9JBicmHZx27C2Goi3VPbirC/7sVyDqHUy4wpgFZieAu0HuryKBlQQMMEPQ
 jwfo/dMuPY7ZdPN1RqqPSjMu5bwxdRsezXxYCvpHvrh0Rze6q+Ph+cDKXZdtCJJQG9GqupG4eI9
 v2JI0jGA7En/9eR13PQFT0lPu0f+74+MiDB+wpwyn+oHHQ==
X-Google-Smtp-Source: AGHT+IH9K2wg/rPq/wJoC9pvZJtO6aRQK6462TN11bEDNv9b4YIPZ8AWbP5M+zg6NfgtXnoRnTEYjQ==
X-Received: by 2002:a17:907:1909:b0:ab3:ed0:8d7 with SMTP id
 a640c23a62f3a-ab7f339d423mr1045805666b.23.1739517911963; 
 Thu, 13 Feb 2025 23:25:11 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5339d9cfsm284943666b.139.2025.02.13.23.25.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 23:25:11 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5de4d3bbc76so2777276a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 23:25:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVeqHeWGbaCZR5e0sOx9GgyP2Els7kdLlAsQJk4v7VeERvj69yFNCdacKMzQDc27b1BgCvLghrkEj4=@lists.freedesktop.org
X-Received: by 2002:a17:907:1909:b0:ab7:8e0d:3d3c with SMTP id
 a640c23a62f3a-ab7f3473720mr1066973166b.42.1739517910868; Thu, 13 Feb 2025
 23:25:10 -0800 (PST)
MIME-Version: 1.0
References: <20250214040306.16312-1-towinchenmi@gmail.com>
In-Reply-To: <20250214040306.16312-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 14 Feb 2025 02:24:34 -0500
X-Gmail-Original-Message-ID: <CAEg-Je88-zfnD+Yx7GdxMaG8NZBBjDGZJJ33D0kUyYnAhMhrDA@mail.gmail.com>
X-Gm-Features: AWEUYZmee1G4NO9TTRkSGcwt1I0mLzwp9RPxwW1Z78u96Fa7SXff07gmHN3DsJ8
Message-ID: <CAEg-Je88-zfnD+Yx7GdxMaG8NZBBjDGZJJ33D0kUyYnAhMhrDA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Apple DWI backlight driver
To: Nick Chan <towinchenmi@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Helge Deller <deller@gmx.de>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 14 Feb 2025 08:18:25 +0000
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

On Thu, Feb 13, 2025 at 11:04=E2=80=AFPM Nick Chan <towinchenmi@gmail.com> =
wrote:
>
> Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
> and iPod touches the backlight controller is connected via this interface=
.
> This series adds a backlight driver for backlight controllers connected
> this way.
>
> Changes since v5:
> - Remove default y from drivers/video/backlight/Kconfig
>
> v5: https://lore.kernel.org/asahi/20250203115156.28174-1-towinchenmi@gmai=
l.com/T
>
> Changes since v4:
> - Change type to BACKLIGHT_PLATFORM since the driver does not directly
> interface with the backlight controller. The actual backlight controller
> can be directly controlled via i2c and is not the same on all hardware
> that supports the dwi interface.
> - Rename file to apple_dwi_bl.c to better match config option.
> - Rename driver to apple-dwi-bl to better match config option
> - Indicate that the backlight scales linearly
>
> v4: https://lore.kernel.org/asahi/20241211113512.19009-1-towinchenmi@gmai=
l.com/T
>
> Changes since v3:
> - $ref to common.yaml in bindings
> - (and then additionalProperties is changed to unevaluatedProperties)
> - Use hex everywhere in bindings example
> - Use sizeof(*dwi_bl) instead of the type of the struct when doing
> devm_kzalloc()
> - Use devm_platform_get_and_ioremap_resource() in driver
> - Fix sorting in drivers/video/backlight/Makefile
> - In drivers/video/backlight/Kconfig, move config to right after
> BACKLIGHT_APPLE
> - Explain this driver being completely different from apple_bl
>
> v3: https://lore.kernel.org/asahi/20241209075908.140014-1-towinchenmi@gma=
il.com/T
>
> Changes since v2:
> - Add missing includes in driver
> - Fix file path in MAINTAINERS
>
> v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmai=
l.com/T
>
> Changes since v1:
> - Fixed dt-bindings $id.
> - Make power-domains an optional property in dt-bindings.
> - Added missing error checking after devm_ioremap_resource() in
> dwi_bl_probe().
>
> v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail=
.com/T
>
> Nick Chan
>
> ---
> Nick Chan (3):
>   dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
>   backlight: apple_dwi_bl: Add Apple DWI backlight driver
>   MAINTAINERS: Add entries for Apple DWI backlight controller
>
>  .../bindings/leds/backlight/apple,dwi-bl.yaml |  57 ++++++++
>  MAINTAINERS                                   |   2 +
>  drivers/video/backlight/Kconfig               |  11 ++
>  drivers/video/backlight/Makefile              |   1 +
>  drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
>  5 files changed, 194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/appl=
e,dwi-bl.yaml
>  create mode 100644 drivers/video/backlight/apple_dwi_bl.c
>
>
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> --
> 2.48.1
>
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
