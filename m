Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP+8KRaAfGlVNgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:55:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAEFB917A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A63E10E93A;
	Fri, 30 Jan 2026 09:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ma51icA+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGEYn5Su";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484A910E93A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 09:55:31 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60U3VZJT995888
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 09:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 citeBoKTPpnUKJdt7uEyLg/IUCEGXd/i5qHN3Lwq5no=; b=ma51icA+jsduw5Ur
 N6yIoFMjb361n6ckJK3YOl12X+YA6L/dBAazyD/O/lPF9FqwRdkvjqRuNt7GOC0t
 NN/NMsnElgMl4C+zQjuVrHClRchriaMrjENFLN/GglLkubVpoB7j7RaOG98nWASS
 FKt+9z5Dmh/bwHdZLRnne7COwyjgMsDEiK/Fq0q168Kjy3DaeHF2rlOlvxfKl7sX
 NW9PY6CRP9C/IbmgFgSb9Kq8N/OPjBy6o/uhOOcReKIzIcWAyPN+s7Ik/iMrA+KV
 m7sC6/+iiZXrLyUp3cliThSfNNi0WAGf9ww70ANcKFYv+0U6+YhmdpJFirlD6yfH
 m4PhFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bvvjn5c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 09:55:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c53892a195so33977085a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 01:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769766929; x=1770371729;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=citeBoKTPpnUKJdt7uEyLg/IUCEGXd/i5qHN3Lwq5no=;
 b=BGEYn5SuF5RM48pDlETIv4WdHVOvlOQIBsYhucwVxGfPh9DZSgevEsP4+M+plzQ0wS
 0kzPWUNvUbKeUAyK7ElitpGjKtWERdpNt/+9yNJZ2wnnfqBLt0tq8ThSQA6pC1cjhjOt
 qoO3TBQn+NB0jc89qpF79RfbqB/eiGDp0VwlOf1lk2sERmVKgYEmgdvdbVLE75cosgmn
 WYSJ2TJdLKi03gRneI9IUI5ndMnmIQ5RTwDKLtYLi85vcQu2PAF8mdNEkdmNFSqH3AXw
 632/vjOaFM7V92jqgNpf+IjCbighYSaumNkWDIVNaU67zTtVbNl51FH4XimkXSc8wwWJ
 OBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769766929; x=1770371729;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=citeBoKTPpnUKJdt7uEyLg/IUCEGXd/i5qHN3Lwq5no=;
 b=iaGc645fIwgyO9C68bOcQNGd5fNkXWFpU58CVIUDITnCpYt2kmuAYVUPuATcBPnAW1
 fKjDtePeB3SxJu09/srBcubbEBWDqMw0oTF47EZxoyx9XH6X8YYD95Ikk72pbo39gti3
 NMWDI+I8+2yvzs0D0bBIngxrpCruGjmb0z3mVFQBkZE6FaAq5fFu/7ssFB+Z5lWzrntQ
 yCkmSsOCpr3nUUshRmFjEKNXhJyrvI78OmIRsN1kt0DwPNwhBae2gNsyldCW231fVr9A
 ATbes0+xS3AvH3bBuL4GUsUs3cyNjlJ35b8t4SYSpSbwGDXLPDn10TVo6Sk5ZdyD4qJF
 kINQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV52mLnjIpkbbljPeyDQnhnDPMR5Wz46Md975nMxWfuTLf+Bg6NCao4+E3Lp/SF6ppQnGROWzqXfDg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6fOQ+wj6JcFIK4IEdYmodMEVB3Fc4E4VX4FrmUbhMWQsF8LBS
 xEHkYGewTtWycHEUAziJKJcNuOy8OXfrhA+toCPBkV/YHBcFX0B7u9ATyGQjCtKIFdVA/FzmR88
 G2lQLW0J3EUbsC++sY25wm7GfAC0CfxCK0yxv/M/B2tAgvAJISWfvamXJrC+V+jERWsC4xk0=
