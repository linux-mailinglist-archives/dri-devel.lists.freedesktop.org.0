Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02333550C88
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 20:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5EA10EC04;
	Sun, 19 Jun 2022 18:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B02210EC04
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 18:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=HqhUHLnn9zw43ykXrHZYC2UIAN9zAPBi5wljpUp4B+Q=; b=e44/ZDxh85JPkfu8AoyO9/r/ia
 HLA0w5CohluzAwJF8+mXvceE++6maHem6M/najnOm5WRhYrackqEFnKFSMfYQXCC7MxyTJh7s+ZZc
 XgWVcMGgsJG8Xa9jQNLLY223oPyBykc5JeMuBZxQ4A/nV5rGT/XdLWG2Tenxt1P+zX4HzuLUFMPNO
 a8PmfuKd2lXl7KyXv+v8mveHewMKHKCBE/3UaEdMas/tq1E7ONHHLM4yZLQLxmqOY8YlEcIY3DR+k
 GNiJlWlP1053tcObpHrcxECrmQuttUdRB409fZQSdepizR313OSJJWJqoxnrAdt1kKDoXV1hZSPVj
 QfUmZ+6w==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o2zdt-004XKY-Iz; Sun, 19 Jun 2022 18:27:27 +0000
Message-ID: <59cb24c1-1a4b-5472-e4f8-d87b309ad134@infradead.org>
Date: Sun, 19 Jun 2022 11:27:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [DRM/hisilicon/hibmc] kernel robot reports build errors,
 patch(es) available but not merged
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <9a0ed0bb-34c7-bacb-16a8-fdb158535ab2@infradead.org>
 <5eabd169-b8a0-fb8f-d70b-4495d3790f05@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <5eabd169-b8a0-fb8f-d70b-4495d3790f05@redhat.com>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, John Stultz <jstultz@google.com>,
 Tian Tao <tiantao6@hisilicon.com>, RongrongZou <zourongrong@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/19/22 07:27, Javier Martinez Canillas wrote:
> Hello Randy,
> 
> On 6/19/22 00:49, Randy Dunlap wrote:
>>
>> kernel robot reports today:
>>
>> * riscv64-linux-ld: ttm_bo_vm.c:undefined reference to `vmf_insert_pfn_prot'
>>   https://lore.kernel.org/lkml/202206190651.smtms3Ay-lkp@intel.com/T/#u
>>
>> * ttm_bo_vm.c:undefined reference to `vmf_insert_pfn_prot'
>>   https://lore.kernel.org/lkml/202206190523.0Ar6yQF7-lkp@intel.com/T/#u
>>
>>
>> and earlier:
>>
>> * ld.lld: error: undefined symbol: vmf_insert_pfn_prot
>> https://lore.kernel.org/lkml/202203281125.Jp08egXu-lkp@intel.com/
>>
>> * ttm_bo_vm.c:undefined reference to `vmf_insert_pfn_prot'
>> https://lore.kernel.org/lkml/202204081648.gV63Gt0t-lkp@intel.com/
>>
>>
>> I sent a patch for this on 2022-04-08 and again on 2022-05-30 (UTC).
>>
>> https://lore.kernel.org/all/20220409030504.16089-1-rdunlap@infradead.org/
>> https://lore.kernel.org/all/20220531025557.29593-1-rdunlap@infradead.org/
>>
>> Neither one has been applied or even had a comment.  :(
>>
> 
> Sorry that these fell into the cracks. Thanks for the patch, I think the
> change is correct but gave some comments about the Fixes: tag and commit
> description. There's no need to resend though, I can do it when pushing.

OK, thank you.

-- 
~Randy
