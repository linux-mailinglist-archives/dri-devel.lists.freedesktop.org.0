Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NYMMOrxaoGm3igQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 15:37:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6988F1A7B40
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 15:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC5310E95C;
	Thu, 26 Feb 2026 14:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OIP+FHML";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6hz0XDi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5DD10E95C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 14:37:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QAKja32376147
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 14:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MGCOVaY17Ad9+UUgzh8TP9K1EA7s2p63TnHnE17GZUs=; b=OIP+FHMLn2yvrtF5
 +ewAYmby+R+lSHLNMgAEeYyOIx6mq3zMIWdCGDRCizVhuYpt2OFMdF2+GCpJGEaQ
 SobRXaCUckNuM1dV0/iQiFYyk2eW8UCiR2/gDLMCue1nebLg16XEANd9AGwgM/Vb
 awvyIYJ9wF34IEdPWpw4T5kAqw+yM7f5Gso7SPf7jluXGuCBvm1t9Pk4Ll9WDDZa
 zRVGmkDkIgu1aAso5i6Kwbkg7AmZH7nSJ7b1BxbZ6GlSWXlzE8FieqpO/zTEq1Af
 qRTsWU2dvT9Ce/4E8QTRrbD4dIZVMnKXKQutcMjzDkZvTq/zBvN7Gv5vtNA7H1O7
 PtWdqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8d8qq0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 14:37:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb456d53a5so76084885a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 06:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772116663; x=1772721463;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MGCOVaY17Ad9+UUgzh8TP9K1EA7s2p63TnHnE17GZUs=;
 b=D6hz0XDibr6JWuL0S8waLoZdsnk6+2q0t/ARReeBv6x3ttri4Ra5zi1UQoP5dv/eKl
 +4y1Hs4nX1xTjJ2BnvENO/AO5AA7jInVDUZZ9CoZGr9hxm/JrA0c/LDn5qroOBZ2L0+7
 WDYHbk8P6dVOSv71i/6nrWcTh8NZeSMsp5/lLJaSz18GWvz6MyVj5ANt+85OXEEO7ycP
 dqeO+AviGVXBVaDq91L3ImM8/CHHiL/2SNZfBk8bCFZ9Ftg5iaSalTTQNYEN9ikNhKVc
 oXbgPcmVa3WpaJPhEeiE2DzbB2UopZTx8QeQ60y5JWwrQm1kTvMEfzCkl9zeTxEbA6Wv
 b3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772116663; x=1772721463;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MGCOVaY17Ad9+UUgzh8TP9K1EA7s2p63TnHnE17GZUs=;
 b=tpmPsYW24+t/TaETo1p2mI2RrtZbGaTDzMgAy9KPYkph04gMEjyAMBHcYn728eXTb/
 wc7n6Tj9ThfYvPzjzRr47famGk5r9VzMRLgyywOdxhg/S1fMS8SBj+oFcR/UHeK4/QSf
 BjsV+Pfz2Hv58KGAlNqQpPhBrhtMmgd2fZAdISNt4bp4N6kG3muSldQ+0BcnGFFnP324
 HL6OB/GGpVaU3OD3CYOHweBgN+Bz5MpCmG8on7LyIKQjFcMuEP52TKZ+YWaJtkIg7mMi
 WGB1Mq6dPPY14OJKVCLCLSKJ+HWTe1gQfFX88Xxy2JHAi9fNYsSqiZWHGdEZeWtqv5ye
 7E8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQvHm2JXECbKKFkJ9gu3yt0UD5FI6bRXjcy4FnlTCFjoelxjXDMOmPupTiMYQTMyWj4ZsMtj8ISjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX6fgZHummAqdxSUunuxAAbgwy6Qp+UynQcKfRBU+zOlsJxm8n
 Zd5GDn8UcWIW67B7mQJTHw9rweeVLky/4vxcPmm7X1S2bV3nregPUTRE/BUOJ9ErmlkWA/HS9gs
 GyVM1nRtrFWvzJL8/gVUBEHLgvnhE3U5r1M/ZEH5EPXOE2giszgQopWOft2+ALKkKgc01X08=
