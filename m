Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPQfLc1IqWnw3gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:11:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2579420E0E5
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8485710EBB9;
	Thu,  5 Mar 2026 09:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W0Hi5Pu+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZY44TTg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADD410EBB9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 09:11:38 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6258rtud1193205
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 09:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=; b=W0Hi5Pu+/Kx9rub3
 1LuwoztTEiyin65jy0AFa9w9CeQosyQeKJh8uCqng/kW+AvyBzw620uEIw8ElxxS
 p7DgJXpyHxlQCgU7ZnXWh1fDC2kEZgsF+bNRtHfjWvvQQP20fzVlblnrbJN5YtJj
 cuXRnfwIw9A1WDVd75f5iR90V/hmIMXMAApDkJvz92wPoO8C6Cah4UDdFm28qxbm
 JkVKYxCSPSIeuDpcvHiSq5co1WnUKQ63+OjUFG3+cpPsRMO9kCFdRbA5AXYlIq+/
 D3NF4cr175vifDznzJXmfwFBgZlGYxgAmz/Vae9OYLQmqMJp28j53fTOD1MekVJb
 WfF0KQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpqwgav5j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 09:11:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb456d53a5so613004085a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 01:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772701897; x=1773306697;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=;
 b=gZY44TTgEtd1bNgb5i0j7KWUtd74Zq0EUa8HnW5qXlDoqSB8HFIZlWcMTlXT31w4se
 WmlgyJ3GyGQDs8mT07bbnw6RQnlp66VAAigfN4yfs9Jq683CsD+XRhY8EhpWtFkcyIc8
 Gc8CPqALL4yakZS0vjjysr3q9lTQ1TcRjiD3Ohm6qFnxY2VZZG0LjSefM+blvWZs13B1
 l4dT1MDanSXwHZ+ff+QSv6aRm7nH8qJHS11R98QFa0KkdxfKMwdYRlxCnEqwkDTqBQkO
 1GZ252jY6S8oiBP7ndcGNoS6FwyJz1rHYyrGs2lEIbQcW73g6r8jl4C4FXQh4zZzJRNB
 fiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772701897; x=1773306697;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=;
 b=EkynFPakUpxuBFXM5Ld7wo98QE+CeuqxA7BOwqatYPx9ArdHHMkgfliawsDriiD/GU
 jDfGwrkmI+HAgGXY3un8M7OFJaWjOIE02UDm1CUIIpLxIPq7K1ICgHyQtqb+bOYQAklC
 180ucXPttAaHR3fOiF1JwzF5qIqg2tR7xHd4xV6BjmIdreRUlspgVrxHNeZAsKE5PXOP
 7Y5MIWknVkKROKOUlayUn90j/wjMAWUqh1OT8L+0xUuQvQ9wNE9JCZVOqbeg0v2n7+e+
 nBgj+0LD+TT4bdHMBtUD62ufx2YD+waAFrhO4AgtNDsiwZUn/LlQC6xvnyiJc5MZx6Fz
 VLgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+fgoBdP+geLetY+7vbc+BWMD9F+8A6kpbzR0S+JdhM3E3VNu97FmEBBxYBaIUuRXuid3r3DPAWnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKt/gTwDr636ZCfpIvSC8Ipo6WC8Qgck/1DXs6D/fKheK9WQm7
 ujfAjgUWXcAUzTeKKE2RV5EQUJ8P5zs2vbSHuu9VyG/MwIIs7HeADRQqbSpYtKyAaetKFaAfq6M
 S1UviLM0NY0TF9IcYLgZKZMDV5Tx0JGfC5ye8vuzC7a+XDlG1x+a7/uhZ8M4z76QFmZDgiXA=
