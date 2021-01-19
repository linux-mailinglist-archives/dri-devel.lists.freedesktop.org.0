Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B683E2FB422
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0D989836;
	Tue, 19 Jan 2021 08:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A378984F;
 Tue, 19 Jan 2021 08:35:24 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id f11so20958754ljm.8;
 Tue, 19 Jan 2021 00:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=xh8WuxUDU5grDfa/XdPbIcMCyLHqz+o1HuYkqoK66i0=;
 b=QoA+QbZp+sikSqOP76GAaFooZT53Ow63Nuhm3fqo0nOHeDHMG0VuLm59HULi+o5m1g
 CfT5b74PowV2nGk2stasDcz5LMqr45U8EuqqklCGLyxV+0Yv6yOqU6X0nfZ4e2oobEME
 t8mBhmxKoA9mqJUzKZWcgBIMFtfuOt9Ah+mdpLsmTK3sRJEG7l14IQDcASlaFMD8wS51
 aaYxFNlfUCEV8gpolw5gCVyCMZAevCQwcFEopibsiRPP8rvSu76cbvKAFXDu6Jw5qwEc
 1yqP49Iwz+3SiOEwdg7kx3xEzqtPyV46+0/Cj2YcoGwd+9pVFN2eTr87l7eFOEmun5xz
 KG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=xh8WuxUDU5grDfa/XdPbIcMCyLHqz+o1HuYkqoK66i0=;
 b=IouMBp+4tsR6nDrVto/1f8U2PFxl7NOA9dxCeGL9TPVryjaw3SQAsAd57GreIYBP2C
 L8dC2zGjDHjFT718sJkKdMJXwAv7Ga0a+tG9A0Khop6911vmuoYbt2mLmu1zn9sEvEbQ
 7/4b7VHNBkKkzr80QHLFAP8+naWC5C+z9UShdoLNlRLow1x8nurIQK+WHShMMGCBuiR4
 ngQlfjSMccfzlNCzacTo8jnUFrHxt48OnQ9NIN0sNY6vrMaZx8axkIYTIS2CXKpgyLDS
 rq85z/z+dArgUtoRHIbcLm9JU6+bJkpw1uxo8MJgeMztTIL2Lea9h0cfv+6Ft85Vokrv
 VqjQ==
X-Gm-Message-State: AOAM5325p5B7xZBPIMuxu6owOwNp1IBQFd3M5nNHK44LZLM+tiO9oEUA
 hQG7uP9/ZZzDmWsIwVdkWRw=
X-Google-Smtp-Source: ABdhPJx2nA/9u2nKPbGOSTmFIAND/YZk3KCEMUW30idO5hV6VuxpPD1ZSkFnPIsqXTqqQhuexYBfgQ==
X-Received: by 2002:a2e:8512:: with SMTP id j18mr1510691lji.31.1611045323077; 
 Tue, 19 Jan 2021 00:35:23 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id c16sm2211125lft.264.2021.01.19.00.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 00:35:22 -0800 (PST)
Date: Tue, 19 Jan 2021 10:35:10 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: Re: [PATCH v3 1/3] drm/amd/display: Add module parameter for
 freesync video mode
Message-ID: <20210119103510.01f55ee4@eldfell>
In-Reply-To: <b38e46b7707ba9a899384baedc7efe4e70c439bf.camel@amd.com>
References: <20210104210800.789944-1-aurabindo.pillai@amd.com>
 <20210104210800.789944-2-aurabindo.pillai@amd.com>
 <20210114111445.1d2bbf62@eldfell>
 <b38e46b7707ba9a899384baedc7efe4e70c439bf.camel@amd.com>
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
Cc: stylon.wang@amd.com, shashank.sharma@amd.com, thong.thai@amd.com,
 dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, wayne.lin@amd.com, alexander.deucher@amd.com,
 nicholas.kazlauskas@amd.com
Content-Type: multipart/mixed; boundary="===============0574721127=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0574721127==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fAfjNpz1Akj+iHvP1bdqmi5"; protocol="application/pgp-signature"

--Sig_/fAfjNpz1Akj+iHvP1bdqmi5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 18 Jan 2021 09:36:47 -0500
Aurabindo Pillai <aurabindo.pillai@amd.com> wrote:

