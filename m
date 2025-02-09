Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D31AA2DE2A
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 14:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2C210E469;
	Sun,  9 Feb 2025 13:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC62910E057
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 11:02:30 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ab7b80326cdso48679466b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2025 03:02:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739098949; x=1739703749;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EZtSlMlkn5zHaXo0WZfyndZctK7R7et8V22vFKv8IdM=;
 b=qsgf9xq0qdx1d3ze+Ikv4B/ARuJ4y18hWPbYE3mZ7EghEW/B41nOJKRyKXwncuSpKn
 HfY1Vyh801cY7B2hLbyH/6d3qwJh/kOY/twd3bj9Ouf0aTSEMBwguDGPSbb/OdWAuf6/
 CKmfjPbVRBBNobUB8GxRcTzX3TlDlAqhn8Ops2n1wTwrsPmC0DerOWgLHW0C3EWz33a3
 +kHW0ok3ELdxVkEwYiFiVbfzJS2EnpjO/oAP0if9Rw1ksarmbYbrEG6uW8J4NAFO/Ypf
 3aLFZpOwi+ZcKnN4arclcsHqvRCf8dc6LwXSo6yd977GfWWjt/61ZZLGolWDqkDijZrD
 H4qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOF45IDY0uajllY3dSs81J2Xkkma+1zYqqGBZEXiLCQjhvydg5w/gkMsHPfZj0ZvQkxEdmI7qzE5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV25ln27CcVjxpSzgL6onR4Upa+8A8WDOLaJBAzYGByIG7Vk+2
 eVLNzKQ5AVLnELBraDZxbniydTj2GZi3WGrbvHDvu1fkCYOV/qSTo+0wjMqnA1E=
X-Gm-Gg: ASbGncu6OOkcs0cDgfilFkkrCaaM8mXGp2me563Yem7m+PyuinsjnRxlY02hbxvoYO8
 +r+Uq94RHkrQ3bnR2k/fdqT0TuRI7ah+3Z9VogX04LYRO1i5jICaP1AJkMaqG0hlOjJ+ZtrTpcU
 xPiSYOsH6tXgEoRRyXYjSy4l20cLDkSfiCA3zdbW2F3SbKKq6Aehlfz/oFd+03qqa6PWEVC9mT2
 hROXOi/ttoXPPigHgQd50cnGGcHfzgl5jgzu3A+kzUtS2TxNhwCDUzU1cgwIUzdhDS1YbK8uijm
 V2x6HW+VrRowtl9ZWOEjW3s2RDQxAKOwBwqNQg6ZzSAcCA==
X-Google-Smtp-Source: AGHT+IFbvtUSU3SldqJhbPsqGO0TfC0oBA1lxQ7YV4i/+iyr9Cx5/b9vEfjihdEQByJdtZe+vAaDAg==
X-Received: by 2002:a17:907:6d1d:b0:ab3:76fb:7523 with SMTP id
 a640c23a62f3a-ab789c76cf1mr977784766b.53.1739098948775; 
 Sun, 09 Feb 2025 03:02:28 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab77365ff75sm651617366b.173.2025.02.09.03.02.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Feb 2025 03:02:28 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5de3c29e9b3so4600381a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2025 03:02:28 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXSJ4KcTOh1WFkym1zgoZrD5+PPVBnJTkXb9hgvA95NZ1HgoScTOsMQ5O06XwktLDm7l/XOLlsoLXU=@lists.freedesktop.org
X-Received: by 2002:a05:6402:4608:b0:5de:42f5:817b with SMTP id
 4fb4d7f45d1cf-5de450b1c5dmr9937857a12.31.1739098947851; Sun, 09 Feb 2025
 03:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
In-Reply-To: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 06:01:51 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_1Qe_q0Vt1ReX0HG83gNP3Ph37E+d_prDiMXSWtum5vQ@mail.gmail.com>
X-Gm-Features: AWEUYZlNJz2VbuDrDkNmceAgZ0ETGFMAFQeCJbSKwBdyoI2QQNmlLF0UVoGPB5w
Message-ID: <CAEg-Je_1Qe_q0Vt1ReX0HG83gNP3Ph37E+d_prDiMXSWtum5vQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Driver for pre-DCP apple display controller.
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>,
 linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 09 Feb 2025 13:55:30 +0000
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

On Thu, Feb 6, 2025 at 9:02=E2=80=AFAM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> Hi.
>
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v6:
> - Use the drm_connector_helper_get_modes_fixed helper.
> - Split out into a separate MAINTAINERS entry
> - Link to v5: https://lore.kernel.org/r/20250205-adpdrm-v5-0-4e4ec979bbf2=
@gmail.com
>
> Changes in v5:
> - Moved to using the component framework.
> - Other lifetime fixes
> - Link to v4: https://lore.kernel.org/r/20250114-adpdrm-v4-0-e9b5260a39f1=
@gmail.com
>
> Changes in v4:
> - Fixed dt bindings.
> - Link to v3: https://lore.kernel.org/r/20250112-adpdrm-v3-0-c674dc19fa7f=
@gmail.com
>
> Changes in v3:
> - Fixed building as module after splitting out mipi block
> - Addressing the review feedback.
> - Link to v2: https://lore.kernel.org/r/20241126-adpdrm-v2-0-c90485336c09=
@gmail.com
>
> Changes in v2:
> - Addressing the review feedback.
> - Split out the mipi part of the display controller into a separate devic=
e
> - Link to v1: https://lore.kernel.org/r/20241124-adpdrm-v1-0-3191d8e6e49a=
@gmail.com
>
> ---
> Sasha Finkelstein (5):
>       dt-bindings: display: Add Apple pre-DCP display controller
>       drm: adp: Add Apple Display Pipe driver
>       drm: panel: Add a panel driver for the Summit display
>       arm64: dts: apple: Add touchbar screen nodes
>       MAINTAINERS: Add entries for touchbar display driver
>
>  .../display/apple,h7-display-pipe-mipi.yaml        |  83 +++
>  .../bindings/display/apple,h7-display-pipe.yaml    |  88 +++
>  .../bindings/display/panel/apple,summit.yaml       |  58 ++
>  MAINTAINERS                                        |  16 +
>  arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
>  arch/arm64/boot/dts/apple/t8103.dtsi               |  61 ++
>  arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
>  arch/arm64/boot/dts/apple/t8112.dtsi               |  61 ++
>  drivers/gpu/drm/Kconfig                            |   2 +
>  drivers/gpu/drm/Makefile                           |   1 +
>  drivers/gpu/drm/adp/Kconfig                        |  17 +
>  drivers/gpu/drm/adp/Makefile                       |   5 +
>  drivers/gpu/drm/adp/adp-mipi.c                     | 276 +++++++++
>  drivers/gpu/drm/adp/adp_drv.c                      | 617 +++++++++++++++=
++++++
>  drivers/gpu/drm/panel/Kconfig                      |   9 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
>  17 files changed, 1489 insertions(+)
> ---
> base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
> change-id: 20241124-adpdrm-25fce3dd8a71
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
