Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CiaFyo1lGlAAgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:30:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C045F14A66E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E056210E4AC;
	Tue, 17 Feb 2026 09:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8SqrQvo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="koQEym63";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6E610E4AC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:30:15 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61GL7u97850240
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gjowmJEACZ4xRadd4NQnWlKmWRqtaHYf9/5saO/OcHM=; b=b8SqrQvoYO8x3QNq
 FSvsUnctG4ytsN4xTokHn0KuVAp9qYcakVVTvkQWtF4FIQmcuJ10BnL2ayHjwn5M
 Ury8y1MGmWO6PwnHM0Roi60D0L4ja268iqAUZAoVp5PsRWU8X6Y3Fvwo7fig7s94
 LnadpKGPxND4FSK4bPzxD/CmythYLgyNsvMXZAvZrpeEoXG8sACp2gvCTCBuy9dr
 JTnTUXMWDBHwSG2/WHO3DWPjut95rDEPpJn+pcWRziiSL+GBpZQZboUYNbLAtj9M
 phVCrx5dFiu+0ntgThjyznFiG2GjzUX+crUSZgjXw7R6v41TTlAMSFzoKYsa+hYj
 +NQt/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrsruh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:30:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb456d53a5so308393485a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 01:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771320614; x=1771925414;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gjowmJEACZ4xRadd4NQnWlKmWRqtaHYf9/5saO/OcHM=;
 b=koQEym63dFhEzLBzQp7mp+fFjuRY3ZgK9ae/8z754tQGkURYJaJ9Hbav1FcvkWA2S5
 CvDaMh5KK6APB7LgKB4/7IRx871/eSZXTzIZDIpGu7kkRwgiuC0tYURjvPPpx26vIP1d
 2Bh7G96/BDXomf3grWY777POQag8hMzo8QFPyquj/zKr5CWVRnL+ZgklbDw/FloC3hPa
 nLYQBzYU/AbYBxE1FMy4O4XXNa0X5qhMnl49809oWyhbXlwiWgQv3nETjuZvxMoLsQNK
 yOw/6Vuf/zYe+GM7R/63AcKE28PcLd9MD2Wnks4QrOCRNv4qX6dFDD5lW4EdZcRSiIIJ
 eBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771320614; x=1771925414;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gjowmJEACZ4xRadd4NQnWlKmWRqtaHYf9/5saO/OcHM=;
 b=a3hpKW3GeioDtZx69ABccMt6+rJ9xN/ECtCkVIbVHROsMJCrYCUTPnriF5jhiqR5OG
 gEJwPwN0AyiFKCvGcH7/uNbUxHaz+XPSrkwTl5xcd2oxEJXlSpRNWdMPmKY8LlTCqEiB
 DQc43xEG8fiCS3+EiRKQB9m1umZenuyjpZC8h+mNp+XR4Cka4AqMOszK01esudD39RPL
 es5/1xx+NOvoF0Zhtp7zUg2OGQJgI3ZFdMSDs1+JRYS2FVfJ1EQq1rRxEmWeyyWl2M+s
 WvmazEuwIk9HPR/Sr1VXCR+0Y1hEePJqPNuQ6tNuJSd/zHlh9n1aeYabQtbV0Fk6lqSs
 sE2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxfgs8/M65DRVVyz42KyqHpil0U5iMxl6MO8ZszP7SczIehOF/vYmIh1aL0ruH++f9pBNhybnB3jU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyY8GUd2BoXwnLr1Yzz61ULd2J58qk2aLR6LgwFk/C5I/FLDLg3
 NMRWsm7W+nzkserQ5zmeTzb/u7YKpolcZ/p42GSJcjeffTwTVLzdF184/5VLJubNMnGi0MUnk/G
 tdh/iymdovPlz3C9NhA7LUTSRJk+ptIl4M1r28quGfGiFKQ7mFJ/2ZF75WL1mt+0fOf0iwsk=