> On Thu, 2021-01-14 at 11:14 +0200, Pekka Paalanen wrote:
> >=20
> > Hi,
> >=20
> > please document somewhere that ends up in git history (commit
> > message,
> > code comments, description of the parameter would be the best but
> > maybe
> > there isn't enough space?) what Christian K=C3=B6nig explained in
> >=20
> > =20
> > https://lists.freedesktop.org/archives/dri-devel/2020-December/291254.h=
tml
> >=20
> > that this is a stop-gap feature intended to be removed as soon as
> > possible (when a better solution comes up, which could be years).
> >=20
> > So far I have not seen a single mention of this intention in your
> > patch
> > submissions, and I think it is very important to make known. =20
>=20
> Hi,
>=20
> Thanks for the headsup, I shall add the relevant info in the next
> verison.
>=20
> >=20
> > I also did not see an explanation of why this instead of
> > manufacturing
> > these video modes in userspace (an idea mentioned by Christian in the
> > referenced email). I think that too should be part of a commit
> > message. =20
>=20
> This is an opt-in feature, which shall be superseded by a better
> solution. We also add a set of common modes for scaling similarly.
> Userspace can still add whatever mode they want. So I dont see a reason
> why this cant be in the kernel.

Hi,

sorry, I think that kind of thinking is backwards. There needs to be a
reason to put something in the kernel, and if there is no reason, then
it remains in userspace. So what's the reason to put this in the kernel?

One example reason why this should not be in the kernel is that the set
of video modes to manufacture is a kind of policy, which modes to add
and which not. Userspace knows what modes it needs, and establishing
the modes in the kernel instead is second-guessing what the userspace
would want. So if userspace needs to manufacture modes in userspace
anyway as some modes might be missed by the kernel, then why bother in
the kernel to begin with? Why should the kernel play catch-up with what
modes userspace wants when we already have everything userspace needs
to make its own modes, even to add them to the kernel mode list?

Does manufacturing these extra video modes to achieve fast timing
changes require AMD hardware-specific knowledge, as opposed to the
general VRR approach of simply adjusting the front porch?

Something like this should also be documented in a commit message. Or
if you insist that "no reason to not put this in the kernel" is reason
enough, then write that down, because it does not seem obvious to me or
others that this feature needs to be in the kernel.


Thanks,
pq

--Sig_/fAfjNpz1Akj+iHvP1bdqmi5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmAGmb4ACgkQI1/ltBGq
qqeshQ//W0890n+Hwi29RgSXln6rBJKoJhk5yWxXaS30OpE7indW26U+A/c1bNJf
Mnh85h6Zrg6J66bdHgESUi/cA+303/r56myUjEa89mAvHxcDszyZS3a8fQs9x+Yv
5QCnML3PdTS6sbyg4JdqpXXSGIkM7OgYgEIaHf7bw7nKngSxUjhf+Ms+Kdf+AOGp
tU6+lrNZzLkEEbjAW+eEf+cnLMkCOaPrTGtXw/2b4fe2MUhXqLL7LarVUMMuLQRZ
HjJKqNUZ3ATM4oczTGf3k1u3pXwk3lN7Idgc6T0A1nzJJJluJRkMpV8c6kSJCtS2
CFpwaVr+GH9GFHBwzLuQY8hBdzRSqzIGAbc8tHFQwPcGe5a61SB4KbAuA62FliY/
VVYLf44njwzeALhRnlORdWvobjD3BT9oMGBtqvev7+EjjLTzsFQ3WlavUMlmU3Di
kbFcAbM2hRFAWRzcFI50mRXRs3wy0TuGzah9P+zzg43hdclmyTp/1lRfEQZ6kWJX
BzzgRUVYNLBOHGma5pY63q/VDpnNg2wdDYU1PgZZRK5P9F0j7zfq4/KsGNuaAiaQ
37YUXuNnj/p7kDjHx27dwKmlogmGLM2D3wx22S7IAkEZWIESKPKKa2kSjQvVzfCH
AlhuHOvyoFwBj4BzbfPc2nkSNbJdyZ2qztKnUC8OCEZBb8y6LyE=
=vt/2
-----END PGP SIGNATURE-----

--Sig_/fAfjNpz1Akj+iHvP1bdqmi5--

--===============0574721127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0574721127==--
