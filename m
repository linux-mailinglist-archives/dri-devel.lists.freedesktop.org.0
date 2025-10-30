Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DC5C1EE55
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5454110E89D;
	Thu, 30 Oct 2025 08:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NyWnytB4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0765B10E89D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761811344; x=1793347344;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=k30lqWbPxwGC0iAZWsoAkV+WSZ8R8Hw6OSPfo0vLS1Y=;
 b=NyWnytB4yYj38ZWGM8ZckLjwDURzIfeCz208oMjjE3ka0qB1WU8KLpLH
 kZK/J5t7vKN6Kl66g6udYbJy7LH+yu7R2dYdj6eZvfKcEMhefXu7krrS7
 OxvlvqqYIbbvOVIwBkFOF0bVQwZBGppxB8jfc7ZnVPsXssWGBtzpAoEHG
 AMoch35GH1UFLwv9rAkAHurCyexYxCb2elLSkNosqp5cWmgfjpztEP3p9
 jhjKR37TcpdOzaFD3B5U8aR7bgcTSN5uosfpVN6EDtaH7LdbzwBWND0t/
 aS6rAcWECNoi/r9vWDNPbten8cM0OnxC4Kdlm1pM6YyaeQ5XeidmzwABO w==;
X-CSE-ConnectionGUID: +64aWM0KRjiNVHi9PfCydA==
X-CSE-MsgGUID: wSlLVIhuRiOkaYEBPPV7aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63847087"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63847087"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 01:02:24 -0700
X-CSE-ConnectionGUID: u+TT4YDxSym6Qi2UKbM/ew==
X-CSE-MsgGUID: SipdQcmQQuOwdKoyrn1KGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="190222719"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.246.16.226])
 ([10.246.16.226])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 01:02:23 -0700
Message-ID: <03e49fa5-e4f4-48d8-86ec-eb1f8ee13c86@linux.intel.com>
Date: Thu, 30 Oct 2025 09:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Disallow setting sched mode OS starting
 from NPU6
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com
References: <20251029201554.257708-1-karol.wachowski@linux.intel.com>
 <6a8f86c1-0d7e-47ff-bab1-2ba4efa1c766@oss.qualcomm.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <6a8f86c1-0d7e-47ff-bab1-2ba4efa1c766@oss.qualcomm.com>
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

On 10/29/2025 9:17 PM, Jeff Hugo wrote:
> On 10/29/2025 2:15 PM, Karol Wachowski wrote:
>> OS scheduling mode gets deprecated starting from NPU6 onward.
>> Print warning and fallback to HW scheduling mode if OS mode is
>> explicitly selected with sched_mode parameter.
>>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com> 
Pushed to drm-misc-next.
-Karol
