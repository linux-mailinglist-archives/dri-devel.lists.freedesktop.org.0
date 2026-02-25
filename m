Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EMBKuLWnmkTXgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:02:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC581962F5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315AD10E17D;
	Wed, 25 Feb 2026 11:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gj71Lqmt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJETFIKN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4231C10E010
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:02:53 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P9T9fo1579355
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TCehKZ3CTAFQvrgMAIAtSRO7mBHF3+IpN0ZUYoyGgrc=; b=gj71Lqmt+QsOGcgr
 QT+C7TeAdLB/L1JHGqTi8D/KxWELRfsdmDJmi3LQ4jfk7jgJXAfoR3jMEiCh/A4p
 IuSEij9RaDPh5u+qPfjaRs11yqB0UUJTpgFu1jbCheoIicN87s2qN+RDVqDjRBTM
 W5B3X6WTUhNqG9MV4UzwVpH8gY+JaG79UGHkHcXtQ//rcdCTpbor1KCxTjG/P5+V
 IMnJwfSUCHYOgKKtQ7dzF0ADhUb4RDSKNgk4OJzmw43W5VsGM6t9v+hg7J0ifRB/
 a+aYiKW416s9Fqaz5ODWjtPmhEOfVUF3bnS6KKHLaDF0dd+/GsETlalDakED6/07
 BVcTfw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg1sb02m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:02:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-896f5c90f07so70361766d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 03:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772017371; x=1772622171;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TCehKZ3CTAFQvrgMAIAtSRO7mBHF3+IpN0ZUYoyGgrc=;
 b=DJETFIKNu55+0/It0Own2Mi5rebPop7AXORaW2akqkUQsWqY3lL9zmvYkFnzxJOpxB
 gKEyrlJShvoEj8g7KiR8EqMxe56aUvvRg1vobdxZ0DoYgNGMj0YjxqxTXVP7gJDTvXHB
 G9KCEEX10NOPSRDcDJAdqlWWmltZDBm7tK4H+Hw0U3rxbK6TXKItkT5IgCknIDUx9R6v
 ozYgj35A2G63n3RAPBYY3m0C8+i7cgNVXVqKrH3zUqjQfrNAXtzgKnGZ2+SJZJJPDsjc
 418/8uuCRKV9a9TLdKwOSlK8GfdRm5nO1PAlg7/zXKyFuWAfLDNPGhaWmlxaJ3zsxn0b
 hOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772017371; x=1772622171;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TCehKZ3CTAFQvrgMAIAtSRO7mBHF3+IpN0ZUYoyGgrc=;
 b=Bra1+qwHQ0ACPX3B+lIIqBiQ/RpO2EoY2LjIFZpviXAQ2xOfX6aiPdDFTWEUnjoV9Q
 WZ/qyk91ROVqq8qM8Wk08YfAKrIYVR+71s7aEPH6I9wfWleziuowd8pmhTQgkHkmRJeC
 7gCUZXnftulS/1/0jgcNgsTPk6Z0tvMoQJ5fEGGhxsYBymsdZynxD9OmwZIw4lf42gZr
 HlhJrcawUwouJlXTXgP8p7p6xiyxCUa+nbprCvyFQidJAOSD1+dd2WZ3opoh/USicYcP
 tZA59g2QNStYXOZYvuh05q8lS2R4HRCXt+kbs2R5xb9dMLx304xMCzFua7k7plTTlMvc
 w+eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtdc9LqftzRs6fSBk8NJGMdwxG0xUIJ1UGs+IuzAb+AhGjSA4ZNXqGYSBQ8SbTZFqxT2jNQaoOIH0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGWGIdvW9gTxA3WZkcagaP+lIm3G2X5mKPVb6awXNQiY1tKYFc
 6Rsardg9fRUPUBY8gzDf/ThyEvwugTy+eg5P/E40HDC/IhqYxBfb9qK0MtUg20ajF+yjrzFiMiD
 p7RDKscS40p88ucdZ/RdFgXJtON0FwNcMfOTzWBZ/gdRjRM4EWAkb0kJOkf22KxLQcxOix0E=
