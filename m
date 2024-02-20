Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B778C85BED4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E417810E48B;
	Tue, 20 Feb 2024 14:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqQTqsrd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6A210E485;
 Tue, 20 Feb 2024 14:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708439641; x=1739975641;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XhoJMIIiZEXk/cs2SQkZGuVZr+98sbrPT6T+HBM3uLc=;
 b=dqQTqsrdjkX5/SZcshP4blxo/rFFSMzZxKE7nQwzAsGtotsPlh66ST5/
 twJE9wG6QqC1UWK8m++Z8RZPyTQIBYJYsRV42fByoSU3SnsZmJzb7LIqa
 p1Thmxkm71+vPDKoyyKBUd9vceeyH8n0XXedQnCqYOPYFcltCqOQKmDUj
 o7AOzNfw7PoJud9MIrAz/pg0V3P4gbjfPtgTO6stFWQhpeOgKzykFR2/9
 nzubg4QsnZdGh7zont20lJ8xaaaxFJpm8TvST2ks0kwgFidSKMAZ8izZJ
 ksyuPmBMWoBtZoF6bFoj41rTBKX/p80tPcdl7SgstZXeFhysrWAnUYlCS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2684567"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2684567"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 06:34:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4756178"
Received: from alichtma-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.246.34.74])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 06:33:58 -0800
Date: Tue, 20 Feb 2024 15:33:56 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 2/2] drm/i915/gt: Set default CCS mode '1'
Message-ID: <ZdS4VH6AmFc5E8vE@ashyti-mobl2.lan>
References: <20240220142034.257370-1-andi.shyti@linux.intel.com>
 <20240220142034.257370-3-andi.shyti@linux.intel.com>
 <62a1a0d1-0972-41fb-b14f-0513f6691baf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62a1a0d1-0972-41fb-b14f-0513f6691baf@linux.intel.com>
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

On Tue, Feb 20, 2024 at 02:27:07PM +0000, Tvrtko Ursulin wrote:
> 
> On 20/02/2024 14:20, Andi Shyti wrote:
> > Since CCS automatic load balancing is disabled, we will impose a
> > fixed balancing policy that involves setting all the CCS engines
> > to work together on the same load.
> 
> Erm *all* CSS engines work together..
> 
> > Simultaneously, the user will see only 1 CCS rather than the
> > actual number. As of now, this change affects only DG2.
> 
> ... *one* CCS engine.

ops... I sent V1 again!

Sorry, I will send v2 now

Thanks!

Andi
