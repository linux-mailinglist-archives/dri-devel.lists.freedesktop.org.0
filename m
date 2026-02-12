Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJL4DI6rjWkK5wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:29:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFD412C7FC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E167B10E034;
	Thu, 12 Feb 2026 10:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0b6HYje";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JFatPFVl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CD310E034
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 10:29:31 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61CAAUmt357680
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 10:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VtWD5KPpr3uE+vRZBfsKTfgXmw9x/t9BQ2vLWIDrTUw=; b=g0b6HYje65DID16Q
 dVH4/r690p/9783TMw+GF82GQzDUXGHpzHDZwkfSyxnDRGP2L8WTzdPDjwBwvRYU
 35ODAe05LnKu//gNG0butsovZcEEgxCOCYBi07yJe8rgkk7y2Ip7g+ltidJ8t4++
 qZ4pyesibQa92pSKFnz9wBD92jPc72ugWWZpWpdaMFwC8EpnaqYZDhgMZcWx6yqG
 3/uFLZE22/RK8itYHjQvlJPBf0tIL4xYmbjzZx+0gDbAlmOdlQNcCkTarXJzk37T
 eg0L0WSPyRQM8be15he4i0swAnVZqWGioMsc5wnpzj7a4jQv8M/rlampr08lTU1l
 8jZ7mw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8uy6bd7j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 10:29:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb10b964e6so148790185a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 02:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770892169; x=1771496969;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VtWD5KPpr3uE+vRZBfsKTfgXmw9x/t9BQ2vLWIDrTUw=;
 b=JFatPFVl508dwqH1hXHMcN90N5lVxwsKwSaabtOy62RLPgLtQMli74sZi6B7zoaXTS
 DW/D2l/VkCSvgrcmnfDQ/R6UU1A5kvhVpfFTjlKLpXpkBsNRMIgALRweNV7Tjm+CZbRr
 PH5e5DAlt8CtNKHaPaPg8I1ZLtNNICym8U7RlIMVLowMe7WT4G5kJGkQpiAFdhERd5Tl
 bFSBC/zTmiJwtV+gVlUO7VlHmozC8dpnvP35/e7q2E+6Xc5QZ5PR1EQ7vxFti4KcZYes
 ocp+A4wbm18dWZI3lxVNFd58WnzvmiiEStQ50G6nGJ+W43IXrXdRJKpKZQvw3c5CK7hl
 rntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770892169; x=1771496969;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VtWD5KPpr3uE+vRZBfsKTfgXmw9x/t9BQ2vLWIDrTUw=;
 b=pYkXRPp9960NqWy45bsPd1hBjHS3W4xj//6+oXaPmgUUxK7ket5XAvqtk3cqGxyRSH
 k7YDmHmCkU/QYusjFzkLQv6x2voZBDV2MNnuB00x5B5EyGcBG70Iv0RIWct+nup7Cter
 Z72tjhIwDVv05eqv7OTIyxxmS9SLVFz62B0hT2mE+LGdRxU6QAc4rqsS8dlxgcL9BNOs
 ioAN0Gv7YeN6YCABOcL1Yhs+mxZz6iRHfkhMXIHdaJpVn4fpCax3Hiq9Si8QBVwq3LKd
 ptPny2Gl2IHB4CfkVzERFBcDtai2+G6zoba3afGlYIJn1amqN+G7V5z5XIY6xq77RNqK
 D8Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeYx8Tzcgc9ShVpIaLB4f+kmb9U+lWo6EeiwCd2QtuqnowMm/0KrFAfnLHu30GAmqTC++pizIKfgE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoGBiy3xeUYLZgOBWKoYlQQOLEAFVAQkGid2kr5F9fsBQIupRM
 cWwlzj6H6i0PAXxl8sVqzMWpU0G4lsaQLb7KiESmAiyRtXWeFYalv0MaVfmMNoz/D8IRNLT4awk
 KsX8wLcM56hJodY6OR0GXJwQZ9QAvZqsFDVPN0rfmJGdrkdQT0WH51zpgjZrd+O4avSC+KFk=
