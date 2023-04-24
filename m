Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF58E6ED0F9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 17:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817F110E528;
	Mon, 24 Apr 2023 15:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA35D10E133;
 Mon, 24 Apr 2023 15:09:40 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 780645C014E;
 Mon, 24 Apr 2023 11:09:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 24 Apr 2023 11:09:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1682348978; x=1682435378; bh=br2FvkkiVd9k+hHaNH9Pd3RjVFL01dwydgz
 wiLtpTq4=; b=e15dlCFA9qXwho9DW72jqNpVUNwKx1eg6liq0FCXwo3fHxGLKGQ
 TiwiaGSRG2ZTsocxtXw4S8TlVpZ9ze0A3C6d1SV4f7Bsu9Pvp7Rs/48kbL5eR5Vl
 uhxZAUw2X+v3OPS0uX39GrsnD5hIOeCBVyo6f0uZz18f1KXQhvFPGXTr/aSZdObh
 emK7qOPGsDApkPtu/+hCTM9O2B4hdCWKKJ9F6R+9b9juGOlcDis6m0ZNGHdqN3VP
 xWllgEUOvvqEghlFcTy09VVNUgs92zQb2e18BVcTuAcrbu0MFqD+eW/Dxpsip+zv
 mKV2x63s5xu8nZEUDUFZXsHB507iegiaeXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1682348978; x=1682435378; bh=br2FvkkiVd9k+
 hHaNH9Pd3RjVFL01dwydgzwiLtpTq4=; b=AusWtLUMcsQDQwrShNinBYrilcsn9
 Z44HTzvvbP6+cw3x+ZrU78ICS2gPJ1qH2QxSnRHdG9M6DPEflShaQ/675mw6GSfm
 RuWvORGfDsBG76cVNehHRwjiQr7+nlUK3oqJLoiLaxte34wesB1/z1mWdfst/iX8
 +pJ6KpioLW5LD06dGXSsUZXQNcI1eiZrKFM+b+9QDb47DOnfSvzf2fis2ExJ6DKK
 mTkmSjKWsDyvrAAMVgSdJ5Yuhe467QQmXts6BVr5bE3MC95bLHxrqiZstjiNrog6
 rOIkG6FgDDhLaUSzOE0u7SV0cT+6zcm+T2HoibMjiqbOOdD+0m5SwaE6A==
X-ME-Sender: <xms:sptGZNLl26Sq51wiTh0XLRplamLP9ZCusuyTgFQRe-zaB2N2P8_oKw>
 <xme:sptGZJKiqQNNmyErshmzHblsreaHxBm_PGZmuViTjxatY75sdE2wn2OWvFQiQGFfQ
 yfI0-XnA_QaDg>
X-ME-Received: <xmr:sptGZFu8QWlvLepv_AD7AHQ5-E5rwiay_nsblOAV0HMI8NgvD3mt25xPd_fGOYTXOJ_xQQjwsunkYHue9CPSsb3TUNK8c47ClOM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedutddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdeh
 fefgffefudegveetueegfeevvedvvedtleefgefftddufeejtdfhleeftdevnecuffhomh
 grihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvth
 hhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:sptGZOZg_rJe0p8CvVq279FvOlTK6YS701BFJUNR0u0nHFgRMRH-EQ>
 <xmx:sptGZEaqqcVxO0HKGJKAGNPEuhgljw1tIejaCFoBu9ZGhNu3iMhlGg>
 <xmx:sptGZCAAp8XnrDUpGdTKBTjspC0ZBalCKmWoZZgpTZ3uisig7zc7hw>
 <xmx:sptGZBIdh_m-NeIHOlWZYqGtNfdInslv2PbQ8Rq0E1nVpbWf9Upa-w>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Apr 2023 11:09:35 -0400 (EDT)
Date: Mon, 24 Apr 2023 17:09:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [RFC PATCH] x86/mm: Fix PAT bit missing from page protection
 modify mask
