Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKZmEX55gGne8gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:16:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F53CAB6A
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E7D10E3D9;
	Mon,  2 Feb 2026 10:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qw7sb/0r";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMxKZLK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A4810E3D7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 10:16:25 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61280Odx1651648
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Feb 2026 10:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 M0ynAAGMGXymsfhu1/mPnfieZ/fw+zwbgNsbpGrKCfc=; b=Qw7sb/0rce9f7zDO
 FGabQ0LLUkYrNY40peWecMw+w/f2g5/DCzuA5XWznng5VSs6T4O4AHTPTkXy3mHk
 wE+3pj3HObw31vADOe1uHj7aZnB//UmmE2wFsul6aOE6sbTp/VwvTVLSvnps9a6x
 LO5hUJqnTh4nJjf5dnXpu751XNCWgX8EBP3jcW/XTkuE4QY08+bXsx3JZjIbPVSL
 oo3jk+4QLLKzGf6OoGzoBezuGguMrkYtwnIIwlBWspaZzf2wPO06NWWIs5NWPqcd
 UhTFCo85PNPp7CfTLn/D159CXtjbJbs5oSchpH/vHDcc6d5u8FnI1uydagZCzIXA
 83gJ0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avnn1ft-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 10:16:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c522c44febso93171985a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 02:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770027383; x=1770632183;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M0ynAAGMGXymsfhu1/mPnfieZ/fw+zwbgNsbpGrKCfc=;
 b=cMxKZLK5ffkVWH/HYpl2GBO0k48eU4EMUluzL7d1c9IRh5SbTZLy0MYDFJ4BXsagjC
 omU2i6WKv7nn3nDQghUep/OjKVpd81/0xM8sRWL5DyftYMkZ4lP0LytUj2KkInWXo6g6
 zpZTJr38ZBGhrfA7K0ADx4ti7IhN5PwPKqH6oFSM5zqH+kkadWOYwkI/il9RwEGBelJn
 sAfDHqiFJkW7fGRrrmhqAHcLcGUOTNLrVBfrse97lc1yFP8un8Hi2ssmzFF2R7Gub+0f
 b4MvTyK2R0+NYJpyLwRzpidiYx/ys58JRRpX1ncRGzyaKrmb/0XAYneLvjBp+Xn+rVVS
 rxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770027383; x=1770632183;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M0ynAAGMGXymsfhu1/mPnfieZ/fw+zwbgNsbpGrKCfc=;
 b=njX3Ig5K3DZVLvMkSJU9hBlC926fTk3FgRURcsLr9u4QaVM0FqQFSBPlP4lTvXyMSO
 79vhpmRG251VO0U73Si6ldxFOs6KQSDTKD92wBLWHqPO8qpBVmOlN54V8S7dxhuJkbLw
 stdlv1AAMIiRtDB/FYPcjoWqgZxIGumDw/BsqtIE5R5PMp5fUFQ4yLOskBKFHr4s2ds+
 X6fPngt3tpulSA8b7tqNZkNXgkEw5MAIDUa1aWwlvPmNZj49j+Xrk0BsCbJVlm4ktfDn
 xSaV/vXFryF/zgcoqywYlPTYUB/LX1Tqh3NionPwiMwsgVpTmzRmiPoL9wAdcSv1jSxg
 bk7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKjB5Wjo3au8Y4W/l9DjQXasqos86v1qE2V9zKuYM4Ex8DcrgcbNUFvgjF8hev81I6ruEH0TDzZ5g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9pS0UyDe6kTo7qsA9OaOuANxLPkpjb6JtNi3zRDV3mi94Ox3b
 41Za2IrVPmJ33ezNTg2aYRV0gRC2YWsR4oc9rRiOUZvVkKJsQWQjTwrsEDgoM8TjwO4HMtM3TfS
 tOPDkhgQoXGqLPFiRv2BskBW0uRkmsKHu7Cg4GtOCnKpcTiuTy8+EN//kjoqj29q0bOa6G4Q=
