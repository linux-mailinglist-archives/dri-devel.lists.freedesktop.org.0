Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7502F86757C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DCD10F15A;
	Mon, 26 Feb 2024 12:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="rvn+xbm7";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="on+1Xfn4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow4-smtp.messagingengine.com (flow4-smtp.messagingengine.com
 [103.168.172.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D068910F15A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:46:23 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailflow.nyi.internal (Postfix) with ESMTP id A607420008D;
 Mon, 26 Feb 2024 07:46:22 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Mon, 26 Feb 2024 07:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1708951582; x=1708958782; bh=tolKghCFsQ
 ADX1q2Jjm5jKYzOjR/B/HXvaX3V+TXekk=; b=rvn+xbm7pZZyftzDJFztAqH8YF
 KhQiIypwmL2ercPlH7urWxllkqskmWZXB1J8GEWU9M/K1hvo2pIOA80Vxd9qR8/K
 0IgZ0XpE9ek9Aa68n8/AHbqvtcJRtLUf4Rnd4g3NaowWdZJTY+YBGBUQwK4yKX0U
 emljzCLD+7ME516CNEtArsLjvYy/mvVGOGSH427Kl+VJDD5iGN3KAVEudgZronfZ
 +JjsYrEuELxooBDTKHPTgwY7I1MhMXn+rmigm+FuopWCpVzf3vbzShTSMYMMtCGn
 gNhapD2qQONmXWe7ea/ngmaRpUPDHBiARZqw8Csx1sXRsoAkRqx7KFt0ooWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1708951582; x=1708958782; bh=tolKghCFsQADX1q2Jjm5jKYzOjR/
 B/HXvaX3V+TXekk=; b=on+1Xfn4V8nkMVxRKRveEKNq/P0ULsBTXEM6igzd2K5X
 gnxx/g6WH/hZv0FyxTHNvv6P9muFaVyKr///MXz2oReQN1Hvr5Huy8YCXlSMtgkW
 0RcuXxMWc4lT0neu+elBX3STLo8o8EUZuujy7ldWPv6KPqyXzCemOHu6HTHLujiU
 VqACvGC7iskSWVac+YSDAPFVtNCWk1bsVDusfFi2B1e4MSsPCJYWKMf82nj2myCf
 yzrL6UepxrwXTD4wKxV9GKqaIg7qbJVk97sjbivy2Umz4ddfISFVW98Sq7/YKcCE
 l3R1ktxfO0DKvOofL6akLv46VdJlMKt4iR3UVE+SSw==
X-ME-Sender: <xms:HojcZU2AHeYuQFerjVB7dR26ZnSXJKRlgNwqIVhbV1Wrxv-hCsZmaw>
 <xme:HojcZfHqxtBxfOH8b7cDw-8yK3GWge8791prc4oCK0d3Y__cB2srFX-HfbjTbuzmj
 wKMBuJwp1e-U_imsz8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgedvgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:HojcZc7mUifSZCwWHqSVQwD9ttivIpbaJYHe-KAa9tBbOMMmv192QA>
 <xmx:HojcZd3FdOjExv5V2xErwfIGuKgz4u-gamvwkv4BHXGj0p-IhzJKNg>
 <xmx:HojcZXGRfC0V-h6JRrvjsxUbArNNH6coDLaVR9UXjPIOtsGBtcp5fQ>
 <xmx:HojcZSm7xmYZSsqnwvvT9LlvA5Z0LG_R_Pi54Cgi4a3_tg4v0M12eMinvY4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3ABBFB6008D; Mon, 26 Feb 2024 07:46:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
MIME-Version: 1.0
Message-Id: <79815966-a8fe-46cf-85ee-16657fa2392c@app.fastmail.com>
In-Reply-To: <7hfobmmgs6ntnusobalqxslcyv3kqdlnhxjoxbaful4ameavj2@niodl55l7b7g>
References: <20240224121528.1972719-1-arnd@kernel.org>
 <7hfobmmgs6ntnusobalqxslcyv3kqdlnhxjoxbaful4ameavj2@niodl55l7b7g>
Date: Mon, 26 Feb 2024 13:46:01 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Oded Gabbay" <ogabbay@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>, 
 "Daniel Vetter" <daniel@ffwll.ch>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Matthew Brost" <matthew.brost@intel.com>,
 "Francois Dugast" <francois.dugast@intel.com>,
 "Jani Nikula" <jani.nikula@intel.com>,
 "Tejas Upadhyay" <tejas.upadhyay@intel.com>,
 "Matthew Auld" <matthew.auld@intel.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Michal Wajdeczko" <michal.wajdeczko@intel.com>,
 "Matt Roper" <matthew.d.roper@intel.com>,
 "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/xe/kunit: fix link failure with built-in xe
Content-Type: text/plain
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

On Mon, Feb 26, 2024, at 04:42, Lucas De Marchi wrote:
> On Sat, Feb 24, 2024 at 01:14:59PM +0100, Arnd Bergmann wrote:
>>From: Arnd Bergmann <arnd@arndb.de>
>>
>>When the driver is built-in but the tests are in loadable modules,
>>the helpers don't actually get put into the driver:
>>
>>ERROR: modpost: "xe_kunit_helper_alloc_xe_device" [drivers/gpu/drm/xe/tests/xe_test.ko] undefined!
>>
>>Change the Makefile to ensure they are always part of the driver
>>even when the rest of the kunit tests are in loadable modules.
>>
>>The tests/xe_kunit_helpers.c file depends on DRM_KUNIT_TEST_HELPERS,
>>so this has to always be selected by the main XE module now, rather
>>than the actual tests. In turn, the "depends on (m || (y && KUNIT=y))"
>>doesn't really do what it tried and can just be removed.
>
> it actually did, which was to workaround issues prior to the commit you
> are pointing out.  What it did  was to make sure xe.ko is m, or if it's
> built-in, kunit is also built-in. Apparently the problem here is that
> the xe_test.ko is missing the symbols.

Ah, I misunderstood the intention, as I was thrown off by the
redundant 'y &&' which sounds like it was trying to force XE
to be built-in rather than modular when Kunit is !=m.

The more common way to write this is 'depends on KUNIT || !KUNIT',
with some drivers writing it as 'depends on m || KUNIT!=m'.

I double-checked now and found that the dependency is indeed
still needed:

WARNING: unmet direct dependencies detected for DRM_KUNIT_TEST_HELPERS
  Depends on [m]: HAS_IOMEM [=y] && DRM [=y] && KUNIT [=m]
  Selected by [y]:
  - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (ACPI_VIDEO [=y] || !ACPI [=y]) && DRM_XE_KUNIT_TEST [=m]!=n
  Selected by [m]:
  - DRM_KUNIT_TEST [=m] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=m] && MMU [=y]

> See commit 08987a8b6820 ("drm/xe: Fix build with KUNIT=m").
>
> I'm happy to remove it though if it's indeed not needed anymore.

Ideally the xe.ko module should not depend on anything exported
by lib/kunit, but for the moment, the tests/xe_kunit_helpers.o
file is still included in xe.ko and in turn depends on kunit.

Changing this is probably a little more complicated than my
patch, so I'll just send a v2 without the incorrect line.

     Arnd
