Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D828B941E9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 05:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F226910E544;
	Tue, 23 Sep 2025 03:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFz4IHVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E74910E544
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:38:51 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N2Klt8000755
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8Y+UxxpE5WuCRJKuL0hvK4qAyKZPxGwcP6Rwn7/3joE=; b=KFz4IHVWkCAuM+Gr
 ihh3zMOk3sz7yyPuq6meqSBY7YiXu9sJ3Ovl8LYI61cfbz09oYecTiJe/lyjqVDG
 KEzyoIpj/5TgH/SsGYfYwYD7zQIQWJC8qOPQoNYsrjJDPIbpNkVOn+KXq+DXYAW9
 y3CO1VYETWVuyFcDyAqLjhdHY8TbVuZA5F1G/ClJBVyqz+l+v+BDQsPZrEWehj5+
 uR0MMK0F2cfTQzQmaoioJKQmVrq1s1+8cZkEF1f9ICprkjT3PLKdm4e1oybwON9c
 S/MYHMgSWrU1SY9zq+nOOo9Q9q30ORUfz8qlA7MwxCFU4ipWeBlzFBjJtnLrKzqp
 Zl/9Bw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdr5v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:38:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-244582e9d17so17217895ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 20:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758598730; x=1759203530;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8Y+UxxpE5WuCRJKuL0hvK4qAyKZPxGwcP6Rwn7/3joE=;
 b=R/cEADYzNH4nUPbju8r9yvwhXNMv0yZXfJs6BomU8LNTOSBlDtpEgNcBzjnJKnq/7W
 frF2eMit+4UpoBe4c5yVhv51cvLdS7tn2dDeF5MDDc5YzvYY7edds9Ta3LjNMsdKPRsv
 6oBFa2hSu/+BDruyg69aOoajkaoX4UTE0L/L0Z36VPUr6f2DRR92LrUIV7TW3/ruxWDZ
 QBpadJFhWS+nmVSoHCHAMYxMFcXH0XrzQsxunWh4+Rcy+G1oLZkbZdkv4uBMOdlfLKbS
 NRWJDYPAYMlvXU/k8q/cAWCqBzS5+s3YvwAP5K1gef7T5kbUQ8hFvNwUj4GWg42nDwpU
 l6tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU85eLlSHzVB754iL1KiPYPQH/QVvtCrmVOr7l0YcjHm/rvALliBpNvD+jh+k52PohDNyNozm0V5qM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzz4F7ZkMZN0kWZ5OMPD8LIg9a4hiCDpbwVdo4s8R8SVuEihSIb
 8RhrR5mT85tZjQdo49l/g1LDC6Xd8l2+hS0yUUU+nfPj/1K+/yRdbQBAruQDKfm2Nx8IayF/7eh
 hP6AoJbXgLs+ZAaQh4HWzdcB7cQJPMIS2bF/yM4t33F5X5q9EVt+psLMaM4qlqSVkttJ2tMU=
X-Gm-Gg: ASbGnctnuvFiO7Br1gZLcNaWbLcvhN1seay4W/9STwp/quSyk6FCl93nnhs+6l8nilR
 7W+ycrPYVNzMo0iYySoe6E5OytaM2T9yZcY1dNyvCos0KATzohkzWVORhpefyAfUjKML/ifw13g
 H7UovbQMnz0XZlrkbGxGyixGk6H3+fAhS3TwNWtwNLUYVmczyKgrknoOR+/m7fzHObwzLqMAogf
 9V8zoRfPo8a2EwzXiy972eLgnNZ/D1tRk8ZIzofSUQ4wqqKYsb4EZsbt40RlqYV8K3jhEiRb+lB
 emKGKCJV9c5UhB7SjwunfdRNWrltL5WEjrbijgwpjNFMRZFbqZs547UIk2YiPqLgcp0aK7PhHls
 fKQ+OUFPelJdNEfGzsDwWkPva+y4IRzdKDNA=
X-Received: by 2002:a05:6a00:1828:b0:77f:3f06:1f78 with SMTP id
 d2e1a72fcca58-77f537a8173mr828270b3a.2.1758598729787; 
 Mon, 22 Sep 2025 20:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5W8YAPrrchgMVeHplJ5Ln5bt4yZvCXn/JchjMJMX2nlmqazlCN5vnpvVhSh9oEhVk8Z5oRg==
X-Received: by 2002:a05:6a00:1828:b0:77f:3f06:1f78 with SMTP id
 d2e1a72fcca58-77f537a8173mr828234b3a.2.1758598729324; 
 Mon, 22 Sep 2025 20:38:49 -0700 (PDT)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77f41b85e84sm3439351b3a.86.2025.09.22.20.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 20:38:48 -0700 (PDT)
