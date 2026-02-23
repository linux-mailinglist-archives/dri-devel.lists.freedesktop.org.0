Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DM/LpUfnGkZ/wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:36:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270DA173FFD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12A810E2B1;
	Mon, 23 Feb 2026 09:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gz58tQmR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ig1/JTpJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE8D10E2B1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 09:36:17 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61N8bEs43018272
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 09:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SYGjE+XjICFU+//eucHg+2ZzKIQx8dcU/7z9xFG21vM=; b=Gz58tQmRE/iJoV8k
 J0/JttB64qlBpYibGzTX6Zn5lv/n92CMIVAqWDSrmeNiPudLmBZN75cDy8J63hLK
 4DbriMib5EMSLZJLTX4O/1w+RUaUZJ68L/+gA1xYOyAv4Tg9C+7cuaqOWXONE1dj
 d1FSCL+joohBZKHLtbC+GMbCo2XZv3MPl7NBDnItZB9GBGFB4FpG0zKgBW4jGvHN
 bZkSaUNboM+Jyw15QjRwbdIi5R0kzPy7D7BQwYyoboYcEWonC+ptc7Vvwg0jJwsm
 NS0SuxWkESi6z/2lIHAoPx8GtxgNmpSkRpCOH1woyhA+WvZro+4bxDWHETD3B8DS
 HFtj7Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8m5ms-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 09:36:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2a8fc061ce1so348253755ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 01:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771839375; x=1772444175;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SYGjE+XjICFU+//eucHg+2ZzKIQx8dcU/7z9xFG21vM=;
 b=ig1/JTpJWHYI8uB6/RSO973Lw3lWbpKsDGxL392KIkfU6aBy7cE8qX8mK+rjn1w2+A
 6qx8eyPWu1TYYzizEK1DtdRYX7BiD2NSZ9j9s4J/kP59QxKO5ZHXNPYluZ/55k42PPFU
 nd+gaDetnzBh3Q0Uib2xrnHCEOzmS/+3eDDMkdb6ftZcQmCQZlniRCBc3XdrT8cvVL2x
 WQ5jz+FEpI2jJJKCLSgmW9XToGGCo3ZYQmirMf46JcssDqdldaB0Z59Xho4uS/3B4cGI
 h9fL01yoD8muq82EJ6g7iKyGk8huHAGR2E4gZSYVqqsOveUvaaYWLfGlEVHiKdRKOZNj
 /Prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771839375; x=1772444175;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SYGjE+XjICFU+//eucHg+2ZzKIQx8dcU/7z9xFG21vM=;
 b=IrUIWna99vKjWMTFYzNizmC/xT10T5UHBe0USvWu6SMNfde1HYhwKKSH+BKW5lY1vu
 keVH3jCO5jRx4Ty3uLsF4pUnxyaAKgYkLCd/SgLbvoDLXaf36oSBCB69+STw+FrQzjf+
 pjyrqWgHwYKmT8UjP1qAUSIHN5Q3Jg0AIiIL/K3ceR/0Th4fOIiubFzoKa141LO0mikp
 nahSkl3C3RwSe5asEs9HL1UQ2ThyxoBDTH+wRg8WjuxWqLuZc+GBPUWAzJAhU1UucKZ+
 ZWrKSOBMN5S0BR2epk065Py0KaSq+wHZr2MdWo2Sx7GddFlTBdQxgCVDDz9cO6xjoQGD
 xLgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwuCqIVQNIqFaN/M+KataH1ftpjyasnsO1SUd3/1v9IdWIPOTUrDeKISS9HcTnUscYKn3flVn8fX0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHbfLT+0A0LMnKoeWtPXGNkw9OQu5ezuY6+7IdVMZ3o710jZz0
 ukZ2sBwT5pj4apPGd21ApRwxxrtvfRhgpZ9lks4DaJa8XLngivzW1m86qZeiQo+E0PsrXCq+M42
 q12RT3xlBUrFTl3bR5d+W+3+mup6878xm2s5SMVHeBeXdY1oZ2/91B843ML9fxZFs8zVjt8I=
