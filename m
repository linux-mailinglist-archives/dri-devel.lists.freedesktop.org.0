Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED0D881706
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 19:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F3910E5A6;
	Wed, 20 Mar 2024 18:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DBEDFaCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5229D10E1CF;
 Wed, 20 Mar 2024 18:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710957791; x=1742493791;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LK2peCM+6ulC4Y1PdKmTswKWjTlonY5Ab0f7U8l24bg=;
 b=DBEDFaCHka0A5i5va4M4CxW12JN5KyM26L6t2WV26lFn38fMmSSveStv
 z+9pCEUIkeWmGyOET1Y0mkc51EY28NXWYmnlgv1eBcdd5H1df8I0lD2YR
 nEtWnSbCV02z/E9UYmAfx5n5bLMEiB/8DolU8ZVm8kpnqPv/t8Zd8lPrc
 iXhoGNZ3+Ugo0HCnPVQHUReqail5WsAhF/6k0/M8Oyx8R8oCD1DUbHtNm
 gaqrJl+Mma4febg6vDvdtdaVxp3YFjalOjQ6KyS+LdTRjy3NrdjWY7/5U
 AyBxSq4nyg7QQ3gdgwT4du/YdbrZmtoSo0eCTPaaxtUlho8noT6GsOZ1P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="28376203"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="28376203"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 11:03:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="37340658"
Received: from unknown (HELO intel.com) ([10.247.118.186])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 11:02:58 -0700
Date: Wed, 20 Mar 2024 19:02:52 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v6 0/3] Disable automatic load CCS load balancing
Message-ID: <ZfskzEC_ToR9o-Xc@ashyti-mobl2.lan>
References: <20240313201955.95716-1-andi.shyti@linux.intel.com>
 <Zfr7hPs_VAUkTNTX@ashyti-mobl2.lan>
 <3fe26c42-cc34-42b2-a5cc-21a6a9468b4e@ursulin.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fe26c42-cc34-42b2-a5cc-21a6a9468b4e@ursulin.net>
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

Hi Tvrtko,

On Wed, Mar 20, 2024 at 03:40:18PM +0000, Tvrtko Ursulin wrote:
> On 20/03/2024 15:06, Andi Shyti wrote:
> > Ping! Any thoughts here?
> 
> I only casually observed the discussion after I saw Matt suggested further
> simplifications. As I understood it, you will bring back the uabi engine
> games when adding the dynamic behaviour and that is fine by me.

yes, the refactoring suggested by you will come later.

Thanks,
Andi