Message-ID: <d7b2a904-97de-4716-b179-4ad8d3ecbe58@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 11:38:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/14] drm/msm/dp: Add support for lane mapping
 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-14-eae6681f4002@oss.qualcomm.com>
 <j7ooyi5vih6ofnjigdgj6uk3ycutugunpm5pu5zf55pu5ua6r2@agg73zakjicn>
 <CACSVV00Bat6LE=joM+Wh3HnC1=c3_Y=crxUGdhLQWxxpZ17Q3g@mail.gmail.com>
 <t4x7okzjvh5ltyoniwlreoyy76735igtnxpeohpbojn4hkqk4q@v3ayfjrkez3e>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <t4x7okzjvh5ltyoniwlreoyy76735igtnxpeohpbojn4hkqk4q@v3ayfjrkez3e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SICU8Zv4yKq0FcbjXTysoRz8i7JLwuNh
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d2164a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gP3TSUq4Lgg7EeaY2V8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: SICU8Zv4yKq0FcbjXTysoRz8i7JLwuNh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX4nFdhK4rIynu
 U3sUbd6avN4LxKuUT/5sPIQ3ZZ2DhTkX6NMiSBIOlMSwQ59TOa1tDLmPUBYBFKUNJmqZoqYCWYB
 b3xVKkJS3z6Mg1vndk6/1zHJiB5UBLHGxoDy8I1WEEWv57UGi65rw9f4Cz/WbIIUfNxFnJa/hPo
 LKZeYgz45ASluJHlzaP/0t0iUQJKwOOHdsqoSufSBouC0P6N5ALzJv+Ncc2TalIKczG22oRtfIb
 pv966JGQ+5XInfUNlfnbsNMz7d6tpVm6PUJIbqDGU3YQq0srgT+rJrtBfKhA/CdeLa6J7g0gA7Z
 sYMaKdVELyatSYDK1qmjYQ1HDn0qRdF05vdYWXP0FqGovmEz9QoDFVd4gHdU31Fgde/pgP3UGBv
 sS5jp1Hl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020
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


On 9/23/2025 7:39 AM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 08:13:00AM -0700, Rob Clark wrote:
>> On Fri, Sep 19, 2025 at 11:35 AM Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>> On Fri, Sep 19, 2025 at 10:24:31PM +0800, Xiangxu Yin wrote:
>>>> QCS615 platform requires non-default logical-to-physical lane mapping due
>>>> to its unique hardware routing. Unlike the standard mapping sequence
>>>> <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
>>>> configuration via the data-lanes property in the device tree. This ensures
>>>> correct signal routing between the DP controller and PHY.
>>>>
>>>> For partial definitions, fill remaining lanes with unused physical lanes
>>>> in ascending order.
>>>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++----
>>>>  drivers/gpu/drm/msm/dp/dp_link.c | 60 ++++++++++++++++++++++++++++++++++++++++
>>>>  drivers/gpu/drm/msm/dp/dp_link.h |  1 +
>>>>  3 files changed, 66 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
>>>> index 2aeb3ecf76fab2ee6a9512b785ca5dceebfc3964..34a91e194a124ef5372f13352f7b3513aa88da2a 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>>>> @@ -1236,6 +1236,61 @@ static u32 msm_dp_link_link_frequencies(struct device_node *of_node)
>>>>       return frequency;
>>>>  }
>>>>
>>>> +/*
>>>> + * Always populate msm_dp_link->lane_map with 4 lanes.
>>>> + * - Use DTS "data-lanes" if present; otherwise fall back to default mapping.
>>>> + * - For partial definitions, fill remaining entries with unused lanes in
>>>> + *   ascending order.
>>>> + */
>>>> +static int msm_dp_link_lane_map(struct device *dev, struct msm_dp_link *msm_dp_link)
>>>> +{
>>>> +     struct device_node *of_node = dev->of_node;
>>>> +     struct device_node *endpoint;
>>>> +     int cnt = msm_dp_link->max_dp_lanes;
>>>> +     u32 tmp[DP_MAX_NUM_DP_LANES];
>>>> +     u32 map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3}; /* default 1:1 mapping */
>>>> +     bool used[DP_MAX_NUM_DP_LANES] = {false};
>>>> +     int i, j = 0, ret = -EINVAL;
>>>> +
>>>> +     endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
>>>> +     if (endpoint) {
>>>> +             ret = of_property_read_u32_array(endpoint, "data-lanes", tmp, cnt);
>>>> +             if (ret)
>>>> +                     dev_dbg(dev, "endpoint data-lanes read failed (ret=%d)\n", ret);
>>>> +     }
>>>> +
>>>> +     if (ret) {
>>>> +             ret = of_property_read_u32_array(of_node, "data-lanes", tmp, cnt);
>>>> +             if (ret) {
>>>> +                     dev_info(dev, "data-lanes not defined, set to default\n");
>>>> +                     goto out;
>>>> +             }
>>>> +     }
>>>> +
>>>> +     for (i = 0; i < cnt; i++) {
>>>> +             if (tmp[i] >= DP_MAX_NUM_DP_LANES) {
>>>> +                     dev_err(dev, "data-lanes[%d]=%u out of range\n", i, tmp[i]);
>>>> +                     return -EINVAL;
>>>> +             }
>>>> +             used[tmp[i]] = true;
>>>> +             map[i] = tmp[i];
>>>> +     }
>>>> +
>>>> +     /* Fill the remaining entries with unused physical lanes (ascending) */
>>>> +     for (i = cnt; i < DP_MAX_NUM_DP_LANES && j < DP_MAX_NUM_DP_LANES; j++) {
>>> Nit: i = cnt, j = 0; Don't init loop variables at the top of the
>>> function.
>> These days we can party like it's c99 and declare loop variables
>> inside the for(), instead of at the top of the function.  My
>> preference is to do so, unless the loop variable is used after the
>> loop.
> Ack, works for me too. I think I'm not used for having theese parts of
> C99 allowed in the kernel.


Got it. j is only used in that for loop, so I'll update it to use C99-style declaration as suggested.


