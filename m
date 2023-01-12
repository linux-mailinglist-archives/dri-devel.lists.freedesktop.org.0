Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C8C667169
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 12:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C195710E1AE;
	Thu, 12 Jan 2023 11:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF8110E1AE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 11:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nn+6E23P6RNGiwUD+6hEYUMOp6Ufqytp79bVgU/+tww=; b=evv4CRX3obk0vRwYdlGVwkS3Gv
 aUZ0c215dgylANSYMNnn+vdaAQGbQb1aaT+ZIpaO+TwrXQOjAxpTrFs7YykZif4l5N+gEO8Zid4OS
 0Yz7JL8BFvw+gI2BsWLO6egv0AG2VpdWCqGLhAuwUceqm3UkyfrSbQK2tvfGrUWWuGejLz/v5lTdT
 KpgOs1sKWIo3aEmGwxF+wWE+LKjeXikS+CgoEjDEEFK0LtE2oFZw4IjptfnanyTjMNNqTT4RjoYBx
 /JYqpvIYSkk5nQoU5RWwLl5mhB5NznHI9G71dQQJx4Q4GWLxzdw2lpxpw1EbW2Irw7ic4fqun97P2
 TtPg6ZHw==;
Received: from [38.44.66.31] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pFwCq-006HcG-In; Thu, 12 Jan 2023 12:57:16 +0100
Date: Thu, 12 Jan 2023 10:57:13 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v3] drm/vkms: reintroduce prepare_fb and cleanup_fb
 functions
Message-ID: <20230112115713.6wlw5pmvzrboviqj@mail.igalia.com>
References: <20230111131304.106039-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qakfrsz2od7pjlea"
Content-Disposition: inline
In-Reply-To: <20230111131304.106039-1-mcanal@igalia.com>
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
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qakfrsz2od7pjlea
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/11, Ma=EDra Canal wrote:
> With commit 359c6649cd9a ("drm/gem: Implement shadow-plane {begin,
> end}_fb_access with vmap"), the behavior of the shadow-plane helpers
> changed and the vunmap is now performed at the end of
> the current pageflip, instead of the end of the following pageflip.

Applied to drm-misc-next.

Thank you,

Melissa

