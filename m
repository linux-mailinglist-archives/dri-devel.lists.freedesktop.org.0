Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E567BB249BF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 14:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7826710E009;
	Wed, 13 Aug 2025 12:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ed7Ef53G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B8B10E009;
 Wed, 13 Aug 2025 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755089238; x=1786625238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jSPWnVhmlrAgGBExm/iLthQMgTaMjQEtp3rqPporWQU=;
 b=ed7Ef53GCQH4pU2TtYBU+oD0Kb2i7Lv/BX4ubrv6zpxtgNU0rJpaMimC
 /bPNJSgLB0xHV+Ur1nhCLoDrkiKKburHnyxCmMD1UyMuiIEsPa0UXX1kV
 JFnGV55TCnVZGbAwpBP//GNspzUULDG/36oZhnmUkDan0DNKw+u0qxuNV
 mrDIFhXLjKNjA67WmvTbfhA+MoEPjCInlRGmPtOiauRXFVkPA1R9cOwzm
 zAaNVkSchjSBmP3sNK0b0Uba1h9RKQVnbCsEA0u9rvodvy6R0JEvO5z4I
 BBvTX6x/zWKCJ4C1gi4bb+hUpTmZCfXd9bSGqyCrqGM/4trIrqTMcfKWp w==;
X-CSE-ConnectionGUID: twZ3kIt1QNqJE7e/fBC5VQ==
X-CSE-MsgGUID: A4P1MalpR7u/F9hh1fzowg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="44958534"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="44958534"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 05:47:17 -0700
X-CSE-ConnectionGUID: nwW/sGjqQOeYQbTW6r72Iw==
X-CSE-MsgGUID: t3Ywg6MNQvy6dBC8KtdyRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="197318878"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.245.225])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 05:47:16 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>, intel-gfx@lists.freedesktop.org,
 chris.p.wilson@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
Date: Wed, 13 Aug 2025 14:43:47 +0200
Message-ID: <7836906.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <7a96d06d-54a9-42b4-84c7-0c262104ea5b@amd.com>
References: <20250226155534.1099538-1-nitin.r.gote@intel.com>
 <2153999.KlZ2vcFHjT@jkrzyszt-mobl2.ger.corp.intel.com>
 <7a96d06d-54a9-42b4-84c7-0c262104ea5b@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Christian,

On Tuesday, 8 July 2025 12:09:58 CEST Christian K=C3=B6nig wrote:
> On 08.07.25 10:56, Janusz Krzysztofik wrote:
> >>
> >> There is no reason to test enabling signaling each of the element in a=
 loop. So there should be something like 4096 calls to the dma_fence_chain_=
cb function each jumping to the next unsignaled fence and re-installing the=
 callback.
> >=20
> > So how building a chain should look like in real use cases?  When a use=
r=20
> > builds a chained link of her fence with another fence then may she enab=
le=20
> > signaling on the new chain link?  If that other fence occurs a chain li=
nk then=20
> > who should take care of disabling signaling on it so signaling is enabl=
ed only=20
> > on the last link of the chain, not leading to a situation similar to wh=
at we=20
> > have now in the test case?  IOW, what's a correct use pattern of=20
> > dma_fence_chain?  I can't find that documented anywhere, neither in inl=
ine=20
> > docs nor in commit descriptions.
>=20
> The dma_fence_chain container is basically a single linked list which all=
ows to "chain" together multiple dma_fence objects.
>=20
> The use cases is to keep only a single fence even when multiple asynchron=
ous operations have been started.
>=20
> So you usually keep only the most recently created dma_fence_chain and ev=
entually ask that one to signal when you need to wait for all fences inside=
 the container.
>=20
> The tricky part is that since the chain can get very long the implementat=
ion can't use recursion or otherwise we would potentially overflow the kern=
el stack. And that needs to be tested and made sure we don't accidentally b=
reak the implementation somehow.
>=20
> Keeping all elements of a dma_fence_chain in an array and asking all of t=
hem to signal individually makes no sense, for this use case we have the dm=
a_fence_array in the first place.

I'm going to submit a patch that drops enabling of signaling on each link o=
f=20
the tested chain, as you suggested.  Don't you mind if I add your Suggested-
by:?

Thanks,
Janusz

>=20
> Regards,
> Christian.
>=20
> >=20
> > Thanks,
> > Janusz
>=20




