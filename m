Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E6E89F3AB
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 15:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4186410ED15;
	Wed, 10 Apr 2024 13:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBlIPTxW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B81F11334A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 13:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712754371; x=1744290371;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=y4x2HSAxLyaj6ZcVFOVm6/XsavEwdiXNLNJJ1olzqew=;
 b=PBlIPTxWRh0ZVV/DOqh/nwdaSbhNU3PpOCQk7agTHqWY4Yqn+ULKG619
 JMWTyqEPNZ8xNm4NyFX/58MA4QT3iq1Z8SPPTiYez4S0giQ1uRNh54Rtf
 x3bFZrmhrCZkpQ2J13KQgFXg60n8B03tkgYWIJqEYXb4l3NFGPGWIISSY
 H6JkC+c0yeAFSGqX6zNLowI7pAVLaWDB4oabwjKsjZtxAGFiCFpnJ2XWF
 0N+QMFin8lSNU7PUy57a1gVhd0kgNQhdZru9ofa611CKlmF1njNekHa49
 hDE6duOjHtQCbtemE5iqIoNTsZF/d7UkwklkP8IVJm6Beom2/EI+BiEDJ A==;
X-CSE-ConnectionGUID: BH86EVBJSAiibN0CtViVQg==
X-CSE-MsgGUID: 4mF0tXDjT12Li20s9C2dWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8239241"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8239241"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 06:06:08 -0700
X-CSE-ConnectionGUID: pkP61xzyTCmj/tmcT38wIw==
X-CSE-MsgGUID: 9pDF7RrmS8uwYZ1cDWzgYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="57996201"
Received: from unknown (HELO [10.245.245.250]) ([10.245.245.250])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 06:06:08 -0700
Message-ID: <753e5328-ff6f-40ef-8471-2e23195de71e@intel.com>
Date: Wed, 10 Apr 2024 14:06:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/9] drm/ttm/tests: Use an init function from the
 helpers lib
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
 <422541615a890df92140a6d3328b01a1bac1e691.1711117249.git.karolina.stolarek@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <422541615a890df92140a6d3328b01a1bac1e691.1711117249.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 22/03/2024 14:29, Karolina Stolarek wrote:
> Add a new helper function that also initializes the device. Use it in
> ttm_tt test suite and delete the local definition.
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
