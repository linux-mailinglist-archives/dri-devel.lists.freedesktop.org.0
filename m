Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A1CBAFE7B
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 11:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01AC10E314;
	Wed,  1 Oct 2025 09:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cr1g3ir5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B83E10E309
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 09:43:50 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5919AOCx002323
 for <dri-devel@lists.freedesktop.org>; Wed, 1 Oct 2025 09:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 N2j4IW5NnafXAEbG+pjQfoEONtDY8QkYi5eJLubVjC0=; b=cr1g3ir5UkiwEBvm
 MF19xEjjZNFLpWiia40lSVhQJTEc/LnUBzjVmNmES0Org2hH21Pcot5oQIn6Z9mQ
 RuNTu13ANd3FIpC2NErDG1DK+9d9ibnw7f0Bl8ZWKLUSk283Iz/GNwl29XmC/Xd3
 wPBG5gr7LbO9RTs/8SsFC2oDoH/nCu/Z6X2JgH3LVnAiHe195pbrv7VG34rC1Q3s
 iY53lsuoBS7eNdx8HgMUZOlAXd3NoIYOi1+vQSdAX0YORyd3RaluYOTBye6Z1hCh
 QDcFDYCttVQERidFCO/7vyP/rwp9yghkSyLmxDUs/mgBy0iWRsn46dwQYc8TxzZr
 xX+HPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr7h88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 09:43:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-860fe46b4easo188969985a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 02:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759311828; x=1759916628;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N2j4IW5NnafXAEbG+pjQfoEONtDY8QkYi5eJLubVjC0=;
 b=YHQdplq4kDIezbsNnUU4zabSOeHJOU61uZm9ZFmo4Rt4TJqZpPyjf+C+Wqfxnfw0VL
 hNZbN6DgZwhCZy5lIrWO0Tb5DLD2vfI2CX2VQTkxdvPmnyFqRZf0HOozY5TBf7NpX5hw
 amii70nPhnDzKUIZEYBwa2Xr+FCuLPcpT3Vm6r8o1IYeWaLSCWA0xtZcZkXQ9s4F3kn/
 YWYHUeZf26nkjqjJ7mk+qxWGqioJWfnkm7edogiLgnrA8OL4+baGf5djMJUyTb2KbhCK
 8WaYvymuqTzk8kiN1jTQOqoHMNJXJ6fwYar2gxx1yekH8RklR3r6xW7OS53ldeX2xKLQ
 kAbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd2Qfv8QYI5Qy/Waxx4CqyVRyWmFT9ephJNS4R5Uafw5jdy8YArC4Aj6R7U4w3AjvnKihpnVqwdio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGB4rf3UdeRuLbO2Dqmr1j39RiJBGslXdKHi6q5RhNV695t4xj
 Kfr/pRb5lN9zif1tc4K5oBd1NrT4/a+1apNrE0msGeZb4c9eMrzo5+dO5tgDB6s/IgltOfE3X83
 vA6iG6pw7o9H82hyIzo6j+HUuuAOPEcC+mytzN0HwAr+PaERfFOEE+xblUu5XPeWEvzPfW64=
X-Gm-Gg: ASbGncuTyjD6zeyYMgA9X4R1PdIiC+IBdH0zNsSxKs/lHxKeEz1Zr/SrUG3TqWloZoF
 SSZ+RZ6MVL29iTXLqM3ho0zzTqLw1JEBpHGooQ/3S0HWhpr/L79frKg5az/k23Bn6KxPckSqNL7
 dEU4qKpWqopaItKnH+awK1qRq6Uc0eGpU42FlPY6Oc62WbQAMIlycgbW5nhD19Y9/nJ8Hug8LdH
 LWcFSBEpnJML4vw9Bz+tcrM9H5SoqpupfMfg0JqaLKnuDqiSTpKBebZCyNK8xeykUEkKWeitvT1
 y5Ym1YZFgXSyNE5vhATZFquHDpkdf28DQhM4HLgYyiMUD8UFP6wdtfWVDhkB2lYi4VWrv3XUHIz
 7v3SeNXQ9LVx/AgKvxO8ADSRGfN8=
X-Received: by 2002:a05:620a:17aa:b0:856:40d2:b1a5 with SMTP id
 af79cd13be357-873765c02d2mr274222085a.13.1759311828490; 
 Wed, 01 Oct 2025 02:43:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQhu+9IequlFgOauptmEqJZoeziWIrkfkjGafmFpxFA4oL+2QREZWtpjKdLAbnfpl7vBk6qQ==
X-Received: by 2002:a05:620a:17aa:b0:856:40d2:b1a5 with SMTP id
 af79cd13be357-873765c02d2mr274218385a.13.1759311827918; 
 Wed, 01 Oct 2025 02:43:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3e60de51c5sm648473466b.15.2025.10.01.02.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 02:43:47 -0700 (PDT)
Message-ID: <869d1f94-9d66-4045-abdb-6e88d504a884@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: lemans-ride: Enable dispcc1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
 <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfX6PJy7dfNpBmO
 ZkMnDj1jJ0E8frxtHz4qJgGn/UzZThqgF56sIxxjh6IIkodDtXlyx20gnsAuPp6qdlXDeVMhLwB
 6FcF78SwMuLqh/ehaQohkIla+zB/mftZd+QFFaT3s3QC6hdBgPtVj7i3WAyj7zYE4sa7Lo5hplg
 wcEBLzRgKaQE6NT/7rs/7PUQd/IMybXD9hld0VpxnAtcAZJOLCm68eLC9z4Yqt3g3+YiWowcLBX
 VmfWUyN9vvGuK3AxXaZox/0JxdOGG6NG0TT/XWvkuSA6XZSfSu48vM5q3x1YV0M3OpWU5d22CAO
 CodXlIha+EC+U0rL6aUfqrmcdvQPcbuED3evmWvT9nVxGtDQI72M6Jl43Pp0ov0UuCfOti/W23+
 /t1MtOjTbvpJUat26LRsuK8+y9Ms0A==
X-Proofpoint-ORIG-GUID: KMIRR3YQGdpH9K7TjUpyxMumJdqOuRXh
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68dcf7d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=ANimo7j06tBtS7Sznz4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KMIRR3YQGdpH9K7TjUpyxMumJdqOuRXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082
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

On 9/26/25 3:53 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 02:29:55PM +0530, Mani Chandana Ballary Kuntumalla wrote:
>> This change enables display1 clock controller.
>>
>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
>> index c69aa2f41ce2..d4436bc473ba 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
>> @@ -436,6 +436,10 @@ vreg_l8e: ldo8 {
>>  	};
>>  };
>>  
>> +&dispcc1 {
>> +	status = "okay";
> 
> I think this one should be enabled by default. Unless Konrad or Bjorn
> disagrees, please fix lemans.dtsi.

Of course there is no reason for clock controllers to be disabled

Konrad
