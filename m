Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CB26E0D84
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 14:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7002510E138;
	Thu, 13 Apr 2023 12:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A186210E138
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 12:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681389254; x=1712925254;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MU4fRCyHlw+K80yyKp3PwcJ9FoIrmEPUgqNVBor1JjA=;
 b=l+3qn+g+KtkA3/4txPaMG7p9hTfoRrT6GsV38Swu1iolLUYhiITTa/Rt
 zE3nkOaMkbatcwu/QatPSEAtdbjxMoY5AcFCZ55HlhwdF5NZfujlzaj/L
 goJg7/u/V5gXrkA1AXCeym4bADHKDa5xDy6BxkseuJJioedQQAvihL256
 xv7JMFmnCmGo6e5KBjQCfyas+l8CH5KiX1ka7P5fmOPClDhLkY4aF8fbb
 plFYojb716ugD2H8U9N1AotxoJeBs2hUijYCOeul5s7qwmSMEfMMXSGbH
 xHspcnoVIjubbJ+thhrhbt2pvbuL1at3QfkpKEldSMXwSMlX9Tl3tvpn1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="430455729"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="430455729"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 05:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="753983922"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; d="scan'208";a="753983922"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 05:33:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v2 0/2] Imagination Technologies PowerVR DRM driver
In-Reply-To: <20230413103419.293493-1-sarah.walker@imgtec.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230413103419.293493-1-sarah.walker@imgtec.com>
Date: Thu, 13 Apr 2023 15:33:49 +0300
Message-ID: <87bkjsarma.fsf@intel.com>
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
Cc: faith.ekstrand@collabora.com, gfx-opensource@list.ti.com, airlied@linux.ie,
 afd@ti.com, detheridge@ti.com, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, rs@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Apr 2023, Sarah Walker <sarah.walker@imgtec.com> wrote:
> The code in this patch, along with some of its history, can also be found here:
> https://gitlab.freedesktop.org/frankbinns/powervr/-/tree/powervr-next

FYI patch 1/2 is likely so big that it gets dropped by the list.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
