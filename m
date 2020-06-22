Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761982034F7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 12:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31556E267;
	Mon, 22 Jun 2020 10:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0AB6E267
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 10:39:43 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id v3so8652656wrc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 03:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ppPSmD0W4LKyxlniJhYfTmLmk2R68Qbvb6wTB52e/f0=;
 b=ItMGHHfBn6t+/6rQdOvInje8umTE9Lh/8MQrHN1kBQmODoVSN1eOFW8HFLDcqWjRfz
 iW7RlpQQYT2m0DQT2L8tJ3Gbnm4FrrA0hZNu5go4Lzxd+kPhaBqaTFY0IdbGKfCHN12r
 YP6adtx7pTBj07Wd8/4VSZJYaO0d+iQIEliTdTqNbuLF6u1CILqsrtIFVQrBPp+mQWnZ
 77UOT6MgZnEhhklMWr44xbkquBvDL8ge3ILunTUUmfMpAACxHi/NSbC/poDK3u/A/9pa
 Bre5+xqACXaastiIzh4nSPQCMcFTumjfW7jnpw3XlMI2+YyVlzQ0krOo7HPcjQQ3bIh9
 S48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ppPSmD0W4LKyxlniJhYfTmLmk2R68Qbvb6wTB52e/f0=;
 b=V4Vbnverp2cDh9BTFLxqpc1SKspR14MFfYabPbRAP+oKvNprT0jpcQ3VSHouxMrhSA
 RkjDvDmaK0r6hZaYfz9X7GWoc1eY1w6tcrx+1ZhLg6MWqdgoKk5HriysrpoQIgeJ7xfa
 Yl1O2KHy48YPjamvXuDOOW4V3sjwPWjv0G0B2HwkeQ/yIUnb01MI+qTJndRIW5kZ1c9x
 iDd4Hbqptx8nbb+Jb95cSr+/PggUoZJcsWcSrPyJaxHKXkMgd2oAZWbuthuiZ5Klc+/+
 hSNx7wZUWQHaQWau9FQl6ioT51h0M6/OpwWBU05TS+iAqdBQl5g7kDf4fDx+KSqD/Mb0
 MHAg==
X-Gm-Message-State: AOAM531yb0yQ8xJpMqpNOQqiorndnZYFYFlRMnt83DYMirTU8Vk5vkYV
 OH4//R9WCFLLKzHwxDCWeXgi85PVy68=
X-Google-Smtp-Source: ABdhPJzfjcLOl+6WBhcjg432De4rDwDj114xV3ZgmqkPIv2TBXFQeD+Fz+W7XZC3xVDWGcr5fxtuTQ==
X-Received: by 2002:adf:ef4d:: with SMTP id c13mr6752284wrp.315.1592822382351; 
 Mon, 22 Jun 2020 03:39:42 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id e12sm17422241wro.52.2020.06.22.03.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 03:39:41 -0700 (PDT)
Date: Mon, 22 Jun 2020 11:39:39 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] dt-bindings: backlight: Convert common backlight
 bindings to DT schema
Message-ID: <20200622103939.goqysclrsxps344i@holly.lan>
References: <20200618224413.1115849-1-robh@kernel.org>
 <20200619215341.GA6857@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200619215341.GA6857@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 19, 2020 at 11:53:41PM +0200, Sam Ravnborg wrote:
> Good to have these converted. A few comments in the following. One
> comment is for the backlight people as you copied the original text.

... and I've sliced out everything except that in this reply.

> On Thu, Jun 18, 2020 at 04:44:13PM -0600, Rob Herring wrote:
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> > new file mode 100644
> > index 000000000000..ae50945d2798
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> > @@ -0,0 +1,58 @@
> > ...
> > +
> > +  default-brightness-level:
> > +    description: The default brightness level (index into the array defined
> > +      by the "brightness-levels" property).
>
> This description does not match my understading.
> The description says "index into", but in reality this is a value that
> matches somewhere in the range specified by brightness-levels.
> So it is not an index.
> 
> Maybe I just read it wrong and the description is fine. But when I read
> index the when it says 6 I would look for brightness-levels[6] equals
> 128 in the example below.

When the brightness-levels array is not present then backlight
brightness and led brightness have a 1:1 mapping. In this case the
meaning of "default brightness level" is (hopefully) obvious and the
parenthetic text does not apply.

When the array is present then we have two different scales of
brightness and it is important to describe which scale we use for the
default brightness. The language about "index into" was adopted to avoid
having to introduce extra terminology whilst making it clear that
setting the default brightness-level to 128 is invalid (because it is
not an acceptable index) and that a value of 6 will result in the LED
brightness being set to 128.


> And this is not how it is coded.

That had me worried for a moment but I think the code and bindings are
in agreement.

There is some code to map the LED scale (128) to the backlight scale (6)
but this used to ensure we supply the correct brightness level to user
space when an active backlight is handed over from bootloader to kernel.

If a default-brightness-level is provided then the above logic is
overridden and the value read from the DT gets placed directly into
props.brightness where it will act as in index into the brightness
table.


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
