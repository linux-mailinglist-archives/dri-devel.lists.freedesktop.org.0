Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9758E70F618
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 14:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51B610E5D1;
	Wed, 24 May 2023 12:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E1210E5D1;
 Wed, 24 May 2023 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684930808; x=1716466808;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K4WbvBpxF1dymWUKhA0G+Wotyc45QtePSeDvMA8zTu8=;
 b=Unx7JNYoWeNdIgdp4t+krh8uR9Nx24qTF9uRHfrIj1y9ZBovK50vVErw
 pyqQ6RDCLLU9EtwaJmp0D1uB33LY0WJg1k20+3i14OliAUmF1evJg8BPw
 2HDSowmsysdMoWpbdg20uQQefFSQqTgJbakr1MmrftLmLTYcND4YntLfD
 L1F6eH6KEKNCesUKIth/LyN+E5I2RrBu/780/jxDAFPQ01b7U9Zcc1mWp
 6I/KaFFCwwxqhJ6uMJ3EFUAHcljoS9oM/MSFekQU7YDEhAkP+ChvRs1UM
 +n/36MXez55dNXVcCJ3wMwDDF2xjEch5Z2D+6A6yk8GTHKjwjfQJ1JnIc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="417004619"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="417004619"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="794168070"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="794168070"
Received: from dguzhaev-mobl2.ccr.corp.intel.com (HELO intel.com)
 ([10.252.54.61])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:19:31 -0700
Date: Wed, 24 May 2023 14:19:27 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v10 0/2] drm/i915: Allow user to set cache at
 BO creation
Message-ID: <ZG4Az4fWMsxL5j7w@ashyti-mobl2.lan>
References: <20230519051103.3404990-1-fei.yang@intel.com>
 <ZGx7Quf+ArHnXOR0@ashyti-mobl2.lan>
 <37a0e8fc-efbc-973f-f163-235b9482f21c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37a0e8fc-efbc-973f-f163-235b9482f21c@linux.intel.com>
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
Cc: fei.yang@intel.com, Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

> > finally... pushed in drm-intel-gt-next! :)
> 
> I had to revert this (uapi commit only) by force pushing, luckily it was the
> top commit.

OK, sorry!

> 1)
> IGT is not merged yet.

if igt is merged without the kernel it would fail, though.

> 2)
> The tools/include/uapi/drm/i915_drm.h part of the patch was not removed.

Will follow up on these two points.

Andi
