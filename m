Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EBqI4a7jWl96AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 12:37:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE32F12D103
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 12:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F358B10E724;
	Thu, 12 Feb 2026 11:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WindAn0l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5364F10E724
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 11:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770896255;
 bh=FjLTUMZLMFfkZxQ0d6hIiSmNXJgO9Lo0ERZR2ryBXsM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WindAn0lCW/X07L9Jcj75UDbSLyKr0/VJYnH1kTMji03fy8GJUSW2wJcBvoNHSfqX
 ADRkcf4PdPDQZsfoqMIfTGXuKouw+x9v+NKBpVeir4Un7T300JBt7WFjtlV/3QkXqp
 cBauhh7/FkJER03t1lretGU00aO3fcpoVnS6qpu8VpwWe1Li2dF8XF68s1rQEm0ZPs
 7puQ+KTclF9uHZca0w+Ro2FyXfW07lRVvb9yp5Agugxz6kltjvfHC8rj30QSSRinYE
 b5IG+whku6qefJWfQOHlacmwYZyyc9mf4FPri9luNa1YTsD54KRxcgXK27YO9Wx/au
 //fYbfiaXprRQ==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4315A17E0C21;
 Thu, 12 Feb 2026 12:37:35 +0100 (CET)
Date: Thu, 12 Feb 2026 13:37:23 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, Haneen Mohammed
 <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, Melissa Wen
 <melissa.srw@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nfraprado@collabora.com, daniels@collabora.com, kernel@collabora.com
Subject: Re: [PATCH v2 1/2] drm/vkms: Fix bad matrix offset component
 multiplication
Message-ID: <20260212133723.1ef95fd2@eldfell>
In-Reply-To: <20260210-vkms-composer-fix-matrix-v2-1-d1ed09cb23e8@collabora.com>
References: <20260210-vkms-composer-fix-matrix-v2-0-d1ed09cb23e8@collabora.com>
 <20260210-vkms-composer-fix-matrix-v2-1-d1ed09cb23e8@collabora.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mhVFhkJQ+v09lGYJfI6fXB=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ariel.dalessandro@collabora.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:simona@ffwll.ch,m:melissa.srw@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:linux-kernel@vger.kernel.org,m:nfraprado@collabora.com,m:daniels@collabora.com,m:kernel@collabora.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[pekka.paalanen@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[pekka.paalanen@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,collabora.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: DE32F12D103
X-Rspamd-Action: no action

--Sig_/mhVFhkJQ+v09lGYJfI6fXB=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Feb 2026 14:44:00 -0300
Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:

> Pixels values are packed as 16-bit UNORM values, so the matrix offset
> components must be multiplied properly by the idempotent element -i.e.
> number 1 encoded as 16-bit UNORM-.
>=20
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index cd85de4ffd03d..d53ea4189c97b 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -17,6 +17,8 @@
>  #include "vkms_composer.h"
>  #include "vkms_luts.h"
> =20
> +#define UNORM_16BIT_ONE			(1ULL << 16)

Hi,

shouldn't this be 0xffff instead?

> +
>  static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>  {
>  	u32 new_color;
> @@ -139,20 +141,25 @@ VISIBLE_IF_KUNIT void apply_3x4_matrix(struct pixel=
_argb_s32 *pixel,
>  	g =3D drm_int2fixp(pixel->g);
>  	b =3D drm_int2fixp(pixel->b);
> =20
> +	/*
> +	 * Pixels values are packed as 16-bit UNORM values, so the matrix offset
> +	 * components must be multiplied properly by the idempotent element -i.=
e.
> +	 * number 1 encoded as 16-bit UNORM-.
> +	 */
>  	rf =3D drm_fixp_mul(drm_sm2fixp(matrix->matrix[0]), r) +
>  	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[1]), g) +
>  	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[2]), b) +
> -	     drm_sm2fixp(matrix->matrix[3]);
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[3]), drm_int2fixp(UNORM_16=
BIT_ONE));
> =20
>  	gf =3D drm_fixp_mul(drm_sm2fixp(matrix->matrix[4]), r) +
>  	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[5]), g) +
>  	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[6]), b) +
> -	     drm_sm2fixp(matrix->matrix[7]);
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[7]), drm_int2fixp(UNORM_16=
BIT_ONE));
> =20
>  	bf =3D drm_fixp_mul(drm_sm2fixp(matrix->matrix[8]), r) +
>  	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[9]), g) +
>  	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[10]), b) +
> -	     drm_sm2fixp(matrix->matrix[11]);
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[11]), drm_int2fixp(UNORM_1=
6BIT_ONE));
> =20
>  	pixel->r =3D drm_fixp2int_round(rf);
>  	pixel->g =3D drm_fixp2int_round(gf);
>=20

Ok, so this is because r, g, b have the integer pixel value [0, 65535].
A casual reader would expect them to be normalized [0.0, 1.0] (as is
possible without any loss of precision). But since they are not
normalized, multiplication by normalized 1.0 must be carried out
explicitly.

If UNORM_16BIT_ONE was 0xffff, you would have my
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/mhVFhkJQ+v09lGYJfI6fXB=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmmNu3MACgkQI1/ltBGq
qqdNCQ/7BAWBcGVXOjzcZz0TlF9IXRfxWo9rHgZJTvHn87OSTkk0wxn/0ypKM5vU
9jDsQBpwzgwrM/D7j5LzFT3JjJHl6PsR8kNlg04TlsiK0QOo6tb3fequcnYnze3f
16EKQcePqGXY7DqR1UG9ogCwjGH/Xi5rRaGngLJqoDqhC5+GvxKbSgHiKAF6UNIJ
dZvuJrRwgDRLYmvnqsC/AEBzSaYTBk+v4t43lYRzir26VcqQFPos3XQzwEqZ0CYo
ecYtIIRD2bou38DCsk2nJyxeFdr3seBPo0zN3HL/N97Sf2VCHe/8cEx5iGI3P7v4
didPXle4hwy7yskJdOkvbQTL2ATQMQZfd5kZirQZ6HBp/pckIXZIxaExfZPGp9N+
ezW94QKeahJ3fhvajZd3YtiaXFIadITyfrjIQQIxExfWT/60h29Kl5MVRRm/dt9i
G/lm1ZR2ofBfdw5R8whpHLb4fX7NIkGdjeSYsX764yCjU7tShOg0mHnRPic+KHQR
g58POYqYUw+pE76G3zq33emFMU3OJCrcc/s3BTXw0wg6oPGBvMr92wgG33g4E8ay
Kz4haFVw7nkXfz224+1RgUaIocg8PwGUTKbhYevTOLmTUAuDT7QDWCgHXJQD7VOG
okpX8oIaNc4mpsvNe9/7Ao3YVVW7x1htA8If5qE9n75cq1+gsbY=
=Jz6k
-----END PGP SIGNATURE-----

--Sig_/mhVFhkJQ+v09lGYJfI6fXB=--
