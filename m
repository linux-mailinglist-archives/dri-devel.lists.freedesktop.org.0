Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HesEw/SnmnwXQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 11:42:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0229195EA9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 11:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5E210E736;
	Wed, 25 Feb 2026 10:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nn/rFSM5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dA4mLS1A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03AA10E736
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 10:42:18 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P9SIRr1363561
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 10:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ebtEBQ44KO8bA5BW97WiwZ537ZmKUUoxBiJEqqTAc80=; b=Nn/rFSM58InaKPnI
 rlYTjp15i2PmF54B8MGxq8Dmzjss1I3DwOdPOTiAGnSoFtwvDQwRvn+QTWXHkSJk
 eVLnS0SUdkQLyTzyi3/zPJcEF/mKmtIXrWseI97SUmHyogXZGwBfMagDhM5VFUZS
 lhaGndAqpGfmt+DmgrFaPOKFY9JWIoBgdk2kwtywxYAOHqCY5bLsYatP9RmBTOmT
 IlT2a6W3E4AIkRmruWwP0pqVkrOqWTJu+bIbF648odeT+dVvKGDZelUD1Vv/z55Y
 FEM7nrEf24frulb61Sna5L/eJ9q2W57bAllQLVr3caK54E3Cr5o6Zg1CgAb8toRt
 DcOMEA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chp159pkh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 10:42:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c70cb31bcdso625996985a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 02:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772016137; x=1772620937;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ebtEBQ44KO8bA5BW97WiwZ537ZmKUUoxBiJEqqTAc80=;
 b=dA4mLS1A+Nid5MNpRJDGJdMkFd9qZCSxlJjcTbLwX8nMGckpguZEfRcyTjI08qxJx0
 Diaq6ga5sKXhhBvIv9Ir93t8ywCUlzRjncNk7mwFLjmghXLYUyOF9uiPLHnPVdmxVRXs
 xxdroTb0Q4PFxEcv5NN85dX6ImhUX+T9NJ1KEXgCFv2uFuqbu7kFlCCvvcIhYLUG/ce7
 u9RaadWZK2JZDtLs6s2F0dqvawWIa7XOBevaiKPniq9UihDMKlR3yDWDr+81BahuO1Dz
 yoSjEjkAEwGniwlPo3Vbx7V2z/n+5az6aKVV4CxHESGgMNGZZSoJnQwbbuJP4RSglJi6
 k7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772016137; x=1772620937;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ebtEBQ44KO8bA5BW97WiwZ537ZmKUUoxBiJEqqTAc80=;
 b=anJj6xmBK1i+k5qiMaKeA2xjs9XPm6rO+JCHxTVh/oKw7fx4GqKOyIrS7HynChYITX
 KoG6g5WUAetHRQFl4DJW7drZ+i78xll0DXebMhxGCXo/IG4Fh/w3fsNx1M1B9pPaV3li
 fOMhjQIwo4e44Va6wUlw38kCy95OS8LEGiWHGhejydsHVKYvywjaHwwmoQZN26JwFJWb
 F9dKvN44dfOeMiFVrQ0z/VXLKsVuRwUBkGPLHYhbXC03SvGuybuBkRI5K7inYkxyxb9t
 obfPAWixe4vRf4B6+oBgTiCbDeUhzhOcV+TySt6/s4ooqAjjEXAt4Ojtp0zYpmueiH7z
 OK/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaARYT1f3Wp+fd+wOD9zZPjdWA9xHMxWC8i38Du/aGjHnNA9txMob/domg+5xlAIjJtSZtgFkLKVY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztQqiUDSTMlS60YHrvHnh455QYVX3bh13PE5e9+8GbBXVvjIW3
 pV0MasCitVOKNDf+xc9z3B2hEcUc4AhXl38/1c/DQN2EUvO++QP9l6J8/yRJvjwmhtzNuxApyit
 9Fd2WsF3XDBUzQAhbzir/jhm0KNtk0I4jxTHRyr6T+6Lt17pNbV0s0p75KeaxPY4ykP4BHuE=
