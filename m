Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDB6C2F5D0
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 06:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBF110E23C;
	Tue,  4 Nov 2025 05:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QRxLUtys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75D310E23C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 05:23:28 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id
 a640c23a62f3a-b3d196b7eeeso946973666b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 21:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762233807; x=1762838607; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A4RUZF6DeQxRbL7hk8aE8m25nMDIdsE4Fw4B+jDjdxs=;
 b=QRxLUtysr2BEnGHEzvj/8AxdZcS+qsW/r6bNeroS5XbPa5VcUed3UXiGUXb6e0E1Fd
 1P/1XdarFMO9zy0dawNFfKj4V/+KaCxEE5lSeN6ynh0WCWxqoC1lGZZ6iX6+ofVI18GU
 FXQZNts+MmhERSJtmmX/b071XKeVgHXglI3RbsOLGZqtntEH/ih2MvxRxW0C24/Xg6u6
 zQOJfbP/aMKOz+LutBWa0bQqx8ZpkkSKIZeo4gjeL+iyAyAH6HMGCxxAj9GrIJxXQvuz
 KsKr3xy5RBekN5s4r/hvHRWO4Tw0FUoDuuxLQZsYmh6+7czuPkMfPtaatT4XQeNpPwlG
 8a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762233807; x=1762838607;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A4RUZF6DeQxRbL7hk8aE8m25nMDIdsE4Fw4B+jDjdxs=;
 b=YWLMExldey6bj4m3NXdFNOwMQFSKg2aMdh9ysFavmnzWFYlMO1ed6nBL6wkweNrSNG
 VEP7XYI/VQ+zLxcmSuskbXc4H8WcebzJFs0R/4tYHdL8k+3qLFsA7X3XWd+tAoRgNrqi
 zAYgksP3gKNer1HJzV2eKyvCTfn744894yYb+EBQ+CWt3c8e0dSaKOB1h+jsONf4adsN
 yi9iKF9QudgNB8Tl1f2/ZBq0CPtfCUgKPJwwhLwZrPflNcs17pcpucgfMiSF6b7tel/2
 OOR5wLavHH5Vk5bxD20KPtua/AkPtvRmXW7rnw9+liJSbWXJikLC8aS+VHN0lHKJZb/U
 JouA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlrF4ycKU84GBgdHdaue5Xa996RV42qImXM1jLZr4aOPPyCw0w7ZHiygKa+25r7bHVfDma3erRQZw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8iXIUbndeYC1sceOd1IZbmcPuRrw0OnhxKbtUcrJ2kNn5g3/e
 I3HdOYNnpRae3+K3ThFb9fmSQkrhUU6siqCviENL3Xi1ukzh9+m2Wky92mrsGHfkjM+vDlU8WGH
 RWQSYMGW154JKoxcjC8r6WnxMzblkn8g=
X-Gm-Gg: ASbGncv2AgNWabIX1GMwIwtONs8qiGmGFHuQPHKGFHYcXIdL1hBwOU0YkL3VkPRzlLo
 O0AqWjVND8G9FFgdXgEzlqvfuRl3TK4OtVfLwgc09bsCN958Uhl1jrvdEwGLA5W/os0wZNR2Yoi
 1CU36HE1Ck+touyuNHw7bDsi3Bq4RHCkFwEO4zc/JSAgHvGzpcOyLX76fQMTUwDNQiiGA7kRiwZ
 dISW8D+gx1TzYEvbFRPnbpD/uPMXKujy55Nc0ntlQVy2GABpA0ZQVxxAywK
X-Google-Smtp-Source: AGHT+IE9GdvxzDs+AiWUrHrkWTw5ZWTLQAZJtdC7zFZ0vRv283/BNkkD0+50XIVUnPGg88dPjuz0BaVD627TibUqfoc=
X-Received: by 2002:a17:907:1c93:b0:b4e:fc90:47a8 with SMTP id
 a640c23a62f3a-b70700b5153mr1814180666b.4.1762233806865; Mon, 03 Nov 2025
 21:23:26 -0800 (PST)
MIME-Version: 1.0
References: <20251103110648.878325-1-caojunjie650@gmail.com>
 <20251103110648.878325-3-caojunjie650@gmail.com> <aQjY5_uEaTv4_L2s@aspen.lan>
