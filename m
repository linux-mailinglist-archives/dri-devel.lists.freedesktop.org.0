Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F9462FA3F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 17:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0826A10E735;
	Fri, 18 Nov 2022 16:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75E210E735
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 16:28:52 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ft34so14203839ejc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 08:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o7I/f2EYSr3aJDY2Ej4kxRkx+eOd+B9qRwYtt2bgbF8=;
 b=OPhkeX3iNWjD5Mtu/rObm8ROZEJODP95/EGbud4/PkX8qR3EJLFOIhUtSIFfOzssj4
 Tb5yYyihdCuXfUXugmdCEO1MT8Cld6zGIEKpVGI8xD4Jikk2pQgG8SIyIPaFjMH+69J5
 FaWgshB9eNDZDUWmhgWqSaYn10grz/qLmNhDST5BhfYZHuwfaTrweyQH8Jbug3m1bRPG
 +9EalGb/X4zcsgNm9+948ZGPWWqCd60lmWQnPFy2G/gN0Ka7M+iTFD2MllsnJkpG5m1K
 NZeLXFzDhQo9qEAljAr2moCIJPbxeOVPxggSr6o/Rs2BOFjO/cooKHU0Lwp3JQHzKb9q
 /vVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o7I/f2EYSr3aJDY2Ej4kxRkx+eOd+B9qRwYtt2bgbF8=;
 b=2sTuXzvU5fMwyKujWRmFJBl6H6iRQMGznkGGRQei29BaSfGQ0Jxx/VDTK7KCOs9Aom
 9vrGan754map+LgFs/omMNE5gBp40P7kDQXykxlm5trJ2M7Q+fKGHK0aIrOBuh4Bn+bd
 Ds8KNhFSOVBvo1Xut2bz2BEYH4r0hArHm0EqRY+QgFVUn0Yjrc/alZV2De8iQtk9vtLo
 msVshHifCeo8fT4nXThq8AbOWZIhW01OnAWiqm6A9ToNICfncTAjdaJoYrw2CzD49tWJ
 Nel4Ww/PiECz2H95rkFjf9sktEBzq15eiQX3llof/2yGLnDkaE53WboaZEbTxxvJ5OIz
 U1KQ==
X-Gm-Message-State: ANoB5pmjBkG2NdfXH1p9muvi/bTV2dO2zn5DogQwnNf4TziO6+di5gf9
 flOWDFVcqvF1oMRs2D1XCnM=
X-Google-Smtp-Source: AA0mqf6Pmuli5f8rC5IpgUIcdVFB8XjOrpzL+LKn0ukItpVfKInpCgIuS6Sb3TU3CGdu0XIRCkSk1g==
X-Received: by 2002:a17:906:28d5:b0:7ad:88f8:68fb with SMTP id
 p21-20020a17090628d500b007ad88f868fbmr6755968ejd.277.1668788931124; 
 Fri, 18 Nov 2022 08:28:51 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 l19-20020aa7cad3000000b0045bd257b307sm1978015edt.22.2022.11.18.08.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 08:28:50 -0800 (PST)
Date: Fri, 18 Nov 2022 17:28:48 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 5/8] drm/simpledrm: Add support for system memory
 framebuffers
Message-ID: <Y3eywMZMGOG8wx/f@orome>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-6-thierry.reding@gmail.com>
 <053fbbc2-824d-648b-fdac-6f6c7c64181d@suse.de>
 <Y3em7dwyJgQI1vZw@orome>
 <9bf3dde1-dbbf-a03f-6659-68ecd4fce8cf@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CiIa2B9WdSpqtTa2"
Content-Disposition: inline
In-Reply-To: <9bf3dde1-dbbf-a03f-6659-68ecd4fce8cf@suse.de>
User-Agent: Mutt/2.2.8 (2022-11-05)
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 David Airlie <airlied@redhat.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--CiIa2B9WdSpqtTa2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 04:54:31PM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 18.11.22 um 16:38 schrieb Thierry Reding:
> > On Fri, Nov 18, 2022 at 03:21:14PM +0100, Thomas Zimmermann wrote:
> > > Hi
> > >=20
> > > Am 17.11.22 um 19:40 schrieb Thierry Reding:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >=20
> > > > Simple framebuffers can be set up in system memory, which cannot be
> > > > requested and/or I/O remapped using the I/O resource helpers. Add a
> > > > separate code path that obtains system memory framebuffers from the
> > > > reserved memory region referenced in the memory-region property.
> > > >=20
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > > Changes in v3:
> > > > - simplify memory code and move back to simpledrm_device_create()
> > > > - extract screen_base iosys_map fix into separate patch
> > > >=20
> > > > Changes in v2:
> > > > - make screen base a struct iosys_map to avoid sparse warnings
> > > >=20
> > > >    drivers/gpu/drm/tiny/simpledrm.c | 99 ++++++++++++++++++++++++--=
------
> > > >    1 file changed, 75 insertions(+), 24 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tin=
y/simpledrm.c
> > > > index 3673a42e4bf4..7f39bc58da52 100644
> > > > --- a/drivers/gpu/drm/tiny/simpledrm.c
> > > > +++ b/drivers/gpu/drm/tiny/simpledrm.c
> > > > @@ -3,6 +3,7 @@
> > > >    #include <linux/clk.h>
> > > >    #include <linux/of_clk.h>
> > > >    #include <linux/minmax.h>
> > > > +#include <linux/of_address.h>
> > > >    #include <linux/platform_data/simplefb.h>
> > > >    #include <linux/platform_device.h>
> > > >    #include <linux/regulator/consumer.h>
> > > > @@ -184,6 +185,31 @@ simplefb_get_format_of(struct drm_device *dev,=
 struct device_node *of_node)
