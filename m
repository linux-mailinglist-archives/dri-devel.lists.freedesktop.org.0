Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD378CFBF
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 11:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0396E48B;
	Wed, 14 Aug 2019 09:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05A789FC5;
 Wed, 14 Aug 2019 09:35:28 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e8so2911597wme.1;
 Wed, 14 Aug 2019 02:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nwU80v4JKPMaMUbaYZZjsQS5d6owvxjLBz4fx7T/RRQ=;
 b=AlJQrBXKlKMQIdGfwAu1pitQRpaP8r1ESaIjRtdXItZGz/ilA31P1hAAUaSv4KcrEI
 +pZXJgbBsBHcmfQfpfYGAtfhb+p49H2jFl/SQYViHCeZsLdvaUrmemlLBt3fPtb/AcGT
 8zXAkdp5JENm7nZ4Cae/Ri9JP45DtqYs68RLW/5tybcjD3Kp5rtaoGfN5Gx+6azSlkub
 VkEPwBVR8zXN7ovNUTWVHz/H87O/sx/apiqO0JxMhNczWd2TH4Yt0Goa4WtzdOcCa9YE
 sHdwF1HWIslQoZgnlETeELiNJ82GQRKxEDh/PBUEumgx4/k096YwHF3CdK5jnqONpUw9
 0SmA==
X-Gm-Message-State: APjAAAX+9WiaP/SOQAlyNjWdyZceLjoINAvof4zcN3CK3L9DQ0q6f/1B
 6wY2oF8sktWAIxoLrVl1byU=
X-Google-Smtp-Source: APXvYqxD/TroAt10O6EVVgR+RdDAw1P+WUQVi2UtWdFE9Qvtt5492UZS76a+yyP5+xqyKX/P0TM8LQ==
X-Received: by 2002:a7b:c118:: with SMTP id w24mr7660942wmi.100.1565775327087; 
 Wed, 14 Aug 2019 02:35:27 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id c65sm6431829wma.44.2019.08.14.02.35.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 02:35:25 -0700 (PDT)
Date: Wed, 14 Aug 2019 11:35:24 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v6 08/17] drm/ttm: use gem vma_node
Message-ID: <20190814093524.GA31345@ulmo>
References: <20190805140119.7337-1-kraxel@redhat.com>
 <20190805140119.7337-9-kraxel@redhat.com>
 <20190813151115.GA29955@ulmo>
 <20190814055827.6hrxj6daovxxnnvw@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20190814055827.6hrxj6daovxxnnvw@sirius.home.kraxel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nwU80v4JKPMaMUbaYZZjsQS5d6owvxjLBz4fx7T/RRQ=;
 b=QS55lw0ij7PvfXdioktNwqhhsxjDgeKtMPHqLVruJJW9/lhb7cutH1iAktvO3jQ46Y
 qeYdZ+/WU6ZZi39/fa6CG46ZZePmFjg5VvJkkCfMbXWntxh8VHKQ/f4qB8CEpgw/Gm7+
 HTOyV8EK6NuLVOEIl09ba5q8iqdP7BImoy5NhHcxElEv2yIMWlcHzY7mTrbp/KA/f9YB
 eLk2r1jwpYxKChGhexDpPCKZiwFlqctzAJflfghf86WrOoJlX58Mteo7LekOGufYcl8S
 78Xh9ruaPnwyIYks7pfNZo6TsMxrXsBvE0f9wREO+OqE8ynCR3NEXL8/lGv3sjbRhg2J
 BuMw==
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
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-graphics-maintainer@vmware.com,
 Ben Skeggs <bskeggs@redhat.com>, spice-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0791486690=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0791486690==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Content-Disposition: inline


--2JFBq9zoW8cOFH7v
Content-Type: multipart/mixed; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2019 at 07:58:27AM +0200, Gerd Hoffmann wrote:
> > Hi Gerd,
> >=20
> > I've been seeing a regression on Nouveau with recent linux-next releases
> > and git bisect points at this commit as the first bad one. If I revert
> > it (there's a tiny conflict with a patch that was merged subsequently),
> > things are back to normal.
> >=20
> > I think the reason for this issue is that Nouveau doesn't use GEM
> > objects for all buffer objects,
>=20
> That shouldn't be a problem ...
>=20
> > and even when it uses GEM objects, the
> > code will not initialize the GEM object until after the buffer objects
> > and the backing TTM objects have been created.
>=20
> ... but the initialization order is.
>=20
> ttm_bo_uses_embedded_gem_object() assumes gem gets initialized first.
>=20
> drm_gem_object_init() init calling drm_vma_node_reset() again is
> probably the root cause for the breakage.
>=20
> > I tried to fix that by making sure drm_gem_object_init() gets called by
> > Nouveau before ttm_bo_init(), but the changes are fairly involved and I
> > was unable to get the GEM reference counting right. I can look into the
> > proper fix some more, but it might be worth reverting this patch for
> > now to get Nouveau working again.
>=20
> Changing the order doesn't look hard.  Patch attached (untested, have no
> test hardware).  But maybe I missed some detail ...
>=20
> The other patch attached works around the issue with a flag, to avoid
> drm_vma_node_reset() being called twice.

