Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4ABCD6E4F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 19:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3DC10E33B;
	Mon, 22 Dec 2025 18:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pKj9jMCF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5gUicsQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0687410E67E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 18:29:45 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BMECIGI1529451
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 18:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GoyHDNq+F1RPG785wZM+pkzeoNzaQsMvtTCy/dQNnLs=; b=pKj9jMCFonHChKJA
 oL1LifYCpQd0zJjQcXCXK5L66M58OV4vaCPXgDJ6MtQShosN6V+T38jo6LC3Q2Fj
 K0ophtD53/LG+cisxX9TiyDxmI5TA8mhBWuE4VxnP72mdM+Mp2pskOSBysYVWxtC
 NewGhSnENIm+R3KO8js2BASZUXemx2MZcIzOgXGy8B5oV2MWr2SuxMygcx431e02
 lNaoSz4MfcBvK8Mu21I6JbpMGmhuChdo3O0O8R74UmkIyyaXV5hyJrjZzSrsOO3Z
 q7QafRr15YjtheiCHjZW4DzFw0WOAgoAdMIr4aL/M64oewKY/oyPmkXjHM+p+F9g
 Jr+3tw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y1301-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 18:29:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34c66cb671fso6125810a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766428184; x=1767032984;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GoyHDNq+F1RPG785wZM+pkzeoNzaQsMvtTCy/dQNnLs=;
 b=j5gUicsQuAMRuumAF9KlVsKey4oCsDbgOE6F5x14TTemOQaX3HGXjgHS+9ZZFcekN9
 g6XcMU5kpW8MtqT36E9kittHQ+bkbST1bwTV6bp1Isqth7uQ6+CMRyw0tt2wgXPc9lDl
 7VWGa+YONIEqoGiNkqmGqFD6jrwSm3eQdajVbrQsWaScdLAfyFlvcfE2x4XtdcT6Let/
 bwY+HMhK7tcNtC19T8PM9FMWbFXH/eyiPsd7dMAdiKrML8OoHHifFLiJuz5uYtw9f8B8
 hmnFo+cEchmUghuuDwhGro+rff6MnwWybpeKLhI3l5a0Q7Uf4gfPVGqR1KkZgJNHGQq6
 KT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766428184; x=1767032984;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GoyHDNq+F1RPG785wZM+pkzeoNzaQsMvtTCy/dQNnLs=;
 b=JHEaLqu+E2aPxnQZk5WWbdlhtnZVnGw76NFnBBssWYqHJCofXzGhZBKjJk9TzhIDqi
 n/XNyp8UOjqtGAf71v+/fDsDrGoNDhrYiNTJOkT5quXRG9pliJlkuOG8Oh4buBOdNKqh
 /9jm0HyI7IV+JyvDxeXPbjBEzDNN/ttFyIT3QsBo9Idf4lEIiKpBjKITZGjBdazanHHQ
 QyVB9Bn/4X4aYgEyiBKpzxLnlQd9HFJ2hDEAkjpa13j4CfDXnVvuPF+ViYcwL1TOUsKu
 z1N/KHGvZL/MO5bSoUaaLsPbwerJWvM2MST7la214lZTjSRdyx+ceh9R58VgHtff1iA+
 rK2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZFbic9dYK/A0aiytg7x7z3CYpE49mnRdIvE5vJMHWYu7jD9ULJq0fv0MgQpSU+bJEa868zzzc/xg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx95jzdr2O4fID9AR0SNVzcVq4la5amredtNm6aF8LcJhR57zsy
 QdEJVvulMWEhJX5dOwcMER8VMvF3XkTourEfXdOdkKoYI41hqifAnSDdpEneZJX1wB/XT0FKpxO
 zm/mCTozVqXbO7RJwXK208p4blixwAPn4AN8RzZVMDTX1QY0zdoPWVvLpwiUjxZy7mU9OtNk=
