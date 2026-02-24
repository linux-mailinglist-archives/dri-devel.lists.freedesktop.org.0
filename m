Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFqgMwY9nWkGNwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 06:54:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15840182391
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 06:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E8F10E067;
	Tue, 24 Feb 2026 05:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mZKP55mC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gp/XO7Ap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A28A10E067
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 05:54:08 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O4LpQt2013830
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 05:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WMavZ0sxm8QIKKToV78mwg8OO4gSQCi6g+RBk50huFE=; b=mZKP55mCJpfBCPU0
 aOsnJomEqa8hyRW9nun7l9Mi3xBWZwK0jjMPGAfH0yvyd+Q5DONZlwZEUvNzZJoA
 jetj4An5XYhUx24roebi6cO5PLaTJUQIFg/0K7sGUdui5F3PXSQ3ZfWwxngn514i
 kPiumspoZshO+KVyrvA2jSI/+ybVfl4NPyoEj3dfkeAuBgZG6dv0T2NQkZiX3QjQ
 xfMFzvifoCJfIQKcmePerd6Wf0k0HvRPycX28mki2/gUdCNRUu+Gs7GbggEVuMCr
 VfKqa0DR2Tw6bXv0EyIi0xcNQ3Gu2SGO+X3L7Eq35LE9iNpe5t7hD3whjgoZmpK1
 sW4BVQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69jgku-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 05:54:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c6e8ec30182so28170752a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 21:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771912448; x=1772517248;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WMavZ0sxm8QIKKToV78mwg8OO4gSQCi6g+RBk50huFE=;
 b=Gp/XO7ApIPaLKlCVZliPAPXlxBBVPznVK+lqves3ee92SPYFRyKtrx3mDJVR1GCBsv
 nRMfS/iGDbOwvQtHhXAaymtSADbNomV+ezaVVWJHkUb7ERUYYT8X5sakWaZT+NFP6RJq
 uBwdb7BzfKMh25UUkYYzzd0C/ZXmfeJpOG+eLAJG6sSTXyvX6CTONRSt3NyupZ63gxsU
 5VqhmCiqdLfAP8uXtWGS8pVk8yRGqoTP8NpIBo8yzGFWtvlG7hjKOrIPgkIPv2iNQN03
 SMEfGqHVXsJifNcmWEC7SFaZmqyEGOyXDV21RVb70XM8T/QHTzNQZ0Fwpb4uhqR99sy9
 pQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771912448; x=1772517248;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WMavZ0sxm8QIKKToV78mwg8OO4gSQCi6g+RBk50huFE=;
 b=jNKiKmq9cY71IPyeEmBbaM8pYSM1wYfve8IBj70ZGDz5nkysqaSzQUR2wkdWLnatXw
 kFhQVZv2FqsfPzhDrpXEyY/2f2RaY+5UhRbyqjmFJsv9gNxP07VlEvsp31dMcYxxBIZo
 JW/IPoGupB/SLnkAyxtLGgVsDjnfYqsn0NyX6ywKz1J4ta/omOjT8rMRSO4f77spJsZg
 306IzZz3kFt/hJ3+im0rhg+PrmjDYpxsp7gEGTnnBde53Ri5GbJbRlcNgVoq+tcdhOYk
 Msa5/s3LRBQ/d6YRrpycChxZMbJjT2E3mKtzCVGn45+nzYN1eRWOJcGIBYqpPWpiFHF8
 ireA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8tJSOzhetND0d5EEhDIT3APuu3ex1fO+qdPzSe2HmQRySzcTzNCkoAomlinI2u5fbhT3A0w5tzAg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2jpk1spIsQakKXkW58pjJXE+n0R786HivfjCQkazF0kMowBD9
 x1ryPqheg62x3lvnschjNwNaimDsbbZMn7tr4NMo2FOWQO/6Pz/Q31fQP0nbigxBHvhMUqUCtJJ
 2FxZb2czbsA1eKo/GgSWHY7LtRcuCpSdx+zc+xSKJpIoTnTgcILg/LdWr5SepwR9Jui1p2bM=
X-Gm-Gg: AZuq6aK6GTLAMPNwatpDh85GtmvwnMfssD9/ht/lCPtklOIpvOPqwlc2j7ZfQeV10X9
 D2zKzibdgw21x59ZfGLc+6rfjAte5nQBjth/6wUzNrDUnKVix39/Pwso5GS+gcvQMdhNF2PQIAQ
 vZHsyaGE0eNQG7Em3konrPtaeLaMNwTR66lQ4i9iZaJX4vy2UC6LBDwjPlNqcNvLD5+bKewCp+p
 1vUO5a7tXXcWJDqLorVb5D9meNph2pSebLX6tgj0d3z5mDQAcjgw5sUmK2mN3q1J6WG06gRDnUP
 9S6Mwj1XF4i/tmcXXWaji5GhnK4wVoP8Xap8/Kc05N7oSxdL7j4usGm14hAPCJpFjKJTIKOhz+B
 UysUVYVGonl0WHFP7giz1vRxxFdPT00HEQIi/yfIXi/np172rV6PcpmQPTxEp6TUbg1yP8YEnZx
 YxsNc1Iy46twzC1p+Ogrpl/Y8MNQXyCIeAO3spwz0=