X-Gm-Gg: ATEYQzwgbsdBpysaMBrmsAwYlc89Y8O7q+ZXbdY9L4BWAVcYf3MtGPXrO0Wsc/59Gz4
 FuObjNFBPhpDx0OcPJ17WpWUdABAv13zVP6zPF99p2lTF2o66uy5L0KvJ9wPpqdTgWFqosEkTdo
 MAND1SRoUIR3j7xSLrm6N509STmECdY7C3yzNmt0urN+HtuRgz0oVZRiWkKAHxv0299plSLx+46
 aP4FM/VOwEyJ1Kubv46S/xHCA3S7yxWTK0xvHCi88/EdnW+VFCVU6/904GP2E70/li44Prff97S
 HRCjQEFeR01VxgWVi4PL9TllhOsSxdH9piPUKWHt6TkjuKLLXJsQylNOC+dEj/HZdXf8FmkAWGw
 yCygUBtgRFU1Z7yjsEOedSo/GsRmhpP4GfSDxmFEFBWeK2IIDKyQo5oS7bnW/grvW3/IkFcRAm2
 aWY+U=
X-Received: by 2002:ad4:4ba5:0:b0:899:af95:397c with SMTP id
 6a1803df08f44-899af95776bmr29743146d6.8.1772017370956; 
 Wed, 25 Feb 2026 03:02:50 -0800 (PST)
X-Received: by 2002:ad4:4ba5:0:b0:899:af95:397c with SMTP id
 6a1803df08f44-899af95776bmr29742886d6.8.1772017370450; 
 Wed, 25 Feb 2026 03:02:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9084c824e0sm511254766b.22.2026.02.25.03.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 03:02:49 -0800 (PST)
Message-ID: <5617b6ec-b1f7-4f3d-abda-d7142c323759@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
To: Krzysztof Kozlowski <krzk@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
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
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tianyu Gao <gty0622@gmail.com>, White Lewis <liu224806@gmail.com>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-2-mitltlatltl@gmail.com>
 <20260225-analytic-economic-parrot-4c3a45@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-analytic-economic-parrot-4c3a45@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKvaWH7b c=1 sm=1 tr=0 ts=699ed6dc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=iltczeOmeScF9XLDky8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: WXCSJ_lK5uoXxfnBLgjsVG98nqvoZ5xv
X-Proofpoint-ORIG-GUID: WXCSJ_lK5uoXxfnBLgjsVG98nqvoZ5xv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEwNyBTYWx0ZWRfX42fTgjuI5uK1
 F7T9GELZB4myKl534BzI2ThDTMKybAEw3vFCIk2mML8cHj1WaxN5KtAOLZt84hcuz8trKxv4d2C
 s4BBCGbSciUTySc3/GOscYdaRFWedC2iSLMQD/2TGkzW7Ox2YXmn4N4+uQHgbZB+D+9DoRPJI7Q
 6SpkyS55kIVJsDAbvB5uBfvZnvwxdNTMMtzfJDugPp8GlMG4ocJ5I8dzHHKCEyn44h9JlPbeRWG
 TsTtNRpIiIJH4gwiBuZULH25loRPIq2l/U8z8BhWYspVnavgn92Kf7h2JFu80VAR+UOu6vfvMlS
 rcCftggiARBZrEY9sCF2P9Fy8BnJ1H0ZGRBf3oSzUO16LDwCI5q/cpaCRgsnNrXnooIzqS/aTQo
 thkudiM7P9oQMACtwZVY70807M2Z4dEpjj2ufO35JmYbBXOIhnN0nvwXw9xzkxsx/Vgi2ynttQM
 6UGDiexvRRRTM+qmElA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250107
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
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4BC581962F5
X-Rspamd-Action: no action

On 2/25/26 11:24 AM, Krzysztof Kozlowski wrote:
> On Wed, Feb 25, 2026 at 01:45:21PM +0800, Pengyu Luo wrote:
>> Document DSI PHY on SC8280XP Platform.
>>
>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> index 9a9a6c4ab..9223af1f4 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> @@ -23,6 +23,7 @@ properties:
>>                - qcom,sa8775p-dsi-phy-5nm
>>                - qcom,sar2130p-dsi-phy-5nm
>>                - qcom,sc7280-dsi-phy-7nm
>> +              - qcom,sc8280xp-dsi-phy-5nm
> 
> Your other commit claims it is compatible with sa8775p, just like some
> other devices here.

If that helps, they do have the same values for the REVISION_ID registers

Konrad
