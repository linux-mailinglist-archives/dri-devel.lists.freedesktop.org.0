Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1224BCB59BE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 12:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AE910E7A9;
	Thu, 11 Dec 2025 11:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OgWC17zU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3TL6sYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF3910E7A9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 11:12:24 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BBAXuhu1597545
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 11:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nYDLFP9b/1c4pXko38MT5KA8qHbxB4jvUIX8uXejm2o=; b=OgWC17zU0zH0nnk/
 iMPBcgfPe8ResLdMrtvvpL9X/AXQAajU6FVAq6w9cTPfdBZTx5YyR0WwCnLT8r1s
 yNZboI4kOX/cfdaWttw58fqMZWRB7X9C93qKdb2m5j+rqg28yiBhnbzkHjpCzrZP
 PSr7oXtXeoyk2ujnZ7ThfSTZhoddLYN7hl+QclFCwmpZfvq024JQrXh3LCnsYq8x
 cN45oUEt77TPILQ5D1hdiCmIOLV5fjjtq/E92+lDKCsRcIsr/dpziw4thr83W1RS
 HLN0wsSKpw2PWm0ONqHX7s1zUrr5b6brFfCTcJX8nWcDqgTd7TxY7rzMix01X+K5
 stHTJw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhpbcs2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 11:12:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2955f0b8895so19036865ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 03:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765451543; x=1766056343;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nYDLFP9b/1c4pXko38MT5KA8qHbxB4jvUIX8uXejm2o=;
 b=N3TL6sYlcWyc1+++zg3FM0ZWnHA+8I5taIBg1oR3vh51NO1tSIaFaiIMhVcWNXD0rF
 VkgR6YFV+eA4jfwdLC5MOkDdbeClNUyvc38Ad8xpmWvPVzhYDw/LhHSXk3upwSxts6lW
 foegnDjGamqW/iQ1JxDsnUfM7VGl4QZVWy01ZQqth+84zHDcLvAK2WaFJIQX7oWvzN8i
 X25iGPo1XCmWoM0qdnHSvZ33WZgwzsneOQ5pvdEjvqb/rCTqJ528MI7kYme/hv0ppQAA
 vvptVZZ5HziRFWqQc/gcLQmaIKZSZkgChOyjP8ciFzr+5bZ8MNnqdozhvFDrTIU7CFLu
 Hy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765451543; x=1766056343;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nYDLFP9b/1c4pXko38MT5KA8qHbxB4jvUIX8uXejm2o=;
 b=MPu4G6VqYneLn696G9B/g+Bzpl0HENWIOXyXWhvGaMiw1bIon0E4Oi0F85IC+3x7i4
 FMbRIfXqxFcbKKdCajjAIlvymSE9DK2YrMWiMd7mSxDKcbGnpXhLgzLBB2ZcvGJECB8Y
 6BoO9WN5XxMFXUzhLSmAnJdPjuHZCj4YjA1Zn7D5SnfIQNfBeL3khvRX8ZZSnS52d+VL
 bxV46itWQXbliQ1mouGyCcjlO2fJsKr22Kk6fNtBfLAY+QWFMWeJDywIRn4qxo9UyAG5
 3L/d/ms5vMsg6SaRTgV8MGQ0S3dX53QBj+6OYQpRJJFAImlt/up5MOYiwcE12k2NJ68v
 8XRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV+OM8J+UZatFC5gMX67X7DKLtX9zgqzt3cR11tw/N8CWlJbxHwLbg9d/xAUmD205z2YwHQAPbhiw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzatvGbmflOKY7sfQndkVdj+xIj6AewpPKvThfI1FF55ct5XBWF
 g3ea0PK/J//vF0xXGyhWpW3Zgh63oPh064BZo1VkAZ8u+F765rBiqHqPPVONEnA3gGtTG55K/1h
 ysrRX40Nm6iqyc9zBqFK+EIpM79pQOCkikL+iqKc5rH0cBRtwO0/crCj5MJBR4sl2H6r/qEo=
