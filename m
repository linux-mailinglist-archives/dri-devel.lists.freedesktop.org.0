Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNOpOQCvemnv9AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:51:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAFDAA61E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9721910E2F2;
	Thu, 29 Jan 2026 00:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nhizYGFE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgDNRwfw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F197410E2F2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:51:07 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60SH45Xp1407458
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=M+WZ5p12VkpfX832o5SO9e+P
 vKsqNe/lB/hAlOK3sLU=; b=nhizYGFEF52633CDuU4F8TIdryih2X4NqIejN8db
 TKdy7A8NYkqNhc+Xi5PQxc1HNdOln9lnwsCGcruzVQ0+aSBkhlp70Q5OFHICsuB4
 MTEcbA2Ra3cVw50EckPewbdt/0beA62X/XXBpPjoHYcBty5zEkOdMqgU2GCks9xi
 x3yi3EG0NG00xZwwV5KqabVpDNqT2c2ms6dpHPY6f4Fmfw03abvBoUOz4K3DefJJ
 6kerEiNnk1Uv53ysq09ZZa85w3UeD231qQbITqfeBLl5H3gzpsWzP+lS0DPizhVx
 31+suTnwCsbBugiFlLj9BWIFYdetlurQubsok5wkwseR0w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byphgh7uj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:51:07 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5662a8e87a0so440851e0c.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 16:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769647866; x=1770252666;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M+WZ5p12VkpfX832o5SO9e+PvKsqNe/lB/hAlOK3sLU=;
 b=MgDNRwfwonxqGZLXWTw534kzdbsfGy+fYib+QPdJunbWXk0XWAAxSeF1TA7M6yMsXt
 hKETBq9TeDGDHhPw16FTvdDybKlpPyNtGzvIpL4kpRQXdDXsN5f9Iu99XbaSsahxnON0
 ORcak1D/U8E7ubAdDAVbLBRmS+FYc2kKL2Ndsya4EBuMzV2l4EkQCWYiquHB9yLlipV9
 HletMPvBXBoErf+D7uzcTRbHvSthPGEYhm/OG6/ivU92BVp03tfeCejN096r3M2EOoU1
 AaQFHKEJa2rVDZ2SKQzdUXK26MV9324vW4Uzmc8ksstE7I/jxdBb49mdCpN55B9Fwxx6
 VINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769647866; x=1770252666;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M+WZ5p12VkpfX832o5SO9e+PvKsqNe/lB/hAlOK3sLU=;
 b=oYgUo9TxebULT2OpMdLf74K5G289ekTZsYVLt/YnFjCed5EZ/ZBZcJgTchINQsIE3M
 wojgyCsEkpvEwQchxyfFNXzVYF6lGoP9EdDgz7FYnqG51925O5QUfySpNK/FLG9ckbL+
 T4tXxgJpHIMGzqmjWjc9J3tRnFzE5PQLse0zCpbzP+2sBfWqrTVon2OsRU8veWBQnxPB
 22zRi/vkt12WRPa/oGHYoIZtGkIXic5o1c8QMJwvifEtT1uhyZZE04GRpd+4XSP2SGxC
 LlfgskD1IbV6zzH72R+t7Abh2ayGOmln1IX+N+30c0qRFvbaG5zXcX+YuZBzt/eSStG1
 UASg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZZGcfwg903nU5fBEB3NctHJ5EV5PguhIlZV3SfLV/RtRcGt8Gmqr5aKExEGO+qOXwmsLJgMj/Zd8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0dcKrpPjbHNok8vbHsNB7CYpEDkSqGwNTZIfXRDmCBnZhcF6C
 QEzOYm6aEK0NUX4ehjMT7ES1cRB2XrxtZzQxChmVlgTQYu2PKQnFJ7IozNIMl1aa2xPrvm2OI3l
 LnTHPvwMvlMt71kg6oLITW+n1jTTXnjfz/HPccLW1ms5dZb9Ew6wH6rdf1RjpwRWO8f69ZBA=
