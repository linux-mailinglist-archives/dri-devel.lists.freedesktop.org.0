Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E14636AD7F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 09:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BDF6E0FC;
	Mon, 26 Apr 2021 07:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27B46E0FC
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 07:37:07 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 12so86545870lfq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 00:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=obuBE1Nj5gcikOw1FBXmgvsh45uDNDUzOX/vUTXvcvw=;
 b=pcWFHC6W7PezjJIaNABnxr5Ot/ohPdk5c+YvymEycDybtDT1HD4LxXdn8KsRI9D/Gk
 qfP4WSpsiiAKBY247YGqp7Kmmvfn00ZY8spdDFQSiqM63k1q5A4cqn22haILQqkkBaAr
 S7hcnN8w7tP4NR3MxFWYngn6FDFP0ZRYf4iac4YD76xQ0N/0X1wUh6qUOULMZsW5PsXJ
 9Ou0ADeS7t564qS8pHjuCNXF5X/gDTuMCATUQbJ8BXV782ijpBrFJNSjYR25BDvy1oIs
 Lfr7HLLDBJHbtgg/OV+idEf5IwFD4UZs/pcxAyJ0j6bTW/8EAc3f3KQ0kLSmh5jKa8Wl
 1i9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=obuBE1Nj5gcikOw1FBXmgvsh45uDNDUzOX/vUTXvcvw=;
 b=TgtO0WZLGRFnUL419mborZxAj/rirsexEnZb/zUpehO7sMdVvCo1SHy3EuBrtSoKSb
 xSjS6/06+CSjizNAHwfYUNIQBxDNzgPsoxVwmtLeTLbzacGDycJGcEGXw/rQB6f3Wfja
 3eZqzIST6RYeUEYKwDuQtXFUMHk9GTITScwK5spS0iB2ERWKKeMR4egmIw8xd1qOL1GX
 nSmMF4rQlYcYqYZ5GUtrSwzrZdx4+YDayNmh4x1wcSm53mJIg/8Pi3KmxqndX7oCDwx0
 4rUx/VsTlqqHogO21lfQ/XKIYSNCrjetaln3R3pCLXmuFIPthSG4WfGPoFWcAn3iXJhx
 lKXA==
X-Gm-Message-State: AOAM5339bcOPe57/QMOa3R1V0VtwedLsqflEF3Q360Xb5v5+S2anZaNO
 EL1hHRzaKZgsyao/ksPmGyw=
X-Google-Smtp-Source: ABdhPJx1/aEcICa8qOJuT33yRnQF0GKQgmrJEwMWJVhq0l71+eoWgf+5GSnTu8BxRmMOQp6KB6CFfA==
X-Received: by 2002:a19:6a0c:: with SMTP id u12mr12112063lfu.391.1619422626178; 
 Mon, 26 Apr 2021 00:37:06 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id z145sm1320092lfc.169.2021.04.26.00.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 00:37:05 -0700 (PDT)
Date: Mon, 26 Apr 2021 10:36:56 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH v2 1/1] drm/doc: document drm_mode_get_plane
Message-ID: <20210426103656.0a212089@eldfell>
In-Reply-To: <3c3a5d35-10bf-4b32-1970-aed4bc1d6488@collabora.com>
References: <20210422181004.34247-1-leandro.ribeiro@collabora.com>
 <20210422181004.34247-2-leandro.ribeiro@collabora.com>
 <20210423141126.308d4145@eldfell>
 <3c3a5d35-10bf-4b32-1970-aed4bc1d6488@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1416688411=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1416688411==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TdWp0rzrssZgQMA0+c41Uxc"; protocol="application/pgp-signature"

--Sig_/TdWp0rzrssZgQMA0+c41Uxc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Apr 2021 18:30:33 -0300
Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:

