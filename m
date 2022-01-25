Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDA149B143
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 11:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F235089831;
	Tue, 25 Jan 2022 10:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5185510F172;
 Tue, 25 Jan 2022 10:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643106279; x=1674642279;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=8i5dxjzshuVt9TEk1BvigWvWAg55YDSisaiP4h4fH64=;
 b=EzkUheao18b1YggKuRSdYUPwCPXncnhAS9gfAflnFMBptT/yqLRFgrWK
 UuRwH1kb0QlohgDnQhHFacON/iQAsc6sH916lzRErnTXh07PJEeKBlugz
 cbT116XfFtBVYZ39Wrd+H87k7H+JHVpGesVX/kV5mfwoIbHYmKNrdN3e7
 uIn5ms/nOscfL1GY1MsLsQDrfQGBoj/IW7139/DFMWd1jiQC3TydpfuhI
 lrrM27AaU5mkaKQCn/6eeFWknsNeL2d8mvswL8A87wQiutqdk2ytFP17L
 utSK1saG4xf1715vsCHhX7LHZwoaGyXQE4QdCuY189pDoP5PbcLEJGWci Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="226249317"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="226249317"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 02:24:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="532377901"
Received: from thpham-mobl1.amr.corp.intel.com (HELO [10.213.172.16])
 ([10.213.172.16])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 02:24:37 -0800
Message-ID: <fb6f1a2c-6e23-cfdf-2ce5-80209a005227@linux.intel.com>
Date: Tue, 25 Jan 2022 10:24:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH 6/7] drm: Document fdinfo format specification
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20220106165536.57208-1-tvrtko.ursulin@linux.intel.com>
 <20220106165536.57208-7-tvrtko.ursulin@linux.intel.com>
 <YegpiY3MU15RsEfk@phenom.ffwll.local>
 <CAF6AEGs58S7U=1nso=0BAURUuobeUam4V0j1W7ZsrK5W7MqRvw@mail.gmail.com>
 <423c8ff1-3a4b-3e69-8561-3056c7d2d20f@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <423c8ff1-3a4b-3e69-8561-3056c7d2d20f@linux.intel.com>
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chris Healy <cphealy@gmail.com>, David M Nieto <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/01/2022 11:50, Tvrtko Ursulin wrote:
> On 20/01/2022 16:44, Rob Clark wrote:

[snip]

>> If there is a tool somewhere that displays this info, that would be
>> useful for testing my implementation.
> 
> I have a patch to Intel specific intel_gpu_top (see 
> https://patchwork.freedesktop.org/patch/468491/?series=98555&rev=1). 
> I'll have a look to see how much work would it be to extract common bits 
> into a library and write a quick agnostic tool using it.

I factored out some code from intel_gpu_top in a quick and dirty attempt to make it generic and made a very rudimentary tools/gputop:

https://cgit.freedesktop.org/~tursulin/intel-gpu-tools/log/?h=gputop
  
If you manage to export the right fdinfo tags (basically https://patchwork.freedesktop.org/patch/468502/?series=92574&rev=6)*, with the only local addition I have being the optional "drm-engine-capacity-<str>: <uint>" tag, we may get lucky and tool might even work. Let me know when you try. If it will work you should see something like this:

DRM minor 0
    PID              NAME    render       copy       video
   3838          kwin_x11 |█         ||          ||          ||          |
327056               mpv |          ||          ||▌         ||          |
327056               mpv |▌         ||          ||          ||          |
      1           systemd |▍         ||          ||          ||          |
   3884       plasmashell |          ||          ||          ||          |
   4794           krunner |          ||          ||          ||          |
   4836       thunderbird |          ||          ||          ||          |
296733         GeckoMain |          ||          ||          ||          |

Regards,

Tvrtko

*) Or for more reference this is how the i915 output looks like:

$ sudo cat /proc/7296/fdinfo/10
pos:    0
flags:  02100002
mnt_id: 26
ino:    501
drm-driver:     i915
drm-pdev:       0000:00:02.0
drm-client-id:  22
drm-engine-render:      196329331 ns
drm-engine-copy:        0 ns
drm-engine-video:       0 ns
drm-engine-capacity-video:      2
drm-engine-video-enhance:       0 ns

P.S. There is no AMD support in the current code, or nothing for memory either. Both can be added later.
