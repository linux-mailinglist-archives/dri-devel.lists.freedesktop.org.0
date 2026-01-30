Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKupFeN/fGk8NgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:54:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89C1B9151
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D1810E936;
	Fri, 30 Jan 2026 09:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLZ51zPu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cafNe7PB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB60D10E936
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 09:54:38 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60U3Vgck2992857
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 09:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H9+DAV+c/CZgBH4DD2jfZcDSjLwf6jHYApWbhBRrbJ0=; b=FLZ51zPuR2jby4lo
 tSc/czS0eCZMucXmZkjXl5qnsv6WmbE16cUZ52mpGa/Sxugkrc5PaaX/2RXQrHuw
 u8Tc6iX13mX8/HzCRPT04lmZmIcZLU/Pz/buKEQ2ob/CDqO2fHsNZ3rxdtS2nxSG
 9+VGQwtAEljGwZoJB0furVt/tZvLzrb6n9cmUHdS5v8FonBYU/m/tQDCUQCBQJ/N
 9CP7wgwSu3VYumGEkIw73KXSFn5ymPLypP9fire8+a/inRKIeziUf0ZOxi55g8iC
 6b8cIcTijbYjrw1x8NTlh5s8Cp9vVYad71hF5yrLfzUrn9pKtd/i+pOVJogW3z70
 KM+ZzA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0db1jbm3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 09:54:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88fd7ddba3fso1761446d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 01:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769766877; x=1770371677;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H9+DAV+c/CZgBH4DD2jfZcDSjLwf6jHYApWbhBRrbJ0=;
 b=cafNe7PB14QPEYpKGH9SlQpa/W+sNRezXqsa4/xsRnNZN4Bj2s3kIkaHedvMKLoW8b
 HF9FfJzqxqOiZJNOxs1JAos5jlJdepfkCI0ZCc0wgSHonm77fAHJMl9gmBGJFTjW1Ut3
 /JQ/89amHOAXx7pdIwo6fwhRTBHv7xs8fSiDDbyTza6+iPzQfAY3oy2+laPFpBYCZho0
 2SXL4eHRt03BuKHPw1hPq8xLUEt0Kl32fNgKl+I5ADpT6SPaKJ27oLDmLQZOBI41bZka
 NcS6DUWPe1Y5kVgClNjSBFNGBjENlJ+8V/y+NqbPBzP1WVE8dxs3SAbYMznRp82Mz+0j
 92Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769766877; x=1770371677;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H9+DAV+c/CZgBH4DD2jfZcDSjLwf6jHYApWbhBRrbJ0=;
 b=P5XVYgRePD75LtpJavdLCKdLKp3Dju3UV41cMvTKMLmDGduvoQmDb+bnG6I4Abw3XJ
 PRngkJH8dzZtUWVFoZ7x9gzESONCTMlfWERkGYjKJpiADMKrHkMQBT8TNNPZLa5nf0oI
 Dly/wZ0kbWmA5pFQBQzcOAVGUb0WU+j2qk17z/AsplpiXDiPNh5CRGiRfjq00kIRR3zj
 kfjgGX/2WifVO4j7mNzUfz3lj6vzVr+UKmMZ0qDkzNCPh0+jt5N5bI9Fjb/1sD7TLOVn
 m4BPlGI9IQxZRKQ0wbljz6/xreY9MKSYxkSn22Tb7A8NDT8gJD5xv4wqoR0nrJcO0IT8
 HUOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnyPX0tY6CTqpZIKPDjIFp8T9NInvl/2Y27e2VpdZ6TbPtmvg3Pya8ioP3FjkOlx/974qGMe8EIzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWW19H/FbnDdgUh47bZ1ZyHGcMQE6IxELJtbZQVE8gb5tlqWBT
 zu0Iyt+XsTAjCkd8nmMLvAhuo/xkpC323ymuNY+7L0W/7EresEOAs5gkkgSXd88eVMtRoMyBPTD
 9qPPgYsC0e6H6dNKvAIMuX0X9q/PD8d3ovWvmNw40rGT73HEsDZkZgIMQXM1YKyAsXHwvAVg=
