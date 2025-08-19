Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E3CB2BD1B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 11:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCFC10E577;
	Tue, 19 Aug 2025 09:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVq0ZZhM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFC910E577
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 09:21:47 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90eE3018109
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 09:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XeLoNElQRYDHRk++SgBPgdfN1LI9ODXyEKJtgngTUGA=; b=dVq0ZZhMETwhqEnt
 s9EfemQb6XzcugD0fg40sr83pH+2k2K+UZgvgtAqw3++2bTs7uSCmU71SU/ZjD0B
 AfsOk8hvc8Q7Kr81MndamSUWR2bF7md+pIjAgPxSGlFjYjbfFSsrlTJT7NXtddY+
 rnMEi8lGjgX8pt4zPAnjAZ1fTfPV29jlnqbA2zrbTwLMrtYmAQxQFTsTNV4fehh7
 nNOJVdCMl5T2Rcq6ZyCN407NxCXsuYu4QK37AVfeLuyZNIoxOvTb3xO98iOGtoLv
 DzynLzO1RjTNZMNMCSZhfThoyRcF0sJJh2RxMM0amncpykOcsHo0PJqKMTtdaD6H
 pJ5tAQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagywc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 09:21:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-244581ce388so117439385ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 02:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755595306; x=1756200106;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XeLoNElQRYDHRk++SgBPgdfN1LI9ODXyEKJtgngTUGA=;
 b=l76iKQbBXa+rMW4JO98ha54eDXd15l0DhMZeXfLMjcwgmIljQ/2YOt6Iqn0Ogl+VSt
 0KPfrY29wCLzSQYD4l9qF+K3yrgzKvKXiLVD2aLxeLOp0dpeky7aWOXK4MsRkzXRt9UB
 ZbkTNKzfR5ABl02AUCE6SVw0EhTQKiefhUmxJ2iLiQG4OUiZsPl/+bU6PXx0xzqtTIO0
 d5GRCgTSno8olMYvnNj0Yfzl3fie7NccxAaF/9TcTaeyOcM1tnUNCIwJdmkvIOBoXCP5
 ooeXkSzwlItdXV7Skyh7Rz8DENTFXvHV4WExeqayo69nH2BOSYGoVgOcQG5RSsN5IBd1
 Ux2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFJNVPjmzqkbZ3UDQpyeJlt1pkIZTlGme64yvlDfOccJdUgaL/vtzxqcwrWhjwqrOBHXwJtzFX9c8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynsXK68NRDLh8UA0YwDHhGuzu8Nklyc/gWwB/v/iwc9Cjx5YfT
 Pgmf4T+44KYn9DGaCeNUsEK9xy1IdYXNsce5tuj9XaHQgP9porGH3stv+n/wYttar3pZMuGdAm8
 nsJ2po9Ems8IZzsSEpzbYfcqRi5SWZiNdtoezXiZdCSk8xVMG3RwGeRXdUBQEEkhv3q+5Ljk=
X-Gm-Gg: ASbGncsuSD4fP0EbVPCH5ui1Iban5K380qyrQ/d/tsM7AsSkptX4uAEyietCO/MvPcF
 a2Ru8EvJ0Bg3Q3TxKt7ImCdTCTeamxm5z0OXAvZPrkczN6pZ7tH1bYjmYHV8fBLHLeEaZTHQPsu
 gKzqlC1za+QQi02fF+RlgVesVmT9l1SwVolWddQn4MXuHcrobzFcguSmulAZMDNL+0EPcoF1ANb
 6zg43LTvTCXBkA/DroirhVr67F0Q9jGDleg0nuUajU0U7rBzksQ8itXG/CwfvJAvvZFa/aV2YuE
 B5qiaSQ/TNJM4V1Bi41tw+4X2ZFY1SHQ1svhHw8m5uWKLpkEpB1K20E8aImfn2/hafg8kK/REGy
 W3wSRThlC6DmDud6MOrlNl/1WcILB9Q==
X-Received: by 2002:a17:903:37ce:b0:240:4b3b:334f with SMTP id
 d9443c01a7336-245e04926b5mr26682775ad.34.1755595305586; 
 Tue, 19 Aug 2025 02:21:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpiiFaPA8kQRfNSDplxINgiGA8HlGb5Wu8T7SwEDTnoUTiI6Noo4c+zpUmfz128LX8UgJLAw==
X-Received: by 2002:a17:903:37ce:b0:240:4b3b:334f with SMTP id
 d9443c01a7336-245e04926b5mr26682375ad.34.1755595305122; 
 Tue, 19 Aug 2025 02:21:45 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446caa3806sm103046795ad.28.2025.08.19.02.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 02:21:44 -0700 (PDT)
Message-ID: <76ff9434-eeaf-4ee0-a8fa-aec566c46c2a@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 17:21:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
 <20250819-qcs8300_mdss-v7-2-49775ef134f4@oss.qualcomm.com>
 <20250819-ant-of-ultimate-genius-fbfa1a@kuoka>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20250819-ant-of-ultimate-genius-fbfa1a@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a4422a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=b6vJvH-rrpbGiSTQa0AA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: tgHOKesxXzfCcjWbuaJtfXCAX_nHYFNh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX32lhY4oPNZNP
 Q9PjVMY4cqv2fDXH61xLRCEMxR94VAHPfQu+Y+fk4B3wBPM0QfMDbSm9IFvqPJ8DnwnCgTLwDiO
 +e7fPA0stlqbzyvehFn/0ErT0ukvXFHnJy1z36bWKh4HcJAlzZFNSCRzUlKyZ4ymWWNY23Vv/eZ
 tHm0lEI8/ZvcpLFjjMVuxKXGJ2+EG5e+RywEvk5bT85zF9YAnTjpClCfNd0nClftFUhCCIs/sBj
 Jzt36JXmhx9AYa1KvQZmnvpDWmaQ4K73AB3gONwU1u4x+6i7i9SD/b9o9CEgye3nGji2D44QcCU
 ddNnwbe1b5Go5dcf9VU+U5W+H/ZxE9TCSaPzAhqLhgCvh4bAk9Xl6Ggs2kSsS49n8GQXzDeTJM8
 skdix0q3
X-Proofpoint-GUID: tgHOKesxXzfCcjWbuaJtfXCAX_nHYFNh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024
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



On 2025/8/19 15:58, Krzysztof Kozlowski wrote:
> On Tue, Aug 19, 2025 at 11:33:29AM +0800, Yongxing Mou wrote:
>> Add compatible string for the DisplayPort controller found on the
>> Qualcomm QCS8300 SoC.
>>
>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>> with same base offset as SM8650. But it requires new compatible string
>> because QCS8300 controller supports 4 MST streams. 4 MST streams will
>> be enabled as part of MST feature support. Currently, using SM8650 as
>> fallback to enable SST on QCS8300.
> 
> I don't think last sentence is true. Where in current code SM8650 is
> used as fallback?
> 
Sorry, this more like a description error. As Dmitry pointed out, we are 
not using SM8650 as a fallback; we are only using SM8650's data 
structure in the driver. I will correct the commit message in the next 
version. Thanks.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -18,6 +18,7 @@ properties:
>>     compatible:
>>       oneOf:
>>         - enum:
>> +          - qcom,qcs8300-dp
> 
> ...here not.
> Emm, if we need new compatable, can we add qcom,qcs8300-dp here? 
>>             - qcom,sa8775p-dp
>>             - qcom,sc7180-dp
>>             - qcom,sc7280-dp
> 
> Best regards,
> Krzysztof
> 

