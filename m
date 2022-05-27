Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65C3535EBD
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 12:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03EC10EDB9;
	Fri, 27 May 2022 10:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BDB10EDB9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 10:56:11 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e2so5424659wrc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 03:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jrGgy+PH692lFsYF+dtk7dWio1nqD2I64lL7+wih4a8=;
 b=dQx4ferhWG44Xidn1n3UXaPwXV1KQVTCRSqgo0w8ELub1AkvMVX5/sRdkmO8ll4Zk3
 2v2PAzhmidtq0rPpqmDFMVImttdAqw0LCrUsnUjRg6+TQ4ewZ8mo8kf13oO5kYzr+Y7C
 G316PQHNrGhLNoxEf5ytwoBjH58Aakl6bYJb1i9T0KD0R6nvAygYc435xX6d2GLtJVXB
 BlfiQyEUXPaQW+4LVfQbk0raKU4G9lIfa/mQ03fIJUQ4jlooeuRj1C0DUesiFQdYPQOn
 7gBzBMLVG4ey+Y2HFPs+TEP4c5xMyeb8EFvsv/5qGP6Y1ra/xldI/YhZd5PiZYVKJreT
 9HwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jrGgy+PH692lFsYF+dtk7dWio1nqD2I64lL7+wih4a8=;
 b=dKmQ6X8wrWu1NTwTElexLMj7rgj/DVtBOF/mjHhENGTPmoBEZIjDCRrO3Bh72Zd9Ym
 vZeVztGzkQQe8qSM7PTThSG+VefevvOnkwhVDk0kvwuexghAyZ29ZVLX/6Lzqx/iCjzy
 vI1QQWn6A7neU7AhoQqDyU5D/l0Jt6eH8dfIqAEkAvtKn7c/Lgzshc8KNn/41U27uL/s
 EF9owVRtdxuxzuz1Ln3UXrXCwh25Uli/9jbg4tFHyS5WQBkJwzdK8p0VvRLKCCegfkC7
 aLv1NoYEkYIf1uUK5DIDL5Uq+RqaS8ZbyajZesozpIvrHrLVWFQrZ9H/f1z5tttSwR1C
 L7aQ==
X-Gm-Message-State: AOAM530r5xTCEX/eHVARi8SOarTKS74ZaeRC8xZQBHGePNzygd3L3LOx
 CTRyBjn8UVjBgcdIIy4lxHll5g==
X-Google-Smtp-Source: ABdhPJwOt3C8JBzWvWP9ZBSLuDdffF2lB32gd6PKxfF9FArTmlC1qflYGl5xnT+8PL6XweEjZG5ZcQ==
X-Received: by 2002:adf:ed0c:0:b0:210:e82:898 with SMTP id
 a12-20020adfed0c000000b002100e820898mr5148595wro.399.1653648969762; 
 Fri, 27 May 2022 03:56:09 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 v18-20020adfebd2000000b0020c5253d8besm1451810wrn.10.2022.05.27.03.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 03:56:09 -0700 (PDT)
Date: Fri, 27 May 2022 11:56:07 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ChiYuan Huang <u0084500@gmail.com>
Subject: Re: [PATCH 2/2] backlight: rt4831: Add the property parsing for ocp
 level selection
Message-ID: <20220527105607.gk5ge77byuojxkkc@maple.lan>
References: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
 <1653534995-30794-3-git-send-email-u0084500@gmail.com>
 <20220526100510.3utwh5bov4ax2jmg@maple.lan>
 <CADiBU3_3rJ6uCYx_W+TZJpuPzGtt61QEDwZWtxy_abzynTr8VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADiBU3_3rJ6uCYx_W+TZJpuPzGtt61QEDwZWtxy_abzynTr8VQ@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 lucas_tsai@richtek.com, jingoohan1@gmail.com, deller@gmx.de,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 cy_huang <cy_huang@richtek.com>, Rob Herring <robh+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 27, 2022 at 10:24:42AM +0800, ChiYuan Huang wrote:
> Daniel Thompson <daniel.thompson@linaro.org> 於 2022年5月26日 週四 下午6:05寫道：
> >
> > On Thu, May 26, 2022 at 11:16:35AM +0800, cy_huang wrote:
> > > From: ChiYuan Huang <cy_huang@richtek.com>
> > >
> > > Add the property parsing for ocp level selection.
> >
> > Isn't this just restating the Subject: line?
> >
> Ah, that's my fault. I didn't state too much in the patch comment.
> I only left it in the cover letter.
> 
> > It would be better to provide information useful to the reviewer here.
> > Something like:
> >
> > "Currently this driver simply inherits whatever over-current protection
> > level is programmed into the hardware when it is handed over. Typically
> > this will be the reset value, <whatever>A, although the bootloader could
> > have established a different value.
> >
> > Allow the correct OCP value to be provided by the DT."
> >
> > BTW please don't uncritically copy the above into the patch header. It is
> > just made something up as an example and I did no fact checking...
> >
> OK, got it.
> >
> > >
> > > Reported-by: Lucas Tsai <lucas_tsai@richtek.com>
> > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > ---
> > >  drivers/video/backlight/rt4831-backlight.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video/backlight/rt4831-backlight.c
> > > index 42155c7..c81f7d9 100644
> > > --- a/drivers/video/backlight/rt4831-backlight.c
> > > +++ b/drivers/video/backlight/rt4831-backlight.c
> > > @@ -12,6 +12,7 @@
> > >  #define RT4831_REG_BLCFG     0x02
> > >  #define RT4831_REG_BLDIML    0x04
> > >  #define RT4831_REG_ENABLE    0x08
> > > +#define RT4831_REG_BLOPT2    0x11
> > >
> > >  #define RT4831_BLMAX_BRIGHTNESS      2048
> > >
> > > @@ -23,6 +24,8 @@
> > >  #define RT4831_BLDIML_MASK   GENMASK(2, 0)
> > >  #define RT4831_BLDIMH_MASK   GENMASK(10, 3)
> > >  #define RT4831_BLDIMH_SHIFT  3
> > > +#define RT4831_BLOCP_MASK    GENMASK(1, 0)
> > > +#define RT4831_BLOCP_SHIFT   0
> > >
> > >  struct rt4831_priv {
> > >       struct device *dev;
> > > @@ -120,6 +123,16 @@ static int rt4831_parse_backlight_properties(struct rt4831_priv *priv,
> > >       if (ret)
> > >               return ret;
> > >
> > > +     ret = device_property_read_u8(dev, "richtek,bled-ocp-sel", &propval);
> > > +     if (ret)
> > > +             propval = RT4831_BLOCPLVL_1P2A;
> >
> > Is 1.2A the reset value for the register?
> Yes, it's the HW default value.
> >
> > Additionally, it looks like adding a hard-coded default would cause
> > problems for existing platforms where the bootloader doesn't use
> > richtek,bled-ocp-sel and pre-configures a different value itself.
> >
> > Would it be safer (in terms of working nicely with older bootloaders)
> > to only write to the RT4831_BLOCP_MASK if the new property is set?
> >
> Ah, my excuse. I really didn't consider the case that you mentioned.
> It seems it's better to do the judgement here for two cases.
> 1) property not exist, keep the current HW value
> 2) property exist, clamp align and update the suitable selector to HW.

Ok, great.

When you make this change can you make sure there is a comment in the
source code explaining that concerns about older firmware is *why* we
treat bled-ocp-sel differently to bled-ovp-sel!


Thanks

Daniel.
