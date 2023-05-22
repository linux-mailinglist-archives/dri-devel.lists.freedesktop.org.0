Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7170E70CE4B
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 00:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D10E10E082;
	Mon, 22 May 2023 22:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0E410E082;
 Mon, 22 May 2023 22:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684795697; x=1716331697;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lh6dBMu4WpmuDBNyivRBmoqL2Naz4tgz7qjYLokUsoM=;
 b=KaZab1TRZ1ITCQNq1+p7XCvggAANHRWk2RSbbFwfwgecITOBLYWE9LL5
 HaVJV7I5BSrr9J1zegv97H1XfDBuCN+fUxNcK9ZpX3+CXvi8PKBwRqLiR
 Q541hsLWbL7QpxWCZO/cVPixF5YEprX9Q+Xh2KflFRvLIKVrsEbNJ8Rzv
 V8YHciCqlqmMzSFCW1lS7yRprDWE2A219KwnymoHnfQsTGqg2GdQ6HcKF
 ZC6cfrUmDnhp31Y8cSoVP47x9gBy5ZfFXFKxBwcNtzj/odGZB80dfvlU1
 4GlfWCbTgY06Bu3QT+vNztHfpA+IfRkKz/f3if4b//7j4PKXPpG9mXHJ6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="439418836"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="439418836"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 15:48:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="768713260"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="768713260"
Received: from baumgarp-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.129])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 15:48:15 -0700
Date: Tue, 23 May 2023 00:48:12 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: Move setting of rps thresholds
 to init
Message-ID: <ZGvxLLDiWtoy5JyA@ashyti-mobl2.lan>
References: <20230522115928.588793-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522115928.588793-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Mon, May 22, 2023 at 12:59:25PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Since 36d516be867c ("drm/i915/gt: Switch to manual evaluation of RPS")
> thresholds are invariant so lets move their setting to init time.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
