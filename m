Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E84B3F8D3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C860C10E5FA;
	Tue,  2 Sep 2025 08:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EX9CkD6U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2400E10E5FE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:42:26 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RnEj020757
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 08:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DVOLDMkL9Q38mnjAuWvsREiBjv7OOxlteZXJWEZg7C8=; b=EX9CkD6UBxZldHPo
 aMWSQHjiaONNc/TR3XQosLHHh3KRri7SLMuP8UMVgu6ek3Zqlnlqv/KjGZ4Zg+ki
 lr79AIn+0vGCStBrKbv0sSTB9LazsW75KWxEWFYN5jhbBTQsznn3efvSO2Turcv5
 p61aQhe6PZYBjLpFWUvhtZ1do0ClQczZOyH6zpfhssWXwuIh2/U9oCpKMs9c5H4d
 7EFrbmA3Hiwtl7H72br/s25uQ91AL8Jh2XziFjxoaXc1k3zhwNfNPifJFwneKVV3
 d/yriKVzzkaWTY6sb489mCfVLNDnc454MalnKJ8Ggstlb52Ug1QV/JU377j5SMBo
 1RL8bA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8ry71t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 08:42:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b4d7b23ad44so2170358a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 01:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756802545; x=1757407345;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DVOLDMkL9Q38mnjAuWvsREiBjv7OOxlteZXJWEZg7C8=;
 b=hRcpQMC0kTvO7a5VbUgc3XkSVulHcooS9Rh36cnmw+OtqJN9us0hXQG+Wq3PiU6k4R
 PEJCQd+vKMQmpHMk5MsDWdEdrkbafNGMH90OtsA3n0ZFTh8DJjnIJ71FDsa85hZORYSQ
 lMrZcQuhmqkmHMgoYYv/IHkiiPktFvaUJhItMiKnEwGG/S6R7LC0djAxbY8TQqnMRhhb
 m943kJXW5GAA+FxO/dEwI21JHoK+CYZiD6C0G3gm7GkrupLNHx8t72VG1Te7TPvJSoXj
 JJSemJlpymCzqWiF9JlI7kqb+nz1zFlqs44HbjcO05FGiWTiXp6hDJ0lBQPxeMAa4y9e
 C0Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhIsUCXDEpUbZr7qFy+yMDlLci7/TBj/kVmVta9tB0MZnxAap4QKEjzbEOrhInrmVTt14un14JLtg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7LdxdlGclzhqKJKB/3WoIXaYrK/4BfR3ywZ/4GIa9ZZVNKESO
 +jTJPR0ukoyqN6/r8D//Tm9rM6lKuA5lGBDCfddYg83Y7byLzH+i4tdOG0/96d372NAV2rkDSLE
 zbcdyFvxUPjEo5aYQ1OuuJY0Zb7efoDupr6BIC71AO/WsIGYqsSC9TJ259wBjGq9YHyEka98=
X-Gm-Gg: ASbGnctDw84f/99s9SqZ4njLMPAzi/Uzyo3I2VAMzpiuLvNTt1ym0eWiQ+E9JyFJEmd
 eYTBd6FZmqHRQ4WvlKo1IbDpEUABnJa1j3vcmA04sPNhS4jTh7l0ZSKYkZcWvByDse90eWsixCQ
 tbTSaoeUBQozMidwH1BM/lsWFnZV2XEYmzGHM9Hp8QKYnfJv3XAQk7diLiGjHFexhw7xpPjllbA
 Vg3qilZu/W7yHK7qUswS+NtTAUSCxhkxijdrIjd7eTftdMceW4CLeyj8lNfB6ZFiMLFDJpMdOAb
 oxy8PCxJf3FiKoK9i0H4A3D5fYjtclDit/wGyphawZsCNZslCgcR7MnlfrKFr/X1ATHX0gb0dul
 GXH0UIvI7pfBIelvXlJB6E7F31zuNsA==
X-Received: by 2002:a05:6a20:3ca1:b0:240:af8:176d with SMTP id
 adf61e73a8af0-243d6e0624fmr15800443637.24.1756802544548; 
 Tue, 02 Sep 2025 01:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkZmtURUQXjUEaZAkZwa5KRLpMqM9mF0V2Pb31KG4aIt0jLndUPkUWRig5iFl5PBDxItRWsA==
X-Received: by 2002:a05:6a20:3ca1:b0:240:af8:176d with SMTP id
 adf61e73a8af0-243d6e0624fmr15800404637.24.1756802544055; 
 Tue, 02 Sep 2025 01:42:24 -0700 (PDT)
Received: from [10.133.33.25] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm9992321a12.6.2025.09.02.01.42.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 01:42:23 -0700 (PDT)
Message-ID: <5b142910-81e7-462d-8933-70705334ef0a@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 16:42:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
 <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX6t0IJe81bBlD
 PZ/8AbEdLKChdbcgjiuwhpQa2284VqwKW9vM6ymBFV2WQ/vbh/eDI2hxuy1DpLqyz4si66C7z4T
 pg1wQD3CYxbexuhiCZ4I4Vi1+5yxFVVLUZGdGdSzY8P+/wTaBkR+n0gw42bIfLkm8YvZiUIYqeA
 oY2rD2++UkwO32Zau5AkN+1BGj5760JA0eij62DJeZ1tiJoBpMWVD/U9DY9isic0nA+h+pdobwd
 PswGJBvCL58JffkE5zeIW6smyciegWnzPuK5YYodK0dSer7QvsZJo1qCgCzYz/WnvtdWGOGDVE/
 mEbEjle4GZ4E+rmP1tUfl/pcI4Igrp3S9ax1BCVqlNn1ivLmQ36eguiWUNOrN/6upuYDqtLICuZ
 edN9a6sw
X-Proofpoint-GUID: Hw1pttShi-HkqGAlDrDCZKB-DiDkaFX2
X-Proofpoint-ORIG-GUID: Hw1pttShi-HkqGAlDrDCZKB-DiDkaFX2
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6adf1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=UzQ1Ta3AV69qgWW9qvUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
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



On 8/26/2025 12:41 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
>> The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
>> state management complexity. This change removes the drm_edid member from
> 
> Please see Documentation/process/submitting-patches.rst on how to write
> commit messages. Please use imperative language instead of describing
> the changes.
> 
> THe patch LGTM.
> 
Thanks, will update it in next version. Since the HPD refactor series 
are unlikely to be merged soon. Can I separate out some patches from the 
MST series that don't have dependencies and send them individually to 
make it get applied? This would help reduce the number of the MST series.

>> the panel structure and refactors related functions to use locally read
>> EDID data instead.
>>
>> - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
>> - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
>> - Removes msm_dp_panel_get_modes() and drm_edid caching logic
>> - Cleans up unused drm_edid_free() calls
>>
>> This simplifies EDID handling and avoids stale data issues.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
>>   drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
>>   drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
>>   3 files changed, 26 insertions(+), 58 deletions(-)
>>
> 


