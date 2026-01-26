Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDIcODQ9d2mMdQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:08:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BC58671D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B5E10E3E6;
	Mon, 26 Jan 2026 10:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QfumSZ6J";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Foq99DqR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB34010E3E6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:08:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60Q9hl5q1841490
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A7HrPtPPW5vdxOHCGF8VzY7vLYkOmL21Y70PPkKwr0Y=; b=QfumSZ6JMWLOsqoe
 wWV1T5HXf/ry1F6+MM742UL6RTB9z/jBpaZNS1VRUgjHDn1EVyR5O0siWBuZZM34
 962O5MVfhHAkng3zpN7679ePwipMguiMdjcCC339sIpv74qpiGwwGwR+mX0RWA9p
 V2DseSr2bqYLbJWsGMShnmwpl5ttpPNdrn71aV2antZRzM03pexeyf0zhpqtfsDL
 gncyQB2/b/uCm3BxeyGB4j7/mQQsFCDD8kVJbDmGYs3kOPROzJOmrYKzCw/G6xy8
 LzjPdOhUN9IsBB42dtZWmUmi4alaflaVM1gZNGCYrIUsutq7z+am9dQtGS8kfLdd
 yrbCAg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq2q43yp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:08:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c532029e50so114934885a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 02:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769422128; x=1770026928;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A7HrPtPPW5vdxOHCGF8VzY7vLYkOmL21Y70PPkKwr0Y=;
 b=Foq99DqR5q9vv8C64qDOxi/bvzj6B82RM/O5BDosBURAcuoyl9tvHPNTz228b+76qE
 Gz1ggXwDNy4lWgcnwkhBbWL+npKtdLgZxaKLcthGOLNbWZAIQJVO635dbkPMpgGBDMfo
 h8Hh3CCJyOFWHHaw+3cMC0gD8xUWgXTRKr04Y/d2Sb0h4/FXyoN+vhXZ0OOQ+Npp9WLZ
 U5vxy9EEAQGlAY/sJEL1xcLbJf4FmEVl8GXgX5kz8NCX1rlAa709G6vKpyTYm8otepQl
 HSaWOKcN8DjBSs8xlh1/varfHHSCr5ZBp07qogL9QP0nOv0H9XgmlT3MyBOZuonvVsNI
 7axQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769422128; x=1770026928;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A7HrPtPPW5vdxOHCGF8VzY7vLYkOmL21Y70PPkKwr0Y=;
 b=XadeN2cN1jW0YIah6evJQBqPEIUh2YMlrDDrBb78qxzGfFKOUy5gANT8hXQ95JFias
 9OmlYI3kOszhJJaeuJTn9htVY2oOp0LHhvSib8Bh12pk+lNB3hBse8QZ0bMisVByQ7jX
 3636L2v2OHz8yFW6Pof1s8qPP3Nf3V2fO/6vJq0lSeLuV3/i8LlTlR7Z8DGS9CSxLNF/
 QOIWquPhrgdWYkAjWC/mC+wban5JUs2iWuBaKnx0hLrKRvlmJJZL/nN5vE+fddGdP+pA
 eD5j/oRLsvdZNdmmHTyiETtSTA+GUSeI/WaKnaOTYlrX//pK4XF8H9oal/SNKvMyZ+UK
 Pq4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+biW0LPFi4n/DlR97uVzPdazwN2wGuer4lEdcmkeSutnSDs9Q91Qn3RKT5Cwtvk6ZkgjhDBM4KbA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZAM9ShoCBh4wV856DTFOxX05/q/NIIIJ7R3B5aMYfl4jhOD66
 6yNbznf6QhgTLMpb4fkMloJ73DGH3NtOD10EI4qr95kAJHNJxD47E1s10rVdprHX9cydIDjWbc8
 qnSKHm5qhmB0AC2U4T0/WP/N7CNYG677OCb3v81nJmwqIr4ydK+hjl22Fj3/KP5fYz7GANHY=
