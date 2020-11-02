Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED56A2A3E9F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662EB6EC29;
	Tue,  3 Nov 2020 08:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56D16E093
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 17:08:04 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id g19so3833445otp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 09:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=h835lHTQAu95wxA6PWFRRi1Mf/8MD2a5rJ3lZGCt1cc=;
 b=JXzV2p0vzQ8oWk1hcaXFG0FvtdrXkV2dRVgA/IbVQE/hgmv5n5pCVIvX3ESBoyvRGf
 tgtfY7MWJUbRHG067Bs69792lkKZW5h9t+tEeDcB6BRq9PRAy76YtZ1WQ93f5nn5qQkz
 h/9uGzvP827kIjRUVNnANCl7bQ4nnsPVFpKVQknecDyRFRRGcqSTOfEjWdipbFNiKj9K
 6/v0/FxOSV95gWgZNzOpV+sb61Bq0be7/mu8AiAVV3H916cU3YOXRmnVEShMx06rfuXz
 B42vxCATidn5x/xPrejMPvHKUB+LnQe0ofCsZgj42RK/AQoodaBKYalUoN9NELtSuyav
 4l6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h835lHTQAu95wxA6PWFRRi1Mf/8MD2a5rJ3lZGCt1cc=;
 b=oy44szPIYL/c2A3XKIiyISEW2exjk4bnY7abbtSSZPHlOZOpM+Kj+0yXKoCAbuN1OA
 uWEdZ8WIOQBPcBaHiRKAdGEKMWatI+Wm4QcNKpsrxtHaccHOxj5qbFsacRS+Lk9hoRLa
 xOQwpPK1fZHnnl9sYsCfPiP7+kjl00mduFothoavjC6J+gGmuuoxIOoHZrnmNB+btnEp
 z3PN7C9P5mhdm5Ks1g8F6n5e0FAdNlPsJ0O5oVaXnPuxo8PbzJoftUj3UX7RaR/F3GHO
 xgpwFYjpvN7l51cNvQ+TMb7o+JYhed4bCGxX0cyDRVBwSvtPRLAQb0lQUvcsQRoIzgcb
 nzHQ==
X-Gm-Message-State: AOAM5305y63r0wI6U0M3YS0qbuJupDoBdpa8ciizm7sfSNtrGFz7Pzs+
 2f6vcjtV63pCgfrPQrkS81ed7g==
X-Google-Smtp-Source: ABdhPJwPghsbeLdlR1n488K/KOrm0Vc5OL56hGZgaK6freCCeb7B/2DFK47J9LaHVmCOZ7tOA3hd9g==
X-Received: by 2002:a05:6830:2018:: with SMTP id
 e24mr13147614otp.278.1604336883838; 
 Mon, 02 Nov 2020 09:08:03 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id y22sm3560488ooa.2.2020.11.02.09.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 09:08:03 -0800 (PST)
Date: Mon, 2 Nov 2020 11:08:01 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi86: Replace
 #pwm-cells
Message-ID: <20201102170801.GI3151@builder.lan>
References: <20200930223532.77755-1-bjorn.andersson@linaro.org>
 <20200930223532.77755-2-bjorn.andersson@linaro.org>
 <CAD=FV=Unu-PH_RThi3xRF1HUADN2PqcVAOin0O0yo0gcGRWCDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=Unu-PH_RThi3xRF1HUADN2PqcVAOin0O0yo0gcGRWCDQ@mail.gmail.com>
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 02 Oct 15:42 CDT 2020, Doug Anderson wrote:

> Hi,
> 
> On Wed, Sep 30, 2020 at 3:40 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > While the signal on GPIO4 to drive the backlight controller indeed is
> > pulse width modulated its purpose is specifically to control the
> > brightness of a backlight.
> 
> I'm a bit on the fence about this.  I guess you're doing this because
> it avoids some -EPROBE_DEFER cycles in Linux?  It does seem to have a
> few downsides, though.
> 

No, the reason for exposing a backlight is that while the thing
certainly is a PWM signal, the description of it and the registers
available to control it surely seems "backlight" to me.

In particular No, the reason for exposing a backlight is that while
while the thing certainly is a PWM signal, the description of it and the
registers available to control it surely seems "backlight" to me.

> 1. It means a bit of re-inventing the wheel.  It's not a very big
> wheel, though, I'll give you.  ...but it's still something.
> 

The main problem I saw with exposing this as a PWM was the fact that we
have both period and frequency to control...

> 2. I'm not sure why you'd want to, but in theory one could use this
> PWM for some other purposes.  It really is just a generic PWM.  Your
> change prevents that.
> 

...and in the even that you use it as a "generic" PWM I'd expect that
the specified period is related to the frequency of the signal. But the
period is documented to be related to the number of brightness steps of
the panel.

> 
> 
> > Drop the #pwm-cells and instead expose a new property to configure the
> > granularity of the backlight PWM signal.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > index f8622bd0f61e..e380218b4646 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > @@ -66,9 +66,12 @@ properties:
> >        1-based to match the datasheet.  See ../../gpio/gpio.txt for more
> >        information.
> >
> > -  '#pwm-cells':
> > -    const: 1
> > -    description: See ../../pwm/pwm.yaml for description of the cell formats.
> > +  ti,backlight-scale:
> > +    description:
> > +      The granularity of brightness for the PWM signal provided on GPIO4, if
> > +      this property is specified.
> > +    minimum: 0
> > +    maximum: 65535
> 
> A few issues here:
> 
> 1. Maybe call this "num-steps" instead of backlight-scale.  That's
> essentially what it is, right?  Saying how many discrete steps you're
> allowing in your backlight?
> 

That would work, I had it as "max-brightness" for a while as well. But I
reverted to backlight-scale, because that's the name used in the
datasheet.

I'm fine with whatever color of the shed though :)

> 2. IMO you need the PWM frequency specified, since it can actually
> matter.  NOTE: once you have the PWM frequency specified, you could
> imagine automatically figuring out what "num-steps" was.  Really you'd
> want it to be the largest possible value you could achieve with your
> hardware at the specified frequency.  There's no advantage (is there?)
> of providing fewer steps to the backlight client.
> 

I guess there's no problem in having a "num-steps" that is unrelated to
the number of brightness steps of the panel - but I did distinguish them
because the datasheet clearly does so.

> 3. Some backlights are specified inverted.  It looks like this maps
> nicely to the bridge chip, which has a bit for it.  Probably nice to
> expose this?
> 

Yes, that should be covered.

> Of course, if we were just exposing the PWM directly to Linux we could
> just use the PWM backlight driver and it'd all magically work.  ;-)
> 

Please help me figure out how to properly expose this in the PWM api and
I'll be happy to respin it using this - as you say my wheel does look
pretty similar...

Regards,
Bjorn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
