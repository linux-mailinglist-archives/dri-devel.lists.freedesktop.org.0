Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5BA67B6E4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 17:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7192710E090;
	Wed, 25 Jan 2023 16:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2F510E090
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 16:26:48 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id m12so2183356edq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 08:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1ilN6S2DYFu/DESx5TOWbGLPHlfDmzvINI2SI+/X/LA=;
 b=o4j8nJomybIx4kE59DRw52ujqDVZ1WQewtiJ58C37pZX/5DWWR3us5SruXAAGyfGBc
 0oxAeGxQTdIDM++/ONptAOL1nO0F6K6FiZC1F/r6Qme1XRV2lBzY485x0B9dWJnV3W0W
 TnQMulrN7yyZXGHFTiOyWDC1wY59f/tjlS5vjPAnXkbmCVxXIc2maTfx3FlJemGXPbEd
 oIhFRB2EHA0oTv8BIEwV/oq0Vp9kY4A8qUg2UpNdvj82VIuPM+pGvvRPDGd+iKkdN0iE
 fMhuNZyuRhr5wQD9uKjHTu0/dBcgt18B09bb5lO3wvYzPbjdtZ4zCb8IaUuWGDUTVpmZ
 9R4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ilN6S2DYFu/DESx5TOWbGLPHlfDmzvINI2SI+/X/LA=;
 b=NIxTutBaHzLqc4TTou99BH7K6gbFJ3SgSUq6jWolRCLz+6oL3oSHucgvpIRXbAsk8o
 iNvg0sIz5brpkx7N4C5Dq0DQX3XIFUkEvpGQ5da0EILI4fZlLy/csJU6ipi+8t66kVvJ
 3B/+PeA/MZGcsbZZneXHN7ms25l6UzC01WHkfkrbxTinilRj7Fv7iI8u0Hr2WOIN1rrl
 susizhpDbas9WYmAQ5RdloR/kBUCZoH0aKm4Qu1FIWZVaqDSaTY3uQ/QKN4Th34qDSXy
 GtcvYj6pEgwqKXNXm5+keIUUd0JNxJtELBogQz72FTxOC9FQjibBT8E5TtUyAbVjOrtY
 OKQg==
X-Gm-Message-State: AO0yUKWF9RzkGgPAktQuqIblfBd2RtyuTPzHNHU7TzsnV3Y+AHI+ZUZ/
 sB2pNE1jbLe5Qq/Vw3advVbmVcg6JmmDimS2UaU=
X-Google-Smtp-Source: AK7set8Ywx0iAQrGoEEkgv3qLgP8YXwI3+TvqWY8ReSLX18XMQnjssyGUpWN7izePXDq8V+lj0t2lykY83BEM5yxFts=
X-Received: by 2002:a05:6402:d59:b0:4a0:90da:4653 with SMTP id
 ec25-20020a0564020d5900b004a090da4653mr814683edb.153.1674664006555; Wed, 25
 Jan 2023 08:26:46 -0800 (PST)
MIME-Version: 1.0
References: <20230124230048.371144-1-robh@kernel.org>
In-Reply-To: <20230124230048.371144-1-robh@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 25 Jan 2023 10:26:35 -0600
Message-ID: <CABb+yY3FwCwEsNYuNP8MBi+2TUra5O7+-GWMzWr06x1g4MJUyg@mail.gmail.com>
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
 linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 linux-spi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 openbmc@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 24, 2023 at 5:00 PM Rob Herring <robh@kernel.org> wrote:
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
For the mailbox change,
   Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
