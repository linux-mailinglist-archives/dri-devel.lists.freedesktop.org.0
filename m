Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE7D14CAF1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 13:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25C96E347;
	Wed, 29 Jan 2020 12:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5E96E347
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 12:39:40 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g17so19988864wro.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 04:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=o64DcQR+ocY6Lgyf2UKkWEhZKDiWr3TbT4b9HmsEwpI=;
 b=CAuUc1tC8EiPnSX6VptxAe51Q3hXOE2wIdCcqYWEb8+BoUKvFS455mEelkSwzB/WOq
 MyEx4cqlsD8qY47miVVAR4MW91Qwr9iTg2s4h+n/77Hq0WmXa6fGN2EISJAVNvdnwPGG
 j1EMVoAAnoGO3v+69nX9gCA6SkfjoquFqgQIbHh/J5emWcK6Ivu3zw1PI6f+j09Z7N0g
 Agx5e7A5dSOnj848+8MBHiqXmLpx3RPPZUl1WrZwxiuk0LQSeIntJtJF/+b1AW0L79O+
 oDwGTo4v+Viq4JglM6HTfPAIFaqyblsb7AOvebrG1s+l8ZRhNZmbiCsOJFKsfFqAWz57
 G9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o64DcQR+ocY6Lgyf2UKkWEhZKDiWr3TbT4b9HmsEwpI=;
 b=Y8/Q1BS35a8yszWVc7xpBSEScXqcTBNiNbyIFUoBJrBUiF8lFPbhezdM6mB21wqCVX
 r9kLQtl+n3jvv4qwUGpw59Hvm+3pNc7nGgRuqbUvRmBn0nrzFaWs+IvkuFBsbqf7Q5Ex
 6Xynq161c568volIhD9AFHQTrmluDaZrkta1Lqv7ROgL/apBiggUOoo02fJwsbC18wY0
 XTOlKQw4/pYYK6F9FQFn1CYM0DMh9f0IoZenUBny7gfAqqycrTTABXSdhev3o94YHtNj
 Derosn3Rjld6voQgu7+CY5axY6Uf1s5w57buRrWJeevrszyss6+okIygn8ByUb4YtU5w
 WYVw==
X-Gm-Message-State: APjAAAVidcq3UZMy41jJGGSX5iuCu46VIrUcSSDtAWM3Iqca7iojPdRL
 hFIgAFzDl7D+h663Kl2FMnk=
X-Google-Smtp-Source: APXvYqwr8enXMaf1JuVucbzZNqZgD/mxS1q6MkPUHCa2S8Y3HtDWlgpFfa8iXwnNmK77M3jSXp4Diw==
X-Received: by 2002:a5d:458d:: with SMTP id p13mr35190989wrq.314.1580301578877; 
 Wed, 29 Jan 2020 04:39:38 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
 by smtp.gmail.com with ESMTPSA id m21sm2186374wmi.27.2020.01.29.04.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 04:39:37 -0800 (PST)
Date: Wed, 29 Jan 2020 13:39:35 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [Regression 5.5-rc1] Extremely low GPU performance on NVIDIA
 Tegra20/30
Message-ID: <20200129123935.GG2479935@ulmo>
References: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
 <20191213151045.GB222809@ulmo>
 <d03876b8-b0d1-850b-7ae8-a61302e23843@gmail.com>
 <2f5c6fda-adf9-c6c3-7601-fa912813ce1f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2f5c6fda-adf9-c6c3-7601-fa912813ce1f@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0482303146=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0482303146==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E69HUUNAyIJqGpVn"
Content-Disposition: inline


