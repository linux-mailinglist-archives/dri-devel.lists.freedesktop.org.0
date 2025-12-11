Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8107CB7018
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 20:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8DB10E862;
	Thu, 11 Dec 2025 19:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5XoI1Yq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kkMKxBox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA0610E862
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 19:31:55 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BBEPBmA970183
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 19:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LrASXI6znESlT6+VMhJjmcgNU47qp3dF0DDnq1IYifI=; b=R5XoI1Yq0sZ/pgrA
 3IxX6U27HdksCQWbRP5gsPE61MKl2271xgDeVyt3pMi03QbSB7Vlu4i7nuU56IKk
 06I2pxb96wdnu29NLr0gwOrCvZPWBP50NKQKzCLC7kxKZQtVsf53JG0qdI/bfPgi
 mXTRVJL20RbNnM+HEQ06xwcPgIwhF6CMpTciUvoef7kZYTPl8zxyOktQb8Jm0xsa
 BHsSO+SW5S1OvqIdFFOa3lRhll5fpENOTFsLh4EzCT0aAbCmga3aakz9dl9iLxjm
 TeKNanK4tH5mL6TBOfZdbFqLH2hRzENtltcj3EcVzMxo67Y7lBNGhw9MYQFLrGfQ
 WvF7wg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aynpvu0ga-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 19:31:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2982b47ce35so4216165ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 11:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765481514; x=1766086314;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LrASXI6znESlT6+VMhJjmcgNU47qp3dF0DDnq1IYifI=;
 b=kkMKxBoxMdeAmIizywp7N7rpz/Y1eSES4Pezzj8CEAE7TTf6gCcHYVVR5Ls3xO+ubI
 JFFgE2Qw/D4lZG8toHNCGDffPlJrx7agFPfJ4bLyukz9SE0X+J3NzXTOrmlslkbxyRQJ
 gnPFMhA9o3g9nG8Lypq7JEIY/ry7VQpZT/wy5yi2i+D2MdPK0qWAtlr4Zz9uTPx/QjN8
 pQ0DMaGY6LC9K/rzY7rxa5e+HmYB4hdmy5sRkRQocSoGtcAt+ujwlhz08CptS6/p6ktJ
 CwfGJOCPzKevfkDzplZK6KkMaejln4WOqM8AcUI+eFTp7vlNFzyjlov4wo6KK1VJvGmQ
 3B0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765481514; x=1766086314;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LrASXI6znESlT6+VMhJjmcgNU47qp3dF0DDnq1IYifI=;
 b=uhpnDApZU7NRSdyO2m6hno8v0LLPY/vZJPtqJveffr9LkFMgB6gNKB4atNf6zntVnx
 6ejLJ3pXCTyB8ccxhvZSJ/CR4j0J12HYF5MjVpTptO+fTyotDzqEMPp6zNo/hM2CcZTM
 6IAb4q/uikYaD5gZfvf4XOFgXPsQHSse1TSDygKKOO++hcqhcVL84ydh7UxFWbCobp1L
 UWYB98TIQBh6lkj3tRHfeUnZmRoVaT3FNJ4KtcCXH1H3J+DA1ZKmAs2Q02atgWZveDqK
 ifxBiLvgEP1Zz4JjJ2xNIC1d7L+5jxI0XatRsqRBw2pvQucmp+GcuQHBNOToKCNNBMLF
 y7MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs4EqY46UjXvg1z5UYTKr1A9YsQYiL6i7wjvfki6FSvcakaiO1Mo9qXI8DUxYnESIYBSuF1cn/Ow0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUve/mGKMxerU7TgIMoQnJuX91O6Itc51SuT7dWWV3Kp9o/u5A
 Igu59pu6rzo04ozBwI6iZUp2w8qIu47a5jZ13yXBQjBOKB3af1k/zIdzXfav/Whkb0CMsn6UhY2
 yx3Hz3EfrAjS2+eCOXBzqKtVkZ4NuklGebiFeurPb1D5BlSXRiApf2/kHQi8nv0sZS7r3ffI=
X-Gm-Gg: AY/fxX4t80P/xjVpw/GgXHuaXOy0ZAynMcVR8VL1BFQ69/SesJbPQ4NBokuqgs3x05T
 yynXfgaTia0A1ebEZfm0swTwAj4jiU2Kum9a7QOkYW961mxtLvLJCrpxdmQZnz1mI2YO+4FOebk
 ga5DOPC2EJ08nhokXqQo1sWzMbSuBC9CBQCxO7jEZY3kqVOt6/RJqT2IPDj8bI4UhRedvAontYM
 jS+YUBMwhr2FAI608PZ9akiwKFlhQBGaiC1zJrZywNb77KvwTHJscmuNwMSkC4u8SPTIlsC9OC8
 l5IhTOpVII00BRh5JCffpcG8n0DiB15iUdlUAnVGtacNyN5jpDoxM0J8bpuzAWkNsK4p131fM5V
 cQhxaTNAOPQDoSyzXQaM/7RKZ2nJxq45M