X-Gm-Gg: AY/fxX67pBV201QsKPdhpdkq2d55YIpcHPGWENBmPBAfwJKtrUMzwEXIZqu6V9RpNv4
 wEdrTMz6v7liu8ks9FURBc/nqz1gWFm0WdBFXieQs++iZ3fpYIy/8ROYyIqBY2HMqzbCwB3b6qP
 iYqZXEU2yLqEbRSzFbBm9+jnBPN1ZVCtOJzrBv1GV42XPISeTCQN2l4V2AVJTjO1dHokC/NUydC
 +Uidcjm/ajsU/o2QCVgsZzywUbggcT9VdhuCYy0nNOdLlk8NJSbr1NolFyjwStA9rhMxMWX6VIz
 aZoXVzqpBsMTLS4v0ePc5jrY1BP6zY65NVpaN3TdlBHqcb9NuRGepMd6sMOB7NRB7pCY9Bpz1RE
 R1403G6HMduRExJQfTl5O/qVkitlnh06dzQ==
X-Received: by 2002:a17:90b:1346:b0:340:4abf:391d with SMTP id
 98e67ed59e1d1-34e921353c3mr10942742a91.16.1766428183401; 
 Mon, 22 Dec 2025 10:29:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGml6W1g+6zlHFeYje9V5PaBuG9NLw7j/lPizNZeqvzh0Q/4VauYRMx06q3Kyp6cIvUzEJnHw==
X-Received: by 2002:a17:90b:1346:b0:340:4abf:391d with SMTP id
 98e67ed59e1d1-34e921353c3mr10942711a91.16.1766428182801; 
 Mon, 22 Dec 2025 10:29:42 -0800 (PST)
Received: from [192.168.1.5] ([106.222.228.240])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e7720b52esm5608545a91.7.2025.12.22.10.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 10:29:42 -0800 (PST)
Message-ID: <b01eedc2-24b6-43fd-b729-85eded2d6b34@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 23:59:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
 <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
 <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
 <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
 <57706b2e-becf-47ac-a874-79ce17d12b74@oss.qualcomm.com>
 <812cfa55-269d-4b19-8e18-4815608b6bbb@oss.qualcomm.com>
 <6agidc2r2d2jevtiizj77mtlytoo3raxaoe6b53rvk3obmmiha@x7pqjco4ulhg>
 <030a8eb3-c79e-4be0-8305-7c9bb2005785@oss.qualcomm.com>
 <wwrc637p5nkz6ptuef2hrhyjgqnyifcztlkjrqyw4764vg6jpf@wso4tp6onb5l>
 <1afebfb7-00aa-4f19-b6c7-dd6fadb83664@oss.qualcomm.com>
 <CAO9ioeXqP5i9hEa-DfrEvK3U-3py9KjdMmWnjzZ9kGd4BPqdYw@mail.gmail.com>
 <9fd21cf7-6576-4091-81ab-a09be6b7579b@oss.qualcomm.com>
 <CAO9ioeXKBD0ab2+FmNnFQozKq_cp+hFwc5B6LtgfEC2FLULUYQ@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CAO9ioeXKBD0ab2+FmNnFQozKq_cp+hFwc5B6LtgfEC2FLULUYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=69498e18 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=oy5nMm26i85I/VS19bmskg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=qvHcGGk0DYwmpqrIP6UA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mTFHnYQLtnKEq-9E25CZMVBBNKCeNqwl
X-Proofpoint-GUID: mTFHnYQLtnKEq-9E25CZMVBBNKCeNqwl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE2OSBTYWx0ZWRfX3OaycLPbHWkH
 GTdt5kTBDopUPpfqU7RvZu6uOKiENa48hgtcuzPY5BL+oiitZ/IynE/hHVZFGoefcVuwrk+R9Ci
 eZ1rQl3dJhQojglQAirmgZQZ1ZWf6TNtoLit+B5VpM03cf/36CP6QuZG1qM7JBIrNiB/MV8l8xw
 j4pFtrTYLpRZuIT/PREQBLGIrd45Hy0LMphu0X5miDVhNFg8uUjSTkqnxoXu6PSL+Lw8IjblOK4
 uYrTKw7HiqDrxsMYYT5L7hQWshYup2Jfs1KazD19YgvJT0dQ/o5zM5PLHh1yWZAi4I2+lYmJHJN
 sTjakR5ZCPhvM48yYuhZFtwJqHbetB+hZrNCnxntPC4J1BmYMEjfjZ+KKwzz00Uj54CuykPYI4m
 C2QL9bIsmq0mlN3lmMR2h7pQIOuFN9p/igsWXIV+VcPQQV5vKQNHDDK6azJ0uirq9hh4qlnK4GY
 Xzrq0d4K130MbpSCAkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220169
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

