Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B65CC7FAE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 14:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9BB10E05D;
	Wed, 17 Dec 2025 13:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IilCwr4h";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFHJdNw7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589A710E05D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 13:52:38 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BHCKuWQ2764479
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 13:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MUcFSeForpgs1zaOWkq8M3g4jUQqfiWW8mZI5c70ols=; b=IilCwr4hKN14NE4I
 1siREeR44j54HJR1QBX/8we3n4wgCQr6ZmKT8NMxp6BHsqt9RbpktPpTJWfGLqKy
 t7OWuDEpvSdMe5lXZihFb3rXDZEJEBvtsYxDnAE/eidS/xvHd8Qc6xV5QlLGy1+k
 Giv6yLboDdA79j7/bNSnbhwMUmenZcWDqtd9LWT/1331gfscwuJ/UdtfagI8Sf9J
 iR6+JnCmhynarrOeV9/ndcjoU4xmRdj2IQWilw6j4FteT0JsnWEg4dUT/IGO5wD+
 0+sv8rX3t0uM+wpkbbsjJRZSypUMwCFDJcz3zRhlqcnVLtTPM3bYmCv1KPO1FhbX
 9YACYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fefjkje-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 13:52:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b9fb4c55f0so107455285a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 05:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765979550; x=1766584350;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MUcFSeForpgs1zaOWkq8M3g4jUQqfiWW8mZI5c70ols=;
 b=RFHJdNw7yZrBF2RA/9YzVuc8xH4PaoViOjlpf64CCWZ1/31RrJtCYq6fm0WmJsYTwR
 D01li/5VszWc5wQaT4+m+dBUoPBliJInJD5IHy7ywGi54Ra8EM+y6myVh/F+bRgYMoL/
 zrr66iD0swqKTnL/3W8yCp7kEuAoL0mw3wsDh+4B/Jeppa9heF6eCE5vx5p7vs6aben8
 yLIYgGc473By1QPnzt2EGV75BeAuztNvxwUeH87KiyhnqpMZkA6rIQJ5GCcL6L2v7He2
 YnEzbljSaCgMn9jBdcGN9ALDwMTPOwypl2cM10TokmbH/EukNEqij5ZzhJqcn5OgJsS3
 pnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765979550; x=1766584350;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MUcFSeForpgs1zaOWkq8M3g4jUQqfiWW8mZI5c70ols=;
 b=N1qn5HnoyoypyeItTA+whkTfzPMkFe4y1mwhAsfrFVgOq/BQt+XgribvRdxyg3Bbia
 MdoXI08lzLQJ5h3PsNm17mCLbwEiRy4jDLtTBHS3EFYBYeMmAOq/tjP3Q4jDJep0N03V
 MTi/8K4s3LTdlMFw8gZlCr9G2smNSLOqq4eeHeNOURjNgfILqkGYcKeeCNU18ipeE6Bp
 yi6kuIubpdXaqeAsobdQd6++BfxhnQZITZo0pzJmzyRyd5BeEY4DMSlFRV21M2JRkByh
 FmmTWLWDVLJg+4q/LrwMo4wQKPAu77JtRwBN7PECEPkMU+cjFlufy+8mCZMIbkmq4iBo
 8/cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLk0gCgmhWGi4ZdV03E8EKgF7JR+XHvU1SYuUVhGXDxfHuGbx8gmlvgiJWMsGDej9+f0jzQhOsETQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxc9LgdPy+k6LN5MJ6KXIYcQSbgz6PaCqMC6qvgIn0oVP6/OSZ9
 uixMYKazEXPkKtVcvz7krsbVTDU1kC7knh4yRla1L1iS4L5tqT3VuRYh7Cusl/5UFu7yEDY91Ok
 nuwBUE256VgkBpugomjjKw3HPI4HNzyU+VhU+wrsG6jb8dii4/zTokmH+OkjQrznPKfqEGVs=
X-Gm-Gg: AY/fxX4RoexwUyJm8iFfneV+iu6dkt5Uw1jH6tlyFFO7BmK1P/Wvs36O3u0v/0o+yRe
 HW1Y+Z668LnSKG8x2I8mQ45oERfSBGZgDXM25jR/HG5VyALL1ZJYIZ5UlnQHmzC1AfmwPbFpi8i
 +V30mBSPRn5NSu60CbA6Wyiul4WbYFNsF1oTNaYKc3Bbv6whaAp2G2k4z9TU7ueddxTb9hIWXJh
 xY1TXYUqU6ooABwWHruHQRDtk8vkFUtNoZm1kQOa2RQiBwTLaO+94ZBF7LRbPkE6DEv1ChvbQVu
 5N9o/MUHFCQ8LU3Tt5Q3jO1idO2h+F8MefFAt2k8BGP+PA87BSS6Wto5b0tzvB4GWiz8H6Hl6d1
 2bq822BznUiMrH53zC1TAFM8+ZU7fVx6vyTb+Ac29G2MauqbyVW93g/ZsQ3XziaDHeA==
