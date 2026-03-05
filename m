Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGvpFVFBqWkZ3gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:39:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B68F020D8EA
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83A710EB90;
	Thu,  5 Mar 2026 08:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zhs1szgR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wx+oMm/8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8360210EB90
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 08:39:41 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6251O1K43665160
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 08:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=; b=Zhs1szgRs6PvG6yC
 /K6l0Og7co3C6ED8icQT7ngtsI9G5Zp17IaIYa/MOFJSyTxAUHo39qtMLOBGQhpj
 JO9fE/F/E4F4LvhAKnAlFKn+fH9sEpkGqfNT9M43WTCJkjqaFeUzfOGpTrDAGNtC
 tA5poP4iW9oFEFa2er9A5XyBDJ8CedmbmCYM1jjJmOXgrD4UqsM96/EbUTiVA/x+
 +Hq4ib0d4uJFejDRNFTAYPM9OxAzG41cfjw0IJBJVDWkmbFbGS1eLwFkvUDxUI+x
 i9yGzbk3U3z2KxBfUGbK5GoyOmpZPSUHhrYGJ9ek999ywA1Q/YTR3XTo5MWWFrPw
 1lqwYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u18uk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 08:39:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb5a76f13eso420672385a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 00:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772699980; x=1773304780;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=;
 b=Wx+oMm/8OK9Bx/a224B398MsUAK9IM+FA0wGTHGuMzm6XU7nYat28Vi+bHqMgYMOvM
 TC0YRiu7ti3GnRmdNzItNRXK49aj4dcbZWCylpk19Rm6s9cohuhnlVlMN6oP8Ovf8ANq
 LYVY4qXazU/pBiNbp+EhhtZNUUvgVgPicGB/4MaPTnwFO8Y2+ejPBU+yW/KId/oaA5Ia
 3XuJb7GaSkDcq6uWjIOC82QIgc5twl0eUYAx+q2+oSay9ti9pvRqzAQdHjYr1niTvR40
 Kb8mnlSyUBRAn0ZR74aR+Sy86bzPWzcai2ISG6Br80pjRFMdrQZCL74hdxLVu75sBytK
 0KMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772699980; x=1773304780;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=;
 b=ripffSur3qsJDJ5Z4OiGp4OvH5fwp8F+Pj6XxJ1P7aTcBPOA6fo1qtJl7NRQyVXHfc
 JVzQHIVMeeC1QNH7hnzDQ95EdWq/WIsmUtaMTgBPFOu2ssNgXXu44dp+XGbAAOUE0LPG
 cKVlT4t1TqkINnJLaTzR5GzrBLHevhyruvvC4fcuD9KOOLavOSgfUArJDbQQ9gE13XCF
 0zXU9Hzx54LP9fmF6r44Yod9Na8UU6MyPEsSCJ/TvoUiTifRJbQY41Xh7LsOYOU/3RvU
 pCQNT7oURS5Z9K7d2lMmIRMLSXn0bwIFdzceH8ejNIvx6DSXMXCCHPlzKCHq13wjOJb2
 e06w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4i7CsPnXC7Vo51IaEIXdIRkpHu+CZadDwrRVEQ4e1lDPHmE1uxaY6yoQTmfgvtQ66IfsCwQcKpp0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0LapD3hrhqSH1vNP/61BWmhuPvfpkbMTZ9pxuCo/Ayvbva8PT
 8yNKB7SCH1DIyQKXvRKKOJYQ/K0s5/dbcOH0Vk093JLa4HqhNyUuj1Tn8XBKNxtzB+Jeoxw1WkM
 3Gcp4QtCcT9H7cBbUtLlsYYQpKXnBk/s9VBxlRsgEhlVaCkdzoJ4Ca35C0EcLGE4L9ALdtL4=