--E69HUUNAyIJqGpVn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 05:53:03AM +0300, Dmitry Osipenko wrote:
> 13.12.2019 18:35, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 13.12.2019 18:10, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> On Fri, Dec 13, 2019 at 12:25:33AM +0300, Dmitry Osipenko wrote:
> >>> Hello Thierry,
> >>>
> >>> Commit [1] introduced a severe GPU performance regression on Tegra20 =
and
> >>> Tegra30 using.
> >>>
> >>> [1]
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?h=3Dv5.5-rc1&id=3Dfa6661b7aa0b52073681b0d26742650c8cbd30f3
> >>>
> >>> Interestingly the performance is okay on Tegra30 if
> >>> CONFIG_TEGRA_HOST1X_FIREWALL=3Dn, but that doesn't make difference for
> >>> Tegra20.
> >>>
> >>> I was telling you about this problem on the #tegra IRC sometime ago a=
nd
> >>> you asked to report it in a trackable form, so finally here it is.
> >>>
> >>> You could reproduce the problem by running [2] like this
> >>> `grate/texture-filter -f -s` which should produce over 100 FPS for 72=
0p
> >>> display resolution and currently it's ~11 FPS.
> >>>
> >>> [2]
> >>> https://github.com/grate-driver/grate/blob/master/tests/grate/texture=
-filter.c
> >>>
> >>> Previously I was seeing some memory errors coming from Host1x DMA, but
> >>> don't see any errors at all right now.
> >>>
> >>> I don't see anything done horribly wrong in the offending commit.
> >>>
> >>> Unfortunately I couldn't dedicate enough time to sit down and debug t=
he
> >>> problem thoroughly yet. Please let me know if you'll find a solution,
> >>> I'll be happy to test it. Thanks in advance!
> >>
> >> I suspect that the problem here is that we're now using the DMA API,
> >> which causes the 32-bit ARM DMA/IOMMU glue to be used. I vaguely recall
> >> that that code doesn't coalesce entries in the SG table, so we may end
> >> up calling iommu_map() a lot of times, and miss out on much of the
> >> advantages that the ->iotlb_sync_map() gives us on Tegra20.
> >>
> >> At the same time dma_map_sg() will flush caches, which we didn't do
> >> before. This we should be able to improve by passing the attribute
> >> DMA_ATTR_SKIP_CPU_SYNC to dma_map_sg() when we know that the cache
> >> maintenance isn't needed.
> >>
> >> And while thinking about it, one other difference is that with the DMA
> >> API we actually map/unmap the buffers for every submission. This is
> >> because the DMA API semantics require that buffers be mapped/unmapped
> >> every time you use them. Previously we would basically only map each
> >> buffer once (at allocation time) and only have to deal with cache
> >> maintenance, so the overhead per submission was drastically lower.
> >>
> >> If DMA_ATTR_SKIP_CPU_SYNC doesn't give us enough of an improvement, we
> >> may want to restore explicit IOMMU usage, at least on anything prior to
> >> Tegra124 where we're unlikely to ever use different IOMMU domains anyw=
ay
> >> (because they are such a scarce resource).
> >=20
> > Tegra20 doesn't use IOMMU in a vanilla upstream kernel (yet), so I don't
> > think that it's the root of the problem. Disabling IOMMU for Tegra30
> > also didn't help (IIRC).
> >=20
> > The offending patch shouldn't change anything in regards to the DMA API,
> > if I'm not missing something. Strange..
> >=20
> > Please keep me up-to-date!
> >=20
>=20
> Hello Thierry,
>=20
> I took another look at the problem and here what was found:
>=20
> 1) The "Optionally attach clients to the IOMMU" patch is wrong because:
>=20
>     1. host1x_drm_probe() is invoked *before* any of the
>        host1x_client_iommu_attach() happens, so there is no way
>        on earth the 'use_explicit_iommu' could ever be true.