> > > >    	return simplefb_get_validated_format(dev, format);
> > > >    }
> > > > +static struct resource *
> > > > +simplefb_get_memory_of(struct drm_device *dev, struct device_node =
*of_node)
> > > > +{
> > > > +	struct device_node *np;
> > > > +	struct resource *res;
> > > > +	int err;
> > > > +
> > > > +	np =3D of_parse_phandle(of_node, "memory-region", 0);
> > > > +	if (!np)
> > > > +		return NULL;
> > > > +
> > > > +	res =3D devm_kzalloc(dev->dev, sizeof(*res), GFP_KERNEL);
> > > > +	if (!res)
> > > > +		return ERR_PTR(-ENOMEM);
> > > > +
> > > > +	err =3D of_address_to_resource(np, 0, res);
> > > > +	if (err)
> > > > +		return ERR_PTR(err);
> > > > +
> > > > +	if (of_get_property(of_node, "reg", NULL))
> > > > +		drm_warn(dev, "preferring \"memory-region\" over \"reg\" propert=
y\n");
> > >=20
> > > The reg property is converted to a device resource when we create the=
 device
> > > at [1].
> > >=20
> > > I have another question, which I was discussing with Javier recently.=
 Is it
> > > possible to handle memory-region there automatically? If, for exmaple=
, it
> > > would create a resource with IORESOURCE_CACHEABLE, simpledrm would ha=
ndle it
> > > as memory region. Without the CACHEABLE flag, it would be a regular r=
esource
> > > as before.
> >=20
> > memory-region properties are not typically converted into a standard
> > resource automatically. One reason may be that they can have additional
> > properties associated with them and so something like a CACHEABLE type
> > may not apply.
> >=20
> > It's also standard to convert "reg" properties into struct resource and
> > that's what many drivers will expect. I don't know if all drivers will
> > gracefully handle being passed a struct resource that was created in
> > this way from a memory-region property. If at all I think this would
> > need to be special-cased for simple-framebuffer, in which case I'm not
> > convinced that putting the special case into the core OF code is any
> > better than putting it into the simpledrm driver.
> >=20
> > Also, even if we did so, what would it really change? We may be able to
> > avoid the explicit DT lookup, but the bulk of the memory-region code is
> > actually mapping it, etc. That part we won't be able to automatically
> > handle, I think.
> >=20
> > Ultimately this is up to Rob, not sure if he'll want to extend the
> > simple-framebuffer node creation code any further.
>=20
> Thanks for explaining. It was simply something we wondered about.
>=20
> The simpledrm device driver hands over device ownership to the hardware's
> native driver during the boot process. To make this work in all cases, the
> OF code needs to be involved. So at some point, we'll need to move some of
> the memory-region code into the OF code. But how exactly this has to be d=
one
> can be discussed later.

Currently the simpledrm driver will be removed when the native driver is
loaded (on Tegra at least) and then the Tegra DRM driver will set itself
up from scratch and anything that simpledrm had set up will be discarded
after that.

The tentative plan for Tegra is to eventually take over the memory from
simpledrm (basically via the same memory-region mechanism) and copy it
into a native buffer and also adopt the display configuration so that
the transition can happen seamlessly. I'm not sure to what degree the OF
core needs to get involved. Once we have the reserved-memory region, we
don't really need OF anymore.

One thing I'm not sure about yet is what to do with the reserved-memory
region. Ideally I think we would want to return the memory to the buddy
allocator so that it can be reused. I'm not sure if that's possible or
how to do it, since most of the low-level memblock code that is
responsible for cleaning things up has already run at this point. We'd
probably need to manually return the buffer somehow (perhaps with
something like generic_online_page()). Alternatively we may also hang
onto the memory and reuse it in the native driver, though that could be
a bit messy since it can't be transparently handled like any other
buffer.

I could find a few drivers that use memory-region, but none of them seem
to return that region to the buddy allocator.

Thierry

--CiIa2B9WdSpqtTa2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmN3sr4ACgkQ3SOs138+
s6HCyxAAoS0QANMnQU8hIzcsWsXsCYTbA+B8t/1SwCuIVztwWZIygJN57VSJuk+u
oLkjRoXaNKfKWvVWOV/ty2LcWz9GzBVkwLupQsiMHNtcXq8J7cZcKb7GKI89zJwn
WG7VYqleK+URd1Vy5hUFEc6HtuIxZrBb1VLSiXDmgZufrQXnHTav6PXbwRjP14P0
xL/l2VpS9gi9kd8smqNYBylI5tE6vaCtpLyWAePHQShILQ4W1YTdZsRkbh/5gQhu
6N+Rvbpg6kB5PlM57gAP2CJlrAxwJaP+34Imgj73H791wjnGmkufzHVcZIkCq3ip
ltQsuNPuvPvdevDySQgVKxQWXcNMNvunW0wFsCGFd9GoH2QX9h39R6qMBwPqIN3u
Ikwb+FC4liC2AzqrWN/vRJ3/fT2aTSL0+7ZRgMZRz+s3tq83CiIHMusa7Lx5rM1B
CydQd8LiEZQgsufxmEu0fPYPwDi/CjOjqmKWE77LWpZgvpidNHTgUOi0mqwBXzB/
/kLXli877Uqjnf8IKlf6oxD3ypcfeHE8rx8LSM6fQ8dF5nTlrxniEwXUNRIRFyHN
U8Hp1vptrlEmtPosRHGnIR8YMJ19+fZQxnULhmdIQKIslfUqZxZbnIumrH7uei2V
lzZO7eeIZSRB4qDVLZUIV+yGHk3oLATomNARtKR07442W3V5rfg=
=Znn0
-----END PGP SIGNATURE-----

--CiIa2B9WdSpqtTa2--