X-Gm-Gg: AZuq6aIEE+dmj19aXqqRg6jnZIdxUgTUgIWwXnJAtswlLJTxpBuciYlKCB7toPTWlq7
 KlX/4lfhlyMvS/O4ZlSdJwLCKgPcIKmnKbaUqe84jmxphk+rE2r3nPYNT9hXE6rp1Fd0ENa2p/P
 ElgaDnQxPFcuvSpzb9OAELUfXfDOvByM8c3Otp8MBtt7bzwb1Vea1XxhO8rnLKrZ5qgTQap1aKS
 MnsuJZUSCkxf6iMKsL8Z4rspGtpJ0vbU8UzPsbDbQbNGTW6eEJciokvY4f7NV7bkCIpPME6XZUl
 3JdlEtAozxdSZ9fBwSSfjoZ6sgy6eZb57Ar9OMTdfiCT5eFH6VMZvVaSLAjmSvOh1DGHyaHUkfo
 oMdypPHcsFk7FwSDI1/2CBt3MqNARimny0X5WV43YM3e7CB8HmqJnDBf4CYfyvXpd/9o=
X-Received: by 2002:a05:620a:4090:b0:8b2:ea2d:a5 with SMTP id
 af79cd13be357-8c6f962e9a0mr310855485a.7.1769422128312; 
 Mon, 26 Jan 2026 02:08:48 -0800 (PST)
X-Received: by 2002:a05:620a:4090:b0:8b2:ea2d:a5 with SMTP id
 af79cd13be357-8c6f962e9a0mr310853485a.7.1769422127834; 
 Mon, 26 Jan 2026 02:08:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b6fc498sm604771466b.39.2026.01.26.02.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 02:08:47 -0800 (PST)
Message-ID: <895a86b6-450a-4bc7-8042-6bbd7e908eeb@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:08:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to
 DP bridge node
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
References: <20260124203925.2614008-1-quic_amakhija@quicinc.com>
 <20260124203925.2614008-3-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260124203925.2614008-3-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CDQGpgtiTZtfKLIWwH1NcKITiD6IXUZP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4NiBTYWx0ZWRfX+SSIuWTgwvKp
 XcLha5VjI3G3HLPyBfidPc94h/JcgrnM8BdYZRKoJPRHKnZIKEqtuy+pnWth+EmgOxESn/s/hp7
 MNm03y5z1kxUjzH7xxPfnMDpfxYfsHshbEfqqjiLxjOPu7ULldSzajAt3W8zGnnzHsllufsSu8e
 3uU/WJeYI2b1v023xitKYBR+Z74XY6s19Kw2byZEeI2bID02yjLqF7p393CdN3gmaoAwz3DyM1l
 fVFOHoCL6+X1+E5N4ENGVTgx6QWQWSwkAX+kVKM2odEjYCtWgWYY/0t3nVg5jX/xDqbzFHsZ6hB
 pOL7qAvRGzP2TdNntPml3wX9jRNsdbC87lqIVPa6sYiv3a4GnIoDYpG58hE2d5LY63ajEyTUoGp
 PW4W12CLMxKQ41DDAjxClCi6+CrUYafo0K+seudPuP8nv/YUO4Lhs6i4jGWI6wv5TNZhSWuINxt
 aVov7uEe4qdQYHYlJ9Q==
X-Proofpoint-ORIG-GUID: CDQGpgtiTZtfKLIWwH1NcKITiD6IXUZP
X-Authority-Analysis: v=2.4 cv=POECOPqC c=1 sm=1 tr=0 ts=69773d30 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=En4R4P6zDXfLUnqyaIQA:9 a=QEXdDO2ut3YA:10 a=ue8pFixJmkwA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260086
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
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,poorly.run,somainline.org,kernel.org,intel.com,linaro.org,ideasonboard.com,marek.ca,kwiboo.se,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:quic_amakhija@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robdclark@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:andersson@kernel.org,m:robh@kernel.org,m:robh+dt@kernel.org,m:krzk+dt@kernel.org,m:konradybcio@kernel.org,m:conor+dt@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonathan@marek.ca,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:quic_rajeevny@quicinc.com,m:quic_vproddut@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 97BC58671D
X-Rspamd-Action: no action

On 1/24/26 9:39 PM, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device node.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

