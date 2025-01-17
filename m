Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AFBA14E44
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 12:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A66D10E074;
	Fri, 17 Jan 2025 11:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="d2M/4yoY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F343510E074
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 11:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=74SqzKD39sD1vVacBW2Saz6MqhCJNyGTF0who3qIP1M=; b=d2M/4yoYJw3QLvlU1SFdW1gIdd
 taiOT0WnkeLimNe4gqqosv2MM5u3Ae7gro147lQVw7MvFmzdGIbbnBncZ2n29SuFFh4VJksQEdq89
 tHwJ0N3fW0dhT8iY+45AqG2rRu6ujWyn9JeoB8ulmRrMm0xyFj9D8DXnEe9lv5GsK3cjpU7YgxTLh
 au5qge+hjt23WpZHMeH5X0Q5a4V9Xi5J23ltMwVoUd+7/kuqSG7a8xveO3Q7bw9YnW3cp6Om5K6xM
 nEdRLjU5UgjAdtox2Kkgdah5TnGUTAeSoHjNfRnSJgL6ZJuRxGyBsoeVPm5N7adtwgOBgWx2YR8k5
 LAhsKgSg==;
Received: from [194.136.85.206] (port=50762 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1tYkKN-0007fh-11;
 Fri, 17 Jan 2025 13:15:51 +0200
Date: Fri, 17 Jan 2025 13:15:43 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, David
 Turner <david.turner@raspberrypi.com>
Subject: Re: [PATCH] drm: document DRM_MODE_PAGE_FLIP_EVENT interactions
 with atomic
Message-ID: <20250117131543.38f0f60d@eldfell>
In-Reply-To: <20250116162528.2235991-1-contact@emersion.fr>
References: <20250116162528.2235991-1-contact@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_B9hkviCj68_61rvSt9cXFn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/_B9hkviCj68_61rvSt9cXFn
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Jan 2025 16:25:35 +0000
Simon Ser <contact@emersion.fr> wrote:

> It's not obvious off-hand which CRTCs will get a page-flip event
> when using this flag in an atomic commit, because it's all
> implicitly implied based on the contents of the atomic commit.
> Document requirements for using this flag and
>=20

and?

> Note, because prepare_signaling() runs right after
> drm_atomic_set_property() calls, page-flip events are not delivered
> for CRTCs pulled in later by DRM core (e.g. on modeset by
> drm_atomic_helper_check_modeset()) or the driver (e.g. other CRTCs
> sharing a DP-MST connector).
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: David Turner <david.turner@raspberrypi.com>
> ---
>  include/uapi/drm/drm_mode.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index c082810c08a8..a122bea25593 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -962,6 +962,14 @@ struct hdr_output_metadata {
>   * Request that the kernel sends back a vblank event (see
>   * struct drm_event_vblank) with the &DRM_EVENT_FLIP_COMPLETE type when =
the
>   * page-flip is done.
> + *
> + * When used with atomic uAPI, one event will be delivered per CRTC incl=
uded in
> + * the atomic commit. A CRTC is included in an atomic commit if one of i=
ts
> + * properties is set, or if a property is set on a connector or plane li=
nked
> + * via the CRTC_ID property to the CRTC. At least one CRTC must be inclu=
ded,
> + * and all pulled in CRTCs must be either previously or newly powered on=
 (in
> + * other words, a powered off CRTC which stays off cannot be included in=
 the
> + * atomic commit).

Sounds right. I imagine this doc needs to be extended when drm_colorop
lands, as yet another way to pull in a CRTC.

Wasn't this also conditional on the DRM_CAP_CRTC_IN_VBLANK_EVENT or did
userspace really need to count the events even without it?

Nevertheless, should there be a "see also DRM_CAP_CRTC_IN_VBLANK_EVENT"?

>   */
>  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
>  /**

Thanks,
pq

--Sig_/_B9hkviCj68_61rvSt9cXFn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmeKO98ACgkQI1/ltBGq
qqedvxAArvca93uLjOSlkiqWM7Zd6qgSrc1PwhavduzxDeUMj5XMC98o+ex/mrM8
VKbikxHPLX2yiGTx0lpPxTt7v3DkwxyAOroTvnnwk4eZtwFav6ouHxutJ6d3WnRH
ZWRn6gVV0pV5PsYEbmuGnWt2S1yYLzkhERsmW732aeXa5Mt95+Vsu++l+HuqvRp+
oEGyi2p47SG2kzFIHp9MHYq96PToK+PrCeBA2DN0aDv9D7rpcyyNYUuihDb1Lzdo
ledIi/J8FIvwk6f5ucnveyQN2KPcdYujsT2IwMfoW9Hrbwtu+mUPoNjeKx05uO1g
AK9Lci31bjP0rDtlHgYtT6U/dflZC52vzDNJrbPxULU/u19kR5GoQjysswYG6wP5
dqHtugzRBXc+TvaeVi3toKT1tirOeLjrSDr4PAdvpit0AOud/sUl5YENC44rYc3x
xg5oI57L0X1si8OKIMsDQzFSsL1s9o3dV437Vb9t+Vc6p+yV8/VaMzXaRdIwRD7Y
8t2tLIr+orU5GHrHLXVc1qB+Ge6dKKBEPaDQ/r/uiPwuPx3VRn47qrOaXWmFWoz3
w55RbWtq5xSIj/xH0KPWJJlVYiZErjP2RMBlrpC+aJVHM1WYUWiSds4rIMXHdHDB
Z8xMdK4crqReWyIKV1VxuRMCIQ1s+Gy3LIUlOZz2XJE4HEMb6MY=
=k+a1
-----END PGP SIGNATURE-----

--Sig_/_B9hkviCj68_61rvSt9cXFn--