X-Gm-Gg: AZuq6aIYqRAQof6u8yl0mfUNIODnM21S0YS9+cHuoAtqOEIj0A8S2xkaFYH8XyBEoTo
 ReMt0HfcGRV6v+7aIqU6XdU0uuNCMfajoIKMgWR1DQX8Ktg4N/5O8Urm5EQHTBHvhXp+kHq6XxP
 JIktyTP62DOGWobQKEeQ4+o3qvk1ljXg4r6kbT3tVFo5XiOXI09eA3NDJRMP5yDXG3LA3P73dmu
 bmb/rOsr2htjimehb2dHyL/Yu0UxJYoojBfI5op/ROY91AHcJ54LlGbcg+fmSHcjW7RdaiUV6eW
 atd8t5+frZ51+wq0EiNYFKgCYKhn1qaQMT+9624hhpEiQZ2BRgPsRFprB7amL4y7Dq7s8AWICqe
 sQKv1RQprIr1hOIoXRxo73ONxMsp03Oy9/2avCfhCesVdBo4J3CdmVzFwVfntngIqLjNnDhCQdB
 nXta7S/yMcG6OlUMcoe2l3Q/M=
X-Received: by 2002:a05:6102:32c3:b0:5db:cc69:739c with SMTP id
 ada2fe7eead31-5f723631147mr2251793137.17.1769647866484; 
 Wed, 28 Jan 2026 16:51:06 -0800 (PST)
X-Received: by 2002:a05:6102:32c3:b0:5db:cc69:739c with SMTP id
 ada2fe7eead31-5f723631147mr2251767137.17.1769647866075; 
 Wed, 28 Jan 2026 16:51:06 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e074bbf55sm856387e87.90.2026.01.28.16.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 16:51:04 -0800 (PST)
Date: Thu, 29 Jan 2026 02:51:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8650: Add sound DAI prefix
 for DP
Message-ID: <77qi3wlmjzdios6a6kqifsbsyusohcddz737fmdgmrgxcqlpsb@f2wkl7sw7nci>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
X-Proofpoint-ORIG-GUID: yn3PgQ9FFd01lqkZyfv8FQDc6tuLZjTq
X-Proofpoint-GUID: yn3PgQ9FFd01lqkZyfv8FQDc6tuLZjTq
X-Authority-Analysis: v=2.4 cv=J/inLQnS c=1 sm=1 tr=0 ts=697aaefb cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=YAN0IDdG5KZRBbBB4vcA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwNCBTYWx0ZWRfX6hQLHXm78+y/
 QMGMEs+ppoJTFWQq7IS5MJ64mW0JHaOq8PYVJaVJTFJ0y8pkuutEDBa3CIvZNzqpIhDqPVmoPmQ
 Ns5VEoW7UcCeYVkVmxLSAP11kkP2jsmtOjYFT1RsMs6bAmMrFytjVTfnk/A1qc2bUjKz0BeXKha
 D0cx9u20+pXMqEB+sdm7pJA9g/8elo/8GAMfZvsCAF76+lK9OoPws4/OSLX5YCxOgDqYOldf44T
 8SxYPIYjnCtEoKQvAR1hFZDJ54rejsQHMutTAiEY2BicmqWK74Es629tc9cbuCVOH+5tHa0Eu0d
 HuQqBOG9qRW9TTAyl6if/xyqIvRoFrt7O9285jwiptA3lx6Rma4WB2BWoZJKjM3wT4VzY/ifGX2
 0wpCHGLyOTHyJPn3aIDn7zSlso2DpZ3vZokToAaa8spdTYRCqb/owGBfFcPi4u+VRjNAXfj+86x
 M6LT0fAXcVu/D45xjeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290004
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gregkh@linuxfoundation.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:brgl@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 9CAFDAA61E
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:57:33AM +0100, Neil Armstrong wrote:
> Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
> controller, need to add dedicated prefix for these mixers to avoid
> conflicts and to allow ALSA to properly configure given instance.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
