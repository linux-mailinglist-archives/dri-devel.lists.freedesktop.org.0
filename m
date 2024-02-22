Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D71485F938
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 14:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB5510E922;
	Thu, 22 Feb 2024 13:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aqxSaabj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94AB10E922
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 13:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708607536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/rZwXlN3+rt9lmwvddhJ6lNaAg1yTingK5zSV78YIBs=;
 b=aqxSaabjUJwjqi3SUPrSCuSdc4P6crGJ6mofij0sRcTr7yyw6gB/e01iwm2RU/69yGm/Tn
 qx/LR3aQoQQ+V6ZL0+E8BXNDp4tJN9b1AfVTGEzQWFzhU2FLI2yOb5l1a8lyVYxRVkEwb8
 qLB3GYlrCujKMK+SBIxdjpwrau418a4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-oeeIB6PNMTuRYPmHJPMRiw-1; Thu, 22 Feb 2024 08:12:14 -0500
X-MC-Unique: oeeIB6PNMTuRYPmHJPMRiw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-41082621642so41350605e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 05:12:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708607533; x=1709212333;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/rZwXlN3+rt9lmwvddhJ6lNaAg1yTingK5zSV78YIBs=;
 b=bLpvHXvtoMD56dsL3n4350k9vkRX4Cm1pIWtlRmiP0Ud0wWcI2DUizL5u6GXGVoM/i
 vaquQl/r90N0KOfu2V27p3O5DDocbBJRhCoZnW4LWKxM99o+ueUkjWaDzj3VSUrQENKm
 HG97hvHELO4/+O9943ROkqYnmMpC/b+mqoGXZ6I4qTwVOer1BEgCwXCyQbww3+IHqHEk
 j4bm0ot1tldsBqJtaB4OS13bO1/03E00Aa0/s6UGfhJHmQ2OUNVDzdDziOkQJUbr7DE5
 6GeB1OsH3/r99xeyGIRugdlB+u9EncnsdWhjOfFfXzewqkqR7RJqH4e906F8oUieJuB3
 PMsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxk26BHCwSvCo+y7wD7q++hZumrIwSi6FinaKARQQ6oAuGvPAa5hvJl80qHolvQXWAPYjIUCiEX3/s2mEoFJMD1HTHjg7G+rd02rWrKR2Q
X-Gm-Message-State: AOJu0YzieM4qTRl/v8Ju6OuIAVGv4G5RdHae2k8pJGPpbawMOCzloWYq
 T+uKMMqpsvrEyAOF31WBx4dokSiJUwm4p+pdGwLp4cJ+RaKXoShw8B5zq8edfgoGMrUHb3brrAj
 ckqPh5F6Rw6uRt8R1mwAPDDd0NMALUHtNIvOfDRctvmV/jD4DNjgpw2TTTvUzlVrnsQ==
X-Received: by 2002:a05:600c:310e:b0:412:7218:bda4 with SMTP id
 g14-20020a05600c310e00b004127218bda4mr4380809wmo.19.1708607533214; 
 Thu, 22 Feb 2024 05:12:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5XqSURveOjbO1VkGnuWlZrU2nGzUGAvm+K3BM/xVrrJRRrntfTjTe48FJywj6JtVook8iJA==
X-Received: by 2002:a05:600c:310e:b0:412:7218:bda4 with SMTP id
 g14-20020a05600c310e00b004127218bda4mr4380794wmo.19.1708607532795; 
 Thu, 22 Feb 2024 05:12:12 -0800 (PST)
Received: from toolbox ([2001:9e8:89bc:5400:b148:5c28:6821:6aa5])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a5d4a0c000000b0033b60bad2fcsm20208517wrq.113.2024.02.22.05.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 05:12:12 -0800 (PST)
Date: Thu, 22 Feb 2024 14:12:10 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <20240222131210.GA2405678@toolbox>
References: <zml6j27skvjmbrfyz7agy5waxajv4p4asbemeexelm3wuv4o7j@xkd2wvnxhbuc>
 <20240209203435.GB996172@toolbox>
 <ahfl6f72lpgpsbnrbgvbsh4db4npr2hh36kua2c6krh544hv5r@dndw4hz2mu2g>
 <Zco-DQaXqae7B1jt@intel.com>
 <yx2t7xltxxgsngdsxamsfq6y7dze3wzegxcqwmsb5yrxen73x6@u3vilqhpci4w>
 <20240212170618.GA1372043@toolbox>
 <2mih3humepuedtli7ge52ncom4uffkqravdpalncgfyucmwdzc@bp5o7i3ky77a>
 <20240219140144.GB1956149@toolbox>
 <euaujtp4jyyoud3ccg5qhyvixyq2p6vir4ojlzoky6kep754rj@wruidyfxssry>
 <ZddFBe4A-galsO91@intel.com>