X-Gm-Gg: AZuq6aK74zq3fdruYE78f3/GBF8DL+HzE8J8qNkh59c6xxBq5oUwB9hsx5Duquka5ve
 5n3eogYdOvnGior8/iuCHRwZChgztHssZLH5w23t/8JNyfisnZCvBZvoaWzBBHq2sdCY4rCpxgy
 cKsttjMOrRgOFXLoAWdBa4b8E+9f4MfcfxI9RZ5HWEdYvH3kuYfKohottP3thPklEK+a/SK15Oe
 LpD97xxYcNlY+huvCu9UvWliXPELuA5mpCiAg0AQsINqmlKKSBC1E0kJ+Dzq2dNCQ6IJI3xTTfH
 WHIEVfjspjBzLOkQdqFoG0xo0FnNpo+NATNk9v00N5VeIaT6z8yyz0jzw+gNr9L7aFGraMh+IpD
 3Vl9cbI3UA97+ILdO5phT0feIHqjzVjqM2jl52Gym8fGvhGULXH1Frz8/yDJqoUtCgCE=
X-Received: by 2002:a05:620a:1a8d:b0:8c6:2539:dcda with SMTP id
 af79cd13be357-8c9eb229dd1mr253237185a.2.1769766929356; 
 Fri, 30 Jan 2026 01:55:29 -0800 (PST)
X-Received: by 2002:a05:620a:1a8d:b0:8c6:2539:dcda with SMTP id
 af79cd13be357-8c9eb229dd1mr253234685a.2.1769766928922; 
 Fri, 30 Jan 2026 01:55:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbf2ed6f8sm393035566b.65.2026.01.30.01.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jan 2026 01:55:27 -0800 (PST)
Message-ID: <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 10:55:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
 srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZdEQ98VA c=1 sm=1 tr=0 ts=697c8011 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EIOd5lv5QegryJ6n6bMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: o_vh-TRiLYpF28svKqfz32b2jqdTDOKh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA3NiBTYWx0ZWRfX/Qgl4eSH705L
 euORSlnLkFD+yC+NvD0yZlPiVyD9QI1EbiA7zniscXyy6N9iWd4Tnfe3Eamyj6rblJ/gFUN0+Md
 3vKu0cmNKi5cJNa/2q/QgqEbC/4QDwKVXsDW1bW4SfhX89NwcV+7ckE2M5YHLkIVS6yRVkYvsX7
 SId7sLlMdLPwW8XoyUzlCzR5pRleP48IwfZqszJj7iLOPdShkEcgs3RL2MSUQRvo/n8Rj40Ouyk
 v2PDKtN3u+61wNQNyFHXDjDEAKfwWUtJghbe7g4/UEhblNmmAjeYOI9pDh1tZD4NALMwUyfH7+l
 OhPixzUKId834pf7OZ8i4ajDxvG9Guqb2GEkrbpWVOU4jUkYLemF+TylRsETvdnT3YhK6/vytmc
 R1nFrXa5U5bjCqZaZzU++OfRHXCqsk3Zfnm8+wgNW66qa07Ebol5Ijheqy4OUr2MHkdaMr8hkPg
 K86PljPNPj7o1rGTZQg==
X-Proofpoint-ORIG-GUID: o_vh-TRiLYpF28svKqfz32b2jqdTDOKh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1DAEFB917A
X-Rspamd-Action: no action

On 1/29/26 1:13 AM, Sibi Sankar wrote:
> Enable ADSP and CDSP on Glymur CRD board.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 0899214465ac..0eed4faa8b07 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -487,6 +487,20 @@ &pon_resin {
>  	status = "okay";
>  };
>  
> +&remoteproc_adsp {
> +	firmware-name = "qcom/glymur/adsp.mbn",
> +			"qcom/glymur/adsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/glymur/cdsp.mbn",
> +			"qcom/glymur/cdsp_dtb.mbn";
> +
> +	status = "okay";
> +};

Please make sure it gets to L-F (only Kaanapali is there right now)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

