Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40891CB4086
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 22:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FF010E277;
	Wed, 10 Dec 2025 21:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLaqhhBy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qw4W3lnR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D764C89EB1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 21:11:02 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BAKS9164009368
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 21:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bfNgQDXXb8iWBGKdAi5rKgqEDEYcr51IEsgHSku4xr8=; b=CLaqhhBy0oW4NfTA
 Veh/x0/TcqmAMrnMZj+melezU5YkN1Sn4u3O5BZF9GWf1Oydv2qBr9vlV9g9iy6i
 8ObpTD4fXGzeoWt4gR5fxLzJN/+uXBw6IPXdnul5A2w2XAkTcnuAEGCGEf/rRte/
 /lQBFIsui7fpwgW0ErDDu2a/kaGxYyYY3A0gLQQOZuLPcj6ABdsmYE4edx77sceu
 JQxpOVVNIGvJWV3jC2orOCXUd2iOY76RydmzCF/vgA3rn/5224ZeZK3BTCgQgnkz
 T4WpqsogsirERyTFdMK0QcV0FgVHurTPG0xhJKUNYWhvqoJv3F2rY90CdDniVXkW
 SWghGw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhp95bg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 21:11:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7d481452732so424536b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 13:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765401061; x=1766005861;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bfNgQDXXb8iWBGKdAi5rKgqEDEYcr51IEsgHSku4xr8=;
 b=Qw4W3lnRakDXr4ACkoJ3CHZRsrwlALz/zjP7JHTaBVMLBuYoZSQVFV6Pt3JLR0dLqt
 T5f/0w20bFh6FefOczGmRw/itRz+Sxok+M5goynSguagUC29XNGp6x5udjKnnnfCky+2
 QXOlQfVcg16V9PdclXL+rtp3JDbD75uQH3TV2nFAJD6KazdHeEtvhssLOytUTBzxl5Bz
 hJYatxfUzuVZ7bWDPxLSM37ZBChF9hu8K3VhVuZkcbqxcR+WqgzNDpt4wSByv1j5xO45
 z1PHXXEFCMg0vmBnCvmwkoY6Jnv5Q9tE41CiwP2bEfxJayPR2OO+HISUvSvPDCKUU8HV
 Ztng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765401061; x=1766005861;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bfNgQDXXb8iWBGKdAi5rKgqEDEYcr51IEsgHSku4xr8=;
 b=nBu0x7+M8psc3Etxj0eJ+uTTXQh6iB5WdR7PNzejzME4d19YG4YIJXH8bJFYj46wUF
 AshHC0ygFW6Ppt+ca76Uj+FvFmu0BQB87KQMKm09UacGag0+oP/AzjZ4mIrE7z4OrWfa
 0ZbZ4yuTProN/+FmkoDtEQS2Ybmc7BRD+7c7OsPQXHCOAJzLj8T8e1gl8ktLcOm6TKyh
 JwfRV7LqD7kV+NYNQRx6k2IyumrhXVUzOh5LwNNCDhseERtWgE57lqtFMrSu4B270xK2
 EyGINseX9RfmnZZ1strkfKnTnnKcZ71kOjDRv18eg+zBgRkY5pBoIduWVgIWhf8T03yS
 24RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3Npd8A7gqfWNUHhZG+ZL4tIix4tQbAb7+5drlezYfiGWjr2QFCVxCFsAqjTnI3fTYPbRNap1FUkM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWdtfRTP4D5ltxGAD6/VwDcFFazltE44aWVPkCmHTQ+KeUEMdb
 EmvyMs8Qi5daFeIlN2MwUIJs90Dpz1ABsch7P9Phi1+k6M4dULfwsVlTm9wnCuNZJiFBHDdb7wn
 p/+EpOZ98gZIYnW6SxCArCg94Ih0EcfD4KvR3h+gWoJjdCm6dcfszsJ9ebiIZJfyN3ZHt2B4=
X-Gm-Gg: AY/fxX78ulSh3W5BXfP8QkFTR7/jUZml7z2BdYm74kQJI7i0WEibl7UJ+aWu3PIIiYt
 xXTV2i71MrJozbmSbDbGvikkD0tetrTywNmaoh0tDkRRBRMESYMVv1qpu9tAF55GcHwBzr3Gi1z
 Rp2cPokMLXYk4pVAowjDZpfWpFwI8113SUbbDJHWRGt0sIcxO0hFimCalurYoA+YwITIpwJaDyq
 2OSVrwGxyiFPpHJBQiRXB9ceu1QowW2iP26X1gd/EcAfbBwPSbKhvNwDWxHwAfxqSZLYjhRG91S
 bXc6zO9T5lgV/3qFuWsYgCeKW54J/KW72+RPH31dMuK/UJUMs8HleJsAI4J9zyI9hNMUuRhS1CY
 9NP3hs2u+UnNSf3CXS2dc2IFDSkK2vI1S
