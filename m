Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A2A53FB8C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 12:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B97111B502;
	Tue,  7 Jun 2022 10:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D728F11B502
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 10:41:40 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l2-20020a05600c4f0200b0039c55c50482so1454242wmq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 03:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qw8JacEfJNF9P2iNLjQzkAXW/8/vZkXuOjt3GnWBvjw=;
 b=hyDSvJIfh0LYoaLEeqkmPROm1N2u7R8cMpaut6DZYA8pNoxIG7jthQ5F82HOCMq2rG
 fYjscsLiZQgKk+uyZcbEemQ19fmtnvUYc1F4ZnC8f0xbYYmnoXgHcdlVqTkkiGAZFBqw
 9s6rtFDUlnRG2c31zUx4ljO2jYpPUAnFu2CD7zbQdqqR7D+ujyFr+ex7gPKhkrnSR44Y
 KTeHSqWku7fvSZxcJb7rgNvOQP8DFieQ2czxXmC8Grj3rVCEqXal1Ce2ctYVkpSgaPKD
 4Q++EwprNd3zbAp7TC5+zWZnPLhJLp5WeJfaaKmzs3WBKvfUaGGXdb6qII//hNYJ6OuU
 10vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qw8JacEfJNF9P2iNLjQzkAXW/8/vZkXuOjt3GnWBvjw=;
 b=YaioaHOObYQHyxSJXYcwEzKWQ12PUGpGA6uMKkGFUfLCN/YisfRKDzZJ7awcpjZxwe
 WsqsG8xKwr21HXzX/3cIl0qFD39UO1NtxVs02N+mbTk7Y/47QM95hVoUOUl2lKUuB8sd
 nJMjUBAoCfkbNKu5kANHZfDmatGTykrlLAnQDNu42XMIIr+mLSLIyjmpi/KBKGxStld/
 a0KqhUfGtof+OhRzT4vmSbIVbdzoYVMt+hhjxgKgFH95uiplUY6RGYYjeWOesqAmJAZG
 ptr0JPUYEVScq9Yv/GFlitIbfw+Hf+EE61VgPcmd0IXElnQ1h7ak4nSL738i+E0UBroF
 5+kw==
X-Gm-Message-State: AOAM5303I2v0ewh4AUNVtaq4TVrS8k5HueGUDqBuL6xqpBfVv4zL6M6o
 rf0C0+MwifIx2EZuSjrMecLOrw==
X-Google-Smtp-Source: ABdhPJz0rzj4eqfRw2wspCI3jipVGst2fbnr65Qmu05TDb5e0ptD3uTC6nEhOxZyIE8KFnMOZnH58g==
X-Received: by 2002:a05:600c:3c8f:b0:39b:808c:b5cb with SMTP id
 bg15-20020a05600c3c8f00b0039b808cb5cbmr28760884wmb.11.1654598498995; 
 Tue, 07 Jun 2022 03:41:38 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 n22-20020a05600c3b9600b00397342e3830sm27940708wms.0.2022.06.07.03.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 03:41:38 -0700 (PDT)
Date: Tue, 7 Jun 2022 11:41:36 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [RESEND 14/14] video: backlight: mt6370: Add Mediatek MT6370
 support
Message-ID: <20220607104136.cfnpwo6ajqiuafbf@maple.lan>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-15-peterwu.pub@gmail.com>
 <20220601094623.jnwh2fgsqepy72tc@maple.lan>
 <CABtFH5+-o=cML_VCSY9frJwEU_TnZt0+myJebi8J7BpP+BOqOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABtFH5+-o=cML_VCSY9frJwEU_TnZt0+myJebi8J7BpP+BOqOw@mail.gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, ChiYuan Huang <cy_huang@richtek.com>, pavel@ucw.cz,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, deller@gmx.de,
 robh+dt@kernel.org, chunfeng.yun@mediatek.com, linux@roeck-us.net,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 chiaen_wu@richtek.com, gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 03, 2022 at 03:14:56AM +0800, ChiaEn Wu wrote:
> Daniel Thompson <daniel.thompson@linaro.org> 於 2022年6月1日 週三 下午5:46寫道：
> >
> > On Tue, May 31, 2022 at 07:19:00PM +0800, ChiaEn Wu wrote:
> > > +#define MT6370_DT_PROP_DECL(_name, _type, _reg, _mask, _max, _inv)   \
> > > +{                                                                    \
> > > +     .name = "mediatek,bled-" #_name,                                \
> >
> > I'd rather have the whole DT property in the macro (because it helps
> > with grepability).
> 
> Do you mean the _name parameter must be the full name of the DT
> property and do not use "#" to concat like following example?
> 
> // in declare
>             .name = _name,
> // in use
>             MT6370_DT_PROP_DECL(mediatek,bled-pwm-enable, ......)

Yes, I would prefer this form, although, as discussed below, I don't really
like MT6370_DT_PROP_DECL().


