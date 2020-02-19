Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A20163AA5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 04:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F24789BAB;
	Wed, 19 Feb 2020 03:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9DD89BAB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 03:02:03 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 66so21731815otd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 19:02:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rFMkjGpB5P5Yuyv7sMOcWjIo25hp6v2dU13cY3mBC+g=;
 b=EuOWUOe+U5kKJnkqry8J4R22ewZ/KfDqC/z+UhBL5TawRZSiRN+4mJZwDoWNLsVVGL
 BgycR5TtXgMkDRoBO0nbmPQIa4mj+5Sr5Icn+q0P36lbqzkBjZubtclVqyuD4dcsf4j1
 qZGs9sfGaHVZud/PsCVRWIgcTQqEeRB5oLiAFGCLpTgtD+AvIhy3AqZm9q87eHvPthq9
 3/l0YrW/adNYnr2eOaN0xWtdI3eJwVxPolB4NADLE+0dG80VCkmIG13rle0y1bmxGWwW
 ZL0pZnFy69te2TNuvGDyQ7cVqZy1pkXpJIVlonubWnJXBZWL3sZoPILBiR3/kY3GuLyr
 Nmaw==
X-Gm-Message-State: APjAAAW0DPeXevxM34/rbV7sX1wnQRWrVBOoODBC7LnsJ7dkW67wiHZP
 JKZt3ldoRSU6kaLawSwQOg==
X-Google-Smtp-Source: APXvYqyVd0GEkqGJFCg+0jQjwfkr57L6CDJVWGnKS41CanYOhCgraDFMbXd01paM8WkuNqUqCyvUPA==
X-Received: by 2002:a05:6830:140f:: with SMTP id
 v15mr18148994otp.218.1582081322305; 
 Tue, 18 Feb 2020 19:02:02 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h15sm197130otq.67.2020.02.18.19.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 19:02:01 -0800 (PST)
Received: (nullmailer pid 14184 invoked by uid 1000);
 Wed, 19 Feb 2020 03:02:00 -0000
Date: Tue, 18 Feb 2020 21:02:00 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 4/5] dt-bindings: display: add data-mapping to panel-dpi
Message-ID: <20200219030200.GA9263@bogus>
References: <20200216181513.28109-1-sam@ravnborg.org>
 <20200216181513.28109-5-sam@ravnborg.org>
 <CAL_Jsq+AbXEiLCYiAvwr5qzbSnuo9G8bTwAM3G9J4cPYz1_FMw@mail.gmail.com>
 <20200218221638.GA27927@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218221638.GA27927@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 11:16:38PM +0100, Sam Ravnborg wrote:
> On Tue, Feb 18, 2020 at 02:13:45PM -0600, Rob Herring wrote:
> > On Sun, Feb 16, 2020 at 12:15 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Add data-mapping property that can be used to specify
> > > the media format used for the connection betwwen the
> > > display controller (connector) and the panel.
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > Missing blank line.
> > 
> > > ---
> > >  .../devicetree/bindings/display/panel/panel-dpi.yaml | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > index 40079fc24a63..6a03d2449701 100644
> > > --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > @@ -21,6 +21,16 @@ properties:
> > >        - {}
> > >        - const: panel-dpi
> > >
> > > +  data-mapping:
> > > +    enum:
> > > +      - rgb24
> > > +      - rgb565
> > > +      - bgr666
> > > +      - lvds666
> > 
> > Doesn't lvds666 come from i.MX IPU which as I remember has built-in
> > LVDS block? I'd think this format would be implicit when using the
> > LVDS block and panel. It doesn't seem this is actually used anywhere
> > either.
> I must admit that I just copied this list from Oleksandrs original
> patch. The MEDIA type it identifies(MEDIA_BUS_FMT_RGB666_1X24_CPADHI) looks special.
> I will drop lvds666 while applying, unless I get other feedback.
> (Note: travelling, earliest in the weekend)

Okay, with that:

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> Btw. anyway I can add data-mapping to panel-common - and then list the
> allowed enum values in each binding?

That would be good. It should be defined explicitly that it's a single 
string as that's implicit currently.
 
Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
