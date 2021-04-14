Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC0135F93A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 18:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD386E4B0;
	Wed, 14 Apr 2021 16:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D5C6E4AF;
 Wed, 14 Apr 2021 16:48:36 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g17so23801787edm.6;
 Wed, 14 Apr 2021 09:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=r0bzpAl7tG3hNy3+ubhna8pWO1wp4i5XGAlOvSkxKKw=;
 b=cf7g4bFZ3VAE90m8+m65I81pkq9OMgmbijW9hYrUyh015BgJquJNQIcUPC+QmqzEwE
 giBODc7NyhmLDWFhcdksD9uXdtP+HerXU7vV2ubNqTv7wN8dZz0Fxoyap1Ns0OGVw6Yn
 yV/9NUCdPbMH1XNbQAAT9eQDNtAXF1k5VobAJ/Vb35SZZBN2JFoh7LNLc+jcRZ41mdqa
 le6Q3JGng0UrlgKzQZXfFSgqkQE2qBtVKG2EroCLOtAr2yhPvYkvI552DUrTLK3MdB9s
 Tk8FLIdhce+VaeACDyJkBJy1eYjSdvEPnR5j2uZgh3RHMfv+enyDbG3/o3AjymvMKAF3
 T9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=r0bzpAl7tG3hNy3+ubhna8pWO1wp4i5XGAlOvSkxKKw=;
 b=lGaE+r/LhaGBXkyStIz0i92vs/vI/+jP1W81WqyGBU2OqRnNvAGScZbZB0Gpe+8I2H
 maWpnnmEgS8yd55By300ZhNqj+zAMt8TvB9x2em8Bui91b9AoRyw3DMctHHsndT7FA/C
 GsW5KzepCMBmXAws1BF48kRIuQJKMloce4ig5xX7I9HmSOe4KeCa2fwo2gIg600H4SfL
 yYyGHuFIWJcXzwUsgS5X5qWa5GlT+wyjfyVkjSgsinOltJrhAGLiCfe3UU6yhZjmikVb
 ZvDFOBsZ/rx+jiIr3zCifMfI5IC7gKHNuCUognFBFKB3R91V9Ef6vc7OxixW3YzbEMGl
 YQHg==
X-Gm-Message-State: AOAM530wXGj5pGNRMH7TCo4mXg8/kOx0XjkgVZu15pqTeU4rINQ6hJjy
 rOXDCt7XyxbWlcV5bYMpENg=
X-Google-Smtp-Source: ABdhPJykQp7il+4KYm9wSR8S1JVn4lNnkt58l13XS5bCps2AxbOUN3I1DT21hN72SdazTYT4qVolgQ==
X-Received: by 2002:a05:6402:84e:: with SMTP id
 b14mr42567828edz.194.1618418915571; 
 Wed, 14 Apr 2021 09:48:35 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id cd14sm41455ejb.53.2021.04.14.09.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 09:48:31 -0700 (PDT)
Date: Wed, 14 Apr 2021 18:49:12 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 03/30] drm/tegra: Don't register DP AUX channels before
 connectors
Message-ID: <YHcdCAQ7Dlb2vSzn@orome.fritz.box>
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-4-lyude@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210219215326.2227596-4-lyude@redhat.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1283824523=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1283824523==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eiuRjVaD2c1rx8vu"
Content-Disposition: inline


--eiuRjVaD2c1rx8vu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 04:52:59PM -0500, Lyude Paul wrote:
> As pointed out by the documentation for drm_dp_aux_register(),
> drm_dp_aux_init() should be used in situations where the AUX channel for a
> display driver can potentially be registered before it's respective DRM
> driver. This is the case with Tegra, since the DP aux channel exists as a
> platform device instead of being a grandchild of the DRM device.
>=20
> Since we're about to add a backpointer to a DP AUX channel's respective D=
RM
> device, let's fix this so that we don't potentially allow userspace to use
> the AUX channel before we've associated it with it's DRM connector.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 105fb9cdbb3b..ea56c6ec25e4 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -534,9 +534,7 @@ static int tegra_dpaux_probe(struct platform_device *=
pdev)
>  	dpaux->aux.transfer =3D tegra_dpaux_transfer;
>  	dpaux->aux.dev =3D &pdev->dev;
> =20
> -	err =3D drm_dp_aux_register(&dpaux->aux);
> -	if (err < 0)
> -		return err;
> +	drm_dp_aux_init(&dpaux->aux);

I just noticed that this change causes an error on some setups that I
haven't seen before. The problem is that the SOR driver tries to grab a
reference to the I2C device to make sure it doesn't go away while it has
a pointer to it.

However, since now the I2C adapter hasn't been registered yet, I get
this:

	[   15.013969] kobject: '(null)' (000000005c903e43): is not initialized, y=
et kobject_get() is being called.

I recall that you wanted to make this change so that a backpointer to
the DRM device could be added (I think that's patch 15 of the series),
but I didn't see that patch get merged, so it's a bit difficult to try
and fix this up.

Has the situation changed? Do we no longer need the backpointer? If we
still want it, what's the plan for merging the change? Should I work
under the assumption that patch will make it in sometime and try to fix
this on top of that?

I'm thinking that perhaps we can move the I2C adapter registration into
drm_dp_aux_init() since that's independent of the DRM device. It would
also make a bit more sense from the Tegra driver's point of view where
all devices would be created during the ->probe() path, and only during
the ->init() path would the connection between DRM device and DRM DP AUX
device be established.

Thierry

--eiuRjVaD2c1rx8vu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmB3HQUACgkQ3SOs138+
s6FCfw/+OhxXxUnm7yvFpRYVz6qtWvK3jrKBnpjwoVxK0Se6Ie1T+S0pwhbCs12U
EasB8CA90aWXlZB8mW6YE5cYkNhHBba//ttCXmMKOeZTYMPax6uA0cL6K8KG8ocC
WRiWKktiu7T0U0p/kDnnTWum6VoGmT8Anik8jgMB0ZWvsmD8NdX7FrZiNbCTfoTd
7VyPPrCA7dheeQyJAnJimkH0Jf7Adhadigi1w5QEEVgZRVnu8T82yW5vSt2suqaX
FfMT3e3x07dfzZ75cSmjztcQ47KDu2Kt/XuY+srFfJvaRY3QSPbXSMj5cmVVBp35
LGPnR6HHFSVJ5G4vtEVErQWMUtFx3rZ7QxbpT7XPZBajFzLXD38Jdz5nNVBFcOqj
mWuzXVlyV/7fb71LUW4x9KHXa2CfyUCwG/I+Ll99F3/r0Pj/h2o2OYQVkUUrB4N5
HGDrZzSqmodMu/Uljpnj2AHNhNea4w6DGgFyfFE2msHINk2ZUUJYkDrWNtZqCXRf
qQo8Rpne94/b5dyL/7z5BSTdkGPNmn/EryEU+9rJKX0UJ6ifR+AF1dfxp6k/n3lS
bMcK171tYk7K91Y+zZJaaHlhcUmPebZbR9QxLuHiIRuAZLeVMBrKQrid3H+z9nDI
oymuuRMdr506u8OcG+g3W6GLb4VKW/XYZKHITWXy5g0fQoArBD8=
=f8nJ
-----END PGP SIGNATURE-----

--eiuRjVaD2c1rx8vu--

--===============1283824523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1283824523==--
