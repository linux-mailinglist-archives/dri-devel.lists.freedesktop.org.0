Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4958CFE55
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 12:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38E510E0FD;
	Mon, 27 May 2024 10:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GX/R7fyx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3344110E0FD;
 Mon, 27 May 2024 10:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716806880; x=1748342880;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iNFQ7o+1ofjztuvjdIzNE+iV2ceTEh/py0eSks+HeNE=;
 b=GX/R7fyxk44p6s15N/yJ8zgF9CSZ5oKWiumG6ZyecSlGWX+mDnVVqDbr
 kmyebtUsGqXtDu+lkV7CuWo+VXmIbK+D6jLqlR5ja/irGYeDLaSbIE2V7
 Byc3Vn6mMIRjpEJ84O86euF9RwrX9s2VvH6KZNbxsRjwYCj7RrWSGjpGL
 KqEkJl9SiMZjG2lJcfLZXyGeRv6sQhZXP3wUZ39UMtHWp9ixN9piGZZUv
 M47L/fS54fqOWXVPGyq5lgf0QS15pewCeqB4lBbpvcmagNhI9wkSVOFHx
 9DdeTrYRSwxskn6Ik3zMtgQOENBNUqj1Zr3Hh+jvlbx6Q/L41LwxGZbAC g==;
X-CSE-ConnectionGUID: PcFD7nq/RjS3una0lXdtuA==
X-CSE-MsgGUID: oowZZ9C1RR+xPqdXLkGWDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="12967237"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="12967237"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 03:48:00 -0700
X-CSE-ConnectionGUID: Iv/5M7qDQBWsLo9dj8BAtA==
X-CSE-MsgGUID: MG0CKHZnT+qLC06qeiHCJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34805621"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.157])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 03:47:58 -0700
Date: Mon, 27 May 2024 11:47:49 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2] drm/i915: Increase FLR timeout from 3s to 9s
Message-ID: <ZlRk1Qdr8i2YPITh@ashyti-mobl2.lan>
References: <20240523235853.171796-1-andi.shyti@linux.intel.com>
 <ZlCfMPZpvQJmHybR@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlCfMPZpvQJmHybR@intel.com>
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

On Fri, May 24, 2024 at 10:07:44AM -0400, Rodrigo Vivi wrote:
> On Fri, May 24, 2024 at 01:58:53AM +0200, Andi Shyti wrote:
> > Following the guidelines it takes 3 seconds to perform an FLR
> > reset. Let's give it a bit more slack because this time can
> > change depending on the platform and on the firmware
> 
> But did we see any issue with that?

yes, we have some FLR expiration timeouts that apparently are not
able to bring up the device and the memory is not accessible
anymore. It's worth giving it a bit more time.

> if that changes per platform and per firmware, shouldn't it all
> be explicit in the spec as well?

Is it always documented? We might anyway die after the FLR reset
failure, so that I see it quite safe to wait and pray a little
more.

Andi
