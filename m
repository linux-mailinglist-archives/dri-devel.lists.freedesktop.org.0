Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD23E89BAE4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816951122E4;
	Mon,  8 Apr 2024 08:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="isJxViiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8665F1122DF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 08:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712566349; x=1744102349;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HZDVe5IXuaJzKYIyFMZ7jCk4tVodzuka2j1sl4DQPFQ=;
 b=isJxViiBN+P2wzAYcuuo3cg0iKdpgthVAJtQD7o6AoqYmUQGlJ8a9Fld
 hKikfUUz9P+TZIMzW8816ZkBygUlTvq5KaJT/P4eUfDLULvDEcfzY+7M7
 uiMD9TYHo5affcgma3FSrj0SSmiucfF33/JZG4N6VerZxsVaZ3IpAgPDR
 hR9taGoRlsD7gjhuaiJAIt+nbgCgOat9Pw0ibT1mIKtbPYQpKcqdbod/y
 OdkV8IkSoQpIce0Iq/AqmQZ9D0MTLUuB7o4yHdUxBGixXpYwPSfybrLyq
 DAGFjAcQzaMsw6DZjPh1Cje485PxnmaiKWzhTXhiUmCObnyIHwNyY4twd A==;
X-CSE-ConnectionGUID: SJ4JaWeLQ0Wo3lMEMaQFcw==
X-CSE-MsgGUID: d3L6q5PSQOSVw6F1amuTsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="19270092"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19270092"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:52:28 -0700
X-CSE-ConnectionGUID: GX8IjpE8SGig+o9I4yckZQ==
X-CSE-MsgGUID: I31GdFPUS62symGhti8AMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19875347"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.246.3.118])
 ([10.246.3.118])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:52:27 -0700
Message-ID: <c041f109-aa9e-43db-921f-726292b9a3f7@linux.intel.com>
Date: Mon, 8 Apr 2024 10:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] accel/ivpu: Return max freq for
 DRM_IVPU_PARAM_CORE_CLOCK_RATE
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, stable@vger.kernel.org
References: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
 <20240402104929.941186-7-jacek.lawrynowicz@linux.intel.com>
 <5a4d8fa1-a537-7690-b712-57391a192fa3@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <5a4d8fa1-a537-7690-b712-57391a192fa3@quicinc.com>
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


On 05.04.2024 17:26, Jeffrey Hugo wrote:
> On 4/2/2024 4:49 AM, Jacek Lawrynowicz wrote:
>> DRM_IVPU_PARAM_CORE_CLOCK_RATE returned current NPU frequency which
> 
> Commit text should be present tense, so returned->returns

OK

>> could be 0 if device was sleeping. This value wasn't really useful to
> 
> also wasn't->isn't

OK

>> the user space, so return max freq instead which can be used to estimate
>> NPU performance.
>>
>> Fixes: c39dc15191c4 ("accel/ivpu: Read clock rate only if device is up")
>> Cc: <stable@vger.kernel.org> # v6.7
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> With the above,
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