X-Gm-Gg: ATEYQzy63lWAysgPr+Y4VzVcdvCt0Cc4QuSqw+JOjEt5iGYipfUEbP+4mO8DjpWgxCT
 8f6td85vhpNfr34ltGx14Hwc8TPX1J5rroeyDE4Prc7Iio/wIrpQikIIpTDaIUI/QKSB/YDaiEx
 Tx1AJASV636jkXZcbd3FYccmWKpBj/lk+XYu2BBfz1B3pryjh3U8h1ayM7VXHcBBPMRNF7ELOPD
 7XrroKWJXW5iw+uMbBfeTclvmg+lvnKNkwNeC2IWThrl98nglD7LaS4iN8BOwWgeaReswB9+Fsq
 yuykElGcCKLnSY4FmuTeaK/bmteUaYYh0A2qz0PO1mnGHOwPiTjMYE2ndMC4sQ3l4yXvt7SHm4j
 GobsI04x7AVuT60aWUbdjvW1fuhK7SKTjUaFxcgMIgXOoDQ33gTMa1SaGukC3O4WKVpZpWk3psS
 Wskpg=
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id
 af79cd13be357-8cb8cabef31mr1935603985a.7.1772116663461; 
 Thu, 26 Feb 2026 06:37:43 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id
 af79cd13be357-8cb8cabef31mr1935598685a.7.1772116662812; 
 Thu, 26 Feb 2026 06:37:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65fabf6d1c6sm509000a12.17.2026.02.26.06.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 06:37:42 -0800 (PST)
Message-ID: <77f52ff4-4b6c-4f50-bcb0-51b89e67d0ab@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 15:37:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: lemans-ride: Enable mdss1
 display Port
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
 alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_riteshk@quicinc.com
References: <20260226111322.250176-1-quic_mkuntuma@quicinc.com>
 <20260226111322.250176-3-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260226111322.250176-3-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QMtlhwLL c=1 sm=1 tr=0 ts=69a05ab8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XQLX8yjaJUNYVVxXu1AA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MQfCSv35GF8tY_2h8-EGsPdTz9YsJJu6
X-Proofpoint-ORIG-GUID: MQfCSv35GF8tY_2h8-EGsPdTz9YsJJu6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEzMSBTYWx0ZWRfX8pszfu61ALcp
 R/0MalpvpomBZfrmOKnTZNV4ukDrO6Q63JQS9Zwp4vFaDwbudiMXLtfuNYPpaQPxuzRCrzlZbna
 PWDnXJTGispwW1jJQ2CkOiEOYangBcbpBoZp5So5lEsgSm3RfLL4qd8KDPh0MW3YHHMDE485cO8
 6N4JnhTAq+P6klzMXC3OFS3vT0+a3tDDY1+JXdPpkEGugj9Lkm8joB3Upg2nywWllyjLJJcAeg9
 XZ6+23cHFNfnKNWo8bHZfGCMXQUtKbR0xYMM1SSEj0NqE8aXbxClmJDqRdjn5KskUXcJ4LoSR6V
 NrdecDZA8+5sZmbashm1znV0sxmc3f9U9CTY71WgwYZvTjq36MEelGmD7e/6fImX0tly2dXlDHb
 3Cl5q8kxfrJCROPyAS+eXRl5n+uYuqVL81gxfmA9Wg7RUCpW8y+eX9p7R9R1q2BnZXola2brYe9
 4QOrAJqg5n4XN5uCnCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260131
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
	FORGED_RECIPIENTS(0.00)[m:quic_mkuntuma@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,m:marijn.suijten@somainline.org,m:swboyd@chromium.org,m:mripard@kernel.org,m:abel.vesa@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:jessica.zhang@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:airlied@gmail.com,m:simona@ffwll.ch,m:alex.vinarskis@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:freedreno@lists.freedesktop.org,m:quic_rajeevny@quicinc.com,m:quic_vproddut@quicinc.com,m:quic_riteshk@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,m:alexvinarskis@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[quicinc.com,oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 6988F1A7B40
X-Rspamd-Action: no action

On 2/26/26 12:13 PM, Mani Chandana Ballary Kuntumalla wrote:
> This change enables DP controllers, DPTX0 and DPTX1 alongside
> their corresponding PHYs of mdss1 which corresponds to edp2
> and edp3.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

Please switch to using b4, you omitted including a tag you received

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
