Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F39A7ADA15
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405AE10E265;
	Mon, 25 Sep 2023 14:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FD810E167;
 Mon, 25 Sep 2023 14:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695652111; x=1727188111;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=trPNtX/oyEgrDoCP0p2JRoWAXWULWN3nhIwuzOLRvao=;
 b=bRFc3pJiKpQDVF0HW7Y5fZE8dbdsa9LSB2IcJB4uIrcwL9U2QXFKeJet
 iROfSx1VQuCs6ZspYIvLiLDWONRmvPJpe2zYYBMUFGUsE7676isi1oAnP
 uDrvkzob33GWEwJdsrrye9rZPl0T+/xHvwdicSqyWVyG7MLqTGWCMjTF2
 oe9SaMwB3PTp788ImMJIgmSsa76Hwcaz0OqKXBHNR/8OSAd01DAv8SN9J
 etFdvZPEcq27X7UQ80nnD4wpc4+SvI9u4tgiSOraAMNYoPMvbfQXvc5an
 kVavKVWpf4AK/vb4thViE78fmv07zZ3rxd5wucK0UQwMQRVaOAfb5gj1Q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445373806"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="445373806"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783513756"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="783513756"
Received: from shaunbis-mobl4.ger.corp.intel.com (HELO [10.213.220.248])
 ([10.213.220.248])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:28:29 -0700
Message-ID: <1ab10838-0517-3ad9-c92e-e452f5b97d30@linux.intel.com>
Date: Mon, 25 Sep 2023 15:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Zap some empty lines
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230920085715.6905-1-tvrtko.ursulin@linux.intel.com>
 <ZRGVsijpw4hjzYNz@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZRGVsijpw4hjzYNz@ashyti-mobl2.lan>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/09/2023 15:14, Andi Shyti wrote:
> Hi Tvrtko,
> 
> On Wed, Sep 20, 2023 at 09:57:15AM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Recent refactoring left an unsightly block of empty lines. Remove them.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>> Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
>> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> 
> as this isn't merged yet:
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks, I am catching up with things and this wasn't so important. If 
you have a spare moment feel free to push it?

Regards,

Tvrtko