In-Reply-To: <aQjY5_uEaTv4_L2s@aspen.lan>
From: Junjie Cao <caojunjie650@gmail.com>
Date: Tue, 4 Nov 2025 13:23:15 +0800
X-Gm-Features: AWmQ_bkg7-u1JQXWEtjUocJxGMuIfL8KF1cVsoKVcrovu50dF2JnvSEL5f1fIno
Message-ID: <CAK6c68gjzSytxwX5kUYLwbRceFgTHP-mynUSq1tNmUWD8n55Cg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] backlight: aw99706: Add support for Awinic AW99706
 backlight
To: Daniel Thompson <daniel@riscstar.com>
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

On Tue, Nov 4, 2025 at 12:30=E2=80=AFAM Daniel Thompson <daniel@riscstar.co=
m> wrote:
>
> On Mon, Nov 03, 2025 at 07:06:48PM +0800, Junjie Cao wrote:
> > From: Pengyu Luo <mitltlatltl@gmail.com>
> >
> > Add support for Awinic AW99706 backlight, which can be found in
> > tablet and notebook backlight, one case is the Lenovo Legion Y700
> > Gen4. This driver refers to the official datasheets and android
> > driver, they can be found in [1].
> >
> > [1] https://www.awinic.com/en/productDetail/AW99706QNR
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> > ---
> > Changes in v2:
> > - add handler for max-brightness and default-brightness
> > - use proper units for properties (Krzysztof)
> > - drop non-fixed properties (Krzysztof)
> > - include default values in the aw99706_dt_props table (Daniel)
> > - warn when a property value from DT is invalid (Daniel)
> > - drop warning when optional properties are missing (Daniel)
> > - add a function pointer into the aw99706_dt_props table to handle look=
up (Daniel)
> > - use a lookup function instead of hardcoding the formula for the iLED =
max (Daniel)
> > - move BL enalbe handler into aw99706_update_brightness (Daniel)
> > - Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727=
-3-caojunjie650@gmail.com
>
> Thanks for the changes.
>
> I'm afraid I don't like encoding the `shift` in the DT properties table.
> Caching something that is so easy to recalculate makes no sense to me.
> See below:
>
>
> > +struct aw99706_dt_prop {
> > +     const char * const name;
> > +     int (*lookup)(const struct aw99706_dt_prop *prop, u32 dt_val, u8 =
*val);
> > +     const u32 * const lookup_tbl;
> > +     u8 tbl_size;
> > +     u8 reg;
> > +     u8 mask;
> > +     u8 shift;
>
> There should bee no need to record `shift` here. It's just a
> duplicating information already held in `mask`.
>
>
> > +     u32 def_val;
> > +};
> > +
> > +static int aw99706_dt_property_lookup(const struct aw99706_dt_prop *pr=
op,
> > +                                   u32 dt_val, u8 *val)
> > +{
> > +     int i;
> > +
> > +     if (!prop->lookup_tbl) {
> > +             *val =3D dt_val;
> > +             return 0;
> > +     }
> > +
> > +     for (i =3D 0; i < prop->tbl_size; i++)
> > +             if (prop->lookup_tbl[i] =3D=3D dt_val)
> > +                     break;
> > +
> > +     *val =3D i;
> > +
> > +     return i =3D=3D prop->tbl_size ? -1 : 0;
> > +}
> > +
> > +#define MIN_ILED_MAX 5000
> > +#define MAX_ILED_MAX 50000
> > +#define STEP_ILED_MAX        500
> > +
> > +static int
> > +aw99706_dt_property_iled_max_convert(const struct aw99706_dt_prop *pro=
p,
> > +                                  u32 dt_val, u8 *val)
> > +{
> > +     if (dt_val > MAX_ILED_MAX || dt_val < MIN_ILED_MAX)
> > +             return -1;
> > +
> > +     *val =3D (dt_val - MIN_ILED_MAX) / STEP_ILED_MAX;
> > +
> > +     return (dt_val - MIN_ILED_MAX) % STEP_ILED_MAX;
> > +}
> > +
> > +static const struct aw99706_dt_prop aw99706_dt_props[] =3D {
> > +     {
> > +             "awinic,dim-mode", aw99706_dt_property_lookup,
> > +             NULL, 0,
> > +             AW99706_CFG0_REG,
> > +             AW99706_DIM_MODE_MASK, __builtin_ctz(AW99706_DIM_MODE_MAS=
K),
>
> These __builtin_ctz() calls shouldn't be in the lookup table (if they
> are not in the lookup table then can never be inconsistant with the
> mask).
>
>
> > +             1,
> > +     },
> <snip>
> > +     {
> > +             "awinic,ramp-ctl", aw99706_dt_property_lookup,
> > +             NULL, 0,
> > +             AW99706_CFG6_REG,
> > +             AW99706_RAMP_CTL_MASK, __builtin_ctz(AW99706_RAMP_CTL_MAS=
K),
> > +             2,
> > +     },
> > +};
> > +
> > +struct reg_init_data {
> > +     u8 reg;
> > +     u8 mask;
> > +     u8 val;
> > +};
> > +
> > +static struct reg_init_data reg_init_tbl[ARRAY_SIZE(aw99706_dt_props)]=
;
> > +
> > +static void aw99706_dt_parse(struct aw99706_device *aw,
> > +                          struct backlight_properties *bl_props)
> > +{
> > +     const struct aw99706_dt_prop *prop;
> > +     u32 dt_val;
> > +     int ret, i;
> > +     u8 val;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(aw99706_dt_props); i++) {
> > +             prop =3D &aw99706_dt_props[i];
> > +             ret =3D device_property_read_u32(aw->dev, prop->name, &dt=
_val);
> > +             if (ret < 0)
> > +                     dt_val =3D prop->def_val;
> > +
> > +             if (prop->lookup(prop, dt_val, &val)) {
> > +                     dev_warn(aw->dev, "invalid value %d for property =
%s, using default value %d\n",
> > +                              dt_val, prop->name, prop->def_val);
> > +
> > +                     prop->lookup(prop, prop->def_val, &val);
> > +             }
> > +
> > +             reg_init_tbl[i].reg =3D prop->reg;
> > +             reg_init_tbl[i].mask =3D prop->mask;
> > +             reg_init_tbl[i].val =3D val << prop->shift;
>
> Can't you just use FIELD_PREP() to set val (either here or at the point
> the init table is consumed)? That why there's no ffs() or clz() at all.
>

