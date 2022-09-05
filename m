Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BDF5AD0B4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEBF10E2D6;
	Mon,  5 Sep 2022 10:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8AD10E2D3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:55:12 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id c9so6066112qkk.6
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 03:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=u5wXdybY4V4FdQrWKDhVN8YtAVKPzLButJ1sTRP8l1Y=;
 b=fN9ls9YPkyuUBAxr4wBmegmBCd5C9P/xaFPwXqy2FgkVzhIWNFNVR0bIehn1eXCf3d
 zobAQyMxj0Z6zjuSqQChSLqXx/lGBZnOoXZuh0swZ9USSGOks25+oXU6FAesXBD3v2DQ
 L68l4C/DyY0LtBFJIREWTz0QAYiKWOW4FJBp9fKNmjWxzb09XWs8F+aM06q4SUWIESBO
 xHTM6IpS/sM1qQMre3AApRlHWbfBdhbDuAOnnGrdzMosW5f0QYLusQvgZq38fCbtCj8+
 st+OCZ16eP1EI4yU9tRWvtbyzF+xtAD5mGA4eMQrLw3MtKQV7zXu1TtVJ7pKICr8G27y
 D+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=u5wXdybY4V4FdQrWKDhVN8YtAVKPzLButJ1sTRP8l1Y=;
 b=lKbQLOOYkBD9c8y9R0PTBgq/3K/eiOqC7AkV1S2wTq3L1OU845dDwtm6FST1YOLhjl
 CYIp7NBZmCwdO60q9pcJp8xhn705ZzBQjsy4OHSHzhgnKTGETrbWnLdCZYDqm9Igb9OO
 7tgB9MzeYlL9PZiWdp2/SenD0OxBOWSwBF5hPyUDWG6t8MXN8fdJBVVzFIZ8voH4zO9j
 WF4ndsYXgBHAduoyMqjHFyX+2HuubOMou6qlbHY7M4f6BbAMJkZ/0hRTQZy/WEx8Ljg2
 pfX1xu2iJr1UKuo/v3oONF9pK83sx1p6m7SsbTPxX0QlI7RiCx1qLcnUx65vI+X5mUx0
 tovQ==
X-Gm-Message-State: ACgBeo30DE59gYWBjCD4yjTk1YfX6i7yk/w7whPrp0LgzYhnTnfWUMEB
 oA+U7f8ywKMy1vqOXK0deI4y++lPa8G+X2wlWjI=
X-Google-Smtp-Source: AA6agR4kYjGXWf3gIvqIWbBUJGizexBviWISl//lL9gbx6ZDHQvEVsxtbzoy40VfO0zOsVmlCvX9hRiizwzJ1xcnYOU=
X-Received: by 2002:a05:620a:2987:b0:6ba:dc04:11ae with SMTP id
 r7-20020a05620a298700b006badc0411aemr31582222qkp.748.1662375311598; Mon, 05
 Sep 2022 03:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
 <20220905071902.fv4uozrsttk3mosu@pali>
 <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
 <20220905105341.z2pjlpljitws3j6l@pali>
In-Reply-To: <20220905105341.z2pjlpljitws3j6l@pali>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:54:35 +0300
Message-ID: <CAHp75VedhWXbEG6kpObbpnyPE3M3dCM7nEyupJr+rwKj0kVC8w@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] PCI: tegra: switch to using devm_fwnode_gpiod_get
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 USB <linux-usb@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 David Airlie <airlied@linux.ie>, linux-pci <linux-pci@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 5, 2022 at 1:53 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:
> On Monday 05 September 2022 13:49:21 Andy Shevchenko wrote:

...

> > It's not the same dev and its node in this case. There is one reset
> > for _all_ ports, here is the reset on _per port_ basis.
>
> aardvark is single port controller. So it is basically same.

Yep, just replied to my message.

--=20
With Best Regards,
Andy Shevchenko
