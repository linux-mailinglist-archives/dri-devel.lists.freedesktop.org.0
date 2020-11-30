Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A502C8A9C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 18:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3F26E5C6;
	Mon, 30 Nov 2020 17:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F8A6E5C6;
 Mon, 30 Nov 2020 17:17:22 +0000 (UTC)
IronPort-SDR: 2eaUpbIFrh4FDT3Pal7BGC10TOnJO6a+rqPHx9LlN2hRhDNlG6v0M6k+ZawAXWl2m17evDRH71
 yFELI4ueWqWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="152505818"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="152505818"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 09:17:21 -0800
IronPort-SDR: 94v0um+5DRBaFXUti1AWuNxEB+cAO2dLMI73c4xMW501IrrP8Ra9nNVxvOdKixkFNKi3bT2xVR
 kN05sLUqEzkg==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="538672532"
Received: from ekiperwa-mobl.ger.corp.intel.com (HELO [10.252.22.113])
 ([10.252.22.113])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 09:17:20 -0800
Subject: Re: [Intel-gfx] [RFC PATCH 124/162] drm/i915/lmem: allocate HWSP in
 lmem
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-125-matthew.auld@intel.com>
 <160648535829.2925.3905288434672946602@build.alporthouse.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <9ccd22f4-875b-7ac8-253c-06aab009b3e4@intel.com>
Date: Mon, 30 Nov 2020 17:17:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <160648535829.2925.3905288434672946602@build.alporthouse.com>
Content-Language: en-GB
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 Michel Thierry <michel.thierry@intel.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/11/2020 13:55, Chris Wilson wrote:
> Quoting Matthew Auld (2020-11-27 12:06:40)
>> From: Michel Thierry <michel.thierry@intel.com>
> 
> Rationale goes here.
> 
> Is this wise? HWSP is very frequently read by the CPU, and expected to
> be cached on the CPU.
> 
> What do the performance profiles indicate?

Do you have a recommendation for an existing selftest or IGT to help 
measure this?

Also are you suggesting moving this to system memory, or just using a 
different mapping type, if it's placed in local memory? Or maybe try 
both? Although I'm pretty sceptical about !wc for local memory.

> -Chris
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
