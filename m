Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF1F55408D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 04:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E67A10F33E;
	Wed, 22 Jun 2022 02:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B6B10F33E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 02:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655865005; x=1687401005;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NOO1FyY3qDr7bCWY4Lyq15QwVsn+xm7nM3/Hviri2VY=;
 b=DCRD7MJAeyp/VsR3jNypPNfecB5ykjk2EkkFy/V5kPJ/moR2345BEdwS
 eFqXuKTrTYV7F63OA/NIL9AsTzO4Q9ghaxv9UXE0N3DEHZ+PLesOKHawY
 D2AQLisI0q66HmKB6BBl0j/hIpsIiOKd1y5ICCr1KOchtLQL0AF5jrO3A
 KCmJwqzqC1atnaUjFdraRHr6OQg6x8dSsJ88YvhAzgcS8vE7skDqXGWEF
 OodfdN5t6em83WlVovX/L3b7OafoQGhUHpW+r1753548nw+m3dWCybiPH
 9XGRyW9poDduVdh7PAEMD0x+WXEfTt9XUUJCjClWNL80wkuPNTXo4wHlJ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="305742600"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="305742600"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 19:30:05 -0700
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="591935703"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.173.196])
 ([10.249.173.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 19:30:02 -0700
Subject: Re: [kbuild-all] Re: [PATCH v2 1/1] drm/panfrost: Add support for
 devcoredump
To: Alyssa Rosenzweig <alyssa@collabora.com>, kernel test robot <lkp@intel.com>
References: <20220621023204.94179-2-adrian.larumbe@collabora.com>
 <202206211114.PJcD2pJh-lkp@intel.com> <YrHWhmNVJnIJ1iaT@maud>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <f51c03dc-e01b-566b-b634-24c821110208@intel.com>
Date: Wed, 22 Jun 2022 10:30:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YrHWhmNVJnIJ1iaT@maud>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: kbuild-all@lists.01.org, tomeu.vizoso@collabora.com,
 Adri?n Larumbe <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/21/2022 10:32 PM, Alyssa Rosenzweig wrote:
>>     drivers/gpu/drm/panfrost/panfrost_dump.c: In function 'panfrost_core_dump':
>>>> drivers/gpu/drm/panfrost/panfrost_dump.c:115:20: error: 'struct panfrost_job' has no member named 'file_priv'
>>       115 |         as_nr = job->file_priv->mmu->as;
>>           |                    ^~
> 
> FWIW -- this is due to recent changes in panfrost, you should rebase on
> the latest drm-misc-next which is where the patch will be applied
> anyway.

Hi Alyssa,

Thanks for your help, we'll try drm-misc-next next time.

Best Regards,
Rong Chen
