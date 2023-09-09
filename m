Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E93779977D
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 13:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1208E10E139;
	Sat,  9 Sep 2023 11:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DE110E139;
 Sat,  9 Sep 2023 11:00:55 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-51b4ef5378bso2413838a12.1; 
 Sat, 09 Sep 2023 04:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694257254; x=1694862054; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0MKE8EZz8+wkisaN/pk04lbVR7Q5FuzqtTxgn480aHE=;
 b=CH4262mUBnA9BloXajAZyvaXiDx9Z3NJ0lvC4fxZoWXOKX/s9EHwGZjxZSh2Jlcpwv
 gDmdTpo5WfbI14ybl0nSvSf9tqHeCKqunHdu7f7qSCieLUzBD6zS0FHs1oBajsz9p/V8
 1pzwF+z8Qhse5eG1wjwuHXx1Dnc/V9bJjWz11FxWwdZ/NxUfPcVBVBhX0PYPc9AhYRDf
 uME2j2l6JMQuELuexOnMYsijdGsF8qcBIXayhfq3HlSqdEIbcogG+tkw1hnJT5iT6/mU
 Oq5jwZg4+MVj5SeyZb5rPDv3VbfyHFsp9lfxI3dHx5MIcaDU2eozSSY5mqnxPq0weR/k
 /rkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694257254; x=1694862054;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0MKE8EZz8+wkisaN/pk04lbVR7Q5FuzqtTxgn480aHE=;
 b=uIByEB4CuhtN6vUBQgC5CPvmsymfV1OmVxEpOAfESy7dThoxTGm4clMtKBy1/GgEpn
 8rdSNDWqbMj9jJhhIgb0niNXEqUQlWCJVAMETgLi8nwJ/t4ffGlyJh+JDDSeX7IRLuHc
 N8J0P7JvDqhlqhwWqIS2Zyaka209CEfzUJ2I3bg97bh/wzFxxEZZw6TEj5hJLLrgJf39
 CGjZ6HLM7WpiAESOdRIIsO62J33+S6Dr9M2Tf4slw3Fwh2Vf38CVSXkYmEVWpOJFCtjt
 9KNoVJ48Vetj+5qxcW4pjD46TsWdomre32pGqfC4TtiECdrK0/Fu8NeMAAwW+AbYVhRI
 PpHQ==
X-Gm-Message-State: AOJu0YwzuULh7qiuplcCHQITnpl38dg1j7rVwVe1bXijqMizcinYkeM/
 iRY9z6dg2s4TMMnjpAUUi+E=
X-Google-Smtp-Source: AGHT+IHjR9ImlRNAJDU14CsSwYU+UYCaHpx9AY/5PxIX5+9RLyupEWZUwucf1ozgfoBZISKR1BTvIg==
X-Received: by 2002:a17:902:ea0a:b0:1bf:4a1f:2b57 with SMTP id
 s10-20020a170902ea0a00b001bf4a1f2b57mr6365856plg.13.1694257254474; 
 Sat, 09 Sep 2023 04:00:54 -0700 (PDT)
Received: from debian.me ([103.124.138.83]) by smtp.gmail.com with ESMTPSA id
 17-20020a170902c11100b001b8a1a25e6asm3028909pli.128.2023.09.09.04.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 04:00:53 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 39C208A6E187; Sat,  9 Sep 2023 18:00:49 +0700 (WIB)
Date: Sat, 9 Sep 2023 18:00:49 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: bugzilla-daemon@kernel.org, dri-devel@lists.freedesktop.org,
 Michael Mair-Keimberger <mmk+bugs@levelnine.at>
Subject: Re: [Bug 217892] New: [amdgpu]: system freezes when trying to turn
 back on monitor
Message-ID: <ZPxQYWLJQl7x2qAc@debian.me>
References: <bug-217892-2300@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pfTqKnr0Pj4UuA1x"
Content-Disposition: inline
In-Reply-To: <bug-217892-2300@https.bugzilla.kernel.org/>
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
Cc: Linux Regressions <regressions@lists.linux.dev>,
 Xinhui <Xinhui.Pan@amd.com>, Pan@debian.me,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pfTqKnr0Pj4UuA1x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 09, 2023 at 10:19:36AM +0000, bugzilla-daemon@kernel.org wrote:
> Hi,
>=20
> My setup is a dual monitor 4K/144Hz with running sway on it. Both monitor=
s are
> connected via DP to a Advanced Micro Devices, Inc. [AMD/ATI] Navi 31 [Rad=
eon RX
> 7900 XT/7900 XTX]. Usually if i don't change monitor settings everything =
works
> as expected. The monitors do also wake up flawlessly after system idling.=
=20
>=20
> However, sometimes i turn off the second monitor (for example for playing
> games). For that i made a shortcut in sway which looks like this.=20
> > bindsym $mod+Shift+F12 output DP-2 toggle
>=20
> Now, turning the monitor of works as expected. However, turning it back o=
n i
> encounter following erros/problems:
> Main Workspace (Desktop) freezes, second monitor tries to get turned on. =
(The
> monitor led goes up)
> After some time (couple of seconds, around 10-15sec) the main desktop wor=
ks
> again, the second screen goes off again.
> At that point i usually have to reboot the system to get the second monit=
or
> back.
>=20
> In dmesg is see following entries:
> [ 8623.325357] [drm] enabling link 1 failed: 15
> [ 8623.382238] [drm] REG_WAIT timeout 10us * 5000 tries -
> enc32_stream_encoder_dp_unblank line:348
> [ 8623.437493] [drm] REG_WAIT timeout 10us * 5000 tries -
> enc32_stream_encoder_dp_unblank line:357
> [ 8638.435963] [drm:amdgpu_dm_atomic_check] *ERROR* [CRTC:81:crtc-3] hw_d=
one or
> flip_done timed out
>=20
> This is also something which can be reproduces quite easily. However some=
times
> it works almost without problems. (in that case, the monitor comes back b=
ut the
> desktop on the main monitor looks distorted/corruped - maximizing a appli=
cation
> fixes that)
>=20
> This also seems to be a regression. With kernel 6.2 and 6.3 this worked as
> expected.
>=20
> I'm using following kernel:
> Linux x2 6.5.2-gentoo #1 SMP PREEMPT_DYNAMIC Sat Sep  9 00:29:42 CEST 2023
> x86_64 AMD Ryzen 9 7950X3D 16-Core Processor AuthenticAMD GNU/Linux
>=20
> As soon as there is a linux-6.6 kernel available in gentoo i'll try that =
one
> too.

You may try compiling your own kernel instead of having to wait for the ker=
nel
package to be updated. See
Documentation/admin-guide/quickly-build-trimmed-linux.rst for full
instructions.

In any case, please also report to freedesktop tracker [1].

Thanks.

[1]: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
An old man doll... just what I always wanted! - Clara

--pfTqKnr0Pj4UuA1x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZPxQXQAKCRD2uYlJVVFO
o7KZAQDWMADIGvvTcahTyNGWKOyAYdfWQGERAaGcM4K0W5ionQD+KHDoQB1jBzbF
QbCHiwM1qujrWM3QbnITdlz1lWH8kAs=
=wMBf
-----END PGP SIGNATURE-----

--pfTqKnr0Pj4UuA1x--
