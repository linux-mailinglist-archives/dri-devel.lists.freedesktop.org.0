Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81EF8A8591
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 16:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B7310E559;
	Wed, 17 Apr 2024 14:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHq7EwSb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1348910E559
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 14:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713362857; x=1744898857;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mo1aQ8NpP3xTdKvnF1PxZWSIEg7nvBPf4WsI8k0d7lI=;
 b=NHq7EwSbeABhO/9dF6nNzBwdvB9FYpDAojObytnVav/3Q33jmELdvg0h
 LdTxalTz8fD70kKJXivID7F5ztuT+gXI9EB+/plJ2RIMbwBvtaylg4uEV
 Bok9miWOSg3Lb6uL9xv7RIo4DFcqivjPerwmQKbmW9y/f3WI7RwpjE9z2
 RHfU/zZSdlzj/6w8s4WwsaMqivbJiGby7WytrEHu9GsSfCwquhcymK23E
 QCGsfEAC3NgSZ5/ZN5qJO9/PZRAp0ZCj/FYpSZcHvwQDFh/w9w3ksQFz1
 9O88Kl4zSKI2CZK5y/ZZ9Tl+OJhweND41uHIWIE2y8Nvyio2uBsEjQzlH A==;
X-CSE-ConnectionGUID: Kyk/sJApS8aRdOwzSR0NFw==
X-CSE-MsgGUID: l+TxrfXXT22nAVT/iFV5fQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8978606"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8978606"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:07:36 -0700
X-CSE-ConnectionGUID: MUGWtxqQQ7SdnOGBBzJzYg==
X-CSE-MsgGUID: CtlpdsMzTXqWQPpJ9jtqyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="22714436"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.250.221])
 ([10.94.250.221])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:07:34 -0700
Message-ID: <8bdf58b8-87b6-445c-971a-b009abad85d1@linux.intel.com>
Date: Wed, 17 Apr 2024 16:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 02/10] drm/ttm/tests: Delete unnecessary config option
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>
References: <cover.1713357042.git.karolina.stolarek@intel.com>
 <aeca47beb2a59ff7f170941bdf9bd50055fe8dd5.1713357042.git.karolina.stolarek@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <aeca47beb2a59ff7f170941bdf9bd50055fe8dd5.1713357042.git.karolina.stolarek@intel.com>
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


On 4/17/2024 3:03 PM, Karolina Stolarek wrote:
> DRM KUnit helpers are selected automatically when TTM tests are enabled,
> so there's no need to do it directly in the .kunitconfig file.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/ttm/tests/.kunitconfig | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/tests/.kunitconfig b/drivers/gpu/drm/ttm/tests/.kunitconfig
> index 75fdce0cd98e..1ae1ffabd51e 100644
> --- a/drivers/gpu/drm/ttm/tests/.kunitconfig
> +++ b/drivers/gpu/drm/ttm/tests/.kunitconfig
> @@ -1,4 +1,3 @@
>   CONFIG_KUNIT=y
>   CONFIG_DRM=y
> -CONFIG_DRM_KUNIT_TEST_HELPERS=y
>   CONFIG_DRM_TTM_KUNIT_TEST=y
