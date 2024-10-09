Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3840996DB2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 16:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133C110E747;
	Wed,  9 Oct 2024 14:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TUabPYr6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A57310E747
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 14:28:02 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5c882864d3aso7693650a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 07:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728484081; x=1729088881; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CylJOmagGAkGpdVrMr6+1cW2iaVLREpDJiGPFs09KAk=;
 b=TUabPYr60feaegL3ogS5RhxQVezLvfe6yVsQ3DMLsUpuUtmh2Q7ek4Uj8JvuMLSqz8
 HPB8Yi0OV9r7spVbMTFghycZgvKUmdIqs8a18SfYgGTqM03p386r3ay8Vfn+2aczH8t8
 L3Trtf6O+lQNjPa2urhf+Bqes7qz7yqK9Yr5Juo504lXNAsSCaSCtaHEtgrY6IzeIHfM
 DZM75UlJRQ2WDB0YVBdBfvzH1lvWwJyYVo4aGlnNoTK/l4uNPcE+C7pZhh48mIXCFVjS
 JhW+1SpO4Hxo0KddW+UEfSYl6a2Stt7lsuh28TFZFs7uVXE3gN228HAfKSkBLjd991eN
 jMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728484081; x=1729088881;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CylJOmagGAkGpdVrMr6+1cW2iaVLREpDJiGPFs09KAk=;
 b=r2VtdQThD7d4ZYycQkuHuOHZsOD8DYfDrPvnumHX4S3vVE0uQgB/jnCUb8J+s0/oQ2
 HAdRKArpL0q204oo4bfw+p9YIoUUn2vlu2CBiWEjd+GjT93Pqnmep5jZU2Wy0SiZMOK8
 ejbYH7y8HWa8y03cth41Gms8dkIsPWPStUds97hbUdFWU8pQ31gKWOXHfSrS3Nj5lNN+
 lAU6OOlqRem95o5CRmVTygZS+jsVjA1ZptCvrcTZgzqRRAEdTh2tWJxGTWgzNwKFaAvP
 BCDk/in1sYPr2Aa0k63vvMUn+iSiK+CYAerg3M0NFGwmkBp4OWVIMAkczVI3bnOOEaFy
 myCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf4vyUhHxGT1wSXCwCJ75NX+uNWZf8f8A9KUoiXO9oQqgQmMLM+haDv5pQ+iBhLIjORGVksysoDKw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYFKBJ9yQYP+HAJWmoy/exJEu2VWWmIQvRjE+5CVq+l8T/SAHm
 sNGegYy+2e32pMklHlLoRG8+xVXk7M8Jo6bMmLjuypX/NnLkkBUfZ/RO20AcOCE=
X-Google-Smtp-Source: AGHT+IFC2+aNftX1wtcYA5gceGi5A5G0BYMh6bKRimAvEmAv1nnzz79VY6eqA3p/ELTcZ0JDKdD5Pw==
X-Received: by 2002:a05:6402:528a:b0:5c8:84d9:ce26 with SMTP id
 4fb4d7f45d1cf-5c91d5c3636mr2060269a12.19.1728484080612; 
 Wed, 09 Oct 2024 07:28:00 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c91cd8eadesm1016377a12.12.2024.10.09.07.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 07:28:00 -0700 (PDT)
Date: Wed, 9 Oct 2024 15:27:58 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: backlight: convert
 zii,rave-sp-backlight.txt to yaml
Message-ID: <20241009142758.GB16179@aspen.lan>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
 <20241008-zii_yaml-v1-2-d06ba7e26225@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008-zii_yaml-v1-2-d06ba7e26225@nxp.com>
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

On Tue, Oct 08, 2024 at 06:00:58PM -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-backlight.txt to yaml format.
> Additional Changes:
> - Remove mfd parent node at example.
> - Ref to backlight's common.yaml
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../leds/backlight/zii,rave-sp-backlight.txt       | 23 --------------
>  .../leds/backlight/zii,rave-sp-backlight.yaml      | 36 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 23 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt
> deleted file mode 100644
> index ff5c921386502..0000000000000
> --- a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Zodiac Inflight Innovations RAVE Supervisory Processor Backlight Bindings
> -
> -RAVE SP backlight device is a "MFD cell" device corresponding to
> -backlight functionality of RAVE Supervisory Processor. It is expected
> -that its Device Tree node is specified as a child of the node
> -corresponding to the parent RAVE SP device (as documented in
> -Documentation/devicetree/bindings/mfd/zii,rave-sp.txt)
> -
> -Required properties:
> -
> -- compatible: Should be "zii,rave-sp-backlight"
> -
> -Example:
> -
> -	rave-sp {
> -		compatible = "zii,rave-sp-rdu1";
> -		current-speed = <38400>;
> -
> -		backlight {
> -			compatible = "zii,rave-sp-backlight";
> -		};
> -	}
> -
> diff --git a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml
> new file mode 100644
> index 0000000000000..fe9dba8231bf1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/zii,rave-sp-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Zodiac Inflight Innovations RAVE Supervisory Processor Backlight
> +
> +maintainers:
> +  - Lee Jones <lee@kernel.org>

How did you arrive at this maintainer list?

It's not the usual backlight group and it also doesn't match the
maintainer for the mfd bindings.


Daniel.
