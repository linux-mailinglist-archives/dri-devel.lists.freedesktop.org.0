Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENUuMtg2lGlpAgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:37:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C44A14A778
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:37:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D580B10E4B4;
	Tue, 17 Feb 2026 09:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="feXbYHQh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LlV7NmFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E5810E4B4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:37:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61H8vq4K1601378
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mOdJWXBMhIvpFZRvEaBVaTcZ9cCxWbZXw+26UswX3a8=; b=feXbYHQhsk6KyW0C
 jcPzZ366sWvrGDbdYnV76NaLBOIm4/riC6VmAwtTajiJDBuKy7OJYlhgSLXVQSNL
 jHSQvPxwmOzKcHJUVcXFJGlDGuYUrzhghVraHuDfA6GBOjzDiI7SgiarKjiMtS+y
 cjObx9Hi9RF5rH6jsMxFOTFEe5XvkECBK+GAEUEzqbbXkaZxrLlQVEMD5ohGIp78
 7s5QA1mvtoEGZDHkhZkIDAWBNg6SSGRGuIGWt1mXeUPByvArbtxWukL/OUUHRK4J
 vctRiOxUlXZN5sbKOZRqTl0VHN0Oc78+kIV6bWF+F8rMEfR+696h+hThz5JVjWI8
 /M0f6Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tm9r0y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:37:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c70cb31bcdso295983785a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 01:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771321044; x=1771925844;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mOdJWXBMhIvpFZRvEaBVaTcZ9cCxWbZXw+26UswX3a8=;
 b=LlV7NmFl9A7KPgCWFK+WkJdLvVuav4YhPpaa4EAnE0KYdY+Gj02DBbPPcijgSlhOka
 fyN/SUDN+lzL1zxedchuKfn+IqzXBpJeOzgCpF8DZM2KmjkB/HRrN/g4x9Mh2VjrCyjw
 VT1GolFmlYj1sqFVe8RKHJTFKny1+yhn7hHyNM3vjICStloF6k47CWEkLx1UZpU2Tuhn
 ZiBKQj1kuZcot9BRDy2vGWXtYZoDPnjp3Qz7V+C9WocMtGQEz/mew+wTHHBeBNXyD4nQ
 flQERXLPzldJxz+XIoQtAHHGCmQQXQE5dNfl+v4+i26LmNYEgXZ43tSwq95OAeTRzW28
 pzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771321044; x=1771925844;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mOdJWXBMhIvpFZRvEaBVaTcZ9cCxWbZXw+26UswX3a8=;
 b=Y28ikDLukZ+VmbfyQ/JuJgJGicpb0OYMQzvBAc3+MRdNZl4K891saF7NaabJkX4Squ
 Bg72B8V1zOJmOst/VLl0b69DjBzQtBqay/QQp4QpMNeXwqCuPk2BM0SWmNasVQByGGp3
 qlfTWlmt2d4mx6urOyu4YXbFIVqfrHBuKQ00vL30NgAx0sk80JhrLjzDFCpXx7wtICjM
 Y00jbw4PzBlCNkzURtX3avWqSoi0XH0j1gmXGtwv98BcchOpCYetIDqcoHl+l38Kr4mb
 bfAatF92oz7NSwpurrHv1yAQOq9VQgcB1yGyRxQ7h2OX4/jc+kSD1/RCFSyGltMKtDcF
 5r3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSdooWcgdtB4N4mwSe5SHphdBZPJ12PVMpcOSTRGH20HWXGVEwVAcXmvFvdOHkRtmfgaDLqXpSDHE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3IVAW6eLPUxUhSJxdimjEHz90++5UdzQWGbD8S8jP8kU1H6Pt
 +tViOHKbYPbiM1ScCqKYgZ4ptIE1le2x82Z0h8DYgv1xcy4NtFicFnC+KDcTsXAyyVsHZgNi7ib
 Zi6cFNUB2DF7D/vHaRouKbgqw/RIomaY6owuekBlkd73gju0938zbMZct2wQ4fW2Dt+o/vvY=