X-Gm-Gg: AY/fxX77VBFL4MJ94aqrHjyDIdi22RUNGxWaODEGtPFQTRGpC8s+e7woZuvNhNZIUZL
 buFyWQoNvarLufPzOtkIBCxSFLTX4p8hkowwLjnCLxpYGUBt8hoaMJUath9VHL4YUk+I+q5FkhM
 7Wjz9ruS5YWT5MseFHEKZrWUxaIj7n/NjGTeuShg7v5/4Q3gP1G0tyCPljR7Lt17hNbIYHECzFT
 ja2SdoJ/GLKwfsQQKljFKNwdHKhNaBZvv/ulMFBDhR/nGAT1Sye3zXRqsfRbqtBBp33OD+MkXOK
 wDz0DFZ6dJJsEnqV+9UZiQ/3CSyYoofwgGGkUNwO5ek8DKW+3UgWm9lRnRRYqRQlmHlH/kksk5z
 bqyw44qJelzzqFK8lLq86xIoxsx2h0tLr
X-Received: by 2002:a17:903:228a:b0:290:ad7a:bb50 with SMTP id
 d9443c01a7336-29eeec1d562mr19896155ad.27.1765451542668; 
 Thu, 11 Dec 2025 03:12:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSxcR+t5PTEgJPkTzQ8uhLer5CJXS8Vq8pvl6loFtZkKr35tm0xP60CurwEJc2gIwwdS9J/g==
X-Received: by 2002:a17:903:228a:b0:290:ad7a:bb50 with SMTP id
 d9443c01a7336-29eeec1d562mr19895715ad.27.1765451541983; 
 Thu, 11 Dec 2025 03:12:21 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.96])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29eea03fcd8sm21961715ad.74.2025.12.11.03.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 03:12:21 -0800 (PST)
Message-ID: <57706b2e-becf-47ac-a874-79ce17d12b74@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 16:42:13 +0530
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
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
 <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
 <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
 <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA4NiBTYWx0ZWRfX8OdgCrPd235V
 UpXg1PUlkSvpGQVcYaatJIjqECVP71GjVV82BPMzimaxR1fgzAcOY6tQ9lfxnXT8i5HgY8CwFEA
 Dcspjv/geYlXazpBoc2wobNJ/vzMaCpvhm9N39Lbnsc1eTs8pY3ewIHY8/ZqVVNE6oXm9ph8pcF
 /XoHQ4nqtrmT1/Itiazt/k4tTBjxBjhChH7C9BwAhn8tIalm0kFn8AU2BR0NoGVHgaM/jZe10yF
 iOhLs8LVA7p8vMQZSmUZbh+1lmc8SqVW1uarzac9bwVf/ICKSQIOx5GfVZqjQsoM6dcbYPngNnJ
 +W5gvD2qGeZNF+UtdnfQHbe5to/pFDoy07r9LBuuuidJUu9b2dQWVKTdY9ClTvNT88J8NxQitx0
 aN7JjkFuqApu2O42/RdzdUmlwWeoaQ==
X-Proofpoint-ORIG-GUID: MkptBk2A5ssnv8Vd0lOKIT2T0AxxGyK9
X-Proofpoint-GUID: MkptBk2A5ssnv8Vd0lOKIT2T0AxxGyK9
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=693aa717 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=CcjbiXvC7xLhAd+qVKJczA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=5yBAA5BE7NXvCg71rZ8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110086
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

