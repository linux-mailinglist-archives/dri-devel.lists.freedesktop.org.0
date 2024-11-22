Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D079D5AB4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 09:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A9510EAE8;
	Fri, 22 Nov 2024 08:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GBeS30DM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0235310EAEE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 08:09:14 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e387fdd1ec4so1431453276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 00:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732262954; x=1732867754; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4i1sxaeFBGx2wxYOougyMhz2WriTwICqXvMw1rfwb3I=;
 b=GBeS30DMb45hx/S15eKkk6oQNdte7Qjb7cFDAzXOL2FYmSyagRM5a2eREqRsM3T6qE
 CH/oC739AgF8Eeuq3AkZviYc0Z8O/ZCySIlWpObkI7/COqfQJ2fl8CpfDIQcvAkS8+Xy
 nH6GjSQJyfETk6JWqImNA8wkx0AuGgYG/uqZfM19dTUT4Rbg0A0wWGXYJlGVKtBTrsHe
 Xpu8n/MDEADYjvl6Frxmq/up907Fy59ou35ZuOcF37IZ9FThEqmhNCcEteXFwtAR+pdw
 afr+pyqT5ZchmiCljKYBJ9UWEH2fP7qqOR8hgJGDKu/MJHFYgdDXr8/WMHX7zQsGwjTW
 Yy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732262954; x=1732867754;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4i1sxaeFBGx2wxYOougyMhz2WriTwICqXvMw1rfwb3I=;
 b=gNnuCL1sz6giBUTUib8AHzlPwb8QEchkcqS4HedA0oGVIV30ihoUb1WZeL4pJqOhmb
 KQK4M5S3QqGdny2bMlSGT4ONpkB5bCIXrcc9ZpAPxBSpKGVzBK8+Oz+wgWVidHSJ8l4w
 creTDzYg0daYu6MQsnNhKW75f9KHsi35EeFZLIrBaOx2vpXws4QXfuof0Yotb6JQPNNR
 wNJBgKURQvzZu+ORoyEN7BRvf+xW6m8s7zDe+4YA8+wgNb2dc31A44d+lNmNRlvaFGY+
 sGVwUUJUCQHsn3H0VNsNMD88S3YMBDwdZgcawZPvG5mR2Z1J7EQYqYBhSNvMw7kPIX57
 khdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/mfkkw3JsHCvgXR+GR9RnDkF+pdu4A5ytSEO1YbjIlHjZLQRW2bTAU/gK0ogZ3L6hj9ZBH+nI/Jg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrYKOpWsgHGk4M4dYMxwzxLqMX7A5VXGuJyo5zP2wrgw+bS+s4
 CCOzxNVgR6sC4t9M6hRjQomRutNO0WFqywEPeSNHsx7rSANXpmRQje4Elwd309yz2b+Wg/BxYTW
 uJAgVPsF7uHsyW78jKvYDc8hjzdnav9IwQ5x/EA==
X-Gm-Gg: ASbGncthAaOgQZdgkeFFGm6CPWLCuR2Kzx3kR14ZNizX7fO+QIP7GWFjAXdAu7CCI2s
 Upz5gvauiasYue+8520WYxcOfBPPcLS1BKY+nbZo/WIryBA==
X-Google-Smtp-Source: AGHT+IHn+ycqQkqHFHF7gbN6JgsF6S3+Z43x5ce9+bVkeaBHeBsezXZlxwD3h6fTRJubUECFxFghH84iP8Acs6VFnUE=
X-Received: by 2002:a05:6902:91b:b0:e30:c739:8e5a with SMTP id
 3f1490d57ef6-e38f8afbf9emr2087598276.14.1732262953834; Fri, 22 Nov 2024
 00:09:13 -0800 (PST)
MIME-Version: 1.0
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
 <20241121122603.736267-6-arun.r.murthy@intel.com>
 <thqbnbw2yiqbfya7bh2izzf5qwr6fkir5m5luqkrhqj6vnltad@w2562fgo75g5>
 <IA0PR11MB730794BF402FC82BA5FEC1D4BA232@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB730794BF402FC82BA5FEC1D4BA232@IA0PR11MB7307.namprd11.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 10:09:02 +0200
Message-ID: <CAA8EJppXwCaYH9dNjTq7B0M5XF7p7VECHZH3=Fq-7fUuf7T++w@mail.gmail.com>
Subject: Re: [PATCHv6 5/8] drm/i915/histogram: Add crtc properties for global
 histogram
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 22 Nov 2024 at 06:25, Murthy, Arun R <arun.r.murthy@intel.com> wrote:
>
> > On Thu, Nov 21, 2024 at 05:56:00PM +0530, Arun R Murthy wrote:
> > > CRTC properties have been added for enable/disable histogram, reading
> > > the histogram data and writing the IET data.
> > > "HISTOGRAM_EN" is the crtc property to enable/disable the global
> > > histogram and takes a value 0/1 accordingly.
> > > "Histogram" is a crtc property to read the binary histogram data.
> > > "Global IET" is a crtc property to write the IET binary LUT data.
> > >
> > > v2: Read the histogram blob data before sending uevent (Jani)
> > > v3: use drm_property_replace_blob_from_id (Vandita)
> > >     Add substruct for histogram in intel_crtc_state (Jani)
> > > v4:  Rebased after addressing comments on patch 1
> > > v5: histogram check with old/new crtc_state (Suraj)
> > > v6: Rebase
> > >
> > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_atomic.c   |   5 +
> > >  drivers/gpu/drm/i915/display/intel_crtc.c     | 166 +++++++++++++++++-
> > >  drivers/gpu/drm/i915/display/intel_crtc.h     |   5 +
> > >  drivers/gpu/drm/i915/display/intel_display.c  |  16 ++
> > >  .../drm/i915/display/intel_display_types.h    |  13 ++
> > >  .../gpu/drm/i915/display/intel_histogram.c    |   6 +
> > >  6 files changed, 210 insertions(+), 1 deletion(-)
> >
> > Please provide the documentation for these properties: binary format, etc. Also,
> > ideally such a properties should be defined in a vendor-neutral way, so that
> > other drivers also can implement support for similar functionality.
> >
> I assumed that there are no other users of this histogram. Hence had it internal to i915 driver.
> Will move these properties to drm-crtc, making it useable by other users as well.

There are no users for the Intel histogram format. However other
vendors can provide similar functionality to enhance visual quality
depending on the image contents and ambient light. Please define the
properties in a generic way, letting other vendors be able to
implement similar functionality.

-- 
With best wishes
Dmitry
