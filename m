Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 269636A9181
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 08:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F82910E601;
	Fri,  3 Mar 2023 07:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D8D10E032;
 Fri,  3 Mar 2023 07:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677827631; x=1709363631;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=s0IFmdT7IJACtVfSrsDyIVHVJ5Wmt3QuzZohLrmgr8o=;
 b=kcvDa2V7xmFwMdRUYUbGqoUMeM5pc5D5NSyaYUNfwxXi00uTP9dAYps1
 M5knkqxwagDMAa4/iMrzPvRQMfe+Jp1bDtbfMw15moao+EIMgEy6du28R
 L5uzXMt2IEElQLuthYOdrA/jbTbw3bg5pyLqqxodf9VjtCJG5jIsD+maS
 MP4aRbpAGEOTsyG654YSawX0Xz2Qq0RRQXFGqHA8z5fnjkjd2UKcsVzZz
 odXpAWZSUGjBvnFbSUUtWivxdfIBMImdUYfholU4bMv4+W78737jaXoF9
 /MKg5yYKKZBtojV7fVhey7VtGr2flTon4dGCv62I8aEhHYXfL0bczhesN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="336495446"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
 d="asc'?scan'208";a="336495446"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 23:13:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="799141534"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
 d="asc'?scan'208";a="799141534"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.159.40])
 by orsmga004.jf.intel.com with ESMTP; 02 Mar 2023 23:13:46 -0800
Date: Fri, 3 Mar 2023 15:12:16 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH] drm/i915/gvt: Make use of idr_find and
 idr_for_each_entry in dmabuf
