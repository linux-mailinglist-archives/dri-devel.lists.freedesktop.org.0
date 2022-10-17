Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C586011C3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 16:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F47E10E2EC;
	Mon, 17 Oct 2022 14:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F4F10E2EC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 14:54:55 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b12so16435378edd.6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 07:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KNRYnQIXZD12ifeqib/eSuOtg1/sOCJYNkgQ/L/PQpk=;
 b=ifG0dxXmK4XHTmo35qerQZnqtBqocMZsRTXS6Yj+AmBpTj1y0gBcTZ3wUoNRIwaTsR
 Ej1WOtjRCQS0ApWqceIHGBZ7bvyM5rQQKyVznlZ+7TGChHq20dOHeyAD1vp/7oorpfkF
 Bae7h/QMU3bp8IFQnboj7e2L+BfcDstuSqboBHaNonDhebusSB5q0zxxhM6f1sTb3IBC
 XxzcCIs9vD7cCfeTKA2jUh4BmD6PtqitbFP7EungCz06AnTqMgKSOqEY5W1meSQjUOXg
 P14nCI1C4QErMeDDzjyS6AZdW3h+vPo6aCal8KlG+K3LfHiMi2E/1290yiMClm1YBm++
 YATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KNRYnQIXZD12ifeqib/eSuOtg1/sOCJYNkgQ/L/PQpk=;
 b=b/4P1MNCGBCTRPPk1z6EuIY04D78Qx7Oyhg224+lpzKuXwdthvzjZZIWaFTk1Oqa4b
 23XTWaEHxgvgpo/3qd2Htb03T7sDQiqrZjdofn+C4hI+umjLjr+ltp0xEF4/5EEuv8Fe
 7TPvNeHBNPg2ygGweyuidfSJFQ3FtmqvDKB1mL0rykrw2tpmi1RVVS4X3rZzUc1GVlG9
 nrgbfvs4Zib6Yl3CDpkOin7kcBlck8FmTovE0Hrc/N+cH9Pb1PpFFIKf2g5sZB24S9DL
 ObK2Rc2x1Fk9JRv90jRSw5WFQzsup9fl2sV0PQgZLWnqPLOv1E9QDsnDQ1dMEuhiduPv
 4DkQ==
X-Gm-Message-State: ACrzQf2WKN67/x0KHCiO9OqWsuKz9XJul2cRHFUNkS4pIm06Py4ttrXc
 eDnI0JFd8lRCqAiqRIMpPh8=
X-Google-Smtp-Source: AMsMyM6SCOSCcM/PZrVkoPHako0i8wIFqO7ttD0OFRZXzvhI/CKxYW2ifg+6OREuAQ+EBMXlP3yxwg==
X-Received: by 2002:a05:6402:1911:b0:45c:be41:a879 with SMTP id
 e17-20020a056402191100b0045cbe41a879mr10622544edz.322.1666018494153; 
 Mon, 17 Oct 2022 07:54:54 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 kl24-20020a170907995800b00787f91a6b16sm6163939ejc.26.2022.10.17.07.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 07:54:52 -0700 (PDT)
Date: Mon, 17 Oct 2022 16:54:50 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/7] drm/simpledrm: Add support for system memory
 framebuffers
Message-ID: <Y01sunkDsQQQhXuC@orome>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-5-thierry.reding@gmail.com>
 <dd869713-6eb2-fadd-fdef-6ca155198a8c@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ThXErQYcM1siOf95"
Content-Disposition: inline
In-Reply-To: <dd869713-6eb2-fadd-fdef-6ca155198a8c@suse.de>
User-Agent: Mutt/2.2.7 (2022-08-07)
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ThXErQYcM1siOf95
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2022 at 10:12:34AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 07.10.22 um 14:49 schrieb Thierry Reding:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Simple framebuffers can be set up in system memory, which cannot be
> > requested and/or I/O remapped using the I/O resource helpers. Add a
> > separate code path that obtains system memory framebuffers from the
> > reserved memory region referenced in the memory-region property.
> >=20
> > v2: make screen base a struct iosys_map to avoid sparse warnings
>=20
> Conversion to iosys_map has to be a separate patch.

Okay. It seemed to make sense to put it into this patch because only
the other changes in this patch make this necessary. The non-__iomem
path was not previously used, so without this patch there's nothing
that needs fixing. Well, unless perhaps for semantic correctness.

> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   drivers/gpu/drm/tiny/simpledrm.c | 177 ++++++++++++++++++++++++-------
> >   1 file changed, 141 insertions(+), 36 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/si=
mpledrm.c
> > index 18489779fb8a..cf36f67d22e4 100644
> > --- a/drivers/gpu/drm/tiny/simpledrm.c
> > +++ b/drivers/gpu/drm/tiny/simpledrm.c
> > @@ -2,6 +2,7 @@
> >   #include <linux/clk.h>
> >   #include <linux/of_clk.h>
> > +#include <linux/of_reserved_mem.h>
> >   #include <linux/minmax.h>
> >   #include <linux/platform_data/simplefb.h>
> >   #include <linux/platform_device.h>
> > @@ -207,7 +208,9 @@ struct simpledrm_device {
> >   	unsigned int pitch;
> >   	/* memory management */
> > -	void __iomem *screen_base;
> > +	struct iosys_map screen_base;
> > +	phys_addr_t sysmem_start;
> > +	size_t sysmem_size;
> >   	/* modesetting */
> >   	uint32_t formats[8];
> > @@ -441,6 +444,106 @@ static int simpledrm_device_init_regulators(struc=
t simpledrm_device *sdev)
> >   }
> >   #endif
> > +/*
> > + * Memory management
> > + */
> > +
> > +static int simpledrm_device_init_mm_sysmem(struct simpledrm_device *sd=
ev, phys_addr_t start,
> > +					   size_t size)
> > +{
> > +	struct drm_device *dev =3D &sdev->dev;
> > +	phys_addr_t end =3D start + size - 1;
> > +	void *screen_base;
> > +
> > +	drm_info(dev, "using system memory framebuffer at [%pa-%pa]\n", &star=
t, &end);
> > +
> > +	screen_base =3D devm_memremap(dev->dev, start, size, MEMREMAP_WC);
> > +	if (!screen_base)
> > +		return -ENOMEM;
> > +
> > +	iosys_map_set_vaddr(&sdev->screen_base, screen_base);
> > +
> > +	return 0;
> > +}
> > +
> > +static int simpledrm_device_init_mm_io(struct simpledrm_device *sdev, =
phys_addr_t start,
> > +				       size_t size)
> > +{
> > +	struct drm_device *dev =3D &sdev->dev;
> > +	phys_addr_t end =3D start + size - 1;
> > +	void __iomem *screen_base;
> > +	struct resource *mem;
> > +
> > +	drm_info(dev, "using I/O memory framebuffer at [%pa-%pa]\n", &start, =
&end);
> > +
> > +	mem =3D devm_request_mem_region(dev->dev, start, size, sdev->dev.driv=
er->name);
> > +	if (!mem) {
> > +		/*
> > +		 * We cannot make this fatal. Sometimes this comes from magic
> > +		 * spaces our resource handlers simply don't know about. Use
> > +		 * the I/O-memory resource as-is and try to map that instead.
> > +		 */
> > +		drm_warn(dev, "could not acquire memory region [%pa-%pa]\n", &start,=
 &end);
> > +	} else {
> > +		size =3D resource_size(mem);
> > +		start =3D mem->start;
> > +	}
> > +
> > +	screen_base =3D devm_ioremap_wc(dev->dev, start, size);
> > +	if (!screen_base)
> > +		return -ENOMEM;
> > +
> > +	iosys_map_set_vaddr_iomem(&sdev->screen_base, screen_base);
> > +
> > +	return 0;
> > +}
> > +
> > +static void simpledrm_device_exit_mm(void *data)
> > +{
> > +	struct simpledrm_device *sdev =3D data;
> > +	struct drm_device *dev =3D &sdev->dev;
> > +
> > +	of_reserved_mem_device_release(dev->dev);
> > +}
> > +
> > +static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
> > +{
> > +	int (*init)(struct simpledrm_device *sdev, phys_addr_t start, size_t =
size);
> > +	struct drm_device *dev =3D &sdev->dev;
> > +	struct platform_device *pdev =3D to_platform_device(dev->dev);
> > +	phys_addr_t start, end;
> > +	size_t size;
> > +	int ret;
> > +
> > +	ret =3D of_reserved_mem_device_init_by_idx(dev->dev, dev->dev->of_nod=
e, 0);
> > +	if (ret) {
> > +		struct resource *res;
> > +
> > +		res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +		if (!res)
> > +			return -EINVAL;
> > +
> > +		init =3D simpledrm_device_init_mm_io;
> > +		size =3D resource_size(res);
> > +		start =3D res->start;
> > +	} else {
> > +		devm_add_action_or_reset(dev->dev, simpledrm_device_exit_mm, sdev);
> > +		init =3D simpledrm_device_init_mm_sysmem;
> > +		start =3D sdev->sysmem_start;
> > +		size =3D sdev->sysmem_size;
> > +	}
> > +
> > +	end =3D start + size - 1;
> > +
> > +	ret =3D devm_aperture_acquire_from_firmware(dev, start, size);
> > +	if (ret) {
> > +		drm_err(dev, "could not acquire memory range [%pa-%pa]: %d\n", &star=
t, &end, ret);
> > +		return ret;
> > +	}
> > +
> > +	return init(sdev, start, size);
> > +}
> > +
>=20
> That whole 'Memory Manangement' block is will be unmaintainable. Before I=
 go