X-Gm-Gg: ATEYQzzIItgWmQAOBOR6breI9h6I0KGjmaV1UdtBSAWVnkaRMaeiM1nxOAbzBRIhvLo
 tVnN+qNcF2JBp5pGZz3OMlw29rEdx5mTWByWp5mR7pc2vcTazSsZQP/WZ8+yVtfubXgni6Ym1iS
 ZKK4Rfb+ZiylrZiX3H/aFTfSqAeutqEHf6sKUtb4clAifaWkNYziMtpJLnKYrjlznfqBlGFNaq1
 AIXX4o9Duy7cNZrRz5VZSjL/IKB8sqp7eC4+BLXpbD7mJ71kjouvhS9mf3YsE+FLz2CV7u0Zn+I
 As/QF+jkF0ku1mQkezryXmACh5ynJvfKKIYjZ8H1GIMJ+a0MVoXgxCS3Xi/P41eXN4eCZO2dqfC
 jezvfesX7yCWVGmAlGz7//pdLewelsdgXSJZ7bebp2UikBeSn3TMrYZUVP6hGH46pNaetcHp/Iz
 VcOOo=
X-Received: by 2002:a05:620a:4156:b0:8b2:ea2d:a5 with SMTP id
 af79cd13be357-8cd5afb0224mr487944185a.7.1772701897056; 
 Thu, 05 Mar 2026 01:11:37 -0800 (PST)
X-Received: by 2002:a05:620a:4156:b0:8b2:ea2d:a5 with SMTP id
 af79cd13be357-8cd5afb0224mr487942685a.7.1772701896576; 
 Thu, 05 Mar 2026 01:11:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-660bf4d8249sm2589351a12.17.2026.03.05.01.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 01:11:35 -0800 (PST)
Message-ID: <ebee2fcf-9069-4a9f-ae72-86f4471cd4f3@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:11:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
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
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305085148.7cwo3yflp7vcfldf@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bdlmkePB c=1 sm=1 tr=0 ts=69a948c9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UIR2zDuwlqQ-mzEo0xkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: WCsccNFDMTZzCram-N9Ps-diTjnQJ5hz
X-Proofpoint-ORIG-GUID: WCsccNFDMTZzCram-N9Ps-diTjnQJ5hz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MyBTYWx0ZWRfX0kMYFeJklMN9
 /FW7gb8WikgUJ4iJ3bZ4RAtwO5k4PXPaM8G94MTZ8nBz+kLXfxgSaUcTa2gZTVc/2zNTjxxWOdw
 Sw+ajucPWu8gxAp/yj0q6QzLiUEWuFpG1Yo8hYlxE3/VeNAmWvnyT60WXhAFgFcsgL8ghZ/2kMU
 4rqrMXFoRjbaLU1z/TT/JDv4DGkFMocOJDlIsv6Bz8H708uNzYbzXd7jE5FAC0wrBXlnoZ6eGmR
 3o3l6jpAQisC1DTcPSHgG3b2ETAd4oAL8AOhKkLBI3XCVyV6/yHCV+ianUaqwS5Mvj7vqw35JTq
 lZB8zdxtii1MT5QtfK7b044wGRw7eT2FgE/7ieApGqBcZP1lctFQfdWw33d6S83gkqoMhZOxscv
 2/5/rMP/HPlJULiHkyEat90c72E1R4g2ib/xtfPwcPspM/YiftUUDU1tuClXjYt8qsjUnkxIhvq
 6sGSvCazYRxAHRIxJMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050073
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
X-Rspamd-Queue-Id: 2579420E0E5
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim]
X-Rspamd-Action: no action

On 3/5/26 9:51 AM, Vladimir Oltean wrote:
> Hello Konrad,
> 
> On Thu, Mar 05, 2026 at 09:39:35AM +0100, Konrad Dybcio wrote:
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 55af015174a5..bdfa47d9c774 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -10713,6 +10713,7 @@ F:    Documentation/devicetree/bindings/phy/
>>>  F:   drivers/phy/
>>>  F:   include/dt-bindings/phy/
>>>  F:   include/linux/phy/
>>> +K:   \b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h
>>
>> Would looking for the devm/of_phy_ prefix followed by an open parentheses
>> not suffice for the 'has function call' case, instead of listing all
>> currently present exported functions?
> 
> This would maybe work when you run ./scripts/get_maintainer.pl on a file.
> But I would like it to have good coverage on individual patches too. And
> since the devm/of_phy prefix only matches when you "get" the PHY, not
> "use" it, my fear is we would still be missing out on the most important
> part of the patches.

But that's just '(devm_)?(of_)?phy_[a-z]+\(|includes.h'?

Konrad
