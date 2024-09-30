Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8568898AAFA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 19:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1642C10E56C;
	Mon, 30 Sep 2024 17:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="da5tOBTU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7F710E570
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 17:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727716762; x=1759252762;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FHuhEfU9lWSFqPb5YI1Y7SIt/hEpmdc5MN8CvGwN8mo=;
 b=da5tOBTU8rXSrHARWAAl+nWZr4NSvb8iZEKdPOOhIcPpwLL97MW+zE5i
 fPY968JVVIzailHAksAQNd3DwhgPqyTHEoOKI5ZtyFuBLmFLsij+OIzoS
 U1MyVSiJ0AW+k+3M76E7nsCgWZfMCTIQB1gIcS9lqG+JciADcYuAsrm3Q
 6BPmwnNQp7+6q1YAu9LHGy9SH5zHjNO4zPA5bobbpgKIuq2u8sGmdwBrv
 2OxamJ2HpdebOOkGq3j8qJJpVxdmJdKfKcScGk1yNqEXQ/YjqeIOCRgrj
 JO4qJWoHeJSGfMHmpN47vVii5KnUK8iV6n2WzQU3MCIJtuRowheXKO47E A==;
X-CSE-ConnectionGUID: rk5zPpMlTLqKNNkhLt78ug==
X-CSE-MsgGUID: ETCeL46sQA6nANebTyB6Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26283197"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26283197"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 10:19:21 -0700
X-CSE-ConnectionGUID: yGBftnxkTK27mxc/8w6Z5A==
X-CSE-MsgGUID: gBgrQl6kTVql7DKu3hYIlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="78212753"
Received: from jpdavis-mobl1.ger.corp.intel.com (HELO [10.246.18.68])
 ([10.246.18.68])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 10:19:20 -0700
Message-ID: <4e48cc84-91ee-4a63-8779-1278b9d30a96@linux.intel.com>
Date: Mon, 30 Sep 2024 19:19:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/29] accel/ivpu: Set 500 ns delay between power island
 TRICKLE and ENABLE
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, "Wachowski, Karol" <karol.wachowski@intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
 <20240924081754.209728-8-jacek.lawrynowicz@linux.intel.com>
 <a2cebc00-82cb-d927-f66b-6d2782330503@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <a2cebc00-82cb-d927-f66b-6d2782330503@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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

On 9/27/2024 10:47 PM, Jeffrey Hugo wrote:
> On 9/24/2024 2:17 AM, Jacek Lawrynowicz wrote:
>> From: "Wachowski, Karol" <karol.wachowski@intel.com>
>>
>> Follow HAS recommendation of 500 ns delay when setting
> 
> "HAS"?
> 
>> AON_PWR_ISLAND_TRICKLE_EN and AON_PWR_ISLAND_EN registers
> 
> Missing "." ?
> 
> 
> Also, you currently have a 500 ns delay when setting both.  Perhaps the recommendation is to have a delay between setting them?
> 

Yeah, I'm definitely going to reword this.
