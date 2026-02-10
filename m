Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLI2KyD2imkePAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:10:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E6B11898B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEEE10E4FE;
	Tue, 10 Feb 2026 09:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+iJpxFx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fl9QW7rT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20C410E4FE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:10:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61A8wsg51232087
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XK66Jj0ro33gPZNkCb3QlDScSpwkfpiEC9ZAdx8O7og=; b=m+iJpxFxnpPUI5O8
 nQHwBNRU9x0QJe2x17chgULjpaA5chcyvWbXWb0LOy58bubsFBIAaNDZINojYlCN
 EQn3fgE2/8fDxmmmFQoCwolBjJpifW/ztlt88RNmYM6UBVFZpPo+L+7yYzR5arXx
 TNOq6wRXgYouYHjOiuXZJtaixUNalJQdeQh4eXPhQJUX5UvgDGCY+lzkLMSq9LTh
 YhtD0wtRljqc2x7hcR58B5w3jSzwi9Eodxfoxzn7EKWbE2COL/oadeOIEsiwrNV+
 eFGx0P+hs+vqbIHvCkFOo3nxAXRwH59yT+H0oLjGPko/3omouNEVQaneOcZ/yAQ9
 77IvaA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7uv596n8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:10:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c52de12a65so94321285a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 01:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770714651; x=1771319451;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XK66Jj0ro33gPZNkCb3QlDScSpwkfpiEC9ZAdx8O7og=;
 b=fl9QW7rTBTe5xe3NQZnvMbqpthovWY3Y/l7/iIw9tIIB2lE6zVkXvASVE6HvtF9ixk
 jWB4cmWtiP08gJ82MK7N9pkionXmijF9n3cjkaovp5b43rFhsZZQEssLy11yp0btbHsg
 UQJlqUFIMyFe5QdR7oofCIA+WQh6Rqd4XhPVKfG2HHl9R25gTmBaNWEW5YTEZh+pEgoI
 8yNFgg8qJPxaCgJBvWxEIc6jCE3FE6d4n7iKfLTHyCjzGSWw6wbHdRzMTxKup95wcNrh
 ehTk5QiLTIYQvwFCMd6J/vTZw13Gn730RK9A+Zbz9HFdLLhGlJYWIwxZqH+JRiMCqBil
 N1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770714651; x=1771319451;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XK66Jj0ro33gPZNkCb3QlDScSpwkfpiEC9ZAdx8O7og=;
 b=LphHpvwGLqvp9f3U4jWnXJ7vI5MSMy76TDEwEHzmaLilySV4+kChMP15FkyhoPX3Se
 Uip1bis0kYZKBUIuXFxOe8lzdeD/32R3FsQyEG/6qkQsCGsGivoaWnljBkx6E87MKjH1
 8xro1AA473kZEdEnaoWrZbG6EyKmwUsdTyFhKAukGMsHsNvr9ydUxXHaKi73JZAz4xHx
 G92nEuh0e6k1/UyZXe6ZSCA9pRCNFwOJrr6Z/435mrUyQsVzKA7aArsUk1Q78dhh64Ki
 uTd3bZTpFBuTYfIRydf5DLGtnFsbDqB2GoDS6LSjCAC5PW19NG7Ot6W/vsbEbQu+OTvP
 inaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjQ+jn7FybIr3MjyT3qPKltuXUF0YrB9qKrziOB0kIXzRoDSj/bWrgGUiHMrOLS61YT0L5pYaaN/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp5NIx5WdOLcowJRY+ISwGK1/xxhwjVMZaV5zcJFx9to19HPxM
 bBEsmSH92t72/t4Ad1M9P/p3pDT5RVMWu8w+A4reSKxN1GPSxPpqqrC/hCUuDsr7XpfgFMwHDpS
 3p9DWtxpbHytG0TeqTXwiidV9JuM1d2woRK8cU2T86QX+GHiwnkqkHKJR5f38tF3nQ+peqqo=
