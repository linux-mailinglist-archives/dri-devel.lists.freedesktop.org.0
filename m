Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4876BFB7E8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 12:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EF810E745;
	Wed, 22 Oct 2025 10:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpkCoBEW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4207610E745
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 10:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761130716; x=1792666716;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KiSPvaFbDnqDbnvCoziaMl9Sx2Ffy7oVubq6MTNhiUA=;
 b=GpkCoBEWTGGZPZRjuCjJeJg9rzyQXcGo0TzsySZeCKwbCLGOLN+MZFRS
 Tnv8PDN9j+aFEd34fnt5VzheU4eyGKi4zRuC7uzcz6gTNBVr8UD3aq0ql
 8zdHskynKVdlSh4d/nwjSUud9u3uob0AKosISbJss+QYRdueXK6PqhAkt
 TKk+5X6vygGnFmLptF6Dr4E6A5KGNwg+oozcTPV7fuQBF82qE8Gh6a7MZ
 4Ea6rqKIbd1iAJxoHDiEHaa9z2eJu26E7RF2P6DvW1ZsqKMDgcDJBOqPK
 slDFirlPyptyYu3FfxdgeUkWyUrJAv1BNW7O3YTEUdmRUGoZ2kVsihLln A==;
X-CSE-ConnectionGUID: 064+i++HR6W5yp170LkoSQ==
X-CSE-MsgGUID: IT2FBcrISlW1K0s4eBvXYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62977407"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="62977407"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 03:58:35 -0700
X-CSE-ConnectionGUID: gQF47zjoR9aMzyZX1ZLb8g==
X-CSE-MsgGUID: kM8Z3XCnTGyXW90xC8StvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="187882220"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.17.115])
 ([10.246.17.115])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 03:58:35 -0700
Message-ID: <2b468073-d886-417b-8006-9e9946511076@linux.intel.com>
Date: Wed, 22 Oct 2025 12:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add support for Nova Lake's NPU
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, karol.wachowski@linux.intel.com, lizhi.hou@amd.com
References: <20251021141948.2216735-1-maciej.falkowski@linux.intel.com>
 <0485ac05-38a7-49b1-8928-d3c4a42bf0d3@oss.qualcomm.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <0485ac05-38a7-49b1-8928-d3c4a42bf0d3@oss.qualcomm.com>
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

On 10/21/2025 4:52 PM, Jeff Hugo wrote:

> On 10/21/2025 8:19 AM, Maciej Falkowski wrote:
>> Add support for NPU6 generation that
>> will be present on Nova Lake CPUs.
>> As with previous generations, it maintains compatibility
>> so no bigger functional changes.
>
> Looks like this got word wrapped early. Commit messages can go out to 
> 75 columns if I recall correctly.
Thanks, it will be corrected in v2.

Best regards,
Maciej
>
>>
>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> With that,
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
