Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 504D46B7670
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 12:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1661B10E106;
	Mon, 13 Mar 2023 11:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE4710E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 11:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678708024; x=1710244024;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FbvJCoIZ5U5aCU5RGHuq2By7ElAQ/Yy6USvzPpE8AXA=;
 b=OONeHtB7GLl27cNIiy/YHgTCs5wNOMtgjQr1psc1QRerkflpfJGqMF6j
 MmZvI/Xz46tWAgThS38MHVE1DsGn5GMkEoki5n4P4MLMpQe3e2ypn9dwr
 /WltCpxtPxZ9FN4T4jfoC+NYTiUIK+m8aj+nRs2FyGJqj9LHET3iVAMDk
 V928z6i6+Aqy9ANpIwbvGACCOdxv9Nczpjbg1aV648QH1+uEqiFp0m+v/
 Q00FZGYoA5Y1NLrU+/9Wvmknokx1MRsmQ731pOcDEfUxciioiV2mhh9S4
 KN4c0vXwHUIMhmaMl++5sRoq3n5dRgxXBnozYcoiWBnqVZRwbWf9VeZps A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="401994801"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="401994801"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:47:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="671868902"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="671868902"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.136.90])
 ([10.249.136.90])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:47:02 -0700
Message-ID: <d83ef2b2-e762-8dfb-cc0d-46cffcac46ee@linux.intel.com>
Date: Mon, 13 Mar 2023 12:46:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] accel: Build sub-directories based on config options
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <20230301162508.3963484-1-stanislaw.gruszka@linux.intel.com>
 <3d6df357-ed90-5a0e-e9a8-bb39e147798e@quicinc.com>
 <20230301165304.GA3963532@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230301165304.GA3963532@linux.intel.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks. Applied to drm-misc-next and cherry-picked to drm-misc-fixes.

On 01.03.2023 17:53, Stanislaw Gruszka wrote:
> On Wed, Mar 01, 2023 at 09:31:10AM -0700, Jeffrey Hugo wrote:
>> On 3/1/2023 9:25 AM, Stanislaw Gruszka wrote:
>>> When accel drivers are disabled do not process into
>>> sub-directories and create built-in archives:
>>>
>>>    AR      drivers/accel/habanalabs/built-in.a
>>>    AR      drivers/accel/ivpu/built-in.a
>>>
>>> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>>
>> Should there be a fixes tag?  Feels like something that should be
>> back-ported.
> 
> This tag could be added:
> 
> Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
> 
> but since then Makefile changed with habanalabs addition.
> 
> I expect this will go to drm-misc-fixes and then to linux 6.3-rcX
> from there, so (stable) back-port will not be needed.
> 
> Regards
> Stanislaw
