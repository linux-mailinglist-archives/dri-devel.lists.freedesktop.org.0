Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308B5AC2F2A
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 13:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDEC10E008;
	Sat, 24 May 2025 11:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/Fcyp/N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54CB10E008
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 11:01:06 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O9nitr000895
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 11:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uBT8QXnAoYnSly3TgloEh2i3dSX3runD8Ha/A6cIC/A=; b=N/Fcyp/NC9GTtEYW
 yK/AFO3BxuesYqSkqbvhSRXAQHcjASZ+zoyYOVp7tHxa34C50CgY6Hdcf2ZjWbBd
 Gfobap/24NjIDUqQx5mPuGK3LTTXaZGqr2B2XhLCJkv4K75ydgUXki92AKmmnmOd
 SZN3ddUrZMwTxQC0O3pwC1OVTQNhDkcHLMGR2N1sGPriALxZuY1mYWnMx/96ZMYr
 Z/DQHuK72Z85lcM4u7osURHktBPnckx9ysb+L8KfqqaURKWyUOy+bvJiPvzYZUN5
 1D4mkEzlJ5phJzkKdetVT1sC+J+jVTOZHpbeZM4OqZNtFODtUjfuBOjbWECP9RQn
 YRLkEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5ghm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 11:01:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5af539464so22557585a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 04:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748084464; x=1748689264;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uBT8QXnAoYnSly3TgloEh2i3dSX3runD8Ha/A6cIC/A=;
 b=dVsVT0ABXI8tsFKHKcJENRoC8RdoOvcxzzv6z61wHqgAlW7TXudfTsk4GqEhpoeGy3
 U0C64qHWQTA8HEGEp0fx1j4KAs+Fs5RfoIKEVXhefCEjiUiNDLg/VpFvPe3a7rmoGh79
 V0O4eWk8LbcKNYy0SkGmAoZWqC9f7ulJtZ6QAB1yutjrMzQLvpDGsaRoyuftcsqUXLpv
 y6Uc3xWrq/dXqz5fxqZqaV9CBNYOkAzK+vsBozgwp+IQmGzHhC1HBONIMO79JWixvhxl
 SzZlNBf3AjUQ8hsQoLW+ULOCJCxHIVXe1vjmjC95cO8BdSh1cXHqW/BFSBCqr3aI1vec
 7RBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgTdcxG6Os3koy+amA254COLCfnutxRZFElyIIZ7Wy15p81+k0T9joT7L+giue0r05LOHy1APtXuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwswRGaC3WamnjTXnPAC+R49NwfBd7/nz27qQYiCh1P/6fVMK9S
 mcxPZCzmJG9iq82rntk0BqcRqH/Ko2b9Gd/iztgebmrWzjW8I2twv2FpKM6icmHp5wcVYyIx0Fr
 3IEVjWYfvFlt60jJFQrJknn7SOJo1j4j0An35zsY1xyD/0S/qg9HeQroOK+3PFL4+biI+Blk=
X-Gm-Gg: ASbGncuOUndCpmxe5xKjmiNamCIyiKPsk/4FWKbgWgWy+4fcYRKtXHih4lwQF4So0oN
 JNBdN75lbRMNGyGE3A73my6VZfuPHIRP3ovVxiTpF1VF7V/XJT/OaL7ez5+dybpzksQ6gHmHfDo
 Xi1E8MoWHbfih/iywG/h420KTwhWogmk3I0HQkyRNcdGgU4/92UYdCDKOzOe8zrOEIqZy04jkZN
 eKAcvxuwgz6gIj4xomqU/tJcTtazGviGYMTkcpf2x/RrracvXZos0KaZ1vqFR5zcK6jWnGnRp8k
 f7AIRyMyhslDXEEaI1hPE3GBYV+uAR35BXD4K0JEQnEGUxFdu0t9pIPY31NvE22gLw==
X-Received: by 2002:a05:6214:2a4e:b0:6e6:9c39:ae44 with SMTP id
 6a1803df08f44-6fa9d396e18mr13300326d6.10.1748084464343; 
 Sat, 24 May 2025 04:01:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt3zT9ObE4H3laeqssPI6a1m8vVV+uGCihBhTUhjMgPqOlKiS/ZHkjAau8uvxRtp/e5FS/WQ==
X-Received: by 2002:a05:6214:2a4e:b0:6e6:9c39:ae44 with SMTP id
 6a1803df08f44-6fa9d396e18mr13300066d6.10.1748084463739; 
 Sat, 24 May 2025 04:01:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d438086sm1369934466b.89.2025.05.24.04.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 May 2025 04:01:03 -0700 (PDT)
Message-ID: <bbfc2598-6820-4d0f-ac09-406933771365@oss.qualcomm.com>
Date: Sat, 24 May 2025 13:00:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: x1p42100: Add Lenovo ThinkBook
 16 G7 QOY
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
 <20250524-tb16-dt-v3-5-17e26d935e73@oldschoolsolutions.biz>
 <6iuro54yed6tqfej6l2l2ky7dletbs73nwjnfufbuulkw3kl46@okoj2v3wvck3>
 <342fadba-978a-4aa6-a393-22221715a5cf@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <342fadba-978a-4aa6-a393-22221715a5cf@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=6831a6f1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=Rz0-UGbwDQDUX_AfhhUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDEwMCBTYWx0ZWRfXxZCU5BF7rJ+e
 ubw/5CffaTR4Ro9ZVjfy1SUQM3Vv/5HIxjzxKSXdZST9tj+9yVzoBmWPWBzTNQ59OG/JdII2HN7
 IYWkdEhfc80J0EFiS21Q3mku8VtWo0o4pcGrPoixzDHiz7nZKgXXtxWwY2fRAdmeXu3cNNYcwE8
 jivwJfikmS4RCFv4rmQarsSwou3tnmqNKKsP8/22+R7U0YK3pFlIlCYnimuDSpVU1zHaItMIZlY
 Ht2LYK6ITTIjtD81fEjRVWZEQ7Izk4rWkdt4F5PEkwlFHDaH0tAVezmKr45k6rp5XaV7w7Xiudk
 Yt5yzRL0AyP/12n0W3PQvmHGmbSbxZHAtrwPdvs9dFC7qtHWbEH1oHS6RgDFkApMsEarVXU0fsH
 E6KXl7jE0bJ4PJ1BCClbPFmkIBgAF+Rz+QHd+6Og7rEwe+hygTHjQWbzQsnILiMVGy6WsSgg
X-Proofpoint-GUID: FkmDR-57AcSsvqXUV0xkDKnZW4Y3UrnL
X-Proofpoint-ORIG-GUID: FkmDR-57AcSsvqXUV0xkDKnZW4Y3UrnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=889 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240100
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

On 5/24/25 12:36 PM, Jens Glathe wrote:
> Am 24.05.25 um 12:11 schrieb Dmitry Baryshkov:
>> This will break without the next patch. They need to be squashet into a
>> single patch.
>>
> Changing the order wouldn't suffice?

It would, but that would then mean you're introducing dead (i.e. not
compiled) code in one of the patches

Konrad
