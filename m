Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD799AD214C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 16:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F6910E39E;
	Mon,  9 Jun 2025 14:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNsasPs2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C50310E39E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 14:49:08 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599MZec005963
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 14:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qS0L5+ztUyOjrccHMk5jM0O+5pKXdrN0GpTwu6YIyPw=; b=UNsasPs2+kY4jZeZ
 PrnkpRGZxMgc5kHv1qUL8uhwwDkGyQwyN0oi4TbxPC5bgk0oe15C5njn4e6E6P1l
 ppDTiwl5SJpJIvJCwg5ZWIuD9B/jaYEOHedsnp50Z8fX0W4vrqhXog3HJgyfXtMv
 gTeeOa4Q/+zqm2+21CNs71WJdFiiPRI4+qIxmZWZOUD80o18ddUJ3Wl2T7VxSt/z
 XqS/HAqtfILFS7AWGXhlXr+2cbRhsRQEpwMCUSSqvI0dOlGqYYzSSsr28cUzYyzF
 OXg2O5NEwcCjI/r+BBjVpbB5/DgrBjMtKSKeM+GA4oMKxa4KOhixU4d+DTRhXqls
 d7YG4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6je5pq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 14:49:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c793d573b2so799037285a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 07:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749480546; x=1750085346;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qS0L5+ztUyOjrccHMk5jM0O+5pKXdrN0GpTwu6YIyPw=;
 b=r4J09lKy8t8vqZjsaE6hhUtKD7rr6y940+iAURrfzB04Nep4Oxu5lwluT70KWAHZaK
 onfK4/XZw464aC0hLA68P0n9nTxnYMvqXkID2tQLIf5WkdOMXQYYYX/izLX5baDKN1AD
 am9Ir3G2w5Yunk7C2RNmB3Qmuwj8ftF787ECKwSrdivJF7T4Yh3x3Q8DfvhPHp8X7+up
 Vhx35V/Za6eJ8Z8BAbqpTIufYNw4y40Nwa50D1KtPiTZ+pTSeasHBe3PLUDzDCt8gVEu
 he/VZCuIufPLEvBBhlYRTW33Hn8kcc54FYlAjnnZOmCLj66zA0tEYHz80kS1KSdg6k01
 ktkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpfo2Y74vqr6aunkVKwhaSqe1JszypgMH+DynhrlcbhMnWYnnQO8tBStzKgHIZxt0YIUvWgop1I9U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCaaZ0FzheoOErlisqPvlBf5sbviCRU5BDOKvywZQs4bW+urGB
 ljW25yO1PcYBqEkiLE6pIemNI6UPWJqjw81+IpAPS6a8y+8J3Ktvk4GMCvF7UFtKAV4Xui1qQXu
 HsnGISi9n/0AhW/wToBa/5dze0JvRv0nnXuthsR265KmX++F7bpI1CPrQUPuy+hwHV8VrIiI=
X-Gm-Gg: ASbGncsFwp/oBlYrf/41oe8X93Rl8f5vpNMLRseKWWQ+/Gl5X6bK1TmGLPOnts4mdTn
 2AzMlsKs4RkTSaJ5lkUymgs2asDIN5ZSvsVi06WZr5u/waoHwtYuNBLEi9h1Gi4Z0XjCsWVJOZN
 fAJMsL/8wE/OHy3T6hk+yK5yavboKWW4VlymrAbj2vAg0PYtWsE9tn668y3F4qV78WpU2wB4Jy2
 siZRU06ZXQyQ9ns4Mk2D0b4K4alIbmU07hV4LPJoSKzXE3SSP3SedRq3lyHDNYJqMyOwj/O2xeQ
 7Ytwb3VBK8/tbcjb9En7HgQXQ5WAS3A7DDEUSJpR70qNoM9u49f2WVSwXnhqmR52zykaH67Yupl
 eniu/K1UaYQYfzQ==
X-Received: by 2002:a05:620a:f14:b0:7d0:9782:9b05 with SMTP id
 af79cd13be357-7d2298a5ae7mr2100152185a.25.1749480546263; 
 Mon, 09 Jun 2025 07:49:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZydpzOZycKwmqVFImLxZKSm4rvhjZsM5wfbZNpXpun6vcU1GTiITZnca9s4SYvdqIACYnvg==
X-Received: by 2002:a05:620a:f14:b0:7d0:9782:9b05 with SMTP id
 af79cd13be357-7d2298a5ae7mr2100149885a.25.1749480545864; 
 Mon, 09 Jun 2025 07:49:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553677310dbsm1195186e87.193.2025.06.09.07.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 07:49:05 -0700 (PDT)