I came up with something very similar by splitting up nouveau_bo_new()
into allocation and initialization steps, so that when necessary the GEM
object can be initialized in between. I think that's slightly more
flexible and easier to understand than a boolean flag.

Thierry

--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline;
	filename="0001-drm-nouveau-Initialize-GEM-object-before-TTM-object.patch"
Content-Transfer-Encoding: quoted-printable

=46rom a1130a6affcb7c00133e89f3e498cb6757f5bb51 Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Wed, 14 Aug 2019 11:00:48 +0200
Subject: [PATCH] drm/nouveau: Initialize GEM object before TTM object

TTM assumes that drivers initialize the embedded GEM object before
calling the ttm_bo_init() function. This is not currently the case
in the Nouveau driver. Fix this by splitting up nouveau_bo_new()
into nouveau_bo_alloc() and nouveau_bo_init() so that the GEM can
be initialized before TTM BO initialization when necessary.

Fixes: b96f3e7c8069 ("drm/ttm: use gem vma_node")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 69 ++++++++++++++++---------
 drivers/gpu/drm/nouveau/nouveau_bo.h    |  4 ++
 drivers/gpu/drm/nouveau/nouveau_gem.c   | 29 ++++++-----
 drivers/gpu/drm/nouveau/nouveau_prime.c | 16 ++++--
 4 files changed, 77 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau=
/nouveau_bo.c
index 99e391be9370..b3d3e07de1af 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -185,31 +185,24 @@ nouveau_bo_fixup_align(struct nouveau_bo *nvbo, u32 f=
lags,
 	*size =3D roundup_64(*size, PAGE_SIZE);
 }
=20
-int
-nouveau_bo_new(struct nouveau_cli *cli, u64 size, int align,
-	       uint32_t flags, uint32_t tile_mode, uint32_t tile_flags,
-	       struct sg_table *sg, struct reservation_object *robj,
-	       struct nouveau_bo **pnvbo)
+struct nouveau_bo *
+nouveau_bo_alloc(struct nouveau_cli *cli, u64 size, u32 flags, u32 tile_mo=
de,
+		 u32 tile_flags)
 {
 	struct nouveau_drm *drm =3D cli->drm;
 	struct nouveau_bo *nvbo;
 	struct nvif_mmu *mmu =3D &cli->mmu;
 	struct nvif_vmm *vmm =3D cli->svm.cli ? &cli->svm.vmm : &cli->vmm.vmm;
-	size_t acc_size;
-	int type =3D ttm_bo_type_device;
-	int ret, i, pi =3D -1;
+	int i, pi =3D -1;
=20
 	if (!size) {
 		NV_WARN(drm, "skipped size %016llx\n", size);
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
=20
-	if (sg)
-		type =3D ttm_bo_type_sg;
-
 	nvbo =3D kzalloc(sizeof(struct nouveau_bo), GFP_KERNEL);
 	if (!nvbo)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 	INIT_LIST_HEAD(&nvbo->head);
 	INIT_LIST_HEAD(&nvbo->entry);
 	INIT_LIST_HEAD(&nvbo->vma_list);
@@ -231,7 +224,7 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int a=
lign,
 		nvbo->kind =3D (tile_flags & 0x0000ff00) >> 8;
 		if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
 			kfree(nvbo);
-			return -EINVAL;
+			return ERR_PTR(-EINVAL);
 		}
=20
 		nvbo->comp =3D mmu->kind[nvbo->kind] !=3D nvbo->kind;
@@ -241,7 +234,7 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int a=
lign,
 		nvbo->comp =3D (tile_flags & 0x00030000) >> 16;
 		if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
 			kfree(nvbo);
-			return -EINVAL;
+			return ERR_PTR(-EINVAL);
 		}
 	} else {
 		nvbo->zeta =3D (tile_flags & 0x00000007);
@@ -278,7 +271,7 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int a=
lign,
 	}
=20
 	if (WARN_ON(pi < 0))
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
=20
 	/* Disable compression if suitable settings couldn't be found. */
 	if (nvbo->comp && !vmm->page[pi].comp) {
@@ -288,23 +281,51 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int=
 align,
 	}
 	nvbo->page =3D vmm->page[pi].shift;