X-Received: by 2002:a17:903:1a68:b0:295:7806:1d64 with SMTP id
 d9443c01a7336-29ec27bccb8mr72382905ad.25.1765481513459; 
 Thu, 11 Dec 2025 11:31:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwKMH3JoymZv/R9FuXFwy5r6E/RpZRMS7ShXMvshU023URAl9M1bhttp68mxYVqkF9kVyfMg==
X-Received: by 2002:a17:903:1a68:b0:295:7806:1d64 with SMTP id
 d9443c01a7336-29ec27bccb8mr72382445ad.25.1765481512863; 
 Thu, 11 Dec 2025 11:31:52 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29ee9d394desm31758335ad.40.2025.12.11.11.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 11:31:52 -0800 (PST)
Message-ID: <030a8eb3-c79e-4be0-8305-7c9bb2005785@oss.qualcomm.com>
Date: Fri, 12 Dec 2025 01:01:44 +0530
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
References: <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
 <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
 <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
 <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
 <57706b2e-becf-47ac-a874-79ce17d12b74@oss.qualcomm.com>
 <812cfa55-269d-4b19-8e18-4815608b6bbb@oss.qualcomm.com>
 <6agidc2r2d2jevtiizj77mtlytoo3raxaoe6b53rvk3obmmiha@x7pqjco4ulhg>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <6agidc2r2d2jevtiizj77mtlytoo3raxaoe6b53rvk3obmmiha@x7pqjco4ulhg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDE1NiBTYWx0ZWRfX3G8d+a+2FnBB
 20s0CNlKA+6nVBK9AF5ppaXaiQz4G0ec3e3K9v5RzTFiHNYQVx7r5H4JxgTeim+V94akg79bJmH
 KaS/eQYVmFTV4WtTDU3V+9k372k2x+QajVlleoPkENeI7wbLakpWyZInV+n8761fNvBJe1nMnDk
 65bM4KfqfVhSbtb3uGYa+Z+Vf08/CS0JnV+qjukenYGWNh+0riGv7bNcTk4yKFutISnKlhhavto
 wLElSulUrkIeP5ilSuDkKvBieOACFK4a1vsKGL9VPwdXKzltSCVfmkkzmv3unrwxBKAiTrTmd2L
 RM34AsboQulGBe75irVOMEUgnOjqEn/xf9sKA65cxKJ7eiNmC85PgE0m55ittwCE0QHGwtSYVI9
 lI4NIll+mdxLQyTcOUHOGFBcTByF9Q==
X-Proofpoint-GUID: m48obLxjT1k92t9VmdDoSMy5vBmanlt6
X-Authority-Analysis: v=2.4 cv=C6nkCAP+ c=1 sm=1 tr=0 ts=693b1c2a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=xHsVVGY7H8Oq9asR6b0A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: m48obLxjT1k92t9VmdDoSMy5vBmanlt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110156
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

