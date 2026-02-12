Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NDbIfjojWms8gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 15:51:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C257112E937
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 15:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A621610E75C;
	Thu, 12 Feb 2026 14:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SsZRt9FG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F23C10E75A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 14:51:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F08994177C;
 Thu, 12 Feb 2026 14:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7322EC4CEF7;
 Thu, 12 Feb 2026 14:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770907891;
 bh=pM+ZBj8nZh9g0uFqM8SzCpSYe+CFpO7ZaK1fqC0vN2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SsZRt9FGKIJy9cJ1wQWyR/28uRX1LANQWaZcQKBt7mk9BoRmGOMSuDWEyHEfbBbkA
 NAg+s4IfzaIR/3yhHXy8/UUfmXcM+1j/HAVcgzU8WK57T8Aq869RnfbkudOvbMpJCb
 h7PfzKfnF7TDSVbKHKCEZgKN7jQwXlHCdLyLzSfk1OioajwXZ2dJJVCAx/kljcxam4
 qnmwQ++/Qm+yWyZanGeYtadTfgf55lCsylxDmLH4nAblqXNMcVwtZacqp9GpPSXLm8
 hR1jVWwZ8O8Dvjg1UEydj6WvqCodQTzNW0FGr3Ccydfm+P5sVl2HrwCYzSsow/EyKH
 Jvvs8MoxtAySA==
Date: Thu, 12 Feb 2026 15:51:29 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Maxime Ripard <mripard@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 07/10] arm64: tegra: Add VPR placeholder node on
 Tegra234
Message-ID: <aY3oyMhkbxhgMbfi@orome>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-8-thierry.reding@kernel.org>
 <20260123-slim-seal-of-luxury-bdb58b@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m5e6dmw2rrzidhli"
Content-Disposition: inline
In-Reply-To: <20260123-slim-seal-of-luxury-bdb58b@houat>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[thierry.reding@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:mripard@redhat.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:akpm@linux-foundation.org,m:david@redhat.com,m:rppt@kernel.org,m:sumit.garg@kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-mm@kvack.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linaro.org,kernel.org,collabora.com,arm.com,google.com,linux-foundation.org,redhat.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C257112E937
X-Rspamd-Action: no action


--m5e6dmw2rrzidhli
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 07/10] arm64: tegra: Add VPR placeholder node on
 Tegra234
MIME-Version: 1.0

On Fri, Jan 23, 2026 at 02:28:50PM +0100, Maxime Ripard wrote:
> On Thu, Jan 22, 2026 at 05:10:06PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > This node contains two sets of properties, one for the case where the
> > VPR is resizable (in which case the VPR region will be dynamically
> > allocated at boot time) and another case where the VPR is fixed in size
> > and initialized by early firmware.
> >=20
> > The firmware running on the device is responsible for updating the node
> > with the real physical address for the fixed VPR case and remove the
> > properties needed only for resizable VPR. Similarly, if the VPR is
> > resizable, the firmware should remove the "reg" property since it is no
> > longer needed.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 34 ++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra234.dtsi
> > index 850c473235e3..62a5dfde9e38 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > @@ -29,6 +29,40 @@ aliases {
> >  		i2c8 =3D &dp_aux_ch3_i2c;
> >  	};
> > =20
> > +	reserved-memory {
> > +		#address-cells =3D <2>;
> > +		#size-cells =3D <2>;
> > +		ranges;
> > +
> > +		vpr: video-protection-region@0 {
> > +			compatible =3D "nvidia,tegra-video-protection-region";
>=20
> The heap name doesn't follow the documented convention, see
> https://docs.kernel.org/userspace-api/dma-buf-heaps.html#naming-convention

I could change this to protected@0, which would make the name of the
exported heap "protected".

Thierry

--m5e6dmw2rrzidhli
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmmN6PEACgkQ3SOs138+
s6E1XxAAmwl7hhPeCdqx1mcrn7uzeLWV1oZBmlvYPVr+MM8LEkJAxxK4xle8BSau
c4DKNkwInqzqBz1HcZZ8CnubRENXfhhCQNsoJmGAnkt2fzjrkN5kJoUwMjxS8/jF
5c/J+g5k7X+JFnTW1IjI0bVFTlmYd+0rA2Vxfk3KwQI/mmEuReTC4UikaeMSvGS3
a08c0pw5Hd7018tbuPxVNFEfj5xnhJLycb/ZHwwSYGlmP1iZf3lzponRBpx2V5hI
BHbs8EFDYfnHNT6sK4zcXVDhD2+3gX+7J5xP/HUV2XQjWjAyqAcse4BGCt7tixKK
4id8MbZ8315lGMpXEzg0G3Rd2E0p9+qvhIFhd3HbinTPBZtV56c8fhgQNfUF6sfc
0w+FofsSyBVJuO37FYSKHq3iY7sGJ9zCG3txXcQsdmOqQhBFDU1ap3T0FXoq7OVA
jGlq/wkUoyH/2HtZbz7wGer7RqDuaFPosR32jB2SmfNY9P8OBF8IlWaH0SLFS9gE
oH9HoR3ZgA8ND6Jrr0M+kUYhFsX5VYkuwA8/9MW6yngJtEEQh3/lvXoBdEEzPMK4
6rAi57CPu0ulNpkvjbiXOSR9vwZnlnIPnOK1ch0ikb/2JmyLZQZ62djjYggjBF5s
VYE0AphNbLhGg0crZ9y0O+yPxMU0gBQ8vlD1ZYvr2wi2SgKr494=
=aSiq
-----END PGP SIGNATURE-----

--m5e6dmw2rrzidhli--