>=20
> By performing the vunmap at the end of the current pageflip, invalid
> memory is accessed by the vkms during the plane composition, as the data
> is being unmapped before being used, as reported by the following
> warning:
>=20
>  [  275.866047] BUG: unable to handle page fault for address: ffffb382814=
e8002
>  [  275.866055] #PF: supervisor read access in kernel mode
>  [  275.866058] #PF: error_code(0x0000) - not-present page
>  [  275.866061] PGD 1000067 P4D 1000067 PUD 110a067 PMD 46e3067 PTE 0
>  [  275.866066] Oops: 0000 [#1] PREEMPT SMP PTI
>  [  275.866070] CPU: 2 PID: 49 Comm: kworker/u8:2 Not tainted 6.1.0-rc6-0=
0018-gb357e7ac1b73-dirty #54
>  [  275.866074] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS 1.16.1-2.fc37 04/01/2014
>  [  275.866076] Workqueue: vkms_composer vkms_composer_worker [vkms]
>  [  275.866084] RIP: 0010:XRGB8888_to_argb_u16+0x5c/0xa0 [vkms]
>  [  275.866092] Code: bf 56 0a 0f af 56 70 48 8b 76 28 01 ca 49 83 f8 02
>  41 b9 01 00 00 00 4d 0f 43 c8 48 01 f2 48 83 c2 02 31 f6 66 c7 04 f0 ff
>  ff <0f> b6 0c b2 89 cf c1 e7 08 09 cf 66 89 7c f0 02 0f b6 4c b2 ff 89
>  [  275.866095] RSP: 0018:ffffb382801b7db0 EFLAGS: 00010246
>  [  275.866098] RAX: ffff896336ace000 RBX: ffff896310e293c0 RCX: 00000000=
00000000
>  [  275.866101] RDX: ffffb382814e8002 RSI: 0000000000000000 RDI: ffffb382=
801b7de8
>  [  275.866103] RBP: 0000000000001400 R08: 0000000000000280 R09: 00000000=
00000280
>  [  275.866105] R10: 0000000000000010 R11: ffffffffc011d990 R12: ffff8963=
02a1ece0
>  [  275.866107] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000=
80008001
>  [  275.866109] FS:  0000000000000000(0000) GS:ffff89637dd00000(0000) knl=
GS:0000000000000000
>  [  275.866112] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  [  275.866114] CR2: ffffb382814e8002 CR3: 0000000003bb4000 CR4: 00000000=
000006e0
>  [  275.866120] Call Trace:
>  [  275.866123]  <TASK>
>  [  275.866124]  compose_active_planes+0x1c4/0x380 [vkms]
>  [  275.866132]  vkms_composer_worker+0x9f/0x130 [vkms]
>  [  275.866139]  process_one_work+0x1c0/0x370
>  [  275.866160]  worker_thread+0x221/0x410
>  [  275.866164]  ? worker_clr_flags+0x50/0x50
>  [  275.866167]  kthread+0xe1/0x100
>  [  275.866172]  ? kthread_blkcg+0x30/0x30
>  [  275.866176]  ret_from_fork+0x22/0x30
>  [  275.866181]  </TASK>
>  [  275.866182] Modules linked in: vkms
>  [  275.866186] CR2: ffffb382814e8002
>  [  275.866191] ---[ end trace 0000000000000000 ]---
>=20
> Therefore, introduce again prepare_fb and cleanup_fb functions to the
> vkms, which were previously removed on commit b43e2ec03b0d ("drm/vkms:
> Let shadow-plane helpers prepare the plane's FB").
>=20
> Fixes: 359c6649cd9a ("drm/gem: Implement shadow-plane {begin, end}_fb_acc=
ess with vmap")
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
> v1 -> v2: https://lore.kernel.org/dri-devel/19951367-2ef0-0f26-ddf0-89325=
9d9a5ef@igalia.com/T/
>=20
> - Add kernel oops to the commit description (Melissa Wen).
> - s/introduce/reintroduce/ in the title (Melissa Wen).
> - Add Thomas's Acked-by.
>=20
> v2 -> v3: https://lore.kernel.org/dri-devel/20230106115759.213710-1-mcana=
l@igalia.com/T/
>=20
> - Add Daniel's Reviewed-by.
> - Resend patch due to corrupted mailbox.
> ---
>  drivers/gpu/drm/vkms/vkms_plane.c | 36 ++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index c3a845220e10..b3f8a115cc23 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -160,10 +160,44 @@ static int vkms_plane_atomic_check(struct drm_plane=
 *plane,
>  	return 0;
>  }
> =20
> +static int vkms_prepare_fb(struct drm_plane *plane,
> +			   struct drm_plane_state *state)
> +{
> +	struct drm_shadow_plane_state *shadow_plane_state;
> +	struct drm_framebuffer *fb =3D state->fb;
> +	int ret;
> +
> +	if (!fb)
> +		return 0;
> +
> +	shadow_plane_state =3D to_drm_shadow_plane_state(state);
> +
> +	ret =3D drm_gem_plane_helper_prepare_fb(plane, state);
> +	if (ret)
> +		return ret;
> +
> +	return drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state-=
>data);
> +}
> +
> +static void vkms_cleanup_fb(struct drm_plane *plane,
> +			    struct drm_plane_state *state)
> +{
> +	struct drm_shadow_plane_state *shadow_plane_state;
> +	struct drm_framebuffer *fb =3D state->fb;
> +
> +	if (!fb)
> +		return;
> +
> +	shadow_plane_state =3D to_drm_shadow_plane_state(state);
> +
> +	drm_gem_fb_vunmap(fb, shadow_plane_state->map);
> +}
> +
>  static const struct drm_plane_helper_funcs vkms_primary_helper_funcs =3D=
 {
>  	.atomic_update		=3D vkms_plane_atomic_update,
>  	.atomic_check		=3D vkms_plane_atomic_check,
> -	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +	.prepare_fb		=3D vkms_prepare_fb,
> +	.cleanup_fb		=3D vkms_cleanup_fb,
>  };
> =20
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> --=20
> 2.39.0
>=20

--qakfrsz2od7pjlea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmO/9Y8ACgkQwqF3j0dL
ehzbZA//X6qONBL/3Uykb4gvSB8Y2ek+vohQqR0LtzQqBeepmgnxlFQnN/dMkmMe
AIZEXw2dOs4Gm9SArbLAjihOwOImkXCeE4vGssBh+5Tr7mdkefG3qAsofxXLHiJB
SKMcgGDO1ropC6Y9FJcdz6SLWkz8yqH2BI++li8uTHuNKE2EDuuL/NPvxm++u3nt
7ei3Q+dMKMYRA+xAx1dg0CgmfBxsEk1vmN7zxEu2m3K6d6xQjF8uBh0ckS4HL2ta
da7CAccK403aGKOI/5oEu1vS+gCqREG585VHLDR8elMKq3seAXBT+bwvLLnn+DFa
QDud1awAcR52AzKmeyClU4b5wgO5RDmiwE5Wz9kZDWz0X6BzREXg7cyxzaHr/N7J
/NYzMeJHisqi9622/fD8wHIQz2C+lae13qSgevR5oB4AL9A/4x5vRVp13J7HQ2+F
bjlVCS/01tBhNHXvHs4dfvTVoiPaV3uDa2xLflJWZDsV/pmHrolvpGwgPX0onSO9
E5K3LmmooNvmZHrT8EEC3UnB4Dxf92RWzOn3ENnRc/hbKNEGetGQ/aM8fUvPgcsN
0oPSjXDbqM1i8AUBjbrq2r4vgarkVACCvmpmPyTsJaJbvQO4tOspAz0OSpHQO37R
XXn7mzxpYkvBOdmOwZ1FSbY5HluNuQZDtoaDowxTnEwGbYWXcew=
=uQj6
-----END PGP SIGNATURE-----

--qakfrsz2od7pjlea--
