Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CBA9989ED
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 16:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A3210E917;
	Thu, 10 Oct 2024 14:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4139C10E094
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 12:03:20 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XPSyy02KWz1T8JL;
 Thu, 10 Oct 2024 20:01:30 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id ABCAE1400D8;
 Thu, 10 Oct 2024 20:03:14 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 10 Oct 2024 20:03:13 +0800
Content-Type: multipart/alternative;
 boundary="------------j8Ln2OXLy07tAhtIVyVcevKQ"
Message-ID: <526ff849-9d94-4b1f-b87b-7ad2ac20d954@huawei.com>
Date: Thu, 10 Oct 2024 20:03:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: s00452708 <shiyongbang@huawei.com>
Subject: Re: [PATCH drm-dp 1/4] drm/hisilicon/hibmc: add dp aux in hibmc
 drivers
To: Andy Yan <andyshrk@163.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240930100610.782363-1-shiyongbang@huawei.com>
 <20240930100610.782363-2-shiyongbang@huawei.com>
 <9c25d1f.1954.1926eeca432.Coremail.andyshrk@163.com>
In-Reply-To: <9c25d1f.1954.1926eeca432.Coremail.andyshrk@163.com>
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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

--------------j8Ln2OXLy07tAhtIVyVcevKQ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



> Hi Baihan，
>
> At 2024-10-01 15:26:23, "shiyongbang"<shiyongbang@huawei.com> wrote:
>> From: baihan li<libaihan@huawei.com>
>>
>> Add dp aux read/write functions. They are basic functions
>> and will be used later.
>>
>> Signed-off-by: baihan li<libaihan@huawei.com>
>> ---
>> drivers/gpu/drm/hisilicon/hibmc/Makefile     |   3 +-
>> drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c  | 227 +++++++++++++++++++
>> drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h  |  80 +++++++
>> drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h |  88 +++++++
>> drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h  |  76 +++++++
>> 5 files changed, 473 insertions(+), 1 deletion(-)
>> create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
>> create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h
>> create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>> create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> index d25c75e60d3d..8770ec6dfffd 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> @@ -1,4 +1,5 @@
>> # SPDX-License-Identifier: GPL-2.0-only
>> -hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o
>> +hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
>> +	       dp/dp_aux.o
>> +
>> +#define DPCD_LINK_BW_SET		0x0100
>> +#define DPCD_LANE_COUNT_SET		0x0101
>> +#define DPCD_TRAINING_PATTERN_SET	0x0102
>> +#define DPCD_TRAINING_LANE0_SET		0x0103
>> +#define DPCD_DOWNSPREAD_CTRL		0x0107
>> +#define DPCD_LANE0_1_STATUS		0x0202
>> +#define DPCD_ADJUST_REQUEST_LANE0_1	0x0206
> It seems that all of these have been defined in this header file.
>   include/drm/display/drm_dp.h：
> DP_LINK_BW_SET
> DP_LANE_COUNT_SET

   Ok, I will use general defination ininclude/drm/display/drm_dp.h. Thanks. Baihan Li.

--------------j8Ln2OXLy07tAhtIVyVcevKQ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix"><br>
    </div>
    <blockquote type="cite"
      cite="mid:9c25d1f.1954.1926eeca432.Coremail.andyshrk@163.com">
      <pre wrap="" class="moz-quote-pre">Hi Baihan，

At 2024-10-01 15:26:23, "shiyongbang" <a class="moz-txt-link-rfc2396E"
      href="mailto:shiyongbang@huawei.com">&lt;shiyongbang@huawei.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: baihan li <a
        class="moz-txt-link-rfc2396E" href="mailto:libaihan@huawei.com">&lt;libaihan@huawei.com&gt;</a>

Add dp aux read/write functions. They are basic functions
and will be used later.

Signed-off-by: baihan li <a class="moz-txt-link-rfc2396E"
        href="mailto:libaihan@huawei.com">&lt;libaihan@huawei.com&gt;</a>
---
drivers/gpu/drm/hisilicon/hibmc/Makefile     |   3 +-
drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c  | 227 +++++++++++++++++++
drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h  |  80 +++++++
drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h |  88 +++++++
drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h  |  76 +++++++
5 files changed, 473 insertions(+), 1 deletion(-)
create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h
create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h

diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
index d25c75e60d3d..8770ec6dfffd 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
+++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
@@ -1,4 +1,5 @@
# SPDX-License-Identifier: GPL-2.0-only
-hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o
+hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
+	       dp/dp_aux.o
</pre>
      </blockquote>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+#define DPCD_LINK_BW_SET		0x0100
+#define DPCD_LANE_COUNT_SET		0x0101
+#define DPCD_TRAINING_PATTERN_SET	0x0102
+#define DPCD_TRAINING_LANE0_SET		0x0103
+#define DPCD_DOWNSPREAD_CTRL		0x0107
+#define DPCD_LANE0_1_STATUS		0x0202
+#define DPCD_ADJUST_REQUEST_LANE0_1	0x0206
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">It seems that all of these have been defined in this header file.
 include/drm/display/drm_dp.h：
DP_LINK_BW_SET
DP_LANE_COUNT_SET</pre>
    </blockquote>
    <pre>  Ok, I will use general defination in <span
    style="white-space: pre-wrap">include/drm/display/drm_dp.h.
  Thanks.
	Baihan Li.

</span></pre>
  </body>
</html>

--------------j8Ln2OXLy07tAhtIVyVcevKQ--