Message-ID: <ZAGd0CeJ1OF6yCfg@debian-scheme>
References: <20230302115318.79487-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="VburrAZD58uFFpgd"
Content-Disposition: inline
In-Reply-To: <20230302115318.79487-1-cai.huoqing@linux.dev>
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--VburrAZD58uFFpgd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023.03.02 19:53:18 +0800, Cai Huoqing wrote:
> This patch uses the already existing IDR mechanism to simplify
> and improve the dmabuf code.
>=20
> Using 'vgpu.object_idr' directly instead of 'dmabuf_obj_list_head'
> or 'dmabuf.list', because the dmabuf_obj can be found by 'idr_find'
> or 'idr_for_each_entry'.
>=20
> Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c | 69 +++++++------------------------
>  drivers/gpu/drm/i915/gvt/dmabuf.h |  1 -
>  drivers/gpu/drm/i915/gvt/gvt.h    |  1 -
>  drivers/gpu/drm/i915/gvt/vgpu.c   |  1 -
>  4 files changed, 16 insertions(+), 56 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt=
/dmabuf.c
> index 6834f9fe40cf..7933bd843ae8 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -133,21 +133,15 @@ static void dmabuf_gem_object_free(struct kref *kre=
f)
>  	struct intel_vgpu_dmabuf_obj *obj =3D
>  		container_of(kref, struct intel_vgpu_dmabuf_obj, kref);
>  	struct intel_vgpu *vgpu =3D obj->vgpu;
> -	struct list_head *pos;
>  	struct intel_vgpu_dmabuf_obj *dmabuf_obj;
> +	int id;
> =20
> -	if (vgpu && test_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status) &&
> -	    !list_empty(&vgpu->dmabuf_obj_list_head)) {
> -		list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
> -			dmabuf_obj =3D list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
> -			if (dmabuf_obj =3D=3D obj) {
> -				list_del(pos);
> -				idr_remove(&vgpu->object_idr,
> -					   dmabuf_obj->dmabuf_id);
> -				kfree(dmabuf_obj->info);
> -				kfree(dmabuf_obj);
> -				break;
> -			}
> +	if (vgpu && test_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status)) {
> +		idr_for_each_entry(&vgpu->object_idr, dmabuf_obj, id) {
> +			idr_remove(&vgpu->object_idr, id);
> +			kfree(dmabuf_obj->info);
> +			kfree(dmabuf_obj);

This is wrong, it is not to free all dmabuf objects, but just for target on=
e.

> +			break;
>  		}
>  	} else {
>  		/* Free the orphan dmabuf_objs here */
> @@ -340,13 +334,11 @@ static struct intel_vgpu_dmabuf_obj *
>  pick_dmabuf_by_info(struct intel_vgpu *vgpu,
>  		    struct intel_vgpu_fb_info *latest_info)
>  {
> -	struct list_head *pos;
>  	struct intel_vgpu_fb_info *fb_info;
>  	struct intel_vgpu_dmabuf_obj *dmabuf_obj =3D NULL;
> -	struct intel_vgpu_dmabuf_obj *ret =3D NULL;
> +	int id;
> =20
> -	list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
> -		dmabuf_obj =3D list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
> +	idr_for_each_entry(&vgpu->object_idr, dmabuf_obj, id) {
>  		if (!dmabuf_obj->info)
>  			continue;
> =20
> @@ -357,31 +349,11 @@ pick_dmabuf_by_info(struct intel_vgpu *vgpu,
>  		    (fb_info->drm_format_mod =3D=3D latest_info->drm_format_mod) &&
>  		    (fb_info->drm_format =3D=3D latest_info->drm_format) &&
>  		    (fb_info->width =3D=3D latest_info->width) &&
> -		    (fb_info->height =3D=3D latest_info->height)) {
> -			ret =3D dmabuf_obj;
> -			break;
> -		}

Maybe just keep original code's use of extra ret to not include this cumber=
some diff?

> -	}
> -
> -	return ret;
> -}
> -
> -static struct intel_vgpu_dmabuf_obj *
> -pick_dmabuf_by_num(struct intel_vgpu *vgpu, u32 id)
> -{
> -	struct list_head *pos;
> -	struct intel_vgpu_dmabuf_obj *dmabuf_obj =3D NULL;
> -	struct intel_vgpu_dmabuf_obj *ret =3D NULL;
> -
> -	list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
> -		dmabuf_obj =3D list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
> -		if (dmabuf_obj->dmabuf_id =3D=3D id) {
> -			ret =3D dmabuf_obj;
> -			break;
> -		}
> +		    (fb_info->height =3D=3D latest_info->height))
> +			return dmabuf_obj;
>  	}
> =20
> -	return ret;
> +	return dmabuf_obj;
>  }
> =20
>  static void update_fb_info(struct vfio_device_gfx_plane_info *gvt_dmabuf,
> @@ -477,11 +449,6 @@ int intel_vgpu_query_plane(struct intel_vgpu *vgpu, =
void *args)
> =20
>  	update_fb_info(gfx_plane_info, &fb_info);
> =20
> -	INIT_LIST_HEAD(&dmabuf_obj->list);
> -	mutex_lock(&vgpu->dmabuf_lock);
> -	list_add_tail(&dmabuf_obj->list, &vgpu->dmabuf_obj_list_head);
> -	mutex_unlock(&vgpu->dmabuf_lock);
> -
>  	gvt_dbg_dpy("vgpu%d: %s new dmabuf_obj ref %d, id %d\n", vgpu->id,
>  		    __func__, kref_read(&dmabuf_obj->kref), ret);
> =20
> @@ -508,7 +475,7 @@ int intel_vgpu_get_dmabuf(struct intel_vgpu *vgpu, un=
signed int dmabuf_id)
> =20
>  	mutex_lock(&vgpu->dmabuf_lock);
> =20
> -	dmabuf_obj =3D pick_dmabuf_by_num(vgpu, dmabuf_id);
> +	dmabuf_obj =3D idr_find(&vgpu->object_idr, dmabuf_id);
>  	if (dmabuf_obj =3D=3D NULL) {
>  		gvt_vgpu_err("invalid dmabuf id:%d\n", dmabuf_id);
>  		ret =3D -EINVAL;
> @@ -570,23 +537,19 @@ int intel_vgpu_get_dmabuf(struct intel_vgpu *vgpu, =
unsigned int dmabuf_id)
> =20
>  void intel_vgpu_dmabuf_cleanup(struct intel_vgpu *vgpu)
>  {
> -	struct list_head *pos, *n;
>  	struct intel_vgpu_dmabuf_obj *dmabuf_obj;
> +	int id;
> =20
>  	mutex_lock(&vgpu->dmabuf_lock);
> -	list_for_each_safe(pos, n, &vgpu->dmabuf_obj_list_head) {
> -		dmabuf_obj =3D list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
> +	idr_for_each_entry(&vgpu->object_idr, dmabuf_obj, id) {
>  		dmabuf_obj->vgpu =3D NULL;
> =20
> -		idr_remove(&vgpu->object_idr, dmabuf_obj->dmabuf_id);
> -		list_del(pos);
> -
> +		idr_remove(&vgpu->object_idr, id);
>  		/* dmabuf_obj might be freed in dmabuf_obj_put */
>  		if (dmabuf_obj->initref) {
>  			dmabuf_obj->initref =3D false;
>  			dmabuf_obj_put(dmabuf_obj);
>  		}
> -
>  	}
>  	mutex_unlock(&vgpu->dmabuf_lock);
>  }
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.h b/drivers/gpu/drm/i915/gvt=
/dmabuf.h
> index 3dcdb6570eda..93c0e00bdab9 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.h
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.h
> @@ -57,7 +57,6 @@ struct intel_vgpu_dmabuf_obj {
>  	__u32 dmabuf_id;
>  	struct kref kref;
>  	bool initref;
> -	struct list_head list;
>  };
> =20
>  int intel_vgpu_query_plane(struct intel_vgpu *vgpu, void *args);
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index 2d65800d8e93..1100c789f207 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -211,7 +211,6 @@ struct intel_vgpu {
> =20
>  	struct dentry *debugfs;
> =20
> -	struct list_head dmabuf_obj_list_head;
>  	struct mutex dmabuf_lock;
>  	struct idr object_idr;
>  	struct intel_vgpu_vblank_timer vblank_timer;
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/v=
gpu.c
> index 08ad1bd651f1..0a511cfef067 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -329,7 +329,6 @@ int intel_gvt_create_vgpu(struct intel_vgpu *vgpu,
>  	vgpu->sched_ctl.weight =3D conf->weight;
>  	mutex_init(&vgpu->vgpu_lock);
>  	mutex_init(&vgpu->dmabuf_lock);
> -	INIT_LIST_HEAD(&vgpu->dmabuf_obj_list_head);
>  	INIT_RADIX_TREE(&vgpu->page_track_tree, GFP_KERNEL);
>  	idr_init_base(&vgpu->object_idr, 1);
>  	intel_vgpu_init_cfg_space(vgpu, 1);
> --=20
> 2.34.1
>=20

--VburrAZD58uFFpgd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCZAGdywAKCRCxBBozTXgY
J7AvAKCANbRmC8f7GuSmxqq1oYa2VFP1RQCeMhxxy/zqe2EQAxG16vXIbISGjpQ=
=uJOk
-----END PGP SIGNATURE-----

--VburrAZD58uFFpgd--
