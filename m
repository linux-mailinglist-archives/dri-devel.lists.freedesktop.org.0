Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B45C98FA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 09:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3546E0C6;
	Thu,  3 Oct 2019 07:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21C96E0C6;
 Thu,  3 Oct 2019 07:26:41 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1339C21A4C;
 Thu,  3 Oct 2019 07:26:40 +0000 (UTC)
Date: Thu, 3 Oct 2019 09:26:38 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PULL] drm-misc-fixes
Message-ID: <20191003072638.anj5dc435y2s3ybn@gilmour>
References: <20191002200604.gjae7xjtdaj3j3ga@gilmour>
MIME-Version: 1.0
In-Reply-To: <20191002200604.gjae7xjtdaj3j3ga@gilmour>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570087601;
 bh=QR4Uir5QA5yuAA0UG6T3OR8FxwWOArKmjP/PGhrEXfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fFEPsTVIuYD0EzB8aJcsc+9MD23x04NtDZrzZ6QMagt/T14njDiK8F76RV+4Thk+S
 ZHUL/nGcE3HLtHRTthkFK5ikilnfm6kyiAV0SDA4fPRW0+UNzaXEhn9cRuZzJcQGCm
 2g2DVRa+CkXOPE5clz0+vpuGBZPwTJlvuUKENGfs=
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
Cc: dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1357291843=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1357291843==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ljzcyyxudgt7bax5"
Content-Disposition: inline


--ljzcyyxudgt7bax5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Oct 02, 2019 at 10:06:04PM +0200, Maxime Ripard wrote:
> Hi Dave, Daniel,
>
> I hope that you enjoy XDC if you could make it this year :)
>
> Here's the first round of fixes for drm-misc
>
> Maxime
>
> drm-misc-fixes-2019-10-02:
>  - One include fix for tilcdc
>  - A memory leak fix for Komeda
>  - Some fixes for resources cleanups with writeback

So it turns out that while that tag was pushed, I forgot to push the
branch first, and now we have a conflict.

Let's drop this PR, I'll do another one.

Maxime

--ljzcyyxudgt7bax5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZWirgAKCRDj7w1vZxhR
xYLyAQDEaPqZF8CrG4OUvALk4W65TGSlW3f4xXvfxfPsj8McCAD/dzJkJEhbUX5A
slC1Mal7RMu2vtsATYKrnUWjQF6G5wI=
=/Zge
-----END PGP SIGNATURE-----

--ljzcyyxudgt7bax5--

--===============1357291843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1357291843==--
