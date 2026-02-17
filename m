Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDBtIQo1lGlAAgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:29:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E909914A64E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E2310E4AE;
	Tue, 17 Feb 2026 09:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Af5fWNkH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4aMKRql";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A2910E4AC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:29:41 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61GKDSWC597248
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PAJ+8ZH4GA3UgmlDTl80DaFGepw/jrlHBe1aFbiN+eg=; b=Af5fWNkHN5Qlf7Su
 kQDcsJRyyn2UkSV1epFnT04VAn2RG6MmPLSDzfrkaYgN+LfP/iAWEiwtz1iWKm4O
 wCWDffWWW1fuMjTmL6amwN8tzJSrUBbmx8c+avKVlwfqlW3VNKxGgxeQWXtj7M7X
 oc5x4903/SzR4iE8L2nsK9lQ1qmTBd1IQ6J/4BKt77MxxUAr7/artx2+E8xQOVkP
 J8gZWPhoNZY1aIuXnvebSKH7i4D0K/C1ylIgJpR+bQinmJ1BQfbFt2AfV3J3rpyZ
 UpqaPxvjeHVrl2L/cnvISwoNkCvBxQtDQ5ZoOIKv2xkT6AWCXh7lsuE8N0nNDCMZ
 v76dUA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca3619rq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:29:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8946c23cf90so31958726d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 01:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771320580; x=1771925380;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PAJ+8ZH4GA3UgmlDTl80DaFGepw/jrlHBe1aFbiN+eg=;
 b=N4aMKRqlqoNmmbZp5opNBwJTg6KElOM+JkYPFbPFNlTuaizwSQMXT/NJFrhj356Re+
 SlkS8Q8a4KWSb1cuT8xQtdp9ocHRLYzbXUzf3Y9i90Vh0iH9Q2VqqvgIcBd6HZb3JCET
 iymVC7clq2dpjwHffy/CaKkcw/iDoAOFGIYXHJandAIR9KXhw075YP1U5+sXu1jSO1Op
 UltIpwzhoMJCxGUnEAgiC/ESUGARg7rTkk7amiZbLgK2R4RFMF60I2HJxux10eNUE81/
 ygBYX9WPxzCMH6/3Ww4GFKxunjA4iEcb+I3DpSlSbqLAoUITpZpsz3HcXVdnKCRFt5mf
 UuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771320580; x=1771925380;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PAJ+8ZH4GA3UgmlDTl80DaFGepw/jrlHBe1aFbiN+eg=;
 b=KcGNCNr43ePkTUr/1RER7Vl0fE8YVqcjo/yXOl3BfRPSO+Y2y0Kn+lm/00ZoMCk0hT
 QfBblfhSnseuMMuCnNSjM0qZRV5IKyjJgUJG0JTJ01l74JvKQMXNz3EVZpQ1sqQwurXo
 5F4TXt1nSAmnYvW4jgyvQPAGTi1z7KKTIlPaA7xEgakbYVQdxPG1wIQelS6ULO78M35X
 ZJsn0EDvf0jKxnsSxYe/kFscAAIrO4zAwXphl1czjcAvOoyIlTuQ3s5o3215w/BcCpUp
 NwVPx8bAGMWFiQLjGze6qVCg/letMUz7wULYUwbZ+M6Kb+yclbhw2uwe79WJV7stFm+W
 Wl9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsmqr32tNvyxsyXO4nZt7NyiqcROPNM2B8s2t1lrfinJiE7MmPhAUOM8KAfCDb4PvMqlJxQxvOlMM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0o42qcKm5jy2HNrqKR0+B648WZHGp6Cm9iR9opVwy8fq/5YUj
 2m94TkkQxHSRvbjaOZBkN4lKUAaEHVHuKtvtLRbiONQgP27pKlT5qeEItbqQiWMR4MuPjPJBXr1
 wXbKbWNIUcjoDIbThd1zG0E7NoMNm9cQTZ9FYwbxpv+0BNzlsInzPtQG2GR6dfNTQytR2f+g=