X-Gm-Gg: AZuq6aKbwPcs+I9WQTMiDi0SvCWVibPfgbvHp4KkVixF5csvuRlpLnfkBzcMHtNVKsx
 Ks2aIns4Pi1vE7ziKO8X2ZnHTrgPEqs0f8URGWkPOYsIzsbEjigkO51XbMvnWKFhmCdrV+SSVhp
 k01vHfduW2aeIf+yoiy+rYOxwm9gtq93tDrEQmHyWSjLBQtuYcPsX/rGe7xKqDS17dO8cSfXCjB
 0ozqwu/3/MhzkffaTQPJRF0oBweg+u2DHGyikwClHueClK1YvgaErlE0lC9xM6aHjuXt8UqoVFI
 kWi/CaEjsB8fhWHyVPvE8LIVQxtMvwqqogqmbFWQwlRhEHst1EoGsKczArzhKCSXFFSDs0+GPS7
 h8Lcfnce8iwesrk5JH8jIUgy814jo/26ufayUbCDad9sM4AeiN3ToauUbtGKS0Mk+eY9hO7TyRa
 flpfs=
X-Received: by 2002:a05:620a:450f:b0:8b2:ea2d:a5 with SMTP id
 af79cd13be357-8cb1ff48dcfmr99978685a.7.1770714650857; 
 Tue, 10 Feb 2026 01:10:50 -0800 (PST)
X-Received: by 2002:a05:620a:450f:b0:8b2:ea2d:a5 with SMTP id
 af79cd13be357-8cb1ff48dcfmr99976385a.7.1770714650433; 
 Tue, 10 Feb 2026 01:10:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8ed6fd27f3sm498845666b.0.2026.02.10.01.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 01:10:49 -0800 (PST)
Message-ID: <037d0771-a802-4ca4-86be-5b032635395a@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:10:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: add support for pixel 3a xl with
 the tianma panel
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
References: <20260210023300.15785-1-mailingradian@gmail.com>
 <20260210023300.15785-7-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210023300.15785-7-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA3NiBTYWx0ZWRfX1TcOLx46E5Av
 aEDLH8SI1DBs/nOW1cQDp15Yma/RHzpzA+H07TN2dcBUslVlIq6ujq3DzushoEwoK/CJsx4UOT2
 A5mjaupbzNjuUEO5RBBFN940LMMyMZMFVH+9QDSm2pw81pao6BN+zkcV/TpoUwmoahDwVkwjNNf
 8Whiyj+bLF01dEaamYLGutLESoBaeqQTzNNAeMFX9eVUp4SLGUxeCDO80ZIV0OjAkQS5v8rmuDC
 IMPjaxzsXY+Hwx+KhonGC+JLy8vXKb8574rTy2c1zeoOZEupIKG82gAZ/rCl+YS7y/Voq8Ye2Zf
 jtpD4VoFHa4wdzF/NXiJIx6tc2gqz8PW9pv4BGpfGlo0XjjdhuKV2UZ+TlOwHyk/H8k9B2m32jU
 nfad0omOnSbLql5n6xpml5Q/Y0k3+5xBNhIfzObPU+Sjtr0M1IQ+D1t6cnqW6xKiXXR9JwxStZ8
 Eze1v6dbHQ5xjDMw03A==
X-Authority-Analysis: v=2.4 cv=P+Q3RyAu c=1 sm=1 tr=0 ts=698af61b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=nkUbddICNmq_qF48:21 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=5zTHlj9xAhvqCqyxulwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: eb0dlUBMFOkpyHHsganvFsnK-9ig78F0
X-Proofpoint-GUID: eb0dlUBMFOkpyHHsganvFsnK-9ig78F0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100076
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 21E6B11898B
X-Rspamd-Action: no action

On 2/10/26 3:33 AM, Richard Acayan wrote:
> Some Pixel 3a XL devices have a Tianma panel. Add the separate device
> tree for this to support these other devices.

There's not a device upstream for any kind of Pixel 3a XL - should
we anticipate a non-Tianma-panel one too (i.e. are you sure those
are out in the wild)?

Konrad
