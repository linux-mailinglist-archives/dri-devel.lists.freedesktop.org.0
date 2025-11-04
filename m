Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2322DC30F81
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 13:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC6A10E3FA;
	Tue,  4 Nov 2025 12:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KNynVKa3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BAF10E25F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 12:24:13 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id
 a640c23a62f3a-b3c2c748bc8so696096066b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 04:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762259052; x=1762863852; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8w9oB3T8XUJgBGc+hBaim4B4JguaWQfKbWBDqClypRw=;
 b=KNynVKa3qEIrqKkcNqbwP1yc1n1sIWMWQOs5zQtnzMX1BKlUb2XHhzoSg7AGre+pho
 qRrdDwpKC1WHyz1fEEe1xzuCNgI5ryJVPcwpDGsf1VyaREpUiAABtGQKbK5aFMDg4gZ9
 6sBlYN0uF9BfOFxxiJnQ2uiUB9YegmkmS13zdt0lkrBgMQm8VdDM3kE7LrPA1cuhj7z1
 4P0ZpdkGi6QTEifIw72w4/72DYWGlC+lfQijrYzpHXv83vqihG9jg7HF2HwDmpFmalOw
 4L8Rp2W0twsONlDZp28JuwfilJ1Womgh3FrkItP9ClKW+XdasCOCYS1ebl4UNfe57AGY
 dq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762259052; x=1762863852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8w9oB3T8XUJgBGc+hBaim4B4JguaWQfKbWBDqClypRw=;
 b=wWPpSz4VC5ADgIy82JGnWLoJq0sdRhiEsRMWwcr+75A0WZAyn4hu689iOn/sCj0s1x
 QhJC9I4GufFd9dP/IR9KcIOnuWhMEhpnuzNhMkcmeLtKdoHJuLu6hqjyQPSStTO8S7xh
 c36PlgJFwm44yFc1lXzEvr7qxzyvBCZs5IMg0DGjAGuOIfOnKfChzvznyQaI1e1wkKXt
 hZJbWbqoXmZftb/0FtnPpbx1X2ouRUN0xhAYysLFCIR+Rilo+7ebLYouycnPjJyrQ4tL
 51SlVhB28QxLu1//KxRDQD1wjkwcluynuWB+zHY5ewKupzfMz2UE2Im0qo4iVltDZHi3
 oiqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUyJXx/Qd4pV1kvh6rm4P9LmUtUOSDJzjDN/mFfxUpNttSZPKGijK45VAByQjE4PsmFY/5LfyXbbU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygIgXoxsrzYTIOAFVWFdcouQlHYb0/c+Yufe6gLpJEMWbe1DRe
 CGnc526zioLA6rOtASpCG0P870nFSkkMUV56UJz30v+nkxS9c68vr4DJZ1VJAsfc5LFCPoNAlCt
 AcyvJ3JM4er456YlpfKTYSUY0JbUtXME=
X-Gm-Gg: ASbGncvXEGE9ROJJkConb/1q1jWAUkjPt4QcjtngWhNQ9DXSB4yvnWx9SE8K5W4nzBK
 WPVgoTVij4QjXOwBcTI3jDe8IeIxwxriOiXa4H786vL8+3NpfxVMAWduZiD59l1iWzDwRR+4T7+
 fooOLi/QtJg/N0QNkKNi6iC+UlolH76MFZT6g1Ny9LdkA5JvhpdIod+vQ7egN2ZF0hjU7xVNs5H
 uqM8FhKK+H+PTPjXMMX19jlgXoJ+EFV7AXBkAFMDVguKRW35+El9H8LJ8S7
X-Google-Smtp-Source: AGHT+IG6ud+xpKAMBlMA5WdjCGVGxS6YVcNlLSwDSmnLLrN6CJtwEsTAMY7TqC8k7Rf1nkyRUDIwFwQ7kTSNndxnDeE=
X-Received: by 2002:a17:907:97c5:b0:b71:5079:9702 with SMTP id
 a640c23a62f3a-b715079aed8mr550597766b.21.1762259051951; Tue, 04 Nov 2025
 04:24:11 -0800 (PST)
