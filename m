Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BE4BFB4F5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 12:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB5310E72D;
	Wed, 22 Oct 2025 10:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H1LAxPRJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDACB10E72D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 10:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761127677; x=1792663677;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2gWgs3JtkqrQlNaMUerxSTz5OsBLRFl9X1Eoptbmj+U=;
 b=H1LAxPRJbvAmfCA9Y1z1+PvYuM+QwgjaHg/qujkxFwxcRE7YIlD8vyLK
 qQh2agpfwI/XVlwUgQlxBsljJw9f9qRbG/I4yYK8J/CNmKT5QjVA++t3t
 rREYOON1kkwpgnljFSwLlFcp/VAT8GXB9atxK1lmTdWx1mF+U4oygsDjB
 1TMkIkOL6r0NJURx9+DFMLYSJoe8Lib6I3UhZ+/QWisDfwQFGgn+z7qGe
 NhfdiEjpgbau/bGPwNfN01UytuaxTDpU3e7ndjiBJeFWuSuj0YyCxen5G
 m3k0CYJnuqMhfnI9syEg3vsBDt9PhjO8HSb/myqufMmacYWpGdNRjzQOD w==;
X-CSE-ConnectionGUID: 6/LSZedXTVKiR3l5mFf/sA==
X-CSE-MsgGUID: Gf/CuciVT+OpUuFsXtbKBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73875399"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="73875399"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 03:07:57 -0700
X-CSE-ConnectionGUID: sOQyO88fRPmnmtVCeanZ6w==
X-CSE-MsgGUID: waVFlqmcTgeaiFoWUxhojg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="207506486"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.104])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 03:07:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Biancaa Ramesh <biancaa2210329@ssn.edu.in>, sumit.semwal@linaro.org
Cc: christian.koenig@amd.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, lkp@intel.com, Biancaa Ramesh
 <biancaa2210329@ssn.edu.in>
Subject: Re: [PATCH v2] Signed-off-by: Biancaa Ramesh
 <biancaa2210329@ssn.edu.in>
In-Reply-To: <20251022043108.7197-1-biancaa2210329@ssn.edu.in>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251022043108.7197-1-biancaa2210329@ssn.edu.in>
Date: Wed, 22 Oct 2025 13:07:51 +0300
Message-ID: <bc4356efa91d65d5a2407ea8a2cfd54bb697cf4b@intel.com>
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

On Wed, 22 Oct 2025, Biancaa Ramesh <biancaa2210329@ssn.edu.in> wrote:
> -- 
> ::DISCLAIMER::
> 
> ---------------------------------------------------------------------
> The 
> contents of this e-mail and any attachment(s) are confidential and
> intended 
> for the named recipient(s) only. Views or opinions, if any,
> presented in 
> this email are solely those of the author and may not
> necessarily reflect 
> the views or opinions of SSN Institutions (SSN) or its
> affiliates. Any form 
> of reproduction, dissemination, copying, disclosure,
> modification, 
> distribution and / or publication of this message without the
> prior written 
> consent of authorized representative of SSN is strictly
> prohibited. If you 
> have received this email in error please delete it and
> notify the sender 
> immediately.

There are some obvious issues in the patch itself, but please do figure
out how to send patches and generally list email without disclaimers
like this first. Or use the b4 web submission endpoint [1].

BR,
Jani.


[1] https://b4.docs.kernel.org/en/latest/contributor/send.html

-- 
Jani Nikula, Intel
