Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA4548CB4F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 19:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB66D10E94C;
	Wed, 12 Jan 2022 18:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E9610E94C;
 Wed, 12 Jan 2022 18:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642013520; x=1673549520;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kjL8J5vrcBp8hsG9erqqQFQ5BWWZEBAYXrb+voL3bHA=;
 b=PSpjmcvaf+LxBJWxtxPbz8oYAzgrdDb7mkbd4zE1ZaPbWPZmUMTLzXLz
 VhTnkJMmqPW92oqHc9QDBRVaKUBHg58Q53OQLNeAagJ7sDIRaaRX+5tom
 wRzKyPQ4AuFpyo158t2RSWmgR/B2wGciWL0FZoQ8+gxbQR+vRJNJnGs4q
 dyR1FjbBAdzDP4m5/xY3TJR56LIJWloi/CIgRSbco4EBSsYWIQE2bGZp9
 cNqfsQi5elVrnPG7WNhptPL2bfWt4iyOvAo3/W6IRT7HLJBLA8jPV8b03
 r5o8JhbvDGxcBKktgHdOk+wJoSjTUQZjEmDK9tAJx8l4t3zxnSoddCQ1+ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="330169998"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="330169998"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 10:46:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="529319484"
Received: from erozenmx-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.217.143])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 10:46:54 -0800
Date: Wed, 12 Jan 2022 20:46:51 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gt: make a gt sysfs group and move power
 management files
Message-ID: <Yd8iG73L08xx7AYc@intel.intel>
References: <20220111121552.35679-1-andi.shyti@linux.intel.com>
 <20220111121552.35679-3-andi.shyti@linux.intel.com>
 <cc9f4f9b-377e-1a59-1acb-fb492e4bb5c8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc9f4f9b-377e-1a59-1acb-fb492e4bb5c8@intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Andi Shyti <andi@etezian.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sujaritha, 

[...]

> > +static ssize_t act_freq_mhz_show(struct device *dev,
> > +				     struct device_attribute *attr, char *buff)
> Alignment with the initial (

OK

[...]

> > +static INTEL_GT_RPS_SYSFS_ATTR(RP1_freq_mhz, 0444, rps_rp_mhz_show, NULL);
> > +static INTEL_GT_RPS_SYSFS_ATTR(RPn_freq_mhz, 0444, rps_rp_mhz_show, NULL);
> > +
> Multiple blank lines

OK

[...]

> I think the patch should be good to go barring the whitespace/alignment
> checks.

Thank you, will fix those and resend it,
Andi
