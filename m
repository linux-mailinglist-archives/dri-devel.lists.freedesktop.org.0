Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D729CED529
	for <lists+dri-devel@lfdr.de>; Thu, 01 Jan 2026 21:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B637F10E03D;
	Thu,  1 Jan 2026 20:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.b="ntNIn8qf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1967 seconds by postgrey-1.36 at gabe;
 Thu, 01 Jan 2026 20:12:45 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0255D10E03D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jan 2026 20:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu; 
 s=ds202307;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NfmiQM37ly0jL0rmd/GvAkOHEOuwHHfshS7CwxNb0e4=; b=ntNIn8qfYcw2SPrD7yXav4rYqN
 /xYUT6kpVbB5gXiOBwfL/XtrTJPf3kp1Vs5QyeSCV0jDQAxEzNX3LOTWOV5c/EjNp/WqdLD4ZtcEK
 R1nQfMzJN9fd8yznJH3h4nKtcVxb4qeeBfXmR3tmSKCMzdRoiAF6hIexQpjlP6iPyogK7Yoqhgx6i
 ziCqYyVkpeMoAFWMlg492axc7U2S99wbnB1tJBnXKMLlSQ+ejICAr55c+b0jz77nzBPBz9k3udoTY
 IfZfMlqatnfYcnDym2NslBWRa1dRFTFHQUfjMCvdVbUH7bAED3Akln5um2AB+y8+qvr6BsMEPje7P
 qmPjbTOQ==;
Received: from smtp by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 id 1vbOWY-00DiJn-Rw; Thu, 01 Jan 2026 20:39:54 +0100
Date: Thu, 1 Jan 2026 20:39:46 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 linux-hardening@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 3/3] overflow: Remove is_non_negative() and
 is_negative()
Message-ID: <20260101-futuristic-petrel-of-ecstasy-23db5f@lindesnes>
References: <20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org>
 <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
 <acdd84b2-e893-419c-8a46-da55d695dda2@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0BVVorEFNEq+bZUt"
Content-Disposition: inline
In-Reply-To: <acdd84b2-e893-419c-8a46-da55d695dda2@kernel.org>
X-Operating-System: Debian GNU/Linux forky/sid
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


--0BVVorEFNEq+bZUt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 01, 2026 at 04:10:36PM +0100, Vincent Mailhol wrote:
> On 20/12/2025 at 12:02, Vincent Mailhol wrote:
> > The is_non_negative() and is_negative() function-like macros just
> > exist as a workaround to silence the -Wtype-limits warning. Now that
> > this warning is disabled, those two macros have lost their raison
> > d'=EAtre. Remove them.
> >=20
> > This reverts commit dc7fe518b049 ("overflow: Fix -Wtype-limits
> > compilation warnings").
> >=20
> > Suggested-by: Nicolas Schier <nsc@kernel.org>
> > Link: https://lore.kernel.org/all/aUT_yWin_xslnOFh@derry.ads.avm.de
> > Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
>=20
> So at the end, this patch got five kernel test robot reports:
>=20
>   https://lore.kernel.org/all/202512221735.mRV4BZqB-lkp@intel.com/
>   https://lore.kernel.org/all/202512230342.Lgha2HGH-lkp@intel.com/
>   https://lore.kernel.org/all/202512251340.UApIFw9R-lkp@intel.com/
>   https://lore.kernel.org/all/202512271618.33YepxDC-lkp@intel.com/
>   https://lore.kernel.org/all/202512280906.wt7UNpya-lkp@intel.com/
>=20
> All these are the same smatch warning just triggered from a different
> place. I think it is still too early to undo that workaround in
> include/linux/overflow.h, otherwise developers would be getting that
> smatch report too often.
>=20
> I will send a v4 in which I will drop this patch. This basically means
> that the v4 is a revert to v1...

thanks!  I think it's a bit sad to keep code only to make some checker=20
tooling happy, but for now it seems to be the right thing to do.

Kind Regards,
Nicolas

--0BVVorEFNEq+bZUt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmlWzYIACgkQB1IKcBYm
Emkv5A/+JGh8gXsgclOmUAW84XlSnEuwIhRXs3PO+BaFvveNaRIkkKUPw6dsHWDR
VlbsSCp/6fyRrH5A2UQ8i7mAgkaFPrmi76d50HrYsMDFDPcCmmFkQP+6UTSvymZo
KBiXwBoypXpUzcUaoWPmwhMfWH+0Ov4IMj6Suy808QAaESPPwJORFmd7zTl7ZE3i
zUibhRVpU3qlgcV0ZcpJAkx4KJFHc0ADv9GTAmWTeBHGMsqWk4xZaFCwLB8bv+IB
1l1X+7DjY9GzqupPzrfTZxeFZsrG/DVQAtKUutcbvZJPM8XWD9sHtb4oM9BEbQr8
ShaZ3CbtXBGo5MCzQCw/Sb9DGCYm66apPE3NWbcEFKPqLG4slF7PdQ8o1DyyDbjK
v8icj6elb23wmQGRd47aIVTcsFUeis+nJHAMnlQSMfVgDNB+trggaEHrzhcgP4Ff
IhouTrsvdLsqzz01Oa+XQfR4GkjBxL6nWZLMbbOlXmHin4iSKqLKiCWrc6lkPJ7I
d2F1JJoEH4XpbfdTV4YtsU+D3gpjywC7uGWSweHGTs8DihnQ/x5bwBUX3Bo98+pK
T59NTfnjD02v+802qjCKvOoM90j5dX1FUCqhekc8Nm+TUlC5UHDjtts8SAmf1x9u
OatEZU2f5zGPJBL91kVMQS7/psD1ZkDNucVtKBKX9gCveWFvVnQ=
=7eoQ
-----END PGP SIGNATURE-----

--0BVVorEFNEq+bZUt--
