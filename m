Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C15FCB4A244
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 08:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292BC10E626;
	Tue,  9 Sep 2025 06:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKYSR3fk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD8610E626
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 06:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757399444; x=1788935444;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Sc0AlrHEuuqIDsAMjno5tS1ebxOGfZrnDqw+DIZdtmg=;
 b=SKYSR3fkyObiC3sw27TThctIswUN9gJvNgTDIyCGbWIUZVbt+mA52s6V
 Mx3nCidzcDuUwSM8P0PiP/2/5sTR1sAj8dtz7DRN6tFYfM6K8klOb/Vq7
 8xeOsGLfX+e0UOCts67dWolaESSI9aWSNcv+1xkwiDRG80jRuZTCX+vzN
 YwjE6hxHFGiYeFSNJQPQi7nlEgytE+z6ht+N3xOI+RsHBy7J+BkTxzkki
 oLM+JER3q48a2+inmIgfY5ma1L3Y9ldqIU+963r8WY3AtYSQSWPBWFlZe
 diesl7QCbY4cVauS4IMgs5/P8kcAkgT/idjt5ZjiyQzR2GWMnF9eEGw7A g==;
X-CSE-ConnectionGUID: CxBLNP0pSjOKBI3g1HQHqw==
X-CSE-MsgGUID: 1NgZJAzbR2S138wHMuyVNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59819187"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="59819187"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 23:30:40 -0700
X-CSE-ConnectionGUID: 8b7+0R3bTxiChmjdVHjtog==
X-CSE-MsgGUID: 8IU7RMyxTCiPoIYkgKZcgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="172875206"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.247])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 23:30:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas Moreno <lucasgabmoreno@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [BUG] Lenovo D330-10IGL: Blank screen issues with DSI display
 on Gemini Lake
In-Reply-To: <CAND3jMbggtne5+SL7h8Ojkv2yV1oqrBCTB2X55WB+_dkUJu5gg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAND3jMbggtne5+SL7h8Ojkv2yV1oqrBCTB2X55WB+_dkUJu5gg@mail.gmail.com>
Date: Tue, 09 Sep 2025 09:30:33 +0300
Message-ID: <44b90c861a01e509a52a31598d6b842cc6e67821@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 04 Sep 2025, Lucas Moreno <lucasgabmoreno@gmail.com> wrote:
> I'm writing to report a recurring issue with the DSI display on my
> Lenovo D330-10IGL. The screen randomly goes blank. I've observed this
> problem across multiple Linux operating systems and kernel versions,
> which suggests it's a driver-level issue.

Please file a bug over at [1].

Thanks,
Jani.


[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


-- 
Jani Nikula, Intel
