Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGY6GtqrjWkK5wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:30:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C288212C841
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1D810E240;
	Thu, 12 Feb 2026 10:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nYQ3n9lV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B5EpOPv+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA0110E240
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 10:30:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61CARa77272086
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 10:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aa6M8IvkT51MgHJ9Y9GX/isOhRijULHWDSLbPiUBeCU=; b=nYQ3n9lVA9XS8uPF
 50P4Nl1PY3l9auM51+Drw7rm4x8n3xn1GHIxJKeFv43VklzW291otxRBixwNZE5/
 ZtIkNpBSvOrKQczDy3cUPr4qTZxwUryZg1qaYJqFbHFimWsL0W5nVEfp51J2BCmD
 ORmemoto8xTIvbfOQyz8CTwQfYzMT7PoNFb20ZkzTXhG8dERltYK0uMJ6q6aCdBC
 LoKO3Y/JC+8HgZg/ZRVJA4Um7TUoSgk4wbR9drkucDeSYW6SIRAS0/INcJMFW+K3
 XLbJICkMx9c/v89H3G2YIU3dXUmvU01E9Lzh5TKEspwWL8+YZyqDtLULuj+aUfZj
 BzVSsg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y9btjsf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 10:30:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb3978cdb2so6727485a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 02:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770892245; x=1771497045;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aa6M8IvkT51MgHJ9Y9GX/isOhRijULHWDSLbPiUBeCU=;
 b=B5EpOPv+76yEaD+4qdRAMZOj3K+7jD7HsdHY2urLS3QiI5DDbzL6PvhWPJtMx8XLiS
 gh9sqQgocGebtxsI7DwgCD98vdfs/Z8jC9J76HxauwZtMpSgh7d/AEiGz2U7zW0cCLsd
 BtWx275RoHai7l1tYXJA3rp+fF9HIl5X3obvJsPPOLaDMe/ZU0ilaZIlymbYZkYNXNok
 rYWtBK4jkuGK1YTFAV7AxoFw3oHt1EindBvcIuuF3uVQQX6uwXE4j6jTH7BePbcvQ9xF
 Iow///1Jz8EXLIlfYN/hNiexracYhxHmTZJtMK0JSSdiPjW1l+Jf8lBYl/tGaTqUiGwx
 QObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770892245; x=1771497045;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aa6M8IvkT51MgHJ9Y9GX/isOhRijULHWDSLbPiUBeCU=;
 b=rcRy8EiD5yJYGX5TVXwzB/hqs6Ea2WTt35QCHOfEWiiCeeez0DFz6+q5DhpzCW2iAd
 55WdLbJr+SNc2K3mtvlL+WLf3tUaKKEV5Z85+RBic1dFYKMTdjoOPymn69mCNDfWq+Fr
 8bKvI/ir9+gUDDQ9tN63eJna0drdEWJhHnquYnjqpkSlThVpPbtlYfRs7hCBM6Ji6rJv
 5MVjJNcG67LiFKlb2/9AFbmpxdbf5jSfzo1Cp6nsBThOB12RjQylqXxrI5+1vb+QDJPB
 6TvbtFTL9uE7kgtLESrJzvTj5cQgMvLqR9OwIvThZqA7/jAhho18ZF1HblCsqqBrdTIa
 stGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg+L/5tsoiMtCzpLGSL98MFy+KWDdU7bpEe6jL96RIYbbM9kCfWJH63M6z4fxQXUf6sx897blXJbM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzpw1mgUKK/Q1ccbsbEtzC03pBl46U+5eMsErMfk32p5wsuYZky
 EmlNq3PlgjfZRqxV4n2JnPCHytmzKgIM9Ts+OAVoTA3SvE1rqiJKc/OAj0CvsQXAikDGwzbsUpg
 wBPCyWPyjT8Ha3eYL0ayGBOLP6gV8VQeiRLbAzS6qAZmsk2+Xrb4REAfEuP0jYhR4elmecf4=
