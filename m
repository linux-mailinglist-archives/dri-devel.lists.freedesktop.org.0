Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8069E39EF64
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 09:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8996EAC8;
	Tue,  8 Jun 2021 07:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5081F6E512;
 Tue,  8 Jun 2021 07:19:56 +0000 (UTC)
IronPort-SDR: NYcltWFQdqzu3TbjRJ3qoD4cBLUYIyq7GAiFHh4uKu0IjGTj4c+hJ+yimhNX0gj7z9fdgtb5UX
 iA8spa642BDQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204811176"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="204811176"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 00:19:55 -0700
IronPort-SDR: 0X7H/vXSq3sB6z2qreZDhbT5ZZMI9zjaV7SmLswJ7GQ77d6nokMmx0p90aQNKoAy2MnkaT0TZ7
 VhyIktufIVOw==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="551507473"
Received: from delmer-mobl.ger.corp.intel.com (HELO [10.249.254.231])
 ([10.249.254.231])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 00:19:54 -0700
Message-ID: <83e3d898a61791bd2110acfec75382638c24c9db.camel@linux.intel.com>
Subject: Re: [PATCH 2/6] drm/i915/ttm: add i915_sg_from_buddy_resource
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 08 Jun 2021 09:19:51 +0200
In-Reply-To: <20210607182210.99036-3-matthew.auld@intel.com>
References: <20210607182210.99036-1-matthew.auld@intel.com>
 <20210607182210.99036-3-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-06-07 at 19:22 +0100, Matthew Auld wrote:
> We need to be able to build an sg table from our list of buddy
> blocks,
> so that we can later plug this into our ttm backend, and replace our
> use
> of the range manager.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Not sure whether this is the best place to put this or move both the
drm_mm variant and this to the TTM region code, but I guess it doesn't
really matter.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


