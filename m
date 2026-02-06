Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id T847OparhWnqEwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 09:51:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49734FBACB
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 09:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E6610E5CD;
	Fri,  6 Feb 2026 08:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="S8AZlDAu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C57F10E5CD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 08:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770367889;
 bh=8cWuy2S8DaSwgYrlkHnpzPAslnN9oEH1hvc3lC/AbEU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S8AZlDAuT2tMkIVDxejZ2ylBzw8HiUymsCvenm5Y7mbTxdH5oxHoRQjgfmPw5BXjM
 1emUHLByh6Ddnga8GY3MhAcLgsc+xfwjYAGWmz9K5nu8mijtlAa9bKirn25Pw6OQdC
 qljipE0581+rnnuWrJQLqgf40AWdy7WaUKOvidLL5t8dlI9qyTL0jXgMrsnftiUJlR
 P0AW6I6LVmqVslOT3T8tPTI9eRIjUGSwOKV3+Avnzq353IeJBCOlpPax5OGl53OThj
 T7g6Yjc5mxaFSNl0LaF7RFWyiL7mPRdHMp3yUEVrZCd00/TtzsqArmzZaNe2jsgJCm
 OofRdD7pvKQpg==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C71117E001E;
 Fri,  6 Feb 2026 09:51:29 +0100 (CET)
Date: Fri, 6 Feb 2026 10:51:02 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: "=?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, daniels@collabora.com,
 ariel.dalessandro@collabora.com, kernel@collabora.com
Subject: Re: [PATCH 07/11] drm/colorop: Introduce HLG EOTF
Message-ID: <20260206105102.1208fff9@eldfell>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-7-0cb99bd0ab33@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <20251223-mtk-ovl-pre-blend-colorops-v1-7-0cb99bd0ab33@collabora.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z3McZGD/cduzL_hjq1GrAml";
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
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[pekka.paalanen@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:nfraprado@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:daniels@collabora.com,m:ariel.dalessandro@collabora.com,m:kernel@collabora.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[pekka.paalanen@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 49734FBACB
X-Rspamd-Action: no action

--Sig_/Z3McZGD/cduzL_hjq1GrAml
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Dec 2025 16:44:48 -0300
N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> wrote:

> Introduce definition of a hybrid log-gamma electro-optical transfer
> function for 1D Curve colorops.
>=20
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/gpu/drm/drm_colorop.c |  1 +
>  include/drm/drm_colorop.h     | 10 ++++++++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index fafe45b93ff8..a19e03fb9c7c 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -79,6 +79,7 @@ static const char * const colorop_curve_1d_type_names[]=
 =3D {
>  	[DRM_COLOROP_1D_CURVE_BT2020_OETF] =3D "BT.2020 OETF",
>  	[DRM_COLOROP_1D_CURVE_GAMMA22] =3D "Gamma 2.2",
>  	[DRM_COLOROP_1D_CURVE_GAMMA22_INV] =3D "Gamma 2.2 Inverse",
> +	[DRM_COLOROP_1D_CURVE_HLG_EOTF] =3D "HLG",
>  };
> =20
>  static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_l=
ist[] =3D {
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index ee6454b08b2d..8ec98521607d 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -126,6 +126,16 @@ enum drm_colorop_curve_1d_type {
>  	 * The inverse of &DRM_COLOROP_1D_CURVE_GAMMA22
>  	 */
>  	DRM_COLOROP_1D_CURVE_GAMMA22_INV,
> +
> +	/**
> +	 * @DRM_COLOROP_1D_CURVE_HLG_EOTF:
> +	 *
> +	 * enum string "HLG"
> +	 *
> +	 * Hybrid log-gamma transfer function.
> +	 */
> +	DRM_COLOROP_1D_CURVE_HLG_EOTF,
> +

Hi,

if you read ITU-R BT.2100[1], you will see that the HLG EOTF has three
parameters: the system gamma, the display nominal peak luminance, and
the display black luminance. You cannot define a HLG EOTF or its
inverse without these parameters. One might assume to derive the system
gamma from the peak luminance, but I would like to leave that as a free
parameter if possible, because I'm not convinced the formulas for it are
universally applicable.

The HLG OETF on the other hand is a fixed function. Did you mean that
instead?


[1]: https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/specs.=
md#itu-r-bt2100


Thanks,
pq

--Sig_/Z3McZGD/cduzL_hjq1GrAml
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmmFq3YACgkQI1/ltBGq
qqfkthAAl9JVF0BXYzyrmP1Q4T70bzj+epbVNcVjVbZlOwqrh+7gVLz7rrchimpN
Sngz1zHLFa91+4ZkuzzGGPqxeCDOVhr0eraz6lrraMo0cWzQdtgfTkKLexw8t4ds
67U5dv/QBYdDTfQRlxlMGM9hXtG044wNJk0QCzeQQvXSSY3sNNzCVf47JvW4VqW/
/P3VfzkIP/VyPQqfeX+OFqthjrnMv0wZLR1e5JxzYtk+bXxV7b+KR249uLy61ddN
4OGn3X2iufMMXyzY9WEq3nOMhhtWG4pzux2KE4OabdbwPRI+fsUadSnVMFQjs7eo
nSD2mFTXG5DW4UNWnnrWeZKdZee74i+G2G8ojWS0zHqFZ9cRjr7WsAi50xbfl1du
tLZKuHwOuX1kPgzEmMaNwrzlT/J1ROuSq/tRd3EXdXu6jqK4Abive/XDu1Nkltwt
MwWkOqnuQ3gnVoGcsEw6Gk71EBl96JlQf1JFBE23FnaarllJXwYYZZVmDtwH1hMx
LWb9YcDcFeKa+qcEsvvVrWZmP9umpN5h4BkJpLypuAKsq5+o6OnnUapHpc0EyLxD
vqsVV/NZJyPXlMhyLcO/DUSefJHZKFZvShxZRXi+DRu7K3utFMvq8Qg9mZaJyByG
CN7kNQAdDQM0ELz7I3pIEleHpeyC3HI80/AA94FgWoh1tdLgTQU=
=jHqA
-----END PGP SIGNATURE-----

--Sig_/Z3McZGD/cduzL_hjq1GrAml--
