Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0131826BD4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 11:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004B810E07F;
	Mon,  8 Jan 2024 10:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EC410E07F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 10:50:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8CBD860EDF;
 Mon,  8 Jan 2024 10:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD43DC433C8;
 Mon,  8 Jan 2024 10:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704710999;
 bh=msBQzy8EdMXnugGPo4MmTZym97iZCC/FNO8Rtfp4LrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PplsqnMLWNoDx8j5PNwnqLMTBx/buVSkZ/pvtitJ6KXcXJ2nkJkXYJyXlRVUY9IEd
 sm8uoGHbXSPxN1E/llIhLXkavj+tsn0WLpA+RQK6Ryab8F/XaSJgtb0jf+HKGPDpkS
 pAlFznsbM94rEiztQRoSSt/Ws+56yRVd2PyzPLxXSbm3GnT/tx16CcSFynvq27fE/C
 CPGkBbA+m1Iw/LkenFktXnZTgrE+KyWGVsB1z/pAAqY81ZDBIoKfJ45CYdZiVxhCqG
 dOX3JDP8KWuOpmGk/0isJEqbI0BoPG/GU4ktwf3qSq0QiKC1xBBObs1o1ANQJC1Yyj
 FKPllksIVNiGA==
Date: Mon, 8 Jan 2024 11:49:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dipam Turkar <dipamt1729@gmail.com>
Subject: Re: [PATCH v2] drm/tests: Add KUnit tests for
 drm_mode_create_dvi_i_properties()
Message-ID: <ki4pqpxiww5oylbanlfzflv5raxeykrty2ubx5sgysiqrh55pr@lkgaq5lz72fj>
References: <20231110192452.734925-1-dipamt1729@gmail.com>
 <goxsh3zfoaacariu2dst5ww6ta7g2ubk24impowabvmfte5d4a@fxemdptwshzs>
 <CALHmwspWRT=pj+mPDhf8YTwSpTz6LiNjq18wbUk7wCW3ijKU4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oyi4gxr57md66oka"
Content-Disposition: inline
In-Reply-To: <CALHmwspWRT=pj+mPDhf8YTwSpTz6LiNjq18wbUk7wCW3ijKU4A@mail.gmail.com>
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
Cc: tzimmermann@suse.de, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mairacanal@riseup.net, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--oyi4gxr57md66oka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 23, 2023 at 03:59:33PM +0530, Dipam Turkar wrote:
> I needed some help regarding introducing a separate test for testing if the
> function still works if called a second time as suggested. Wouldn't we need
> to call it on the same object we called in the first time. So, that will
> bring redundancy in the two functions. Is this correct? Or am I
> understanding this wrong?

There will be redundancy indeed, but you're also not testing the same
thing so it's fine.

A test should be there to test one thing and one thing only.

Maxime

--oyi4gxr57md66oka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZZvTVAAKCRDj7w1vZxhR
xUygAQDTDS5T2olmHPXgg/cu40l6g9mbUBbKsTi64iKCkGOo1wEA6ZGY6WRaLNB3
u8lK+1DyyIjC5HPJmVYd2HPrUh6cZgg=
=F9YB
-----END PGP SIGNATURE-----

--oyi4gxr57md66oka--
