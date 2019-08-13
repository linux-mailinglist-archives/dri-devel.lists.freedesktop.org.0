Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 202BA8B421
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 11:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FA16E0CB;
	Tue, 13 Aug 2019 09:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF746E0CB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 09:31:30 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m125so839488wmm.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 02:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=y0wqGVjlRClEZvpkYMuXOIusXH1Ev18/JEAAad0p7BA=;
 b=RielPx6pBahUHeBwZmbAiIM+wjsEvV+v6Ge+S1SY/at5Xflo5v3kdW8XNgvS6sdjQ+
 AjUtSPjr7KiRcHruilMvkNtBZ+UJvL2vpL8/YipDB9dQ+B++pm/SLvOa/uKFkKUAkUhH
 BxIRg1Ld/SaM3NyMcSqOkNwN5a2m3M7j+mJ0Th+vGxZ2VT+4a4iE48qJWqX/lqeHyw9k
 nyGleQrRQAZ1BV41KfGSF7WTaoGCwt70JL6ZVETCN6jGr8LrCZquSbaICnMzswBfmE9G
 f6yXFs6adNUBizyRBjpP9BGdebx+rRwdAl8SnWupN5b+HurQ1nhk4+3tssL8I0SrU+Tx
 CoYQ==
X-Gm-Message-State: APjAAAVKcromXqELumOk68BV1Pgh1m7FnNk5PuoTQLhq4peTfXguO2bd
 TEP72Kv8koQ0kHj74DvY140=
X-Google-Smtp-Source: APXvYqwydMMGvSDCgat4DctRgQxgV+2KcgUKo0WXmxB8YaCIrGqrIK5DxHbPvNaV4SukRNRU0NuatA==
X-Received: by 2002:a1c:24c3:: with SMTP id k186mr2072710wmk.126.1565688689223; 
 Tue, 13 Aug 2019 02:31:29 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id e4sm33358582wrh.39.2019.08.13.02.31.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 02:31:28 -0700 (PDT)
Date: Tue, 13 Aug 2019 11:31:27 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 3/4] drm/armada: drop use of drmP.h
Message-ID: <20190813093127.GC1137@ulmo>
References: <20190804094132.29463-1-sam@ravnborg.org>
 <20190804094132.29463-4-sam@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20190804094132.29463-4-sam@ravnborg.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=y0wqGVjlRClEZvpkYMuXOIusXH1Ev18/JEAAad0p7BA=;
 b=ZhonYoO5rACZHhGatth7GxfempAqu3fhxvQBB0p/Lmap00d7dYioBePAGYXFWIxKNh
 9vLTpiGZtZEcZi4s1x7O2Ax8p63WJaA5CqbAXFOHjav+v8jKcn+0O387B1cfQmaHH+gB
 X2WpCSXRggr/qAYRNZpRHh22DcoouEo1SpMroHGwmovINUZvx7onyYfTDF5SE4LHI6aa
 3Ml0MgDN/CtH2cHJ3J1LAqyBBNoaGigLEdIsPScYdRPFFToqKVisWJiEJHCFGPTZ7xtW
 s9krFdyx8ek4/J5tJYLOeB2Gga74QuUcozsFixugz2fTVPsHHDSghVVSC4cRFpmOeRay
 Icog==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, malidp@foss.arm.com,
 linux-tegra@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0491761372=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0491761372==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eRtJSFbw+EEWtPj3"
Content-Disposition: inline


--eRtJSFbw+EEWtPj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 04, 2019 at 11:41:31AM +0200, Sam Ravnborg wrote:
> Drop use of the deprecated drmP.h header file.
> While touching the list of include files group them and sort them.
> Fix fallout from the header file removal.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/armada/armada_crtc.c    | 10 +++++++---
>  drivers/gpu/drm/armada/armada_debugfs.c |  8 ++++++--
>  drivers/gpu/drm/armada/armada_drm.h     |  5 ++++-
>  drivers/gpu/drm/armada/armada_drv.c     |  8 ++++++++
>  drivers/gpu/drm/armada/armada_fb.c      |  3 +++
>  drivers/gpu/drm/armada/armada_fbdev.c   |  3 +++
>  drivers/gpu/drm/armada/armada_gem.c     |  7 ++++++-
>  drivers/gpu/drm/armada/armada_overlay.c |  8 +++++---
>  drivers/gpu/drm/armada/armada_plane.c   |  4 +++-
>  drivers/gpu/drm/armada/armada_trace.h   |  5 ++++-
>  10 files changed, 49 insertions(+), 12 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--eRtJSFbw+EEWtPj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1Sg28ACgkQ3SOs138+
s6Gaew//aMgEuIZ8gAOqGUtEtMwQcDcVOGjAi7k51vVYIqGYqsvyr7Fp7c+BzeWg
pLS8ZB0kVqV7pCxVpbdsf3G51KzbUj9TxJBDthXY7z11qrhBspWt6NYyKXoKmx15
me11n4Wrq7midcfJsmEcMQtebRukMlGkKmSrHNixVDz7cxCy6FmBYCBX9R08A067
U/wHKKR1jcVbdt6DeuhJqMN0KOdLuPZrTwGDK0Of5WbjfUlv9aK6paM95yZhvST/
QEJ4w85HTI/eCiU1iDRYYDg4GJNhgsyY5ZU1Se0HAyH6obr2pD/8A2KRVAYszRTM
HG3sDtU7GU1ZIisqVUGGiVsmmyhin/JmhNgO7vkpnFXxgBk7JQ2q5aiCsH2HTqTG
3Kf+QE73INx9JGP4O3MvkEJ8xI3yG22wB+eJEJQ/2Jsmy5/nKglOIdMJa4p291lY
dIzp4sMWBHNJ+mC+EKI+Uae1aE8c0jZ5vqYwg/yjVhZaIZzKbpWYCAnz2vn/jpRQ
wOsr9xuJJsQmssEAB/9RsFGq1g0YNdT0IAE/Gw80lYJJDJPVI7vxgtJKZ2M1egXW
iy+2KtznDhIsGROhvEQFyvaVpMCeq5ADKi1gFtSwbJ1f2lYC6CHUJ623qBQgNwaA
qZlaFFP+Tr3pN5k6Qvnl+w3Hxj98wEHzM4MH7jgMnoTBQhssxLM=
=yxMK
-----END PGP SIGNATURE-----

--eRtJSFbw+EEWtPj3--

--===============0491761372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0491761372==--