X-Received: by 2002:a05:622a:102:b0:4f1:b580:fba8 with SMTP id
 d75a77b69052e-4f1d04e6df9mr194858071cf.3.1765979549961; 
 Wed, 17 Dec 2025 05:52:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHn8FBGFvWlziwKU5p3n+hs/jstKbKvea0UICNhQkpwL2yQQ7Zau1SiOTq9MXzcJTbdWmhfw==
X-Received: by 2002:a05:622a:102:b0:4f1:b580:fba8 with SMTP id
 d75a77b69052e-4f1d04e6df9mr194857621cf.3.1765979549545; 
 Wed, 17 Dec 2025 05:52:29 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7fc04f6015sm1054089766b.50.2025.12.17.05.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 05:52:28 -0800 (PST)
Message-ID: <5dc3d3e0-a338-4f2f-8987-5705fc1fde51@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: add mdss1 display device
 nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicinc.com, quic_amitsi@quicinc.com,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
 <32f013e7-ce2a-484b-8575-e98f2d23f59b@oss.qualcomm.com>
 <faau2h5z53frwfply57oh75zr5gcz4gf3za4vflbyht3ok4zgz@2ylcwcqcl4rt>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <faau2h5z53frwfply57oh75zr5gcz4gf3za4vflbyht3ok4zgz@2ylcwcqcl4rt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwOCBTYWx0ZWRfX1XocACfepa00
 zVX+CVTDM+SY1Z3+VmetpgYqLoNmHzldjt5SmmxCuHqu9IPU1O7W/yYGe5SKippmicDyOavlTTr
 qRJVlsoygmGPocVbrIVqZqd6fJBrdJpv8cmeonqpL/3gLTkBG0nAoGh7sBHDAkRmsmYMF36hQ7i
 A338XIDAG5M3vzkh0J0VO1xf5SP+E8yHX/wM0oP1m4HZAuQMQwWiJTmxfta+msAH17rn4Hya77c
 +YTKUMEjrj+LESfJ29MHyPv4ogwzb41MrtwGdMZDRcl3QdZzkmPDasRTEvYjyq71dJz7H9UZQgA
 d55eaRrAMy5xEzNpAvR242gi2hGZ+ZSqRAMCHDIBIMJoUK/zzwhrEjV6eHhtIikXxrFqvOFZJI2
 IC0Fr6ESPRxkSBKbsF3omrZ4f7UBhQ==
X-Proofpoint-ORIG-GUID: RBokrh2XthF-a3hCzwxQDQ59iiCXY1pH
X-Proofpoint-GUID: RBokrh2XthF-a3hCzwxQDQ59iiCXY1pH
X-Authority-Analysis: v=2.4 cv=R48O2NRX c=1 sm=1 tr=0 ts=6942b59e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=CW_yPJa_05T0x9ChYMQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170108
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

On 12/10/25 9:21 AM, Dmitry Baryshkov wrote:
> On Mon, Dec 01, 2025 at 02:35:44PM +0100, Konrad Dybcio wrote:
>> On 11/25/25 11:56 AM, Mani Chandana Ballary Kuntumalla wrote:
>>> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
>>> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
>>> on the Qualcomm Lemans platform.
>>>
>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +			mdss1_dp1: displayport-controller@2215c000 {
>>> +				compatible = "qcom,sa8775p-dp";
>>> +
>>> +				reg = <0x0 0x2215c000 0x0 0x104>,
>>> +				      <0x0 0x2215c200 0x0 0x0c0>,
>>> +				      <0x0 0x2215d000 0x0 0x770>,
>>> +				      <0x0 0x2215e000 0x0 0x09c>,
>>> +				      <0x0 0x2215f000 0x0 0x09c>,
>>> +				      <0x0 0x22160000 0x0 0x09c>,
>>> +				      <0x0 0x22161000 0x0 0x09c>,
>>> +				      <0x0 0x22162000 0x0 0x23c>,
>>> +				      <0x0 0x22163000 0x0 0x23c>;
>>
>> The last two regions still happen not to exist
> 
> According to the memory map I observe, they do exist.

Hm, you're right, I don't know why I couldn't find them in the past

Konrad