MIME-Version: 1.0
In-Reply-To: <ZddFBe4A-galsO91@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Thu, Feb 22, 2024 at 02:58:45PM +0200, Ville Syrjälä wrote:
> On Thu, Feb 22, 2024 at 11:54:04AM +0100, Maxime Ripard wrote:
> > On Mon, Feb 19, 2024 at 03:01:44PM +0100, Sebastian Wick wrote:
> > > On Thu, Feb 15, 2024 at 12:00:01PM +0100, Maxime Ripard wrote:
> > > > On Mon, Feb 12, 2024 at 06:06:18PM +0100, Sebastian Wick wrote:
> > > > > On Mon, Feb 12, 2024 at 05:53:48PM +0100, Maxime Ripard wrote:
> > > > > > On Mon, Feb 12, 2024 at 05:49:33PM +0200, Ville Syrjälä wrote:
> > > > > > > On Mon, Feb 12, 2024 at 11:01:07AM +0100, Maxime Ripard wrote:
> > > > > > > > On Fri, Feb 09, 2024 at 09:34:35PM +0100, Sebastian Wick wrote:
> > > > > > > > > On Mon, Feb 05, 2024 at 10:39:38AM +0100, Maxime Ripard wrote:
> > > > > > > > > > On Fri, Feb 02, 2024 at 06:37:52PM +0200, Ville Syrjälä wrote:
> > > > > > > > > > > On Fri, Feb 02, 2024 at 04:59:30PM +0100, Maxime Ripard wrote:
> > > > > > > > > > > > On Fri, Feb 02, 2024 at 05:40:47PM +0200, Ville Syrjälä wrote:
> > > > > > > > > > > > > On Fri, Feb 02, 2024 at 02:01:39PM +0100, Maxime Ripard wrote:
> > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian Wick wrote:
> > > > > > > > > > > > > > > > >  /**
> > > > > > > > > > > > > > > > >   * DOC: HDMI connector properties
> > > > > > > > > > > > > > > > >   *
> > > > > > > > > > > > > > > > > + * Broadcast RGB
> > > > > > > > > > > > > > > > > + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> > > > > > > > > > > > > > > > > + *      Infoframes will be generated according to that value.
> > > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > > + *      The value of this property can be one of the following:
> > > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > > + *      Automatic:
> > > > > > > > > > > > > > > > > + *              RGB Range is selected automatically based on the mode
> > > > > > > > > > > > > > > > > + *              according to the HDMI specifications.
> > > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > > + *      Full:
> > > > > > > > > > > > > > > > > + *              Full RGB Range is forced.
> > > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > > + *      Limited 16:235:
> > > > > > > > > > > > > > > > > + *              Limited RGB Range is forced. Unlike the name suggests,
> > > > > > > > > > > > > > > > > + *              this works for any number of bits-per-component.
> > > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > > + *      Drivers can set up this property by calling
> > > > > > > > > > > > > > > > > + *      drm_connector_attach_broadcast_rgb_property().
> > > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > This is a good time to document this in more detail. There might be two
> > > > > > > > > > > > > > > > different things being affected:
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > 1. The signalling (InfoFrame/SDP/...)
> > > > > > > > > > > > > > > > 2. The color pipeline processing
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > All values of Broadcast RGB always affect the color pipeline processing
> > > > > > > > > > > > > > > > such that a full-range input to the CRTC is converted to either full- or
> > > > > > > > > > > > > > > > limited-range, depending on what the monitor is supposed to accept.
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > When automatic is selected, does that mean that there is no signalling,
> > > > > > > > > > > > > > > > or that the signalling matches what the monitor is supposed to accept
> > > > > > > > > > > > > > > > according to the spec? Also, is this really HDMI specific?
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > When full or limited is selected and the monitor doesn't support the
> > > > > > > > > > > > > > > > signalling, what happens?
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Forgot to mention: user-space still has no control over RGB vs YCbCr on
> > > > > > > > > > > > > > > the cable, so is this only affecting RGB? If not, how does it affect
> > > > > > > > > > > > > > > YCbCr?
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > So I dug a bit into both the i915 and vc4 drivers, and it looks like if
> > > > > > > > > > > > > > we're using a YCbCr format, i915 will always use a limited range while
> > > > > > > > > > > > > > vc4 will follow the value of the property.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > The property is literally called "Broadcast *RGB*".
> > > > > > > > > > > > > That should explain why it's only affecting RGB.
> > > > > > > > > > > > 
> > > > > > > > > > > > Right. And the limited range option is called "Limited 16:235" despite
> > > > > > > > > > > > being usable on bpc > 8 bits. Naming errors occurs, and history happens
> > > > > > > > > > > > to make names inconsistent too, that's fine and not an argument in
> > > > > > > > > > > > itself.
> > > > > > > > > > > > 
> > > > > > > > > > > > > Full range YCbCr is a much rarer beast so we've never bothered
> > > > > > > > > > > > > to enable it.
> > > > > > > > > > > > 
> > > > > > > > > > > > vc4 supports it.
> > > > > > > > > > > 
> > > > > > > > > > > Someone implemented it incorrectly then.
> > > > > > > > > > 
> > > > > > > > > > Incorrectly according to what documentation / specification? I'm sorry,
> > > > > > > > > > but I find it super ironic that i915 gets to do its own thing, not
> > > > > > > > > > document any of it, and when people try to clean things up they get told
> > > > > > > > > > that we got it all wrong.
> > > > > > > > > 
> > > > > > > > > FWIW, this was an i915 property and if another driver uses the same
> > > > > > > > > property name it must have the same behavior. Yes, it isn't standardized
> > > > > > > > > and yes, it's not documented (hence this effort here) but it's still on
> > > > > > > > > vc4 to make the property compatible.
> > > > > > > > 
> > > > > > > > How is it not compatible? It's a superset of what i915 provides, but
> > > > > > > > it's strictly compatible with it.
> > > > > > > 
> > > > > > > No it is not.
> > > > > > 
> > > > > > The property is compatible with i915 interpretation of it, whether you
> > > > > > like it or not. And that's what Sebastian was referring to.
> > > > > > 
> > > > > > > Eg. what happens if you set the thing to full range for RGB (which you
> > > > > > > must on many broken monitors), and then the kernel automagically
> > > > > > > switches to YCbCr (for whatever reason) but the monitor doesn't
> > > > > > > support full range YCbCr? Answer: you get crap output.
> > > > > > 
> > > > > > And that part is just moving goalposts.
> > > > > 
> > > > > But it's really not.
> > > > 
> > > > It really is. This whole discussion started by "well it would be nice if
> > > > we made that property handled by the core", and we're now at the "we
> > > > need to deal with broken YCbCr displays and i915 opinion about them"
> > > > stage. After creating documentation, unit tests, etc. It's the textbook
> > > > definition of moving goalposts. And while i915 won't be affected by all
> > > > that work.
> > > 
> > > Sorry, but what you're saying is just not true.
> > > 
> > > The Broadcast RGB property is an Intel specific property.
> > 
> > No, it's not. vc4 has been using it for a year now.
> > 
> > > It lacked documentation but the user space contract exists and it
> > > based on how i915 implemented it. By changing the semantics you're
> > > breaking user space. The documentation has to document the current
> > > contract between i915 and user space, not whatever you want the
> > > property to be like.
> > > 
> > > I get that you're frustrated that you have to do work while i915 doesn't
> > > but none of that is relevant for what the property is and how user space
> > > expects it to work.
> > 
> > That's not it, really. I don't mind doing the work. I do mind losing
> > functionalities on something that was working fine. And getting the
> > blame for something that is, at best, just as much of an documentation
> > issue on i915 devs.
> 
> We've had a couple of these cases recently where people have taken
> some old property implemented by i915 and implemented it differently
> in some other driver. Dunno if the reason was that people didn't try
> to understand what i915 is doing and why, or they misundestood it,
> or they understood it but decided to ignore it anyway.
> 
> Unfortunately having undocumented corners in the uapi is simply
> a fact of life when dealing with a >15 year old legacy codebase.
> Also there were basically no rules regarding properties in the
> past, so everyone just added random properties whenever they 
> felt like it.
> 
> I think going forward we should probably lay down some extra
> ground rules; if an old undocumented uapi is being extended
> to cover more than one driver we must first figure out what
> the de facto semantics are, and document things properly
> before anything else gets done.

That would be great. The documentation already has requirements for new
properties. Adding the requirement for extending driver-specific
properties to more drivers there would be great and make it "official".

> 
> -- 
> Ville Syrjälä
> Intel
> 

