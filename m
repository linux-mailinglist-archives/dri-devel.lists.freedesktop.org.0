Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBQYN4k5qGkTqgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:54:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F5D200C41
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4E010EA2E;
	Wed,  4 Mar 2026 13:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="aeKwTbZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic305-20.consmr.mail.gq1.yahoo.com
 (sonic305-20.consmr.mail.gq1.yahoo.com [98.137.64.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B26210EA2E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 13:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1772632452; bh=A5ioyKdYuxvGqgIz50zO+t6OomW2H0h+2QSx4nSIcpE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=aeKwTbZCjV0vOqfgMYsCbF5D2g3QVhea/XzTQkAa30PCwYTFFXRY1uL53zi9dx1+9xa8di0FyPCmVkNjNKodChXe/TTxyNbURHq2uGmfZuiX/UJySKMz6AWkkYNyycdwLWEQrH0F5Aix9PpmoxsqEsN8F/saooTQR6JfTakx/6xY/7HC9PpGv1Z3o3V38drQwuOMmXds4UZ2Lnjkbi/prFh0aSdzPrZX3P1kcsC5VB5UmB54CWyN2li3c5wjfdFNX++HdodYrGyznOXk1MrgJW2ytCkZI2W/1opzovdGiWqbez3BYbWIup7xVuXol1XFUsIMDzsIIkpEJwyw+eh9ig==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1772632452; bh=rfgRl85GBAObgLV5txjJAJbdhCtgjGXZNkx9KzFnApq=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=eivOt1f58PAPSTEUZQQ02SG1IYyAMPKdu10tlYP4EfBkmMw+K5J04hvcohSGu0z/HPJ3GloTn1vLqLMYrJW5gJQpD5m0jtPb43YuMQroH+47wtJj3JTFytM9OVcQWl0onzXWvWD2aBSec4TdzqAZXnOChngAf3MkwdLo104/IcBAOziFaVL1iyONn6k8CIY1SISrTJogZng9EpmLKM954DqWzhWxRjIGoLBqvf6SebqhRUf6/Bf5Qb5ISVFBx8tKVCDC8JIyMjpihFNFxR0uk9XFq0/4SbBiGyglzXIS7uc6Azv1MrdhWI1CZwrHj1BAe/odDJrZx/mQaZd6HKf4pQ==
X-YMail-OSG: MdK8.3YVM1nKWW2QPqtLbATc6q10OTiwQrjAcjZruI_citscZ2xdWW0S6TZF_rs
 Z06Uqpt8Elng8OenhBeQRZr5fMAcijHkNaYLg__phXm9tltb5TzoRnOTmcKptrwM.NeJhd41jHPl
 jqKBSTllA0SPUmkest7r2i_478.PnCHbQpzVL6s7A72etF1EG4Ss0iXA871Lw3TCFFglW4jZTXul
 pgRp3rB05cK.hwtAG66I.0aCDxppe_P5hlW9afrW5A6BdOx6k3s5AYiwh5wM.OtL4PfiwNwHWSIf
 3tU9HX2WEypCSSYXXxm0OLneByRH1thctzXsZgpuwP1OcI6XTtgipkJ.DzcudsxQzb0Wvcn98qeH
 3Rad8WeWaK8x9wbaIdkE4f.wCmofodALmV0S66n9ucdPfXHuftNRBexjctaf9UWkRaMXz2T9m0lf
 gmkWm1L3mw9q4sP_HnibS0_UwW8hwhneymXiSLmp02iLU9_BJuy8wxPn5TY2cKJGxYL9YxQCI4x_
 h8_.ivpbCFaz3WkFu6.Oz8aSlgSDs7if9F8KlVKO_sOFdWT7nDiNQu2Tidha63ahISRuMf5TH1O5
 33y4W0w31ppP.ih02UHJvFLA4QTMpuhZheltcpBqwrp_7RNwcqzKp.1L4H1HUhJr570tYeEaap0F
 QKLsmKeGJWOpdfy6ZBaXi.udHqnCRxU3mU6zFE7AjUv7v9VzW73_GX0tuL3qeGNsmbBnB5EzruFk
 ltaNAuXM.y.hiimahNXbivvr7XdQi01hJlicnO9WqJ0iBEIhUl6wBHNZ5Y8qIw8rEiG7B58cDqMn
 OoyWir6hw7Q9occrNnvEQ8I4LTlmAus02jCXQDdnDtp9UcfzYJUD_4RzHz4QIwfPp.ieAUAGztKd
 LFPcaYTIZkSvIEW9PJT64_lJ4LoO55Dz2eouVUZ7jp1y4ZGKAwkllGkT2hq9K1lX.vFsq37NDDTH
 8ZeW5ZhYfStmaG3m21RNPT.kDcT1cT5lyfpgOrVupFkhrvZxWlpNsYdMlYaV4SKWwSo53.eaugt_
 cuL3twZTeK2Nd7d9Mffhb1bkhqwqWR3mRLRJRBZlmVeJWDVf1hBBekscdfORSZgIphTepNQ.y6i.
 yQFzL..yFaF0tkHlm3sDKAhUnFdRAwjw9VyEzc2.XcZkVFhwMjC85NcsJMVhYbYMhp_aY24uI5bO
 K7cFtH.5lPjfJd7TLwce_ulObFMaMYZLl7ade7LIlIWlsaLjTUOBKQlufkDfrDqqy8WfCMXlB0tG
 OU.xJGYwhvWxivvcGniM_sUENSYf60LQxr1CzqelMMzemu2QFySm9t6oOEXN73d9jPaDSzDxJIJt
 ScGfir687lwiQMvc4.DRW5dSDc8wxtCh5MsIaxJVs8AOTk5W9B5O1CZkcAjhOu0cvCdEH_ZTPgO.
 CGnJSA1HcH9lGAvaFytKkShtXH6HKfbpYELIUOIlG4Dqci0QEC2fUkagThtqbPe4.SPYmWRxaVnz
 WDCgPoTwY1729WBOcFcckis26ozB_lNEUHOabP7Xtw7u0iPnDk0cGzDPQZCn4.acGXf5fBmXDt7w
 PDv447iagEbfLyKu13iVB7fh7IhQbpyOf2fF3YHsit._D5jqeUpx2aNRPAgWsRPdLihW73wiuExb
 NVIJO6jcselt0jJ3xvkA4GqoNw0bkaYAqvBui85EVZP3WrFTc_dm5AzljMfPbFwIIich.7e7.quY
 fdBhh6gP4hfMBli44WSve9h0OHglkPOgQt7xsLILJyYC54e48Ypp7j.xWDQjhSa3_Jeia8h0Th5V
 4c7cxETt9.X9KnKSTloEl6sKTzldEFMPOBwaPa6xlwi6L4hlPjKEICdOgeGi66RoesPCEqRg4vQB
 LKopVYtdS.KYX9Jlulx4Fl.dMdCYOvrPMYlqSPr9e2AeNl9xaGpTFnuuT.FvPdOlOlv2674VLT3N
 9RIqS2Aom85QzR6DcAhMDf4uAgrXrx_ZzeS4ff2YzCla.exk3VGt5.l0FEu2SWd01s9k_BjWxra3
 UJ2l21edriz33wQuoK9.FLo8ijvBuDEyAnXNNt5DgcCUDm85bZWOuBu6Yh7vFLA0.UDKc9Pl6Zfm
 HwCcORbao4gOPD0L2.B.s9NUjthabR8UNtStjDGCZFTCtGh9YLXtZ7CxMNF4ZcQZ6Oa2xA03uERv
 xoCHB1xltKSoEdas1uOBw4kHSaQL5oQStu4FYe5utVcJzqLWK.Wc6xaATgfTtzwvxWDJ4b3rPqvB
 GTp1qk2tz5npiAZbxFaOl39FNJx919yCydnyoAOJwBpzX6YNWJ8ienUjjURRO
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 7250cf58-0fe1-4c8f-9d1e-2e88fd8c6c36
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.gq1.yahoo.com with HTTP; Wed, 4 Mar 2026 13:54:12 +0000
Received: by hermes--production-ir2-bbcfb4457-29p8w (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 66d1d57ce825e31216776720d743499f; 
 Wed, 04 Mar 2026 13:54:09 +0000 (UTC)
Message-ID: <e35a45c39b8d8c8e9d095ca857570b8a910c90f8.camel@aol.com>
Subject: Re: [PATCH v5] drm/gud: fix NULL crtc dereference on display disable
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Shenghao Yang	
 <me@shenghaoyang.info>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Date: Wed, 04 Mar 2026 13:53:58 +0000
In-Reply-To: <7b97e2517371b8e76cded18820090e44759bceb3.camel@aol.com>
References: <20260222054551.80864-1-me@shenghaoyang.info>
 <1ffb000d-8189-405d-861b-6eb449773f56@suse.de>
 <7b97e2517371b8e76cded18820090e44759bceb3.camel@aol.com>
Autocrypt: addr=rubenru09@aol.com; prefer-encrypt=mutual;
 keydata=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
 eIvzsqg==
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-HSIjlAD/uQadFsET0TBG"
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
X-Rspamd-Queue-Id: A8F5D200C41
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[aol.com,reject];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[aol.com:s=a2048];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:me@shenghaoyang.info,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[suse.de,shenghaoyang.info,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rubenru09@aol.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[aol.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,shenghaoyang.info:email]
X-Rspamd-Action: no action


--=-HSIjlAD/uQadFsET0TBG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-02-25 at 11:52 +0000, Ruben Wauters wrote:
> On Wed, 2026-02-25 at 09:52 +0100, Thomas Zimmermann wrote:
> > Hi
> >=20
> > Am 22.02.26 um 06:45 schrieb Shenghao Yang:
> > > gud_plane_atomic_update() currently handles both crtc state and
> > > framebuffer updates - the complexity has led to a few accidental
> > > NULL pointer dereferences.
> > >=20
> > > Commit dc2d5ddb193e ("drm/gud: fix NULL fb and crtc dereferences
> > > on USB disconnect") [1] fixed an earlier dereference but planes
> > > can also be disabled in non-hotplug paths (e.g. display disables
> > > via the desktop environment). The drm_dev_enter() call would not
> > > cause an early return in those and subsequently oops on
> > > dereferencing crtc:
> > >=20
> > > BUG: kernel NULL pointer dereference, address: 00000000000005c8
> > > CPU: 6 UID: 1000 PID: 3473 Comm: kwin_wayland Not tainted 6.18.2-200.=
vanilla.gud.fc42.x86_64 #1 PREEMPT(lazy)
> > > RIP: 0010:gud_plane_atomic_update+0x148/0x470 [gud]
> > >   <TASK>
> > >   drm_atomic_helper_commit_planes+0x28e/0x310
> > >   drm_atomic_helper_commit_tail+0x2a/0x70
> > >   commit_tail+0xf1/0x150
> > >   drm_atomic_helper_commit+0x13c/0x180
> > >   drm_atomic_commit+0xb1/0xe0
> > > info ? __pfx___drm_printfn_info+0x10/0x10
> > >   drm_mode_atomic_ioctl+0x70f/0x7c0
> > >   ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> > >   drm_ioctl_kernel+0xae/0x100
> > >   drm_ioctl+0x2a8/0x550
> > >   ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> > >   __x64_sys_ioctl+0x97/0xe0
> > >   do_syscall_64+0x7e/0x7f0
> > >   ? __ct_user_enter+0x56/0xd0
> > >   ? do_syscall_64+0x158/0x7f0
> > >   ? __ct_user_enter+0x56/0xd0
> > >   ? do_syscall_64+0x158/0x7f0
> > >   entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > >=20
> > > Split out crtc handling from gud_plane_atomic_update() into
> > > atomic_enable() and atomic_disable() functions to delegate
> > > crtc state transitioning work to the DRM helpers.
> > >=20
> > > To preserve the gud state commit sequence [2], switch to
> > > the runtime PM version of drm_atomic_helper_commit_tail() which
> > > ensures that crtcs are enabled (hence sending the
> > > GUD_REQ_SET_CONTROLLER_ENABLE and GUD_REQ_SET_DISPLAY_ENABLE
> > > requests) before a framebuffer update is sent.
> > >=20
> > > [1] https://lore.kernel.org/all/20251231055039.44266-1-me@shenghaoyan=
g.info/
> > > [2] https://github.com/notro/gud/wiki/GUD-Protocol#display-state
> > >=20
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > Closes: https://lore.kernel.org/r/202601142159.0v8ilfVs-lkp@intel.com=
/
> > > Fixes: 73cfd166e045 ("drm/gud: Replace simple display pipe with DRM a=
tomic helpers")
> > > Signed-off-by: Shenghao Yang <me@shenghaoyang.info>
> >=20
> > AFAICT this looks good.
> >=20
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Acked-by: Ruben Wauters <rubenru09@aol.com>
>=20
> This will likely require a CC stable for 6.19 at least, possibly also
> 6.18, though I'm not 100% sure how long that one will last with 7.0-rc1
> being released.

Just as a note, it seems that 6.18 has been designated a longterm
support release, and as such it would be a good idea/appropriate to
also backport this to 6.18, since the bug exists in that version too.

Shenghao, Would you prefer for me to backport this on merge when it
fails to apply it, or would you like me to add the cc stable tags, and
on failure, for you to backport it yourself?

Ruben
>=20
> I can add this when I merge it.
> >=20
> > Best regards
> > Thomas
> >=20
> > > ---
> > > v5: Send SET_CONTROLLER_ENABLE and SET_STATE_COMMIT unconditionally o=
n
> > >      crtc enable
> > > v4: Send SET_DISPLAY_ENABLE=3D1 unconditionally on crtc enable
> > > v3: Dropped stable AUTOSEL opt out
> > > v2: Moved controller and display control commands to crtc
> > >      enable / disable functions.
> > >=20
> > > [v4]: https://lore.kernel.org/lkml/20260218054711.63982-1-me@shenghao=
yang.info/
> > > [v3]: https://lore.kernel.org/lkml/20260203172630.10077-1-me@shenghao=
yang.info/
> > > [v2]: https://lore.kernel.org/lkml/20260201095956.21042-1-me@shenghao=
yang.info/
> > > [v1]: https://lore.kernel.org/lkml/20260118125044.54467-1-me@shenghao=
yang.info/
> > >=20
> > >   drivers/gpu/drm/gud/gud_drv.c      |  9 ++++-
> > >   drivers/gpu/drm/gud/gud_internal.h |  4 +++
> > >   drivers/gpu/drm/gud/gud_pipe.c     | 54 ++++++++++++++++++++-------=
---
> > >   3 files changed, 48 insertions(+), 19 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_=
drv.c
> > > index d0122d477610..17c2dead2c13 100644
> > > --- a/drivers/gpu/drm/gud/gud_drv.c
> > > +++ b/drivers/gpu/drm/gud/gud_drv.c
> > > @@ -339,7 +339,9 @@ static int gud_stats_debugfs(struct seq_file *m, =
void *data)
> > >   }
> > >  =20
> > >   static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs =3D=
 {
> > > -	.atomic_check =3D drm_crtc_helper_atomic_check
> > > +	.atomic_check =3D drm_crtc_helper_atomic_check,
> > > +	.atomic_enable =3D gud_crtc_atomic_enable,
> > > +	.atomic_disable =3D gud_crtc_atomic_disable,
> > >   };
> > >  =20
> > >   static const struct drm_crtc_funcs gud_crtc_funcs =3D {
> > > @@ -364,6 +366,10 @@ static const struct drm_plane_funcs gud_plane_fu=
ncs =3D {
> > >   	DRM_GEM_SHADOW_PLANE_FUNCS,
> > >   };
> > >  =20
> > > +static const struct drm_mode_config_helper_funcs gud_mode_config_hel=
pers =3D {
> > > +	.atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> > > +};
> > > +
> > >   static const struct drm_mode_config_funcs gud_mode_config_funcs =3D=
 {
> > >   	.fb_create =3D drm_gem_fb_create_with_dirty,
> > >   	.atomic_check =3D drm_atomic_helper_check,
> > > @@ -499,6 +505,7 @@ static int gud_probe(struct usb_interface *intf, =
const struct usb_device_id *id)
> > >   	drm->mode_config.min_height =3D le32_to_cpu(desc.min_height);
> > >   	drm->mode_config.max_height =3D le32_to_cpu(desc.max_height);
> > >   	drm->mode_config.funcs =3D &gud_mode_config_funcs;
> > > +	drm->mode_config.helper_private =3D &gud_mode_config_helpers;
> > >  =20
> > >   	/* Format init */
> > >   	formats_dev =3D devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KERNEL)=
;
> > > diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud=
/gud_internal.h
> > > index d27c31648341..a5b7e53cf79c 100644
> > > --- a/drivers/gpu/drm/gud/gud_internal.h
> > > +++ b/drivers/gpu/drm/gud/gud_internal.h
> > > @@ -62,6 +62,10 @@ int gud_usb_set_u8(struct gud_device *gdrm, u8 req=
uest, u8 val);
> > >  =20
> > >   void gud_clear_damage(struct gud_device *gdrm);
> > >   void gud_flush_work(struct work_struct *work);
> > > +void gud_crtc_atomic_enable(struct drm_crtc *crtc,
> > > +			   struct drm_atomic_state *state);
> > > +void gud_crtc_atomic_disable(struct drm_crtc *crtc,
> > > +			   struct drm_atomic_state *state);
> > >   int gud_plane_atomic_check(struct drm_plane *plane,
> > >   			   struct drm_atomic_state *state);
> > >   void gud_plane_atomic_update(struct drm_plane *plane,
> > > diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud=
_pipe.c
> > > index 4b77be94348d..587d6dd2b32e 100644
> > > --- a/drivers/gpu/drm/gud/gud_pipe.c
> > > +++ b/drivers/gpu/drm/gud/gud_pipe.c
> > > @@ -580,6 +580,39 @@ int gud_plane_atomic_check(struct drm_plane *pla=
ne,
> > >   	return ret;
> > >   }
> > >  =20
> > > +void gud_crtc_atomic_enable(struct drm_crtc *crtc,
> > > +			   struct drm_atomic_state *state)
> > > +{
> > > +	struct drm_device *drm =3D crtc->dev;
> > > +	struct gud_device *gdrm =3D to_gud_device(drm);
> > > +	int idx;
> > > +
> > > +	if (!drm_dev_enter(drm, &idx))
> > > +		return;
> > > +
> > > +	gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
> > > +	gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
> > > +	gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, 1);
> > > +
> > > +	drm_dev_exit(idx);
> > > +}
> > > +
> > > +void gud_crtc_atomic_disable(struct drm_crtc *crtc,
> > > +			   struct drm_atomic_state *state)
> > > +{
> > > +	struct drm_device *drm =3D crtc->dev;
> > > +	struct gud_device *gdrm =3D to_gud_device(drm);
> > > +	int idx;
> > > +
> > > +	if (!drm_dev_enter(drm, &idx))
> > > +		return;
> > > +
> > > +	gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, 0);
> > > +	gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
> > > +
> > > +	drm_dev_exit(idx);
> > > +}
> > > +
> > >   void gud_plane_atomic_update(struct drm_plane *plane,
> > >   			     struct drm_atomic_state *atomic_state)
> > >   {
> > > @@ -607,24 +640,12 @@ void gud_plane_atomic_update(struct drm_plane *=
plane,
> > >   		mutex_unlock(&gdrm->damage_lock);
> > >   	}
> > >  =20
> > > -	if (!drm_dev_enter(drm, &idx))
> > > +	if (!crtc || !drm_dev_enter(drm, &idx))
> > >   		return;
> > >  =20
> > > -	if (!old_state->fb)
> > > -		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
> > > -
> > > -	if (fb && (crtc->state->mode_changed || crtc->state->connectors_cha=
nged))
> > > -		gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
> > > -
> > > -	if (crtc->state->active_changed)
> > > -		gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, crtc->state->acti=
ve);
> > > -
> > > -	if (!fb)
> > > -		goto ctrl_disable;
> > > -
> > >   	ret =3D drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> > >   	if (ret)
> > > -		goto ctrl_disable;
> > > +		goto out;
> > >  =20
> > >   	drm_atomic_helper_damage_iter_init(&iter, old_state, new_state);
> > >   	drm_atomic_for_each_plane_damage(&iter, &damage)
> > > @@ -632,9 +653,6 @@ void gud_plane_atomic_update(struct drm_plane *pl=
ane,
> > >  =20
> > >   	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> > >  =20
> > > -ctrl_disable:
> > > -	if (!crtc->state->enable)
> > > -		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
> > > -
> > > +out:
> > >   	drm_dev_exit(idx);
> > >   }

--=-HSIjlAD/uQadFsET0TBG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEE3obNNdPQ9V5CQi2Y0n5QwFCuDOEFAmmoOXYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJENJ+UMBQrgzhueYP/2TxWgcXElbbkW+jQls0
wL24YnZe58hIVtZBMF/sixp8NYXpibL89k9GyQ8sLwOFtuXYVWFDO4Dq0yot0qKu
rFID3hAAj52CcrJHK1jfOrF7Q6mlL6wrcthamvaXOy2QVEb6VnNFBoDmmxNy8jJz
YyIaXo2FVobDg/KdtdrVl2Hqr9OXJeIhCTI75FsBNr9guhtoving8vQXZlmV/WHL
Gpe4+WqT3yJ4vdMhuryo/mhUMJNecK/r0si4iGAQ8mC/GamQimasXxsuWDGA2kXh
6f9SxSwQQq4KmImEsv5BpLROlaUi4pxv3h03p+CZYckyVaWlZzJL9DUtGJoQu2hz
CUzndWTiagRUga+JeTpCQhMLTUG7g2R25DMe+83ja9V4tWpPHzmNxSuq48vM33Ot
iLoMDgqQjlAk4FmOqwjLfSt3hhC5pqaqt67WH/Q4TzAR1vnevTY/pQPEd6juy5r2
SivJUFvgNtRGXqU3bxFnfeJIfDZ++6QUGGuk/+NBI8kj52kCatzRgCcOrZMa2V6k
42fiBHyTn24N6KGkfZvre3QMh7NxJix7RFcCOfq40jXEV23f7NsCLFQOg+VQNMWX
Vmr7O/v2sAycJOHTN4n1HMW6KQ2VkdRaCSpIw8lvbUO51HitZYcD5kuxn6hL043k
72JYgTbZlAMdedP4O7kqldu3
=Tb+2
-----END PGP SIGNATURE-----

--=-HSIjlAD/uQadFsET0TBG--
