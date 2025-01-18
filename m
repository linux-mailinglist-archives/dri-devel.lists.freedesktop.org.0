Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708E4A15E65
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2025 18:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362BE10E294;
	Sat, 18 Jan 2025 17:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTZJl8df";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3D210E02F;
 Sat, 18 Jan 2025 17:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737222452; x=1768758452;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kx1ct7agPd2HSLiHpGRUg/AgqfvoYz0KI7po2cTKXpM=;
 b=aTZJl8dfhGXnudjBf3l3b/3+xteo5kQXpfBeRzQ5kZ9FWEzatOtm1ZLP
 QLG0FdubqBpYUdkFvUkLU84e9VoVWV+Z8VJmfC0QjmKH7+5T1JGjzxDBf
 OuQN6kPCQlVRA1xnOGTcdgcabzu3cwjR4wnh2QWQQ1T/npjXhSnc0uPxb
 TxjoqMSADxgmLC+BI4L7Pd6BCbAbHj9OoQIYo9Lw3S8tLB9cvsHH3UWn3
 HkNrw5VoWlLUvcZXphLn8io2p0F67HF0Ox1VYbB+JItqkoDsYAgdLPTM2
 v8x7tgEyQQrb/L5WYuCmz3DIM4u5dn5NDBiGfwYwt1SqKoliQPFsT4dvI Q==;
X-CSE-ConnectionGUID: eD+wbbqzS+e7QbRFuSfT+g==
X-CSE-MsgGUID: Ezp4evIKQ3KloTXx01cyIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="41398586"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; d="scan'208";a="41398586"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2025 09:47:31 -0800
X-CSE-ConnectionGUID: /Ivs53+pRee1f4QJxAJGVA==
X-CSE-MsgGUID: Gq+Ui8EaS5ezu0exKTJCZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="111069145"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 18 Jan 2025 09:47:29 -0800
Received: from [10.245.96.215] (kshkilev-mobl4.ger.corp.intel.com
 [10.245.96.215])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4A7C832C91;
 Sat, 18 Jan 2025 17:47:28 +0000 (GMT)
Message-ID: <4f62fe21-2641-40ba-ace4-1429389068f5@intel.com>
Date: Sat, 18 Jan 2025 18:47:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/i915/slpc: Add sysfs for SLPC power profiles
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250117215753.749906-1-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250117215753.749906-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 17.01.2025 22:57, Vinay Belgaumkar wrote:
> Default SLPC power profile is Base(0). Power Saving mode(1)
> has conservative up/down thresholds and is suitable for use with
> apps that typically need to be power efficient.
> 
> Selected power profile will be displayed in this format-
> 
> $ cat slpc_power_profile
> 
>   [base]    power_saving
> 
> $ echo power_saving > slpc_power_profile
> $ cat slpc_power_profile
> 
>   base    [power_saving]
> 

is that output aligned with the sysfs rules? from [1]

"Attributes should be ASCII text files, preferably with only one value
per file. It is noted that it may not be efficient to contain only one
value per file, so it is socially acceptable to express an array of
values of the same type.

Mixing types, expressing multiple lines of data, and doing fancy
formatting of data is heavily frowned upon. Doing these things may get
you publicly humiliated and your code rewritten without not"


[1] https://www.kernel.org/doc/html/latest/filesystems/sysfs.html#attributes

