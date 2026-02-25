Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFIILSTlnmkCXwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:03:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FFA196F41
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D19410E748;
	Wed, 25 Feb 2026 12:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="YegaJB4g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic311-50.consmr.mail.ne1.yahoo.com
 (sonic311-50.consmr.mail.ne1.yahoo.com [66.163.188.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2C210E748
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 12:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1772021024; bh=uRlQuuScDNOh2+FqFEjUlSwAUEzZ+rfRqf0BixwadbM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=YegaJB4gN+CrClhyRxLj2X99wiwNZBSJbfXb4qC61TbBs3OGDvdkx9WGLWUYs7haulrIOgk5nihoE7REDzuWrJdMm4uDt72QzUterNFNJaPdRcMJZAG9agYqhvj29vSivk8d/rIr62B41KWQI+itZdy/rdr5S3VK3uC9VQi+CdJwS/09ER8u7qckjpviaXSsRaS/JMT44VDxHwAoSIf0i7IKHHxDDwvNtqh270Ik4UZNPDzc7sJz9kaqsS6evsbaW5LKJqJA0mp7Beadw56/MjunnKlkEPg2tg+0vxLUv/W0qPLZVfKpjBwMz7U4l76tjU8rr5JNFfbV1vfetEwm0Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1772021024; bh=EbkhjRbI7BANtduNbW1jkwDhKBFeU6AEPDihA4EM/X8=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=LSbPCqKk2WFVN32f+L/TB9yO/+/IHW+G0eQrsonGYh9ql7gSWwaec/ggs0E5WmQQ6ZBp/YJOmiBclf1rMY6GBWf9S5NyomS0JQVLy7bx8TkY17aee0WJgdJWsDXUpgwckobIhL8+rIehJMCTKbo/yiHqt34hs3Sybne9xfICV/RoyUT8U3cWcfTBf8bwCWzOgnofmQ6m4LWvxbozi3iA3Wl7b33tZ8+/KcPy5F9ptD+91lYqLRRNrxfGp1WfHdnQQdQ9hCOUpcv7G8oWWaV1bHXFyBHNl30cfuOHeOWRT3Jrkf5t9Ic5XGhx93jqguF2nngMsiv6bblSKJ+/BIiudg==
X-YMail-OSG: dqu4cZAVM1m_BN9iyezxbWFlSecxU9sQtz8flrTKEqQRTKEEzcm9BY38tGKPRwi
 yLbD97Z7pUQY84Mlt_vJM0p_8z7lo81ApEmtRy9O.dAEggX.kGeF5VUf.7VTaJmk12MYd3n_ujbm
 JOUDlLNHxmTbYrXYnPad3DmE8Y85AQ2UelKEXvm64_f9BfzyKoZI7oeQnLX2U4jJ3.KL5Dm5qr38
 SBEUX8ksgnKFNxdA0t9Bnef9sAjpFTZu38nX1UoRm92TLORCdcRpgyO_7VEyBIoAdQcVBxyAjq82
 Gq3DqRE33IR3qq.D_2EvPYNqM74TfTYyrvqXw92TWdqdoepdINUu9TyPdLhwmuWH7DE0Fop5CjSF
 kupPZxiIwQGy.wfXBQVnG.uE8_NZnnqBqPQAVo5BSmxpWrtFhEXEu_4UVIPaE2iw2w_573PqSPjy
 Ru7rIBtlAZQYZmWAe_FI9zg1RIiqc0xYo5nl1m9so3SfJl44KybZYMpXI1sf8cQZicQy1sOgiyGH
 9MDOj5I586RkEBYdRFF79Ls.ue1C9FCskbi1D84lf0H3bt6JUhEVbZ8Bp_2iLbsdNM5zmYbZls5B
 QRS8PdoL9NTtFkMb_pfAE5lYMtQb88O36fDH.ZZ8brH3Tg6sqMumkm1HRZ3T3bIBMHpn3tVfrXdo
 YKjxrYwXIdPx8uwLhyXWCTaYk41Ks.Xx49vI0xRUmaqk4tRCWuLfMvfTQQu9u43PrqNR4n_GjhoE
 oGIZwe_YNnyJA0NM9Ut1jskE3gwp7B5WJzF9zq6_wRcKe9GAun4_vlzxb.tjgYjEt40G0ESe9eGa
 NLEoF8BLbY1G4Im7wQCni8J0.i.v0k5WaXRtbfOvqzI3XDyMRXwCT0mCeHgBF_1VPI8gpHHlWGg8
 LwqKamuheyfpAf9_xaEiqphc4hQYbExin0QMV0LIjnbwyLo7Pq_JnUltFtVH_U8gTpwufGx6EnWg
 5AJCkN6AU2WwmHG.THizKe61VJ9Lv1TNVYBmF1keYX.0njmkQbEMH9QNLn5aFPAhNz5bng2Xf3zV
 y4mSWFJ1C2atRo4x.PCGI.iRDPnGoS6n0AiobFJqt2WWdy6mzSsedaZGuyZWBsiCQiYDxBXfcoN8
 7H_bGzms1pjVYB9MqqPTXkB__aDhY.ixfhXk8V6IqDZCQoSP.Wb0jA81vspEde4hX8AIljaSBKJm
 RivUEqi1sPu3RHQwA3ZIYTl3R3bKIoCwY4evZTvLoh1w.JIPugfZ1mKguWNofouflaGNUNMvoa39
 qcoHlvV.7O8GgaJg6d6hjIbGpcBD7cICjX0yDjljWk3xwWPLfIYKWRrrUiCnLUNV2t1ZPHXj80o3
 cKzYMtSycm9JDcREZC04FSyC_64Qz2nxfNiiwXbWin9KW3exRszYPf6K9AmnnuQ_031FlLsp9I_8
 8C.eQk2HTc8DGWbsAvmiB9QLzG3IDjpXNHkGvJJdqrm0.TsrtdSuKdJZ8JWIBRCrW4Pzc8cPNUka
 rJhNac9rH7aDL6i1GwDueMZi6KuScjnnzxKbRArnjsx50_uYPDS_gfDK4X0ADVe1AQQ8D5pEvzBc
 h_0EWyeLnWn0fFLfiDJg.Gz6av_jE.iqcNM5ljeL52iQnIY_b4ch0WWsz0HG1sHf.Jm8OzGKwvxA
 N.WdjuaySDoECWYbbt_tu7TaKFBTUsn0migRN.HXlLFMQsGf6dTKqKW3SYJPlCXa_ykPbVETJLGn
 k11qVXOrZjnWlOkrYDm9j45njSc1r1tf1yuVHWA0ZJFu8tn8RoIvERw8PwH6NAz4.c4opMDQ0pzY
 cwe1Pw5LLeRHugtkOyvw5xRTQthNnWOPucWg_PpO8v1a8npfy41O7ch5O911YjQB3tSmgU85bbLb
 OwPZ46ZVdKDhzHirff.3Y1TGdrkghyC_qu6Y0eo3faPvA8XWeSLAyDsWV5Sza0KUxnGLkpDAObDd
 amZbZ9h40YA.wLz1QihvsixRnfzsDHIlq_.dxeDrzt4FyomJKdMlZibaVXSleRKJmCrWWn8xsz9M
 _wNIro29IVCy4RD9KQUl3WnA.YlgILfNBnavt8.EE2LiAM.ZTUbmLExbBVoXSjjbAhPU5x3pt6Bl
 PbQmnc58zxWPpi2dNqvukh9mMGCTP_1qq7JEiBic_kAlfm0inSAPoQ76xCqlMZpSBGl3.JxFdK3g
 W3cB4_Fxhj4YuHxlcI0aD7oug1ZweCFHDsKkqGlasnPdW45aruGYR8TtiiYtoVeHlfHaK7Sb4lVp
 RX7qVopxQUW8E2eXq3_UI_1u578Wu3VBytmPJZRFUMo5puMwvgHotRJI7pZS30qmhs3oCz4krG1O
 WH_OVVx9dcD7sz3dnkcIjlOZhLJ0vPy93MZ7Z6uca7Q--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 53c25fc1-55c8-4d62-8419-efb3b25b5d03
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Feb 2026 12:03:44 +0000
Received: by hermes--production-ir2-bbcfb4457-f49j6 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID f3aef42cd099924b45f2fa340152a86c; 
 Wed, 25 Feb 2026 12:01:41 +0000 (UTC)
Message-ID: <b8c179c1e557bfda50be169182d9c1f328693e81.camel@aol.com>
Subject: Re: [drm/gud] RFC: Convert dev_* logging to drm_*() for
 multi-instance GUD devices?
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Hardik Phalet
 <hardik.phalet@pm.me>
Cc: Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Date: Wed, 25 Feb 2026 12:01:34 +0000
In-Reply-To: <c22170a2-b9d9-4cf9-8b10-a56fcb28301b@suse.de>
References: <DGLADYEJGEKE.3JJBF0RHQ4T6H@pm.me>
 <c22170a2-b9d9-4cf9-8b10-a56fcb28301b@suse.de>
Autocrypt: addr=rubenru09@aol.com; prefer-encrypt=mutual;
 keydata=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
 eIvzsqg==
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-3gg89Ggm7c4EOCdoayvJ"
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
X-Spamd-Result: default: False [-2.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[aol.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[aol.com:s=a2048];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:hardik.phalet@pm.me,m:seanpaul@chromium.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rubenru09@aol.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rubenru09@aol.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[aol.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_FROM(0.00)[aol.com];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 22FFA196F41
X-Rspamd-Action: no action


--=-3gg89Ggm7c4EOCdoayvJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, 2026-02-25 at 09:48 +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 22.02.26 um 07:45 schrieb Hardik Phalet:
> > Hi Ruben,
> >=20
> > I am looking to work on a small starter task in DRM and was considering
> > converting logging in drivers/gpu/drm/gud from dev_info/dev_warn/dev_er=
r
> > to the drm_*() helpers where a struct drm_device is already (or readily=
)
> > available.

My apologies, I seem to have missed this message in the first place, I
think this is mainly fine.
> >=20
> > Since GUD is a USB-backed DRM driver and can have multiple active
> > instances, using drm_*() would make log messages instance-aware and
> > consistent with DRM drivers.
> >=20
> > Before preparing a patch series, I wanted to check whether this kind of
> > conversion is welcome for GUD, and whether there are any parts of the d=
river
> > you would prefer to keep using dev_*() instead of drm_*().

In my opinion, logging that relates specifically to USB should use dev
rather than logging that relates to drm, if it does relate to drm then
it should be fine to convert them. I'm happy to accept a patch.
> >=20
> > If this is fine, I plan to keep the changes mechanical and scoped only =
to
> > call sites where drm_device is already in scope, preserving logging
> > semantics.
>=20
> I'm not Ruben, but generally speaking that conversion of the logging is=
=20
> ok. But there's not much in gud to convert and the early calls in=20
> gud_probe() should rather not be converted.

I agree with Thomas here, gud_probe() as a function is still a bit of a
mess, but since it relates to early init, and the early parts are
mainly to do with USB and capabilities assessment, they should remain
dev
>=20
> If you're looking for an easy task, maybe try open-coding=20
> drm_simple_encoder_init(). There's an upcoming TODO item at [1].

I'm happy for you to do conversions if you want, but this also seems to
be a good task to do. If not I probably will end up looking at it
myself eventually.

Ruben
>=20
> Best regards
> Thomas
>=20
> [1]=20
> https://lore.kernel.org/dri-devel/20260224153656.261351-17-tzimmermann@su=
se.de/T/#Z2e.:..:20260224153656.261351-17-tzimmermann::40suse.de:1Documenta=
tion:gpu:todo.rst

> >=20
> > Thanks,
> > Hardik
> >=20

--=-3gg89Ggm7c4EOCdoayvJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEE3obNNdPQ9V5CQi2Y0n5QwFCuDOEFAmme5J4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJENJ+UMBQrgzhv20QAMBwFm50UD626xseT/yD
oF5fOPTprnZ82+1qqly16cqcsbRZ/he0qMN1VGGMdisbjantkkhAxINAk3H6VdSl
WvcKpaRFB1f3w+yalVoDVHzSO/fbRZhq0xyALuZfTfTRiwhsHT1oEempOBRxJvyD
gXfdfYCB+CGK7aKqJ7u22zwVMBmo0/yaqrw3BjR33gi22eFHfjl548ikHzrSsqgw
C3b4500Okeo+yip8enUpVIaAp8moRLn0aKuQmH7ORo+klxvcTV5Cl1JOy//7PSqY
MTuDQ/O6ik4Iq75g5dUhAds3KP7NooYJPBoKAS+ZA8q0zrNvmPFOEsRt9nTrCsiG
mgMNP1Gxu4FGu+9eJ/cdO90vQwXAox+XfCmVr0BjcrszRnBZrFbeZrL8k1LnIGQp
P5q3uyhKs4MsTVHM5L4R5tvOT883Zr4sr7fSTjgE2CazDgARsZjmzL6c+GKKXGIM
4U3E/M0/ucy6aVscNLv/TGuEJ6/D3ScvBa+LflNHfs2QTKu4KNbULqHT61f5UhwA
4OJRJIqh+IzPPsNTU4wwLBu50HriJTHNIMmNJopQjeci1x1CP1f8aKxAfTmKijfy
MIOf2G5BpkIpcXClGi1sZ1bxnQiCuzCNW8BVZdx+oCKG0lOq/pyWwqw+jBvQ1eoW
qn8zfUb5gPvrvW52c50tFZTq
=d8L8
-----END PGP SIGNATURE-----

--=-3gg89Ggm7c4EOCdoayvJ--
