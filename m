Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBE2D19DF5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C9910E4F5;
	Tue, 13 Jan 2026 15:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PazK/Nv/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwtOEnv/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E2B10E1E7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:26:56 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DDsXun2071301
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F1az1Woti5BYc/nrE9F+K1wucFs6vzpU2BiesykC2Rk=; b=PazK/Nv/9u0YNnk3
 4f2m+A63AA6/dckoLcdhElKLR4gyvfV+TzwRMfShfoFjQ0oIlbm/TQcXNQtFh0LZ
 Ksx+/ecmR4UzdyiFD4l2N0dvX/wdoBMidautqc25z6PQCWsz+b/Jn1PGXwufDDs3
 VYmClSeuzwtmrtbwcdld0y2X+/A3rPdo2f9vxCxCJyx/SsJ3kcg1ApwL6JE++WvA
 r8ggYoxRYEJx1UG1uqoRxgNEM7JC1/XIQw47dnUgdYilLVwIikSivKgYN1JV3CB5
 wxc3tOVG/K+poy3XS4tyMrcBlddDAdpETFxRV+DT27Qb95iibWJ1Gttgg+ah5BEc
 6afLEw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbm8a4j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:26:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ffc6560f05so17949921cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768318015; x=1768922815;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F1az1Woti5BYc/nrE9F+K1wucFs6vzpU2BiesykC2Rk=;
 b=iwtOEnv/vr+s7edW3xsh2xIhy/GOksfG/Z+sAfXb15Gy9rYNC6YZyw4Y4IlClFQ+Nc
 3kXEEKxfccOKVOFAaJfkzhC0N7qJ9x5F9KSIcPzQoKjUri4JuGkgJM0GFLjM+lF6l+sz
 SKz+1Xq1yNh4bVmBZjlhkGFSI3tET/7N+xfItOrZNPDaqgotuvWp6Jnrfq2trJRojldT
 59vnUoPhpwHCFzoAzp6TwF4l551DI3gCwda8P2l+elyPpBpWsqb80w2wDGevSHHku4IE
 V8COJDzRvgPkva7l8Gmk5uxj3KInEtvPxPLBxGcUR7HehKwDtBKpER88kk3aavYPPv5S
 EEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768318015; x=1768922815;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F1az1Woti5BYc/nrE9F+K1wucFs6vzpU2BiesykC2Rk=;
 b=FFsizDE4JMskVHlQuKNy0sywcY5S7YhYkKd15xaMTC7T0eWreEJ6QG8H7iInQtOnrK
 BTRVC7krVowT8xLA1L1k1am8PD4M5X6hP2sBw94pG1MCM7w/fZ5lHxHN5P/BLJPmfMrF
 jWTwm1f1/RgzFodfytL0571Srqar8ck++K0lTJlwHX7duGY2NWrdJfJ0bRxpaVgRNllx
 fv6An3RuvvNjdLLM8tcRggAOfZTSHlIz80rPIm7jO2F0QtDbg/H+77eXkG6W5hfiP4qF
 NM0nw8uHNtjd5SP4PIAs+MkBK0PBWJyY2SWlhFa+TnDFkuyF1THfcpg/yrXP6E8PEd3K
 Hwyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMGgfTICNy6OAMzvVqIjayJnf1W+eU+nzkt9u0hsdbru8rT19ZZQQPqgrm296/XnYWLCL/qnaH0gE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+2gRXxxtajV36iUTY99V9mNcyFCOt+8DMOoZ38cR05/fgX12q
 IzD+Drx08imx4DwmL/1Q8EZiEkyV3HK7LfJldzQ1HNa8sfacQSCpR+Hk2Xsc43mQniqM55XAwpZ
 Y59833kYPEkLUXs8jhaIz1tE0FoDfPpaTFzBqxw6BvXWmtdjN6H/RwITRh+B0aGcuxekK98w=