X-Gm-Gg: AZuq6aIyNoGsp41YpGSuEm015diRTVByyCxSBfAeHOLTZLUKeeruprYCj1iyccpdv0L
 YN1Ibm5Il8+NmIc339rMNKv4QSDnmiODryQbco6peLsZkPfTq2dVCWz70o6uR9oNoOOn0GizJYx
 0qsZF5MsXtZczlGclrfhW0V289Jx5+8wU93F1byF0FosmRXcQmrY0Jqb8KcfP8hoalKu58Dc0P+
 tWRlVtZMHYm9EajuKC8K4BMFMfOGrRwwHMBBmjwb4rfDx/Y98p/bEh4yjy8QcT30EhLY4Nd0jR7
 pOouLXerxqd07IFli0PWaitpHEVej3llvI3Iie1p8BvcVN+5277d2SsE4m9w8etXrQTQss0Rga6
 MEQceC/Fwcf2H9l3PxGXKvb2aQArH+5/N1JYOu0MkMXSVZYVM66PF9tV90VgS5GoJuZc=
X-Received: by 2002:a05:620a:4009:b0:8c7:9e6:3a4e with SMTP id
 af79cd13be357-8c9eb10f0a2mr239893585a.0.1769766877072; 
 Fri, 30 Jan 2026 01:54:37 -0800 (PST)
X-Received: by 2002:a05:620a:4009:b0:8c7:9e6:3a4e with SMTP id
 af79cd13be357-8c9eb10f0a2mr239890885a.0.1769766876599; 
 Fri, 30 Jan 2026 01:54:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbef86deesm399356666b.3.2026.01.30.01.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jan 2026 01:54:35 -0800 (PST)
Message-ID: <5a70d411-e0fc-45a5-829a-c20fa02317cb@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 10:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: glymur: Add ADSP and CDSP for
 Glymur SoC
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
 srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-5-sibi.sankar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260129001358.770053-5-sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: paE50AbYAn3muFnX90dVtV0_QHPzfbJu
X-Proofpoint-GUID: paE50AbYAn3muFnX90dVtV0_QHPzfbJu
X-Authority-Analysis: v=2.4 cv=VMTQXtPX c=1 sm=1 tr=0 ts=697c7fde cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WPoQd7O3gY_o9P5QeXMA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA3NiBTYWx0ZWRfX6RCZTpSmCUFJ
 +QME0x2IdXFjCbUmF5qIfkK8GHGFpuFC172NDvV5ohHmxxbkDRpiJ5LnGl72LKoN2WVnHihmlej
 wGtLACJn3bbIWYT3csJ56X73Z4iI+yanNMYmXX0mYcXoRkbSWY79ER6tWLXXT9l0FpMtACLk2p8
 RtgiaxzLHvyef2kwKAnURgnKIXsHxpdy/Q2muCMhjYJYPfD3SCW6i4yyCgYn6O7LR9QPe8Qt9E9
 WKn9wOxqSr7pCMhOHCqZjCdP/YAhNpA05c4Go89iRjjSTqiIXq30EUt5Z77VHwFki7e+fN2XaRa
 1/Th3Aiq+0jfzIqMW56rWY81+mWTQ2DLL8JpyIuZ0Obs6pkbekVhSpOXWqG3gbYhU5HNlZ4x4I9
 XjPOjF9141rdUSDXhHQHivJ7JI/BdWfh5vla3HMY0Rr0NO910FQFPCYKaOi6SXPhJls81PEdIDn
 6LyKEpzoRM0/jLwu/wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300076
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.3:email,320c0000:email,qualcomm.com:email,qualcomm.com:dkim,1.236.219.224:email]
X-Rspamd-Queue-Id: A89C1B9151
X-Rspamd-Action: no action

On 1/29/26 1:13 AM, Sibi Sankar wrote:
> Add remoteproc PAS loader for ADSP and CDSP with its fastrpc nodes.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---

[...]

> +				fastrpc {
> +					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +
> +						iommus = <&apps_smmu 0x1003 0x80>,
> +							 <&apps_smmu 0x1043 0x20>;

0x104x -> 0x106x for all children here, the result is the same but let's
match docs so that no one has questions down the line

[...]


> @@ -4692,6 +4808,176 @@ nsp_noc: interconnect@320c0000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		remoteproc_cdsp: remoteproc@32300000 {
> +			compatible = "qcom,glymur-cdsp-pas", "qcom,sm8550-cdsp-pas";
> +			reg = <0x0 0x32300000 0x0 0x10000>;
> +
> +			iommus = <&apps_smmu 0x2000 0x400>;

0x2400 (same reasoning)

[...]

> +				fastrpc {
> +					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "cdsp";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@1 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <1>;
> +
> +						iommus = <&apps_smmu 0x2001 0x440>,

0x200x -> 0x240x (again)

Otherwise lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

