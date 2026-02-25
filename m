Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFbdMKPTnmnwXQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 11:49:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76057196011
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 11:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989F910E73B;
	Wed, 25 Feb 2026 10:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VN6zPI5I";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hq6mIqJ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A55510E73B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 10:49:03 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P9SuKC2692204
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 10:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qgtx6s3ymH7QT+Ao1dj1AIr5Jv5tj5NW8LrZpgpMdSo=; b=VN6zPI5IiCr+gGGL
 53BhooNHxkG3qdCFp60f048jASDrYH6JKOc5noRharURaTiFMZgu15lGXHYlPcix
 0006N4TLPzhix+q97aRgaliH9SsMWBgU2em5V4JQrbEqbJyvyEsowx3KYmOFnMzP
 uN/7umfbkPHGI79EGLtGDCfRhdk7TPJkWDIfCVktB6WajlnAZjmDNmf14hY2X219
 XNIPk1W9pUgRM6m5W7tESwYXTUfhqaqHsP0B9IJULt7sYujt57aRK2ATIT07BD0w
 tQ9BxkE0rIckETouBI/kktzFetAQBPiv2GRaeVJc9q89OiD6KD1wPJUITekaPmdR
 6Is1AQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg2gtxg4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 10:49:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8954937be97so74424166d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 02:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772016542; x=1772621342;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qgtx6s3ymH7QT+Ao1dj1AIr5Jv5tj5NW8LrZpgpMdSo=;
 b=Hq6mIqJ47tLzRVuZeGacA29wNUbCIzUY/EUSGPGPoOUHH3qOhGE7ZRSNJnunqTaT4G
 103YJbevIyaFdsXyJXYj6vv4Yfxf5iPv5JB7KsuJ7QSKWXhmt2De1IieVA0442FR9esf
 9lFNl8LEZk79whkV+gZEImCbxldkVSHFuko7xDy6c5DrDtmllhN5+tfZdFtthLlP931W
 4b4AZkrJtYDT/QqoYn7jadB0lB+AWGz3YV52C3SpW7LfSKnG8M+kNu6QqtKNusv81j+z
 UNgOJ4ONiko7ycDdDjCrNoxnJWfK5H9KPbMWr/LL2T7mMIElqdYN/MiBzGwPdqvPqwnG
 N8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772016542; x=1772621342;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qgtx6s3ymH7QT+Ao1dj1AIr5Jv5tj5NW8LrZpgpMdSo=;
 b=RqTv2a7GX60H2t0xn2wUCSfZYDpf/paBR0qsfmRkwPGVj10Akto1I/CAX8rrUsibpJ
 LX/KZGt9rqAluOcxQG9QFEZKvO6w5zwd+q3VRVPlIxeItXHN4PiTRg+1pljW5oGjwKS/
 hPzs+y6bm5wQD4kjipOANDo9uC4Twn2OR0MTlPa1j1G1mR3+a7ubK/z5FzedMRjtJQPL
 dNEbXAP85hiYuvn7Wj+9qWJsigFBNOax+hQuRrhukk+MPjgDez3S6vSbFxwfGZnP+MlM
 +LWpQO66f9/3liltDoejMunZ2sTbuxq9TEE4auR8oXQuHMeu8mAE+pC0JQ94UlY7YjHL
 3RVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUeuVBDJ9guT8322E14pTHRRWGNM2b3Yv8OpwaNo3IzlMMOwd/mUw1feo93wzrOyDmY1n+nx0GSyo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQKQvaAFMlts75mJGycfZ0R5UFn3OFKbYwe0p/oNBYiMGWXspF
 POFgmh2amh+LImp07UqOHySIE6YDldrjtie6+fzvfxIvZnFwBxo4zXOReCvsH+NPW+84hg0mowe
 AyKLEV46l7V0KQxTJi7DrjN1Kv6tdSXzy9/eMoFTgKLvR8vRJqliRH0f1ZVb0AGIPD72qiaE=
X-Gm-Gg: ATEYQzwXq3J3+b42Sbb7v+696MxvuPHM3U9CpBzM2HbtHj6ngQoeTF4gvWVx6rOWt8i
 v6hGcZh4a2XNdbY478nInf/tNwfAV6Y99uNsC8ZGirsoMAZXYbDoFo+/8Sr4A5G3tF65AFtEvzH
 IB7pV9Buu/eTLjkN18JivCwQQXLk8AUx/9BF6tv9j/Tku3LkVUNmRjjW+X7mCVIikx9L2Js63aY
 0hQ1WtwlhbTGLLYW9ObzL54bXtHwN9SuE6DJa3kigd8GQTquvmliggj8ltRrZdosZWzI1tHZo3O
 3qqiRLd2P5ApRHE+Ddbnr0l23E88azHTEHFBe++lxrOU2cd4FL+GvgPIruFaOAKIDiJvRGiKk5o
 SQcrEHJDBmD2keNuODyzz2QTFoK1p8NUxRBUdxz1KZbI+DpJJaxG4WlQTMfUXPH2Cvf/Px69DG3
 2n0mI=