On 12/11/2025 6:56 PM, Dmitry Baryshkov wrote:
> On Thu, Dec 11, 2025 at 05:22:40PM +0530, Akhil P Oommen wrote:
>> On 12/11/2025 4:42 PM, Akhil P Oommen wrote:
>>> On 12/11/2025 6:06 AM, Dmitry Baryshkov wrote:
>>>> On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
>>>>> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
>>>>>> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
>>>>>>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
>>>>>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>>>>>
>>>>>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>
>>>>>>>>>>> [...]
>>>>>>>>>>>
>>>>>>>>>>>> +			gpu_opp_table: opp-table {
>>>>>>>>>>>> +				compatible = "operating-points-v2";
>>>>>>>>>>>> +
>>>>>>>>>>>> +				opp-845000000 {
>>>>>>>>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>>>>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>>>>>>>>> +					opp-peak-kBps = <7050000>;
>>>>>>>>>>>> +				};
>>>>>>>>>>>
>>>>>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>>>>>>>> or mobile parts specifically?
>>>>>>>>>>
>>>>>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>>>>>>>> here.
>>>>>>>>>
>>>>>>>>> The IoT/Auto variants have a different frequency plan compared to the
>>>>>>>>> mobile variant. I reviewed the downstream code and this aligns with that
>>>>>>>>> except the 290Mhz corner. We can remove that one.
>>>>>>>>>
>>>>>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>>>>>>>> speedbins from the mobile variant until that is supported.
>>>>>>>>
>>>>>>>> No, we are describing just Talos, which hopefully covers both mobile and
>>>>>>>> non-mobile platforms.
>>>>>>>
>>>>>>> We cannot assume that.
>>>>>>>
>>>>>>> Even if we assume that there is no variation in silicon, the firmware
>>>>>>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
>>>>>>> wise to use the configuration that is commercialized, especially when it
>>>>>>> is power related.
>>>>>>
>>>>>> How does it affect the speed bins? I'd really prefer if we:
>>>>>> - describe OPP tables and speed bins here
>>>>>> - remove speed bins cell for the Auto / IoT boards
>>>>>> - make sure that the driver uses the IoT bin if there is no speed bin
>>>>>>   declared in the GPU.
>>>>>>
>>>>>
>>>>> The frequency plan is different between mobile and IoT. Are you
>>>>> proposing to describe a union of OPP table from both mobile and IoT?
>>>>
>>>> Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
>>>> has speed bins. How comes we don't have bins for the IoT variant?
>>>>
>>>> Mobile bins: 0, 177, 187, 156, 136, 105, 73
>>>> Auto bins:   0, 177,      156, 136, 105, 73
>>>>
>>>> Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
>>>> starting from bit 21).
>>>>
>>>> Mobile freqs:
>>>> 0:         845M, 745M, 700M,       550M,       435M,       290M
>>>> 177:       845M, 745M, 700M,       550M,       435M,       290M
>>>> 187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
>>>> 156:             745M, 700M,       550M,       435M,       290M
>>>> 136:                         650M, 550M,       435M,       290M
>>>> 105:                                     500M, 435M,       290M
>>>> 73:                                                  350M, 290M
>>>>
>>>> Auto freqs:
>>>> 0:         845M, 745M, 650M, 500M, 435M
>>>> 177:       845M, 745M, 650M, 500M, 435M
>>>> 156:             745M, 650M, 500M, 435M
>>>> 136:                   650M, 500M, 435M
>>>> 105:                         500M, 435M
>>>> 73:                                      350M
>>>>
>>>> 290M was a part of the freq table, but later it was removed as "not
>>>> required", so probably it can be brought back, but I'm not sure how to
>>>> handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.
>>>>
>>>> I'm a bit persistent here because I really want to avoid the situation
>>>> where we define a bin-less OPP table and later we face binned QCS615
>>>> chips (which is possible since both SM and SA were binned).
>>>
>>> Why is that a problem as long as KMD can handle it without breaking
>>> backward compatibility?
>>
>> I replied too soon. I see your point. Can't we keep separate OPP tables
>> when that happen? That is neat-er than complicating the driver, isn't it?
> 
> I have different story in mind. We ship DTB for IQ-615 listing 845 MHz
> as a max freq without speed bins. Later some of the chips shipped in
> IQ-615 are characterized as not belonging to bin 0 / not supporting 845
> MHz. The users end up overclocking those chips, because the DTB doesn't
> make any difference.

That is unlikely, because the characterization and other similiar
activities are completed and finalized before ramp up at foundries.
Nobody likes to RMA tons of chipsets.

Anyway, this hypothetical scenarios is a problem even when we use the
hard fuse.

> 
>>
>>>
>>>>
>>>> Also I don't see separate QFPROM memory map definitions for Mobile, IoT
>>>> and Auto SKUs. If you have access to the QCS615 hardware, what is the
>>>> value written in that fuse area?
>>>>
>>>>> Another wrinkle we need to address is that, so far, we have never had a
>>>>> dt binding where opp-supp-hw property exist without the speedbin cells.
>>>>> And that adds a bit of complexity on the driver side because, today, the
>>>>> KMD relies on the presence of speed bin cells to decide whether to
>>>>> select bin via opp_supp_hw API or not. Also, we may have to reserve this
>>>>> combination (opp bins without speedbin cells) to help KMD detect that it
>>>>> should use socinfo APIs instead of speedbin cells on certain chipsets.\
>>
>>> If it is a soft fuse, it could fall into an unused region in qfprom. On
>>> other IoT chipsets like Lemans, Product teams preferred a soft fuse
>>> instead of the hard fuse. The downside of the hard fuse that it should
>>> be blown from factory and not flexible to update from software later in
>>> the program.
>>
>> This response is for your comment above. Adding to that, the value for
>> the hard fuse is mostly likely to be '0' (unfused), but all internal
>> parts are always unfused. Maybe it is 'practically' harmless to use the
>> freq-limiter hard fuse for now, because 845Mhz is the Fmax for '0' on
>> mobile, Auto and IoT. I am not sure.
>>
>> I am trying to play safe here as this is dt. We don't want to configure
>> the wrong thing now and later struggle to correct it. It is safe to
>> defer things which we don't know.
> 
> What is "soft fuse"? Why do we need an extra entity in addition to the
> one that was defined for auto / mobile units?

The hard fuse (freq limiter one) has to be blown at a very early stage
in the chip manufacturing. Instead of that, a soft fuse region which is
updated by the firmware during the cold boot is used to provide a hint
to KMD about the supported GPU fmax. I was told that this provides
better operational flexibility to the Product team.

-Akhil

> 
>>
>> -Akhil.
>>
>>>
>>> -Akhil.
>>>
>>>>
>>>> We already have "machine" as another axis in the GPU catalog. I'd
>>>> suggest defining separate speed bins for mobile and auto/IoT in the DT
>>>> (0x1 - 0x20 for mobile, 0x100 - 0x1000 for auto) and then in the driver
>>>> mapping those by the machine compat.
>>>>
>>>
>>
> 


