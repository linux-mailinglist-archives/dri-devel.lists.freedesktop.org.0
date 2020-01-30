Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CFB14DA67
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 13:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7058A6F977;
	Thu, 30 Jan 2020 12:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631AE6F977
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 12:08:11 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a6so3678568wrx.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 04:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SmENc4hI2jtidqnC1/hYrwRCNzFF7jYDT7FByEDTJag=;
 b=fKnPjq74AQsoATXjSy3bATQ0ytpaMi/78N03YNpc0TzesAVE21sXNbaCEEp9pEXPnR
 uK+3NX/zuv7sFZbYYzYKQV5XNfl6xRYSjUJBL5ghfCOpcdlEuGm+wsDfcG/E4oDcryiE
 aylI1cipPt3ox/xefb3hlXjYquLclgL+gwFHkX7D8/c2yZcNclkLLfYO8LLG5kMz5D+w
 GoHt3cORHore6+TW6hLo/o2Bi6jvSZW2tFpqWFDUYIqok+fVHmLchuFUQrASv3PUCE//
 qiAGgV7Ieriul49Wz/mr3U9ZnYAjcls0hJiPlKAOOmaaT0WfSf+1BFjAhup52v5VTqex
 2zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SmENc4hI2jtidqnC1/hYrwRCNzFF7jYDT7FByEDTJag=;
 b=n/iGZS3WAWXmv/5xxSXdR87oMyQk6BkGvrqQ2uM1sa19QWiWfdzT7JY8/F9+nLCVnX
 vFqNCSZQBefUmiPnw9+5eo2gJsYX2bOwKJQbt6K52+GkYAbAk1e+ReszGU1UufiubbJC
 gX6CanhMdq/M3T1x2zrr/0pAcdNwPwmXBVaRyK/b8J8z6ZYu8BMzLW4eVWUUydBvMLqe
 PKKPSmgLkSpbPeO5OUedFxpiFVyAiLWKD9NcwG5sTKPN5EXsXKsxzWRcP5gi7PeBlI8K
 jhQPU3iyKN/uZQ2N4iryhw1PSN+M9B27CI3fvbYewWXQLKzEHd2tlre6+ZiVA5SJu563
 ft4A==
X-Gm-Message-State: APjAAAUgWpGRkQiDYn1hIkI8ED7BAJIXnh5H3rNLm13pl36uh/qHGhBr
 IHAHf+WOfNor/tv3egZ9BVg=
X-Google-Smtp-Source: APXvYqwYx384d7KRlUYzCj6skTiIBSU2a6hEhOHwzl/1OLOPCYC6+pfm1bXP3rDij61QgtHWR/yMyg==
X-Received: by 2002:adf:b351:: with SMTP id k17mr5176494wrd.199.1580386089511; 
 Thu, 30 Jan 2020 04:08:09 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
 by smtp.gmail.com with ESMTPSA id d12sm7195138wrp.62.2020.01.30.04.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 04:08:07 -0800 (PST)
Date: Thu, 30 Jan 2020 13:08:06 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [Regression 5.5-rc1] Extremely low GPU performance on NVIDIA
 Tegra20/30
Message-ID: <20200130120806.GA2582317@ulmo>
References: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
 <20191213151045.GB222809@ulmo>
 <d03876b8-b0d1-850b-7ae8-a61302e23843@gmail.com>
 <2f5c6fda-adf9-c6c3-7601-fa912813ce1f@gmail.com>
 <20200129123935.GG2479935@ulmo>
 <d69df90f-37c9-0242-708a-689a8789a30b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d69df90f-37c9-0242-708a-689a8789a30b@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2141120222=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2141120222==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2020 at 07:36:36AM +0300, Dmitry Osipenko wrote:
