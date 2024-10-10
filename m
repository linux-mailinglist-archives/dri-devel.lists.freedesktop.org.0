Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DE29989EC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 16:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BF510E921;
	Thu, 10 Oct 2024 14:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1AA10E8DF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 12:06:23 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XPT3Q2V1Tz20q38;
 Thu, 10 Oct 2024 20:05:22 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 08D9F18001B;
 Thu, 10 Oct 2024 20:06:00 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 10 Oct 2024 20:05:58 +0800
Content-Type: multipart/alternative;
 boundary="------------KFpE20ltQ3piu55jRTKIjbZE"
Message-ID: <aa1f4bb1-ce35-4f97-9b48-f9869e780c96@huawei.com>
Date: Thu, 10 Oct 2024 20:05:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 2/4] drm/hisilicon/hibmc: add dp link moduel in
 hibmc drivers
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
 <shaojijie@huawei.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kong.kongxinwei@hisilicon.com>,
 <daniel@ffwll.ch>, <airlied@gmail.com>, <tzimmermann@suse.de>,
 <mripard@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <tiantao6@hisilicon.com>, <xinliang.liu@linaro.org>
References: <20240930100610.782363-1-shiyongbang@huawei.com>
 <20240930100610.782363-3-shiyongbang@huawei.com> <878quxbscj.fsf@intel.com>
From: s00452708 <shiyongbang@huawei.com>
In-Reply-To: <878quxbscj.fsf@intel.com>
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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

--------------KFpE20ltQ3piu55jRTKIjbZE
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

> On Mon, 30 Sep 2024, shiyongbang<shiyongbang@huawei.com> wrote:
>> From: baihan li<libaihan@huawei.com>
>>
>> Add link training process functions in this moduel.
> Lots of duplication of drm_dp_helper.[ch] stuff here too. I'll mention a
> few inline, but there's more.
>
> BR,
> Jani.

   Ok. thanks.
   Baihan Li.


--------------KFpE20ltQ3piu55jRTKIjbZE
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <blockquote type="cite" cite="mid:878quxbscj.fsf@intel.com">
      <pre wrap="" class="moz-quote-pre">On Mon, 30 Sep 2024, shiyongbang <a class="moz-txt-link-rfc2396E" href="mailto:shiyongbang@huawei.com">&lt;shiyongbang@huawei.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: baihan li <a class="moz-txt-link-rfc2396E" href="mailto:libaihan@huawei.com">&lt;libaihan@huawei.com&gt;</a>

Add link training process functions in this moduel.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Lots of duplication of drm_dp_helper.[ch] stuff here too. I'll mention a
few inline, but there's more.

BR,
Jani.
</pre>
    </blockquote>
    <pre>  Ok. thanks.
  Baihan Li.
</pre>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:878quxbscj.fsf@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------KFpE20ltQ3piu55jRTKIjbZE--