X-Gm-Gg: ATEYQzypHvkfCsDKztgCZvMj++uyN0xi42hisXsAJ0ejnqcYQg3tscvKlrhgK6DGdSY
 L6he1y1MbA8OD0T3huopngpMcWRv/J6b5cYQROM4gqcQJJFAOkRt716vlNF175R25EhNN54vq3n
 IxOg1s8hhwoFEYgaekVUpbsdzKfLixo3wcBMI9nyV8i4d593/5MveFNgnIO4Na2D6Gczb3SACBq
 yXrHG8TTiUAVAtM/TvlPa4iiORjhoLnCnjTddia1VbB7nTysHW+odljQ8qmKGnayWA38tSoFgn8
 xziDShdnSe+J7kAoorVkbumHYnbGMw/t0XuUhoLKx1mR8LJHzmvwwuCeAyFIo5YJrxMGLj3FrCU
 rNc2YTP9hqXPckyz/8CkBk5RiC9wgDdajdoCToJeDRmfib/CrQvPZ9x9FRNh8pmVnVIDpSB8p1o
 9kLdC6EcSLWm6UEcfTFVBhttrZDS6cXCHmENyr+s8=
X-Received: by 2002:a17:902:cece:b0:2aa:f0ec:3701 with SMTP id
 d9443c01a7336-2ad743e22cfmr80923505ad.2.1771839375153; 
 Mon, 23 Feb 2026 01:36:15 -0800 (PST)
X-Received: by 2002:a17:902:cece:b0:2aa:f0ec:3701 with SMTP id
 d9443c01a7336-2ad743e22cfmr80923205ad.2.1771839374726; 
 Mon, 23 Feb 2026 01:36:14 -0800 (PST)
Received: from [10.190.200.237]
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad7503d406sm65521675ad.75.2026.02.23.01.36.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 01:36:14 -0800 (PST)
Message-ID: <ffecf0ae-f826-4690-8ec5-c19011f2c50b@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 15:06:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Glymur ADSP
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, mathieu.poirier@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-2-sibi.sankar@oss.qualcomm.com>
 <20260205-succinct-honest-badger-52e1b7@quoll>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260205-succinct-honest-badger-52e1b7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7l8zTnJGQKniiagzjfJ11GhfcaINftnL
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c1f90 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=njHKLakQ8Vn3IMBtrbEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 7l8zTnJGQKniiagzjfJ11GhfcaINftnL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfXzPPzvjUL75FN
 Bn+F+7IO+A1Fgh6JZEw+9KJMFB2P9ycy7VxQptCKY6PyNESvdN4+mnUdfjCFmSDm/BPg/67bV/q
 D/GoA9wAxYMvN/1904IjczrnW4rdCtiktu+gM1a6N8TPVzDPWI15v6xBU+bI43Al2VIAnZlZl6X
 pgud0QHbou2tzgZVAXNb4JrPzr1AeVfHEpyy4TT/HA0wGh/5OesDSejesvpNczqASp2wEN40wu7
 4Y1ysuGzsOT+Mi7ZxLT25XnMXtQVhh+HGN8+ZUHJXPBPoImF/bPEBZ5jkrgVIOCl4BlXCC2/d1M
 Z43yfidhsJpy4yyBGNQwLvtJUrDY4sDo9PHXWEb3fzuijKcpw2+glgSLwc4vuqB2Qc3HYyog1jG
 0Ei8/rFUsOaPQSeGDbz4s4+gYwe/apHqY9p/p/LjGiMfF0bykb2oqIRsTd+R1b4uiqKhfx5A7m4
 kiN/G+dFicms/L+E8Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230084
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
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[sibi.sankar@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 270DA173FFD
X-Rspamd-Action: no action


On 2/5/2026 4:04 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 29, 2026 at 05:43:54AM +0530, Sibi Sankar wrote:
>> Document compatible for Qualcomm Glymur ADSP PAS which is fully
>> compatible with Qualcomm Kaanapali ADSP PAS.
>>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>
>> Changes in v3:
>> - A few variants of the SoC are expected to run Linux at EL1 hence the
>>    iommus properties are left optional.
>> - Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/
>>
>>   .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index b117c82b057b..fb6e0b4f54e8 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -29,6 +29,7 @@ properties:
>>             - qcom,x1e80100-cdsp-pas
>>         - items:
>>             - enum:
>> +              - qcom,glymur-adsp-pas
>>                 - qcom,kaanapali-adsp-pas
> There is no such hunk... I think this continues my comments from Sep/Oct
> 2025 that creating such patches, with multiple dependencies makes more
> difficult to review.
Hey Krzysztof, Thanks for taking time to review the series :) I'll give 
some more context here to ensure that your comments were followed and 
this is just a one-off. This patch was held off from the dependent 
Kaanapali patches since it wasn't clear at that time if this SoC would 
be running at EL1. Only with that confirmation and given that dependent 
patch was on the list for a couple of weeks with Rbs, this series got 
posted out. -Sibi
> I mark it as not applicable, please send when your dependencies hit the
> tree so I can review it in proper context.
>
> Best regards,
> Krzysztof
>
