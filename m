Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A699167B2DD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 14:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A47210E0F6;
	Wed, 25 Jan 2023 13:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9991710E0F6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 13:02:11 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id g13so28816359lfv.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 05:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WUlWEcztX7LC+YPVdX7zQ3TiSCzemn77YbP9UmZzYSE=;
 b=ZWujWps5xV+1Wp9WkpTktZV8uw9uUYoO8g5XV6hX5GoFex0wS6QvPRwAG/2X2m1TpC
 AnHeNzLJDDtn53tWfoYWTefbTDjXDAE0nyphHivQZvoRdrxbqpV+7GwZiiMjSczRHu8S
 2+wR907XANDw+tY9iJAZ7kQb7uGdBtK+VXYG5abfl8fMtfvdNrdyGPXGOMxIoU9QKeVu
 4IlTBODyMAWFOY81r6JOyh5Fa315CiPWT2rXXbjFQEfpJSeF4VXVDJglh9UTsnUwh9su
 TYGOZhQhykmGOSX5lbdOvzn5eD1DRAR9mumAOcV1QbWLinLDbhcnO/qlNyd2Axsp+wEi
 p/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WUlWEcztX7LC+YPVdX7zQ3TiSCzemn77YbP9UmZzYSE=;
 b=30prHQ2BwkwvSGzU7UrO2bvr8VSEogvBJosAvvMmpRsLkgPXuEzLEA/wxIA5vfcYsa
 lFa21vux4qnHpPlqmEXaapwHVtIkKF2hwHaitHsNf7ASHrsbBdaTWT/DPsmPCwL7imvV
 93Z9frI+Zp7lLthjzuuWCgfV72punipXp0eM/d71jmqrZ3CQuc8ehw7RLkjigCCaoqj5
 6vbZ1uSMqD7V6kezF1/2FlHxQYiIhfKiF9A2cIGKKS15d8qB/pK/VTmlQwfbrwJc4/gB
 yPdYJdscEervnMRcgcZlGwdQPC4gi0JjsmZxfdEvXwZQSM7+trQLaYZzgVD5O6bLjtU6
 HbXQ==
X-Gm-Message-State: AFqh2kpe6uQpHnKEBfIKZxlKiAo7mexCAo0G8XHRRZX7UIcV2SxUczbv
 4a3b1gqNUiXbe6oJq1XTBkRRyCS4vIs30kEz9mPEew==
X-Google-Smtp-Source: AMrXdXua3Xzk3n+mAS+SHWDmCwyiaUE3a82cF5mU8PKvzbJFSacMHuyCjbHJ/PWxjesRw9CjRh1dmLPf3Blx2uP0BXc=
X-Received: by 2002:a05:6512:3984:b0:4ca:faca:5b59 with SMTP id
 j4-20020a056512398400b004cafaca5b59mr2768406lfu.615.1674651728174; Wed, 25
 Jan 2023 05:02:08 -0800 (PST)
MIME-Version: 1.0
References: <20230124230048.371144-1-robh@kernel.org>
In-Reply-To: <20230124230048.371144-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jan 2023 14:01:55 +0100
Message-ID: <CAMRc=MfdDv5teeQx802Qi3otwfXtZ1jAX_bzvH4DQMvdas9YtQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marc Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org,
 Jassi Brar <jassisinghbrar@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 linux-spi@vger.kernel.org, Richard Weinberger <richard@nod.at>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 12:00 AM Rob Herring <robh@kernel.org> wrote:
>
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present.
>
> Add unevaluatedProperties or additionalProperties as appropriate, and
> then add any missing properties flagged by the addition.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

[...]

>  .../devicetree/bindings/gpio/x-powers,axp209-gpio.yaml |  1 +

[...]

> diff --git a/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> index 7f26f6b1eea1..31906c253940 100644
> --- a/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> @@ -35,6 +35,7 @@ properties:
>  patternProperties:
>    "^.*-pins?$":
>      $ref: /schemas/pinctrl/pinmux-node.yaml#
> +    additionalProperties: false
>
>      properties:
>        pins:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[...]
