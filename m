Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DD5C29851
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 23:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BB810E0A2;
	Sun,  2 Nov 2025 22:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ccdr8S4j";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDoQYJ18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E4E10E0A2
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 22:17:47 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A2LrXf11194251
 for <dri-devel@lists.freedesktop.org>; Sun, 2 Nov 2025 22:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6JQo7wed00v6G2v2l/AOp2Cj
 244tmHQ6AbEypOtyoak=; b=Ccdr8S4jtGVwRZB1EqCZyOcZD45Ja1v8ZN2CFM2N
 WX+KrauHW/7Bf5rvzBmZpdS9jDxCqZWrhDXKQzBr3c3ZIramL2vIGwyBSmzYe1Pz
 MfIfpfX5U+hWZPouAfVq+4s98Nv/I38HLBzXGF4ExkKHDiw8Eiv/HWxJzD9r0bDm
 UjfknwDWyUNx3YxIcazRJHIiYr+VUnjQhghJ15F/W2BDkX4nGvbBmVwSFVOi/lvq
 ZnCDCIFYU8xh6wrTPGxmiCtLPRfDbQ4rvCEfoLbHX6H6FodbBgFoavdeg1/QgzLI
 1d9iJ9mb1fGLnGmeeDf9+wvb0ExSTt5ke9qpxx9QJszMug==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6f0w81ur-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 22:17:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e88ddf3cd0so104668381cf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 14:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762121865; x=1762726665;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6JQo7wed00v6G2v2l/AOp2Cj244tmHQ6AbEypOtyoak=;
 b=TDoQYJ18LVJBsozMVsELLmFsIfAhHEqtA4YeMELT+7ifs5bGQGZxQAfdprx2gIazTg
 9RHaglHJ7YFkE6N4iR2nKp5KAAJ1FPmGPTzTM6RgZTN0Ixzgog6uFhztfXVknBfzv6F+
 XeXa5hgf8ZNwCJ7MikkCf7/37k9h2sPdRtyLnfhBo0mMuhvIiEwKlDDgtbdDnsq0F0Qk
 EbXCPG9W443MoeSUmDeGEDti1I+muuA91V0kJrBdR82/284PizICk4H57azW2r97svLM
 i4X9CfsqXvAuNrwcfTJ/RKc0JePMH6lzIN2erk/C7/240QAZQvEgS2F1QWjNfSf9zpLu
 74Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762121865; x=1762726665;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6JQo7wed00v6G2v2l/AOp2Cj244tmHQ6AbEypOtyoak=;
 b=Xy9qDrrUFRBUaNK2BLHya4DpNioMEH8FulgyPIyrqfcCWm9K35dhtDxmgCyYoMlL8a
 DNSKZGuk/yDPjypf1RTMZ8dCboDjSzrzCuP5rorguENESmYXlNNWJ0tleDaRQZIgtzUs
 LWBZLFrsYQuFDfDM7+Pmep6Jg+quD0QUbpFdLTUlyh615nd85g1hxKz8DmNBNqx4WzzD
 voCPnGuaftmq1xVz6SmI03r6YXRxi3sDTmw4UPFSCkgKseEmiwp6Vn9Lncy2fdmjxIG3
 XdOXcljfbHd8vWAOEfLeqJBsF95fDYGKbgGIFvlN3P2+0A6W859neT4HZww4f1e13dzA
 cobA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6Vp6b/zPf74OzKtYyUwlbmIKU06RUVaVgs4vvkkQbIO1BRwgru+fUKrydMBpXrcoVSWlK0Dn56XY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVm+Dwmg+09+0oUg4OYzLZn4tXJSxDvGOf3ByNkj/NmywgQCun
 JVcMtP6/o6HBXQVPjC1jk3vpnutjmIPQD164pS0aoJEPYFQwkCLcTCMyo7C4zDMUaiJXbz+h+/o
 CrJ3gya027WRx/omrzFccpJSRCpA+9rkju/owR0DUSQ3l0tHMyY2ZSgeEKmRt3TYIQaSS4k8=