X-Gm-Gg: AZuq6aKiv9abL5lall49vifMXM4ieNWS7N94y1yzJJQXERhJSl2W68oocz7Twzg/+li
 IFkZ/fbMfaU+kauAeBdRmSQzAiBiyGZ8E2VoFmly44gI0dRkXL/RDq1YZkaJrve4dNFcu/eOi6l
 uo8/SLj5ZBg8/lg34yDJyck+ed9V4HsnEuFp8aAL9zRQU5SUwhWu9u4B6lP54hNm0xEAQBVJf/p
 Cg7KInjUQhuO2iJvT+ppRCDGtbjNBxLt/1rp6geULjDGw6zRIusVmQg6+PLZpffL8sBMkm8AqF0
 H/3hdqxrCqiE/EHQBYZRJ063J7JMuYRcuMq113BHyKUelugyAoGqJOUG6tAlvaiIi1Cyp0vaD++
 CQCNtAUvnncN5McSECJL5zvRyh7nWnfnXpoHOC59HIVxn/v2SpLhs79QNlIahiQn4pyYQWF7kF4
 YyV/E=
X-Received: by 2002:a05:620a:468b:b0:8c0:c999:df5a with SMTP id
 af79cd13be357-8cb408c8f1emr1310198985a.6.1771320613625; 
 Tue, 17 Feb 2026 01:30:13 -0800 (PST)
X-Received: by 2002:a05:620a:468b:b0:8c0:c999:df5a with SMTP id
 af79cd13be357-8cb408c8f1emr1310196485a.6.1771320613151; 
 Tue, 17 Feb 2026 01:30:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc7385e60sm332576966b.19.2026.02.17.01.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 01:30:12 -0800 (PST)
Message-ID: <edd3076c-c1e0-4b01-8039-5f01c6d0a019@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:30:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sdm670-google: add common device
 tree include
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science
References: <20260217000854.131242-1-mailingradian@gmail.com>
 <20260217000854.131242-6-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217000854.131242-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=69943526 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=CksTUBHohfg0KbD8FugA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3OCBTYWx0ZWRfX1cAx15BPvcMY
 nEw75RKFQQdhPLUGcs/ArMfWzrE3I1syXS19uyS3PLwXv5bwq5fIvEyxihYAr5rW5z5sj2lzxym
 9A+44sN5HbaVPlzRo3eGFU4V0A88i4eF+tbx1DxBvs6dKwG3MyTc3rJaisBnWcjBP5UZ8buPcjt
 AMP9tHf7VoQjI8cQVhnSCECPDhUNFSNwl4VtkffltbdIOwy9Y1z3TdVOPCdc7CmOVGhVjjLhZLD
 h6CFwVaTt3z1ZUZ3G7dwrF9hGEdXN44VWy1T6ZMPs20Ac7riTVUbYvScJubxn/LRWTzVg+m7f3t
 AJpivO4fnZaKolGzn68VoB6NOV6XktyN0bx5K3JIovux4yrf3jCZg2lK6238CqC7ir64qWN36Hy
 TfHuIMg0Ro5/bE//fLSXkTJYuBD/+/a58UIBOfiAQEkbCoyEjvMKPeuF5PUbTnOmwMIEQ9nXFhM
 IBrB3bEcJGTXx0e8tkQ==
X-Proofpoint-ORIG-GUID: G8CZ5dPm_RN9hM0khCMW4xyYW-ZS-0o4
X-Proofpoint-GUID: G8CZ5dPm_RN9hM0khCMW4xyYW-ZS-0o4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170078
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
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mailingradian@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:yifei@zhan.science,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C045F14A66E
X-Rspamd-Action: no action

On 2/17/26 1:08 AM, Richard Acayan wrote:
> The Pixel 3a XL can be supported by reusing most of the device tree from
> the Pixel 3a. Move the common elements to a common device tree include
> like with other devices.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

modulo these disables

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
