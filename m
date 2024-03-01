Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA7486E042
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 12:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EDA10EC28;
	Fri,  1 Mar 2024 11:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZEufbuFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5801D10EC63
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 11:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709292588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qRUqDJ3Iv/k5nE0Cga6hqzTdj9gEhtnN2QTBMasCuKc=;
 b=ZEufbuFzUmsxRs1JzqLkGCMOKg3YlKE5F/gSri1oNi3kvUN+NOZ5pAjrEz/sSKVBe3MWG7
 3FSuNLgiEaMdZpSDWLbF9ZpTXw4HpOGyYOyBteAyYl/3t3z77RSK4zZhGxQBRT5YDFHxfs
 Sh8z8j5CW7ECe1wtktDortp2kmvyRVo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-lFiuaF3ZMFGTZXxEC3v_yg-1; Fri, 01 Mar 2024 06:29:45 -0500
X-MC-Unique: lFiuaF3ZMFGTZXxEC3v_yg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-412b49e13e4so9523225e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 03:29:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709292584; x=1709897384;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qRUqDJ3Iv/k5nE0Cga6hqzTdj9gEhtnN2QTBMasCuKc=;
 b=KoV+v8rfjDR2Nd8DsRaSRrgw9h7nn3OYflfQW4Q2CyNXDlIm4deLSomVAWPIIpIcyO
 rwI9ZpbVrg9KjA7u2+rWWfNjJ5oIiQLOf0JDxHoRpFAMQbTH6Ci8r0cm+gMMmr4OBOIY
 ovxlfYVxOlYfmWJmrYibUiEr8WdFDJ0E0zL7qh5OFDYwDEQQWWuQDisZetcbzXz/RiJW
 K7PbMMqAVlI5W63hPE9ibxKfMri/QwaKmHbqiwQDwWHN1PP6B1xlVCPWLyz9KOvITP9c
 n1n8y8DDpVh7k7vMXo1dRtLPk1ftCv7IS3tpTcSpRzXfD0CDFVXCEAxCrW39OyYoCNDx
 43gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYvpE/AcCkkx6Fi1YuoP1uD+2qvKlqhqQie5+P9AiRHSxxM5thjDfsU2ZDT3ub53SVOYOuhkyPz8Xvq734QVdkOwMHNslCmWAnnB7Skiee
X-Gm-Message-State: AOJu0Yw9RG+kr/sYMRzcxhCkttqc9LywBO8+LUafGg5PRLLsFqKDuIyE
 SDAX03IdEl7Jwltt7W2EwqbUjDr4TfCs+KJAlE9Ox1222luROHGPElQhM2vbRp4bJQDqm1rzmWE
 dR02jaAwt3QDc8Bec+wjOYuiLzVwDsnKKEUMk+mRhZLuutmc5z0UzbBFZCRGZBe/akw==
X-Received: by 2002:a05:600c:4fc4:b0:412:c8c9:c844 with SMTP id
 o4-20020a05600c4fc400b00412c8c9c844mr988467wmq.26.1709292583992; 
 Fri, 01 Mar 2024 03:29:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKqlwQ+JstuXu5h4wbg4ZOpZ/dkea6nQ1ibG6iOdPso+qOIY2FCKYMPY6GH4tsyMvb9w+yJg==
X-Received: by 2002:a05:600c:4fc4:b0:412:c8c9:c844 with SMTP id
 o4-20020a05600c4fc400b00412c8c9c844mr988453wmq.26.1709292583675; 
 Fri, 01 Mar 2024 03:29:43 -0800 (PST)
Received: from toolbox ([2001:9e8:89a0:c500:c65:1f3a:8c08:2a1d])
 by smtp.gmail.com with ESMTPSA id
 bi19-20020a05600c3d9300b00412ca030252sm1036720wmb.30.2024.03.01.03.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 03:29:43 -0800 (PST)
Date: Fri, 1 Mar 2024 12:29:41 +0100
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
Message-ID: <20240301112941.GE166694@toolbox>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-21-8f4af575fce2@kernel.org>
 <20240229194726.GB166694@toolbox>
 <20240301-light-impressive-grasshopper-adabeb@houat>
MIME-Version: 1.0
In-Reply-To: <20240301-light-impressive-grasshopper-adabeb@houat>
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

On Fri, Mar 01, 2024 at 11:30:56AM +0100, Maxime Ripard wrote:
> On Thu, Feb 29, 2024 at 08:47:26PM +0100, Sebastian Wick wrote:
> > > @@ -1708,6 +1731,39 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
> > >  /**
> > >   * DOC: HDMI connector properties
> > >   *
> > > + * Broadcast RGB (HDMI specific)
> > > + *      Indicates the Quantization Range (Full vs Limited) used. The color
> > > + *      processing pipeline will be adjusted to match the value of the
> > > + *      property, and the Infoframes will be generated and sent accordingly.
> > > + *
> > > + *      This property is only relevant if the HDMI output format is RGB. If
> > > + *      it's one of the YCbCr variant, it will be ignored and the output will
> > > + *      use a limited quantization range.
> > 
> > Uh, maybe just say that the quantization range is selected automatically
> > in case a YCbCr output format is in use. I'm not sure every YCbCr
> > variant requires limited and even if it does, new formats could change
> > this.
> 
> I documented what i915 is doing:
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/display/intel_hdmi.c#L2143

Sure, this is one valid strategy for the automatic behavior of YCbCr.
Drivers could also always send an InfoFrame to ensure full range where
possible. The point here is that this property shall not affect YCbCr
output formats!

Maybe it's even better to say "driver specific" instead of "automatic".

> Maxime
> 

