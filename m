Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJDTN9SWpmnmRQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:07:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464481EA8C9
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CF910E652;
	Tue,  3 Mar 2026 08:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PTW6PRxu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF1B10E652
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:07:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C2EA74453B;
 Tue,  3 Mar 2026 08:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5367AC2BCB2;
 Tue,  3 Mar 2026 08:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772525264;
 bh=A2rar4aIPgN7f9toMeZT4D4vcutUGwyjyXabghrOPtA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PTW6PRxueVc4ZW2V5/TJSaUb4/NIX6HO+3RWLyLpdODfUDy++5OrIUOEupx1/kFiz
 vU43QxNKVWQvScdW/e65I3QwKM/C69hBQOiZD09kizyacfAjp5a363w6QXeX5bwgK5
 djAPnfzH0GBY4eu6goJqOGvM426uR+ktNDN7p1fDtlxKjkVZbfLAzToZFyOyCWXgWK
 LoLHJbyNde2bbU/20KAiXf0Hx3TqGK+rC44Lten+Yp5TDsKFw0xsnS8DnuQZgD+56j
 5xFzDQSeD8OEGf9oDg7XECc6vNpz/alrLqr+rhd1I3Ib+b/2Yc42inOwvDAKtpJlaR
 0FXYSRBHBNngA==
Date: Tue, 3 Mar 2026 09:07:41 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
Message-ID: <20260303-uppish-finicky-mustang-cd135f@houat>
References: <20260115024610.661624-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="lxcfrgkphgxhtprr"
Content-Disposition: inline
In-Reply-To: <20260115024610.661624-1-marek.vasut+renesas@mailbox.org>
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
X-Rspamd-Queue-Id: 464481EA8C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:geert+renesas@glider.be,m:airlied@gmail.com,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,glider.be,gmail.com,linux.intel.com,ffwll.ch,suse.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email,glider.be:email,suse.de:email,mailbox.org:email,lists.freedesktop.org:email]
X-Rspamd-Action: no action


--lxcfrgkphgxhtprr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
MIME-Version: 1.0

On Thu, Jan 15, 2026 at 03:45:53AM +0100, Marek Vasut wrote:
> Update drm_of_get_data_lanes_count_ep() return value documentation
> to match the drm_of_get_data_lanes_count() return value documentation.
> The drm_of_get_data_lanes_count_ep() is only a wrapper around the
> drm_of_get_data_lanes_count() and therefore returns the same error
> codes.
>=20
> Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and drm_of=
_get_data_lanes_ep")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/drm_of.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 4f65ce729a473..cfd0518174de8 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -539,8 +539,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count);
>   *
>   * Return:
>   * * min..max - positive integer count of "data-lanes" elements
> - * * -EINVAL - the "data-mapping" property is unsupported
> - * * -ENODEV - the "data-mapping" property is missing
> + * * -ve - the "data-lanes" property is missing or invalid

I have no idea what "ve" means in that context. We should rephrase or
pick something more obvious.

Maxime

--lxcfrgkphgxhtprr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaaWzQAKCRAnX84Zoj2+
dt/xAYD6GWXQE4+/Sp+/YXwgIbV5GKXTqHLrEaiAJgJ9462FWjALGV4u7mv0UBt8
IySvPjEBgM1Ki+A2Oe6YIp3f5P4vhvrITxR68Y38vCOvugCNSvVf0Z5aNyO6s0uZ
vQwkikizEg==
=D5d+
-----END PGP SIGNATURE-----

--lxcfrgkphgxhtprr--
