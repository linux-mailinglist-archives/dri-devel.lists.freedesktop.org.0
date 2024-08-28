Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21547962B4F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7389710E574;
	Wed, 28 Aug 2024 15:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MzX2mLfI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F50110E574
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:09:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7B8ECA41623;
 Wed, 28 Aug 2024 15:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B325CC4CEC1;
 Wed, 28 Aug 2024 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724857755;
 bh=2dSGJx9DwCGU9inaMNC9w/ZuZvcpZXpFhNbyIbDXFXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MzX2mLfIg6MsGjolLr+V4iGnkKTQUdjm/EaJhLDbZvuJ66i2qkoGxZkO0ahAeXSdZ
 w0oCrFV6JtXAsleAblrSSNSVD9dFHJ0vrg3QkfqAS1/8U20Rzb14APD9K3tmZDJ6GK
 CR4Dl1yuEAannx47U0uCzgYJILYF9LdXJXWNUfl7nNIE49/dESf9Abd7xAUmTxni17
 nc95Xa/TzQiWQ+tq/H0ZbZrk7Htb3mVLOLBSQS2h3kJfVSREuRRDhSrxAxG8RtEwvG
 8Yo853oQ5RDwkuAxKSPdqth8jdfeROhvvFlts3CkhJ2C/SW9eezgX8my3EQlKOcR+8
 iHTOc/MxGSYRg==
Date: Wed, 28 Aug 2024 17:09:08 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Yafang Shao <laoar.shao@gmail.com>, akpm@linux-foundation.org, 
 torvalds@linux-foundation.org, justinstitt@google.com, ebiederm@xmission.com, 
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com, 
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, 
 Matus Jokay <matus.jokay@stuba.sk>, "Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [PATCH v8 1/8] Get rid of __get_task_comm()
Message-ID: <ynrircglkinhherehtjz7woq55te55y4ol4rtxhfh75pvle3d5@uxp5esxt4slq>
References: <20240828030321.20688-1-laoar.shao@gmail.com>
 <20240828030321.20688-2-laoar.shao@gmail.com>
 <lql4y2nvs3ewadszhmv4m6fnqja4ff4ymuurpidlwvgf4twvru@esnh37a2jxbd>
 <n2fxqs3tekvljezaqpfnwhsmjymch4vb47y744zwmy7urf3flv@zvjtepkem4l7>
 <CALOAHbBAYHjDnKBVw63B8JBFc6U-2RNUX9L=ryA2Gbz7nnJfsQ@mail.gmail.com>
 <7839453E-CA06-430A-A198-92EB906F94D9@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="utmrbzzw4vz6dwo3"
Content-Disposition: inline
In-Reply-To: <7839453E-CA06-430A-A198-92EB906F94D9@kernel.org>
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


--utmrbzzw4vz6dwo3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Yafang Shao <laoar.shao@gmail.com>, akpm@linux-foundation.org, 
	torvalds@linux-foundation.org, justinstitt@google.com, ebiederm@xmission.com, 
	alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com, 
	penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org, linux-security-module@vger.kernel.org, 
	selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>, 
	Matus Jokay <matus.jokay@stuba.sk>, "Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [PATCH v8 1/8] Get rid of __get_task_comm()
References: <20240828030321.20688-1-laoar.shao@gmail.com>
 <20240828030321.20688-2-laoar.shao@gmail.com>
 <lql4y2nvs3ewadszhmv4m6fnqja4ff4ymuurpidlwvgf4twvru@esnh37a2jxbd>
 <n2fxqs3tekvljezaqpfnwhsmjymch4vb47y744zwmy7urf3flv@zvjtepkem4l7>
 <CALOAHbBAYHjDnKBVw63B8JBFc6U-2RNUX9L=ryA2Gbz7nnJfsQ@mail.gmail.com>
 <7839453E-CA06-430A-A198-92EB906F94D9@kernel.org>
MIME-Version: 1.0
In-Reply-To: <7839453E-CA06-430A-A198-92EB906F94D9@kernel.org>

Hi Kees,

On Wed, Aug 28, 2024 at 06:48:39AM GMT, Kees Cook wrote:

[...]