Message-ID: <ZEabrGgRA1vKn+11@mail-itl>
References: <20230424123524.17008-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="osZaiv/38K3nEkTW"
Content-Disposition: inline
In-Reply-To: <20230424123524.17008-1-janusz.krzysztofik@linux.intel.com>
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
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org,
 Yu Zhao <yuzhao@google.com>, David Hildenbrand <david@redhat.com>,
 intel-gfx@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andi Shyti <andi.shyti@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--osZaiv/38K3nEkTW
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Apr 2023 17:09:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, Yu Zhao <yuzhao@google.com>,
	Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Chris Wilson <chris.p.wilson@linux.intel.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH] x86/mm: Fix PAT bit missing from page protection
 modify mask

On Mon, Apr 24, 2023 at 02:35:24PM +0200, Janusz Krzysztofik wrote:
> Visible glitches have been observed when running graphics applications on
> Linux under Xen hypervisor.  Those observations have been confirmed with
> failures from kms_pwrite_crc Intel GPU test that verifies data coherency
> of DRM frame buffer objects using hardware CRC checksums calculated by
> display controllers, exposed to userspace via debugfs.  Affected
> processing paths have then been identified with new test variants that
> mmap the objects using different methods and caching modes.
>=20
> When running as a Xen PV guest, Linux uses Xen provided PAT configuration
> which is different from its native one.  In particular, Xen specific PTE
> encoding of write-combining caching, likely used by graphics applications,
> differs from the Linux default one found among statically defined minimal
> set of supported modes.  Since Xen defines PTE encoding of the WC mode as
> _PAGE_PAT, it no longer belongs to the minimal set, depends on correct
> handling of _PAGE_PAT bit, and can be mismatched with write-back caching.
>=20
> When a user calls mmap() for a DRM buffer object, DRM device specific
> .mmap file operation, called from mmap_region(), takes care of setting PTE
> encoding bits in a vm_page_prot field of an associated virtual memory area
> structure.  Unfortunately, _PAGE_PAT bit is not preserved when the vma's
> .vm_flags are then applied to .vm_page_prot via vm_set_page_prot().  Bits
> to be preserved are determined with _PAGE_CHG_MASK symbol that doesn't
> cover _PAGE_PAT.  As a consequence, WB caching is requested instead of WC
> when running under Xen (also, WP is silently changed to WT, and UC
> downgraded to UC_MINUS).  When running on bare metal, WC is not affected,
> but WP and WT extra modes are unintentionally replaced with WC and UC,
> respectively.
>=20
> WP and WT modes, encoded with _PAGE_PAT bit set, were introduced by commit
> 281d4078bec3 ("x86: Make page cache mode a real type").  Care was taken
> to extend _PAGE_CACHE_MASK symbol with that additional bit, but that
> symbol has never been used for identification of bits preserved when
> applying page protection flags.  Support for all cache modes under Xen,
> including the problematic WC mode, was then introduced by commit
> 47591df50512 ("xen: Support Xen pv-domains using PAT").
>=20
> Extend bitmask used by pgprot_modify() for selecting bits to be preserved
> with _PAGE_PAT bit.  However, since that bit can be reused as _PAGE_PSE,
> and the _PAGE_CHG_MASK symbol, primarly used by pte_modify(), is likely
> intentionally defined with that bit not set, keep that symbol unchanged.
>=20
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7648
> Fixes: 281d4078bec3 ("x86: Make page cache mode a real type")
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: stable@vger.kernel.org # v3.19+

I can confirm it fixes the issue, thanks!

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--osZaiv/38K3nEkTW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRGm6sACgkQ24/THMrX
1yzT0gf400BOXJvJeqI1javhvP81SDOZYUdV+Hbr92YK3/V923fZE3lL3vkMM0TQ
TqbUZ0pvUaeds3y1dTt812XjjS/1AoT3tC+fj++bfX6LAYLuQWVO5P0gllFsb4bN
ny3EG2Vz7YVYbFkVbWBZVhL1FgMJr176wvc0kNr1etE+PqeQjycOEK9y3lsr2gBi
QuMreECQO49lJjzEViX0cC+OSQ8OaN460diENUnYrQf9b0Zp6OCWIWnGFjUuMO1W
SB74scfbpDW3MvpGFjBT1vjLyTckriD/E4KvGDNETIf/nRrSa1PiVP98LHesAQwJ
arBw1aNL48n2Xi10dhUmhhM+uQr3
=cWLA
-----END PGP SIGNATURE-----

--osZaiv/38K3nEkTW--