> On 4/23/21 8:11 AM, Pekka Paalanen wrote:
> > On Thu, 22 Apr 2021 15:10:04 -0300
> > Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:
> >  =20
> >> Add a small description and document struct fields of
> >> drm_mode_get_plane.
> >>
> >> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> >> ---
> >>  include/uapi/drm/drm_mode.h | 16 ++++++++++++++++
> >>  1 file changed, 16 insertions(+)
> >>
> >> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> >> index a5e76aa06ad5..3e85de928db9 100644
> >> --- a/include/uapi/drm/drm_mode.h
> >> +++ b/include/uapi/drm/drm_mode.h
> >> @@ -312,16 +312,32 @@ struct drm_mode_set_plane {
> >>  	__u32 src_w;
> >>  };
> >>
> >> +/**
> >> + * struct drm_mode_get_plane - Get plane metadata.
> >> + *
> >> + * Userspace can perform a GETPLANE ioctl to retrieve information abo=
ut a
> >> + * plane.
> >> + */
> >>  struct drm_mode_get_plane {
> >> +	/** @plane_id: Object ID of the plane. */
> >>  	__u32 plane_id;
> >>
> >> +	/** @crtc_id: Object ID of the current CRTC. */
> >>  	__u32 crtc_id;
> >> +	/** @fb_id: Object ID of the current fb. */
> >>  	__u32 fb_id;
> >>
> >> +	/** @possible_crtcs: Bitmask of CRTC's compatible with the plane. */=
 =20
> >=20
> > This should probably explain what the bits in the mask correspond to.
> > As in, which CRTC does bit 0 refer to, and so on.
> >  =20
>=20
> What about:
>=20
> "possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC's are
> created and they receive an index, which corresponds to their position
> in the bitmask. CRTC with index 0 will be in bit 0, and so on."

This would still need to explain where can I find this index.

> >>  	__u32 possible_crtcs;
> >> +	/** @gamma_size: Size of the legacy gamma table. */ =20
> >=20
> > What are the units? Entries? Bytes?
> >  =20
>=20
> The number of entries. I'll update to "gamma_size: Number of entries of
> the legacy gamma lookup table" in the next version.

Sounds good!


Thanks,
pq

> >>  	__u32 gamma_size;
> >>
> >> +	/** @count_format_types: Number of formats. */
> >>  	__u32 count_format_types;
> >> +	/**
> >> +	 * @format_type_ptr: Pointer to ``__u32`` array of formats that are
> >> +	 * supported by the plane. These formats do not require modifiers. =
=20
> >=20
> > I wonder if the "do not require modifiers" is again going too far in
> > making a difference between this list and IN_FORMATS?
> >  =20
>=20
> Yes that's true, I'll drop this phrase.
>=20
> >> +	 */
> >>  	__u64 format_type_ptr;
> >>  }; =20
> >=20
> > Other than those, looks like a significant improvement to me.
> >=20
> >=20
> > Thanks,
> > pq
> >  =20
> >>
> >> --
> >> 2.31.1
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel =20
> >  =20


--Sig_/TdWp0rzrssZgQMA0+c41Uxc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCGbZgACgkQI1/ltBGq
qqe5Gg//XOOtVR2qLd7usF8O88eTDKtJ5NvFl48AOjEe2CfK+pXZ75Irg88smV7E
aHRT4Met3Uwvz/46zpCd5m7kuHvpHeUnpVylEYu+sXBTXabFlav8/91xsJzN+KJ7
qOGCpHb6HmWZhiJCJckJrdGWDvc7IWdqinvawKaXKQpsd8Ynd7Q2NFulavRTbarR
j49XuQezMyZCb6wMWENchdnm7O3nNrc6MYjKYqHQXRPvoZ5CYRADKwJrbfuCqwy7
cKy7mDkICmMEUnkaqKTlcjZWabLoPhEJhEQJe+Z8fDhfCV7juDmefsWo0SjGNNHT
VudtT4reUuMC9TxHiwi8ma1LUmkJHEYJqJ/LJVvB9YHF7WB9YXudYlWbchSJ8Qgx
JVc6Tm4ZpXwIHKBUp26bPn7TwsxYn76EM4HfQwV74DVO6DB+n0GJsezyZ1WUAqu2
b0ij1QAB03uht0IfZn6pEMpXLfKwFI1Tg/ogKTUvUPR9pgiFYF8UK/dyw0zsv8vN
M0x14X8yoCImIfeK4cs2utJ9tpKtfg+0otJ2OkNPmhDG26ax2H4YZPZKoZJuiIde
7HvLA51lzy4DBaGyOEap1p9+rXEENY/gGqoEPYEqK9Z4qZ56NtVbaccKve9QViPR
0mfEBe9NJlIdeNovH+VD1ja+KOyZC6a8dt06QVRvRHjZ4sPVJvY=
=4rnR
-----END PGP SIGNATURE-----

--Sig_/TdWp0rzrssZgQMA0+c41Uxc--

--===============1416688411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1416688411==--
