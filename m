Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B3C84956F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 09:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E975C10EECF;
	Mon,  5 Feb 2024 08:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JbS13thF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Mon, 05 Feb 2024 08:34:53 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21E610F0AF
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 08:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707122094; x=1738658094;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HLyRh/M0bKZULpl9daHPQMFlOojudbpl1/HAuYekQY8=;
 b=JbS13thFlrt82Ji+VL3aKYry/XtEVQCknuP1UeSUJfR9zHB1vysBMHlg
 YJeKT/oMwEVB6oXo9Naj2tCXc0mdc1TjbKSx5U0pt2ymTN7iapBhOcHFo
 uP9yP2mHLjdtyXz0nXgCABgDzEiBQcZenkyQX880sRvrPLMo9Ypr4BAOE
 ip1lCbZZc0rQFp83WkPkBrxDfV/ilo9c52q6t/Wi0KOb+qKkPu4mBKFdy
 iylfmfHZmP3HSp+gO4229wz6vX+PSEXbyO1ZsAXcKhCtrj0oRKUbo5oCP
 C8/ItpLuK+pgJ4TCoGQeT/5OoEJT35H0Edz0IWZ397ZNRyUCP9ZL+tOV0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="380348"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="380348"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 00:27:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="661953"
Received: from unknown (HELO [10.245.101.99]) ([10.245.101.99])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 00:27:39 -0800
Message-ID: <acbd2fd2-e140-4bd6-8531-c9a4cb7a5a6b@linux.intel.com>
Date: Mon, 5 Feb 2024 09:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] accel/ivpu/40xx: Enable D0i3 message
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, Krystian Pradzynski <krystian.pradzynski@intel.com>
References: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
 <20240126122804.2169129-6-jacek.lawrynowicz@linux.intel.com>
 <27ef0604-14e5-0447-a5a3-417d071a7724@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <27ef0604-14e5-0447-a5a3-417d071a7724@quicinc.com>
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

On 26.01.2024 19:24, Jeffrey Hugo wrote:
> On 1/26/2024 5:28 AM, Jacek Lawrynowicz wrote:
>> From: Krystian Pradzynski <krystian.pradzynski@intel.com>
>>
>> All recent 40xx firmware already supports D0i3 entry message and this
>> WA is no longer needed.
> 
> Can I assume that the workaround only applies to pre-production firmware?
Yes, this was only affecting very early versions of the FW.
