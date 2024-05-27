Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0F48D0506
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C094F10E36F;
	Mon, 27 May 2024 15:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2M09NG7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD84A10E064;
 Mon, 27 May 2024 15:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716822047; x=1748358047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OYpFPWX5MFAZZJ3uPFCA5wogicim7aflVi2MbDpvz54=;
 b=O2M09NG7eZ4hGB1toDMt/tJxpd99XaPt2/AHybNIOmWe+xtYJ+HyuZPB
 KfVcprUvTql7jg4DPVOngi66956EofaL9ixts4lZyfVHzTjso+z5XO+Te
 KRx9g6TJjDid2QOsdgZBBAju6G+OqfrFxDuDCNdwd53TSWqRLEPitqI0d
 uStLwJbkrdBvu88eBfabUS2Rj8JTOKZijfuEj2Myt8qspKi54vHagWa+I
 jpuYYB0xtMMsI6Mj3dMBsmgFaM9RuPplbqeOK65ClysNnDk5tOgZ49lRu
 J+fF33lmD9xU102sxZ3Joa5XUgonAxYhIJUzfGcx4wSm9SoyGhTVtOn3c w==;
X-CSE-ConnectionGUID: EWj9eOLJQHmGWpOTXl+wQQ==
X-CSE-MsgGUID: N0KZZ1KoSJadwbpJryL2sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="16979278"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="16979278"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 08:00:35 -0700
X-CSE-ConnectionGUID: tYcNymSPQdigvMJK+TNsyA==
X-CSE-MsgGUID: rFhy3SfAR6KzlOGBQvRKeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="57975325"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.157])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 08:00:33 -0700
Date: Mon, 27 May 2024 16:00:25 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2] drm/i915: Increase FLR timeout from 3s to 9s
Message-ID: <ZlSgCVqT5vhW7kKI@ashyti-mobl2.lan>
References: <20240523235853.171796-1-andi.shyti@linux.intel.com>
 <ZlCfMPZpvQJmHybR@intel.com> <ZlRk1Qdr8i2YPITh@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlRk1Qdr8i2YPITh@ashyti-mobl2.lan>
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

On Mon, May 27, 2024 at 11:47:49AM +0100, Andi Shyti wrote:
> On Fri, May 24, 2024 at 10:07:44AM -0400, Rodrigo Vivi wrote:
> > On Fri, May 24, 2024 at 01:58:53AM +0200, Andi Shyti wrote:
> > > Following the guidelines it takes 3 seconds to perform an FLR
> > > reset. Let's give it a bit more slack because this time can
> > > change depending on the platform and on the firmware
> > 
> > But did we see any issue with that?
> 
> yes, we have some FLR expiration timeouts that apparently are not
> able to bring up the device and the memory is not accessible
> anymore. It's worth giving it a bit more time.
> 
> > if that changes per platform and per firmware, shouldn't it all
> > be explicit in the spec as well?
> 
> Is it always documented? We might anyway die after the FLR reset
> failure, so that I see it quite safe to wait and pray a little
> more.

if needed I can improve the log with the dmesg error print.

Andi