X-Gm-Gg: AZuq6aJAr8eSixafaiCQcrWtbYeljaSuJ2GtYwAojHVuXTususJeMAW37QYczNxxPZC
 Y1RGkouzRy1ubP3tggMdwVOgLVXRitQIg65A+mDIShKjs9BZ+XBgZHRU4j0hXuWHmJFT5mfnAAU
 B9gsOtQlV4ZRQ5YtzTSXVjrz4lr59xcLpH57JPal4rlIuicwNRx+uJ07X5TzZ1ovd/dbW9qPB/4
 7vyBsxw25w5GCvSl6WOXMnO+EncxtPA8xq8p3ccGGocrQqANdQA+r19AfANdaXkDBwsaOsT9TUF
 Vi/IlfKMDz0RJpFyn+x/bLiWltp45Z4l/xt5qJ8iLsCSzlnosXJKvs6rtFPs2/VHQFp7qv+KO1i
 grsFV4Bt3bhpkUXqHGcr6ubPKIKYYdHgXTb6SVTQwN/oD6fVMM1N/L5YEX9ztLtq6l4/OWXW9Z/
 DDDxQ=
X-Received: by 2002:a05:6214:8093:b0:896:ff63:5e6a with SMTP id
 6a1803df08f44-897347edef5mr142990696d6.7.1771320580323; 
 Tue, 17 Feb 2026 01:29:40 -0800 (PST)
X-Received: by 2002:a05:6214:8093:b0:896:ff63:5e6a with SMTP id
 6a1803df08f44-897347edef5mr142990356d6.7.1771320579722; 
 Tue, 17 Feb 2026 01:29:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc763bacfsm337458866b.36.2026.02.17.01.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 01:29:39 -0800 (PST)
Message-ID: <0d318ba2-5ec5-4eba-b060-9c8a2fd3defc@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:29:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: add support for pixel 3a xl with
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
References: <20260217000854.131242-1-mailingradian@gmail.com>
 <20260217000854.131242-7-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217000854.131242-7-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3OCBTYWx0ZWRfXxCIZMPvQRZMG
 5zmI4MRsCv0Q9af2RmGNdfVDZ6WJaVzjUxRk811lxs2p/SuuYcK4xSI1TOLS2yL0koeccSs4qSQ
 /G5pWPwUEte2AK0IWscJUebtd5Z03bsFYkHjcPtODbSjvlM9lubUNZ/yOotzSuKP2fER7WCp9wl
 2ygkFcBTiwMK7TSl41US/JaV/h14OUzr8++FlCUsg9wFZrFDwIqX3LnX9zIu1PXMmx9v2nTH758
 dHnJEweEeoctAKiso4hA1g4jdH6qg6rP1a6V/kvErPmrpWD9vjAxDd/2G4iHi+F3tbKyVUHdYAZ
 C5U+3TcJ0pCGilC0vAHy1WIgMbxmK4uy7CtRmMuv90ESoHOxYiUmZQc8yqGERK3cntYIGXSGb8k
 b/JOl/ZfigR4wHUhRb8Ly6Jzdd5XBKVdpZM3BNcXgB3wh6bcbNg0W7nTEmoXNdPHCyqbwU6wKq2
 bFkvBOcSbKiSeRlbTSg==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=69943505 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=nkUbddICNmq_qF48:21 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=i-uTSsb2jE1798FbZwUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: q3ixxI81JcvR38gkfUwi2kNbslJqqEdc
X-Proofpoint-ORIG-GUID: q3ixxI81JcvR38gkfUwi2kNbslJqqEdc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170078
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
X-Rspamd-Queue-Id: E909914A64E
X-Rspamd-Action: no action

On 2/17/26 1:08 AM, Richard Acayan wrote:
> The Pixel 3a XL has variants with either a Samsung Display Controller (SDC)
> panel or a Tianma panel. Add the device tree for the variant with the
> Tianma panel.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +&framebuffer {
> +	reg = <0 0x9c000000 0 (1080 * 2160 * 4)>;
> +	width = <1080>;
> +	height = <2160>;
> +	stride = <(1080 * 4)>;
> +	status = "okay";
> +};
> +
> +&panel {
> +	compatible = "novatek,nt37700f";
> +	status = "okay";
> +};

I don't really get why you disable the panel/framebuffer by default if
all of the "includees" enable it anyway

otherwise 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