X-Received: by 2002:a0c:d6d1:0:b0:899:b986:9310 with SMTP id
 6a1803df08f44-899b986975fmr10482806d6.5.1772016541626; 
 Wed, 25 Feb 2026 02:49:01 -0800 (PST)
X-Received: by 2002:a0c:d6d1:0:b0:899:b986:9310 with SMTP id
 6a1803df08f44-899b986975fmr10482436d6.5.1772016541153; 
 Wed, 25 Feb 2026 02:49:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b90bdf80b04sm186150166b.3.2026.02.25.02.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 02:49:00 -0800 (PST)
Message-ID: <75113126-069b-4aa5-80c2-e9cfab9b032d@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 11:48:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP
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
 <20260225054525.6803-6-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225054525.6803-6-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ccX_KLSEIWHOQnlNUV1gq1gU9O-zH-VC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEwNiBTYWx0ZWRfX9zRtLf9aXxK8
 sIeYKo2xPK/i3BbkGBjJCDGVf1es/J/6eHiYdDdxhO8HsxZMprVXKLeluUPegYiEwsnhwq5Zzj/
 V2Q1Xm49sLkMRKXQSykzybc+zSRHsEe899uE58kiMyzNvobLveA1eLNHeUbs6qagysIKPrlhqmQ
 acyILX60964tYkPyha5u3tgcwM/Wa84T2uxillUUfzUNLgVC2QusW1t8RsWfEOBQM9Oey0FVITx
 AnuyL++duDgwhDJvS3R1Jlwuf3DCl8jcVZ6Q/Vgt80sEIFDBXWqQOIIl0wyC2/1l2zikfFFvDk0
 ve15zn5p/DQij56xzGH4i0QremzOrXgBQQSnuUgcPPN9ErCVAfmyAx3zo0a6z1Cg8gfmcTMH5YJ
 GpxV+F2cV96AApJVUpzXLvdZOc3+o2RMTq/+sWpM9yIVucGIr8c+RlKmwXU0vEoPE5cRarkho+R
 X+eTKe/03pmeYXbfEQw==
X-Authority-Analysis: v=2.4 cv=ftHRpV4f c=1 sm=1 tr=0 ts=699ed39e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=mSDy6qZ-4McrUV2NBLIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: ccX_KLSEIWHOQnlNUV1gq1gU9O-zH-VC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250106
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.4:email];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,0.0.0.2:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 76057196011
X-Rspamd-Action: no action

On 2/25/26 6:45 AM, Pengyu Luo wrote:
> The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> utilizing the same register layouts and clock structures.
> 
> However, DSI won't work properly for now (Partial content wrapped to
> the left side) until we submit dispcc fixes. And some panels require
> DPU timing calculation fixes too. (hdisplay / width timing round errors
> cause the fifo error)
> 
> Co-developed-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Tested-by: White Lewis <liu224806@gmail.com> # HUAWEI Gaokun3
> ---

[...]

> +					port@1 {
> +						reg = <1>;
> +						mdss0_intf1_out: endpoint {

style: it's preferable to keep a new line between the last property and the
following subnode, i.e.:

port@1 {
	reg = <1>;

	mdss0_intf1_out: endpoint {
	...
}

> +							remote-endpoint = <&mdss0_dsi0_in>;
> +						};
> +					};
> +
> +					port@2 {
> +						reg = <2>;
> +						mdss0_intf2_out: endpoint {
> +							remote-endpoint = <&mdss0_dsi1_in>;
> +						};
> +					};
> +
>  					port@4 {
>  						reg = <4>;
>  						mdss0_intf4_out: endpoint {
> @@ -4791,6 +4806,195 @@ opp-810000000 {

[...]

> +				phy-names = "dsi";
> +
> +				phys = <&mdss0_dsi0_phy>;

property
property-names

in this order, please

[...]


> +			mdss0_dsi0_phy: phy@ae94400 {
> +				compatible = "qcom,sc8280xp-dsi-phy-5nm";
> +				reg = <0 0x0ae94400 0 0x200>,
> +				      <0 0x0ae94600 0 0x280>,
> +				      <0 0x0ae94900 0 0x27c>;

last entry: size=0x280, all instances, there's actually a register at +0x27c

[...]

> +				mdss0_dsi1_opp_table: opp-table {

You can reference the prior OPP table (and just call it dsi_opp_table)
since they're identical

Konrad
