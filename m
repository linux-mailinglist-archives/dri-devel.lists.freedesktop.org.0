Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691C6CFDC41
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 13:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CBF10E5BD;
	Wed,  7 Jan 2026 12:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMHSwdWB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uc1/LMxc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAD810E06E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 12:51:33 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6079q6DZ218483
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 12:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QUZTglwraTogm7+NgckDuNvX5948M5h70ehV8ZhNvJY=; b=fMHSwdWBpysbeo1Y
 mF8qyROaNIEzcjL4hAE8pAe+P1p8MOtxFc5wlTL4c3hL4B8/Do9jQ9lx3EQ/wi5u
 lih3FIeUOI1OwzuiQsGlpB/inhpS675SxzIY+Wgb8YB4+5/5HP2c0TMpNEyx6+xp
 WWmnauN2GhE1N5U0uAG5drADfelQ2lXw7jBzSVMgsbZVOHdLBSSJiLgdmnN00v+G
 xy6sp765mn4GbWbQR+aB4MBNowGeY6cU6jVJTEMcxYAeVet02Wet62zNUd+bYrn3
 AN4FWCB6INMaBMKOdyMUC5I8ZkXayss0HHgYqFjfWXdt2Ec2MS4980kuD6BVYXBW
 SZX3vQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn808fv3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 12:51:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4f1e17aa706so8178331cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 04:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767790291; x=1768395091;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QUZTglwraTogm7+NgckDuNvX5948M5h70ehV8ZhNvJY=;
 b=Uc1/LMxco46Cen92oPwOB+gOiImkk0drnW59JBp8R+CHLq8ISJW/5E5qffkdhZtI/x
 PgXmC9ej8HguOGYvioW5AQQUesfn/YLnFixVkbvoMTJOOg3zI2CU7Q12GeZc+h2KOMMB
 s1Bk2ZnK9dl3GZlv9f0Lm/cR/hbR01NC6XyiwK/6roj/xGx7NEFVsTWrAkEQ9bzeVINa
 dDs6WfrnUL4GVfbiBvsKV/u03n5RIByqcJfQwlwZD2G3DLuFnZDeJrYgiJSutllJyRXV
 /hKFkSvjXmJwMCFDz45W9TT9OKjP8x5NSthpLjKVsMBL7SwO7HSnuRrehtmncNZKsv0I
 A35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767790291; x=1768395091;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QUZTglwraTogm7+NgckDuNvX5948M5h70ehV8ZhNvJY=;
 b=jtdfPBTrUtTZvFaBGfFG3gP7pt5HuiQgRRsTqGP00oi5CwJ6qhdgYcbaJAgiq6Wv/8
 kWHGmrZKerRz0HZTjZZDegwDC4VYMEi2ADlO9JyDhFkeOAnKKsQLLDDeelRv2DqvxMML
 ig5RPB40/7pis6uR8fx+OCW9Kk1RoIxhM4qlg4BV8DUcNs26986XyX0MWMXRqB+nPcr3
 B7VSUm0C8869IS3S8Kpzsk/Dv35yv+/7XKmfXN88famTRGE63O9lI1gmrUlExNB16Y7B
 9mtoFX2w3FuIM5Sbu3TG0wYcO/HITHLpgCTCqum+GouU0U1AQiiuA+RO3nhN4iEYgsCC
 8DwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA7u70ekfTNalSM52JfgGHZs9QVK+GKPyQR5qmG2MRLI/CU5ZLgOjgpj5NNSrtGDqxsfBu5Z1ZKnc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNDcBMqyUI5ZmjCLtwl840ts6muscyIXJRFDzRLC7Dnr0Lck8I
 Bgx+tf+9jr65cD+TOO/6pUUxpIsKqpJbVCHrxiLDo2vyHTsd0vwp3ZDdvSwyxYfBpVAhs6YI20e
 DIqbIEExDTlIjwnEv31JWQxbFPKl61+nXzmwId7cHnwAovCp1qvN0IbwWRsnI+vVaVwuwuaI=