X-Received: by 2002:a05:6a00:b91:b0:77f:efd:829b with SMTP id
 d2e1a72fcca58-7f22e0a30bfmr3813218b3a.22.1765401060887; 
 Wed, 10 Dec 2025 13:11:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbBXzDiOXtSdMaF2b7fdEH4r75SwGnJGdOCk5npK2CmpZqJ2QEVbCBDzn/HBSCMic4HCMWZw==
X-Received: by 2002:a05:6a00:b91:b0:77f:efd:829b with SMTP id
 d2e1a72fcca58-7f22e0a30bfmr3813195b3a.22.1765401060352; 
 Wed, 10 Dec 2025 13:11:00 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.96])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7f4c4aa91d0sm402642b3a.32.2025.12.10.13.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 13:11:00 -0800 (PST)
Message-ID: <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 02:40:52 +0530
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
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE3NCBTYWx0ZWRfXxB/F5OwSA9Vd
 V6RPwTjgm8TjMvb4n4thbSd5XfcLityhjiDwffIUCQC89wbvDvdpbwFaLNbe9yEu9aK6yyO3nsD
 bn7fUmPlU2Zt+cAoCUPzSZsyfA8OxkIwJBgediBNMJKeFzb3ZLgxMv6lV3OKqPgSAFle217G6ah
 fK4xyub+GG22JTaB5NCyoVjybTXdQg4ZweeCs92QkX4faqLIq1XUk13+UmA53MPzHO/yS2Gl+71
 w4Mp4h1/q+0W0sF7aZcuo7kiv617hX37LSopXGTmhH5q3Z08jUsQ/NH1MQ0wJIJuyTSIwbCIocI
 BYoryCa2sG6EoQUsU/cX0DE+sjwYGUVVerJb/JnYgxGCBa5G0hxTw8jH05JO2LKdvSwyc+QKMTM
 QVaTc4CGkETUHgyLMlsFOP6mz+Hang==
X-Proofpoint-ORIG-GUID: fQiulPkZ9czB8WB1ZhNhVUdDeEEOq_ai
X-Proofpoint-GUID: fQiulPkZ9czB8WB1ZhNhVUdDeEEOq_ai
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=6939e1e5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=CcjbiXvC7xLhAd+qVKJczA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=iOf4mfiAVVuFJQUywdwA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100174
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

On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>
>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>>
>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>> ---
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +			gpu_opp_table: opp-table {
>>>>>>> +				compatible = "operating-points-v2";
>>>>>>> +
>>>>>>> +				opp-845000000 {
>>>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>>>> +					opp-peak-kBps = <7050000>;
>>>>>>> +				};
>>>>>>
>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>>> or mobile parts specifically?
>>>>>
>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>>> here.
>>>>
>>>> The IoT/Auto variants have a different frequency plan compared to the
>>>> mobile variant. I reviewed the downstream code and this aligns with that
>>>> except the 290Mhz corner. We can remove that one.
>>>>
>>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>>> speedbins from the mobile variant until that is supported.
>>>
>>> No, we are describing just Talos, which hopefully covers both mobile and
>>> non-mobile platforms.
>>
>> We cannot assume that.
>>
>> Even if we assume that there is no variation in silicon, the firmware
>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
>> wise to use the configuration that is commercialized, especially when it
>> is power related.
> 
> How does it affect the speed bins? I'd really prefer if we:
> - describe OPP tables and speed bins here
> - remove speed bins cell for the Auto / IoT boards
> - make sure that the driver uses the IoT bin if there is no speed bin
>   declared in the GPU.
> 

The frequency plan is different between mobile and IoT. Are you
proposing to describe a union of OPP table from both mobile and IoT?

Another wrinkle we need to address is that, so far, we have never had a
dt binding where opp-supp-hw property exist without the speedbin cells.
And that adds a bit of complexity on the driver side because, today, the
KMD relies on the presence of speed bin cells to decide whether to
select bin via opp_supp_hw API or not. Also, we may have to reserve this
combination (opp bins without speedbin cells) to help KMD detect that it
should use socinfo APIs instead of speedbin cells on certain chipsets.

-Akhil

