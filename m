Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEB0B508F8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 00:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF56410E815;
	Tue,  9 Sep 2025 22:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BNOwdgpw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C8510E815
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 22:44:35 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-24c9a399346so46704405ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 15:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1757457874; x=1758062674;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4yfBU9AYetve95lMaxYZGTwSsv9zgxSypdrW9Vf/Ik=;
 b=BNOwdgpwM2xh9alkDPFl65xPQ/aB2hCHWRxMF0FmTdYz95OTfGP/wy2rvPWZcD4wWO
 skJMmizvX/ybvwu85Yv1Xmv/Kr1FeC6fapPHUX0PFxy8CjDXhyCK68ThOlAYbC6+3JAT
 BPLI0kLJbqGMru12g6uMGIFaY4/TO/yDIkgQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757457874; x=1758062674;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z4yfBU9AYetve95lMaxYZGTwSsv9zgxSypdrW9Vf/Ik=;
 b=vMxm1gzMMWFf02sXSWxQ/MEcg2dsOGaC+yDE7+KPSn1l92lbsObVYEKehFM92hpAWr
 rqPujy3W1dSdSWr7oiXOFo6wmxiR40cGvi8/I4jmeqgAGOTr6dQ/OwYyWaw985VndpCg
 01AhBz8bpBK9wAMOpVY6wxyuOvG7BYBl08HKOsy0xVg3wVsfb62lxng6mfq2BKozy5eY
 V9td/8DLRhhB9bdjbPpMjnRUqpNMMtUWtSGaLBw0HR2ulUkqRg+tUXK526yiFHQV91bf
 YQATkjrDuzF9hzI7dT51BSNS0Wazajo5oAZspLwpWfne97cw5NyPihZPAglIL6CH8hd9
 cZzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA65UcZ96v+uOPaQDVH5gZ79R+GDddEmNniR4jXCbdECv7U4E8o+1cPlsRJ8o8zUf44O4NzXb2cs4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS+s4qzIPrh9Y+IebfgzIhCZTyON3D8Ylja0eXtsmU3FfXYBwX
 /dc/d0OsP70d6C7zdwrLl04Qqjl5xE4ztj6LaCcK+ejYaYSiPIMj5H8ypMb+2cvoDrGVp/q/jgQ
 O3oo=
X-Gm-Gg: ASbGncsts5sM8LoA5q8eBivZKK3+xN5qVMh8bw+PTET2X6qjNjl1XJnOhgKtCHwFgml
 LwKIYu9m0EPZBSMt+ZqM+tc1v+U1XFlVaS0ny06bzBMWjjqwYPDN95NsxTuDfYVpOiGfhORvrBb
 60fjfRtqFiTEfgYnHa+iZj5+/Zy3mfmOQ/g2RKS5eeR7joQiIDJFUBk66Csrtd7M8aICxgf8Sxx
 3QbvvR66/yoHuAN7F4Z+lIYdvN9tyXvxMY4yKf1N4+dsX6OUb97DOUGSc/EcULsY2/CzBJQPlR6
 h0lc8FEwc50V42J4XCF4Jn0bDObFHwyUTUPWK4hJ5RHovhnGAEl+MEQOlzemklPuNJ1ogyYTpvj
 z0ffYkdBNoooxSoV/8/Y1BaQ6S8gdWydu0+DIITskbxNoc5npWeH4O6x/LAPFlFhx4QD2ryGXUo
 Pz
X-Google-Smtp-Source: AGHT+IHpxlVdmW0VyG0eXbLr25fm9tDSMYe59bk12fXaMTKDXJqfYZLumZKk5JuxB3q6ZH4T560wzg==
X-Received: by 2002:a17:902:ea04:b0:248:79d4:93bb with SMTP id
 d9443c01a7336-25170c44cf6mr209677105ad.31.1757457874410; 
 Tue, 09 Sep 2025 15:44:34 -0700 (PDT)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com.
 [209.85.215.173]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25a27422bd0sm8185145ad.16.2025.09.09.15.44.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 15:44:32 -0700 (PDT)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b4d118e13a1so4104264a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 15:44:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW0OCrNN69gaV4c3vIW4AnoqhGJT4t1RpcyEUT3ZV7QpmsHDRi02/0VK5NbS3r2Ei9hYcNdB1JBQoc=@lists.freedesktop.org
X-Received: by 2002:a17:903:b0e:b0:249:f16:f086 with SMTP id
 d9443c01a7336-251718dbaf3mr161248035ad.42.1757457871970; Tue, 09 Sep 2025
 15:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=XWhDtFWegUUeACxcrSTFh7kbmwVFy3sioboh2fgk3Evw@mail.gmail.com>
 <20250909193641.236527-1-john.ripple@keysight.com>
In-Reply-To: <20250909193641.236527-1-john.ripple@keysight.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 9 Sep 2025 15:44:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WwYYQ67j9vTV-xYLcALPN3J3nj56PvEOOhMQ1T3sqJuQ@mail.gmail.com>
X-Gm-Features: Ac12FXw1reTwaSFLkM9n4dHmDjCjlmvWRm6UTmr6JNR-KB3ItUYGPK10m1cxbG8
Message-ID: <CAD=FV=WwYYQ67j9vTV-xYLcALPN3J3nj56PvEOOhMQ1T3sqJuQ@mail.gmail.com>
Subject: Re: [PATCH V2] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
 mode with HPD