X-Received: by 2002:a05:6a21:31c8:b0:395:1b4d:c683 with SMTP id
 adf61e73a8af0-39545ba8c40mr9319046637.0.1771912447682; 
 Mon, 23 Feb 2026 21:54:07 -0800 (PST)
X-Received: by 2002:a05:6a21:31c8:b0:395:1b4d:c683 with SMTP id
 adf61e73a8af0-39545ba8c40mr9319032637.0.1771912447224; 
 Mon, 23 Feb 2026 21:54:07 -0800 (PST)
Received: from [10.190.200.237]
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad7500e1e1sm97509475ad.55.2026.02.23.21.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 21:54:06 -0800 (PST)
Message-ID: <598f8927-01f5-4889-9f8a-ef9c9ca7a616@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:24:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/5] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Glymur
To: Bjorn Andersson <andersson@kernel.org>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
 krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-4-sibi.sankar@oss.qualcomm.com>
 <siuuvqcxcfw2be72hh2pu6csmw6qxy26ixnxppbfy7gtpzxxzd@vuucoicoj4h2>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <siuuvqcxcfw2be72hh2pu6csmw6qxy26ixnxppbfy7gtpzxxzd@vuucoicoj4h2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699d3d00 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bH6bprHrhxwb1ATC2rQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: DbuBKRmg0PRcs_O0Xejm_ekEkEk6FNSe
X-Proofpoint-GUID: DbuBKRmg0PRcs_O0Xejm_ekEkEk6FNSe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA0OCBTYWx0ZWRfX+RVFDkZbP0nN
 bwdQgOSV6GW3R+a0Iynez67SfXvDz9GhFXSx3KaBLFVDIswjJy8jfIwCRKwY1UGtdbdmKhS+/+b
 5QKPBDJdCrxua3tD47rPnQNpUkLGpcupnt6YbUr3G8RpinTuVgWkkPNqZeVtWUHIKxlJK4/Jl+L
 OLu9n4xvUe+iLqwRx+gVf3N0utB3cn+ohr7L+pQPl6DLHR6ps1KY0RLOikrhuQzoMbh4eOm2C4a
 7V5qwW7KtRxWHIqnOi/eDaVjp/ViLhSAj7901zoQMu6gQ20f2cBP9+t995QxZouFNOCUKWRhApd
 UZxdKUaOJ79ngqUY4QGkt95FKLd78sTStCjTIwA2zfet/P2CLORoTgOzL9ZwGG/qKnr05ZKLojd
 AgoHIH+T5CKJLUNO06i42GpNWUqFcjSUu0yK4coGDQeN9kVuYnDQHTK4mG7EUW5zfN7rlzgpJLI
 bBC4Uc2imSbl/R2Trgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240048
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:robh@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sibi.sankar@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 15840182391
X-Rspamd-Action: no action


On 2/23/2026 10:01 PM, Bjorn Andersson wrote:
> On Thu, Jan 29, 2026 at 05:43:56AM +0530, Sibi Sankar wrote:
>> Document compatible for Qualcomm Glymur fastrpc which is fully compatible
>> with Qualcomm Kaanapali fastrpc.
>>
> I assume this means that you have successfully called at least one
> FastRPC function on Glymur - with the WP firmware?

Hey Bjorn,

Yes, we did verify fastrpc on both ADSP/CDSP on the firmware that
was upstreamed to linux-firmware on WP Glymur CRDs.

-Sibi

> Regards,
> Bjorn
>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/misc/qcom,fastrpc.yaml        | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> index d8e47db677cc..ca830dd06de2 100644
>> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> @@ -18,9 +18,14 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - qcom,kaanapali-fastrpc
>> -      - qcom,fastrpc
>> +    oneOf:
>> +      - enum:
>> +          - qcom,kaanapali-fastrpc
>> +          - qcom,fastrpc
>> +      - items:
>> +          - enum:
>> +              - qcom,glymur-fastrpc
>> +          - const: qcom,kaanapali-fastrpc
>>   
>>     label:
>>       enum:
>> -- 
>> 2.34.1
>>