=20
+	return nvbo;
+}
+
+int
+nouveau_bo_init(struct nouveau_bo *nvbo, u64 size, int align, u32 flags,
+		struct sg_table *sg, struct reservation_object *robj)
+{
+	int type =3D sg ? ttm_bo_type_sg : ttm_bo_type_device;
+	size_t acc_size;
+	int ret;
+
+	acc_size =3D ttm_bo_dma_acc_size(nvbo->bo.bdev, size, sizeof(*nvbo));
+
 	nouveau_bo_fixup_align(nvbo, flags, &align, &size);
 	nvbo->bo.mem.num_pages =3D size >> PAGE_SHIFT;
 	nouveau_bo_placement_set(nvbo, flags, 0);
=20
-	acc_size =3D ttm_bo_dma_acc_size(&drm->ttm.bdev, size,
-				       sizeof(struct nouveau_bo));
-
-	ret =3D ttm_bo_init(&drm->ttm.bdev, &nvbo->bo, size,
-			  type, &nvbo->placement,
-			  align >> PAGE_SHIFT, false, acc_size, sg,
-			  robj, nouveau_bo_del_ttm);
-
+	ret =3D ttm_bo_init(nvbo->bo.bdev, &nvbo->bo, size, type,
+			  &nvbo->placement, align >> PAGE_SHIFT, false,
+			  acc_size, sg, robj, nouveau_bo_del_ttm);
 	if (ret) {
 		/* ttm will call nouveau_bo_del_ttm if it fails.. */
 		return ret;
 	}
=20
+	return 0;
+}
+
+int
+nouveau_bo_new(struct nouveau_cli *cli, u64 size, int align,
+	       uint32_t flags, uint32_t tile_mode, uint32_t tile_flags,
+	       struct sg_table *sg, struct reservation_object *robj,
+	       struct nouveau_bo **pnvbo)
+{
+	struct nouveau_bo *nvbo;
+	int ret;
+
+	nvbo =3D nouveau_bo_alloc(cli, size, flags, tile_mode, tile_flags);
+	if (IS_ERR(nvbo))
+		return PTR_ERR(nvbo);
+
+	ret =3D nouveau_bo_init(nvbo, size, align, flags, sg, robj);
+	if (ret)
+		return ret;
+
 	*pnvbo =3D nvbo;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau=
/nouveau_bo.h
index d675efe8e7f9..7529035b971f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -71,6 +71,10 @@ nouveau_bo_ref(struct nouveau_bo *ref, struct nouveau_bo=
 **pnvbo)
 extern struct ttm_bo_driver nouveau_bo_driver;
=20
 void nouveau_bo_move_init(struct nouveau_drm *);
+struct nouveau_bo *nouveau_bo_alloc(struct nouveau_cli *, u64 size, u32 fl=
ags,
+				    u32 tile_mode, u32 tile_flags);
+int  nouveau_bo_init(struct nouveau_bo *, u64 size, int align, u32 flags,
+		     struct sg_table *sg, struct reservation_object *robj);
 int  nouveau_bo_new(struct nouveau_cli *, u64 size, int align, u32 flags,
 		    u32 tile_mode, u32 tile_flags, struct sg_table *sg,
 		    struct reservation_object *robj,
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouvea=
u/nouveau_gem.c
index c7368aa0bdec..e9c772e07789 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -188,11 +188,23 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, in=
t align, uint32_t domain,
 	if (domain & NOUVEAU_GEM_DOMAIN_COHERENT)
 		flags |=3D TTM_PL_FLAG_UNCACHED;
=20
-	ret =3D nouveau_bo_new(cli, size, align, flags, tile_mode,
-			     tile_flags, NULL, NULL, pnvbo);
-	if (ret)
+	nvbo =3D nouveau_bo_alloc(cli, size, flags, tile_mode, tile_flags);
+	if (IS_ERR(nvbo))
+		return PTR_ERR(nvbo);
+
+	/* Initialize the embedded gem-object. We return a single gem-reference
+	 * to the caller, instead of a normal nouveau_bo ttm reference. */
+	ret =3D drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
+	if (ret) {
+		nouveau_bo_ref(NULL, &nvbo);
+		return ret;
+	}
+
+	ret =3D nouveau_bo_init(nvbo, size, align, flags, NULL, NULL);
+	if (ret) {
+		nouveau_bo_ref(NULL, &nvbo);
 		return ret;
-	nvbo =3D *pnvbo;
+	}
=20
 	/* we restrict allowed domains on nv50+ to only the types
 	 * that were requested at creation time.  not possibly on
@@ -203,15 +215,8 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int=
 align, uint32_t domain,
 	if (drm->client.device.info.family >=3D NV_DEVICE_INFO_V0_TESLA)
 		nvbo->valid_domains &=3D domain;
=20
-	/* Initialize the embedded gem-object. We return a single gem-reference
-	 * to the caller, instead of a normal nouveau_bo ttm reference. */
-	ret =3D drm_gem_object_init(drm->dev, &nvbo->bo.base, nvbo->bo.mem.size);
-	if (ret) {
-		nouveau_bo_ref(NULL, pnvbo);
-		return -ENOMEM;
-	}
-
 	nvbo->bo.persistent_swap_storage =3D nvbo->bo.base.filp;
+	*pnvbo =3D nvbo;
 	return 0;
 }
=20
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouv=
eau/nouveau_prime.c
index e86ad7ae622b..0ca71a84e23a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -63,28 +63,34 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_tabl=
e(struct drm_device *dev,
 	struct nouveau_drm *drm =3D nouveau_drm(dev);
 	struct nouveau_bo *nvbo;
 	struct reservation_object *robj =3D attach->dmabuf->resv;
+	size_t size =3D attach->dmabuf->size;
 	u32 flags =3D 0;
 	int ret;
=20
 	flags =3D TTM_PL_FLAG_TT;
=20
 	reservation_object_lock(robj, NULL);
-	ret =3D nouveau_bo_new(&drm->client, attach->dmabuf->size, 0, flags, 0, 0,
-			     sg, robj, &nvbo);
+	nvbo =3D nouveau_bo_alloc(&drm->client, size, flags, 0, 0);
 	reservation_object_unlock(robj);
-	if (ret)
-		return ERR_PTR(ret);
+	if (IS_ERR(nvbo))
+		return ERR_CAST(nvbo);
=20
 	nvbo->valid_domains =3D NOUVEAU_GEM_DOMAIN_GART;
=20
 	/* Initialize the embedded gem-object. We return a single gem-reference
 	 * to the caller, instead of a normal nouveau_bo ttm reference. */
-	ret =3D drm_gem_object_init(dev, &nvbo->bo.base, nvbo->bo.mem.size);
+	ret =3D drm_gem_object_init(dev, &nvbo->bo.base, size);
 	if (ret) {
 		nouveau_bo_ref(NULL, &nvbo);
 		return ERR_PTR(-ENOMEM);
 	}
=20
+	ret =3D nouveau_bo_init(nvbo, size, 0, flags, sg, robj);
+	if (ret) {
+		nouveau_bo_ref(NULL, &nvbo);
+		return ERR_PTR(ret);
+	}
+
 	return &nvbo->bo.base;
 }
=20
--=20
2.22.0


--eJnRUKwClWJh1Khz--

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1T1dkACgkQ3SOs138+
s6GGPg//XrgyQzQlwug5SUgtNlNC+x2OZkmflw6fqA4ajzFtTrxZZ2o9oZrwNYL0
TWT6d78UxZLN9Hcw6bMpgvw/bA86regVkJv+F0EqyB/F7ykTNiI0z+WtmLbf1+KY
J4PLnrNrxO9P/b/ZLhl04nw+SwIiedvMKvRDgEDTMPzJlul6S99BexcjtEavJ+lD
RIMq02ZbVbWoJuAyY2DxEl72/DWutHrrCo4esVnm+23zJtHZ5HdKJHCN2FKT04x8
U7XdFr7XFOJz15vra21kOcKWGAX2WwXRPrZkXnby60zTuGsqmrsJmSxlgDD+cwmi
PlWW2k38ZaQ2s/QVzsxwbw5at6F8oa8dDqzt/bvzqcTyjpyFglsR91HdrhFrLo1Y
yvLPoXE00wDMGIIAFC25LX4azoMx6sqVsTnN4lBRJvD5HpLbXTs6uNOaptTFkm/n
2ZV+032RA2DUen+o7dOeOn3v/GEL4LjW/pYfKn1YN6aguzTNLyrpD2zb0+jiPtcj
7P8f2Wb+ba1B20xysHmK66aIot5lBhjVFi/XNIHwwLp0pVGyHAnW6dCARdtjxNC8
tLwE+83WXMUrmpEekPP74nioj6ogMlKwjbuSmMS2k3/NhpHDJpZsraxbDxjR68oC
BAzl/fJQAGquwEHfx3gXQDWj+gJqGMaXw74xbawhS3fJQOr7k7g=
=q93D
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--

--===============0791486690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0791486690==--