> > > +     .type = MT6370_PARSE_TYPE_##_type,                              \
> > > +     .reg = _reg,                                                    \
> > > +     .mask = _mask,                                                  \
> > > +     .max_val = _max,                                                \
> > > +     .invert = _inv,                                                 \
> > > +}
> > > +
> > > +static int mt6370_init_backlight_properties(struct mt6370_priv *priv,
> > > +                                         struct backlight_properties *props)
> > > +{
> > > +     struct device *dev = priv->dev;
> > > +     u8 prop_val;
> > > +     u32 brightness;
> > > +     unsigned int mask, val;
> > > +     static const struct {
> > > +             char *name;
> > > +             enum mt6370_prop_type type;
> > > +             unsigned int reg;
> > > +             unsigned int mask;
> > > +             u8 max_val;
> > > +             bool invert;
> > > +     } vendor_opt_props[] = {
> > > +             MT6370_DT_PROP_DECL(pwm-enable, BOOL, MT6370_REG_BL_PWM,
> > > +                                 MT6370_BL_PWM_EN_MASK, 1, false),
> > > +             MT6370_DT_PROP_DECL(pwm-hys-enable, BOOL, MT6370_REG_BL_PWM,
> > > +                                 MT6370_BL_PWM_HYS_EN_MASK, 1, false),
> > > +             MT6370_DT_PROP_DECL(pwm-hys-sel, U8, MT6370_REG_BL_PWM,
> > > +                                 MT6370_BL_PWM_HYS_SEL_MASK, 3, false),
> > > +             MT6370_DT_PROP_DECL(ovp-level-sel, U8, MT6370_REG_BL_BSTCTRL,
> > > +                                 MT6370_BL_OVP_SEL_MASK, 3, false),
> > > +             MT6370_DT_PROP_DECL(ovp-shutdown, BOOL, MT6370_REG_BL_BSTCTRL,
> > > +                                 MT6370_BL_OVP_EN_MASK, 1, true),
> > > +             MT6370_DT_PROP_DECL(ocp-level-sel, U8, MT6370_REG_BL_BSTCTRL,
> > > +                                 MT6370_BL_OC_SEL_MASK, 3, false),
> > > +             MT6370_DT_PROP_DECL(ocp-shutdown, BOOL, MT6370_REG_BL_BSTCTRL,
> > > +                                 MT6370_BL_OC_EN_MASK, 1, true),
> > > +     }, *prop_now;
> > > +     int i, ret;
> > > +
> > > +     /* vendor optional properties */
> > > +     for (i = 0; i < ARRAY_SIZE(vendor_opt_props); i++) {
> > > +             prop_now = vendor_opt_props + i;
> > > +
> > > +             switch (prop_now->type) {
> > > +             case MT6370_PARSE_TYPE_BOOL:
> > > +                     if (device_property_read_bool(dev, prop_now->name))
> > > +                             val = 1;
> > > +                     else
> > > +                             val = 0;
> > > +                     break;
> > > +             case MT6370_PARSE_TYPE_U8:
> > > +                     ret = device_property_read_u8(dev, prop_now->name,
> > > +                                                   &prop_val);
> > > +                     /* Property not exist, keep value in default */
> > > +                     if (ret)
> > > +                             continue;
> > > +
> > > +                     val = min_t(u8, prop_val, prop_now->max_val);
> > > +                     break;
> > > +             default:
> > > +                     return -EINVAL;
> > > +             }
> > > +
> > > +             if (prop_now->invert)
> > > +                     val = prop_now->max_val - val;
> > > +
> > > +             val <<= ffs(prop_now->mask) - 1;
> > > +
> > > +             ret = regmap_update_bits(priv->regmap, prop_now->reg,
> > > +                                      prop_now->mask, val);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> >
> > Is it really worth all this tricky code for 7 properties?
> >
> > The code would be much easier to read and maintain if it were coded
> > directly. For example, the inverted boolean code is hard to read and
> > can be written directly as:
> >
> >
> >         val = device_property_read_bool(dev, "mediatek,bled-ovp_shutdown");
> >         ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_BST_CTRL,
> >                                  MT6370_BL_OVP_EN_MASK,
> >                                  MT6370_BL_OVP_EN_MASK * !val);
> >         if (ret)
> >                 return ret;
> >
> > The direct coded approach will probably also pay off if you switch
> > the bindings over to microvolts/microamps since it becomes much more
> > natural to call out to a lookup function to convert it into a register
> > value.
> >
> 
> The purpose of my code is trying to avoid the repeat code in this
> function. And for loop can help to decrease the lines of code
> effectively, that's why I use these code to parse the DT properties.

I'm not really convinced that is uses fewer lines of code. It
certainly would if there were a very large number of properties
but here there is only seven.

However I guess what I'm really complaining about is how hard it is to
read the for loop. We have to study the macros, keep track six different
arguments per property and review the complex logic of the for loop
(which for example handles inverted u8's that don't actually exist).

To be clear, it's not that loops aren't useful for reducing boilerplate
code. They can be. However trying to handle booleans and integers in the
*same* loop ends up needlessly hard to read.

Also, I think that if/when you adopt microamps/microvolts then the
hard-to-read problem will get even worse unless you get loops to do only
one thing!


Daniel.