X-Gm-Gg: ATEYQzx28Q9NOrrQ34fyJPgSKTZAr8xQYuqdq6PCEny9x/d7ioNXA+cFTBccHwfhGSp
 Ujxc4KBUZE7FtHjTstkfVNY4QyorLxdmy0pjkoS1frS6vcNaBGcIh3muxNWe54kVM7YvlCuiXEg
 xWX9rsGZayI87fsX1dTdcAiN+xJo9vtwZO7IMaAujM4+jRazLM03O/VZl8HbwRk7sYfMkOyJr1Q
 JQTBIftR58YT0uAmZoC7B4awpfdQden2CFDMaQFIKpvT02J0g8RBlWa9LtRR80i4x1ffIWyfVcL
 Cy3eFhD5Hd2HN7F95hIn1XVdUQjR0T4kMreYJwigcsOzIz98HKeF6bk50klgKoJK45325Mll4fU
 2bSUh/LCw5RDhgfPted63ucnkKt9ea2JyY8rPrhjydqjEYkbJW1YFtRcTqk0bkL/9iMHCokfKro
 gvuzU=
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id
 af79cd13be357-8cb8cabef31mr1473552185a.7.1772016136916; 
 Wed, 25 Feb 2026 02:42:16 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id
 af79cd13be357-8cb8cabef31mr1473551085a.7.1772016136481; 
 Wed, 25 Feb 2026 02:42:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65eab9a08edsm4160589a12.5.2026.02.25.02.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 02:42:15 -0800 (PST)
Message-ID: <6d9bb537-a7be-48aa-9097-0192392d32a3@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 11:42:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: display/msm: dsi-controller-main: Add
 SC8280XP
To: Pengyu Luo <mitltlatltl@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>,
 White Lewis <liu224806@gmail.com>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-3-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225054525.6803-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEwMyBTYWx0ZWRfX1C7KZdQM+PAN
 VJa1T0jAqK3+/I/7o11xDN4e9N7Oa6lkIf0skM7lM9UBYaDifByg3syxgKK8jQBhCIL1iBr0L87
 4EWQInsXVK6rIVeBysj0XOEW1T5WPWs+68ii0IzcgRmjBjF0R31JcXVmY9KFLx/k024tHPECYxn
 hIUODR0skn+zW7Ofa5+WDXoKLIAwePbqcaVLeApWJG50owA5JZa6hCCHlhVZ4wo4DM4HNa+lhiL
 vxerWJClTHHgpxIwP0aRT201TYQbyiGe+win76n/B1gxRTeeaeV4uyldfpciW3u5PVys3cwF63Q
 6fiZG5HIAYcsRXyf8+b7FLHpzosYqelZY4JESRGgnqKjW1yg2hlP9XK+qm+bGoXvlH3sHE8L/PZ
 qkRxl5CKzOIp7q2KEH0stJrbaHTgGVeQMe8glBAdAvyyAKbKnb6RKrJTXW/zh+ohmCMwSF/f4oi
 Npa+k5r+C0YXSp8skPg==
X-Proofpoint-GUID: 1nmwD6SZUAT_c41FVr8kvvVSKFxPAPBM
X-Proofpoint-ORIG-GUID: 1nmwD6SZUAT_c41FVr8kvvVSKFxPAPBM
X-Authority-Analysis: v=2.4 cv=etXSD4pX c=1 sm=1 tr=0 ts=699ed209 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=XmQorHVxhl2AQNUWPSAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250103
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
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: F0229195EA9
X-Rspamd-Action: no action

On 2/25/26 6:45 AM, Pengyu Luo wrote:
> Document DSI controller on SC8280XP Platform.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index eb6d38dab..e6aab0e6f 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -29,6 +29,7 @@ properties:
>                - qcom,sc7180-dsi-ctrl
>                - qcom,sc7280-dsi-ctrl
>                - qcom,sc8180x-dsi-ctrl
> +              - qcom,sc8280xp-dsi-ctrl

The revision registers match for this and 8775 too

The latter seems to have a very slight difference in a single
register though.

Konrad
