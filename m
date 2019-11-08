Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D454CF533C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 19:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639396FA49;
	Fri,  8 Nov 2019 18:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D68A6FA48;
 Fri,  8 Nov 2019 18:07:45 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i12so1162002wro.5;
 Fri, 08 Nov 2019 10:07:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=agxieXSwLTzpcRW0NHY5w8qsVBQBIwY6VTu1b3TdrTY=;
 b=Nz2RConDK/7CVPVS8pQj0s8DMXAZ9olTmEZgsU4te2sAwY8H2mxFrC8yBfOMzjTb35
 /jW9CjC66vY12xAWJP8D1LterTR376ORt5cKfgoUTTE5jW66RnvlF46H+5gEoIkav2+l
 2Ji5v7JK4tXezmVM4scxuhan9+YtKWlhrH+WMpIkGxLgNu/wiNmi7rb4aniGebsP2AK1
 Rh4AuDAXJAvEnuDe1jDAx4NiLO4kdydvYyUsQo+6hRRqYlIPjSOTXi64ETXOMQ0IPTFy
 ACzlGZceGrg02kDWJTjwXuwg5gzYjiwvANRFIZv6WzoHwiv2GZWU66Hv7ITR2QCqV5S+
 PftA==
X-Gm-Message-State: APjAAAVH5kylaxKDkxDfrUK+5LW4JG/jF4ZeYsX44iWo6CfoZ3/Beeyj
 ieepQgZfW3wvIqrWjx8cCdI=
X-Google-Smtp-Source: APXvYqxNCc5raOdkYYfou/Ok+AkMrXnjjpp1CiVI9VH28I8G46R59cUYcfVjYdatxxYA8wWtvP9fWQ==
X-Received: by 2002:a5d:6389:: with SMTP id p9mr9197566wru.324.1573236463753; 
 Fri, 08 Nov 2019 10:07:43 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id g14sm7552313wro.33.2019.11.08.10.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 10:07:41 -0800 (PST)
Date: Fri, 8 Nov 2019 19:07:40 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: Re: [PATCH] RFC: drm/nouveau: Make BAR1 support optional
Message-ID: <20191108180740.GA3384779@ulmo>
References: <20191108160207.3251019-1-thierry.reding@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191108160207.3251019-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=agxieXSwLTzpcRW0NHY5w8qsVBQBIwY6VTu1b3TdrTY=;
 b=NzRCwAQl4v9W5RLeqAlH5n6+8TTAwBEEy4D/3QX5mh5HUgUrs4cIozdIPOxmeAJkFM
 neI2pyXtTD8V7dZsYSV6+ZOPoZ25vgvjrG/nAENrtbhTDdE+wI9iFgmFLqRvYxP+JHzW
 D41iXdFfsfswcjMx5mosIP7f0C/xNHS3oksoTkrOvBPgQoQBUSwKv+kJGcq6N5wkuemE
 WLfxsa4IMlHy2TlevAzQ1Lnr0cLde5N4lO+FXVlImTFlcC/7SnSkMsC8nuZTXdUxx4U5
 KxFy1tZ/DHNVBCYIbWfqs2ltbNzTQjPCe2NDPmZd/CdM+iUFLL+u5hH/e3Oz67cSeeqH
 xfdQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0199260400=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0199260400==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 08, 2019 at 05:02:07PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The purpose of BAR1 is primarily to make memory accesses coherent.
> However, some GPUs do not have BAR1 functionality. For example, the
> GV11B found on the Xavier SoC is DMA coherent and therefore doesn't
> need BAR1.
>=20
> Implement a variant of FIFO channels that work without a mapping of
> instance memory through BAR1.
>=20
> XXX ensure memory barriers are in place for writes
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Hi Ben,
>=20
> I'm sending this a bit out of context (it's part of the larger series to
> enable basic GV11B support) because I wanted to get some early feedback
> from you on this.
>=20
> For a bit of background: GV11B as it turns out doesn't really have BAR1
> anymore. The SoC has a coherency fabric which means that basically the
> GPU's system memory accesses are already coherent and hence we no longer
> need to go via BAR1 to ensure that. Functionally the same can be done by
> just writing to the memory via the CPU's virtual mapping.
>=20
> So this patch implement basically a second variant of the FIFO channel
> which, instead of taking a physical address and then ioremapping that,
> takes a struct nvkm_memory object. This seems to work, though since I'm
> not really doing much yet (firmware loading fails, etc.) I wouldn't call
> this "done" just yet.
>=20
> In fact there are a few things that I'm not happy about. For example I
> think we'll eventually need to have barriers to ensure that the CPU
> write buffers are flushed, etc. It also seems like most users of the
> FIFO channel object will just go and map its buffer once and then only
> access it via the virtual mapping only, without going through the
> ->rd32()/->wr32() callbacks nor unmapping via ->unmap(). That means we
> effectively don't have a good point where we could emit the memory
> barriers.
>=20
> I see two possibilities here: 1) make all accesses go through the
> accessors or 2) guard each series of accesses with a pair of nvkm_map()
> and nvkm_done() calls. Both of those would mean that all code paths need
> to be carefully audited.