> into a detailed review, please see my questions about the reservedmem code
> at the end of the patch.

It looks reasonably maintainable to me. Given that we only have __iomem
and non-__iomem cases, this is about the extent of the complexity that
could ever be added.

>=20
> >   /*
> >    * Modesetting
> >    */
> > @@ -491,15 +594,15 @@ static void simpledrm_primary_plane_helper_atomic=
_update(struct drm_plane *plane
> >   	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_sta=
te);
> >   	drm_atomic_for_each_plane_damage(&iter, &damage) {
> > -		struct iosys_map dst =3D IOSYS_MAP_INIT_VADDR(sdev->screen_base);
> >   		struct drm_rect dst_clip =3D plane_state->dst;
> >   		if (!drm_rect_intersect(&dst_clip, &damage))
> >   			continue;
> > -		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &=
dst_clip));
> > -		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_s=
tate->data, fb,
> > -			    &damage);
> > +		iosys_map_incr(&sdev->screen_base, drm_fb_clip_offset(sdev->pitch, s=
dev->format,
> > +								      &dst_clip));
>=20
> You'll modify screen_base and it'll eventually blow up. You have to keep
> initializing the dst variable within the loop.
>=20
> > +		drm_fb_blit(&sdev->screen_base, &sdev->pitch, sdev->format->format,
> > +			    shadow_plane_state->data, fb, &damage);
> >   	}
> >   	drm_dev_exit(idx);
> > @@ -518,7 +621,7 @@ static void simpledrm_primary_plane_helper_atomic_d=
isable(struct drm_plane *plan
> >   		return;
> >   	/* Clear screen to black if disabled */
> > -	memset_io(sdev->screen_base, 0, sdev->pitch * sdev->mode.vdisplay);
> > +	iosys_map_memset(&sdev->screen_base, 0, 0, sdev->pitch * sdev->mode.v=
display);
> >   	drm_dev_exit(idx);
> >   }
> > @@ -635,8 +738,6 @@ static struct simpledrm_device *simpledrm_device_cr=
eate(struct drm_driver *drv,
> >   	struct drm_device *dev;
> >   	int width, height, stride;
> >   	const struct drm_format_info *format;
> > -	struct resource *res, *mem;
> > -	void __iomem *screen_base;
> >   	struct drm_plane *primary_plane;
> >   	struct drm_crtc *crtc;
> >   	struct drm_encoder *encoder;
> > @@ -706,35 +807,9 @@ static struct simpledrm_device *simpledrm_device_c=
reate(struct drm_driver *drv,
> >   	drm_dbg(dev, "framebuffer format=3D%p4cc, size=3D%dx%d, stride=3D%d =
byte\n",
> >   		&format->format, width, height, stride);
> > -	/*
> > -	 * Memory management
> > -	 */
> > -
> > -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -	if (!res)
> > -		return ERR_PTR(-EINVAL);
> > -
> > -	ret =3D devm_aperture_acquire_from_firmware(dev, res->start, resource=
_size(res));
> > -	if (ret) {
> > -		drm_err(dev, "could not acquire memory range %pr: error %d\n", res, =
ret);
> > +	ret =3D simpledrm_device_init_mm(sdev);
> > +	if (ret)
> >   		return ERR_PTR(ret);
> > -	}
> > -
> > -	mem =3D devm_request_mem_region(&pdev->dev, res->start, resource_size=
(res), drv->name);
> > -	if (!mem) {
> > -		/*
> > -		 * We cannot make this fatal. Sometimes this comes from magic
> > -		 * spaces our resource handlers simply don't know about. Use
> > -		 * the I/O-memory resource as-is and try to map that instead.
> > -		 */
> > -		drm_warn(dev, "could not acquire memory region %pr\n", res);
> > -		mem =3D res;
> > -	}
> > -
> > -	screen_base =3D devm_ioremap_wc(&pdev->dev, mem->start, resource_size=
(mem));
> > -	if (!screen_base)
> > -		return ERR_PTR(-ENOMEM);
> > -	sdev->screen_base =3D screen_base;
> >   	/*
> >   	 * Modesetting
> > @@ -878,5 +953,35 @@ static struct platform_driver simpledrm_platform_d=
river =3D {
> >   module_platform_driver(simpledrm_platform_driver);
> > +static int simple_framebuffer_device_init(struct reserved_mem *rmem, s=
truct device *dev)
> > +{
> > +	struct simpledrm_device *sdev =3D dev_get_drvdata(dev);
> > +
> > +	sdev->sysmem_start =3D rmem->base;
> > +	sdev->sysmem_size =3D rmem->size;
>=20
> From what I understand, you use the sysmem_ variables in the same code th=
at
> allocates the simpledrm_device, which creates a chicken-egg problem. When
> does this code run?

This will run as a result of the of_reserved_mem_device_init_by_idx()
call earlier. It might be possible to push more code from the sysmem
initialization code path above into this function. That may also make
the somewhat clunky sysmem_start/size fields unnecessary.

Alternatively, we may be able to skip the whole RESERVEDMEM_OF_DECLARE
bits here and directly resolve the memory-region property and read its
"reg" property. However it seemed more appropriate to use the existing
infrastructure for this, even if it's rather minimal.

>=20
>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static void simple_framebuffer_device_release(struct reserved_mem *rme=
m, struct device *dev)
> > +{
> > +}
> > +
> > +static const struct reserved_mem_ops simple_framebuffer_ops =3D {
> > +	.device_init =3D simple_framebuffer_device_init,
> > +	.device_release =3D simple_framebuffer_device_release,
> > +};
> > +
> > +static int simple_framebuffer_init(struct reserved_mem *rmem)
> > +{
> > +	pr_info("framebuffer memory at %pa, size %lu bytes\n", &rmem->base,
> > +		(unsigned long)rmem->size);
> > +
> > +	rmem->ops =3D &simple_framebuffer_ops;
> > +
> > +	return 0;
> > +}
> > +RESERVEDMEM_OF_DECLARE(simple_framebuffer, "framebuffer", simple_frame=
buffer_init);
>=20
> What's the prupose of these code at all?  I looked through the kernel, but
> there aren't many other examples of it.

This is a fairly standard construct to deal with early memory
reservations. What happens is roughly this: during early kernel boot,
the reserved-memory core code will iterate over all children of the top-
level reserved-memory node and see if they have a compatible string that
matches one of the entries in the table created by these
RESERVEDMEM_OF_DECLARE entries. It will then call the init function for
a matched entry and register a struct reserved_mem for these. The init
function in this case just dumps an informational message to the boot
log to provide some information about the framebuffer region that was
reserved (which can be used for example for troubleshooting purposes)
and sets the device init/release operations (which will be called when a
device is associated with the reserved memory region, i.e. when the
of_reserved_mem_device_init_by_idx() function is called).

The reason why there aren't many examples of this is because these are
special memory regions that (at least upstream) kernels seldom support.
Perhaps the most common use-cases are the shared DMA pools (such as
CMA).

Thierry

--ThXErQYcM1siOf95
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNNbLgACgkQ3SOs138+
s6F9wxAAuICcw2WHVJSJX4ltmeZvP3A+qc5wpPPUdr3mCQseTM8wgMzgE3ZZPC2m
NOC7yqwESPg59/hR5srcYf8HXP3zpBjFUu+NLvzVccLAwy+51gfCcp3GPM0uCWch
pjV40dNKYhIBdAtDnffLUqUoRRtWYgJhm699exkvD1iODfo2f27b5Mej2VX8zK5T
fuGLEfvp2lSZwLTCoA2xsTW1QfTCY4hkfv1ulROWMl9C91eaWRrOuDFvph9kMbkF
kqrraiifdPuxSfaE/O72cQ80XXn3EVpTPdq94tCQKpmjCZ9D6YdKxFsuE1cK+o1g
8ovAnoBY722fOz2VauEI6KcQ95vyzx1whtD5PlBNKprzJt1Wv8pSCWGqkv0eSeRb
kODRFBhNBYp2oETlwoy/9SZrpeFmClLiFZ0fHjfhF8fU7jiW7tTnFmEFNp1K6F4Q
brtnBPMTqaVhDKMsV3BW2bcZGYKeLn3ocBj8D/J9XLTUQzuVjLssWX71BEq2EvPx
yEMAoLagO2qwEH8ndp+fKwAgq9uDkPMnbkEXxpOZe0Xj0cm7CKaENWyka9OLGkNB
k1N8StX9xaxq8PQu5jYvxGpM1N3dcE4cJYx1Z7a1wX5UOouX6xunckdfoKxm4f80
lO3yc6/6a85OgKGDoubd5SvXTLrru/PSfzPNfn2LYDVuMOWLZC4=
=d/FT
-----END PGP SIGNATURE-----

--ThXErQYcM1siOf95--
