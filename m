Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6DB4BD957
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 12:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7179E10E342;
	Mon, 21 Feb 2022 11:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F80F10E2A0;
 Mon, 21 Feb 2022 11:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645442078; x=1676978078;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=TvbJ3vSGodYfMyTTYBnSkODUNvzL55ny9Q8+ODOW3i4=;
 b=k67DTYTHm4r8/26riIR4zKFzk+6VmcmI2NyR+QQRUIZQlvB5vR/KrxjJ
 +ULNOq/QJfio+gaS1ffcA/5LMQe9l7zybc8xg/x2H/x7+VovnpvO1o0Hg
 68qrS7/9PvmFB6rqnlR2kttTZy0kL8ItWhxeMRLnWx+lTV4kOIo2SVMKQ
 oSwvw1DL9QA0raIW8S5uGoAL0RP4SpQuZqyuHnN2htDILCkArI9KnsvPN
 uR+ulkznNLPCNq5turcSyeckdHkrizxPzp55/wXEBLlQBgZpmvwY2gD2/
 mYdT2Vr/EJUIFBU920wYjzNA/8Fs8ATuIdxhBkvx+QAqvUtCdvE3VTLzj Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="235029872"
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="235029872"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 03:14:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="531820779"
Received: from mkilleen-mobl1.ger.corp.intel.com (HELO [10.213.218.216])
 ([10.213.218.216])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 03:14:35 -0800
Message-ID: <c00c7999-79d1-7c3e-d4e8-df2a887834d8@linux.intel.com>
Date: Mon, 21 Feb 2022 11:14:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 6/7] drm: Document fdinfo format specification
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20220106165536.57208-1-tvrtko.ursulin@linux.intel.com>
 <20220106165536.57208-7-tvrtko.ursulin@linux.intel.com>
 <YegpiY3MU15RsEfk@phenom.ffwll.local>
 <CAF6AEGs58S7U=1nso=0BAURUuobeUam4V0j1W7ZsrK5W7MqRvw@mail.gmail.com>
 <423c8ff1-3a4b-3e69-8561-3056c7d2d20f@linux.intel.com>
 <fb6f1a2c-6e23-cfdf-2ce5-80209a005227@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <fb6f1a2c-6e23-cfdf-2ce5-80209a005227@linux.intel.com>
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chris Healy <cphealy@gmail.com>, David M Nieto <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Rob,

On 25/01/2022 10:24, Tvrtko Ursulin wrote:
> 
> On 21/01/2022 11:50, Tvrtko Ursulin wrote:
>> On 20/01/2022 16:44, Rob Clark wrote:
> 
> [snip]
> 
>>> If there is a tool somewhere that displays this info, that would be
>>> useful for testing my implementation.
>>
>> I have a patch to Intel specific intel_gpu_top (see 
>> https://patchwork.freedesktop.org/patch/468491/?series=98555&rev=1). 
>> I'll have a look to see how much work would it be to extract common 
>> bits into a library and write a quick agnostic tool using it.
> 
> I factored out some code from intel_gpu_top in a quick and dirty attempt 
> to make it generic and made a very rudimentary tools/gputop:
> 
> https://cgit.freedesktop.org/~tursulin/intel-gpu-tools/log/?h=gputop

Have you managed to spend any time playing with this yet?

The only remaining open was Daniel's mild concern if vendor agnostic 
userspace is possible using the proposed spec. If you managed to wire up 
the compliant exports and gputop tool works I think that concern would 
be settled.

Regards,

Tvrtko