X-Gm-Gg: AZuq6aKissTuwZUd2KqVo9xBDQ8bxRRF3h0mXwxRDDxm3wglvqycBhTKRw+LTEFwa3h
 o8ysHDImAhYn2PO6zkl8z/c3R5ymIHD2Y8KoU5dZKZ8rd8s3JeAQ/+oa/306S2SjX1gtZ1zh9qN
 lTsvRoYaXa76dustQ/caTULKMwqTQGjGg4fj6Ivsig1iSrznqmjPBLs/jgAipJb+WRvhoA/50Y2
 R8RTKQg6AqhnZC6WhCJ8Ap+CbNzT1ViQ6EdoXmj5w4Mlv9gAlkjjW4szTGo+JVegZNbNwrWomrI
 D+TFmfmRRXN8OzhYbhum7SQ56s1Yupo605Gj3Hrgykri83Uwb7scJMUcRjh3nv8I72gUjmmV3VH
 DSwodJkDBWLF8hAWt/FOGvGlpFfFYt60KtvuU5sCDCq8XeIuT5OnH4j2yrlZuoOO7JRz1hgsFzG
 Wkn/k=
X-Received: by 2002:a05:620a:4407:b0:896:ead2:a657 with SMTP id
 af79cd13be357-8cb32f3df9fmr219596585a.0.1770892244870; 
 Thu, 12 Feb 2026 02:30:44 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:896:ead2:a657 with SMTP id
 af79cd13be357-8cb32f3df9fmr219594185a.0.1770892244508; 
 Thu, 12 Feb 2026 02:30:44 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8f6e950070sm150863966b.6.2026.02.12.02.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 02:30:44 -0800 (PST)
Message-ID: <a2b47800-0c4b-4d94-8fd4-1e2f832de298@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 11:30:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sdm670-google: add common device
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
References: <20260210023300.15785-1-mailingradian@gmail.com>
 <20260210023300.15785-6-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210023300.15785-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BbPVE7t2 c=1 sm=1 tr=0 ts=698dabd5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=bx1Af-bPBxMGZxlJJ80A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Jyekcv7e6RrRyzEx4XL9G7csaGKoZZ2B
X-Proofpoint-ORIG-GUID: Jyekcv7e6RrRyzEx4XL9G7csaGKoZZ2B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3NyBTYWx0ZWRfXxxzLKfXzVHAC
 TmvUJkJhBupC7CDGICbXzcnSTYlZzGSsYggCFiu1Tw19bMZr4JukO5gQsm8GRfLlS7M5n2HZtvw
 quP/7p9x+iI3uH2uqW0s+GlDFuirU9pOhMlGoqxR06nNvCteHlNB/hy0mmB5t6KAqIbtVA44+gm
 c0WcHiwmi2b9J/qO9GEGYFBcz8ICHVuAiQJBlh1Kkp3oUwUqRRWiYUesnibo1gXlEzcHK6wBOU9
 /Nm2Dua7pad8x67ttnnZdOHcffOnCoV6jfpowDMSE2/Ln+t1ARHE4BHeKBOFnyyV0PSg9IKf0E5
 jxQ5/ywsAYvagEpftffwN0JoUKlTyA9YGIUhYxonfq0jT3BxAc9S+Ittdqg8qqJg7XyhWUxWYDA
 XSXoIW7D3IphzTVT30Mcb5Z8TdE0iSWfIOC5JezfjeU9zTlIDOFSuOKirktscTkxP/O9ZYpOlzq
 5xBQD4dUeJGGy04AfcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120077
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,9c000000:email]
X-Rspamd-Queue-Id: C288212C841
X-Rspamd-Action: no action

On 2/10/26 3:32 AM, Richard Acayan wrote:
> The Pixel 3a XL can be supported by reusing most of the device tree from
> the Pixel 3a. Move the common elements to a common device tree include
> like with other devices.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

>  
>  		framebuffer: framebuffer@9c000000 {
>  			compatible = "simple-framebuffer";
> -			reg = <0 0x9c000000 0 (1080 * 2220 * 4)>;
> -			width = <1080>;
> -			height = <2220>;
> -			stride = <(1080 * 4)>;
>  			format = "a8r8g8b8";
> +			status = "disabled";

why?

[...]

>  	panel: panel@0 {
> -		compatible = "samsung,s6e3fa7-ams559nk06";
> +		// compatible is provided in specific device trees

/* C-style comment, please */

lg otherwise

Konrad
