Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5582115A40D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3449D6EAA3;
	Wed, 12 Feb 2020 08:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D0A6F47B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 08:56:12 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t14so1209014wmi.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 00:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fZLfN1A8wGvUmLpTKYwlPz3A9akg5ELuTOpwQWDY3RA=;
 b=O1U2Rw2uU6Q44Cc9zv9BVJ1dwMo/WkF1pKfrv0Y5nVqbK9YpTt5wfpZt8PWf1YnLwL
 kW7wOCuoEU0ZG2tcD7l2tiD/FGakg2rNdpYUPMfQMT88264i4glmCPacojL5lSiXknF4
 uyKY6V3/GkaEuG3+5U+sV5P4mH4iKC/xDh7KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fZLfN1A8wGvUmLpTKYwlPz3A9akg5ELuTOpwQWDY3RA=;
 b=QMxU7RvJAsoS/D4+WGmmpIZ6wCBPhXs9Ve4P6+aPO56i6dLAT/78Vm+5HB32NV+VKU
 jdbgYPbk46/kkE7QTVqEWPUEyEtyXz5NAJqJy+fVU7hRweSZSjy2vsSXLFOu5545YxNB
 TVwxFBuVAikOMt/8oviJA3GkfWqHpo0DAJ0Q3OJUWBIToduR2/wkq21qIzdCnp9deI7n
 06znO3VfAxjbI+pn3bwiAw1XuHE1gU1os4gPA2cdRtW2LzRnNO6c39u70j4iSqj2C+be
 Cr5CqaSP8HHfqfknl4ySCxBGAkY+H+iIdJCj7Yp25AiraOv0f3sgp9LJKyFf8yQ4R5vQ
 6pjg==
X-Gm-Message-State: APjAAAVojnpSBDKLBABFM4YSvStvWM5xP5Wa9oZJ8yMCIZXriO71LC3q
 OhJNux2SL9YRL2ts0aPyHk2P+w==
X-Google-Smtp-Source: APXvYqzBNULp/7HBW0sBpVlNdMHj9QNvlSv2d0lvqBMQdfAIjY52XzUaucAwxPps/o05BmW8btvB5Q==
X-Received: by 2002:a05:600c:d5:: with SMTP id
 u21mr11487840wmm.98.1581497771342; 
 Wed, 12 Feb 2020 00:56:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y139sm7797248wmd.24.2020.02.12.00.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 00:56:10 -0800 (PST)
Date: Wed, 12 Feb 2020 09:56:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 5/7] drm: Validate encoder->possible_clones
Message-ID: <20200212085608.GO2363188@phenom.ffwll.local>
References: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
 <20200211162208.16224-6-ville.syrjala@linux.intel.com>
 <20200211170233.GL2363188@phenom.ffwll.local>
 <20200211171331.GY13686@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211171331.GY13686@intel.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 07:13:31PM +0200, Ville Syrj=E4l=E4 wrote:
> On Tue, Feb 11, 2020 at 06:02:33PM +0100, Daniel Vetter wrote:
> > On Tue, Feb 11, 2020 at 06:22:06PM +0200, Ville Syrjala wrote:
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > =

> > > Many drivers are populating encoder->possible_clones wrong. Let's
> > > persuade them to get it right by adding some loud WARNs.
> > > =

> > > We'll cross check the bits between any two encoders. So either
> > > both encoders can clone with the other, or neither can.
> > > =

> > > We'll also complain about effectively empty possible_clones, and
> > > possible_clones containing bits for encoders that don't exist.
> > > =

> > > v2: encoder->possible_clones now includes the encoder itelf
> > > v3: Move to drm_mode_config_validate() (Daniel)
> > >     Document that you get a WARN when this is wrong (Daniel)
> > >     Extract full_encoder_mask()
> > > =

> > > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > I wonder whether we should start to have some unit tests for stuff like
> > this, like set up broken driver, make sure we have a WARN in dmesg. But
> > ideally we'd do that with the mocking stuff Kunit hopefully has soon.
> > =

> > </idle musings>
> > =

> > =

> > > ---
> > >  drivers/gpu/drm/drm_mode_config.c | 40 +++++++++++++++++++++++++++++=
++
> > >  include/drm/drm_encoder.h         |  2 ++
> > >  2 files changed, 42 insertions(+)
> > > =

> > > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_=
mode_config.c
> > > index 75e357c7e84d..afc91447293a 100644
> > > --- a/drivers/gpu/drm/drm_mode_config.c
> > > +++ b/drivers/gpu/drm/drm_mode_config.c
> > > @@ -533,6 +533,17 @@ void drm_mode_config_cleanup(struct drm_device *=
dev)
> > >  }
> > >  EXPORT_SYMBOL(drm_mode_config_cleanup);
> > >  =

> > > +static u32 full_encoder_mask(struct drm_device *dev)
> > > +{
> > > +	struct drm_encoder *encoder;
> > > +	u32 encoder_mask =3D 0;
> > > +
> > > +	drm_for_each_encoder(encoder, dev)
> > > +		encoder_mask |=3D drm_encoder_mask(encoder);
> > > +
> > > +	return encoder_mask;
> > > +}
> > > +
> > >  /*
> > >   * For some reason we want the encoder itself included in
> > >   * possible_clones. Make life easy for drivers by allowing them
> > > @@ -544,10 +555,39 @@ static void fixup_encoder_possible_clones(struc=
t drm_encoder *encoder)
> > >  		encoder->possible_clones =3D drm_encoder_mask(encoder);
> > >  }
> > >  =

> > > +static void validate_encoder_possible_clones(struct drm_encoder *enc=
oder)
> > > +{
> > > +	struct drm_device *dev =3D encoder->dev;
> > > +	u32 encoder_mask =3D full_encoder_mask(dev);
> > > +	struct drm_encoder *other;
> > > +
> > > +	drm_for_each_encoder(other, dev) {
> > > +		WARN(!(encoder->possible_clones & drm_encoder_mask(other)) !=3D
> > > +		     !(other->possible_clones & drm_encoder_mask(encoder)),
> > =

> > Bikeshed: !! as canonical "make this a bool value" might be slightly
> > clearer, but whatever.
> =

> Can repaint.
> =

> > =

> > > +		     "possible_clones mismatch: "
> > > +		     "[ENCODER:%d:%s] mask=3D0x%x possible_clones=3D0x%x vs. "
> > > +		     "[ENCODER:%d:%s] mask=3D0x%x possible_clones=3D0x%x\n",
> > > +		     encoder->base.id, encoder->name,
> > > +		     drm_encoder_mask(encoder), encoder->possible_clones,
> > > +		     other->base.id, other->name,
> > > +		     drm_encoder_mask(other), other->possible_clones);
> > > +	}
> > > +
> > > +	WARN((encoder->possible_clones & drm_encoder_mask(encoder)) =3D=3D =
0 ||
> > > +	     (encoder->possible_clones & ~encoder_mask) !=3D 0,
> > > +	     "Bogus possible_clones: "
> > > +	     "[ENCODER:%d:%s] possible_clones=3D0x%x (full encoder mask=3D0=
x%x)\n",
> > > +	     encoder->base.id, encoder->name,
> > > +	     encoder->possible_clones, encoder_mask);
> > > +}
> > =

> > Since it's next to each another double-checking that the fixup did add =
the
> > self-clone is probably too much :-)
> =

> I changed the fixup to be just
> if (possible_clones =3D=3D 0)
> 	possible_clones =3D drm_encoder_mask();
> =

> So if the driver tries to set it up but fails and forgets the
> encoder itself this WARN will still trip.

Duh, I was just blind, everything is looking good.
-Daniel

> =

> > =

> > > +
> > >  void drm_mode_config_validate(struct drm_device *dev)
> > >  {
> > >  	struct drm_encoder *encoder;
> > >  =

> > >  	drm_for_each_encoder(encoder, dev)
> > >  		fixup_encoder_possible_clones(encoder);
> > > +
> > > +	drm_for_each_encoder(encoder, dev)
> > > +		validate_encoder_possible_clones(encoder);
> > =

> > >  }
> > > diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> > > index 22d6cdf729f1..3741963b9587 100644
> > > --- a/include/drm/drm_encoder.h
> > > +++ b/include/drm/drm_encoder.h
> > > @@ -163,6 +163,8 @@ struct drm_encoder {
> > >  	 * any cloning it can leave @possible_clones set to 0. The core will
> > >  	 * automagically fix this up by setting the bit for the encoder its=
elf.
> > >  	 *
> > > +	 * You will get a WARN if you get this wrong in the driver.
> > =

> > Nice.
> > =

> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > =

> > > +	 *
> > >  	 * Note that since encoder objects can't be hotplugged the assigned=
 indices
> > >  	 * are stable and hence known before registering all objects.
> > >  	 */
> > > -- =

> > > 2.24.1
> > > =

> > =

> > -- =

> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> =

> -- =

> Ville Syrj=E4l=E4
> Intel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
