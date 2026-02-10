Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDkBMsf2imkePAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:13:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D4A118B5A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890B510E518;
	Tue, 10 Feb 2026 09:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aSkuneob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F1910E518
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:13:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8F53D60137;
 Tue, 10 Feb 2026 09:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75B0C116C6;
 Tue, 10 Feb 2026 09:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770714816;
 bh=r94bS5lPermEoXkPGXiF/iNxCw6NrAvouaw19DmgW64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aSkuneobr55lzOv5Rhu/GobRMnha20TvIzpr9yO8/r3aDhgJ1sDStePVvD3LCJYcX
 pPK1PzI3Jqx5ZFRUMXTDTfqcDn9N3yKJcIbnTxR2rk1zxhJfa7DsT2dKthdf+ASDwY
 XxM7VgANqDQ9S/VxR6MpZ+il11csnZr3mKwCVfUH+/vfroxYvjLrP7kRcBMxCtEti2
 DmYVkIDfnCsHncOtJpaUpweC5yk63RMduoZr69i3noqyBdTHSZjhrwGC2i/u1H3NL8
 YPke9Qaofskr02tQdU0ZuS5Ka7PHmcjL/oAXTA+NH/TpoTl7cjHREYhN59bPEJ849E
 /1pCBpCvalftw==
Date: Tue, 10 Feb 2026 10:13:33 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com
Subject: Re: [PATCH v4 14/15] drm/vc4: Switch private_obj initialization to
 atomic_create_state
Message-ID: <20260210-impossible-smoky-bullmastiff-a75cc2@houat>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
 <20260128-drm-private-obj-reset-v4-14-90891fa3d3b0@redhat.com>
 <64a6f534-b94b-4a53-ae7f-4171168837ed@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="f2i3o44zvbz4ltod"
Content-Disposition: inline
In-Reply-To: <64a6f534-b94b-4a53-ae7f-4171168837ed@igalia.com>
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
X-Spamd-Result: default: False [-2.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,raspberrypi.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 35D4A118B5A
X-Rspamd-Action: no action


--f2i3o44zvbz4ltod
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 14/15] drm/vc4: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0

Hi Maira,

Thanks for the review!

On Sat, Feb 07, 2026 at 05:34:58PM -0300, Ma=EDra Canal wrote:
> > @@ -716,13 +725,28 @@ static void vc4_load_tracker_destroy_state(struct=
 drm_private_obj *obj,
> >   	load_state =3D to_vc4_load_tracker_state(state);
> >   	kfree(load_state);
> >   }
> > +static struct drm_private_state *
> > +vc4_load_tracker_create_state(struct drm_private_obj *obj)
> > +{
> > +	struct vc4_load_tracker_state *load_state;
> > +
> > +	load_state =3D kzalloc(sizeof(*load_state), GFP_KERNEL);
> > +	if (!load_state)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	__drm_atomic_helper_private_obj_create_state(obj, &load_state->base);
> > +
> > +	return &load_state->base;
> > +}
> > +
> >   static const struct drm_private_state_funcs vc4_load_tracker_state_fu=
ncs =3D {
> >   	.atomic_duplicate_state =3D vc4_load_tracker_duplicate_state,
> >   	.atomic_destroy_state =3D vc4_load_tracker_destroy_state,
> > +	.atomic_create_state =3D vc4_load_tracker_create_state,
>=20
> Minor nit: just to keep things consistent, could you move this hook to
> the first line?

Good catch, I've fixed it up while applying.

Thanks!
Maxime

--f2i3o44zvbz4ltod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYr2vQAKCRAnX84Zoj2+
dqIcAYCXlvXcZu5MDerDSBZ/3YdSXV5R3e/BMlucK9gUKDd7cf+dMtcnyP1VV41l
5+aAW5QBf1bqnRIVorSLMOslKE0teBi3z5tP5tXP6Lk9W8puqWiA5PzLWNTO15r0
cU7J1tKaOg==
=1S4T
-----END PGP SIGNATURE-----

--f2i3o44zvbz4ltod--
