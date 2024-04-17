Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E418A855C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 15:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A93113550;
	Wed, 17 Apr 2024 13:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HlD7cwf/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C9211354D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 13:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713362090; x=1744898090;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=N8As3IAc8HqYZSrLyR07VUrAdOTpVY2E9yx2giGMswQ=;
 b=HlD7cwf/ANlEoF2atsQvLr2uilaJmqEK/jGcDRsDBXqcJsipaklN01Qy
 UprbrdKgUYMH4x0E/FWXWOiDx6z5m+RpwHAz+junwQpzfb+EE5mOKy5Kj
 Go3XL0yiv43X7aaJSV67a7dBVHXAW2JhGQRWJE6tNdGDRBsAKgNwk+5wJ
 MqfppvIkZWIFSh0tD3/L4WtepBmgRGIHKv0CIn1qA1wn5Q2VsQqrQ0Rnv
 OnXUorOX0fBrgDDpiY9WOR8+4UunYUzwSHHEyAxm1W/mLlgLY731iza2c
 aS5NJCXLNWzRzyp141O2J7bLkK4Gppb4SzMhxWt8RM5fLZKR+Pt4LJZXC w==;
X-CSE-ConnectionGUID: AEQgleo3SEu2f3XhYZuvQw==
X-CSE-MsgGUID: evWyeVSiSre4Hsumm8FAkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20243999"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="20243999"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:54:50 -0700
X-CSE-ConnectionGUID: GEOu9hMqTZK7asUIn/b1/w==
X-CSE-MsgGUID: ALsgIRh1R32+GQikec7Jqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53577795"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.250.221])
 ([10.94.250.221])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:54:49 -0700
Message-ID: <135f0815-82cc-48ec-8df9-e67864bd2db9@linux.intel.com>
Date: Wed, 17 Apr 2024 15:54:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/10] drm/ttm/tests: Set DMA mask in KUnit device
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>
References: <cover.1713357042.git.karolina.stolarek@intel.com>
 <b73b911c18c2d1a0eab954e6dc53cbc10461758c.1713357042.git.karolina.stolarek@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <b73b911c18c2d1a0eab954e6dc53cbc10461758c.1713357042.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
> In commit d393acce7b3f ("drm/tests: Switch to kunit devices"),
> DRM test helpers migrated away from using a dummy platform driver
> in favour of KUnit device. This means that DMA masks for the device
> are not set but are required by ttm_pool_alloc tests.
>
> Set the DMA mask for coherent mappings to unblock testing.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index 7b7c1fa805fc..cb1cd676f8ae 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -98,6 +98,9 @@ struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)
>   	devs->dev = drm_kunit_helper_alloc_device(test);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, devs->dev);
>   
> +	/* Set mask for alloc_coherent mappings to enable ttm_pool_alloc testing */
> +	devs->dev->coherent_dma_mask = -1;

DMA_BIT_MASK() would be nice here. I wonder if it make sense to move 
that to kunit device related calls,  anyway this is:

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> +
>   	devs->drm = __drm_kunit_helper_alloc_drm_device(test, devs->dev,
>   							sizeof(*devs->drm), 0,
>   							DRIVER_GEM);