That's not correct. host1x_client_iommu_attach() happens during
host1x_device_init(), which is called during host1x_drm_probe(). The
idea is that host1x_drm_probe() sets up the minimum IOMMU so that all
devices can attach, if they want to. If any of them connect (because
they aren't already attached via something like the DMA/IOMMU glue)
then the tegra->use_explicit_iommu is set to true, in which case the
IOMMU domain setup for explicit IOMMU API usage is completed. If, on
the other hand, none of the clients have a need for the explicit IOMMU
domain, there's no need to set it up and host1x_drm_probe() will just
discard it.

>     2. Not attaching DRM clients to IOMMU if HOST1x isn't
>        attached is wrong because it never attached in the case
>        of CONFIG_TEGRA_HOST1X_FIREWALL=3Dy [1] and this also
>        makes no sense for T20/30 that do not support LPAE.

It's not at all wrong. Take for example the case of Tegra124 and
Tegra210 where host1x and its clients can address 34 bits. In those
cases, allocating individual pages via shmem has a high probability of
hitting physical addresses beyond the 32-bit range, which means that the
host1x can not access them unless it is also attached to an IOMMU where
physical addresses to >=3D 4 GiB addresses can be translated into < 4 GiB
virtual addresses. This is a very real problem that I was running into
when testing on Tegra124 and Tegra210.

But I agree that this shouldn't be necessary on Tegra20 and Tegra30. We
should be able to remedy the situation on Tegra20 and Tegra30 by adding
another check, based on the DMA mask. Something like the below should
work:

--- >8 ---
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index aa9e49f04988..bd268028fb3d 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1037,23 +1037,9 @@ void tegra_drm_free(struct tegra_drm *tegra, size_t =
size, void *virt,
 	free_pages((unsigned long)virt, get_order(size));
 }
=20
-static int host1x_drm_probe(struct host1x_device *dev)
+static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 {
-	struct drm_driver *driver =3D &tegra_drm_driver;
 	struct iommu_domain *domain;
-	struct tegra_drm *tegra;
-	struct drm_device *drm;
-	int err;
-
-	drm =3D drm_dev_alloc(driver, &dev->dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
-
-	tegra =3D kzalloc(sizeof(*tegra), GFP_KERNEL);
-	if (!tegra) {
-		err =3D -ENOMEM;
-		goto put;
-	}
=20
 	/*
 	 * If the Tegra DRM clients are backed by an IOMMU, push buffers are
@@ -1082,9 +1068,38 @@ static int host1x_drm_probe(struct host1x_device *de=
v)
 	 * up the device tree appropriately. This is considered an problem
 	 * of integration, so care must be taken for the DT to be consistent.
 	 */
-	domain =3D iommu_get_domain_for_dev(drm->dev->parent);
+	domain =3D iommu_get_domain_for_dev(dev->dev.parent);
+
+	/*
+	 * Tegra20 and Tegra30 don't support addressing memory beyond the
+	 * 32-bit boundary, so the regular GATHER opcodes will always be
+	 * sufficient and whether or not the host1x is attached to an IOMMU
+	 * doesn't matter.
+	 */
+	if (!domain && dma_get_mask(dev->dev.parent) <=3D DMA_BIT_MASK(32))
+		return true;
+
+	return domain !=3D NULL;
+}
+
+static int host1x_drm_probe(struct host1x_device *dev)
+{
+	struct drm_driver *driver =3D &tegra_drm_driver;
+	struct tegra_drm *tegra;
+	struct drm_device *drm;
+	int err;
+
+	drm =3D drm_dev_alloc(driver, &dev->dev);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
+	tegra =3D kzalloc(sizeof(*tegra), GFP_KERNEL);
+	if (!tegra) {
+		err =3D -ENOMEM;
+		goto put;
+	}
=20
-	if (domain && iommu_present(&platform_bus_type)) {
+	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
 		tegra->domain =3D iommu_domain_alloc(&platform_bus_type);
 		if (!tegra->domain) {
 			err =3D -ENOMEM;
--- >8 ---

> [1]
> https://elixir.bootlin.com/linux/v5.5-rc6/source/drivers/gpu/host1x/dev.c=
#L205
>=20
> 2) Because of the above problems, the DRM clients are erroneously not
> getting attached to IOMMU at all and thus CMA is getting used for the BO
> allocations. Here comes the problems introduced by the "gpu: host1x:
> Support DMA mapping of buffers" patch, which makes DMA API to perform
> CPU cache maintenance on each job submission and apparently this is
> super bad for performance. This also makes no sense in comparison to the
> case of enabled IOMMU, where cache maintenance isn't performed at all
> (like it should be).

It actually does make a lot of sense. Very strictly speaking we were
violating the DMA API prior to the above patch because we were not DMA
mapping the buffers at all. Whenever you pass a buffer to hardware you
need to map it for the device. At that point, the kernel does not know
whether or not the buffer is dirty, so it has to perform a cache flush.
Similarily, when the hardware is done with a buffer, we need to unmap it
so that the CPU can access it again. This typically requires a cache
invalidate.

That things even worked to begin with more by accident than by design.

So yes, this is different from what we were doing before, but it's
actually the right thing to do. That said, I'm sure we can find ways to
optimize this. For example, as part of the DMA API conversion series I
added the possibility to set direction flags for relocation buffers. In
cases where it is known that a certain buffer will only be used for
reading, we should be able to avoid at least the cache invalidate
operation after a job is done, since the hardware won't have modified
the contents (when using an SMMU this can even be enforced). It's
slightly trickier to avoid cache flushes. For buffers that are only
going to be written, there's no need to flush the cache because the CPUs
changes can be assumed to be overwritten by the hardware anyway. However
we still need to make sure that we invalidate the caches in that case to
ensure subsequent cache flushes don't overwrite data already written by
hardware.

One other potential optimization I can imagine is to add flags to make
cache maintenance optional on buffers when we know it's safe to do so.
I'm not sure we can always know, so this is going to require further
thought.

> Please let me know if you're going to fix the problems or if you'd
> prefer me to create the patches.
>=20
> Here is a draft of the fix for #2, it doesn't cover case of imported
> buffers (which should be statically mapped, IIUC):
>=20
> @@ -38,7 +38,7 @@ static struct sg_table *tegra_bo_pin(struct device
> *dev, struct host1x_bo *bo,
>          * If we've manually mapped the buffer object through the IOMMU,
> make
>          * sure to return the IOVA address of our mapping.
>          */
> -       if (phys && obj->mm) {
> +       if (phys && (obj->mm || obj->vaddr)) {
>                 *phys =3D obj->iova;

This doesn't work for the case where we use the DMA API for mapping. Or
at least it isn't going to work in the general case. The reason is
because obj->iova is only valid for whatever the device was that mapped
or allocated the buffer, which in this case is the host1x device, which
isn't even a real device, so it won't work. The only case where it does
work is if we're not behind an IOMMU, so obj->iova will actually be the
physical address.

So what this basically ends up doing is avoid dma_map_*() all the time,
which I guess is what you're trying to achieve. But it also gives you
the wrong I/O virtual address in any case where an IOMMU is involved.
Also, as discussed above, avoiding cache maintenance isn't correct.

Thierry

>                 return NULL;
>         }
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index 25ca54de8fc5..69adfd66196b 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -108,7 +108,7 @@ static unsigned int pin_job(struct host1x *host,
> struct host1x_job *job)
>=20
>         for (i =3D 0; i < job->num_relocs; i++) {
>                 struct host1x_reloc *reloc =3D &job->relocs[i];
> -               dma_addr_t phys_addr, *phys;
> +               dma_addr_t phys_addr;
>                 struct sg_table *sgt;
>=20
>                 reloc->target.bo =3D host1x_bo_get(reloc->target.bo);
> @@ -117,12 +117,7 @@ static unsigned int pin_job(struct host1x *host,
> struct host1x_job *job)
>                         goto unpin;
>                 }
>=20
> -               if (client->group)
> -                       phys =3D &phys_addr;
> -               else
> -                       phys =3D NULL;
> -
> -               sgt =3D host1x_bo_pin(dev, reloc->target.bo, phys);
> +               sgt =3D host1x_bo_pin(dev, reloc->target.bo, &phys_addr);
>                 if (IS_ERR(sgt)) {
>                         err =3D PTR_ERR(sgt);
>                         goto unpin;
> @@ -184,7 +179,7 @@ static unsigned int pin_job(struct host1x *host,
> struct host1x_job *job)
>                         goto unpin;
>                 }
>=20
> -               sgt =3D host1x_bo_pin(host->dev, g->bo, NULL);
> +               sgt =3D host1x_bo_pin(host->dev, g->bo, &phys_addr);
>                 if (IS_ERR(sgt)) {
>                         err =3D PTR_ERR(sgt);
>                         goto unpin;
> @@ -214,7 +209,7 @@ static unsigned int pin_job(struct host1x *host,
> struct host1x_job *job)
>=20
>                         job->unpins[job->num_unpins].size =3D gather_size;
>                         phys_addr =3D iova_dma_addr(&host->iova, alloc);
> -               } else {
> +               } else if (sgt) {
>                         err =3D dma_map_sg(host->dev, sgt->sgl, sgt->nent=
s,
>                                          DMA_TO_DEVICE);
>                         if (!err) {

--E69HUUNAyIJqGpVn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4xfQQACgkQ3SOs138+
s6HWChAAlCyIorcMK5RHeKegmA2S4u4xd1Z4ROaXeTEBAXOEuz8TTpHUXDo+u+LM
g81szBPh7Zet3aVKvyvYM/jfR+jngurY+oxmV45vzBxhMWOom8pbKgDetN6gDWEZ
zSNvtOirf48D1hUR9D1+5hpu3MxtP+ZW8zosp2ByTAYBuV9+3RqvkKjuun0kRA5q
uFH4K6YkvulLThKIzNBmPU8Iwhzrg6fHTGnUolXiCTOSMHIehuH/CtQw473FMnj4
2VYD0S4oi0iuKRZCKBrN7ESj5vVqtfvXt3TOY9Ac605LParo7zhCS4SqzAaVqW82
N+zB85EL+x67MYDEpRy9dsGVvCtOI1LPC4kXv3gRrKOHmErx7D0a9ef8n7iGrW2U
xWt+TeyM/BF9Jb1edo8DOv+uEfRQlQaSlWAtJIDiz4wkhJpC/cYtFzgnBdfwT+i2
qahKq8/ElgurYaF9hGV3d8MQ3sT+3vgEalH51nd0Xj3gKkwJTdwPacHnMA8MPIc4
u1sOTKwbtmrbDVistJMZ7g+0HA1ZmwwCZkwgnV/XEe6/+LInj7s0jMftQH4+I7SF
jblRWdG84l2BedmUNxC2pBDG378/1+C3fysShuaYwcePTmKKqFZVfpGDt1/IRlT1
sDx7GpNJWjjIwypTAXlRSwX3hCsK2PAya7MgUOPtAJJFDAYUM2k=
=9Bls
-----END PGP SIGNATURE-----

--E69HUUNAyIJqGpVn--

--===============0482303146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0482303146==--