> 29.01.2020 15:39, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, Jan 20, 2020 at 05:53:03AM +0300, Dmitry Osipenko wrote:
> >> 13.12.2019 18:35, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> Hello Thierry,
> >>
> >> I took another look at the problem and here what was found:
> >>
> >> 1) The "Optionally attach clients to the IOMMU" patch is wrong because:
> >>
> >>     1. host1x_drm_probe() is invoked *before* any of the
> >>        host1x_client_iommu_attach() happens, so there is no way
> >>        on earth the 'use_explicit_iommu' could ever be true.
> >=20
> > That's not correct. host1x_client_iommu_attach() happens during
> > host1x_device_init(), which is called during host1x_drm_probe().
>=20
> Looks like I previously got confused by accident, my bad.
>=20
> > The idea is that host1x_drm_probe() sets up the minimum IOMMU so that a=
ll
> > devices can attach, if they want to. If any of them connect (because
> > they aren't already attached via something like the DMA/IOMMU glue)
> > then the tegra->use_explicit_iommu is set to true, in which case the
> > IOMMU domain setup for explicit IOMMU API usage is completed. If, on
> > the other hand, none of the clients have a need for the explicit IOMMU
> > domain, there's no need to set it up and host1x_drm_probe() will just
> > discard it.
>=20
> This matches my understanding of what you wanted to achieve, thanks.
>=20
> >>     2. Not attaching DRM clients to IOMMU if HOST1x isn't
> >>        attached is wrong because it never attached in the case
> >>        of CONFIG_TEGRA_HOST1X_FIREWALL=3Dy [1] and this also
> >>        makes no sense for T20/30 that do not support LPAE.
> >=20
> > It's not at all wrong. Take for example the case of Tegra124 and
> > Tegra210 where host1x and its clients can address 34 bits. In those
> > cases, allocating individual pages via shmem has a high probability of
> > hitting physical addresses beyond the 32-bit range, which means that the
> > host1x can not access them unless it is also attached to an IOMMU where
> > physical addresses to >=3D 4 GiB addresses can be translated into < 4 G=
iB
> > virtual addresses. This is a very real problem that I was running into
> > when testing on Tegra124 and Tegra210.
>=20
> Why not to set the DMA mask to 32bits if IOMMU is unavailable?

We already do that. If you look at host1x_iommu_init() in
drivers/gpu/host1x/dev.c, you'll see that when no IOMMU support is
available and the host1x doesn't support wide GATHER opcodes, then
we limit the DMA Mask to 32 bits.

But that's not enough, see below.

> I'm a bit puzzled by the actual need to support the case where Host1x is
> backed by IOMMU and clients not.. How we could ever end up with this
> scenario in the upstream kernel?

That's not what we're doing here. The fundamental problem is that we
have a couple of generations where the hardware is mismatched in that
clients support 34-bit addresses while host1x can only use 32-bit
addresses in the GATHER opcode. The only way to get around this mismatch
is by using an IOMMU.

However, with an IOMMU enabled for clients, we can run into the case
where sparse pages would be allocated via shmem and end up beyond the
32-bit boundary. If the host1x is not attached to an IOMMU, there's no
way for it to access these pages with standard GATHER opcodes.

This is what used to happen prior to this change when the host1x
firewall was enabled. Since we were not attaching it to an IOMMU in that
case, we would end up with sparse buffers allocated from pages that the
host1x couldn't address.

> What about the reverse scenario? You won't be able to patch cmdstream
> properly for >32bit addresses.

I don't think that scenario exists. I'm not aware of a Tegra device that
has system memory outside of the CPU-addressable region.

> The root of the problem is that Tegra DRM UAPI doesn't support 64bit
> addresses, so you can't use "wide" opcodes and can't patch cmdstream.

There's nothing in the UAPI that deals with addresses directly. We only
pass around handles and these are resolved to buffer objects in the
kernel where the address of the buffers can be 32-bit or 64-bit.

And we do in fact support wide opcodes and patch command streams just
fine on 64-bit systems.

I mean, it's not like I've been doing this just for the fun of it. There
are actual configurations where this is needed in order for it to work.

> Perhaps it is better not to add any new things or quirks to the Host1x /
> Tegra DRM for now. The drivers need a serious clean up, otherwise mess
> only continues to grow up. Don't you think so?

This isn't anything new or a quirk. This is bug fixes to ensure that the
driver works in (now hopefully) all configurations. Previously it was a
matter of getting the configuration just right in order for it to work.
All the work I did here (starting with the wide opcode support and then
the DMA API and IOMMU work) was to make sure it would safely work in any
setup.

And I do consider these changes to also be cleanups and incremental
improvements of what the state was before. Again, I don't consider a
rewrite a serious cleanup.

I'm fully aware that the driver has been collecting dust for a while and
it isn't perfect. But it's also not overly messy. It's perhaps a bit
more complex than your average driver, but it's also some pretty complex
hardware.

> > But I agree that this shouldn't be necessary on Tegra20 and Tegra30. We
> > should be able to remedy the situation on Tegra20 and Tegra30 by adding
> > another check, based on the DMA mask. Something like the below should
> > work:
> >=20
> > --- >8 ---
> [snip]
> > --- >8 ---
>=20
> This works, thanks.

Great, I'll send this out then.

> >> [1]
> >> https://elixir.bootlin.com/linux/v5.5-rc6/source/drivers/gpu/host1x/de=
v.c#L205
> >>
> >> 2) Because of the above problems, the DRM clients are erroneously not
> >> getting attached to IOMMU at all and thus CMA is getting used for the =
BO
> >> allocations. Here comes the problems introduced by the "gpu: host1x:
> >> Support DMA mapping of buffers" patch, which makes DMA API to perform
> >> CPU cache maintenance on each job submission and apparently this is
> >> super bad for performance. This also makes no sense in comparison to t=
he
> >> case of enabled IOMMU, where cache maintenance isn't performed at all
> >> (like it should be).
> >=20
> > It actually does make a lot of sense. Very strictly speaking we were
> > violating the DMA API prior to the above patch because we were not DMA
> > mapping the buffers at all. Whenever you pass a buffer to hardware you
> > need to map it for the device. At that point, the kernel does not know
> > whether or not the buffer is dirty, so it has to perform a cache flush.
> > Similarily, when the hardware is done with a buffer, we need to unmap it
> > so that the CPU can access it again. This typically requires a cache
> > invalidate.
> >=20
> > That things even worked to begin with more by accident than by design.
> >=20
> > So yes, this is different from what we were doing before, but it's
> > actually the right thing to do. That said, I'm sure we can find ways to
> > optimize this. For example, as part of the DMA API conversion series I
> > added the possibility to set direction flags for relocation buffers. In
> > cases where it is known that a certain buffer will only be used for
> > reading, we should be able to avoid at least the cache invalidate
> > operation after a job is done, since the hardware won't have modified
> > the contents (when using an SMMU this can even be enforced). It's
> > slightly trickier to avoid cache flushes. For buffers that are only
> > going to be written, there's no need to flush the cache because the CPUs
> > changes can be assumed to be overwritten by the hardware anyway. However
> > we still need to make sure that we invalidate the caches in that case to
> > ensure subsequent cache flushes don't overwrite data already written by
> > hardware.
> >=20
> > One other potential optimization I can imagine is to add flags to make
> > cache maintenance optional on buffers when we know it's safe to do so.
> > I'm not sure we can always know, so this is going to require further
> > thought.
>=20
> Doesn't sound good to me.. this is not going to be good for GPU drivers.
> All cache maintenance should be in control of userspace, the userspace
> should be telling kernel driver when it needs to get CPU access and when
> to finish the access. DMABUF has generic UAPI for the synchronizations,
> although a mature GPU driver may need more than that.

