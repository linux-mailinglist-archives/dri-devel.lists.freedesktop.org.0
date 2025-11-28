Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1270DC930E6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 20:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FF510E782;
	Fri, 28 Nov 2025 19:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="tTlVitIK";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="p8UTVkvq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9312310E782;
 Fri, 28 Nov 2025 19:53:27 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 9B2937A0848;
 Fri, 28 Nov 2025 14:53:26 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Fri, 28 Nov 2025 14:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1764359606;
 x=1764446006; bh=E/M1A9g+tzfu51whtk6ETtuXS4dKP2Z9OkNprWYeCNY=; b=
 tTlVitIKSELuFlIuIldmN/jM765oWmW/3YvZZKVeyvQMGDBt9V1fHU9TKPaA4Ad7
 qsP8i1xlM73b88dpavbLZpjB3jfXeWYMPE2iykLm0pdytbmi4fIm5YKKJ2Zj0wF1
 gmXvue8pczRsxySanqWNYs7/yVMMB+Qpg4o13P+i0+XYe3UprfG3eJNBonNxsjB0
 q+MAmMQ+7DkTjDnv3ByZ11RoEyz++QzleKxdPAe0B+4gtZQV9ncNcwfe2RHiqdz1
 O749eIZjml6RDJFEP2YJHjIzsmX1VLDvf+tY4VMhuMt07Q/rGj3xOCl6klkXkus+
 MDV2gz08o+xq15T7hxEsuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764359606; x=
 1764446006; bh=E/M1A9g+tzfu51whtk6ETtuXS4dKP2Z9OkNprWYeCNY=; b=p
 8UTVkvqc3s8yQa/I/qApMU/3+QEV07IFWmEogPBP8kUdHB45zW825ufQBnotw6WR
 HumlJ5qtUM+In+bGOM+AEH7YK7+Drw/legqKiMtVOkWlHYj2RejBM6we32sz2Q7w
 4fK2DrluT/ICsARZudwAKkL/YcJYR0x0LHgeYPWW92vz1kh7d+9adCFmf07gQsEW
 zCtkS7m3aycIAdRHC3X0nLf7kEos6mrqF7wLQ8U98UsVtS8wkwJHMKC0VWn89NZh
 oszi0kMFeKinwNI++V7mb0flPlQ0L8n0/2SZTl91Kp5UlxWyUksO1WNo4eCu1erg
 pIr5NalyzWckYqbJqe+Zg==
X-ME-Sender: <xms:tP0paYqp8QJDiRMtBbEN7ItLhBsGKMz3Bad_YFeSvoMAb_UhF2k7eA>
 <xme:tP0paU9vLSteN9eZB5YQg9Wemn7aEONJ2qjDkUZCgpjI5eFVw0DtZRI2Rcx9zYEhw
 4x00taHYFzJFwQ3RwB5xigZVQRl1qU9Ikaeip5hFI3CuKngZTXO8Xw>
X-ME-Received: <xmr:tP0paZ61ZWm-vR4A2FBDLEZyT5IY2GeV_cAo5S9LeLwfDS3HUyOnBdfp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvhedtjeeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:tP0paejA2arawQL2tW7aJBMgRhoJ3cxaKnM_sMn6sVthAU3MrEh6VA>
 <xmx:tP0paQqasH0lWNj-7AJAwoNtct6Nfyn81YdROwycgrBJIhFnUeTMpg>
 <xmx:tP0paaJ3kEJJRAsl6kuyfx1dclLaa1Hvek7jfXLBFzrQrG9Za8Z-xA>
 <xmx:tP0padsiaK5H7roIkIloK5l1KoqqQdAvSkDRazoByVqIf8fUp7jZuw>
 <xmx:tv0paQmaOVeIca7ACmTx7-urEuW6tun3Ol_1ctTi4f5rnRAdXMHzNYdG>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Nov 2025 14:53:23 -0500 (EST)
Date: Fri, 28 Nov 2025 12:53:22 -0700
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
Subject: Re: [PATCH v7 4/4] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Message-ID: <20251128125322.34edbeaf.alex@shazbot.org>
In-Reply-To: <20251127093934.1462188-5-michal.winiarski@intel.com>
References: <20251127093934.1462188-1-michal.winiarski@intel.com>
 <20251127093934.1462188-5-michal.winiarski@intel.com>
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

On Thu, 27 Nov 2025 10:39:34 +0100
Micha=C5=82 Winiarski <michal.winiarski@intel.com> wrote:

> In addition to generic VFIO PCI functionality, the driver implements
> VFIO migration uAPI, allowing userspace to enable migration for Intel
> Graphics SR-IOV Virtual Functions.
> The driver binds to VF device and uses API exposed by Xe driver to
> transfer the VF migration data under the control of PF device.
>=20
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> ---
>  MAINTAINERS                  |   7 +
>  drivers/vfio/pci/Kconfig     |   2 +
>  drivers/vfio/pci/Makefile    |   2 +
>  drivers/vfio/pci/xe/Kconfig  |  12 +
>  drivers/vfio/pci/xe/Makefile |   3 +
>  drivers/vfio/pci/xe/main.c   | 573 +++++++++++++++++++++++++++++++++++
>  6 files changed, 599 insertions(+)
>  create mode 100644 drivers/vfio/pci/xe/Kconfig
>  create mode 100644 drivers/vfio/pci/xe/Makefile
>  create mode 100644 drivers/vfio/pci/xe/main.c

Reviewed-by: Alex Williamson <alex@shazbot.org>

Hopefully this can still go in via the drm window this cycle.  Thanks,

Alex