X-Gm-Gg: AZuq6aKWXksGPujIynC8cQO1ImySfMSNa0uQQRc4VLxVJzWYkqDg8UsWILmLrAtl2vD
 gJIviPv7p+BAilXCbhrZHoj1CMqaBUs9LIGkzR3cCs5thxE6hqeBeDsNjtlBVf1zHECJmjcd9ud
 PS/XUM6QUHwWSZZg8kHCFlffwT/0h5j52PKV/LsZ4NfhjRjXWAvh1ehRHrDZXfIPXUcjCGGsFn5
 wJmc8oUbR4nN81Z1U1QPI3c5EnYipolLvfr4tno7q0OwZ9xAD1AyiE79GHI96r2aenC5TaUx//t
 j0s7w/7d70EL/hORgvHWPBJnFF6gFst1aVqwvhMNiq/u32ujWJWJybz9Qke1Q0w6iHGisP4S/MR
 PQ2c7wiHYLuZvlXO1GLAdGC3dUafy9nJDOhyz79Z4os9wTC4QShVq42hBegXYO94cttq6StYTkg
 kHIjE=
X-Received: by 2002:a05:620a:29d1:b0:8c9:fefa:89d5 with SMTP id
 af79cd13be357-8cb409141eamr1276349485a.10.1771321044275; 
 Tue, 17 Feb 2026 01:37:24 -0800 (PST)
X-Received: by 2002:a05:620a:29d1:b0:8c9:fefa:89d5 with SMTP id
 af79cd13be357-8cb409141eamr1276347785a.10.1771321043876; 
 Tue, 17 Feb 2026 01:37:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc7691f0esm337654766b.60.2026.02.17.01.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 01:37:23 -0800 (PST)
Message-ID: <1653cdde-4db3-4473-9007-676a5bb23e16@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: lemans-ride: Enable mdss1
 display Port
To: Mani Chandana Ballary Kuntumalla <mkuntuma@qti.qualcomm.com>,
 dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
 alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_riteshk@quicinc.com
References: <20260217071420.2240380-1-mkuntuma@qti.qualcomm.com>
 <20260217071420.2240380-3-mkuntuma@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217071420.2240380-3-mkuntuma@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gYiAAf8J6DstgxTNpvQglCBw-NV1odW8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3OSBTYWx0ZWRfX7genVKOQBfDC
 9bw92gWuAKBVf2dkIyW9xh8/LKqRxP2yfyylbZhwTaQsdezLGiStQHqWCzPbCSs5dXKreFEdxPh
 EJ5Uw5G5mt0g8MRoXkoNcSbBCfdbpJ5sLLC4CxopPdDc8+eiZMKUSADyUDu/HTc5BIbRtAB9/is
 c0y0yD92LKn6pc9PKvMqjbhSaPj4fESC41R8Gax8v98xyT2VYuRSvBevB6v9dZfDM/KfxIcGC0K
 FgLgVk7xuDcTm08pc5hc8x6nIAbQPo9N+BhflgM+J3LB8cAqv3zVMjqeuNjEbropWp/BZst/QRL
 axXF/x94a9FebTgvaQjsdCF2F8kEPZkeOmN2jnYnJtLMGYLFqKUG0utAlAjd4XFPd9DI8WIKo3T
 pLeBTyXXxQaAn1uIGo1cnsAEMg0Ib2Z9wSeKQk7e/Dl/i7Z93iKCmLdTJ+DJviG00EsqcFVWlcu
 iIjFKJQD+1meOlva5EA==
X-Proofpoint-ORIG-GUID: gYiAAf8J6DstgxTNpvQglCBw-NV1odW8
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=699436d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XQLX8yjaJUNYVVxXu1AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170079
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mkuntuma@qti.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:marijn.suijten@somainline.org,m:swboyd@chromium.org,m:mripard@kernel.org,m:abel.vesa@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:jessica.zhang@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:airlied@gmail.com,m:simona@ffwll.ch,m:alex.vinarskis@gmail.com,m:quic_mkuntuma@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:freedreno@lists.freedesktop.org,m:quic_rajeevny@quicinc.com,m:quic_vproddut@quicinc.com,m:quic_riteshk@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,m:alexvinarskis@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[qti.qualcomm.com,oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 7C44A14A778
X-Rspamd-Action: no action

On 2/17/26 8:14 AM, Mani Chandana Ballary Kuntumalla wrote:
> From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> 
> This change enables DP controllers, DPTX0 and DPTX1 alongside
> their corresponding PHYs of mdss1 which corresponds to edp2
> and edp3.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
