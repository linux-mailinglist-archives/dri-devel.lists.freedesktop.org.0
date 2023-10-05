Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7157B9D1C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 14:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507B710E1E6;
	Thu,  5 Oct 2023 12:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1317D10E1E6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 12:58:29 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-534659061afso1534420a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 05:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696510707; x=1697115507; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=54uUEylq3LVuurRVtb2mIY1GDBu2n1bSehibVDW31Ek=;
 b=abdodf4gb17U0btLpdOOEZuNf5WXajRGd5FGPXWOY3BcSKy4GaK1Sexom+GODaAmA4
 iO8K9rG0CVeoDPq374Ij+x6arU88jiBxbZwFk/kohE7Tt0wTW2hN2XBozwhGR+lE+Ub6
 MojM1y/snR9Nceq4Au1xkeU7ThWw/gNqgXSW2OcPQ3Wm1ArQ36GH4eM2/9XwG44MaOi9
 CnVNMKowc2SBeNQaEN5hk9T56AJK/ftdQEbPn0y0149iQYnj2DZ0a+qLQRzZc04J/xfR
 JgXObQGzryNBYMdJQCUMadC4rgasD3eDJVkPwIKVCCmY7QMaRKYJT39lWETxASdM/4/A
 y7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696510707; x=1697115507;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=54uUEylq3LVuurRVtb2mIY1GDBu2n1bSehibVDW31Ek=;
 b=BLRoiLtTf+zjpU/2A74x1fNi131bYWrUgeRreK0zxubFu/I7UYHmUj4xE5z83pIu7t
 p3ntvHeH/4X/LgqGnsEbTm2nTRDoKkcu39ZQcDnjASdGVDh4w8JSESs0JIRHKkfdV/9U
 t1tSJpO6/yTUBhGNxFuYJWqnskK5ush0qdR+XjyK68Dj8yXTaeeKUW/rDV+/stLlxabb
 5LpJxYCnjQIWGo86Uh5s/ntPZ6RDaq4E3ZN/8AxCjQNS6dp5epRUQsvbVJ1nH88kRUDv
 thN6sjw6DWRChwQHIRpjrcd5Rri7xqYWymkFYrWfdX9c3+/CLFZvuWt7J1gcsHyvbu4E
 XaXw==
X-Gm-Message-State: AOJu0YxwmBOT6YHXiSzQZKbMDoy0GO/DeL99S01pE6jiL7rIug4eRbFR
 RqEktipnNa7HjGtH+AjP4KCcyA==
X-Google-Smtp-Source: AGHT+IGYliWIqnSbYurYXmldF5bpXzcFNUK7z8v11/xiPWf8HMiN9f4fcRM4OMhil9K85Li760ospg==
X-Received: by 2002:aa7:d945:0:b0:523:2e30:aaee with SMTP id
 l5-20020aa7d945000000b005232e30aaeemr4359227eds.32.1696510707341; 
 Thu, 05 Oct 2023 05:58:27 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a056402050400b00533f111b61dsm1024857edv.68.2023.10.05.05.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 05:58:26 -0700 (PDT)
Date: Thu, 5 Oct 2023 13:58:24 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: Add MPS MP3309C
Message-ID: <20231005125824.GC4874@aspen.lan>
References: <20230925122609.78849-1-f.suligoi@asem.it>
 <20230926130113.GB4356@aspen.lan>
 <DU2PR01MB8034F448F6E66BAC3823CDB1F9C4A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
 <20231003102138.GB69443@aspen.lan>
 <DU2PR01MB80349344FB8CB1415BFA917DF9C4A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
 <DU2PR01MB8034F17A9C81FE198CCAC5B7F9CBA@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR01MB8034F17A9C81FE198CCAC5B7F9CBA@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
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

On Wed, Oct 04, 2023 at 03:18:24PM +0000, Flavio Suligoi wrote:
> Hi Daniel,
> ...
> > ...
> > > > > > +required:
> > > > > > +  - compatible
> > > > > > +  - reg
> > > > > > +  - max-brightness
> > > > >
> > > > > Why is this mandatory?
> > > > >
> > > > > There's no point in setting max-brightness when running in I2C
> > > > > mode
> > > > > (max- brightness should default to 31 in that case).
> > > > >
> > > > >
> > > > > > +  - default-brightness
> > > > >
> > > > > Again. I'm not clear why this needs to be mandatory.
> > > > >
> > > > >
> > > >
> > > > Ok, you are right, I'll remove max-brightness and default-brightness
> > > > from required properties list. I think to change these properties,
> > > > for the pwm dimming, into a clearer:
> > > >
> > > > - brightness-levels (uint32)
> > > > - default-brightness-levels (uint32).
> > > >
> > > > For example:
> > > >
> > > >   brightness-levels:
> > > >     description:
> > > >       Number of brightness levels. The actual brightness
> > > >       level (PWM duty cycle) will be interpolated from 0 to this value.
> > > >       0 means a  0% duty cycle (darkest/off), while the
> > > > brightness-levels
> > > represents
> > > >       a 100% duty cycle (brightest).
> > > >     $ref: /schemas/types.yaml#/definitions/uint32
> > > >
> > > >   default-brightness-level:
> > > >     description:
> > > >       The default brightness level (from 0 to brightness-levels)
> > > >     $ref: /schemas/types.yaml#/definitions/uint32
> > > >
> > > > Example:
> > > > brightness-levels = <10>;
> > > > default-brightness-level = <6>;
> > > >
> > > > What do you think about this solution?
> > >
> > > If you want to introduce a brightness-levels property then I would
> > > expect it to be defined with the same meaning as pwm-backlight (it's
> > > not relevant to the bindings but ideally it would be implemented by
> > > refactoring and reusing the code from pwm_bl.c).
> >
> > ok, I'll use the brightness-levels property as used in pwm-backlight
> >
> > >
> > > Same with default-brightness-level although I'm not sure why one
> > > wouldn't just use default-brightness for new bindings (doesn't
> > > default-brightness-level simply do exactly the same thing as default-
> > brightness).
> >
> > ok for default-brightness instead of default-brightness-level
>
> Just a question: default-brightness-level is the index into the brightness-levels array.
> But, if I use default-brightness instead of default-brightness-level,
> should I consider default-brightness also as an index into brightness-levels array?

Yes.


> Or, in this case, have the default-brightness to be equal to one of the values inside the
> brightness-levels array?

When there is a brightness array (and there is no interpolation) then
it is indexed by brightness. The values in the array are not
brightness (e.g. the controlable value describing the output of the
hardware). The values in the table are merely the PWM duty cycle...

Main difference is, with a correct table the brightness can use an
appropriate logarithmic power scale (which matches how humans perceive
brightness) instead of the linear scale provided by the PWM duty cycle.


Daniel.


Brightness and "index into the brightness-levels array" should be one
and the same thing
>
> >
> > >
> > >
> > > Daniel.
> >
> > Thanks an best regards,
> > Flavio
>
> Thanks,
>
> Flavio
