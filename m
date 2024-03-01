Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E6286E1A7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 14:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BC210ED12;
	Fri,  1 Mar 2024 13:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RVa4J3Wl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FD410ED12
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 13:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709298926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j6JDdzMRW33EgNy8WVE2rwXJul+k7YILcoZp2XURKLI=;
 b=RVa4J3Wlfk1aD4BVAnTbkPGGxMmrunaF2e22Gbsw6fzkGMIXuLhwrLJd4zbSvmYcrO+rq8
 s5Jx1ET5CM0BJUgbAK50GuuUse0ZwxBisABVXUfNjsUcOwD3B41FLy+7GqDpy5aP8x1rp+
 LCg+zqCm8lKB5aBGtkfW3guFtpmuxXs=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-So7GBlpKNTCpeAqkooKeVg-1; Fri, 01 Mar 2024 08:15:23 -0500
X-MC-Unique: So7GBlpKNTCpeAqkooKeVg-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-512a5c6465bso1589244e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 05:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709298922; x=1709903722;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j6JDdzMRW33EgNy8WVE2rwXJul+k7YILcoZp2XURKLI=;
 b=gUfzoz4L3GFX3Bg2mHnkd8iR1InZfZG2r7Ft3s0U7YCuQVwR+WYqsCHm4Aw/mN+InJ
 V5thQbTP34tbjvd6pe+7wuo/fPnXPnopwaQOf1KZmSG14SSWc2QsdhiaR8S2xpf3qu4D
 aThvnSLx2BhBRDEdocTf2EN2ehmF80Ix+I7jJxt5Kwps93+5gSySVV++rlzfdqAVSBg+
 Gw4Mw6tPMkcquftgJa+hk3jAN8DZPFaLbdGMd0IH9xtsUbYrPJPPBexFO/9lnLfhmp84
 W7kaogXjqDGgTqud4hnj+3kPXMHDi1f+6Spdea1In0pEEYS+INMpnyb30EG2mSHsYP46
 RzFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgAWrfLG0rolf5sjCfPqda85wy6cYoNaLZNSDq5l6MX40Sa0DodsheWF0eUhJ0uS6vjOE8WPaC8Jy3KRXNEeEYcnbykNsok8PrKp3DKd+v
X-Gm-Message-State: AOJu0YwkRew02FZBIh2aFi/ecr2e4wxyr6MeWLwTAogr45KKHpqU8V9A
 xoto+2F06+wZVQgFCD2+Xfeqcuj8fxcsG4KHhBWmrXSnIG2SCKGcjcFD1pIbi8EIaLbWY0Kk4wS
 PKnU4jTyaR56nRC/cSllyJNCpbD0vDJkjZgI/xDZwE9UEm86exNeQZF77AZnENU+xgA==
X-Received: by 2002:ac2:599b:0:b0:512:f6d3:9998 with SMTP id
 w27-20020ac2599b000000b00512f6d39998mr1223721lfn.17.1709298922220; 
 Fri, 01 Mar 2024 05:15:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwlzt5HlgK0WAcZyh2ZsOJe95EyGGHjhxje8QxMH4nFVP4Pvs9Hg/dbyzZ0Awcz9X/EGacJg==
X-Received: by 2002:ac2:599b:0:b0:512:f6d3:9998 with SMTP id
 w27-20020ac2599b000000b00512f6d39998mr1223689lfn.17.1709298921881; 
 Fri, 01 Mar 2024 05:15:21 -0800 (PST)
Received: from toolbox ([2001:9e8:89a0:c500:c65:1f3a:8c08:2a1d])
 by smtp.gmail.com with ESMTPSA id
 bw1-20020a0560001f8100b0033db0c866f7sm4639850wrb.11.2024.03.01.05.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:15:21 -0800 (PST)
Date: Fri, 1 Mar 2024 14:15:19 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v7 21/36] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <20240301131519.GA10491@toolbox>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-21-8f4af575fce2@kernel.org>
 <20240229194726.GB166694@toolbox>
 <20240301-light-impressive-grasshopper-adabeb@houat>
 <20240301112941.GE166694@toolbox>
 <20240301-loyal-cornflower-oxpecker-83ed59@houat>
MIME-Version: 1.0
In-Reply-To: <20240301-loyal-cornflower-oxpecker-83ed59@houat>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Fri, Mar 01, 2024 at 01:12:02PM +0100, Maxime Ripard wrote:
> On Fri, Mar 01, 2024 at 12:29:41PM +0100, Sebastian Wick wrote:
> > On Fri, Mar 01, 2024 at 11:30:56AM +0100, Maxime Ripard wrote:
> > > On Thu, Feb 29, 2024 at 08:47:26PM +0100, Sebastian Wick wrote:
> > > > > @@ -1708,6 +1731,39 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
> > > > >  /**
> > > > >   * DOC: HDMI connector properties
> > > > >   *
> > > > > + * Broadcast RGB (HDMI specific)
> > > > > + *      Indicates the Quantization Range (Full vs Limited) used. The color
> > > > > + *      processing pipeline will be adjusted to match the value of the
> > > > > + *      property, and the Infoframes will be generated and sent accordingly.
> > > > > + *
> > > > > + *      This property is only relevant if the HDMI output format is RGB. If
> > > > > + *      it's one of the YCbCr variant, it will be ignored and the output will
> > > > > + *      use a limited quantization range.
> > > > 
> > > > Uh, maybe just say that the quantization range is selected automatically
> > > > in case a YCbCr output format is in use. I'm not sure every YCbCr
> > > > variant requires limited and even if it does, new formats could change
> > > > this.
> > > 
> > > I documented what i915 is doing:
> > > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/display/intel_hdmi.c#L2143
> > 
> > Sure, this is one valid strategy for the automatic behavior of YCbCr.
> > Drivers could also always send an InfoFrame to ensure full range where
> > possible. The point here is that this property shall not affect YCbCr
> > output formats!
> > 
> > Maybe it's even better to say "driver specific" instead of "automatic".
> 
> Honestly, I'm not sure what you want from me here. Ville and you
> insisted on the previous version to document what i915 is doing and to
> follow whatever the behaviour was, and that we shouldn't spend time
> improving the property. Fine, I did that.
> 
> But now, you want me to ... improve the property?

The property has a clear scope: quantization range for RGB output
formats. What Intel does with things that are not in scope of the
property is irrelevant. This isn't improving the property either but
documenting the scope of the property.

Sorry if this seems arbitrary but these details are so important to get
right because the interactions between all the different things is
already majorly broken.

> Maxime
> 

