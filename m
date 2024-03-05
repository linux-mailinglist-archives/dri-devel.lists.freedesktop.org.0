Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE087180C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 09:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D686D10E18A;
	Tue,  5 Mar 2024 08:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DHzRd2ND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260B110E18A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709626789; x=1741162789;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Pco44Jn0AoXW3qDgZjVeFTowyTAynlFylgLFzt14dSY=;
 b=DHzRd2NDRdanHxUZORwXhLG0uRP9hSJwTpd6Cvg1u30nbGmhmcFsEXlz
 3R2Z0EqoxyhnMSqD+WTua1vNdqJfsuQHiE57zRv3qxWmQQ+nJGQHAM/h2
 e+F6Y3TQBW1vTWIjPRJMqepVF7p8Zgbcx1olURcC8zcISn/GoF9ayVgdx
 s7DEwHBIDNuit0WkOlym2XmZbk1zzf9tnI7GBCFNumWFH0MCXAnHU8DRc
 oIDUXrAkbNKbroWuUxADhoFeQMjB9XnUy/CwXcvVB9BeNteZsh5zK2aVh
 Qb97XoS87uYljRVBFollG7tp5MjKWChAV5ZRiTC2r3tX+BoK1pwns0ovm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4023533"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4023533"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 00:19:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9261401"
Received: from omakhlou-mobl4.amr.corp.intel.com (HELO localhost)
 ([10.252.51.143])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 00:19:44 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: dri-devel@lists.freedesktop.org, lkft-triage@lists.linaro.org,
 linux-kernel@vger.kernel.org, Naresh
 Kamboju <naresh.kamboju@linaro.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] powerpc: include linux/backlight.h from asm/backlight.h
In-Reply-To: <87cys9pl55.fsf@mail.lhotse>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com>
 <20240304095512.742348-1-jani.nikula@intel.com> <87bk7u5n9h.fsf@intel.com>
 <87cys9pl55.fsf@mail.lhotse>
Date: Tue, 05 Mar 2024 10:19:41 +0200
Message-ID: <87v8612iqq.fsf@intel.com>
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

On Tue, 05 Mar 2024, Michael Ellerman <mpe@ellerman.id.au> wrote:
> I prefer Thomas' patch, but I'm fine with either to go in via drm.

Thanks!


-- 
Jani Nikula, Intel