X-Gm-Gg: AZuq6aLTVJZx3bqhYt3RpSYHW8EcEdQmICtSTXKcLm1FCJA4I2TS3elNPSqDCOlqXsq
 aQqWcs9xdP69b02E3C0iNAG5OCslvMAO4h6pPEWX43T7i6AR3IQdP8Nu6+JEFcbfRTtjEDPZPy4
 Jk81w8PGkMSqCHCDq3RMFvDFAYvATtKl8LYrp/Ix5ZJzfB3ma+Vye5Z+JW2j/A50I097Dd4HYrB
 3cn9nFuzD5Nwua3J8hPwJR0u2Qi32kkoHQ4fUaEugu+qJrFlTNeGrdKpTnDK8KbeFRgOeJpJ5/X
 q3RcksIwxO0UndafNJcdHRI6wpJ7fzxtRjjs4ZSlsSaBteqdkhdyzG/jfbVy+EKvSK8KN3vvd0D
 iazu7zZaLZgGpdFGlEh7CI3ZWTZ+3f54kti5NrHSW0e29fU35oJl6NjgveFgstE3h/z4=
X-Received: by 2002:a05:620a:31a4:b0:89f:5a1b:1ec9 with SMTP id
 af79cd13be357-8c9eb25aa3amr1055641385a.1.1770027383632; 
 Mon, 02 Feb 2026 02:16:23 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:89f:5a1b:1ec9 with SMTP id
 af79cd13be357-8c9eb25aa3amr1055639285a.1.1770027383143; 
 Mon, 02 Feb 2026 02:16:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-658b46abea5sm7601946a12.31.2026.02.02.02.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 02:16:22 -0800 (PST)
Message-ID: <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
 srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -eEmy-2ftNGNhtNOKkQ3mWeWnF5B0YEF
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=69807978 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7qjKt6vscxvWZOHtmVAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: -eEmy-2ftNGNhtNOKkQ3mWeWnF5B0YEF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfX1utR3jUzPVNk
 5qH+lTSu7E6KX515zD4xUMfYm46wH55snBUlBF6eO2v6CuT4NOmAp4T+u/Y/9i1i7EoGL+r46fU
 VhVo6In7AznFzcVe5NJ/lBGnrEmJoTWc8sb8ebqiLsSuGvnj1TDoRnQfyWtfMPmCAHcol0oZZ6U
 0w0e6MLhqQmYAFANR6HKj3DB08/z5myiQwTnbEivLq7Y56PkEYCJGPzVISA2EsslnYn9PLDhyD7
 6VCCnW0pVIa3lzaD3gjDhMExZmuc9fUvqSWwdRXumhTKJr4Ho1MQERaVcv/0aPwLTVnyr34sq8r
 3s059IVcJ7sJVIoyZvP9w9zi79Y+zhbp+7x/lWz1CdqBYv/GER0SF1cGOUga25LeQs4Rw+KJmxv
 TbSQtmGvbqshZPeJ/pXXK+UvKUFqke9A56Vjq5l8O923vBPFAazlim5UntgXNohB1zkAgvg8jPz
 GXwu2GwxgKaipU01kaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020085
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
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
X-Rspamd-Queue-Id: A2F53CAB6A
X-Rspamd-Action: no action

On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
> On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
>> On 1/29/26 1:13 AM, Sibi Sankar wrote:
>>> Enable ADSP and CDSP on Glymur CRD board.
>>>
>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> index 0899214465ac..0eed4faa8b07 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> @@ -487,6 +487,20 @@ &pon_resin {
>>>  	status = "okay";
>>>  };
>>>  
>>> +&remoteproc_adsp {
>>> +	firmware-name = "qcom/glymur/adsp.mbn",
>>> +			"qcom/glymur/adsp_dtb.mbn";
>>> +
>>> +	status = "okay";
>>> +};
>>> +
>>> +&remoteproc_cdsp {
>>> +	firmware-name = "qcom/glymur/cdsp.mbn",
>>> +			"qcom/glymur/cdsp_dtb.mbn";
>>> +
>>> +	status = "okay";
>>> +};
>>
>> Please make sure it gets to L-F (only Kaanapali is there right now)
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
> but the firmware in linux-firmware is (now) targeting IoT devices,
> should we use WoA-like names for firmware on Glymur CRD instead
> (qcadsp-something.mbn). It would match what was done for the SC8280XP
> CRD.

I think it's simply time to stop pretending the firmware is generic
(some fw simply isn't and some fw may come from different/incompatible
branchpoints) and include a board name in the path

Konrad
