Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB54FABD6B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 18:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED7A6E319;
	Fri,  6 Sep 2019 16:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976266E319
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 16:13:39 +0000 (UTC)
Received: from localhost (unknown [194.251.198.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96E2F2070C;
 Fri,  6 Sep 2019 16:13:38 +0000 (UTC)
Date: Fri, 6 Sep 2019 19:13:35 +0300
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/modes: Make the whitelist more const
Message-ID: <20190906161335.2hqsnyfzswfc4lpy@flea>
References: <20190906074614.30608-1-mripard@kernel.org>
 <87zhjh3lk5.fsf@intel.com>
MIME-Version: 1.0
In-Reply-To: <87zhjh3lk5.fsf@intel.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567786419;
 bh=Y/LqvI9sGZVg4a4gW7KKX+2A32+RJNg3yTFldVTo/UE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JrDzZQf9IHgVKQKp9chcV9VaSruuty+3WO1vI/XYV2xKrIDt1Qt6kmcjt7orCp5Lg
 MhgaOoNsGdZl6Yur1Tc1vWHJfYgItNdGfEyhoz0QzEQWfb1bSlan6E/Tj/bUgvG0of
 iaX7F6/MR6ckB6oZaqh028AZd5zZeB69OtxJYH9A=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1107181105=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1107181105==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jmiirhy7oybexmnw"
Content-Disposition: inline


--jmiirhy7oybexmnw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 06, 2019 at 10:56:10AM +0300, Jani Nikula wrote:
> On Fri, 06 Sep 2019, Maxime Ripard <mripard@kernel.org> wrote:
> > The commit 3764137906a5 ("drm/modes: Introduce a whitelist for the named
> > modes") introduced a whitelist in the named modes lookup code in order to
> > be a bit more robust.
> >
> > However, even though the char pointers were made const, the data they were
> > pointing were not. Let's fix that.
>
> Or rather, the char pointers were const, and they pointed at const
> string literals, but the array of pointers itself was not const.

Right, I'm always confused with const in this case. I've updated the
commit log, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--jmiirhy7oybexmnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXXKFrwAKCRDj7w1vZxhR
xcOoAP44pbB/jzJy2QWizuWhV5CmgaQYEyzenk/Ff5AffIuLowEA+safD2M6aD6I
G79Do9Tfttw+3BhIKYFTS1BJ+fh1PAU=
=hPwh
-----END PGP SIGNATURE-----

--jmiirhy7oybexmnw--

--===============1107181105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1107181105==--