On 12/11/2025 6:06 AM, Dmitry Baryshkov wrote:
> On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
>> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
>>> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
>>>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
>>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>>
>>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>
>>>>>>>> [...]
>>>>>>>>
>>>>>>>>> +			gpu_opp_table: opp-table {
>>>>>>>>> +				compatible = "operating-points-v2";
>>>>>>>>> +
>>>>>>>>> +				opp-845000000 {
>>>>>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>>>>>> +					opp-peak-kBps = <7050000>;
>>>>>>>>> +				};
>>>>>>>>
>>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>>>>> or mobile parts specifically?
>>>>>>>
>>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>>>>> here.
>>>>>>
>>>>>> The IoT/Auto variants have a different frequency plan compared to the
>>>>>> mobile variant. I reviewed the downstream code and this aligns with that
>>>>>> except the 290Mhz corner. We can remove that one.
>>>>>>
>>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>>>>> speedbins from the mobile variant until that is supported.
>>>>>
>>>>> No, we are describing just Talos, which hopefully covers both mobile and
>>>>> non-mobile platforms.
>>>>
>>>> We cannot assume that.
>>>>
>>>> Even if we assume that there is no variation in silicon, the firmware
>>>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
>>>> wise to use the configuration that is commercialized, especially when it
>>>> is power related.
>>>
>>> How does it affect the speed bins? I'd really prefer if we:
>>> - describe OPP tables and speed bins here
>>> - remove speed bins cell for the Auto / IoT boards
>>> - make sure that the driver uses the IoT bin if there is no speed bin
>>>   declared in the GPU.
>>>
>>
>> The frequency plan is different between mobile and IoT. Are you
>> proposing to describe a union of OPP table from both mobile and IoT?
> 
> Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
> has speed bins. How comes we don't have bins for the IoT variant?
> 
> Mobile bins: 0, 177, 187, 156, 136, 105, 73
> Auto bins:   0, 177,      156, 136, 105, 73
> 
> Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
> starting from bit 21).
> 
> Mobile freqs:
> 0:         845M, 745M, 700M,       550M,       435M,       290M
> 177:       845M, 745M, 700M,       550M,       435M,       290M
> 187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
> 156:             745M, 700M,       550M,       435M,       290M
> 136:                         650M, 550M,       435M,       290M
> 105:                                     500M, 435M,       290M
> 73:                                                  350M, 290M
> 
> Auto freqs:
> 0:         845M, 745M, 650M, 500M, 435M
> 177:       845M, 745M, 650M, 500M, 435M
> 156:             745M, 650M, 500M, 435M
> 136:                   650M, 500M, 435M
> 105:                         500M, 435M
> 73:                                      350M
> 
> 290M was a part of the freq table, but later it was removed as "not
> required", so probably it can be brought back, but I'm not sure how to
> handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.
> 
> I'm a bit persistent here because I really want to avoid the situation
> where we define a bin-less OPP table and later we face binned QCS615
> chips (which is possible since both SM and SA were binned).

Why is that a problem as long as KMD can handle it without breaking
backward compatibility?

> 
> Also I don't see separate QFPROM memory map definitions for Mobile, IoT
> and Auto SKUs. If you have access to the QCS615 hardware, what is the
> value written in that fuse area?
> 
>> Another wrinkle we need to address is that, so far, we have never had a
>> dt binding where opp-supp-hw property exist without the speedbin cells.
>> And that adds a bit of complexity on the driver side because, today, the
>> KMD relies on the presence of speed bin cells to decide whether to
>> select bin via opp_supp_hw API or not. Also, we may have to reserve this
>> combination (opp bins without speedbin cells) to help KMD detect that it
>> should use socinfo APIs instead of speedbin cells on certain chipsets.
If it is a soft fuse, it could fall into an unused region in qfprom. On
other IoT chipsets like Lemans, Product teams preferred a soft fuse
instead of the hard fuse. The downside of the hard fuse that it should
be blown from factory and not flexible to update from software later in
the program.

-Akhil.

> 
> We already have "machine" as another axis in the GPU catalog. I'd
> suggest defining separate speed bins for mobile and auto/IoT in the DT
> (0x1 - 0x20 for mobile, 0x100 - 0x1000 for auto) and then in the driver
> mapping those by the machine compat.
> 