Thanks for it, I tried to find something like FIELD_PREP() to avoid
keeping shift, but I failed to notice it in the bitfield.h. I will drop
the shift field and use it to handle bit operations gracefully.

>
> > +     }
> > +
> > +     aw->init_tbl =3D reg_init_tbl;
> > +     aw->init_tbl_size =3D ARRAY_SIZE(reg_init_tbl);
>
> Copying a pointer to a single instance static data buffer into a
> dynamically allocated data structure isn't right.
>
> You should include the init table as part of `struct aw99706_device`.
>

I see. Multiple instances should be taken into account.

>
> > +
> > +     bl_props->brightness =3D AW99706_MAX_BRT_LVL >> 1;
> > +     bl_props->max_brightness =3D AW99706_MAX_BRT_LVL;
> > +     device_property_read_u32(aw->dev, "default-brightness",
> > +                              &bl_props->brightness);
> > +     device_property_read_u32(aw->dev, "max-brightness",
> > +                              &bl_props->max_brightness);
> > +
> > +     if (bl_props->max_brightness > AW99706_MAX_BRT_LVL)
> > +             bl_props->max_brightness =3D AW99706_MAX_BRT_LVL;
> > +
> > +     if (bl_props->brightness > bl_props->max_brightness)
> > +             bl_props->brightness =3D bl_props->max_brightness;
> > +}
> > +
> > +static int aw99706_hw_init(struct aw99706_device *aw)
> > +{
> > +     int ret, i;
> > +
> > +     gpiod_set_value_cansleep(aw->hwen_gpio, 1);
> > +
> > +     for (i =3D 0; i < aw->init_tbl_size; i++) {
> > +             ret =3D aw99706_i2c_update_bits(aw, aw->init_tbl[i].reg,
> > +                                           aw->init_tbl[i].mask,
> > +                                           aw->init_tbl[i].val);
> > +             if (ret < 0) {
> > +                     dev_err(aw->dev, "Failed to write init data %d\n"=
, ret);
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int aw99706_bl_enable(struct aw99706_device *aw, bool en)
> > +{
> > +     int ret;
> > +     u8 val;
> > +
> > +     FIELD_MODIFY(AW99706_BACKLIGHT_EN_MASK, &val, en);
>
> This should use FIELD_PREP() not FIELD_MODIFY();
>

ACK. FIELD_PREP() makes more sense here.

Regards,
Junjie