X-Gm-Gg: AY/fxX6ofluuURrfc7au7hhTX5YW/g9KBB+kZ1XbcvQ6G0vNjgvfbFUryFRRa3ZxjiX
 FzBL8Xgg0gj7YMXdWbMHdupYnixrLlwumcaK7EWw3paehllkIDBFYd1XEePNGcA3YUKBc76ffLc
 xBk+gcxUjf/+qixRJCmpFP8nLNYnqKzdJRN68xw49iCxotMX8RJWRx3oUnJlCDdydn+5QbhluSl
 zWiI0yPzeH0hHkRmAsJhqrhDD5+h5hLqV42H4Md//3L1B43ZYHwOg5Hvwerqe9Hxp3VyfgNRjkl
 sRFsf5EIl4LGn8u122jHPxfI/Nsrv3BDLvB8sH6/+3NG5v5tRa5dVBI78ySBCTHHFvDpel7N7R3
 Q7DYhB8CaEUkjmx1Vut2r6Ghw6GaRpH0Hup3zpbURvtJFYoaoVxAWLzYVNFrRo35KVII=
X-Received: by 2002:ac8:570f:0:b0:4f0:299b:c785 with SMTP id
 d75a77b69052e-4ffb4acf414mr226028011cf.11.1768318015272; 
 Tue, 13 Jan 2026 07:26:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH63OKsfsC1PCQAIfHI6h3nw+uJWv7koCZrOmWbLpsbWAxrJGkd3sfSU3Ah9H1bPnxDS8ArwA==
X-Received: by 2002:ac8:570f:0:b0:4f0:299b:c785 with SMTP id
 d75a77b69052e-4ffb4acf414mr226027601cf.11.1768318014831; 
 Tue, 13 Jan 2026 07:26:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86ee5287e4sm1020534866b.52.2026.01.13.07.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 07:26:53 -0800 (PST)
Message-ID: <e5472469-84be-4ae2-97d8-6756f2cb1a55@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 16:26:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
 <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
 <spk2wlfjgrtvkbxk2rzklsdg7ojpcsehl6c5fzaergrq2chpcs@p6s7px3lrtt5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <spk2wlfjgrtvkbxk2rzklsdg7ojpcsehl6c5fzaergrq2chpcs@p6s7px3lrtt5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e1q8IaZOmMGFhM0O_RZ8QHoCcU9CANcf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyOSBTYWx0ZWRfX3+7yMQBYu/3a
 xTa26wVCnEAI1a2wLp1C2mi72oBxpwtJ/etaDvF2NZLHLUzS5LxL7L//LW1XR8Chp2anRGtt3LW
 F5EJdD5McqiDUbcUbniz8oHWkPsrFUIygnaEiDRJQ5gwzpmU/t+kwFEryDfDG/iPBJSpJ0xSiQI
 KceUiELhEu/dhqNEqCZhxNxjIG7vuEQqhHOXXICUaWiuYPZG6V5YRn7VtpCZkdK0uEC4R7e4NNH
 TBq746pV0lyKv4uyTtDUflgYHLr/Y1uOPcpBdjbIv6lPSyjPkDJ7JlGjvTvXhnWBAGzVXQv7wQx
 YJwx+N6y1VMMeS4G98S0uUbCPkKEKamaaqMtBdlcCktjaMQLExuyq3sRety1xK1N49gVeecEGTe
 8v/DhKkJLpGdicpUrcJnWzglHALZ1hjgHJDek1qP3WNBOVQcFjqg7ONKio949H3QkIqFk/bnDhu
 syxzCF6JLn1uJlt4+kg==
X-Proofpoint-ORIG-GUID: e1q8IaZOmMGFhM0O_RZ8QHoCcU9CANcf
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=69666440 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2hdBVZVomPjqdouaftMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130129
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

On 1/13/26 1:24 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 12, 2026 at 12:08:13PM +0100, Konrad Dybcio wrote:
>> On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
>>> MDSS and GPU drivers use different approaches to get min_acc length.
>>> Add helper function that can be used by all the drivers.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  include/linux/soc/qcom/ubwc.h | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
>>> index f052e241736c..50d891493ac8 100644
>>> --- a/include/linux/soc/qcom/ubwc.h
>>> +++ b/include/linux/soc/qcom/ubwc.h
>>> @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
>>>  	return ret;
>>>  }
>>>  
>>> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
>>> +{
>>> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
>>> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
>>> +		 cfg->ubwc_dec_version == UBWC_3_0);
>>
>> Are you sure this is a correct heuristic?
> 
> No, but it matches what we had in MDSS driver (and I think it matches
> the chipsets that were selected by the GPU driver).

Should we keep a comment that this is a best guess that worked out so
far?

Konrad
