Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 190A6A80CED
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 15:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBA410E238;
	Tue,  8 Apr 2025 13:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMrPSF+u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA9210E238
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 13:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744120395; x=1775656395;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YloKW4Y24uRtH0SSzG3gDMmvDKQlBJfUTCktaaI7hXY=;
 b=QMrPSF+u6CrpBY70atnh464iEVGB4eArnlJ42OnlEow6TZbNPrOg1NXd
 JDGwFe18/1bFoiv2YohqDBBP7TgybESZQHRtjggvvXgJCumCHVTOvoXjZ
 TcSzmLwarvfd5cDfYMPU/gJs/a2CGaFO49Yx0CU+Sg6ANgMhzIxDtd+gm
 +VK/ntSEEKIkLlyB77nQz+83osbHS2ZDRHUx0GWJCh2cQYlS08rmQ7try
 UIpkTwPG8cAbG7tusBVgejJW1nT0RaqWZhydkzIP7g+mK8zi9YqTf5HgO
 CWqhgvOJ1wmknUWWCq52qASyawwrSeM0QyZRkNKJ483RRucVWMlr5p04/ A==;
X-CSE-ConnectionGUID: o6lM2sipTzK8fLPywdZHpg==
X-CSE-MsgGUID: O1EWqpv5Sn2HHwvhaH5Jyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45269448"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45269448"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 06:53:14 -0700
X-CSE-ConnectionGUID: v64n5md9Sz68UlWN4QaD4g==
X-CSE-MsgGUID: +3XY0fOxRJOeTfTWaFK2gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128008080"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.121.109])
 ([10.245.121.109])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 06:53:13 -0700
Message-ID: <1de68a42-52a2-431e-8a5c-5bff746964b7@linux.intel.com>
Date: Tue, 8 Apr 2025 15:53:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add cmdq_id to job related logs
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Karol Wachowski <karol.wachowski@intel.com>
References: <20250401155939.4049467-1-maciej.falkowski@linux.intel.com>
 <7508a003-7a2e-4525-8466-099953e31497@oss.qualcomm.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <7508a003-7a2e-4525-8466-099953e31497@oss.qualcomm.com>
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

On 4/4/2025 5:18 PM, Jeff Hugo wrote:

> On 4/1/2025 9:59 AM, Maciej Falkowski wrote:
>> From: Karol Wachowski <karol.wachowski@intel.com>
>>
>> Add tracking of command queue ID in JOB debug message to improve
>> debugging capabilities.
>>
>> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>
> When reviewing this patch, I noticed the kernel doc for struct 
> ivpu_job does not document cmdq_id.  I think that would cause an error 
> when generating the documentation.  Please address that.

Yes, cmdq_id was added recently without according doc line and I will 
fix that accordingly.

Best regards,
Maciej

