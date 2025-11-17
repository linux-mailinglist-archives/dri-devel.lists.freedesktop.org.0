Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E61EC65C67
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 19:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4435510E0EE;
	Mon, 17 Nov 2025 18:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="PFanATlL";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="hU9uqeYg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD43710E0FC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 18:48:18 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id CAB16140020E;
 Mon, 17 Nov 2025 13:48:17 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Mon, 17 Nov 2025 13:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1763405297;
 x=1763491697; bh=PCLFg0q3YzCL23S3qPi7qqYmhGuoDLREakt4kCUJj9s=; b=
 PFanATlLcy2AbR4pDmZmar5zSYcpGiHwqupfLUY6m+QBhv6a7h8M/HfuypF4RguD
 KuDkjDJ/Fha3ZO7nM0FCf9AT2ZiZ2zC/9QPml/VdE0sfKppYCUbRVsV/lYTleV0F
 /ileJEVNFXT3kwiExIWu5N2wQPOAgNy9BjFZQtpriiGm2PpxZ0jUoSzcggP2JwD3
 VYRZpTJbhpdknO1tddUSh36TPVASmnncYgxZDpqOJCHC1xOmCmq6fMGaaEk8V8gv
 CBNftdw3pnyo+bZhM+DLABw1glyjz8x/CxEvCwbRbLnmNnLf+qYw2pvryvw0atpP
 Ge2qzWjy7PuAjJV56S337g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763405297; x=
 1763491697; bh=PCLFg0q3YzCL23S3qPi7qqYmhGuoDLREakt4kCUJj9s=; b=h
 U9uqeYgvzD3Kvuex9KGSsMdzxNgDhazfFAuNKY86Wvm23A+FwD5aLgq386xvPIVH
 s8H5bXbgLm003IurcFe+q4ovBUnZBTxNQjNfdUMspABI4WNdBZzAe09pvuQRbgS0
 +xxgUMqCNKfQEnlNgxF4hsytglp5JTf01ega9VhHr3idHE1EG/wxDIQSrl26qGA5
 ZsbKIfDD1/Kr+3SlpsPHfqzsEz98t8gyNA+Q8u2q+hIF2gI6LH0tDKWa1eQSxKcz
 TuLL2R4C+Pa8bAbFgQE1pVTeCWtr/rbcQTQrvotyUzAc4mcyJvRZ4AybR4tkCY25
 0fX6uUulzNYSLVN3PlVzw==
X-ME-Sender: <xms:8G0baULeYVr0RT4js3CG-9mHv7KJ_jS5lOkZEDP2AvkXmYcwHSQnMw>
 <xme:8G0baUm1n6Xr0G1hWTMr5CFRF20EwWlQMYLB47BCVEg90GbvYr8BqPbMvnzb6WiBB
 ikRTc8mzpikCO9fW_1xjgPjo8Xlj3Tgln3s-GXHounFjlk2u8LPjQ>
X-ME-Received: <xmr:8G0baaIJ6kPf5kjSjqGn3WC-7Co54KYveGuXzOn03Enybofs5DrYtYb6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvudelvddvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfgggtgfesthhqredttddtjeenucfhrhhomheptehlvgigucgh
 ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
 htvghrnhepiefgjedugeduhfdviedtteelgfdvjeffieetfffhtdejudegheehkeejteef
 gfeunecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhgvgiesshhhrgiisghothdrohhrghdp
 nhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmih
 gthhgrlhdrfihinhhirghrshhkihesihhnthgvlhdrtghomhdprhgtphhtthhopehluhgt
 rghsrdguvghmrghrtghhihesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrsh
 drhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehr
 ohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehjghhgseiiih
 gvphgvrdgtrgdprhgtphhtthhopeihihhshhgrihhhsehnvhhiughirgdrtghomhdprhgt
 phhtthhopehkvghvihhnrdhtihgrnhesihhnthgvlhdrtghomhdprhgtphhtthhopehskh
 holhhothhhuhhmthhhohesnhhvihguihgrrdgtohhmpdhrtghpthhtohepihhnthgvlhdq
 gigvsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:8G0bafX83aLxwbJCUGohFVV_DMh1vQbgDKSPeElNH-d5Wd4L79xMEQ>
 <xmx:8G0bafNKXGkYeNUoZ9-7kxF3HjqhQ10jyk7aI7Zmwwp5s4glc5z6Sg>
 <xmx:8G0bablCb6-z7KutzOmn4AgmhAXxGDnZRZJ4eUWDeXzvyJvEk8vtcA>
 <xmx:8G0baSWEn_9RTz0NM0NKo2NZXdFLn8wqhJjdVKYjkPuiHrNcA-4wtA>
 <xmx:8W0baZsGYQYLydH-_L4kHR0nrZTbwc9C6Y6BsD1D7Bq4lPS7e26wO86N>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Nov 2025 13:48:14 -0500 (EST)
Date: Mon, 17 Nov 2025 11:48:13 -0700
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
Subject: Re: [PATCH v5 24/28] drm/xe/pf: Enable SR-IOV VF migration
Message-ID: <20251117114813.67fbea04.alex@shazbot.org>
In-Reply-To: <20251111010439.347045-25-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
 <20251111010439.347045-25-michal.winiarski@intel.com>
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

On Tue, 11 Nov 2025 02:04:35 +0100
Micha=C5=82 Winiarski <michal.winiarski@intel.com> wrote:
> +static void pf_gt_migration_check_support(struct xe_gt *gt)
> +{
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> +		return;
> +
> +	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 54, 0))
> +		xe_sriov_pf_migration_disable(gt_to_xe(gt), "requires GuC version >=3D=
 70.54.0");
> +}
> +

The latest GuC firmware I see in the linux-firmware package is
70.53.0[1], is this newer firmware available anywhere?  Thanks,

Alex

[1]https://gitlab.com/kernel-firmware/linux-firmware/-/commit/9444af1a20eb2=
4a39dba0eb0c511ee47c9d2631f
