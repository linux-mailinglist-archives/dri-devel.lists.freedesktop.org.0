Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEFD11445B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 17:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A5D6E996;
	Thu,  5 Dec 2019 16:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A906E996
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 16:05:41 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c14so4268941wrn.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 08:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=H2vjR38Fbd9g9mRKcuu97SL7c7MZ+hp3mZfReKzgUK8=;
 b=Kfi2v38mIZC7m4d9zJDnVhB33k493IB6kuvKkRoRCl2CJZbODQAVPdyhiUv+cAc6Is
 1kTc1Q4zd2zK0yEwSmWAaLYdB+Kbs/LflVVBmIA03RdZJnSpmaF7L7enTc2QqdgD972+
 ScUmLiTuk5VFWiNnP1i3GTj7zw7uaIg7vyz8MVHk8Iqfm9SPore7wUh3ue67bARyrbGR
 0V02b6MZ06MNWJq6qTWy/Rm4dLyAYkgDxHh3Kf8+3eii2MkO6UV3o96is44zhCiDoNj4
 NxBNlq3cQfQvz50dxyLholnTY8I0r6Qe+Z/iBLt9U1jMaLeMRbbzHJqrgQ+c7U0EufGT
 Cfog==
X-Gm-Message-State: APjAAAW7oSb+xqKA7ZTFQ0yU43MOZgaKveWv1ywJtQEA9xem281VUN6/
 cqlgkAhu5HUlWdCfDFUMSjA=
X-Google-Smtp-Source: APXvYqy23rdxPFwiq4Pjj7o9U08z4Ow32D0Sbkl3t6icRtCxqbKZohtKq7T6G7SM0iq1+qc4D9bQhQ==
X-Received: by 2002:a5d:4651:: with SMTP id j17mr11450705wrs.237.1575561939683; 
 Thu, 05 Dec 2019 08:05:39 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id z189sm333491wmc.2.2019.12.05.08.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 08:05:38 -0800 (PST)
Date: Thu, 5 Dec 2019 17:05:37 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/doc: Drop :c:func: markup
Message-ID: <20191205160537.GC1914185@ulmo>
References: <20191204101933.861169-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20191204101933.861169-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=H2vjR38Fbd9g9mRKcuu97SL7c7MZ+hp3mZfReKzgUK8=;
 b=LE7UDvgNgBtGji/1sUAa5llz0THQnWSsj3d1uEYUr24IftfhMEuphfyVNxXFYnL02H
 BghoJ2GwxV5K5y8a3BgMhWnNkL5Dyaptnb/euwmK6G5aB20asrMtnMVqr+VmUmthRqAa
 MifChN8lP85XO+QA55wrsA8X4SJiqyuvdHj9ZF1/mXYIPCdvjVBXZYTP7my3n9HvYioL
 L6QxZ2T04/uFJkZ8DPXnuDGyFjnKEobqjz8ST8/ayKRC/t/+lwu4L29sR7gJFuvwEm7F
 RvUSdaZhouaypVc3uHxlCkWa3KwfK8YA2PRAzosqHAJqQ/jnlo4XvDDhtdLZ0v5eYQNA
 8/Fw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jonathan Corbet <corbet@lwn.net>
Content-Type: multipart/mixed; boundary="===============0189211671=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0189211671==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Izn7cH1Com+I3R9J"
Content-Disposition: inline


--Izn7cH1Com+I3R9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2019 at 11:19:33AM +0100, Daniel Vetter wrote:
> Kernel sphinx has learned how to do that in
>=20
> commit d74b0d31dddeac2b44c715588d53d9a1e5b1158e
> Author: Jonathan Corbet <corbet@lwn.net>
> Date:   Thu Apr 25 07:55:07 2019 -0600
>=20
>     Docs: An initial automarkup extension for sphinx
>=20
> Unfortunately it hasn't learned that yet for structures, so we're
> stuck with the :c:type: noise for now still.
>=20
> Cc:  Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/gpu/drm-internals.rst |  4 +-
>  Documentation/gpu/drm-kms.rst       |  7 ++-
>  Documentation/gpu/drm-mm.rst        | 68 +++++++++++++----------------
>  3 files changed, 36 insertions(+), 43 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--Izn7cH1Com+I3R9J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3pKtAACgkQ3SOs138+
s6EuAw/8Cw0IWboItQu8pCmdq1WZftjSUBV8k7x8e/VnaknWs+qxhy4vWBvgxK5T
g8vus7T9v8eOF3l6cfTh8/k5ivn3NiUHzrHyuOVYInDfImzYsg4Y92CnPRuVb37u
DkvHDgrHEL6dglmQLeX64JhlZXf/S/HzKQPHLViL8CkmdE+RcemKWtT39O2oBtbd
nnCJYXu6TetcDGtDp6TGphLepaaJpURhD4lnpBbGwA8JEhj26AR+Lh8HYaJh5clv
tWF7evK6FwcrcM33wIFaD6lczM/Je3O4NyXhdwOFKQiCC2uXd8itg4PKFYsv8RhT
0l2ZTWlMySPqoMTCbNOP7xycaaiys50iRCm7ECLHn0KM/9AWXypCEzBOCJ2Ul0Km
fYHQx9OxKCltTRTBqJTCmIIoI1sPL4tXfOXPMwtrCLZd8krETPNr5d/K4p31L0UT
3Dag8qWh5UujClcdYOkvoq6llQkVDVLYMU0A7LJDLmOCBGZCygYsWASAfbW2JJHD
bSXl4VQhBxVsDQWdeFTvT8U+s7lQYk9MVnw/mffeZeNYcYBNjM1b4S4VwWZSTTX8
Mwr+6Vm+HDPOjS1VX0jLE1PbVk2c6KnO+Ikjnqblf4aRMT7ZKzhl0D8MyiOZ4SQU
rbdrmlfrdU6ZrqeCoyHODQuYoC7C3BEY0DTxW1C0aWmq4zt2vhk=
=M0iS
-----END PGP SIGNATURE-----

--Izn7cH1Com+I3R9J--

--===============0189211671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0189211671==--
