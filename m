Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B631A7ADAC5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14C310E26A;
	Mon, 25 Sep 2023 14:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2012110E26A;
 Mon, 25 Sep 2023 14:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695653946; x=1727189946;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8UZGcVkG1nS2n5s6l7fxKtmJ88zfeVjcLGHwsUYN9Is=;
 b=HhRzesjYsROwyqT+MpRBDX0s2OBq/lzTVRfMO3xdx+AAMQ7y/sJCSyW+
 7TlBHP4Lqcz8CT3QEtAXie1bWK843km0QbSc/rjLRyLhISDMtkLMnFc6m
 ymI5trx26qtwVeXMAHTqNrpqpQ8P6jZcfWjTUGMf/Y0gVTnWrQiEPoX1N
 dPXzJNvV5x5qvyLQUJTl6OAt8N6nxlKaDh/aGG1ENCeoy+5vL/XjhP6PK
 8643DsvqiSaXV/dIEyqS+wVpH4FWVf6HnDXjaWBOVM67CYGiZOguIV4ok
 fnntYMBzRkrz3NATdIqc2J3rPDaaoAqqjBOAcZMCLNwhpVjV9pLHzR3kG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380144274"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="380144274"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="725011009"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="725011009"
Received: from nurqayrx-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.213.34.118])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:59:01 -0700
Date: Mon, 25 Sep 2023 16:58:56 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Zap some empty lines
Message-ID: <ZRGgMIL53LMhlsyq@ashyti-mobl2.lan>
References: <20230920085715.6905-1-tvrtko.ursulin@linux.intel.com>
 <ZRGVsijpw4hjzYNz@ashyti-mobl2.lan>
 <1ab10838-0517-3ad9-c92e-e452f5b97d30@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ab10838-0517-3ad9-c92e-e452f5b97d30@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Mon, Sep 25, 2023 at 03:28:27PM +0100, Tvrtko Ursulin wrote:
> 
> On 25/09/2023 15:14, Andi Shyti wrote:
> > Hi Tvrtko,
> > 
> > On Wed, Sep 20, 2023 at 09:57:15AM +0100, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > 
> > > Recent refactoring left an unsightly block of empty lines. Remove them.
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> > > Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > > Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > 
> > as this isn't merged yet:
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Thanks, I am catching up with things and this wasn't so important. If you
> have a spare moment feel free to push it?

All right, pushed to drm-intel-next :)

Thanks,
Andi
