Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0945FF292
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 18:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C5010EB37;
	Fri, 14 Oct 2022 16:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C818510EB37;
 Fri, 14 Oct 2022 16:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665766344; x=1697302344;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=gU1/D7lUhaw4gFFb7+N8aoCRUcIiI1lpkumpXZy9lu4=;
 b=F9KAhxVuLa6xgXFHHFz0ioXA/UZczj915Rg8TOqbJ2GfXWaU8jUEeVA5
 EECD/SQ2u/QlwEu3m5W/SG8a8K9mTYAqVmtbgDrGaxnbzy2tarrdIKgMh
 zpcfXHUj+k7UI45KwdSxONFFbL8Sa5PnM6behIqsYfBtZ4dk0d/5/anZm
 U0FjghOzHSLIp0OzuvUrupMbWdBwHon4KS4azjtyx+/AHZi+nxMD7b7MA
 ZMpy3R2mCEo1TNVIuOu8Oi+gH25Hx8UrIQpmjtLyY1+vJJWA8K5cL/kfi
 1qLqHSzBzEppRfa/9PZqIBUy566C5jt/HIinl6pvwmRGyEzPwgM6+qWbD w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="307071347"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; d="scan'208";a="307071347"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 09:51:50 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="629996755"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; d="scan'208";a="629996755"
Received: from kmccarvi-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.149.127])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 09:51:49 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <466153a3-59ef-e91f-d267-ff9c777eccb9@intel.com>
References: <20221004114915.221708-1-matthew.auld@intel.com>
 <20221004114915.221708-2-matthew.auld@intel.com>
 <166573205234.1044993.5297661838478296333@jljusten-skl.local>
 <466153a3-59ef-e91f-d267-ff9c777eccb9@intel.com>
Subject: Re: [PATCH v3 2/2] drm/i915/uapi: expose GTT alignment
From: Jordan Justen <jordan.l.justen@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 14 Oct 2022 09:51:45 -0700
Message-ID: <166576630544.1044993.4210107539627625327@jljusten-skl.local>
User-Agent: alot/0.10
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
Cc: Thomas =?utf-8?q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Yang A Shi <yang.a.shi@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, dri-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-14 03:58:12, Matthew Auld wrote:
> On 14/10/2022 08:20, Jordan Justen wrote:
> > Acked-by: Jordan Justen <jordan.l.justen@intel.com>
>=20
> Thanks. Can I take that as ack for merging the series from Mesa POV? I=20
> think Lionel was going to test this, but I think keeps getting swamped=20
> with other stuff. We kind of urgently need to land this series.

Speaking from the uapi perspective, I would would say, yes, it looks
seems good to merge. I looked over your igt patches, and they seem to
test the uapi well. The uapi change is pretty simple, and the related
documentation changes look good.

No, we haven't gotten the chance to test the uapi implementation with
Mesa, but I expect we will soon, once it's in drm-tip.

-Jordan