To: John Ripple <john.ripple@keysight.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 andrzej.hajda@intel.com, blake.vermeer@keysight.com, 
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 matt_laubhan@keysight.com, mripard@kernel.org, neil.armstrong@linaro.org, 
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
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

Hi,

On Tue, Sep 9, 2025 at 12:36=E2=80=AFPM John Ripple <john.ripple@keysight.c=
om> wrote:
>
> Hi,
>
> >> +static int ti_sn65dsi86_read(struct ti_sn65dsi86 *pdata, unsigned int=
 reg,
> >> +                            unsigned int *val)
> >
> >This is reading a byte, right? So "val" should be an "u8 *". Yeah,
> >that means you need a local variable to adjust for the generic regmap
> >call, but it makes a cleaner and more obvious API to the users in this
> >file.
>
> The regmap_read function takes in an "unsigned int *" as the "val"
> parameter and I'm using it to return u32 values (which could probably
> be u8 instead). Would it be better to leave this as the more generic
> int type or change it to u8 so its more specific to this driver?
> If this function gets used elsewhere in this file at some point, I'm
> not sure everything that could be read would be single bytes.

Sure, the "regmap_read" takes "unsigned int *" because it's a generic
API. ...but we initialize the regmap API with:

  .reg_bits =3D 8,
  .val_bits =3D 8,

In other words, each read/write is 8-byte AKA 1 byte. So you're not
returning 32-bit values, but 8-bit values.

There's already a 16-bit version of this function:
ti_sn65dsi86_read_u16(). Reading that function and yours next to each
other makes it seem (at first glance) like yours is returning 32-bits.
It's not. It would be much more documenting showing that it returns
8-bits. If we need a 32-bit version for some reason we'll have to
actually write that up.


> >> @@ -1219,12 +1246,28 @@ static void ti_sn_bridge_hpd_enable(struct drm=
_bridge *bridge)
> >>          */
> >>
> >>         pm_runtime_get_sync(pdata->dev);
> >> +
> >> +       /* Enable HPD and PLL events. */
> >> +       regmap_write(pdata->regmap, SN_IRQ_EVENTS_EN_REG,
> >> +                    PLL_UNLOCK_EN |
> >> +                    HPD_REPLUG_EN |
> >> +                    HPD_REMOVAL_EN |
> >> +                    HPD_INSERTION_EN |
> >> +                    IRQ_HPD_EN);
> >
> >* Shouldn't this be `regmap_update_bits()` to just update the bits
> >related to HPD?
> >
> >* why enable "PLL_UNLOCK_EN" when you don't handle it?
> >
> >* I also don't think your IRQ handler handles "replug" and "irq_hpd",
> >right? So you shouldn't enable those either?
>
> The IRQ_HPD_EN documentation said:
> "When IRQ_EN and IRQ_HPD_EN is enabled, the DSIx6 will assert the
> IRQ whenever the eDP generates a IRQ_HPD event. An IRQ_HPD event
> is defined as a change from INSERTION state to the IRQ_HPD state."
>
> I thought that meant the IRQ_HPD_EN needed to be enabled to get any irqs,
> but when I tried removing the IRQ_HPD_EN and it doesn't seem to change
> anything, so I'm not sure what the documentation is trying to say.

IRQ_HPD is defined in the spec. It's basically an "attention"
interrupt from the panel to ti-sn65dsi86. It (and replug) are a
temporary deassertion of HPD while a display is connected.

See "Figure 17. HPD State Diagram" for a description of all these
things. Note that the min/max values there are (I think) because
sn65dsi86's HPD timings are implemented by a very inaccurate ring
oscillator.

If you see that "replug" or "irq_hpd" are needed then your interrupt
handler should do something with them.


> >> @@ -1309,6 +1352,32 @@ static int ti_sn_bridge_parse_dsi_host(struct t=
i_sn65dsi86 *pdata)
> >>         return 0;
> >>  }
> >>
> >> +static irqreturn_t ti_sn_bridge_interrupt(int irq, void *private)
> >> +{
> >> +       struct ti_sn65dsi86 *pdata =3D private;
> >> +       struct drm_device *dev =3D pdata->bridge.dev;
> >
> >I'm unsure if accessing "dev" here without any sort of locking is
> >safe... It feels like, in theory, "detach" could be called and race
> >with the IRQ handler? Maybe you need a spinlock to be sure?
>
> I tested a spinlock added to the ti-sn65dsi86 structure that gets used
> in the ti_sn_bridge_detach and ti_sn_bridge_interrupt functions and it
> seems to work. Is there another spinlock created somewhere that I could
> use instead? Is using the spin lock in the interrupt and detach functions
> the correct way to do it?

In this case you could probably use a mutex since you're running a
threaded IRQ handler and sleeping is allowed. You could probably
create a new mutex for this case.

I assume you'd need some sort of boolean variable instead of just
checking if "bridge.dev" is non-NULL? "bridge.dev" is set by the DRM
core before your attach is called (and cleared after detach). Maybe
just have a boolean about whether HPD is enabled and only send the
event if HPD is enabled? Then use the mutex to protect access to that
boolean between the IRQ handler and the HPD enable/disable code?

-Doug