X-Gm-Gg: AZuq6aIi7rb0HJXG2pzNpV20I2TU3z+qZElt570CHC+dA6hSxmWT/1Mc6WTwuNwrDTQ
 VaqhrGld46HKFPqWz+nEETqlBnvJCP2PqIi/2X1Cq9eO3qEMcaAoSYX8WtZbztka3TSC52BAzkT
 nZpD7gALwarDzDi3B/flh9dJFAztpOMBFxfS+1yms3YFRJilpZA4fjyj3+WuM5Rqvc3iXBVMdMR
 OzZ2t1OCQjXn0epfVs96EYAquHRjlQC115eA4s2nSjzzv9TlJu4gRQgwV4VWAsB3i7I1J2bwG39
 ldKFLJSMyytyhqs+Yef80+h1cQgHhLVIRkKZ3+qFFUj5bG4IlN9wEyjpI1mHLomhL0cw8j6Jt6q
 nFI84Sv9YqKuQ0cbUmP7hDMFDm9Lv9WCFUuLVZouXo1k+1aIV7CuFOwKHkFggxQxJkODjIMUf4k
 0oMqw=
X-Received: by 2002:a05:620a:2545:b0:7e6:9e2b:6140 with SMTP id
 af79cd13be357-8cb33166e10mr211209985a.8.1770892169308; 
 Thu, 12 Feb 2026 02:29:29 -0800 (PST)
X-Received: by 2002:a05:620a:2545:b0:7e6:9e2b:6140 with SMTP id
 af79cd13be357-8cb33166e10mr211207585a.8.1770892168824; 
 Thu, 12 Feb 2026 02:29:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fa0cf9093sm5583266b.29.2026.02.12.02.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 02:29:28 -0800 (PST)
Message-ID: <d5e76996-e68b-40f5-a2a3-9dd030968717@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 11:29:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: add support for pixel 3a xl with
 the tianma panel
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yifei@zhan.science
References: <20260210023300.15785-1-mailingradian@gmail.com>
 <20260210023300.15785-7-mailingradian@gmail.com>
 <037d0771-a802-4ca4-86be-5b032635395a@oss.qualcomm.com>
 <aYzZf-9rqqBikpNA@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aYzZf-9rqqBikpNA@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3NyBTYWx0ZWRfXxbI6tJYl8+G0
 FfEeEktt3RGVA+8UKMjz9hfCa2qvSK+NPFFW0oo0G8HIfkSnIZy6++6Iy0ZGmjSiV05jrk3yjk8
 VodAJrauiOUYnHS6s9vuch9OXtl1hguZaELJmjpETs2bZuVr59ol2pOennjuusQWzLhR1YSi5yJ
 ZxB1X80YBdiqC9oCza5x3IPdX71OmvnIHjTeKwovtcl3dtA70hBtWeui7DigKslMOu7RR43ncjr
 bVokg0YBkGLHd6Mkp3G6T5gY26OuUcEj7VKsupnEx9DGL4cH5Aa9BKU57h5/ndIzmMShaGpBIG5
 NCphDIsRbjvzBjUinU59vAseXP4M8tGgk2mJVtwX7HOdzdfrhaifdAn2fpCRlUa2Xh45eLfJQg6
 PHx3Iyg9XuuLnqpubKA+g0Fi6IXX2cnY0PiGZ5N2fwPRWIZ+KOAt0iYBhe87bsNQ60PMnKAOkmU
 rEzZk22OCvBX4tO358Q==
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=698dab8a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=nkUbddICNmq_qF48:21 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Gbw9aFdXAAAA:8 a=0Wqi5sXYzvoKQ2Wxs_MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: MHmmAWBfsoAGgTZMAbFoQHgZapIpz4eD
X-Proofpoint-ORIG-GUID: MHmmAWBfsoAGgTZMAbFoQHgZapIpz4eD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mailingradian@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:yifei@zhan.science,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org,zhan.science];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,postmarketos.org:url]
X-Rspamd-Queue-Id: 8FFD412C7FC
X-Rspamd-Action: no action

On 2/11/26 8:33 PM, Richard Acayan wrote:
> On Tue, Feb 10, 2026 at 10:10:46AM +0100, Konrad Dybcio wrote:
>> On 2/10/26 3:33 AM, Richard Acayan wrote:
>>> Some Pixel 3a XL devices have a Tianma panel. Add the separate device
>>> tree for this to support these other devices.
>>
>> There's not a device upstream for any kind of Pixel 3a XL - should
>> we anticipate a non-Tianma-panel one too (i.e. are you sure those
>> are out in the wild)?
> 
> Yes, some postmarketOS community members self-declared as owning the
> variant with the SDC (Samsung) panel[1].
> 
> [1] https://wiki.postmarketos.org/index.php?title=Google_Pixel_3a_XL_(google-bonito)&oldid=89946#Users_owning_this_device
> 

Ok, please mention in the commit message that the panel is dual-sourced
and the other variant has a samsung display then

Konrad
