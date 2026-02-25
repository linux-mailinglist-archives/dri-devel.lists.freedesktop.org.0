Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YUnQBQrjnmnHXgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:54:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC249196E8E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAEB10E132;
	Wed, 25 Feb 2026 11:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="Cn7w34AE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic307-35.consmr.mail.ne1.yahoo.com
 (sonic307-35.consmr.mail.ne1.yahoo.com [66.163.190.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FBA10E132
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1772020484; bh=B2BBMLAOUBSlpsAFqz8QE69mFRtpkadt/z4rKxqpgXY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=Cn7w34AE5Iqb1VSCYSYmH7ClNBkhDNvstboP1JE0naBrIFFaPKFzMv+E8bRovLGEyS6VK+pEkYGsEyFcaDIQCoaGDkDPbqLZ9UTCqEKoPR+4udEbpf1u4Y1qVNn9EIKWt/0EBUc8sr4bodMN7YjTmDZBhu9msU4JplpcX9ZGN9T7QafjFxfXhq3y9zGKdCLN910WGiSMBZpRWsnmaHGnYPSqIDq6JICO2Y6reiQces9hog0g93Sr/7uxCnCdYSaUU6rf0jfAIoEQcK4fV49+9ejU5S2ckiZ+4SJrDB56GRhFPUEtXU4EY3Y7CQ6Nu6I9OV0+KJ7uu8pmR9thC2SA+Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1772020484; bh=qKcem23lOYTMtZt39Ae0m7EuR1BIDb7wVJnuvc7mGPn=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=jxjJvq7raHTeWkiPMolBc6LEWnxwJyWi3Mn8dEB2352cHNHcQpf9YUY15I66hcoeTt9jPIdglgeKyTUFoFx0T+J7qazrYUU2r0acXs12IOYEPTbJeMu9ARcA7Fj9lCLA+NrbkzxWKp+oXWQmJICCILOnDOCQRqhkc93oOhxGlTwapBiV/fVE9ZBniceuvpi9SQRfEBcrx1uhyJjd37z7cLffawAWZqxrhiLStmtJvb45f8tUktNHT+WU77tuJSzE/QwyTykYEduuWkUUoQ2han+6D2R6WHYB1dIwUR4m1TKC9wLoc4E/MsyXiaZHtvV0V92R3GhlDxIsksSSBQy5zg==
X-YMail-OSG: vPxp47IVM1lsmSZ9TNso8lLOU38xyiI6Zz61_Rz7GoKBqrBKUOWwHBvBW8jP4Ju
 rC40hzwNxkMFM11.X46rxEa7KQsjiwhtaSJ0Uta.ma6nL4SIJYC7qEImw_mmFRqh5XotFIeffHU2
 6FB8J3DTGWhi_f75ijYcLz8UcAfT0zZZrSvrURIned9arZ9RFQj_ovvxlW8NYM1xITKQY0wo8eSJ
 lUMPatOF3iVwtXrIYBDuZ4Cs._4UVkwUMBwHYas_1W7csz734mWEQEirPWEE3NnJHpFVjfxbJybE
 RjYEYgnmg0BMDdK0fZQ1k7Q2VNwAHnIMWtF7ft_tw90QlAvkHEcjod9tuahUKcnQYQuL0TpTLWRM
 QEyWXfmLQsXgRxexnuiZLYvu2YEI6JrUL_jR7J8IXVLCl7gxvujqHEI6jpJr4ERLaos.xvsDRH3Z
 aNSx0ZmzwwhtyeSjriEh6zRYwotqTUBh_TqR32KFdH58xKfOFwojHPGQYgtNLeDOEJWwOWO.t5Zs
 svmI48UroKHZe2xlc_1W263qjZOEJdkYV4_MZjt3vgebMn9FGjvWeewSY0N2d9OJMfeWBk0E_xlI
 0PIECp6TPH1l_ibNedgzfNeaE6ryxg_ZB_nxDbmpXtg9Kbvav6.r9bH68q21PQ1SW_RZtRVgNBTO
 1LNlv2XYHJw3OxVRJJJ8.iNKDBpKA8WRke3odmxu.4K9sIOa6CIjv4F5NjYU6G0NDrvPNoR1n8dN
 r6Fe2nBbSz6ImcnvRkme7uQK0nyzaCvTSoOujkz8EIEqLb_AC_9lrG5ptWQD9QczpvEYyxAfkY_M
 k7Fwiu8gL4x162XV_5mnGfkBKaV.jbUCQFHQEd9uFm7AcZkzgp566E71vgdQi4_egrRjZZSPustT
 4Zwl2rULvQtcH51bHBgES_Wh03u6Jbmx3uet9O5kK6Ysa9KM0yHGbPYtiUNwY6lht5o6lYKsrmQC
 jfmDcohGi2ChexK4nJIK6WxRAY9FjtNaARvHr0Qje4F82M37oe0YReNKbhEz9o0.b9pecV9rZ.41
 tULv3NjUkd8TgbP9uwsip6wcapX2I90kQf9r1RsBWKK6vpfO2_WINEuxDc9uLqIDieT4ugWLqJRN
 grsXgYzo_5b9kdhKILPpxZ9iABf3vzUl7zSfBoU20BVcf_Nd67eUFcOi5BUQLOYh7V_0tE.XWZxm
 td52Y4bvy3XzYhb.D3yJ2Z1_x4TjYxKRgIGn.7hUnmFt2XbAuE12CDpxnQdwbq3p1dp_gWPViE7k
 bOFFQ2ZKFrTP9o5dcies9wCBPQp77QjOMsouSZIoprbBi9..fr_3skHIXMfIBrMJ5TBZlFAdwLLd
 NFroMs28C1esUz5zFIDlO5l8UUZu2XQkN5NyBRitCedm2SJL6s7MKUPy2kYUGx1lod4MIvcdMHUL
 W0tooGAGanLjwfUUperh0amjMIuF6tJslLybB94wtN8S_gt340sz6kw_BPbnQ1aJOKYNo99YbBsd
 HyEBjRsDZO34u5vPfmpuLLKwpBG3fgrs85jdyu72Mw2nuE4b1jjS.3bbimsGlll3ybymb.6D_Akh
 gE_ZzfXCYUIoiQuaFih1Kz_wNdQ2dV6pe3ewUi2R2TTG89bmmVbRw49yciXkKct.kYUEq2eVfhTX
 Io0BK0_tpIm1ewp3faNNEZDsqgzSHri0qF8QvIOZ2p.JpE01DTZQdh75EZi0Z3i.wXSqvGZOchHO
 i0oXs2_k.u_oz3svOW5m2uOp9_vfAC6nWOaXHXF2TzimgBHzaQGWUE1oj_42_pX2UXmBXEm4VkMx
 syYvUCGxUJAmK70lX_sNwObPCrh3i0CLgqbnswCUTNTe_gzo5IGdTs2RDBPbQkAchUs75YqszpVA
 VNXhLESOkqMN5eHPrmUX_AJAnjIUD1xzKA.B1BUbyLl1SmiVcdqZRAd.5oj1vIsyElduL4wSiUzM
 1dX611yU4ScSXCgyDNyECnhkKvBf9BgDqID0z5WTr017SV8qy_iV018B3DeRL9i8LDDtHp8_H_4b
 Mm4ZXpGSrGskarDqJC1EKxsgYDsiGSb_BnGlDzV6J0Frqu9.FNlo_WLWgEun3K8P0KTkX03tbOQU
 qcAIip95YgOCAvaNigXsi6_STQLnwt0RL40dXvPYKsKa_42WbmwEVqSYq8z34mYRDQcnTwqIAmYI
 XN9I88ClJb5SQWJXtHYWrA8XQhUrXXS6e1ZmpILr9zmE_rScLW7qT8gHjLXqGaRTpZ8ltbkzuaRV
 kZPX44EV8YvPGdnUruUGc1PxlIGpltvtW.TXdM2N97kwYgsXTTNzR7hiGCWfQ8i_HX9gfRrM5ZGB
 kTwW5FEA2MOcapdRsZ7DTKoEoeYMzPUKNrlY0
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 51cb86e4-2710-44c8-ba9b-07f16891c085
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Feb 2026 11:54:44 +0000
Received: by hermes--production-ir2-bbcfb4457-k5cwv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID e8362b3b041b3957180905fa7f67cbd9; 
 Wed, 25 Feb 2026 11:52:40 +0000 (UTC)
Message-ID: <7b97e2517371b8e76cded18820090e44759bceb3.camel@aol.com>
Subject: Re: [PATCH v5] drm/gud: fix NULL crtc dereference on display disable
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Shenghao Yang	
 <me@shenghaoyang.info>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Date: Wed, 25 Feb 2026 11:52:28 +0000
In-Reply-To: <1ffb000d-8189-405d-861b-6eb449773f56@suse.de>
References: <20260222054551.80864-1-me@shenghaoyang.info>
 <1ffb000d-8189-405d-861b-6eb449773f56@suse.de>
Autocrypt: addr=rubenru09@aol.com; prefer-encrypt=mutual;
 keydata=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
 eIvzsqg==
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-0t/oCFLIUQU33AfSFrao"
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Mailer: WebService/1.1.25198
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[aol.com,reject];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[aol.com:s=a2048];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:me@shenghaoyang.info,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[suse.de,shenghaoyang.info,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[rubenru09@aol.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rubenru09@aol.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[aol.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[aol.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: DC249196E8E
X-Rspamd-Action: no action


--=-0t/oCFLIUQU33AfSFrao
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-02-25 at 09:52 +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 22.02.26 um 06:45 schrieb Shenghao Yang:
> > gud_plane_atomic_update() currently handles both crtc state and
> > framebuffer updates - the complexity has led to a few accidental
> > NULL pointer dereferences.
> >=20
> > Commit dc2d5ddb193e ("drm/gud: fix NULL fb and crtc dereferences
> > on USB disconnect") [1] fixed an earlier dereference but planes
> > can also be disabled in non-hotplug paths (e.g. display disables
> > via the desktop environment). The drm_dev_enter() call would not
> > cause an early return in those and subsequently oops on
> > dereferencing crtc:
> >=20
> > BUG: kernel NULL pointer dereference, address: 00000000000005c8
> > CPU: 6 UID: 1000 PID: 3473 Comm: kwin_wayland Not tainted 6.18.2-200.va=
nilla.gud.fc42.x86_64 #1 PREEMPT(lazy)
> > RIP: 0010:gud_plane_atomic_update+0x148/0x470 [gud]
> >   <TASK>
> >   drm_atomic_helper_commit_planes+0x28e/0x310
> >   drm_atomic_helper_commit_tail+0x2a/0x70
> >   commit_tail+0xf1/0x150
> >   drm_atomic_helper_commit+0x13c/0x180
> >   drm_atomic_commit+0xb1/0xe0
> > info ? __pfx___drm_printfn_info+0x10/0x10
> >   drm_mode_atomic_ioctl+0x70f/0x7c0
> >   ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> >   drm_ioctl_kernel+0xae/0x100
> >   drm_ioctl+0x2a8/0x550
> >   ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> >   __x64_sys_ioctl+0x97/0xe0
> >   do_syscall_64+0x7e/0x7f0
> >   ? __ct_user_enter+0x56/0xd0
> >   ? do_syscall_64+0x158/0x7f0
> >   ? __ct_user_enter+0x56/0xd0
> >   ? do_syscall_64+0x158/0x7f0
> >   entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >=20
> > Split out crtc handling from gud_plane_atomic_update() into
> > atomic_enable() and atomic_disable() functions to delegate
> > crtc state transitioning work to the DRM helpers.
> >=20
> > To preserve the gud state commit sequence [2], switch to
> > the runtime PM version of drm_atomic_helper_commit_tail() which
> > ensures that crtcs are enabled (hence sending the
> > GUD_REQ_SET_CONTROLLER_ENABLE and GUD_REQ_SET_DISPLAY_ENABLE
> > requests) before a framebuffer update is sent.
> >=20
> > [1] https://lore.kernel.org/all/20251231055039.44266-1-me@shenghaoyang.=
info/
> > [2] https://github.com/notro/gud/wiki/GUD-Protocol#display-state
> >=20
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202601142159.0v8ilfVs-lkp@intel.com/
> > Fixes: 73cfd166e045 ("drm/gud: Replace simple display pipe with DRM ato=
mic helpers")
> > Signed-off-by: Shenghao Yang <me@shenghaoyang.info>
>=20
> AFAICT this looks good.
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Ruben Wauters <rubenru09@aol.com>

This will likely require a CC stable for 6.19 at least, possibly also
6.18, though I'm not 100% sure how long that one will last with 7.0-rc1
being released.

I can add this when I merge it.
>=20
> Best regards
> Thomas
>=20
> > ---
> > v5: Send SET_CONTROLLER_ENABLE and SET_STATE_COMMIT unconditionally on
> >      crtc enable
> > v4: Send SET_DISPLAY_ENABLE=3D1 unconditionally on crtc enable
> > v3: Dropped stable AUTOSEL opt out
> > v2: Moved controller and display control commands to crtc
> >      enable / disable functions.
> >=20
> > [v4]: https://lore.kernel.org/lkml/20260218054711.63982-1-me@shenghaoya=
ng.info/
> > [v3]: https://lore.kernel.org/lkml/20260203172630.10077-1-me@shenghaoya=
ng.info/
> > [v2]: https://lore.kernel.org/lkml/20260201095956.21042-1-me@shenghaoya=
ng.info/
> > [v1]: https://lore.kernel.org/lkml/20260118125044.54467-1-me@shenghaoya=
ng.info/
> >=20
> >   drivers/gpu/drm/gud/gud_drv.c      |  9 ++++-
> >   drivers/gpu/drm/gud/gud_internal.h |  4 +++
> >   drivers/gpu/drm/gud/gud_pipe.c     | 54 ++++++++++++++++++++---------=
-
> >   3 files changed, 48 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_dr=
v.c
> > index d0122d477610..17c2dead2c13 100644
> > --- a/drivers/gpu/drm/gud/gud_drv.c
> > +++ b/drivers/gpu/drm/gud/gud_drv.c
> > @@ -339,7 +339,9 @@ static int gud_stats_debugfs(struct seq_file *m, vo=
id *data)
> >   }
> >  =20
> >   static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs =3D {
> > -	.atomic_check =3D drm_crtc_helper_atomic_check
> > +	.atomic_check =3D drm_crtc_helper_atomic_check,
> > +	.atomic_enable =3D gud_crtc_atomic_enable,
> > +	.atomic_disable =3D gud_crtc_atomic_disable,
> >   };
> >  =20
> >   static const struct drm_crtc_funcs gud_crtc_funcs =3D {
> > @@ -364,6 +366,10 @@ static const struct drm_plane_funcs gud_plane_func=
s =3D {
> >   	DRM_GEM_SHADOW_PLANE_FUNCS,
> >   };
> >  =20
> > +static const struct drm_mode_config_helper_funcs gud_mode_config_helpe=
rs =3D {
> > +	.atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> > +};
> > +
> >   static const struct drm_mode_config_funcs gud_mode_config_funcs =3D {
> >   	.fb_create =3D drm_gem_fb_create_with_dirty,
> >   	.atomic_check =3D drm_atomic_helper_check,
> > @@ -499,6 +505,7 @@ static int gud_probe(struct usb_interface *intf, co=
nst struct usb_device_id *id)
> >   	drm->mode_config.min_height =3D le32_to_cpu(desc.min_height);
> >   	drm->mode_config.max_height =3D le32_to_cpu(desc.max_height);
> >   	drm->mode_config.funcs =3D &gud_mode_config_funcs;
> > +	drm->mode_config.helper_private =3D &gud_mode_config_helpers;
> >  =20
> >   	/* Format init */
> >   	formats_dev =3D devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
> > diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/g=
ud_internal.h
> > index d27c31648341..a5b7e53cf79c 100644
> > --- a/drivers/gpu/drm/gud/gud_internal.h
> > +++ b/drivers/gpu/drm/gud/gud_internal.h
> > @@ -62,6 +62,10 @@ int gud_usb_set_u8(struct gud_device *gdrm, u8 reque=
st, u8 val);
> >  =20
> >   void gud_clear_damage(struct gud_device *gdrm);
> >   void gud_flush_work(struct work_struct *work);
> > +void gud_crtc_atomic_enable(struct drm_crtc *crtc,
> > +			   struct drm_atomic_state *state);
> > +void gud_crtc_atomic_disable(struct drm_crtc *crtc,
> > +			   struct drm_atomic_state *state);
> >   int gud_plane_atomic_check(struct drm_plane *plane,
> >   			   struct drm_atomic_state *state);
> >   void gud_plane_atomic_update(struct drm_plane *plane,
> > diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_p=
ipe.c
> > index 4b77be94348d..587d6dd2b32e 100644
> > --- a/drivers/gpu/drm/gud/gud_pipe.c
> > +++ b/drivers/gpu/drm/gud/gud_pipe.c
> > @@ -580,6 +580,39 @@ int gud_plane_atomic_check(struct drm_plane *plane=
,
> >   	return ret;
> >   }
> >  =20
> > +void gud_crtc_atomic_enable(struct drm_crtc *crtc,
> > +			   struct drm_atomic_state *state)
> > +{
> > +	struct drm_device *drm =3D crtc->dev;
> > +	struct gud_device *gdrm =3D to_gud_device(drm);
> > +	int idx;
> > +
> > +	if (!drm_dev_enter(drm, &idx))
> > +		return;
> > +
> > +	gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
> > +	gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
> > +	gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, 1);
> > +
> > +	drm_dev_exit(idx);
> > +}
> > +
> > +void gud_crtc_atomic_disable(struct drm_crtc *crtc,
> > +			   struct drm_atomic_state *state)
> > +{
> > +	struct drm_device *drm =3D crtc->dev;
> > +	struct gud_device *gdrm =3D to_gud_device(drm);
> > +	int idx;
> > +
> > +	if (!drm_dev_enter(drm, &idx))
> > +		return;
> > +
> > +	gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, 0);
> > +	gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
> > +
> > +	drm_dev_exit(idx);
> > +}
> > +
> >   void gud_plane_atomic_update(struct drm_plane *plane,
> >   			     struct drm_atomic_state *atomic_state)
> >   {
> > @@ -607,24 +640,12 @@ void gud_plane_atomic_update(struct drm_plane *pl=
ane,
> >   		mutex_unlock(&gdrm->damage_lock);
> >   	}
> >  =20
> > -	if (!drm_dev_enter(drm, &idx))
> > +	if (!crtc || !drm_dev_enter(drm, &idx))
> >   		return;
> >  =20
> > -	if (!old_state->fb)
> > -		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
> > -
> > -	if (fb && (crtc->state->mode_changed || crtc->state->connectors_chang=
ed))
> > -		gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
> > -
> > -	if (crtc->state->active_changed)
> > -		gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, crtc->state->active=
);
> > -
> > -	if (!fb)
> > -		goto ctrl_disable;
> > -
> >   	ret =3D drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> >   	if (ret)
> > -		goto ctrl_disable;
> > +		goto out;
> >  =20
> >   	drm_atomic_helper_damage_iter_init(&iter, old_state, new_state);
> >   	drm_atomic_for_each_plane_damage(&iter, &damage)
> > @@ -632,9 +653,6 @@ void gud_plane_atomic_update(struct drm_plane *plan=
e,
> >  =20
> >   	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> >  =20
> > -ctrl_disable:
> > -	if (!crtc->state->enable)
> > -		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
> > -
> > +out:
> >   	drm_dev_exit(idx);
> >   }

--=-0t/oCFLIUQU33AfSFrao
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEE3obNNdPQ9V5CQi2Y0n5QwFCuDOEFAmme4nwbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJENJ+UMBQrgzhoxwQALoyE9uFIM/ezZWTFC34
EFg6D7zaCzhGXXQI9JNsSjPTgTo+BekSQeNuK9KFWSXmongMdW/mAO+3skneqiFu
sWmZkajJdf0k+4AbcEf5kPtnMvobdNHxvyaljh7atvdohMxtTDrYp0X+50j5aQBa
FW/lucqi3JbEnS1akRuwNUi1zNYvMoTAJWW03hkunRsNlZMxP4pUhVAr0yZI4uu0
oEGEB+JnoFou2LHKGyfSEr2Ay8ZAljaaELOT3cXWcrX6KFQccsKTw+6BA0mlnXtk
+Iez0B3mQSJljM11M8GjUZ/CzqF0pFcEDs9yhwLEnWmxMnPaXwe9vZXOVoFVH9Ea
oR/Qz+xxACyT1Vh+rvwWrcfcuNhnL/aWKwhi9flqfPjuSsQc0e7YJId/KoJS5rTZ
1GLTa0dUPo0lU2YXNiIFjgIGx5ghLVPNQ8V2wI1s/9949Jv+DRxv+cwDSjcV+9Ro
cggMtqYWnWfAk47uyLZ3G9J30Y3B9Ii12gK4Mfikh/kCQE0FfTnx9Dmzu9GYIXcP
2FWm/oIMa6+XsE5xVRiw3ijdsTbw150ZZ1jWGqeD5MkdQ0/SJPT9Vy3TNx0mE77p
lAci7p/fkcf4j3QJF382ARFbwhsuEKuLvU+ibG55A1UMfpkkw5+dTfPmAZCcBG+m
XQDGSU04CiVs6bwYIuQs0K2b
=LuxZ
-----END PGP SIGNATURE-----

--=-0t/oCFLIUQU33AfSFrao--