MIME-Version: 1.0
References: <20251103110648.878325-1-caojunjie650@gmail.com>
 <20251103110648.878325-3-caojunjie650@gmail.com>
 <20251104-attractive-dragonfly-of-perspective-0d52d6@kuoka>
In-Reply-To: <20251104-attractive-dragonfly-of-perspective-0d52d6@kuoka>
From: Junjie Cao <caojunjie650@gmail.com>
Date: Tue, 4 Nov 2025 20:22:32 +0800
X-Gm-Features: AWmQ_blg6GhTdK5EC6AuU-36Dga5TQMKLH2FNjAQ7Rr6vjrvigIa3A71HhVneEs
Message-ID: <CAK6c68j2j536UEgq36RAuAv7HGW9VTUS-s32+1YDshqK+gTfzw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] backlight: aw99706: Add support for Awinic AW99706
 backlight
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
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

On Tue, Nov 4, 2025 at 3:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Mon, Nov 03, 2025 at 07:06:48PM +0800, Junjie Cao wrote:
> > +struct reg_init_data;
> > +
> > +struct aw99706_device {
> > +     struct i2c_client *client;
> > +     struct device *dev;
> > +     struct regmap *regmap;
> > +     struct backlight_device *bl_dev;
> > +     struct gpio_desc *hwen_gpio;
> > +     struct reg_init_data *init_tbl;
> > +     int init_tbl_size;
> > +     bool bl_enable;
> > +};
> > +
> > +enum reg_access {
> > +     REG_NONE_ACCESS =3D 0,
> > +     REG_RD_ACCESS   =3D 1,
> > +     REG_WR_ACCESS   =3D 2,
> > +};
> > +
> > +const u8 aw99706_regs[AW99706_REG_MAX + 1] =3D {
>
> Why isn't this static?
>

That was an oversight on my part. It will be static.

> > +     [AW99706_CFG0_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG1_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG2_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG3_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG4_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG5_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG6_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG7_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG8_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG9_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFGA_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFGB_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFGC_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFGD_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_FLAG_REG]              =3D REG_RD_ACCESS,
> > +     [AW99706_CHIPID_REG]            =3D REG_RD_ACCESS,
> > +     [AW99706_LED_OPEN_FLAG_REG]     =3D REG_RD_ACCESS,
> > +     [AW99706_LED_SHORT_FLAG_REG]    =3D REG_RD_ACCESS,
> > +
> > +     /*
> > +      * Write bit is dropped here, writing BIT(0) to MTPLDOSEL will un=
lock
> > +      * Multi-time Programmable (MTP).
> > +      */
> > +     [AW99706_MTPLDOSEL_REG]         =3D REG_RD_ACCESS,
> > +     [AW99706_MTPRUN_REG]            =3D REG_NONE_ACCESS,
> > +};
> > +
>
> ...
>
> > +     aw =3D devm_kzalloc(dev, sizeof(*aw), GFP_KERNEL);
> > +     if (!aw)
> > +             return -ENOMEM;
> > +
> > +     aw->client =3D client;
> > +     aw->dev =3D dev;
> > +     i2c_set_clientdata(client, aw);
> > +
> > +     aw->regmap =3D devm_regmap_init_i2c(client, &aw99706_regmap_confi=
g);
> > +     if (IS_ERR(aw->regmap))
> > +             return dev_err_probe(dev, PTR_ERR(aw->regmap),
> > +                                  "Failed to init regmap\n");
> > +
> > +     ret =3D aw99706_chip_id_read(aw);
> > +     if (ret !=3D AW99706_ID)
> > +             return dev_err_probe(dev, ret,
> > +                                  "Failed to validate chip id\n")
>
> Why are you exiting the probe with a positive value like 4 or 8? This
> makes no sense. Registers do not coontain Linux return codes.
>

Thanks for pointing this out. Using -ENODEV makes more sense. I will do
it in the next version.

Regards,
Junjie