Actually it looks like this is already working if I return 0 as the
address from the ->unmap() callback. That seems to result in the
->wr32() and ->rd32() callbacks getting called instead of the callers
trying to directly dereference the address, which obviously they now
can't.

So this seems like it could give me exactly what I need to make this
work. Again, this seems to get me past probe, but I see only a single
write at this point, so that's not saying much.

Thierry

>=20
> One other thing I'm wondering is if it's okay to put all of this into
> the gk104_fifo implementation. I think the result of parameterizing on
> device->bar is pretty neat. Also, it seems like most of the rest of the
> code would have to be duplicated, or a lot of the gk104_*() function
> exported to a new implementation. So I'm not sure that it's really worth
> it.
>=20
> Thierry
>=20
>  .../drm/nouveau/include/nvkm/engine/fifo.h    |   7 +-
>  .../gpu/drm/nouveau/nvkm/engine/fifo/chan.c   | 157 ++++++++++++++++--
>  .../gpu/drm/nouveau/nvkm/engine/fifo/chan.h   |   6 +
>  .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.c  |  29 +++-
>  4 files changed, 180 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h b/drivers=
/gpu/drm/nouveau/include/nvkm/engine/fifo.h
> index 4bd6e1e7c413..c0fb545efb2b 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
> @@ -25,7 +25,12 @@ struct nvkm_fifo_chan {
>  	struct nvkm_gpuobj *inst;
>  	struct nvkm_gpuobj *push;
>  	struct nvkm_vmm *vmm;
> -	void __iomem *user;
> +
> +	union {
> +		struct nvkm_memory *mem;
> +		void __iomem *user;
> +	};
> +
>  	u64 addr;
>  	u32 size;
> =20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/fifo/chan.c
> index d83485385934..f47bc96bbb6d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
> @@ -310,7 +310,7 @@ nvkm_fifo_chan_init(struct nvkm_object *object)
>  }
> =20
>  static void *
> -nvkm_fifo_chan_dtor(struct nvkm_object *object)
> +__nvkm_fifo_chan_dtor(struct nvkm_object *object)
>  {
>  	struct nvkm_fifo_chan *chan =3D nvkm_fifo_chan(object);
>  	struct nvkm_fifo *fifo =3D chan->fifo;
> @@ -324,9 +324,6 @@ nvkm_fifo_chan_dtor(struct nvkm_object *object)
>  	}
>  	spin_unlock_irqrestore(&fifo->lock, flags);
> =20
> -	if (chan->user)
> -		iounmap(chan->user);
> -
>  	if (chan->vmm) {
>  		nvkm_vmm_part(chan->vmm, chan->inst->memory);
>  		nvkm_vmm_unref(&chan->vmm);
> @@ -337,6 +334,17 @@ nvkm_fifo_chan_dtor(struct nvkm_object *object)
>  	return data;
>  }
> =20
> +static void *
> +nvkm_fifo_chan_dtor(struct nvkm_object *object)
> +{
> +	struct nvkm_fifo_chan *chan =3D nvkm_fifo_chan(object);
> +
> +	if (chan->user)
> +		iounmap(chan->user);
> +
> +	return __nvkm_fifo_chan_dtor(object);
> +}
> +
>  static const struct nvkm_object_func
>  nvkm_fifo_chan_func =3D {
>  	.dtor =3D nvkm_fifo_chan_dtor,
> @@ -349,12 +357,98 @@ nvkm_fifo_chan_func =3D {
>  	.sclass =3D nvkm_fifo_chan_child_get,
>  };
> =20
> +static void *
> +nvkm_fifo_chan_mem_dtor(struct nvkm_object *object)
> +{
> +	return __nvkm_fifo_chan_dtor(object);
> +}
> +
> +static int
> +nvkm_fifo_chan_mem_map(struct nvkm_object *object, void *argv, u32 argc,
> +		       enum nvkm_object_map *type, u64 *addr, u64 *size)
> +{
> +	struct nvkm_fifo_chan *chan =3D nvkm_fifo_chan(object);
> +
> +	pr_info("> %s(object=3D%px, argv=3D%px, argc=3D%u, type=3D%px, addr=3D%=
px, size=3D%px)\n", __func__, object, argv, argc, type, addr, size);
> +
> +	*type =3D NVKM_OBJECT_MAP_VA;
> +	*addr =3D (u64)nvkm_kmap(chan->mem);
> +	*size =3D chan->size;
> +
> +	pr_info("  type: %d\n", *type);
> +	pr_info("  addr: %016llx\n", *addr);
> +	pr_info("  size: %016llx\n", *size);
> +	pr_info("< %s()\n", __func__);
> +	return 0;
> +}
> +
> +static int
> +nvkm_fifo_chan_mem_unmap(struct nvkm_object *object)
> +{
> +	struct nvkm_fifo_chan *chan =3D nvkm_fifo_chan(object);
> +
> +	pr_info("> %s(object=3D%px)\n", __func__, object);
> +
> +	nvkm_done(chan->mem);
> +
> +	pr_info("< %s()\n", __func__);
> +	return 0;
> +}
> +
> +static int
> +nvkm_fifo_chan_mem_rd32(struct nvkm_object *object, u64 addr, u32 *data)
> +{
> +	struct nvkm_fifo_chan *chan =3D nvkm_fifo_chan(object);
> +
> +	pr_info("> %s(object=3D%px, addr=3D%016llx, data=3D%px)\n", __func__, o=
bject, addr, data);
> +
> +	if (unlikely(addr + 4 > chan->size))
> +		return -EINVAL;
> +
> +	*data =3D nvkm_ro32(chan->mem, addr);
> +
> +	pr_info("  data: %08x\n", *data);
> +	pr_info("< %s()\n", __func__);
> +	return 0;
> +}
> +
> +static int
> +nvkm_fifo_chan_mem_wr32(struct nvkm_object *object, u64 addr, u32 data)
> +{
> +	struct nvkm_fifo_chan *chan =3D nvkm_fifo_chan(object);
> +
> +	pr_info("> %s(object=3D%px, addr=3D%016llx, data=3D%08x)\n", __func__, =
object, addr, data);
> +
> +	if (unlikely(addr + 4 > chan->size))
> +		return -EINVAL;
> +
> +	nvkm_wo32(chan->mem, addr, data);
> +
> +	/* XXX add barrier */
> +
> +	pr_info("< %s()\n", __func__);
> +	return 0;
> +}
> +
> +static const struct nvkm_object_func
> +nvkm_fifo_chan_mem_func =3D {
> +	.dtor =3D nvkm_fifo_chan_mem_dtor,
> +	.init =3D nvkm_fifo_chan_init,
> +	.fini =3D nvkm_fifo_chan_fini,
> +	.ntfy =3D nvkm_fifo_chan_ntfy,
> +	.map =3D nvkm_fifo_chan_mem_map,
> +	.unmap =3D nvkm_fifo_chan_mem_unmap,
> +	.rd32 =3D nvkm_fifo_chan_mem_rd32,
> +	.wr32 =3D nvkm_fifo_chan_mem_wr32,
> +	.sclass =3D nvkm_fifo_chan_child_get,
> +};
> +
>  int
> -nvkm_fifo_chan_ctor(const struct nvkm_fifo_chan_func *func,
> -		    struct nvkm_fifo *fifo, u32 size, u32 align, bool zero,
> -		    u64 hvmm, u64 push, u64 engines, int bar, u32 base,
> -		    u32 user, const struct nvkm_oclass *oclass,
> -		    struct nvkm_fifo_chan *chan)
> +__nvkm_fifo_chan_ctor(const struct nvkm_fifo_chan_func *func,
> +		      struct nvkm_fifo *fifo, u32 size, u32 align, bool zero,
> +		      u64 hvmm, u64 push, u64 engines,
> +		      const struct nvkm_oclass *oclass,
> +		      struct nvkm_fifo_chan *chan)
>  {
>  	struct nvkm_client *client =3D oclass->client;
>  	struct nvkm_device *device =3D fifo->engine.subdev.device;
> @@ -362,7 +456,6 @@ nvkm_fifo_chan_ctor(const struct nvkm_fifo_chan_func =
*func,
>  	unsigned long flags;
>  	int ret;
> =20
> -	nvkm_object_ctor(&nvkm_fifo_chan_func, oclass, &chan->object);
>  	chan->func =3D func;
>  	chan->fifo =3D fifo;
>  	chan->engines =3D engines;
> @@ -412,6 +505,26 @@ nvkm_fifo_chan_ctor(const struct nvkm_fifo_chan_func=
 *func,
>  	__set_bit(chan->chid, fifo->mask);
>  	spin_unlock_irqrestore(&fifo->lock, flags);
> =20
> +	return 0;
> +}
> +
> +int
> +nvkm_fifo_chan_ctor(const struct nvkm_fifo_chan_func *func,
> +		    struct nvkm_fifo *fifo, u32 size, u32 align, bool zero,
> +		    u64 hvmm, u64 push, u64 engines, int bar, u32 base,
> +		    u32 user, const struct nvkm_oclass *oclass,
> +		    struct nvkm_fifo_chan *chan)
> +{
> +	struct nvkm_device *device =3D fifo->engine.subdev.device;
> +	int ret;
> +
> +	nvkm_object_ctor(&nvkm_fifo_chan_func, oclass, &chan->object);
> +
> +	ret =3D __nvkm_fifo_chan_ctor(func, fifo, size, align, zero, hvmm, push,
> +				    engines, oclass, chan);
> +	if (ret)
> +		return ret;
> +
>  	/* determine address of this channel's user registers */
>  	chan->addr =3D device->func->resource_addr(device, bar) +
>  		     base + user * chan->chid;
> @@ -420,3 +533,27 @@ nvkm_fifo_chan_ctor(const struct nvkm_fifo_chan_func=
 *func,
>  	nvkm_fifo_cevent(fifo);
>  	return 0;
>  }
> +
> +int nvkm_fifo_chan_mem_ctor(const struct nvkm_fifo_chan_func *func,
> +			    struct nvkm_fifo *fifo, u32 size, u32 align,
> +			    bool zero, u64 hvmm, u64 push, u64 engines,
> +			    struct nvkm_memory *mem, u32 user,
> +			    const struct nvkm_oclass *oclass,
> +			    struct nvkm_fifo_chan *chan)
> +{
> +	int ret;
> +
> +	nvkm_object_ctor(&nvkm_fifo_chan_mem_func, oclass, &chan->object);
> +
> +	ret =3D __nvkm_fifo_chan_ctor(func, fifo, size, align, zero, hvmm, push,
> +				    engines, oclass, chan);
> +	if (ret)
> +		return ret;
> +
> +	chan->mem =3D mem;
> +	chan->addr =3D user * chan->chid;
> +	chan->size =3D user;
> +
> +	nvkm_fifo_cevent(fifo);
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h b/drivers/gp=
u/drm/nouveau/nvkm/engine/fifo/chan.h
> index 177e10562600..71f32b1ebba0 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h
> @@ -24,6 +24,12 @@ int nvkm_fifo_chan_ctor(const struct nvkm_fifo_chan_fu=
nc *, struct nvkm_fifo *,
>  			u32 size, u32 align, bool zero, u64 vm, u64 push,
>  			u64 engines, int bar, u32 base, u32 user,
>  			const struct nvkm_oclass *, struct nvkm_fifo_chan *);
> +int nvkm_fifo_chan_mem_ctor(const struct nvkm_fifo_chan_func *,
> +			    struct nvkm_fifo *, u32 size, u32 align,
> +			    bool zero, u64 vm, u64 push, u64 engines,
> +			    struct nvkm_memory *mem, u32 user,
> +			    const struct nvkm_oclass *,
> +			    struct nvkm_fifo_chan *);
> =20
>  struct nvkm_fifo_chan_oclass {
>  	int (*ctor)(struct nvkm_fifo *, const struct nvkm_oclass *,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/fifo/gk104.c
> index 81cbe1cc4804..5404a182eb0a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> @@ -906,7 +906,6 @@ gk104_fifo_oneinit(struct nvkm_fifo *base)
>  	struct gk104_fifo *fifo =3D gk104_fifo(base);
>  	struct nvkm_subdev *subdev =3D &fifo->base.engine.subdev;
>  	struct nvkm_device *device =3D subdev->device;
> -	struct nvkm_vmm *bar =3D nvkm_bar_bar1_vmm(device);
>  	int engn, runl, pbid, ret, i, j;
>  	enum nvkm_devidx engidx;
>  	u32 *map;
> @@ -967,12 +966,19 @@ gk104_fifo_oneinit(struct nvkm_fifo *base)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D nvkm_vmm_get(bar, 12, nvkm_memory_size(fifo->user.mem),
> -			   &fifo->user.bar);
> -	if (ret)
> -		return ret;
> +	if (device->bar) {
> +		struct nvkm_vmm *bar =3D nvkm_bar_bar1_vmm(device);
> +
> +		ret =3D nvkm_vmm_get(bar, 12, nvkm_memory_size(fifo->user.mem),
> +				   &fifo->user.bar);
> +		if (ret)
> +			return ret;
> +
> +		return nvkm_memory_map(fifo->user.mem, 0, bar, fifo->user.bar,
> +				       NULL, 0);
> +	}
> =20
> -	return nvkm_memory_map(fifo->user.mem, 0, bar, fifo->user.bar, NULL, 0);
> +	return 0;
>  }
> =20
>  static void
> @@ -998,7 +1004,12 @@ gk104_fifo_init(struct nvkm_fifo *base)
>  		nvkm_wr32(device, 0x04014c + (i * 0x2000), 0xffffffff); /* INTREN */
>  	}
> =20
> -	nvkm_wr32(device, 0x002254, 0x10000000 | fifo->user.bar->addr >> 12);
> +	/* obsolete on GV100 and later */
> +	if (fifo->user.bar) {
> +		u32 value =3D 0x10000000 | fifo->user.bar->addr >> 12;
> +
> +		nvkm_wr32(device, 0x002254, value);
> +	}
> =20
>  	if (fifo->func->pbdma->init_timeout)
>  		fifo->func->pbdma->init_timeout(fifo);
> @@ -1014,7 +1025,9 @@ gk104_fifo_dtor(struct nvkm_fifo *base)
>  	struct nvkm_device *device =3D fifo->base.engine.subdev.device;
>  	int i;
> =20
> -	nvkm_vmm_put(nvkm_bar_bar1_vmm(device), &fifo->user.bar);
> +	if (fifo->user.bar)
> +		nvkm_vmm_put(nvkm_bar_bar1_vmm(device), &fifo->user.bar);
> +
>  	nvkm_memory_unref(&fifo->user.mem);
> =20
>  	for (i =3D 0; i < fifo->runlist_nr; i++) {
> --=20
> 2.23.0
>=20

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3FrukACgkQ3SOs138+
s6FCfQ//WEwmHW/OWX0l9EtaTw76u3KKHpm9v7JtQSOq/BxDIIBlAQFbihc40EmL
wk9V5ZPycp90LzuO6uQRHP3hpcCe+jxKd8awCXKFWrxlm8Piav79F5Ffzx6/VR0t
33NHsHeVWqMZK9qvKrKB8EuMLOis8PIV4JYtwEclGIIpEzKoauknX/YpavS2nVgc
bCmIORztrvrqX+TfdTl3e3TwBW7XwbR/yJdYHZqNBuYeS0czNtXpf7TZmpV+64Tc
wSYoeMQAp9xYZJyBAgbwxUJnYIBETjIzQXjs9seuKEnS0EqXd1BZXcSOhbOoH+U5
eQDc01J/r6VTc/xGuZkD00qmfuvpr890FwvPmCrRS0Oe2l6Cb3Lq2O2GRlQridE+
sCgIEcSIJNokxE/VxhGrnnROzuieqehD8pQpFr7nGpcqv3LYTfM/jGVcqwbh+82j
wYTQq68cBA9Qu1ob6k4Yy6IaKihk9v1HhbwAby/kdUxSpLYVt/BfJc3nDlEJ1nvi
yZeAFZYrUh/fF81OnqdMseayho3J9uWJ96fP7OgtdUIeHcu/dUKWiaUxMSn142v9
FTCxSawp7TP5b9wqB568gbySP+LzkkKHB8p8onF6Cro4FFVJcAcaw0rUAJugj0AH
+8wSbtiB4eq48HE5teCADsRZW0Ti5dNIvhSHkVebM9PCOlwVegA=
=NYiW
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--

--===============0199260400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0199260400==--
