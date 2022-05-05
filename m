Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C76251C0A0
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 15:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542B210E1DB;
	Thu,  5 May 2022 13:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA05B10E1C9;
 Thu,  5 May 2022 13:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651757260; x=1683293260;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=owZLEmZhqfrn3LQawdQQPXBg2algdEqe2NV93yAEiEk=;
 b=KzYebmodYlK8YPHNFn1Dm/bulqfOWDrrC1O0G7B3C5We9aPB51FrxXTX
 wlDiIwwTZ5jiVIR1IwAMVFrV0SP+CIoKN/R/2ytY7OVWRhB+xnWDRaN/k
 DvIvUa2n9mUjRCYIOa/vSweLPh9tG1EMtoGgOksqd7SaL8SYCAtV727aY
 zABggUSFfWRwxpr3VwW/jrI3gK9E98tCZ4POTZeiz6Mtm4sS90L3qNl9z
 5cc5eauJz9DBZlQpHHI1AzmjKv4i5qWDt4oDxuRfgmesBifwricZmIKjZ
 076rkF97cL0qNwHJoHGij/nRwPpHVrlpCJbtSqaaECmvKkmLSuGR8gnN9 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="266947982"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="266947982"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 06:27:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="585320758"
Received: from akshayap-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.249.35.43])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 06:27:37 -0700
Date: Thu, 5 May 2022 15:27:35 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v7 6/7] drm/i915/gt: Create per-tile RPS
 sysfs interfaces
Message-ID: <YnPQxxaMRLXQ8O7u@intel.intel>
References: <20220318233938.149744-1-andi.shyti@linux.intel.com>
 <20220318233938.149744-7-andi.shyti@linux.intel.com>
 <b9651f2f-64dc-78a7-d100-0bd70d1a2493@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9651f2f-64dc-78a7-d100-0bd70d1a2493@linux.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

[...]

> > +static ssize_t act_freq_mhz_show(struct device *dev,
> > +				 struct device_attribute *attr, char *buff)
> > +{
> > +	u32 actual_freq = sysfs_gt_attribute_r_max_func(dev, attr,
> > +						    __act_freq_mhz_show);
> 
> Because sysfs_gt_attribute_r_max_func is only defined if CONFIG_PM is set,
> the !CONFIG_PM builds are broken. I guess just move it to be always
> available.

oh, right! Thanks for letting me know, will fix it.

Thanks,
Andi
