Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D695A2560B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 10:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBCB10E457;
	Mon,  3 Feb 2025 09:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYN1e/RI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2E410E457
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 09:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738575697; x=1770111697;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YEoQox34Ndp1eZy+pBuuNKne2F4hPZOC+j2hR5c1B1o=;
 b=UYN1e/RI3IKeHk76z+1Oc9rXR8f0b8zbaNP/YRnn5OUNFPuhxZgw/JxK
 iIuI8pi5JVklz8XuUy94DjYWUFP8QKzn4NLOyc9OKFbbw92p40pnDZ+pg
 t1W7CmW/qQS35d/vl+gw/78kTa+Rb/nmgGvKn4TTs4iZdTotW5VX5E7nu
 OYBuKxiMamKdIUDLvAdBplWZpZjsRPU+n3J4uSUhVUX6H9XBXpM4rev3W
 Gwu9dGEPT5bSu1O02KLgfvY2fKueLx5uzuLZua/1iJGHFTRrlp00lsl4k
 E4qDFIb6kg8mTWgF9UPxGD7I4arU9K2CvYebMmRWBcJTKLXmAnkkSAMrz w==;
X-CSE-ConnectionGUID: ELFjfxfoSUCh2+opRUnqDQ==
X-CSE-MsgGUID: rg0KxZOqTLiEaI8peDyHlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39161667"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39161667"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:41:37 -0800
X-CSE-ConnectionGUID: 79z9BgfMRw+BWmS7opDvqw==
X-CSE-MsgGUID: u1N498egSn+egV0HFs5OQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133495726"
Received: from jbolejkx-mobl.ger.corp.intel.com (HELO [10.245.114.74])
 ([10.245.114.74])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:41:35 -0800
Message-ID: <800d0968-0ee3-4124-8659-ffcb39799388@linux.intel.com>
Date: Mon, 3 Feb 2025 10:41:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] accel/ivpu: Add support for hardware fault injection
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com
References: <20250129125636.1047413-1-jacek.lawrynowicz@linux.intel.com>
 <20250129125636.1047413-2-jacek.lawrynowicz@linux.intel.com>
 <e3d8b1ec-25b9-4a96-046a-cc055c27a75e@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <e3d8b1ec-25b9-4a96-046a-cc055c27a75e@quicinc.com>
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

On 1/31/2025 7:41 PM, Jeffrey Hugo wrote:
> On 1/29/2025 5:56 AM, Jacek Lawrynowicz wrote:
>> This commit introduces the capability to simulate hardware faults for
> 
> Nit - "This commit" is redundant.

Sure, removed.
