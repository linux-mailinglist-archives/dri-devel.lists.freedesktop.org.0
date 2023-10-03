Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2824F7B6649
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 12:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C5610E029;
	Tue,  3 Oct 2023 10:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9B210E029
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 10:21:42 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5347e657a11so1140398a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Oct 2023 03:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696328500; x=1696933300; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3jFoBRsAsX+9pzgvJlYVzP8D3RlTxpihzcYJJnubu1s=;
 b=fxC5jLidxxmsnK76TlJvn9TaFu2iLt03B6/OyQLgMxnCHofWOfkcE5ou3JKEu0SEcM
 ufeGLj6WXUMBqPHGTaG4c8etYJF2zDDqyfoPTvW0IcpnkDIK0cSbD2WSlM2ABJpGXy3f
 O51BYNiGbYUHeE6EegUSRyASqnhYfglM+0ifgu+EyDdlbglrX++qAB22jsS+bKRWqsQX
 ccV6CKljTR0HPwNTsQNSEhrUG+4XajlLgel5/wi0fkvlJRw+lAQJpNFIbN30cGiEWQwY
 8njHDBTbnKkj2yLk+fcZH5jwQkO3mElpZxzQmF9vj0FZsXc3QQAhY3aOlPRN0zWy5exa
 kjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696328500; x=1696933300;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3jFoBRsAsX+9pzgvJlYVzP8D3RlTxpihzcYJJnubu1s=;
 b=S5P/81sTzJPDYsefFclZZgXCkI/KojJijwakOI05EozcsWzZjFRY+kZC3wgwoYizo6
 S0s0miPEj+n6uvdQy7THS+0QrGoP1DZyXDF1QaWTgQEcv5/ZdVNIfuE0BCzc2tGrvbTo
 q8atlyZH2OvPVaR0KOVfduZIXnyjUhTtvXedrCCEf+koKSu/P4OlcWa/BrDCEGbKXZ+H
 J4H5nPtm8t20XEs/E30e0fkcz04OPGClR+JSc+CnfYx8siyvnz++2dzfZzj18iDVAZuP
 zdcRbr/KcB+XRsenZRfV94As47WZuBMhgCD4YHDUKZ5rKEgiuer4runNG50RzBWk7bT/
 ehrg==
X-Gm-Message-State: AOJu0YwrNGzQ/uI2jEC0+MxkdXl15b27aKy4m8B/9NrBGm5uOxys7DhQ
 bc2bBZ1cPX5s4uHgXy/nlLxA6Q==
X-Google-Smtp-Source: AGHT+IHTcqJckHVsJbxnb9Sl3c/bR2cdIpee7R+c6MfswLdRVMjNSrqe763xeTUxfrRHOZM0HyjPqA==
X-Received: by 2002:a17:906:292a:b0:9a5:c9a8:1816 with SMTP id
 v10-20020a170906292a00b009a5c9a81816mr3541714ejd.58.1696328500554; 
 Tue, 03 Oct 2023 03:21:40 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 bv2-20020a170906b1c200b0098e78ff1a87sm802599ejb.120.2023.10.03.03.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 03:21:40 -0700 (PDT)
Date: Tue, 3 Oct 2023 11:21:38 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: Add MPS MP3309C
Message-ID: <20231003102138.GB69443@aspen.lan>
References: <20230925122609.78849-1-f.suligoi@asem.it>
 <20230926130113.GB4356@aspen.lan>
 <DU2PR01MB8034F448F6E66BAC3823CDB1F9C4A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR01MB8034F448F6E66BAC3823CDB1F9C4A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 09:43:15AM +0000, Flavio Suligoi wrote:
> Hi Daniel,
>
> ...
>
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - max-brightness
> >
> > Why is this mandatory?
> >
> > There's no point in setting max-brightness when running in I2C mode (max-
> > brightness should default to 31 in that case).
> >
> >
> > > +  - default-brightness
> >
> > Again. I'm not clear why this needs to be mandatory.
> >
> >
>
> Ok, you are right, I'll remove max-brightness and default-brightness
> from required properties list. I think to change these properties,
> for the pwm dimming, into a clearer:
>
> - brightness-levels (uint32)
> - default-brightness-levels (uint32).
>
> For example:
>
>   brightness-levels:
>     description:
>       Number of brightness levels. The actual brightness
>       level (PWM duty cycle) will be interpolated from 0 to this value.
>       0 means a  0% duty cycle (darkest/off), while the brightness-levels represents
>       a 100% duty cycle (brightest).
>     $ref: /schemas/types.yaml#/definitions/uint32
>
>   default-brightness-level:
>     description:
>       The default brightness level (from 0 to brightness-levels)
>     $ref: /schemas/types.yaml#/definitions/uint32
>
> Example:
> brightness-levels = <10>;
> default-brightness-level = <6>;
>
> What do you think about this solution?

If you want to introduce a brightness-levels property then I would
expect it to be defined with the same meaning as pwm-backlight (it's not
relevant to the bindings but ideally it would be implemented by
refactoring and reusing the code from pwm_bl.c).

Same with default-brightness-level although I'm not sure why one
wouldn't just use default-brightness for new bindings (doesn't
default-brightness-level simply do exactly the same thing as
default-brightness).


Daniel.
