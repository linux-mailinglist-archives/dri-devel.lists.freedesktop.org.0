Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA731BC60B9
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 18:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E310010E1CF;
	Wed,  8 Oct 2025 16:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hbeF+zyb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21A810E1CF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 16:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759941534; x=1791477534;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XriFzHCzmNjbfGVvzdNQmK+gEvaKbI5TKW2Zc0gxcss=;
 b=hbeF+zybdF3V3y9qvlnTuwBYTl5eqFtQNGf/BcBa1pdSLR704xVSN0No
 kPzm31zMDng+O0HsqFR04naWBjtpN9781TTC/Ben9qph/w0zYvqnKnfrJ
 kCL6GKl5C19nax7rspkkdDkbPg67dfUGxKTQLU4tvBHLj5cvd5rGmZ3mt
 leXY+QUCQehGjKj9tgm3Fk2QmG27856wgit/SliCsOhZV7kpjow73Y2Ho
 VjvCXJjvo7sM1bWan2A0GiQRTZkZb2Lgj1S3Ia0VmFgqEpRBn68sQEA2t
 d7vtVY3EXPJpXt44pUmu64Wab9IUO9o4V5Dy1awjy7JRzkpj7JEEbEuoS g==;
X-CSE-ConnectionGUID: DDu7RajCSjS5AwmHgWNn/Q==
X-CSE-MsgGUID: srVKiR6FRMeRGFXLZaRSCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61846252"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="61846252"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:38:54 -0700
X-CSE-ConnectionGUID: P9zyv++TSuCPQBkv+mACFA==
X-CSE-MsgGUID: kNJaBWxzTrC/y/9RrL2kgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="204193711"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.246.18.173])
 ([10.246.18.173])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:38:53 -0700
Message-ID: <3dcf8257-1e45-40d9-acec-ab6e3b98fb0a@linux.intel.com>
Date: Wed, 8 Oct 2025 18:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Update JSM API header to 3.33.0
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com,
 lizhi.hou@amd.com, Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20251007083451.2816990-1-karol.wachowski@linux.intel.com>
 <deda2750-6b8d-45be-b7a4-1dfd9d166775@oss.qualcomm.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <deda2750-6b8d-45be-b7a4-1dfd9d166775@oss.qualcomm.com>
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

Applied to drm-misc-next.

On 10/7/2025 4:46 PM, Jeff Hugo wrote:
> On 10/7/2025 2:34 AM, Karol Wachowski wrote:
>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>
>> New API header includes additional status codes and range definitions
>> for error handling and improved API documentation.
>>
>> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