> >Thank you for your suggestion. How does the following commit log look
> >to you? Does it meet your expectations?
> >
> >    string: Use ARRAY_SIZE() in strscpy()
> >
> >    We can use ARRAY_SIZE() instead to clarify that they are regular cha=
racters.
> >
> >    Co-developed-by: Alejandro Colomar <alx@kernel.org>
> >    Signed-off-by: Alejandro Colomar <alx@kernel.org>
> >    Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> >
> >diff --git a/arch/um/include/shared/user.h b/arch/um/include/shared/user=
=2Eh
> >index bbab79c0c074..07216996e3a9 100644
> >--- a/arch/um/include/shared/user.h
> >+++ b/arch/um/include/shared/user.h
> >@@ -14,7 +14,7 @@
> >  * copying too much infrastructure for my taste, so userspace files
> >  * get less checking than kernel files.
> >  */
> >-#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
> >+#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]) + __must_be_array(x))
> >
> > /* This is to get size_t and NULL */
> > #ifndef __UM_HOST__
> >@@ -60,7 +60,7 @@ static inline void print_hex_dump(const char *level,
> >const char *prefix_str,
> > extern int in_aton(char *str);
> > extern size_t strlcat(char *, const char *, size_t);
> > extern size_t sized_strscpy(char *, const char *, size_t);
> >-#define strscpy(dst, src)      sized_strscpy(dst, src, sizeof(dst))
> >+#define strscpy(dst, src)      sized_strscpy(dst, src, ARRAY_SIZE(dst))
>=20
> Uh, but why? strscpy() copies bytes, not array elements. Using sizeof() i=
s already correct and using ARRAY_SIZE() could lead to unexpectedly small c=
ounts (in admittedly odd situations).
>=20
> What is the problem you're trying to solve here?

I suggested that here:
<https://lore.kernel.org/all/2jxak5v6dfxlpbxhpm3ey7oup4g2lnr3ueurfbosf5wdo6=
5dk4@srb3hsk72zwq/>

There, you'll find the rationale (and also for avoiding the _pad calls
where not necessary --I ignore if it's necessary here--).

Have a lovely day!
Alex

>=20
> -Kees
>=20
> --=20
> Kees Cook

--=20
<https://www.alejandro-colomar.es/>

--utmrbzzw4vz6dwo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmbPPZQACgkQnowa+77/
2zLbhBAAlmo97hSALOMFZhNvjtiifi8OS3Fmi4WyEj8YDnX4pfh+3drVAhe2b44u
nrvjsBMEM1AHDiXa+gp3sUheR3N1kFuX1oyxlPsb9crUH3IfubT4kG0tQ6qLqE8M
Tv0OfPWGdqeGMgvvTEiQVb4xcs/OMT5T4hVdwAtws8Lw0f1ofW5uE5Vlhu5GUXUB
Mbz0DBwkRwBtEmnOCDeZE8zBL8ifIc7k5lQ7Kp1hr4gg/89oLXSABSSxtkyx2U20
8Q1u2OXUiGq4J1BPkNs/5REFb+DJ5bpor7fMecfxoIKms1HXU4w3BjLO6x0ijCTc
cKtZD6eMdpBVNhzXDsJpwMEePaKmJ8k9M4XEVFzBGvdKZ7nAx2meA0rmRssG8tVN
PkNk/kswZIw0qi+m7Lo5uoWOoyKt/s3/UxyUehrIs2k836Zxc9gNdXzX3V9l/R7l
KStxOPruRK2CjPtIE+OBeCpkVxVpFnNhyOVRADi9sWf4ztjwoo8acuXuDNjBDRoP
ggNzOacqXIv8N0Ly6pn+01O6jUg5VNLndq9hOMveyamHwRAZVTDiJMh2xmJqBW41
jIckyXwpnHly1Ag/DEWDiLlgjL0KTcqLGn3Y3oG4jd6PKxqUpxZHGw5UvLPq4QOk
Oy6ZjqF9XGRi8kCgo0hGVLIKxJX7RfAZydaWmAjQVouEODj3TvU=
=wcL8
-----END PGP SIGNATURE-----

--utmrbzzw4vz6dwo3--