X-Gm-Gg: ASbGnctfuPBNGAvH/MED40VEFSTLMnXDg4i6j8AK8XjXXEeELFgKYT4eEH/k0ljbKcv
 1I+Ds4WJtKZTZbgrhhjUpyxnu+dswJoFgu5xDSscDOpstxzzwl028GGBBJlZBwaLlkkunY8yb6z
 xedZOvDbPa9UE9y8X9XYMdFJzcU4QjlMWtte0qK0v69C4SBxWJwQlEY/ztIvWpw5wlGAa5h6zjo
 fK4KOacBwU9SNl57BM4RJDIYtYZU2ZV2JHY4LqyEzt8JFIZyJ1v6uz8zf/M2K6Mlk0KfsYiCYg2
 L2EvE1myxk1HYjUEFqkps3+E6/TF1/1p3h9AtbfMTtJrBurinsxrRd9pL3evyVHABD3zDZKw8+g
 yzkc/gcAoXLO/j/UyoPm9k8M0Isy3h7t/Ia1juJiT0U0rdX2ljulxBQKUyB0RfL5Bc4tNK/pmS2
 cuvYTwcITUCti+
X-Received: by 2002:a05:622a:1b8b:b0:4eb:e283:9262 with SMTP id
 d75a77b69052e-4ed310a7896mr128717141cf.80.1762121865435; 
 Sun, 02 Nov 2025 14:17:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmAKJhop+j7hdlHiiGqRfXCjewIexYqqgeYXYic+LYuBAAh0RBy2NHdip4iwrCy+CDUQyPUw==
X-Received: by 2002:a05:622a:1b8b:b0:4eb:e283:9262 with SMTP id
 d75a77b69052e-4ed310a7896mr128716761cf.80.1762121864960; 
 Sun, 02 Nov 2025 14:17:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59425f77cfbsm1328091e87.100.2025.11.02.14.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 14:17:42 -0800 (PST)
Date: Mon, 3 Nov 2025 00:17:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: maud_spierings@hotmail.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: x1e80100-vivobook-s15: enable IRIS
Message-ID: <d54z4j34qqguyqmlvgfy5uj5vuhlow5gk5zdk2xjbyrzh3gbvl@jbn7xyis5njx>
References: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
 <20251101-asus_usbc_dp-v1-6-9fd4eb9935e8@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251101-asus_usbc_dp-v1-6-9fd4eb9935e8@hotmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDIwNyBTYWx0ZWRfX2YoxuHeUNGo6
 YudYIJO31PdRPA/7H5U1JXsJeDOwUifQgYXgepdxEgdIilmBn1SbcIxjhTgiHVqIcjkAVmgr0bw
 o0xvmhUsQRVSCt9PhS7pY/9R5Ir/oMyVQAEsoccWJa+eo/9ahvfMfED8573OAfOzPLd8WJ5QxQc
 M3dvKzFs6Euc3jinZFDsgRB12VJniTiHHVjprVxhXeBR24Wium8IXfLA1Bn5tpuDV4k5IfCDvad
 kRDIvPaalvx+H0/ZxzIvAASwBiMphmUdgc/3Y81A2kd73S3DHsZh8es60jVPSmWe0vhlQtY1vQA
 Rryn9/ApgbLdgSbhvfJ+jlvgDMFwiEoSzOdFb/GM8u1wwhlmLJjhMkqKcSICiURh3G/nes9LFma
 8+zGpfIoiGIbhlJRsW04wShK5i17ig==
X-Authority-Analysis: v=2.4 cv=LcAxKzfi c=1 sm=1 tr=0 ts=6907d88a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=69EAbJreAAAA:8 a=EUspDBNiAAAA:8 a=GX_lnnJ6PiQ3Sj9TFooA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: AFaEfh_a8nh_GG752VjYMj-SuXGqnK2J
X-Proofpoint-GUID: AFaEfh_a8nh_GG752VjYMj-SuXGqnK2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020207
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

On Sat, Nov 01, 2025 at 01:54:17PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Enable IRIS to allow using the hardware-accelerated video codecs. The
> firmware is not upstream in linux-firmware yet, so users need to copy it
> from Windows to qcom/x1e80100/ASUSTeK/vivobook-s15/qcvss8380.mbn (just like
> GPU/ADSP/CDSP firmware).
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