I agree. But that's not something that we can do at this point. We don't
have a way of passing information such as this to the driver, so the
driver has to assume that caches are dirty for all buffers, otherwise it
will not be able to guarantee that random cache flushes won't corrupt
the data that it's passing to the hardware.

So yes, when we do have a way of explicitly flushing the caches for
buffers, then we can add a mechanism to pass that information to the
kernel so that it can optimize. But until then we just can't be sure.
And I prefer a kernel driver that gives me slow and reliable, rather
than fast but unpredictable results.

> Today Tegra DRM driver supports only write-combined BO allocations, and
> thus, we don't need to do more than to flush CPU buffers before
> executing HW job.

That's only true when you allocate with the DMA API. When you allocate
=66rom a shmem mapping you don't get write-combined memory, so we do have
to perform cache maintenance on the pages.

> >> Please let me know if you're going to fix the problems or if you'd
> >> prefer me to create the patches.
> >>
> >> Here is a draft of the fix for #2, it doesn't cover case of imported
> >> buffers (which should be statically mapped, IIUC):
> >>
> >> @@ -38,7 +38,7 @@ static struct sg_table *tegra_bo_pin(struct device
> >> *dev, struct host1x_bo *bo,
> >>          * If we've manually mapped the buffer object through the IOMM=
U,
> >> make
> >>          * sure to return the IOVA address of our mapping.
> >>          */
> >> -       if (phys && obj->mm) {
> >> +       if (phys && (obj->mm || obj->vaddr)) {
> >>                 *phys =3D obj->iova;
> >=20
> > This doesn't work for the case where we use the DMA API for mapping. Or
> > at least it isn't going to work in the general case.
>=20
> Right, looks like I'll need to update my memory about the DMA API usage.
>=20
> > The reason is because obj->iova is only valid for whatever the device w=
as that mapped
> > or allocated the buffer, which in this case is the host1x device, which
> > isn't even a real device, so it won't work. The only case where it does
> > work is if we're not behind an IOMMU, so obj->iova will actually be the
> > physical address.
>=20
> But why do you need to dynamically map/unmap the statically-allocated
> buffers on each job submission, could you please explain what is the
> point? Perhaps it's a temporary workaround just to get a minimum of
> things working for the case of implicit IOMMU?

It's primarily because we don't really know if a buffer has been mapped
for a specific device. We always map at allocation time for the Tegra
DRM parent device (which isn't a real device) but before it's used by
any other host1x client, it has to be mapped for that device as well.
That's important in case any of these devices have different IOMMU
domains.

Actually, given that the device isn't a real device, the DMA handle
returned from dma_alloc_wc() is actually a physical address and not
valid for any device behind an IOMMU. So even in the case where we
share an IOMMU domain among multiple device, the mapping created by
dma_alloc_wc() is useless for them.

Because of the above and probably a bunch of other reasons, it's also a
requirement of the DMA API. If you enable CONFIG_DMA_API_DEBUG, the DMA
API will start printing a bunch of errors if you violate those and they
typically indicate that what you're doing may not work. That doesn't
mean it can't work, but it usually only does so accidentally.

> All buffers should be statically allocated and statically mapped, and
> when there is a need to sync an already mapped buffer, the dma_sync_*
> API should be used.

That's my understanding as well. However, it's slightly more complicated
than that. Once you move away from the assumption that a mapping for a
buffer the same for all devices, you can no longer do that. For example,
while the statically allocated buffer may be mapped for the Tegra DRM
device (again, it's not a real device), it's not mapped for any of the
clients yet. So before a client can use it, its driver has to go and map
the buffer for the device. The logical point to do that is during
host1x_job_pin(). Once the client no longer has a use for the buffer it
should also unmap the buffer again because it will otherwise occupy the
IOVA space unnecessarily. The logical point to do that is during
host1x_job_unpin().

host1x_job_unpin() is also the point at which the job releases its
reference to the buffer, so the backing memory could go away at any
point after that, which means that the IOVA mapping could point at
invalid memory if we didn't unmap the buffer.

I'm not aware of an easy way to optimize this while at the same time
making sure that everything is still consistent. I suppose one way to do
this would be to keep a cache of buffer objects and their mappings for
each device and avoid mapping/unmapping them for every job. The problem
with that is that we also don't want to hold on to buffer objects
indefinitely because that will potentially cause a lot of memory and
IOVA space to be used.

> Like I said above, the syncing should be done by userspace for the
> buffers that are in control of userspace.

Yes, I agree. We already have an implementation of the .begin_cpu_access
and .end_cpu_access callbacks for DMA-BUF, so it should be easy to add
something like that for native buffers. Alternatively, I suppose user-
space could be required to flush/invalidate using the DMA-BUF, but that
potentially has the drawback of having to export a DMA-BUF for every
single buffer.

A better option may be to add a driver-specific IOCTL to do cache
maintenance. I think other drivers already do that.

> > So what this basically ends up doing is avoid dma_map_*() all the time,
> > which I guess is what you're trying to achieve. But it also gives you
> > the wrong I/O virtual address in any case where an IOMMU is involved.
> > Also, as discussed above, avoiding cache maintenance isn't correct.
>=20
> Alright, then right now we need to bypass the dma_map_*() in a case of a
> non-implicit IOMMU, in order to bring back the good old behavior (at
> least temporary, until there will be a more comprehensive solution).

But it's not good old behaviour. You're still going to side-step the
cache maintenance and violate the DMA API semantics.

Thierry

>=20
> What do you think about this variant:
>=20
> --- >8 ---
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 1237df157e05..555a6424e9fa 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -54,16 +54,25 @@ static struct sg_table *tegra_bo_pin(struct device
> *dev, struct host1x_bo *bo,
>  				     dma_addr_t *phys)
>  {
>  	struct tegra_bo *obj =3D host1x_to_tegra_bo(bo);
> +	struct tegra_drm *tegra =3D obj->gem.dev->dev_private;
>  	struct sg_table *sgt;
>  	int err;
>=20
> -	/*
> -	 * If we've manually mapped the buffer object through the IOMMU, make
> -	 * sure to return the IOVA address of our mapping.
> -	 */
> -	if (phys && obj->mm) {
> -		*phys =3D obj->iova;
> -		return NULL;
> +	if (phys && iommu_get_domain_for_dev(dev) =3D=3D tegra->domain) {
> +		/* if IOMMU isn't available, return IOVA=3DPHYS of the mapping */
> +		if (obj->vaddr) {
> +			*phys =3D obj->iova;
> +			return NULL;
> +		}
> +
> +		/*
> +		 * If we've manually mapped the buffer object through the
> +		 * IOMMU, make sure to return the IOVA address of our mapping.
> +		 */
> +		if (obj->mm) {
> +			*phys =3D obj->iova;
> +			return NULL;
> +		}
>  	}
>=20
>  	/*
> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
> index 6d1872ddef17..91304b9034fa 100644
> --- a/drivers/gpu/drm/tegra/plane.c
> +++ b/drivers/gpu/drm/tegra/plane.c
> @@ -97,16 +97,15 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct
> tegra_plane_state *state)
>=20
>  	for (i =3D 0; i < state->base.fb->format->num_planes; i++) {
>  		struct tegra_bo *bo =3D tegra_fb_get_plane(state->base.fb, i);
> +		struct sg_table *sgt;
>=20
> -		if (!dc->client.group) {
> -			struct sg_table *sgt;
> -
> -			sgt =3D host1x_bo_pin(dc->dev, &bo->base, NULL);
> -			if (IS_ERR(sgt)) {
> -				err =3D PTR_ERR(sgt);
> -				goto unpin;
> -			}
> +		sgt =3D host1x_bo_pin(dc->dev, &bo->base, &state->iova[i]);
> +		if (IS_ERR(sgt)) {
> +			err =3D PTR_ERR(sgt);
> +			goto unpin;
> +		}
>=20
> +		if (sgt) {
>  			err =3D dma_map_sg(dc->dev, sgt->sgl, sgt->nents,
>  					 DMA_TO_DEVICE);
>  			if (err =3D=3D 0) {
> @@ -127,8 +126,6 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct
> tegra_plane_state *state)
>=20
>  			state->iova[i] =3D sg_dma_address(sgt->sgl);
>  			state->sgt[i] =3D sgt;
> -		} else {
> -			state->iova[i] =3D bo->iova;
>  		}
>  	}
>=20
> @@ -141,8 +138,11 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct
> tegra_plane_state *state)
>  		struct tegra_bo *bo =3D tegra_fb_get_plane(state->base.fb, i);
>  		struct sg_table *sgt =3D state->sgt[i];
>=20
> -		dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents, DMA_TO_DEVICE);
> -		host1x_bo_unpin(dc->dev, &bo->base, sgt);
> +		if (sgt) {
> +			dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents,
> +				     DMA_TO_DEVICE);
> +			host1x_bo_unpin(dc->dev, &bo->base, sgt);
> +		}
>=20
>  		state->iova[i] =3D DMA_MAPPING_ERROR;
>  		state->sgt[i] =3D NULL;
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index 60b2fedd0061..538c0f0b40a4 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -108,7 +108,7 @@ static unsigned int pin_job(struct host1x *host,
> struct host1x_job *job)
>=20
>  	for (i =3D 0; i < job->num_relocs; i++) {
>  		struct host1x_reloc *reloc =3D &job->relocs[i];
> -		dma_addr_t phys_addr, *phys;
> +		dma_addr_t phys_addr;
>  		struct sg_table *sgt;
>=20
>  		reloc->target.bo =3D host1x_bo_get(reloc->target.bo);
> @@ -117,12 +117,7 @@ static unsigned int pin_job(struct host1x *host,
> struct host1x_job *job)
>  			goto unpin;
>  		}
>=20
> -		if (client->group)
> -			phys =3D &phys_addr;
> -		else
> -			phys =3D NULL;
> -
> -		sgt =3D host1x_bo_pin(dev, reloc->target.bo, phys);
> +		sgt =3D host1x_bo_pin(dev, reloc->target.bo, &phys_addr);
>  		if (IS_ERR(sgt)) {
>  			err =3D PTR_ERR(sgt);
>  			goto unpin;
> @@ -168,6 +163,13 @@ static unsigned int pin_job(struct host1x *host,
> struct host1x_job *job)
>  		job->num_unpins++;
>  	}
>=20
> +	/*
> +	 * In a case of enabled firewall, all user gathers are copied into
> +	 * the secured job->gather_copy_mapped.
> +	 */
> +	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
> +		return 0;
> +
>  	for (i =3D 0; i < job->num_gathers; i++) {
>  		struct host1x_job_gather *g =3D &job->gathers[i];
>  		size_t gather_size =3D 0;
> @@ -184,13 +186,13 @@ static unsigned int pin_job(struct host1x *host,
> struct host1x_job *job)
>  			goto unpin;
>  		}
>=20
> -		sgt =3D host1x_bo_pin(host->dev, g->bo, NULL);
> +		sgt =3D host1x_bo_pin(host->dev, g->bo, &phys_addr);
>  		if (IS_ERR(sgt)) {
>  			err =3D PTR_ERR(sgt);
>  			goto unpin;
>  		}
>=20
> -		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
> +		if (host->domain) {
>  			for_each_sg(sgt->sgl, sg, sgt->nents, j)
>  				gather_size +=3D sg->length;
>  			gather_size =3D iova_align(&host->iova, gather_size);
> @@ -214,7 +216,7 @@ static unsigned int pin_job(struct host1x *host,
> struct host1x_job *job)
>=20
>  			job->unpins[job->num_unpins].size =3D gather_size;
>  			phys_addr =3D iova_dma_addr(&host->iova, alloc);
> -		} else {
> +		} else if (sgt) {
>  			err =3D dma_map_sg(host->dev, sgt->sgl, sgt->nents,
>  					 DMA_TO_DEVICE);
>  			if (!err) {
>=20
> --- >8 ---

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4yxyMACgkQ3SOs138+
s6HohA//bFoME61NnVJr1wbNBLNZFGHe0SQ49icdHfu0e0GADeY4zO4Y3ZNrZ3Sb
Jhqao0VrmCWwDOv2IeK/lKC0Iv85EOarTaXfA5uDfQZl4vHpA/9sNzQS7CwCSaJ2
ZEcnGaEL5Umyus8zHTjnpUtb7IHScdjz4FM/QV33UmHj98o58KzTpgbex/R5gzQ/
OFsxIR0IRS+/4GHnyqjvws38kZ/9TIbF2COVNm0Oe+PcOiD7k5K0pGAji6fk1fO2
zXQCT1AQcIbLddAFyDJzmWlo7qdctcUmVX5QMZ1b0yINKvPqUAm3Mkl1/J05L1Uh
vsdhkeVVh0Adf5ads/0fjME78GWYwLfWPxQZ8yhlkVzctgCGkn1ePou0jDtfq+4w
pdDWlpIkQqIeRoLBGdPVvR/FTPO4oZ+mjfMExMKiXcje5Vu0lHVzpqvs21CJzkJ2
sPH1ab2uSBv6Af5WXgzkqtWT/NGUDkiRR9C8RGGhFc3mIKQw31eLkSyl0ON4l3QG
xtops+szeq0AYKJDuavn04x6fkhXsObqLFjiF1D6Xct9DGIgc+Y/N4l7u4jEgW/R
1+MTku1Sp1rMif/Dfy6VbZ1KASf9FLHHkTqvxtSFaBbBil2HV5qJTDzD+xQO2iAL
2e5DjqIDs13PXdAMSYL56CPaidIF8FdalaPwArrjTrLJOj2YFVE=
=WaHR
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--

--===============2141120222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2141120222==--