On 12/22/2025 4:54 PM, Dmitry Baryshkov wrote:
> On Mon, 22 Dec 2025 at 12:54, Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 12/22/2025 2:45 PM, Dmitry Baryshkov wrote:
>>> On Mon, 22 Dec 2025 at 09:19, Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>>>
>>>> On 12/13/2025 12:58 AM, Dmitry Baryshkov wrote:
>>>>> On Fri, Dec 12, 2025 at 01:01:44AM +0530, Akhil P Oommen wrote:
>>>>>> On 12/11/2025 6:56 PM, Dmitry Baryshkov wrote:
>>>>>>> On Thu, Dec 11, 2025 at 05:22:40PM +0530, Akhil P Oommen wrote:
>>>>>>>> On 12/11/2025 4:42 PM, Akhil P Oommen wrote:
>>>>>>>>> On 12/11/2025 6:06 AM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
>>>>>>>>>>> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
>>>>>>>>>>>> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
>>>>>>>>>>>>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>>>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
>>>>>>>>>>>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>>>>>>>>>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>>>>>>>>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>>>>>>>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>>>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> [...]
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> +                        gpu_opp_table: opp-table {
>>>>>>>>>>>>>>>>>> +                                compatible = "operating-points-v2";
>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>> +                                opp-845000000 {
>>>>>>>>>>>>>>>>>> +                                        opp-hz = /bits/ 64 <845000000>;
>>>>>>>>>>>>>>>>>> +                                        required-opps = <&rpmhpd_opp_turbo>;
>>>>>>>>>>>>>>>>>> +                                        opp-peak-kBps = <7050000>;
>>>>>>>>>>>>>>>>>> +                                };
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>>>>>>>>>>>>>> or mobile parts specifically?
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>>>>>>>>>>>>>> here.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> The IoT/Auto variants have a different frequency plan compared to the
>>>>>>>>>>>>>>> mobile variant. I reviewed the downstream code and this aligns with that
>>>>>>>>>>>>>>> except the 290Mhz corner. We can remove that one.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>>>>>>>>>>>>>> speedbins from the mobile variant until that is supported.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> No, we are describing just Talos, which hopefully covers both mobile and
>>>>>>>>>>>>>> non-mobile platforms.
>>>>>>>>>>>>>
>>>>>>>>>>>>> We cannot assume that.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Even if we assume that there is no variation in silicon, the firmware
>>>>>>>>>>>>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
>>>>>>>>>>>>> wise to use the configuration that is commercialized, especially when it
>>>>>>>>>>>>> is power related.
>>>>>>>>>>>>
>>>>>>>>>>>> How does it affect the speed bins? I'd really prefer if we:
>>>>>>>>>>>> - describe OPP tables and speed bins here
>>>>>>>>>>>> - remove speed bins cell for the Auto / IoT boards
>>>>>>>>>>>> - make sure that the driver uses the IoT bin if there is no speed bin
>>>>>>>>>>>>   declared in the GPU.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> The frequency plan is different between mobile and IoT. Are you
>>>>>>>>>>> proposing to describe a union of OPP table from both mobile and IoT?
>>>>>>>>>>
>>>>>>>>>> Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
>>>>>>>>>> has speed bins. How comes we don't have bins for the IoT variant?
>>>>>>>>>>
>>>>>>>>>> Mobile bins: 0, 177, 187, 156, 136, 105, 73
>>>>>>>>>> Auto bins:   0, 177,      156, 136, 105, 73
>>>>>>>>>>
>>>>>>>>>> Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
>>>>>>>>>> starting from bit 21).
>>>>>>>>>>
>>>>>>>>>> Mobile freqs:
>>>>>>>>>> 0:         845M, 745M, 700M,       550M,       435M,       290M
>>>>>>>>>> 177:       845M, 745M, 700M,       550M,       435M,       290M
>>>>>>>>>> 187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
>>>>>>>>>> 156:             745M, 700M,       550M,       435M,       290M
>>>>>>>>>> 136:                         650M, 550M,       435M,       290M
>>>>>>>>>> 105:                                     500M, 435M,       290M
>>>>>>>>>> 73:                                                  350M, 290M
>>>>>>>>>>
>>>>>>>>>> Auto freqs:
>>>>>>>>>> 0:         845M, 745M, 650M, 500M, 435M
>>>>>>>>>> 177:       845M, 745M, 650M, 500M, 435M
>>>>>>>>>> 156:             745M, 650M, 500M, 435M
>>>>>>>>>> 136:                   650M, 500M, 435M
>>>>>>>>>> 105:                         500M, 435M
>>>>>>>>>> 73:                                      350M
>>>>>>>>>>
>>>>>>>>>> 290M was a part of the freq table, but later it was removed as "not
>>>>>>>>>> required", so probably it can be brought back, but I'm not sure how to
>>>>>>>>>> handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.
>>>>>>>>>>
>>>>>>>>>> I'm a bit persistent here because I really want to avoid the situation
>>>>>>>>>> where we define a bin-less OPP table and later we face binned QCS615
>>>>>>>>>> chips (which is possible since both SM and SA were binned).
>>>>>>>>>
>>>>>>>>> Why is that a problem as long as KMD can handle it without breaking
>>>>>>>>> backward compatibility?
>>>>>>>>
>>>>>>>> I replied too soon. I see your point. Can't we keep separate OPP tables
>>>>>>>> when that happen? That is neat-er than complicating the driver, isn't it?
>>>>>>>
>>>>>>> I have different story in mind. We ship DTB for IQ-615 listing 845 MHz
>>>>>>> as a max freq without speed bins. Later some of the chips shipped in
>>>>>>> IQ-615 are characterized as not belonging to bin 0 / not supporting 845
>>>>>>> MHz. The users end up overclocking those chips, because the DTB doesn't
>>>>>>> make any difference.
>>>>>>
>>>>>> That is unlikely, because the characterization and other similiar
>>>>>> activities are completed and finalized before ramp up at foundries.
>>>>>> Nobody likes to RMA tons of chipsets.
>>>>>>
>>>>>> Anyway, this hypothetical scenarios is a problem even when we use the
>>>>>> hard fuse.
>>>>>
>>>>> So, are you promising that while there were several characterization
>>>>> bins for SM6150 and SA6155P, there is only one bin for QCS615, going up
>>>>> to the max freq?
>>>>
>>>> I have cross checked with our Product team. I can confirm that for both
>>>> internal and external SKUs of Talos IoT currently, there is only a
>>>> single bin for GPU with Fmax 845Mhz.
>>>
>>> Okay. Thanks for the confirmation.
>>>
>>> What happens when somebody starts working on a phone using SM6150 SoC
>>> (e.g. Xiaomi Redmi Note 7 Pro)?
>>
>> Update it in a way without disturbing the qcs615-ride.dtb? It is safe if
>> we add speedbin for Mobile in future, because KMD can correctly handle both.
> 
> Corresponding entry in a6xx_catalog.c will receive speed bin
> information. Will that break compatibility with the existing
> qcs615-ride.dtb?
> 

It won't. KMD will select a bin in OPP table only when a speedbin nvmem
cell is present. If the nvmem cell is not present, it will ignore the
speedbin table in the catalog.

-Akhil

>>
>>> Likewise, If I understand correctly, QCS615 RIDE aka ADP Air uses an
>>> auto SKU rather than the IoT one (please correct me if I'm wrong
>>> here).
>>>
>>
>> AFAIK, IoT variant is QCS615 and Auto variants uses SA6155P chipset.
>> Both chipsets are functionally same except some fuses.
> 
> Ah, ok. I wasn't sure if we are using QCS615 or SA6155P in the Ride devices.
> 