X-Gm-Gg: ATEYQzwViD/uddNiY1ZKaIKnf2Bma62MbKHVoitBda2TL5tyabVaRRa5ehgLxoENEda
 D9Do62+R+ErqVZSR22uyPutGfQNQzcsfSsp5NEmDqxpOBJjmeXovImVqC73iQ9jIpdbJiU/nOMA
 RrduQpk0N151eW2MjMC6fipPTBPqypR2x/EIlyce0FiENiidZ8EAVQPxFv9XPVSJK+t5sQdGLnM
 v4UgQSjjuxKn97Dr9BHEAsjzAf0hs+LkIkPR9fiYpB3+Op8Sq+dE8ULDOeZ062WHdvjqnegYIYG
 A07CVlDu9Cl4c7QH+WmmvlRm12OCMI9yPhXBzMkW8do3NI2pEDKH0XugFdQxX5+S4No9bESvzrP
 Y+dX2TU4iRxJSe2YrbcHgjLU3w82s/D/NKY5a7PbViUq9vuQvsvK1dSTS+hpVMPWWG1yxBaFjiz
 VNFVY=
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id
 af79cd13be357-8cd5afcdcfbmr452358985a.9.1772699980147; 
 Thu, 05 Mar 2026 00:39:40 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id
 af79cd13be357-8cd5afcdcfbmr452356985a.9.1772699979710; 
 Thu, 05 Mar 2026 00:39:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65fac06e3fasm6657504a12.25.2026.03.05.00.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 00:39:38 -0800 (PST)
Message-ID: <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 09:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304175735.2660419-23-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iKFOZnRYk1Jz3yHbCXHWIced8ckPUqkR
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a9414d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8AirrxEcAAAA:8 a=GJStlgXwfe-SXQdWLvAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: iKFOZnRYk1Jz3yHbCXHWIced8ckPUqkR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2OCBTYWx0ZWRfX0Fag5JHWB1co
 J4QVPH8SAXe85LaX34N9bEuwPoxJEHj17+pODSQskCQJxaYvQLsyHIghEVjKfTVOnYwYaMOlzt9
 sExJJcUjKYIxv1qVyculiFYtERlgpaqQcsaKcIKzk9SwALheH8JkcpDknhCBH+Cz6UJ+nyAl2w+
 g6bcsruqtoZBqcb8NzpWTSJ8+gSZEce4lDbLuT1qYAbSVEPXJzJcy8+FZwXq44A0cody9k7HoRm
 w6HQ/DWda0svTidIUlAXrQH6Z4gGd8nMOMO++peVrRux5zOlzVe9S2MxN9X0kjL+CQM1g5xvPYI
 WgSxlwTEXL0h926Px6rxt9vqPub+Cw9zEvd241SJhgf0e6LszLil89xW87KFTlMvN9qwdzxkz9+
 eEXZHOZjKPZIat/ep26Vt+BECaoS16Eq6oFpI7+lKbnoS9+8Wr4jkYcW6fW/xQd9gg9QfsulHnZ
 EEm40nw/VggPRgnSpOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050068
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
X-Rspamd-Queue-Id: B68F020D8EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.oltean@nxp.com,m:linux-phy@lists.infradead.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:freedreno@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-can@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-ide@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-usb@vger.kernel.org,m:netdev@vger.kernel.org,m:spacemit@lists.linux.dev,m:UNGLinuxDriver@microchip.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,nxp.com:email,qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/4/26 6:57 PM, Vladimir Oltean wrote:
> Some pragmatic shortcuts are being taken by PHY consumer driver authors,
> which put a burden on the framework. A lot of these can be caught during
> review.
> 
> Make sure the linux-phy list is copied on as many keywords that a regex
> can reasonably catch.
> 
> For simplicity sake this is not perfect (devm_ and of_ are not valid
> prefixes for all function names), but I tried to pay attention on
> avoiding false matches on things like:
> - drivers/net/vendor/device/phy.h
> - include/linux/phy.h - network PHY, not generic PHY
> 
> So I used \b to try to match on actual word boundaries and be explicit
> about what is matched on.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..bdfa47d9c774 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10713,6 +10713,7 @@ F:	Documentation/devicetree/bindings/phy/
>  F:	drivers/phy/
>  F:	include/dt-bindings/phy/
>  F:	include/linux/phy/
> +K:	\b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h

Would looking for the devm/of_phy_ prefix followed by an open parentheses
not suffice for the 'has function call' case, instead of listing all
currently present exported functions?

My worry is that this approach is overbuilt and absolutely no one will
remember to update it

Konrad
