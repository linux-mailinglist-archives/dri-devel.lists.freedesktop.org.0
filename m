Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id U+e5LVnwrWlO9wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 22:55:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CBF2325C5
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 22:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B7710E046;
	Sun,  8 Mar 2026 21:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="eDHxhzNL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic312-24.consmr.mail.gq1.yahoo.com
 (sonic312-24.consmr.mail.gq1.yahoo.com [98.137.69.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A6C10E046
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 21:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1773006932; bh=6+sXYZK1U6MmItXOTjeZpQU8nolnwFepKO4EJy8JGs4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=eDHxhzNL3ZVCt/n0Tj0Jp1DZSF2g7iqEBMpOfedQFQ94BAypH7ZYigtkxAbf2yvDKAVwH5eUdTx5n8Zb9gCIuAYgN8Ap92d/niiiwCbT6E/5bDTUBY+zv1pzuRDM7YOfVxTHJAdsGJDer/xGiZXK+awnDoX5AUDuTDAFa71cyuicI2NnfNUXvDsjWEtM2u2tfKgvDf/KaY+V/WaHUwgNNsqfaPAz1PHV3NEfyea19FYDrNuug3NQ95njwirkCc7bFjn9oXZBPNcB3rE9hA4xJx5VZdS70D/vtzrV1q5B2eofZ97P9AkqeFIX17flEA9BY5jf80Z1QV+jBVIvGFzT9A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1773006932; bh=Cwcba/TSE61unLUNjfMCzHFQSApGyxsdP8i7XSngKYX=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=eco2hLndnI2lJS1CMgRzRK86GSfvEpH3NeqJGhc1zlYZ7QEAp+aCcz7nDcFzbqi5OUegQe7VlogSmjanlWgC3UmPRmF3YArtjhF77Zzd8WtXzS+MKibW/MyHvtfTuEd/lk9veqwyYQre39THSFHJDWnhW3WF91FZAvrU+KfSIO3C5161mkQVAYQBUfXYzWaL22j/RonsaPXSgtcP5oFfYBa/JY4zRn7O2JhbWpsCaSpYflEdQU7pQOjDr/I1L4drg2a9M4DIrFBUXqrSnufqqA0xGnFax9SvavQ1Sy16rQDsQoumnq5BX/RqzVJDvdE2cn8kDnMiN6eiqX6aORVjNg==
X-YMail-OSG: r.tAMVIVM1loEm_92Wp7KXqBtw9PQDW.IJadMSubujLVf.X78IWQl0MpVqnyM38
 .UaxNK9By2IcBxnJZE6lGKn..jwBdd87LfQrdPPGdMYgGpPRzbhK2T8kbXtVmz.d8_xm3LcYTO18
 Ensu_60JDfy8GBWVeEbn.gAyv.lPs.mTNhd5_ZthP8R0gsUcEUlzuLgGlL.xb7t48ykBipqUoUU.
 4F83_1f1o9iZiQDNwt55cW3gyV8ZvBgvOE48NkgBeIA3drYXAsd3r9Y2dJSdVbyBQv.zY2rJ4DFp
 LCikf_HM3VfrUT_Y7RYT.OM2PsxSvF36lA94hAPUPmB8mzEaqD9C3032cOfTysLlpSLrrzanvYnm
 SJmpEmtsHqMgu.mDWS_cEtpIxkD3IFo57QdProwfG4gldNdlhw4HMrQvTFEfpfFP0PGJaGHiscfE
 kYIAbAVM.IFRHRSdEq4czK49PUX78tBe62NLwlsf0gCm3Cbc.gp5z6IvcFbckkGteH__I9sLteHi
 hSqOpY1uK7zC5A9IuNSCq1iNl6AFTtKxap7quPijBOCUbNSlSQY8wzd46PUOlcWa7eTm3FtsDjV.
 HmPTP3ehdtBXWLy8s52LiuI_FWITRQUqmhhlTkT4mUnaR6.oyA665jiYQXNlZh8kTyv37vHsDjPR
 d5XRIBzSjfJuJwPxQEQdk9B2MfIuAnMThVlCA9aTzHW577zKhIpbWGkJgdggFqMMXFLSISpUyOjX
 RHeaaTNk1wL2L7EZaxLNcK51WlNJL_We3ZFvdk2k5Yk4u7ZDO3ktKn83LCj3Mk1kQuZHN_YZoU.d
 YjCl711XF3_Fu1S6K_BOPMWs5fF1Yye4Mv9uzabSsWec1YOc3S6lD32gcexTGUO8B4vAQH4hsR9J
 UX3FFKuY7xI1qCWGqBDioskMIfo6.zIUCObDSfTpG6.Wo_1pTf3ZdVd2VCX9WJtxcHYLdQXE0J.v
 2F.Jo0e5D6yI0VBaRyiekz9H_LiHKQKLBCWEruUIQ8n5LavWapikH9V_0LB39.hyxUfqYXxCDrVX
 Ml6s4E.so6YsDpU9iI1Ymk.N7gle.EPkuQunywrdgRHa3J5U9s1H8uHyByCIU22U.q_4vJVweu1z
 rGiiNAQaddcT6bQvYfibaSQn1oYgw20Tz418kdUg1LSeIZ5U9SuWZN68j8KVGSJHDvMYfRlJwxZ4
 ZQ1vV8gtkKAeJZ9wLzwOWAuHZez_D4y9Xlywm8ePhaJBmvrkTwVQdkYl.gHAeFb5pyd2L0hoJAYV
 QzFlLNGEqK2wtwnk4hV8.2Jq30tZTdB2W6d91r7A4mIHyJCvPUz9Hwe0Y38LoZREwbDuXg1K3P7u
 Jfy.TNM76hGti7xd_52aT.5DSqSLukhIzDaBJxfPHTyHNZLXANiojASzdkpFbJ.m6.ilBLvBT7Pq
 gN.U15zPoHuH0Oz1AoH1Osjh08LYcavsPE44T6RWNMk3Z00W0cx0OiVXZfSOse7yAXBB0rBTYIiu
 ybqlr0q0WaC38KsZF0m8VosO.51Ehcr5Nv1ZVbZpcGZqBcRYD2vRX5vvlxCk.I0qQfhytUfpsKhB
 tfsZH7YfAYQYjoZuBSqGVSkQdLI05X6oCNCuMCTMW1uTMFhM4I15mBr3Tcwvqsqv7shvGj7EFEdP
 KNcgI7kcaZDnOwjGpWpi.FANw1EMmV0oCU660lQKx03dmCeYph7mD8LgHNc7CZBbyf9WaWue7roD
 6xQHb5RpLOdBpdF.5lLNqcHbSiUkv..1AInh7mkmYZ1vy4LReB5OUVyTfKmdRvkedakeYtz9kKz.
 GjPXDX2mc9Ra40T4tE4A_cG4e0.I7AnziLYSvw4ogmM5sF9kbZDwW5JvYH7YLwwfegsiKsQzWm6c
 9RADTUUqmJ0DTyGMB5xry50y_agHZmBBYVGiiJArBR0ztKD1qPzP9lx.YrRZsjTx6t8ZMeUOa_tn
 3spnNyFuzWN5TCsaht.KEQHgPgafhwzk5rZ_c8.sSYD1YPLC5oJyhbbuMrlp4gy4_bvbXB1aRGbq
 .yj1NfuygBVgAXpqpcGqR9.rYditcrs_y1p_iQkp3izwBTLXxvhN1Zh_mUoSHVThPyQgK6_qhdrv
 HoGe8eggeE5lAKoHal7wpzvQYa55r6eI40SwH4Y50vvy80Abj_27pq4woRu049g9TsoorZV11TwL
 JVsIMOZiKTB4AJ9J2nbLtO1iV_PWi2hegGjP5O59HsflD1R2uMPhCqTjxHqAOK6kXRZ7SQGLFWGY
 VMMjvrPy8JY_.GjJNbhYVzWppQWB76D8N2UjSy0NNCubUIY2GSD8KeWs5oxUgC.fvLVAiew--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: d3ec0afd-fa29-43a5-a2ed-a4191b80380e
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Sun, 8 Mar 2026 21:55:32 +0000
Received: by hermes--production-ir2-bbcfb4457-w955t (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 7a26ea4da3feb0451ab16d5343ded834; 
 Sun, 08 Mar 2026 21:55:27 +0000 (UTC)
Message-ID: <5b3e4821abce9cc1a9068342b1b939fb9299d87e.camel@aol.com>
Subject: Re: [PATCH v5] drm/gud: fix NULL crtc dereference on display disable
From: Ruben Wauters <rubenru09@aol.com>
To: Shenghao Yang <me@shenghaoyang.info>, Thomas Zimmermann	
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Date: Sun, 08 Mar 2026 21:55:24 +0000
In-Reply-To: <ac8f0d3c-6ad1-4456-b2d9-01e47a1cdea6@shenghaoyang.info>
References: <20260222054551.80864-1-me@shenghaoyang.info>
 <1ffb000d-8189-405d-861b-6eb449773f56@suse.de>
 <7b97e2517371b8e76cded18820090e44759bceb3.camel@aol.com>
 <e35a45c39b8d8c8e9d095ca857570b8a910c90f8.camel@aol.com>
 <ac8f0d3c-6ad1-4456-b2d9-01e47a1cdea6@shenghaoyang.info>
Autocrypt: addr=rubenru09@aol.com; prefer-encrypt=mutual;
 keydata=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
 eIvzsqg==
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-Jo2btxwdbze62mZ+R+BG"
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
X-Rspamd-Queue-Id: D1CBF2325C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[aol.com,reject];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[aol.com:s=a2048];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:me@shenghaoyang.info,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[shenghaoyang.info,suse.de,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[aol.com];
	FORGED_SENDER(0.00)[rubenru09@aol.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.972];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rubenru09@aol.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[aol.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,linaro.org:email]
X-Rspamd-Action: no action


--=-Jo2btxwdbze62mZ+R+BG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2026-03-08 at 01:37 +0800, Shenghao Yang wrote:
> Hi Ruben,
>=20
> > Just as a note, it seems that 6.18 has been designated a longterm
> > support release, and as such it would be a good idea/appropriate to
> > also backport this to 6.18, since the bug exists in that version too.
> >=20
> > Shenghao, Would you prefer for me to backport this on merge when it
> > fails to apply it, or would you like me to add the cc stable tags, and
> > on failure, for you to backport it yourself?
>=20
> I'm good with either! Maybe we go with what's more convenient for you?
> The backport resolution (I think) should just be a single line move:=20
>=20
> +       drm->mode_config.helper_private =3D &gud_mode_config_helpers;
>=20
> Thanks,
>=20
> Shenghao
>=20
> On 4/3/26 21:53, Ruben Wauters wrote:
> > On Wed, 2026-02-25 at 11:52 +0000, Ruben Wauters wrote:
> > > On Wed, 2026-02-25 at 09:52 +0100, Thomas Zimmermann wrote:
> > > > Hi
> > > >=20
> > > > Am 22.02.26 um 06:45 schrieb Shenghao Yang:
> > > > > gud_plane_atomic_update() currently handles both crtc state and
> > > > > framebuffer updates - the complexity has led to a few accidental
> > > > > NULL pointer dereferences.
> > > > >=20
> > > > > Commit dc2d5ddb193e ("drm/gud: fix NULL fb and crtc dereferences
> > > > > on USB disconnect") [1] fixed an earlier dereference but planes
> > > > > can also be disabled in non-hotplug paths (e.g. display disables
> > > > > via the desktop environment). The drm_dev_enter() call would not
> > > > > cause an early return in those and subsequently oops on
> > > > > dereferencing crtc:
> > > > >=20
> > > > > BUG: kernel NULL pointer dereference, address: 00000000000005c8
> > > > > CPU: 6 UID: 1000 PID: 3473 Comm: kwin_wayland Not tainted 6.18.2-=
200.vanilla.gud.fc42.x86_64 #1 PREEMPT(lazy)
> > > > > RIP: 0010:gud_plane_atomic_update+0x148/0x470 [gud]
> > > > >   <TASK>
> > > > >   drm_atomic_helper_commit_planes+0x28e/0x310
> > > > >   drm_atomic_helper_commit_tail+0x2a/0x70
> > > > >   commit_tail+0xf1/0x150
> > > > >   drm_atomic_helper_commit+0x13c/0x180
> > > > >   drm_atomic_commit+0xb1/0xe0
> > > > > info ? __pfx___drm_printfn_info+0x10/0x10
> > > > >   drm_mode_atomic_ioctl+0x70f/0x7c0
> > > > >   ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> > > > >   drm_ioctl_kernel+0xae/0x100
> > > > >   drm_ioctl+0x2a8/0x550
> > > > >   ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> > > > >   __x64_sys_ioctl+0x97/0xe0
> > > > >   do_syscall_64+0x7e/0x7f0
> > > > >   ? __ct_user_enter+0x56/0xd0
> > > > >   ? do_syscall_64+0x158/0x7f0
> > > > >   ? __ct_user_enter+0x56/0xd0
> > > > >   ? do_syscall_64+0x158/0x7f0
> > > > >   entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > > >=20
> > > > > Split out crtc handling from gud_plane_atomic_update() into
> > > > > atomic_enable() and atomic_disable() functions to delegate
> > > > > crtc state transitioning work to the DRM helpers.
> > > > >=20
> > > > > To preserve the gud state commit sequence [2], switch to
> > > > > the runtime PM version of drm_atomic_helper_commit_tail() which
> > > > > ensures that crtcs are enabled (hence sending the
> > > > > GUD_REQ_SET_CONTROLLER_ENABLE and GUD_REQ_SET_DISPLAY_ENABLE
> > > > > requests) before a framebuffer update is sent.
> > > > >=20
> > > > > [1] https://lore.kernel.org/all/20251231055039.44266-1-me@shengha=
oyang.info/
> > > > > [2] https://github.com/notro/gud/wiki/GUD-Protocol#display-state
> > > > >=20
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > > Closes: https://lore.kernel.org/r/202601142159.0v8ilfVs-lkp@intel=
.com/
> > > > > Fixes: 73cfd166e045 ("drm/gud: Replace simple display pipe with D=
RM atomic helpers")
> > > > > Signed-off-by: Shenghao Yang <me@shenghaoyang.info>
> > > >=20
> > > > AFAICT this looks good.
> > > >=20
> > > > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > >=20
> > > Acked-by: Ruben Wauters <rubenru09@aol.com>

Applied to drm-misc-fixes, thanks!

Ruben
> > >=20
> > > This will likely require a CC stable for 6.19 at least, possibly also
> > > 6.18, though I'm not 100% sure how long that one will last with 7.0-r=
c1
> > > being released.
> >=20
> > Just as a note, it seems that 6.18 has been designated a longterm
> > support release, and as such it would be a good idea/appropriate to
> > also backport this to 6.18, since the bug exists in that version too.
> >=20
> > Shenghao, Would you prefer for me to backport this on merge when it
> > fails to apply it, or would you like me to add the cc stable tags, and
> > on failure, for you to backport it yourself?
> >=20
> > Ruben
> > >=20
> > > I can add this when I merge it.
> > > >=20
> > > > Best regards
> > > > Thomas
> > > >=20
> > > > > ---
> > > > > v5: Send SET_CONTROLLER_ENABLE and SET_STATE_COMMIT unconditional=
ly on
> > > > >      crtc enable
> > > > > v4: Send SET_DISPLAY_ENABLE=3D1 unconditionally on crtc enable
> > > > > v3: Dropped stable AUTOSEL opt out
> > > > > v2: Moved controller and display control commands to crtc
> > > > >      enable / disable functions.
> > > > >=20
> > > > > [v4]: https://lore.kernel.org/lkml/20260218054711.63982-1-me@shen=
ghaoyang.info/
> > > > > [v3]: https://lore.kernel.org/lkml/20260203172630.10077-1-me@shen=
ghaoyang.info/
> > > > > [v2]: https://lore.kernel.org/lkml/20260201095956.21042-1-me@shen=
ghaoyang.info/
> > > > > [v1]: https://lore.kernel.org/lkml/20260118125044.54467-1-me@shen=
ghaoyang.info/
> > > > >=20
> > > > >   drivers/gpu/drm/gud/gud_drv.c      |  9 ++++-
> > > > >   drivers/gpu/drm/gud/gud_internal.h |  4 +++
> > > > >   drivers/gpu/drm/gud/gud_pipe.c     | 54 ++++++++++++++++++++---=
-------
> > > > >   3 files changed, 48 insertions(+), 19 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/=
gud_drv.c
> > > > > index d0122d477610..17c2dead2c13 100644
> > > > > --- a/drivers/gpu/drm/gud/gud_drv.c
> > > > > +++ b/drivers/gpu/drm/gud/gud_drv.c
> > > > > @@ -339,7 +339,9 @@ static int gud_stats_debugfs(struct seq_file =
*m, void *data)
> > > > >   }
> > > > >  =20
> > > > >   static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs=
 =3D {
> > > > > -	.atomic_check =3D drm_crtc_helper_atomic_check
> > > > > +	.atomic_check =3D drm_crtc_helper_atomic_check,
> > > > > +	.atomic_enable =3D gud_crtc_atomic_enable,
> > > > > +	.atomic_disable =3D gud_crtc_atomic_disable,
> > > > >   };
> > > > >  =20
> > > > >   static const struct drm_crtc_funcs gud_crtc_funcs =3D {
> > > > > @@ -364,6 +366,10 @@ static const struct drm_plane_funcs gud_plan=
e_funcs =3D {
> > > > >   	DRM_GEM_SHADOW_PLANE_FUNCS,
> > > > >   };
> > > > >  =20
> > > > > +static const struct drm_mode_config_helper_funcs gud_mode_config=
_helpers =3D {
> > > > > +	.atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> > > > > +};
> > > > > +
> > > > >   static const struct drm_mode_config_funcs gud_mode_config_funcs=
 =3D {
> > > > >   	.fb_create =3D drm_gem_fb_create_with_dirty,
> > > > >   	.atomic_check =3D drm_atomic_helper_check,
> > > > > @@ -499,6 +505,7 @@ static int gud_probe(struct usb_interface *in=
tf, const struct usb_device_id *id)
> > > > >   	drm->mode_config.min_height =3D le32_to_cpu(desc.min_height);
> > > > >   	drm->mode_config.max_height =3D le32_to_cpu(desc.max_height);
> > > > >   	drm->mode_config.funcs =3D &gud_mode_config_funcs;
> > > > > +	drm->mode_config.helper_private =3D &gud_mode_config_helpers;
> > > > >  =20
> > > > >   	/* Format init */
> > > > >   	formats_dev =3D devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KER=
NEL);
> > > > > diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm=
/gud/gud_internal.h
> > > > > index d27c31648341..a5b7e53cf79c 100644
> > > > > --- a/drivers/gpu/drm/gud/gud_internal.h
> > > > > +++ b/drivers/gpu/drm/gud/gud_internal.h
> > > > > @@ -62,6 +62,10 @@ int gud_usb_set_u8(struct gud_device *gdrm, u8=
 request, u8 val);
> > > > >  =20
> > > > >   void gud_clear_damage(struct gud_device *gdrm);
> > > > >   void gud_flush_work(struct work_struct *work);
> > > > > +void gud_crtc_atomic_enable(struct drm_crtc *crtc,
> > > > > +			   struct drm_atomic_state *state);
> > > > > +void gud_crtc_atomic_disable(struct drm_crtc *crtc,
> > > > > +			   struct drm_atomic_state *state);
> > > > >   int gud_plane_atomic_check(struct drm_plane *plane,
> > > > >   			   struct drm_atomic_state *state);
> > > > >   void gud_plane_atomic_update(struct drm_plane *plane,
> > > > > diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud=
/gud_pipe.c
> > > > > index 4b77be94348d..587d6dd2b32e 100644
> > > > > --- a/drivers/gpu/drm/gud/gud_pipe.c
> > > > > +++ b/drivers/gpu/drm/gud/gud_pipe.c
> > > > > @@ -580,6 +580,39 @@ int gud_plane_atomic_check(struct drm_plane =
*plane,
> > > > >   	return ret;
> > > > >   }
> > > > >  =20
> > > > > +void gud_crtc_atomic_enable(struct drm_crtc *crtc,
> > > > > +			   struct drm_atomic_state *state)
> > > > > +{
> > > > > +	struct drm_device *drm =3D crtc->dev;
> > > > > +	struct gud_device *gdrm =3D to_gud_device(drm);
> > > > > +	int idx;
> > > > > +
> > > > > +	if (!drm_dev_enter(drm, &idx))
> > > > > +		return;
> > > > > +
> > > > > +	gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
> > > > > +	gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
> > > > > +	gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, 1);
> > > > > +
> > > > > +	drm_dev_exit(idx);
> > > > > +}
> > > > > +
> > > > > +void gud_crtc_atomic_disable(struct drm_crtc *crtc,
> > > > > +			   struct drm_atomic_state *state)
> > > > > +{
> > > > > +	struct drm_device *drm =3D crtc->dev;
> > > > > +	struct gud_device *gdrm =3D to_gud_device(drm);
> > > > > +	int idx;
> > > > > +
> > > > > +	if (!drm_dev_enter(drm, &idx))
> > > > > +		return;
> > > > > +
> > > > > +	gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, 0);
> > > > > +	gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
> > > > > +
> > > > > +	drm_dev_exit(idx);
> > > > > +}
> > > > > +
> > > > >   void gud_plane_atomic_update(struct drm_plane *plane,
> > > > >   			     struct drm_atomic_state *atomic_state)
> > > > >   {
> > > > > @@ -607,24 +640,12 @@ void gud_plane_atomic_update(struct drm_pla=
ne *plane,
> > > > >   		mutex_unlock(&gdrm->damage_lock);
> > > > >   	}
> > > > >  =20
> > > > > -	if (!drm_dev_enter(drm, &idx))
> > > > > +	if (!crtc || !drm_dev_enter(drm, &idx))
> > > > >   		return;
> > > > >  =20
> > > > > -	if (!old_state->fb)
> > > > > -		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
> > > > > -
> > > > > -	if (fb && (crtc->state->mode_changed || crtc->state->connectors=
_changed))
> > > > > -		gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
> > > > > -
> > > > > -	if (crtc->state->active_changed)
> > > > > -		gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, crtc->state->=
active);
> > > > > -
> > > > > -	if (!fb)
> > > > > -		goto ctrl_disable;
> > > > > -
> > > > >   	ret =3D drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> > > > >   	if (ret)
> > > > > -		goto ctrl_disable;
> > > > > +		goto out;
> > > > >  =20
> > > > >   	drm_atomic_helper_damage_iter_init(&iter, old_state, new_state=
);
> > > > >   	drm_atomic_for_each_plane_damage(&iter, &damage)
> > > > > @@ -632,9 +653,6 @@ void gud_plane_atomic_update(struct drm_plane=
 *plane,
> > > > >  =20
> > > > >   	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> > > > >  =20
> > > > > -ctrl_disable:
> > > > > -	if (!crtc->state->enable)
> > > > > -		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
> > > > > -
> > > > > +out:
> > > > >   	drm_dev_exit(idx);
> > > > >   }
>=20

--=-Jo2btxwdbze62mZ+R+BG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEE3obNNdPQ9V5CQi2Y0n5QwFCuDOEFAmmt8EwbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJENJ+UMBQrgzhcQ8QAJbprU12M72Mo7cKihj/
+Ml3XR/AEvBaAd//Ye1qAvrMVqK2P2JUbgZO0zH7KlWaWelXD9IVhYpUig3b7nq8
0WotOgdJvdGeDAx+6jnfl7TweJNIfKKZIbDwEmx1jfnfqzK2+zl2OufMwnW7znNA
RdBnwMVjz2p+0L9ekO3t8UwH+WbImYn3leWrUQJ6KSJNRfdt9M9XvQAJx/8irNZh
OKV40sN1QpqgjYoQVnqmfbldRVje6c9FLma8/XXNOVySPML1IAjmxsrL4WNbynAG
eT467yAwd0fXFIeJAuNlU6YfMQN9/64Q+EcygUMrwcNFISl5e/TNBuk8zNKeUTnA
2m7kakx0y0H8p2ajcuzx0bDfdKBxnLZarHhJomnTiKfMozDeMczPB3Rjs+i9hkYZ
FucmRa5h92MDxbeU6pLhcVy4eXuMrkK52j4Zmtv1e0y48BaM1aCAoV3nt7wLnWsX
yyXJ8rn6Lw+qavkyPV2SZE1F1ena/oW5tZAdEgZEFBd5YGJUMckRFn/s06IqK/lj
/jcQBmvlMRqkbi48suFTjWDfvhZ1nmUamEXanObC5uGcb8vdhkLpt3nNMq+GWPp9
7TNSy0ENKDH7Wi78JtelXkdN4C7oMcUR6lgThDMAQLjzfItRe/O1Rdzfa29Ay44b
R9ToyX9+vTuPhQkZA3jSNJXj
=TQUU
-----END PGP SIGNATURE-----

--=-Jo2btxwdbze62mZ+R+BG--
