Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E855A9989EE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 16:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6917710E93D;
	Thu, 10 Oct 2024 14:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAA910E157
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 12:02:34 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XPT0C5cwJz2JYXR;
 Thu, 10 Oct 2024 20:02:35 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 1D67D1400DC;
 Thu, 10 Oct 2024 20:02:31 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 10 Oct 2024 20:02:29 +0800
Content-Type: multipart/alternative;
 boundary="------------BrGGtAav0NuAzEentySNtq1t"
Message-ID: <aee55727-5159-463e-bb18-722f3cfa6a50@huawei.com>
Date: Thu, 10 Oct 2024 20:02:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 1/4] drm/hisilicon/hibmc: add dp aux in hibmc
 drivers
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
 <shaojijie@huawei.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <xinliang.liu@linaro.org>,
 <kong.kongxinwei@hisilicon.com>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <tzimmermann@suse.de>, <mripard@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <tiantao6@hisilicon.com>
References: <20240930100610.782363-1-shiyongbang@huawei.com>
 <20240930100610.782363-2-shiyongbang@huawei.com> <87bjztbsny.fsf@intel.com>
From: s00452708 <shiyongbang@huawei.com>
In-Reply-To: <87bjztbsny.fsf@intel.com>
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500013.china.huawei.com (7.221.188.12)
X-Mailman-Approved-At: Thu, 10 Oct 2024 14:40:55 +0000
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

--------------BrGGtAav0NuAzEentySNtq1t
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

> On Mon, 30 Sep 2024, shiyongbang<shiyongbang@huawei.com> wrote:
>> From: baihan li<libaihan@huawei.com>
>>
>> Add dp aux read/write functions. They are basic functions
>>   and will be used later.
> You're supposed to use struct drm_dp_aux, add a .transfer function,
> initialize it with intel_dp_aux_init(), and register with
> intel_dp_aux_register(). Then you can use the standard drm_dp_dpcd_*
> calls to access aux. They handle a lot of the boilerplate for DP
> aux. You'll also get the i2c and aux device nodes for free. As well as a
> lot of helpers based on struct drm_dp_aux interface.
>
> There's a lot of duplication in this patch otherwise too. The DPCD
> register macros, a dupe for struct drm_dp_aux_msg, etc.
>
>
> BR,
> Jani.

Hi Jani,
   Thanks for your advice. I didn't notice that the drm framework
   has this implementation, and I'll use the struct drm_dp_aux and
   drm_dp_aux_init() function in the next version to simplify my code.

   And I will check if there are others implementation in drm_dp_helper.c.
   
   Baihan Li.

--------------BrGGtAav0NuAzEentySNtq1t
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <blockquote type="cite" cite="mid:87bjztbsny.fsf@intel.com">
      <pre wrap="" class="moz-quote-pre">On Mon, 30 Sep 2024, shiyongbang <a class="moz-txt-link-rfc2396E" href="mailto:shiyongbang@huawei.com">&lt;shiyongbang@huawei.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: baihan li <a class="moz-txt-link-rfc2396E" href="mailto:libaihan@huawei.com">&lt;libaihan@huawei.com&gt;</a>

Add dp aux read/write functions. They are basic functions
 and will be used later.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You're supposed to use struct drm_dp_aux, add a .transfer function,
initialize it with intel_dp_aux_init(), and register with
intel_dp_aux_register(). Then you can use the standard drm_dp_dpcd_*
calls to access aux. They handle a lot of the boilerplate for DP
aux. You'll also get the i2c and aux device nodes for free. As well as a
lot of helpers based on struct drm_dp_aux interface.

There's a lot of duplication in this patch otherwise too. The DPCD
register macros, a dupe for struct drm_dp_aux_msg, etc.


BR,
Jani.</pre>
    </blockquote>
    <pre>
</pre>
    <pre>Hi Jani,
  Thanks for your advice. I didn't notice that the drm framework 
  has this implementation, and I'll use the struct drm_dp_aux and 
  drm_dp_aux_init() function in the next version to simplify my code.

  And I will check if there are others implementation in drm_dp_helper.c.
  
  Baihan Li.

</pre>
    <blockquote type="cite" cite="mid:87bjztbsny.fsf@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------BrGGtAav0NuAzEentySNtq1t--
