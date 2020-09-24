Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F55A276E23
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 12:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9026E1A5;
	Thu, 24 Sep 2020 10:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768696E1A5;
 Thu, 24 Sep 2020 10:05:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e16so3165370wrm.2;
 Thu, 24 Sep 2020 03:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GG8bfjz/s6f/CPKl8ZyarthHKD/sG+1MlizQqu/13z8=;
 b=kczJp1pAGsl+0dX7wzioBUr6mfQ1/nIDywTeMYl9LsVMxHWhVTDH+vucuqVlrKkan9
 EWhVqOh+4q9l4O8gFRc7ET9+MRi4USgY70BL3JN/oDuFQVQozrcjrwDmZP9KfcOnO3VE
 SyiA/8BFlf1rZqcuqHR7cNbB9BY0oBLm88WjPREzGXRgCMw3E02GEx8ZIJc030H93WW3
 IPoF9Ou0VPsZ6PTTFaz14ZzjJn3lZoLVTjGMOmIXjiciakFiOoYSIdo8ZaT5fTYGPgjk
 V30pQrxCIBgn0dpwgLQfg5bFEMYoxNM+d5fpRh99eqAV3XFqW8N2qsY4eZsSjsLCB2kx
 AXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GG8bfjz/s6f/CPKl8ZyarthHKD/sG+1MlizQqu/13z8=;
 b=ZVuGXUYdKltbwrc++2hiZAFweOT++xClliUYTNcFH4fkSI+Xm/h4WZVrQTCw4i0i/l
 2tN5yGRlr5yPjkpjKXP57XT4DHEaR+aX/FpzQOcl1ppEvd3V9V6jVMVwaZRWU+dlpiIG
 YCwt37CU3bxy/O+Rgj6Ppgf4xP7yJCsFnXooJZnUdFyp/JWPejk3aJUF/64YfMoYQoww
 VW+IKpMll+j79JCl6WzyHEv03B5jf1ARMJn0reL+rTKJYbWUZ6yDdmUps/EK2Zlvkyil
 JiX3Fke6GDme81dZ12SGvYd28kJznbekUPq2X07NwJ4V9JT+NEzjmiI4jTWeBJ7SlzaF
 y3pQ==
X-Gm-Message-State: AOAM531Kuyixxa/tXwrOgMmzPkyx9q9ZyVM2U6/69bianIgJ7L9FyrQx
 qPD1VKyrokUafB4m9gqNxX6sLjKvlWA=
X-Google-Smtp-Source: ABdhPJznB//62vvEHHIalj/BnbEmCpwgf4YHcThO7kiim9KNcD2w1WrPueqknlQpnR8Pi6zFr9kRKg==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr4102541wrm.375.1600941912086; 
 Thu, 24 Sep 2020 03:05:12 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id a17sm3187620wra.24.2020.09.24.03.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 03:05:10 -0700 (PDT)
Date: Thu, 24 Sep 2020 12:05:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Nouveau] [PATCH 0/6] drm/nouveau: Support sync FDs and sync
 objects
Message-ID: <20200924100509.GD2483160@ulmo>
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
 <20200923091853.GA1229032@ulmo>
 <20200923152124.GO438822@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20200923152124.GO438822@phenom.ffwll.local>
User-Agent: Mutt/1.14.7 (2020-08-29)
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0240878589=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0240878589==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline


--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 05:21:24PM +0200, Daniel Vetter wrote:
> On Wed, Sep 23, 2020 at 11:18:53AM +0200, Thierry Reding wrote:
> > On Fri, Aug 28, 2020 at 12:40:10PM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >=20
> > > Hi,
> > >=20
> > > This series implements a new IOCTL to submit push buffers that can
> > > optionally return a sync FD or sync object to userspace. This is usef=
ul
> > > in cases where userspace wants to synchronize operations between the =
GPU
> > > and another driver (such as KMS for display). Among other things this
> > > allows extensions such as eglDupNativeFenceFDANDROID to be implemente=
d.
> > >=20
> > > Note that patch 4 modifies the ABI introduced in patch 3 by allowing =
DRM
> > > sync objects to be passed rather than only sync FDs. It also allows a=
ny
> > > number of sync FDs/objects to be passed in or emitted. I think those =
are
> > > useful features, but I left them in a separate patch in case everybody
> > > else thinks that this won't be needed. If we decide to merge the new =
ABI
> > > then patch 4 should be squashed into patch 3.
> > >=20
> > > The corresponding userspace changes can be found here:
> > >=20
> > >   libdrm: https://gitlab.freedesktop.org/tagr/drm/-/commits/nouveau-s=
ync-fd-v2/
> > >   mesa: https://gitlab.freedesktop.org/tagr/mesa/-/commits/nouveau-sy=
nc-fd/
> > >=20
> > > I've verified that this works with kmscube's --atomic mode and Weston.
> >=20
> > Hi Ben,
> >=20
> > any thoughts on this series? I realize that this is somewhat suboptimal
> > because we're effectively adding a duplicate of the existing IOCTL with
> > only the "minor" extension of adding sync FDs/objects, but at the same
> > time I don't have any good ideas on what else to add to make this more
> > appealing or if you have any plans of your own to address this in the
> > future.
>=20
> drm core automatically zero-extends ioctl structs both ways, so if all you
> do is add more stuff to the top level ioctl struct at the bottom, there's
> no need to duplicate any code. At least as long as you guarantee that 0 =
=3D=3D
> old behaviour for both in and out parameters.

But that only works if the structure size remains fixed, right? In this
case, however, we have to extend the structure with additional fields,
so the size is going to change and therefore the IOCTL number will also
change.

Thierry

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9sb1UACgkQ3SOs138+
s6HZ8w/8CIpOGWCol7KAZUj4+fPZb9zZBd+XXqsTOldX4uiM5+eyC8PZn6mIElnr
k5E+Hr5gRAZGPFnjH6wXMIyg8vGk54RNHHH4qrDWfI9dT6O/dMhtRIB4fsS8iF1X
FQc2lgftmvaojFLnxHV4lKDO8IB74B0jexTEKtzjobIzbnYaAwMU0WT/UCwZtpmu
rn8PedXVHsSxEns/vzB3NkjdofsUfKVmxncxiZIn324ImwCcF1UpRQBzX/1QyBww
3aMHUTAH8VYkxMDYw4aPlQ2O8V+1vbnnDm2hegK6Ie7wd1S6EAqzfQVXSWo/weCP
8kcx+ghEDODhXJpK5cy2jUb1b+sxg08q8dFHtdbAQiy/QXmwqE9JYaOOZhrVOJF3
P1OzmqyDomrbCl6zU8kcXoAasVhf3OjZmA0iXuphHD3vWrAGvqhE0pwWxeOV+Ttw
+W6sRDAY0WjrEynEGqgCQiJvZ+1h4WgezXslgnbhx0NQW7xp8pFJpoCWBMzO8SNn
LzaawSgO38hF0YgqwBOhRHb5kmk3GnPxk86c001gkaKNza8/sWa8zcTKk8sGFH4V
ryGEM29HxjKhFmrN1MDMC3OXo2o7hrtytYKSLzxN+6L1YHrVU+YoNFnA1Qjn6PCu
EYO256IQoDJNBe5I3pbyOAiZF+pt/9mKMHARJh+BU/92InYhURE=
=sR60
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--

--===============0240878589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0240878589==--