X-Gm-Gg: AY/fxX6/YNBPBY/+hxWyE/vT3Jz9rjqxqiuEWrMsfXPl/MFQ+QwZUd89P3C957HhmtV
 GdGDT4dc7Kjt/VExKhhxmXCvj0Lk447mIrobeQPGtSGgchNbTM/fTv96WNqL1wPH5SnAxV3NuQ4
 1IpqEWvtZc5U0ONm1LrvqvTJhl8SA/xbEqstm3hRoXa9g2JV+CWOLrvvFN3RljppkdEY7wheoiE
 ybBFzfE9adGoX4oVEfG5NfbEB0azAibSiEmL/pFiWGO94YOu93FM6NYkavEZ85sQvKppIMylrbz
 TLsCje06dzTbx6PgTFHu0XHskoynHJD82FEkfa4pWzEzerKfZ0JILDH2O+eSPuZ1i7ptmEz4q+8
 Wcf+gR6g8kYh5K89lxe8GDbrr0pMYkoFcEm6zm4/L3bhI5jXJP+KvNnRgjV/Po1qQyLU=
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id
 d75a77b69052e-4ffb487595amr24144021cf.4.1767790291425; 
 Wed, 07 Jan 2026 04:51:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiICMonpfvJ/R/ogSG1ceuU5+Ajgk2M561kN++MvOVvu6wIhe7i7YbrcIT4yFCVxsLVoB38A==
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id
 d75a77b69052e-4ffb487595amr24143771cf.4.1767790290995; 
 Wed, 07 Jan 2026 04:51:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a563f0esm511541866b.60.2026.01.07.04.51.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 04:51:30 -0800 (PST)
Message-ID: <af654d22-92e9-4ea6-8431-c76ee844d32a@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:51:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20260104134442.732876-1-quic_amakhija@quicinc.com>
 <20260104134442.732876-5-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260104134442.732876-5-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OtJCCi/t c=1 sm=1 tr=0 ts=695e56d4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=OIU6w6j0321fZR4p8lUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aUzTV6WQjtfGUZtSvhaya_c-rWHoTKgE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5OCBTYWx0ZWRfX5MkJaN0zBDJf
 ZxKFYptOcpQfWuxn2V7aowNeEmXSHEiOhc7YMOgr+0Gv2hBh+WRBHMc2zPmSgCBHu74Net6rq0B
 FxwzbjDWOYLGjzRtsRa4lW9m8jjq9cPLzSChChm9wRZ/7cAmzUdGT3oA2pi9To1vL2r7FN8sCfZ
 EUWzeRMdh4Nn5zEQy+3l1lTdTjH2ZZc3i/d0Jd1ckDdEjoz8pa6SXr+agWT1qKpbDa2Arsg21nK
 O06pEVCKznw8E2aCRk/9HQOmruA5J8EN9y15NiIaCt+fwTAzH5ntCsyEMLxhoLkPiG6BlzPSOQW
 PKEt+EOwgJ63/0Xr3qQa1TpsOQt8za4DXKwfTNUpcuxQv9Ng1ffskofU7XRV4mLH6Edvo3G9BuI
 7sgUvAgkE5/NyqvKBt4/MKkDIuQRfCt2cgAPmj3rfgEjEjULMHlynTSKg6lrbY53weiCSHGlfBd
 yKZuDb/NNzz/xEEVWRg==
X-Proofpoint-ORIG-GUID: aUzTV6WQjtfGUZtSvhaya_c-rWHoTKgE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070098
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

On 1/4/26 2:44 PM, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 controller with their corresponding
> PHY found on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +			mdss_dsi0_phy: phy@ae94400 {
> +				compatible = "qcom,qcs8300-dsi-phy-5nm",
> +					     "qcom,sa8775p-dsi-phy-5nm";
> +				reg = <0x0 0x0ae94400 0x0 0x200>,
> +				      <0x0 0x0ae94600 0x0 0x280>,
> +				      <0x0 0x0ae94900 0x0 0x27c>;

size = 0x280

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

