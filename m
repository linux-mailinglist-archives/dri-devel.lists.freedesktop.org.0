Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4D75097CF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 08:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD4710F4B7;
	Thu, 21 Apr 2022 06:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCD010F4B7;
 Thu, 21 Apr 2022 06:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650523298; x=1682059298;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:cc:subject:to:from:message-id:date;
 bh=vFGSRbEcLkms+IbiDdCfsUKr+xXgWNEER3JK8P3rTHs=;
 b=N2cIb4sEiy/DRfsNiwlGF7AA90l8gWS0IIe9tegQuKWTlBeZrCbF/kTa
 Mzi/c3AFGbdgD4UXOGPcivuTv+kNSbw60O6XYuPCsP0NJQ6M/J9aDcIMR
 Gf+AopTd2hZLCbIVDchexhmk1d6ArEmESWXArS757UGIIzv4Y6lSKpdbM
 m5uC61wKGNJ18kbcaAf2CHSRu4N9fFJR7Jea292JUkseUUppuIRll6vYY
 ZTaV9F/tLjZZKP2mFvt8BBv++ADGT//WIfY8FEyHD6ntNqqWUhgt6EX9U
 EiCulyu/ZQHhc5+wumbK4yO9EJNnErFyh2g2YrBtm+rp1Gowf0qWvAeQc g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="264428967"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="264428967"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 23:41:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="562448290"
Received: from hyeongju-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.54.203])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 23:41:33 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220421054738.GA20772@lst.de>
References: <5a8b9f48-2c32-8177-1c18-e3bd7bfde558@intel.com>
 <20220420164351.GC2120790@nvidia.com>
 <20220420114033.7f8b57c7.alex.williamson@redhat.com>
 <20220420174600.GD2120790@nvidia.com> <20220420200034.GE2120790@nvidia.com>
 <55cb46db-754e-e339-178c-0a2cfaf65810@intel.com>
 <20220421054738.GA20772@lst.de>
Subject: Re: [PULL v2] gvt-next
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, Christoph Hellwig <hch@lst.de>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <165052329083.6597.933445971686511585@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Thu, 21 Apr 2022 09:41:30 +0300
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Tvrtko

Quoting Christoph Hellwig (2022-04-21 08:47:38)
> On Thu, Apr 21, 2022 at 04:57:34AM +0000, Wang, Zhi A wrote:
> > Is it possible that I can send two different pull based on the same bra=
nch?
> > I was thinking I can remove this line in the original patch and then ad=
d a
> > small patch to add this line back on the top. Then make two different t=
ags
> > before and after that small patch, send one pull with tag that includes=
 that
> > small patch to i915 and the other pull with tag that doesn't includes i=
t to
> > VFIO?
>=20
> Yes, you can do that as long as the small fixup commit is the very last
> one.
