Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A26C86F72
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 21:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFD710E458;
	Tue, 25 Nov 2025 20:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="xWis5iHp";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="1WgIpRu1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F7610E459;
 Tue, 25 Nov 2025 20:13:20 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 2A1031D00189;
 Tue, 25 Nov 2025 15:13:19 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 25 Nov 2025 15:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1764101599;
 x=1764187999; bh=SxBzS6wxsA9DU/wrcG08wVM8JozAfkjt6DeecCIzneM=; b=
 xWis5iHprTUKC6s7veQqbuYlIsiGvFjWVZ/ncVbfj/kEkDoww2qZjckaxKdbwpOS
 fJRcWTDv/zBudS40kGTvSd7x2/gZ/xexrNsAkXxFdo+nsGjq4gTOKB0QXnasYV97
 KQ3FiUxLCBHaVWzEsKDy5SX9O71Ripd+BRcZq+LSd/KyMRO1CVzlQMqh3ejJBI2j
 kdFl1MVvdcsVY5bcVdv6FUQVuhjs57ua/i0HBNFKzKYVjSWcff34g03pk9xgo/Th
 uxPY+4qrqoLputQtxu0IR86JR2wGtwVODJONsralwcG3OCC1gWZhKAt0PSXKKyJ+
 pbu/60K6xj5Xnyft5SiFZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1764101599; x=
 1764187999; bh=SxBzS6wxsA9DU/wrcG08wVM8JozAfkjt6DeecCIzneM=; b=1
 WgIpRu17/CGPtlIdUy5fftZ7tplpJ7JytkmZ0175np73ki83mNji1nkOmaVQP+i/
 MtLu9DcVIQwD3WN0oH3l1OI4HEfpW2LkXXrIKw/SpdjTRAMgTksrLE4szPcl0SrQ
 GfqVBLipASmJSoUf6MZP2B0H5KwZLfofSyqlQSknfeydOHo0D1aqi9DaN/g2mfx3
 jlk9bSa9PVTYEn4QAtlZCcHWbbtcawYoe/VNnnTjFS5dbyEXaIe6VRw5akFBaLHZ
 iaEkZ/DHhDZR23lYDwo4ff9PDRQrTnbvlOyixGydJghiWVBkRlagzS38UarJ7fst
 zNlV9lelt5k8TfuJ6gzyw==
X-ME-Sender: <xms:3g0maU4fw47TisN_W1o-i0kLbHCfFWmgWwZl119Xd_VUeRCgimeoSA>
 <xme:3g0maWUvibJsF9iLcfpVi_kCe3pIqp6oBhVHaQPvHibCiwcmrI22GCDmMTJK43fT4
 t7wDh7aHnVp-njdglEsjLMCttZ1_86gh8Bv7Q_zExRbSNSn4EClMw>
X-ME-Received: <xmr:3g0maY4v2GCi9oMzl_tFJBzLqOX479SoH2_CMpqhpEpk7O_VckukHBsR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgedvgedtucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfgggtgfesthhqredttddtjeenucfhrhhomheptehlvgigucgh
 ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
 htvghrnhepgfffvdefjeejueevfeetudfhgeetfeeuheetfeekjedvuddvueehffdtgeej
 keetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hlvgigsehshhgriigsohhtrdhorhhgpdhnsggprhgtphhtthhopedvuddpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtohepmhhitghhrghlrdifihhnihgrrhhskhhisehinhhtvg
 hlrdgtohhmpdhrtghpthhtoheplhhutggrshdruggvmhgrrhgthhhisehinhhtvghlrdgt
 ohhmpdhrtghpthhtohepthhhohhmrghsrdhhvghllhhsthhrohhmsehlihhnuhigrdhinh
 htvghlrdgtohhmpdhrtghpthhtoheprhhoughrihhgohdrvhhivhhisehinhhtvghlrdgt
 ohhmpdhrtghpthhtohepjhhgghesiihivghpvgdrtggrpdhrtghpthhtohephihishhhrg
 hihhesnhhvihguihgrrdgtohhmpdhrtghpthhtohepkhgvvhhinhdrthhirghnsehinhht
 vghlrdgtohhmpdhrtghpthhtohepshhkohhlohhthhhumhhthhhosehnvhhiughirgdrtg
 homhdprhgtphhtthhopehinhhtvghlqdigvgeslhhishhtshdrfhhrvggvuggvshhkthho
 phdrohhrgh
X-ME-Proxy: <xmx:3g0maXEq5ofT8QQr-mpV7rNXW5VqYmxVP4fkg7679KM-n_JTajGtfA>
 <xmx:3g0mab8QBb2EtiqGTSLfZwISvRnUQ02VfvHCwF-kAJ92_zKQPG8dNg>
 <xmx:3g0maZXCEDDKqaKX8nE4kgcUnJsB-NLGwyLZhx7gF4F-iC0jL2V6UQ>
 <xmx:3g0madGcEoSKfZhKbIyhL-h0o8oF61rz0tNxfGnca9R8VxPJt9BJEA>
 <xmx:3w0maVfPtYIDUbwzNoblR8K0XZ7sAGHjEdm_at5Nr0TOmVOgjRGwo6za>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Nov 2025 15:13:16 -0500 (EST)
Date: Tue, 25 Nov 2025 13:13:15 -0700
From: Alex Williamson <alex@shazbot.org>
To: =?UTF-8?B?TWljaGHFgg==?= Winiarski <michal.winiarski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas
 <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer Kolothum
 <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, "Michal Wajdeczko" <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v6 0/4] vfio/xe: Add driver variant for Xe VF migration
Message-ID: <20251125131315.60aa0614.alex@shazbot.org>
In-Reply-To: <20251124230841.613894-1-michal.winiarski@intel.com>
References: <20251124230841.613894-1-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 25 Nov 2025 00:08:37 +0100
Micha=C5=82 Winiarski <michal.winiarski@intel.com> wrote:

> Hi,
>=20
> We're now at v6, thanks for all the review feedback.
>=20
> First 24 patches are now already merged through drm-tip tree, and I hope
> we can get the remaining ones through the VFIO tree.

Are all those dependencies in a topic branch somewhere?  Otherwise to
go in through vfio would mean we need to rebase our next branch after
drm is merged.  LPC is happening during this merge window, so we may
not be able to achieve that leniency in ordering.  Is the better
approach to get acks on the variant driver and funnel the whole thing
through the drm tree?  Thanks,

Alex
