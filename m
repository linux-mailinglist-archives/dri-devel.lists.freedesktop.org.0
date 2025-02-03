Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480E8A255C8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 10:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD2D10E402;
	Mon,  3 Feb 2025 09:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6n5a7Dv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71D110E402
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 09:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738574771; x=1770110771;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SJFludVyIDlGWF2pjlshJbiEj3vv0+v69hNQi28z8ns=;
 b=J6n5a7DvINwTG6B228x3YPbH8mqF/bE2phqwIWESWRCtan11GqW+QQLx
 OoPjKsqbf2ttbtQZAQzyJhah2Qe+l+lyAaPIIizQauqyCSg3mvyVL7PWl
 d6F8s4En4Yzd8ouUUDa0tafsLq62dTO+mVmTDQbN4uNyHdn6h17aLTS6u
 N5Z62SkcehfNUqBMy+bLo5RKZ2gRQeXBWhy2hgX6ZbgCuh1q5LxSJ0/K6
 TMssL3YLG/lgItVadoxdGpigZo+iMAaHiTGAui9B21Bbt9iVscZbficV4
 WAVaET7Yavcs+hl+GswytvplmVK+V9l28A1HyjdnOkNSyf0XjqIiusirr A==;
X-CSE-ConnectionGUID: fXj9c2SmQP6+IlA0Ix+YhQ==
X-CSE-MsgGUID: RqG+Ahz8RdWdvEsG4FPFOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49661029"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="49661029"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:26:10 -0800
X-CSE-ConnectionGUID: 6eePjpHNQoGAW0IudLCTjQ==
X-CSE-MsgGUID: l1GS5vA4QQic+CRx650H+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114257477"
Received: from jbolejkx-mobl.ger.corp.intel.com (HELO [10.245.114.74])
 ([10.245.114.74])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:26:09 -0800
Message-ID: <fe404224-602d-4320-abb2-d34e88cc0414@linux.intel.com>
Date: Mon, 3 Feb 2025 10:26:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] accel/ivpu: Turn on HWS by default on all platforms
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250129125636.1047413-1-jacek.lawrynowicz@linux.intel.com>
 <20250129125636.1047413-5-jacek.lawrynowicz@linux.intel.com>
 <5fac0424-348e-c0b7-9ec6-eb6d3d3d69b1@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <5fac0424-348e-c0b7-9ec6-eb6d3d3d69b1@quicinc.com>
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

Yes and there is a check for FW version in ivpu_fw_sched_mode_select() that verifies this.
It is just above the changed lines from this patch.

On 1/31/2025 7:47 PM, Jeffrey Hugo wrote:
> On 1/29/2025 5:56 AM, Jacek Lawrynowicz wrote:
>> From: Karol Wachowski <karol.wachowski@intel.com>
>>
>> Hardware scheduling (HWS) is supposed to be supported on all existing
>> platform with recent FW including pre-silicon ones. Turn on HWS by
>> default.
> 
> Is there released firmware which does not have this enabled/supported? Should this be a "on by default, if FW VER > X"?
> 
> -Jeff

