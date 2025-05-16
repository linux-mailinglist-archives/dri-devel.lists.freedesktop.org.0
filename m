Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7950EAB981F
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 10:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CF410E050;
	Fri, 16 May 2025 08:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POU6NLU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236CB10E050;
 Fri, 16 May 2025 08:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747385613; x=1778921613;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KL9ZtRnXbrdcGOl3WvPHJ6aj37du5XLO0lBZbwRCsM0=;
 b=POU6NLU+74OwFfdbsEstzNoAIifnoQGYdBbNqedTbdEmAJBhqlCpWMIz
 8qPhueo7gclA1PmCbJ88S55Htjjj+S5wDBLN/TgktlaGt1Rl4gHnG40y0
 Y2oB+itwKpXxE4RYJ5MYMtLnCXgcxs35qSBuQr2Jq42g2y7uy1NidptVD
 w/W7WtuZUGaZCtSdV3CqStxSTHGCYwCRlDgLtIWye9Y+M+zZYjzl+M2yh
 CRGkyQ0biYQ9Zv/A2FWvmlOLKVYnK6RkxZ5FiB9iHaBtZmPaA2SmAn+ZG
 WYT6RsbNwadwleLekCgpALpJLdW5sEvkfpXw3Shn9q+4dlZ9EXY3s9GY8 g==;
X-CSE-ConnectionGUID: tLPChA8YTwSN8fo9m1z+ag==
X-CSE-MsgGUID: HeO5zawFTu6qilfIrlEfmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="36967686"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="36967686"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 01:53:32 -0700
X-CSE-ConnectionGUID: /ipcHQ89TpWmf4IQ3ZL5LA==
X-CSE-MsgGUID: QepjbHrAQN6/Vq9FAvMOFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="138522038"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.245.131])
 ([10.245.245.131])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 01:53:31 -0700
Message-ID: <ce7159c2d2dc6f425be48085a93aabf0cbe9f20c.camel@linux.intel.com>
Subject: Re: [Linaro-mm-sig] Re: Sharing dma-bufs using a driver-private
 interconnect
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, DMA BUFFER SHARING FRAMEWORK	
 <linaro-mm-sig@lists.linaro.org>
Date: Fri, 16 May 2025 10:53:27 +0200
In-Reply-To: <0a890d19-27a1-4525-83e6-cfc082dfab37@amd.com>
References: <703610a4db0324db05ece8e83fff864717c2e6c2.camel@linux.intel.com>
 <0a890d19-27a1-4525-83e6-cfc082dfab37@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Fri, 2025-05-16 at 10:44 +0200, Christian K=C3=B6nig wrote:
> Hi Thomas,
>=20
> On 5/16/25 10:33, Thomas Hellstr=C3=B6m wrote:
> > Hi!
> >=20
> > I previously discussed this with Simona on IRC but would like to
> > get
> > some feedback also from a wider audience:
> >=20
> > We're planning to share dma-bufs using a fast interconnect in a way
> > similar to pcie-p2p:
> >=20
> > The rough plan is to identify dma-bufs capable of sharing this way
> > by
> > looking at the address of either the dma-buf ops and / or the
> > importer_ops to conclude it's a device using the same driver (or
> > possibly child driver) and then take special action when the dma-
> > addresses are obtained. Nothing visible outside of the xe driver or
> > its
> > child driver.
>=20
> As far as I can see that should work and we have recommended doing
> exactly that to multiple people in the past.
> =C2=A0
> > Are there any absolute "DON'T"s or recommendations to keep in mind
> > WRT
> > to this approach?
>=20
> My only requirement is that you write up some documentation
> (preferable either in drivers/dma-buf/dma-buf.c or
> Documentation/driver-api/dma-buf.rst) how drivers should do this,
> what the implications with the rest of the DMA-buf interface is
> etc... etc...
>=20
> The goal is to nail down how to do driver private interfaces without
> breaking interoperability with drivers who don't participate in that.

Ok, Will ensure that we adhere to this.

Thanks,
Thomas


>=20
> Regards,
> Christian.
>=20
> >=20
> > Thanks,
> > Thomas
> >=20
> )
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