Message-ID: <a5658165-9e8a-49e6-b2ed-75b25c074b87@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 17:49:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 02/10] drm/hisilicon/hibmc: fix dp probabilistical
 detect errors after HPD irq
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-3-shiyongbang@huawei.com>
 <r3tnmjl5bnlyhgblhfqwouu57oh5tfpmfsrx5xczzmsovalvse@mujphkc4mv5k>
 <49a4644d-0e73-419a-aa53-0db69bd00833@huawei.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <49a4644d-0e73-419a-aa53-0db69bd00833@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=6846f463 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=OEN_xTaWeFM-_vMy9bsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: abxsoaXgYjoO56Mu2OeB3QvRkwIalvld
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOSBTYWx0ZWRfX19JC+nBoH0yc
 RRY1cLI391q1BiP3/aXolRvaS+QL3ZwiA+d4vUotX8pHJcJ+0TkBTEY7UtajqZpAS8VSrtjkLpy
 knoBfDHgzvp60WEy+KWJpazOJxe4YAd0TacATv2Kyj5H20plyoRV5t42T0OSaWvVfXHNgVQyFEJ
 3qcYPLxPMh1zsmIkNh0nSUcpRthJVwUMTNvMN9gvMbBkIEmUOio8+aN+bLl5AUz9Ee9DDS4yUQR
 asoruPNMcpBpedcQUgf6OvUiWNCUjxLwAZD8ff7bhhDi7ewRl5S9MJiJzsvAkyHXVpPffBc/LR8
 SHAAnrx7p6Zu9Ma/ub6V73uC2rOzD9Y21pQPmUrtWARv039gF6J0NXPriUGJy8/3TFzujijYbla
 XCds3mvZQFmqrw2Y1gWRy1zEIeXCX6yf7xVRSolQQ0qrBZ2iuTfhjKSayTwG2Du7whBclHHr
X-Proofpoint-GUID: abxsoaXgYjoO56Mu2OeB3QvRkwIalvld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090109
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

On 09/06/2025 17:47, Yongbang Shi wrote:
> 
>> On Fri, May 30, 2025 at 05:54:24PM +0800, Yongbang Shi wrote:
>>> From: Baihan Li <libaihan@huawei.com>
>>>
>>> The debouncing when HPD pulled out still remains sometimes, 200ms 
>>> still can
>>> not ensure helper_detect() is correct. So add a flag to hold the sink
>>> status, and changed detect_ctx() functions by using flag to check 
>>> status.
>>>
>>> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug 
>>> detect of irq feature")
>>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>>> ---
>>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  1 +
>>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 38 +++++++++++++------
>>>   2 files changed, 28 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/ 
>>> gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>>> index 665f5b166dfb..68867475508c 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>>> @@ -50,6 +50,7 @@ struct hibmc_dp {
>>>       struct drm_dp_aux aux;
>>>       struct hibmc_dp_cbar_cfg cfg;
>>>       u32 irq_status;
>>> +    int hpd_status;
>>>   };
>>>   int hibmc_dp_hw_init(struct hibmc_dp *dp);
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/ 
>>> drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>>> index d06832e62e96..191fb434baa7 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>>> @@ -13,7 +13,8 @@
>>>   #include "hibmc_drm_drv.h"
>>>   #include "dp/dp_hw.h"
>>> -#define DP_MASKED_SINK_HPD_PLUG_INT    BIT(2)
>>> +#define HIBMC_DP_MASKED_SINK_HPD_PLUG_INT    BIT(2)
>>> +#define HIBMC_DP_MASKED_SINK_HPD_UNPLUG_INT    BIT(3)
>>>   static int hibmc_dp_connector_get_modes(struct drm_connector 
>>> *connector)
>>>   {
>>> @@ -34,9 +35,12 @@ static int hibmc_dp_connector_get_modes(struct 
>>> drm_connector *connector)
>>>   static int hibmc_dp_detect(struct drm_connector *connector,
>>>                  struct drm_modeset_acquire_ctx *ctx, bool force)
>>>   {
>>> -    mdelay(200);
>>> +    struct hibmc_dp *dp = to_hibmc_dp(connector);
>>> -    return drm_connector_helper_detect_from_ddc(connector, ctx, force);
>>> +    if (dp->hpd_status)
>>> +        return connector_status_connected;
>>> +    else
>>> +        return connector_status_disconnected;
>>>   }
>>>   static const struct drm_connector_helper_funcs 
>>> hibmc_dp_conn_helper_funcs = {
>>> @@ -115,22 +119,34 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
>>>   {
>>>       struct drm_device *dev = (struct drm_device *)arg;
>>>       struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
>>> +    struct hibmc_dp *dp = &priv->dp;
>>>       int idx;
>>>       if (!drm_dev_enter(dev, &idx))
>>>           return -ENODEV;
>>> -    if (priv->dp.irq_status & DP_MASKED_SINK_HPD_PLUG_INT) {
>>> -        drm_dbg_dp(&priv->dev, "HPD IN isr occur!\n");
>>> -        hibmc_dp_hpd_cfg(&priv->dp);
>>> +    if (dp->hpd_status) { /* only check unplug int when the last 
>>> status is HPD in */
>> I think this way you'll ignore HPD short pulses. Could you possibly
>> clarify whether it is the case or not?
> 
> We actually doesn't enable short HPD here, this feature just used in our 
> electrical tests.
> 
> 
>>> +        if ((dp->irq_status & HIBMC_DP_MASKED_SINK_HPD_UNPLUG_INT)) {
>>> +            drm_dbg_dp(dev, "HPD OUT isr occur.");
>>> +            hibmc_dp_reset_link(dp);
>>> +            dp->hpd_status = 0;
>>> +            if (dev->registered)
>>> +                drm_connector_helper_hpd_irq_event(&dp->connector);
>>> +        } else {
>>> +            drm_warn(dev, "HPD OUT occurs, irq status err: %u", dp- 
>>> >irq_status);
>> These should be ratelimited.
> 
> Sorry, I didn't get it. Do you mean I need print the link rate here?
> 

No, I was thinking about drm_err_ratelimited() in case something gets 
stuck in the hw.

-- 
With best wishes
Dmitry
