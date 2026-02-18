Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELtcMmGqlWkxTQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 13:02:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D41156342
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 13:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E87410E5B0;
	Wed, 18 Feb 2026 12:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="mJt3vhg1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic311-23.consmr.mail.gq1.yahoo.com
 (sonic311-23.consmr.mail.gq1.yahoo.com [98.137.65.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1E810E5B0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1771416155; bh=3BQTFc13IykX/O18WiZHKF2HHevh/eAXq63WJYaQhVc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=mJt3vhg15DX/+fpb8TDvblWOiQKYWhTKgp0F7HMXavE9Vxox6nPa/VbBIHoCb4I1Dybc/ap8gfJPIFhj8Fk7965sj6g03cT4lNNhCJHHGnOoszYO5uEApLh4fYAj8nXUDIyZDLIf+99I4yebjmCsTu9wH3YukNnut4kDilaejro6nK8vdBO1oODK5NsOocdXPnXZUh4VJiiK30AY2Z7paq4IsYsQAy5ttDTRViRr2VBrh5zIs3JfEqvgakqlMmvz+pQeRQ2Y0Be1b74u0xvTTBMPdXPhoCyGatYxDReHmrGXxCak1l3fqeWl72AzvhStuW7DI6rMiLpctve693neVA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1771416155; bh=K9Y7TUlEZkQ3RBz3vnqX60loHCTThuBaGPGQkS/gAU7=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=pWAiikO4DMmm0SG4/0pQPZt4e6QyblJesy9v363ri4wvmbGGmHb96amGIxYz6oTQ9nn0xtRcHGAb2/bM4l4FahHfAeoA5VH+qzvng4+/o/7ui1z58UGW93qUpXwmflF4fSS3YDH2Yo4lUA2LqONJKhToRwjI/KkEIrgzfHKSMctPDbhfFUr+GZDVkGBNLFd8/0pwQ+DpIxskdpu5Z1mvhB3BtRVuDxApiXVd31cdNSPKQD7zYLlRLPkx/ZVZtJ01xrJnOWtPc+/bGzEFKz7ppJzOcyAJRWzBCznIDKHOd5S1qYhhvK4pCt4pUx6s2EFGtR1kqlko/DG7VKFvWi/jMw==
X-YMail-OSG: SVrRgLQVM1nKCtIP3abOfPAYNGOdFhWrF607qYy0ND88UEcEQSWsJru2HWFrOmL
 TBzsWdQ5nRGheD7teZjquKzaekYkRWsZHsgsEQjLWZQ5dYx0j3AYxr_PGouh3s5IWP.wdiEON2MG
 Nv5AP6t_6cVclFDwH9SaOPMiR98gmDmP08dow9xGumE4BDGolFrzLu5hlDLAmDhtYgEdDIOGGdMi
 xjmv9ecRcSfsQQi.EpRfHIBGWfkrYjXa2v352.bh_EDu36brtyxfwu7WqBOLtus4K1tmPt9QghSK
 U1PQSTfDmijceN53yqhl_RMdckkgeYWapOeWcPwmnYMqm7NK_P7RBw7dyRietcFWlJNWRjLQi4Ao
 wMIUT4WcRLFeAh357YDIEC422ZGzvEz2ocnoaOK5chmeeTaze9jyFwEd7q.t6OaIvYV34Z5Olbae
 vJ49JYcsB7IAfhV5i6e3ES91TQHwL28LsReYg8ZS2p8iNZSNG607opljI1BfHjMERG7illzmAoiL
 EN_Y3mCzY2R5V36p4ExZaprV1uMUXPJlBTPBzMXfgNgVFbGskaFnvZou_YCXct8cZ7SuVXjpq.Yf
 4EoSnlsL7G1x1jDrnUuDX1uHqklOHD_T05cvI.nx5Ue5pa2EXKWaxYkUTxU6sWHtM5x08MAz7J5Q
 fuyPLGEieCtqGHqCISLVoVEY9ZiUwnALLaC1i6N7p1iD.THM0tItRCpXws3TpXThB7EczPZeGL4T
 n0jXeX69yNtmiw2pny6whbjQF88a0Oj98TXBDtN1U6N88yypYmzE5nYdBayUz0urhCx3KHw6nBiO
 PmGPk1_Y1v5j0kcWDAQHoXkiKRaUAuQ8bmMyGQi9RyzpKO0pE6mjprvawnjjvrK8e0_BYDOGcjpI
 jwNzVizylKWx6XhU21Avw.MD4HXvHY4oFGQt6nopQRnYBW1IHcU7QYe7zVrj0dyiOhubSWZNuEDo
 NlEbsPMnpZ6CGWpx1U6IykEqdp3MZ.M7F1cdaFn7stdWMMD3GLjg7.oQzQXA2sjifgdLcYYi2FtY
 8W_9ePCx_LQh_lgvM19vbkNpTTezlZ9NWxkPsrwEC9YxBU2Dgb7ef5Z1qQr0jFXIgUvkkBJt7jRc
 jBnbP51BS2UxbSV0_npFJ50xSnQwdtHWyYQns6antCUr2bKuL8FHcNjWTRJ8zou4blStlormyaW.
 P5Z1jBvWYTOUzthk8AeP5QU4yVW2N.BXZtROf29.72slVJN25SaUbUOEBkgnGXAelIdRGyOWA1OS
 ljNwqWszoGPdns3K.bcEPbw5RrZd3Cv.4vGSMNrsHPs7GDowurouD9znMNZVcqUD4e9NwdPWmtLE
 n.9GACa5J0.ubnHIcp747fg3Ilk9xigNg.jd0qmHJyKVP7_boORWCO2Q6b5FSgTzNdcbA4W4KcWF
 v.V4jPB3K6ftRPyO70PvuKNKy0semmLVy_dRo02oJ3JiCnleKcQly7afQx_tWcqNh8TRjf8o3Nr4
 dNNf8tIxDkNYDyMICQqIeO.6m2kjhAus7RXmZLqYfflIi8ls1_a6fSTgHSmbdL74xxJ4Jo0Zr_t4
 _e4hV4iRbddaKzn7K9dow7vmiEKuwX3jT7w5wLxHBImqHSDJgyd7Q238lm_cUeQfBTynw36YZO1t
 1cDLrjX5QWKUGNJv54qJ7Xir525grQq2W1Lbesjcve5RkLajE7TNN0GFRkBuyFLLr5KLz49u5FGj
 12iLFZ4o6wIDGj8gMqupWIH0FaGc8WegOui3HEnyORNehsN1lJKK__6m5AfAnTBUOOBSKAsNQ5M0
 qkwmHp58DBV2nnCYTAya4y32LIOLCXiYHFic4fMxkE69XLw0qmcKFZuiU8Chr3cRviMqvsTBaP.t
 U4hMAp.dKZRfbx0nuHPeA6fqVYU5i5Thiu7BM.SmVBFElkaYiNBLmF3m6gqPZhH3dnEeHtrZaoJc
 uPhcchgXS871cxHm.7St7SsXoiwxj4BDpevUCUw4Ya_IRs6E1JvuxC6GFqqykOuiVpHPpSbzQMmc
 nSPVEBxZRd70SN0TXhBRhKctyfa6Gjjpj9Vh_IueDNjSso1DoslmUOKt5.wo5eLmQV3bwERAEiB9
 vBFcSOB41VOc93msDls65GykTB4JckvJqw46D3sDUNFZjWY_G1vRhclLNXr2TjTDUYdkUzB7.mwP
 vG5zWxvdqwYobdNQctPk90waht7DdPAweXbJcnwH8qBkh5lH5lxPszr6BEHvOakNVWfDbhdor0e2
 JzCijzAQHlfw..q0lSSCnd3_aP__dSLaza2qirA1QcMjjjm.8UifTRS.zd3Gw1CaHh1om
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 5699e698-545b-4546-9e38-4c099dec1194
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.gq1.yahoo.com with HTTP; Wed, 18 Feb 2026 12:02:35 +0000
Received: by hermes--production-ir2-bbcfb4457-w955t (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 6a069ce74045bc10a3175461acc893fe; 
 Wed, 18 Feb 2026 12:02:32 +0000 (UTC)
Message-ID: <d827671270aa6e8bdee9ec28a862a45660806073.camel@aol.com>
Subject: Re: [PATCH v4] drm/gud: fix NULL crtc dereference on display disable
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Shenghao Yang	
 <me@shenghaoyang.info>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Date: Wed, 18 Feb 2026 12:02:25 +0000
In-Reply-To: <4af7f0ca-5778-4ed9-9983-1c365cc1b3b8@suse.de>
References: <20260218054711.63982-1-me@shenghaoyang.info>
 <4af7f0ca-5778-4ed9-9983-1c365cc1b3b8@suse.de>
Autocrypt: addr=rubenru09@aol.com; prefer-encrypt=mutual;
 keydata=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
 eIvzsqg==
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-+V8Kc+i992lMNExFAmn4"
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
X-Spamd-Result: default: False [5.09 / 15.00];
	URIBL_BLACK(7.50)[shenghaoyang.info:email];
	SIGNED_PGP(-2.00)[];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	BAD_REP_POLICIES(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:me@shenghaoyang.info,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_ALLOW(0.00)[aol.com:s=a2048];
	FREEMAIL_TO(0.00)[suse.de,shenghaoyang.info,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rubenru09@aol.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[aol.com];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[aol.com,reject];
	DKIM_TRACE(0.00)[aol.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[rubenru09@aol.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email,intel.com:email]
X-Rspamd-Queue-Id: F2D41156342
X-Rspamd-Action: no action


--=-+V8Kc+i992lMNExFAmn4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-02-18 at 09:06 +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 18.02.26 um 06:47 schrieb Shenghao Yang:
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
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Ruben Wauters <rubenru09@aol.com>

Thanks for the patch.
>=20
> Although you might want to reconsider the mode_changed test in=20
> atomic_enable. See my reply to v3 on this.
>=20
> Best regards
> Thomas
>=20
> > ---
> > v4: Send SET_DISPLAY_ENABLE=3D1 unconditionally on crtc enable
> > v3: Dropped stable AUTOSEL opt out
> > v2: Moved controller and display control commands to crtc
> >      enable / disable functions.
> >=20
> > [v3]: https://lore.kernel.org/lkml/20260203172630.10077-1-me@shenghaoya=
ng.info/
> > [v2]: https://lore.kernel.org/lkml/20260201095956.21042-1-me@shenghaoya=
ng.info/
> > [v1]: https://lore.kernel.org/lkml/20260118125044.54467-1-me@shenghaoya=
ng.info/
> >=20
> >   drivers/gpu/drm/gud/gud_drv.c      |  9 ++++-
> >   drivers/gpu/drm/gud/gud_internal.h |  4 ++
> >   drivers/gpu/drm/gud/gud_pipe.c     | 59 +++++++++++++++++++++--------=
-
> >   3 files changed, 53 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_dr=
v.c
> > index 42135a48d92e..a2000991ecbe 100644
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
> > index 4b77be94348d..6c62080213c7 100644
> > --- a/drivers/gpu/drm/gud/gud_pipe.c
> > +++ b/drivers/gpu/drm/gud/gud_pipe.c
> > @@ -580,6 +580,44 @@ int gud_plane_atomic_check(struct drm_plane *plane=
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
> > +	if (crtc->state->mode_changed || crtc->state->connectors_changed) {
> > +		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
> > +		gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
> > +	}
> > +
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
> > +
> > +	if (crtc->state->mode_changed || crtc->state->connectors_changed)
> > +		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
> > +
> > +	drm_dev_exit(idx);
> > +}
> > +
> >   void gud_plane_atomic_update(struct drm_plane *plane,
> >   			     struct drm_atomic_state *atomic_state)
> >   {
> > @@ -607,24 +645,12 @@ void gud_plane_atomic_update(struct drm_plane *pl=
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
> > @@ -632,9 +658,6 @@ void gud_plane_atomic_update(struct drm_plane *plan=
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

--=-+V8Kc+i992lMNExFAmn4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEE3obNNdPQ9V5CQi2Y0n5QwFCuDOEFAmmVqlEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJENJ+UMBQrgzhV8IP/3ySiCLxZA8Th+7diIyd
mgyRbOwhN5q1RTgEE8xd/QDc067G610U2CUFJ8TQPz6ZqS7/pCMWJyzzaQTkI6K9
2CKH4I+HTktrMNZ+15ZPYaGyOPxecjcmwZdyQBYTslstFO2TZRknZCy6kb/zIgUw
lbQSN6KDnnGP11CR4jrI467ZvGiBKBTK39rnHoA77pS4cW4yobBzKx8VRjqoS2JW
P0mtheJNkTfZx5OfknYbo/YEGHJZkWnNCjrtIQ5gEgV0qTIs9wvqtYyJLmtxLpua
LX5E4pcS7SySK3ANsqLYByKzJKiP5fmUFo3ekzXcUx6HHq4+DmUYGgTDo+8fjSXZ
8ai8pK4jLV9cbN/81yk3xf3kv6ZveepUfmFICF8ceQaSsTSLNHne/1gzi3ZNrBnL
BysxcN7gSHLGKKsoqIlZnPuzUsil1Rfa3XQqNNDJ9DmFuiiPdtiLmBveZcNQgeNm
ZJWmFj8gPlw9hR4HOHmTufWUSxyv36AiX0FTRb5L2PNvcrG4y8PyoZBvkhttVZuB
Hnt42lpjfsC/d9REUwIlokQtYS67+Ky0fCVyH3wIHJehb0xarxjOHUSYMEGXNT2Y
sWoQOFGHvoFnIei7U0WecAN93PzPo9cXXsr8D1cqj0E599YmY6fmjXagkGfiKyH/
E7NZwx5LjIqACpg+3IjAeqkk
=R8VN
-----END PGP SIGNATURE-----

--=-+V8Kc+i992lMNExFAmn4--
