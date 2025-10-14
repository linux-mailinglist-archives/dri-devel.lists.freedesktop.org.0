Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A683BD84A1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 10:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E9710E57E;
	Tue, 14 Oct 2025 08:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTIbnxel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B2410E57E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:53:36 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Hgb018094
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yu6GxXvjzVdp0jD9TyFSB0cQTPVuV4yy/C3ICodMY8c=; b=kTIbnxelhGa2sVP3
 boJK3HyeqmX/0HOgmXYWMij4nlauwxuwRmcj0aAOZC4nC4JsZAFPBu3yvdYA6Gjl
 aJPSbjTRO5XYviCOe3d/StKOp4eBS4kFaxp8IpxTRPa9EkjQhRE97dB3bco2DMyy
 ExLDNvHIFyeDsenozVaaiXx8hbeOVQkVIE+06H8xn0QlAnPwUFvtvhDDXpzbJJUQ
 RES2xTPr6phcaIik9jHxJXDZ694LxbumoYb98FK4U+Y6oFD4smz72AGvwcXiFbD2
 WD+GJ8WUBOOrW0qJQc2Wn1Tv9xMjgxPvsZtyrVRg2G5DU5HoODBTW92jlmzk1aSw
 ffoEog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qferyt6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:53:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-85bb4e88394so207575485a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 01:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760432014; x=1761036814;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yu6GxXvjzVdp0jD9TyFSB0cQTPVuV4yy/C3ICodMY8c=;
 b=Jgf2DGNtZw2Zr2501bYlNZyZVFdQDtQT+HZcEtaAIcXSkueGLkGyPQcb/DnXiL2Jzt
 mnIky1mUBKjtaTht+rEML5Idnw3He1/YNMdLpXCK7n6eJLXMwy3oAVVHpzicUJAU7mCp
 M0iHrEJiM+eAdrw/8gCbmqEkYHHNf2o4Dkc+JrDRVf3ykdtL7ZRLKSKIZp4pZbgAt8Yq
 Bi6Eue0o4j/NsGW3ComhP5odw3dBpDhjvOqxjnL1ijU4dowWv/V2J6f8Tu/UuvCDP4Qr
 uPL/gC84q7GLZV7FtNiYFBFAqZSRYLYngM16TP7tY17tgkpOQ8jzfUeozienD9yhaTTQ
 FCFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlKqT9QNKFwaWQ94060p9cz6w71HNl0iX+Jw66zDUYNDYQt8B9FQi/GI0H/bR1+CRWVbyqzwWO1PA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdMHxuG64QtlcOqAqbN7mg1yaUCVj70lL2Dn+8hpg0e7W4XR54
 ZmrV5wfn8qcTZbXfuVkN9MAqdf44SPLz5lVF0mK+2rYAnqbQJTbDmGsphZumHS56OTm5NnTVsFX
 IdfbYvSrLfxDO7W73qhtAirpG1CUdO/y495KwZ5Q723gsFEG00VpF7VC9UwTAcbQQ8o253S0=
X-Gm-Gg: ASbGncvcA28TwiGNp9/65B2kU3yoZb9YRHsH0QK9q96zDmdqXXXfr+7nlVp52zZL/Nd
 fS2+kIbsCqQnoysMrUbmtnOwHb5Rm7w8OKM0rVMhbDMGWONfs1ayRSUHd/JyXhSPybv+Ld+McGN
 W8JtFYUdiRCVF+MvZMzQZHfrm3jNyM1I9wL5tMsIbZmmf6v5pvGdDezUJLMyH9E4kJyX5fKKmCv
 3sqci+ngr6XkB6op8+DnnvzMGpV5jtKUUIQzCbYVJfxhQ8extUdASR6ZZGSinYAyIGg2KrVksBh
 LD09Oc4u/Pq3aAsTy3fyRG8zmVrjmtUcEZpqoYpkO9Fuy0NRwoK1qutOJa0c0xuc1WS5G6nE36q
 OIwhvQpEmzo50OUAs/zbF9w==
X-Received: by 2002:a05:620a:372c:b0:86b:12e2:28d1 with SMTP id
 af79cd13be357-88352d954aemr2148348585a.7.1760432014513; 
 Tue, 14 Oct 2025 01:53:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm4ixM4YDDyNB4X3gy92GuzgILUxOgPYXhz9lsuSEFNcMwwXiOp3PYD1SDSeDU0RrlNXPctQ==
X-Received: by 2002:a05:620a:372c:b0:86b:12e2:28d1 with SMTP id
 af79cd13be357-88352d954aemr2148348085a.7.1760432014042; 
 Tue, 14 Oct 2025 01:53:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d8c12b4csm1136163866b.56.2025.10.14.01.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 01:53:33 -0700 (PDT)
Message-ID: <40a9643d-01b3-434d-9163-da35c2e469b4@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 10:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-7-quic_amakhija@quicinc.com>
 <fsqytqhe72bgmloyzm6khoprq6bysf52ufz6oi6epos7uadyho@wg4rxs6f2xyl>
 <374098ea-23f1-4d1a-8f70-313a7e384f8d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <374098ea-23f1-4d1a-8f70-313a7e384f8d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ee0f8f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=BM6OdSh4NsqE7HirI3EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: DQdFPKulghF7zrwy5e6cSHsaAS6ua33U
X-Proofpoint-ORIG-GUID: DQdFPKulghF7zrwy5e6cSHsaAS6ua33U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX/knvSj7mAAV7
 dUkAHDLcqUavl+y2rJtdXxjXKdPLCPbOoGgMjh2rl3uCDIg/keosPauDy/5Igf6M0elw4hKFLCS
 hi1QZ614SY/RWFIBUAw3UHcn2qFp2WE2yQxFgvaY/zuy3RnJCssB/OYch1ucp1EEJ9uqp+QeCZF
 IdOhunUJKzT3g+vZ+AXIei2QC8sYdq+PIwJq/RQabcdWFleuB7KDYxGuU6fwYs4vib0nHrxnFjH
 63Cb2UHfI6vownrWRruZU4PIzQGpSj188+2QmThO/L4cCL2q9mrE9vh+EF/EfS/es+Yv5GmlBn/
 Jg4A5MDsHBKn6KCiAEK0nDNF+uWOaoapH8DzMBH03XjelwHiEE9QMuViSPbZpsxy0TqDaCuyr4J
 BkqpaB6pGZcbM4wXfp6kkwoyqtQK2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
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

On 10/14/25 8:24 AM, Ayushi Makhija wrote:
> On 10/6/2025 3:44 PM, Dmitry Baryshkov wrote:
>> On Mon, Oct 06, 2025 at 07:09:23AM +0530, Ayushi Makhija wrote:
>>> Add device tree nodes for the DSI0 controller with their corresponding
>>> PHY found on Qualcomm QCS8300 SoC.
>>>
>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 98 ++++++++++++++++++++++++++-
>>>  1 file changed, 97 insertions(+), 1 deletion(-)
>>>
>>> +
>>> +				mdss_dsi_opp_table: opp-table {
>>> +					compatible = "operating-points-v2";
>>> +
>>> +					opp-358000000 {
>>> +						opp-hz = /bits/ 64 <358000000>;
>>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>>> +					};
>>
>> Does it really support only a single freq?
>>
> 
> Hi Dmitry, yes it support only single opp frequency, I got this information from ipcat sw for monaco, similar
> we have used for LeMans.

I can attest to that, even though I'm a little surprised that's
the case

Konrad
