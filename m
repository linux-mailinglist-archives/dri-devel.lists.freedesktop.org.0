Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 917A11595D8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 18:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161B96E02F;
	Tue, 11 Feb 2020 17:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EE16E02F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 17:02:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k11so13293564wrd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 09:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3R9Yae05oMwB+6rODdVuzCeJG7eybKxFzo4VVXSkB6M=;
 b=Uf6lwNUR1Ud/dQ0z1+UxHFVPD56GxEWIj0KA2E4A1d1Ea9DDRN03maxXpf5xB7MhN3
 fliY1vKy4BMoMJbhZLjWrSxF0hozgNXHBwr8Vg2+MNuNHt8uHlM4ILmsr0tYSbFWdxr3
 fe8pp8pDOVFmj2bbAxVWeknRLtoFfkoYRJsVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3R9Yae05oMwB+6rODdVuzCeJG7eybKxFzo4VVXSkB6M=;
 b=QBrkSjHoI2NjS6s7gWh6CUwkU27C9FUINZpom/ULq/a5jauR955ZxiftPhBLr9Kq+y
 otQ727Yl2pQh1LGDeZkeaLgWdm5VXt6e4c9O1AkUiW0+do9123bKwjLXKD3EEaDPwjWk
 oqnGC+0nRRCgKJZfn4vPnXUYItHnnYZHlCwM/KX1ERPIt1Fv6BmIc3LtPJLpP5v0Fm4S
 Wfi0MaXaHFzJK9wfxgX85Iw6cH5Fo/q1hNvGAvbNaamaEr8izsRRPuBj5lbtL58jwIxh
 poHQZ1NMXQvOL8r3Ddv6pKAqw3M1amg433GNULBQsMsNJgbwAIPmCsZrS9bYckzcaUDO
 jF+w==
X-Gm-Message-State: APjAAAWzms4KvXLwNYA2Mm+m2rD3w9OFBAVu4M4O+xlkjMhsW+c4Ux3m
 BNmIfg4gMDeDNV9zClOFzFa72y5LvYI=
X-Google-Smtp-Source: APXvYqxRiMLj9baAWBBP0koFCvwdrFel/5+tec/2tMw1l3p7xsth7R5LrGB9fX8P0kbN1ASuIXocLQ==
X-Received: by 2002:a5d:5148:: with SMTP id u8mr9919627wrt.132.1581440556852; 
 Tue, 11 Feb 2020 09:02:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x11sm4469923wmg.46.2020.02.11.09.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 09:02:35 -0800 (PST)
Date: Tue, 11 Feb 2020 18:02:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 5/7] drm: Validate encoder->possible_clones
Message-ID: <20200211170233.GL2363188@phenom.ffwll.local>
References: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
 <20200211162208.16224-6-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211162208.16224-6-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 06:22:06PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Many drivers are populating encoder->possible_clones wrong. Let's
> persuade them to get it right by adding some loud WARNs.
> =

> We'll cross check the bits between any two encoders. So either
> both encoders can clone with the other, or neither can.
> =

> We'll also complain about effectively empty possible_clones, and
> possible_clones containing bits for encoders that don't exist.
> =

> v2: encoder->possible_clones now includes the encoder itelf
> v3: Move to drm_mode_config_validate() (Daniel)
>     Document that you get a WARN when this is wrong (Daniel)
>     Extract full_encoder_mask()
> =

> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

I wonder whether we should start to have some unit tests for stuff like
this, like set up broken driver, make sure we have a WARN in dmesg. But
ideally we'd do that with the mocking stuff Kunit hopefully has soon.

</idle musings>


> ---
>  drivers/gpu/drm/drm_mode_config.c | 40 +++++++++++++++++++++++++++++++
>  include/drm/drm_encoder.h         |  2 ++
>  2 files changed, 42 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index 75e357c7e84d..afc91447293a 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -533,6 +533,17 @@ void drm_mode_config_cleanup(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_mode_config_cleanup);
>  =

> +static u32 full_encoder_mask(struct drm_device *dev)
> +{
> +	struct drm_encoder *encoder;
> +	u32 encoder_mask =3D 0;
> +
> +	drm_for_each_encoder(encoder, dev)
> +		encoder_mask |=3D drm_encoder_mask(encoder);
> +
> +	return encoder_mask;
> +}
> +
>  /*
>   * For some reason we want the encoder itself included in
>   * possible_clones. Make life easy for drivers by allowing them
> @@ -544,10 +555,39 @@ static void fixup_encoder_possible_clones(struct dr=
m_encoder *encoder)
>  		encoder->possible_clones =3D drm_encoder_mask(encoder);
>  }
>  =

> +static void validate_encoder_possible_clones(struct drm_encoder *encoder)
> +{
> +	struct drm_device *dev =3D encoder->dev;
> +	u32 encoder_mask =3D full_encoder_mask(dev);
> +	struct drm_encoder *other;
> +
> +	drm_for_each_encoder(other, dev) {
> +		WARN(!(encoder->possible_clones & drm_encoder_mask(other)) !=3D
> +		     !(other->possible_clones & drm_encoder_mask(encoder)),

Bikeshed: !! as canonical "make this a bool value" might be slightly
clearer, but whatever.

> +		     "possible_clones mismatch: "
> +		     "[ENCODER:%d:%s] mask=3D0x%x possible_clones=3D0x%x vs. "
> +		     "[ENCODER:%d:%s] mask=3D0x%x possible_clones=3D0x%x\n",
> +		     encoder->base.id, encoder->name,
> +		     drm_encoder_mask(encoder), encoder->possible_clones,
> +		     other->base.id, other->name,
> +		     drm_encoder_mask(other), other->possible_clones);
> +	}
> +
> +	WARN((encoder->possible_clones & drm_encoder_mask(encoder)) =3D=3D 0 ||
> +	     (encoder->possible_clones & ~encoder_mask) !=3D 0,
> +	     "Bogus possible_clones: "
> +	     "[ENCODER:%d:%s] possible_clones=3D0x%x (full encoder mask=3D0x%x)=
\n",
> +	     encoder->base.id, encoder->name,
> +	     encoder->possible_clones, encoder_mask);
> +}

Since it's next to each another double-checking that the fixup did add the
self-clone is probably too much :-)

> +
>  void drm_mode_config_validate(struct drm_device *dev)
>  {
>  	struct drm_encoder *encoder;
>  =

>  	drm_for_each_encoder(encoder, dev)
>  		fixup_encoder_possible_clones(encoder);
> +
> +	drm_for_each_encoder(encoder, dev)
> +		validate_encoder_possible_clones(encoder);

>  }
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index 22d6cdf729f1..3741963b9587 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -163,6 +163,8 @@ struct drm_encoder {
>  	 * any cloning it can leave @possible_clones set to 0. The core will
>  	 * automagically fix this up by setting the bit for the encoder itself.
>  	 *
> +	 * You will get a WARN if you get this wrong in the driver.

Nice.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +	 *
>  	 * Note that since encoder objects can't be hotplugged the assigned ind=
ices
>  	 * are stable and hence known before registering all objects.
>  	 */
> -- =

> 2.24.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
