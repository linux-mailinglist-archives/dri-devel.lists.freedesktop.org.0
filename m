Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7217C56ABF4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 21:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9BF14A18A;
	Thu,  7 Jul 2022 19:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6EE14A195;
 Thu,  7 Jul 2022 19:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657222737; x=1688758737;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WAXsq/7umGZEXtIHC1TBk7MUCXfpreUdr3ejEKMjVNE=;
 b=b0Hf8cL4Fll36hVNNw8jzvDjZZVV+x3AQuzOjiFxbYTWrcqJ8dmbKeDW
 152bcasAmTQi+l1LBnl+qiHIxXCmIHeLd6cLh855oqF5fOjm3CVutriNx
 IF/FPCqRYiRAezIv6xNwThrRaD2JNvJ++KTh89L83SNT8dYAVNOz06SBf
 UR5/ufBDUuEVyEg2yijem+MHbiCm6KEZjbb8pGnWz9XW5s/TJRZN3WtaS
 7J+4l0rlmmJf8IBxKT/+blFBdkdK50UlDY7rKoEFpuu/VfCf2uuk5T/Rw
 cHMUtH6Mhjdd2DciB/bQb8YdZQkh9BIIHrgvVPeS7AexzgsmEliroysCN A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="272904007"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="272904007"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 12:38:56 -0700
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="651265237"
Received: from tlonnber-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.208.235])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 12:38:54 -0700
Date: Thu, 7 Jul 2022 21:38:51 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Subject: Re: [Intel-gfx] [RFC 06/10] drm/i915/vm_bind: Add
 I915_GEM_EXECBUFFER3 ioctl
Message-ID: <Ysc2S2UopeMDnImT@alfio.lan>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-7-niranjana.vishwanathapura@intel.com>
 <b652db18dc2ea6724aae175420192a8fc4fe932d.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b652db18dc2ea6724aae175420192a8fc4fe932d.camel@intel.com>
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
Cc: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> It seems we are duplicating a lot of code from i915_execbuffer.c. Did
> you consider 

yeah... while reading the code I was thinking the same then I see
that you made the same comment. Perhaps we need to group
commonalities and make common library for execbuf 2 and 3.

Andi
