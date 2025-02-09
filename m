Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF66A2DE29
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 14:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507C610E339;
	Sun,  9 Feb 2025 13:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FEF10E057
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 11:22:48 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ab7863f9be4so346405366b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2025 03:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739100166; x=1739704966;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=czsr8ut4E1IjeGJZsPHODj7dteAs5/QBRXMGMfAcAZA=;
 b=bKjnM6FnoFlxvJukrDN/YNcAcGF3tcTcpe7b9LbpMlqmQY+ZAwVtsvmWWnz3NRQfH5
 JwlOUVr15771NULYEZw0tXyKgoNez3DJAONQOgKVtUUHJiTfaCR17SMH9YB5oexevB6V
 aFl+NU7NNFriM7EL99ZBQ+SSffqZPx0t8QN4BLjtsoQr29QVHXzFoD/lC0B7/7h9+XKh
 VYkwXz4/SFjxz9lB02vbZBB/sDfKAavZJdtcdUq97t4xTublms3w+39qIqSlTUsJHOfC
 aLY2WxGiDh/Qjs41rmKdGX7C1ZrVAbCpnuC8i7A6ihegkvT/6RIOvGkGL/3K+FeVG2uR
 8S2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfSfhK3S+cj0Iq+akPrUbBMyF8Sq8T0MYe0fIqDhQec7YEBqeqtUZPMtL7yzGk+c7iVotT/A45dbI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO5eMF0ofLKokehlg13t1DnzQ/Sv35yhDL1hQiI4r1Npp/t3GM
 cNHNtm8UggeOvwDy/GQExeia1PX41zkhf5PkA/J9lMPqPPX2Dck8J+DHqRydja8=
X-Gm-Gg: ASbGnctkjNlMevqWlN/kF4nz9cMStY0WOpv0Q9huvRzqO8PeBW/GE8zp/EXqi2t6KoP
 rso+fQs9HATPsRLFnowe7oyeIsq7UD1t6zW6Mmo6DFqZkxpZCIsQkDFvzMQfdMpk5BckBTETxCf
 3qL8bEtSd20FTY89odZwt54Qi0FRgCIpN1T5G3hxtWKYzijX05VfAX6M5iOV9NWHBac37fxNw8R
 OOBSo9zmYTVXECvA2cvbaFA7P1oQnWysPJTd9OH0oBNyQQRYZrgQAJ1fXEmbXhv0752yS77GCST
 Xunh8gyFCpJoWaPi7KqlyjttH+RGWK8cNOGTDMH3Zs49Hg==
X-Google-Smtp-Source: AGHT+IG9V0ZIK2gFVtgFi+DZ8PydTsZtGVmco78WLurKS6mgueaR0ZBj5QWBLgeYfy82fscWtu2VVw==
X-Received: by 2002:a17:907:3dac:b0:ab7:5fcd:d4d9 with SMTP id
 a640c23a62f3a-ab789bfa0b7mr923310666b.43.1739100165771; 
 Sun, 09 Feb 2025 03:22:45 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f83e30sm656409666b.38.2025.02.09.03.22.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Feb 2025 03:22:45 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5dcea56d6e2so6297698a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2025 03:22:44 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVBSKl4BuE2LKC8fLC3A+Ex5znD9vAOCYOOpfE/z2G8rZEEbSD1q4251iyyW8N7nHs56J6mwxX0dxk=@lists.freedesktop.org
X-Received: by 2002:a05:6402:5252:b0:5db:f423:19b9 with SMTP id
 4fb4d7f45d1cf-5de450236admr7763979a12.16.1739100164505; Sun, 09 Feb 2025
 03:22:44 -0800 (PST)
MIME-Version: 1.0
References: <20250203115156.28174-1-towinchenmi@gmail.com>
In-Reply-To: <20250203115156.28174-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 06:22:08 -0500
X-Gmail-Original-Message-ID: <CAEg-Je8cB==_+fNi0hc-mPqkEd-w82tWay_2Wu76hV10LV4X2g@mail.gmail.com>
X-Gm-Features: AWEUYZks2Pe6z_gT4XPe5iRvZlGve_lJKCtY1woYJMW8gNu9Xz8tZDlJPRfovXQ
Message-ID: <CAEg-Je8cB==_+fNi0hc-mPqkEd-w82tWay_2Wu76hV10LV4X2g@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND 0/3] Apple DWI backlight driver
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Helge Deller <deller@gmx.de>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Janne Grunau <j@jannau.net>
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

On Mon, Feb 3, 2025 at 6:52=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> wr=
ote:
>
> Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
> and iPod touches the backlight controller is connected via this interface=
.
> This series adds a backlight driver for backlight controllers connected
> this way.
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
>  drivers/video/backlight/Kconfig               |  12 ++
>  drivers/video/backlight/Makefile              |   1 +
>  drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
>  5 files changed, 195 insertions(+)
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

This series looks good to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
