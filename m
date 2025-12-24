Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1116ECDB0D3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 02:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAF010E2F4;
	Wed, 24 Dec 2025 01:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SeY3+F9c";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bmaj/Z2K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A9C10E2F4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:12:14 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNFr9On4134186
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YXuhZkCXgoOIEur3KF+80czd
 tsFOs/7rJU6d1bOIu0o=; b=SeY3+F9cH+rD4m4rxdQTI9vpb5+PpRMC2wMxIhSo
 4CJJBlgox3EzksK393Jk4/6WHnCj8/8Hy4KnfbY5luu3kznnZ1YWeBFZWQk1anc0
 2D9IbrKm/3o1wH1unHepQK5DQxp54a75rhoYykaH35R3uFc+XYwxCzy9AY9zukS4
 IEib33rN/H7YOmhNhBQfGbtJMB4ECCcX/d8d86jsnAYLfkbOrIMiObRr76YD5VpC
 a4vWRJe5h0ys+SgnT8PfmZRHbPyi5ZwlD3IjVC4SAQgxKRcLgNMzKpCOrnjFWNcp
 Pf+AwczAtpV/sTLvBFo/C1gSZ5eGCAT9yVrleChnHR20+w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46sexb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:12:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee0193a239so57346851cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766538732; x=1767143532;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YXuhZkCXgoOIEur3KF+80czdtsFOs/7rJU6d1bOIu0o=;
 b=Bmaj/Z2KXPab+tzZk9vDXTo2iwUxNMnEkKH538cZpBSt1Mv3n76LOu1h/oJzQEvYyf
 2E+KU6WKkTX+zkvPw9ls2Tbln/nMy5cRhvrZlqjx4yfnujG9FJ4h11UppSHoT0nJ9eE5
 weFnnNLcv3lcnQUGD++QAol9TrIvvJe79cEshPmEfVAMlQjg0uYwyuXvyAFtc5hMe2BU
 dVrcRCqZg05HR8vF3gmfkt8iIZi6ACswt3f1MhWFNF1pEhBZf1WM3N/1osX2YZ8LyF3a
 EsDaLog+NO4MEZcAUWTpO4CrsH1UD5Pnvc+sDoaZsyQr85arCwCo5xH0Z3ZksVV8geNx
 xRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766538732; x=1767143532;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YXuhZkCXgoOIEur3KF+80czdtsFOs/7rJU6d1bOIu0o=;
 b=JB8OyIicZ4NHCTGIJbog7CmmYFJDxoUqxHvzGixyI1d6k2WjQAe7VC6GRGAvgLF2Xa
 bpLA4rHn2jjLHEao/9x4ph+aUGHgiBuDqMgw6hYtO262NxsSO1X3AsrlOGhq+I/aVqSf
 9GpEKX0vozAoz8FknScgyl+weJHTirBcuPtsa8xtqv2d2wBKyfyQwpvq3fK3i3oEW1Sg
 M4jx3zacSrgx5UnLNLlG43aw2pJEhdYI6w2FocRPi7Wl/jzuwUSS2mZtwcEPsCz3FuYO
 U1OWkrztommzmmjSJ6PDWVj7PlXylLxtZXMZa9NNZQu5gZ2wbUre8sTuuwwzREyCOZBA
 xYAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWty+9RNQKZv5jQc9YljldpVj5p96V57QX/lidaXqeKjEqP2BtXCn8R22jdxjHjihCVwL1vTMRRSpQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvtrX5kObJOa+VJkgOBL3PeFyqad8u4r6F1sOmFQNMJ4SYCJLs
 a2phlYhsEUeHpdGoxOBnz7bCn3/XQV1KH5GR0YkrzlsjAaLMqtHxxmLYoiAZOkH3X1rlTDnoGm4
 tjBeuSi/vsblKSEb6Hy8BSEwgeC7DTHiDrOKvYCaI9eltmCiqKsdwwHExoG2Ahhhqmd8T0oA=
X-Gm-Gg: AY/fxX6LvbrjUfSdNWVWQk+ovod6k4FLXmLCSE5Q2BFZ+9GTKLhzR3mi14OUAIbGgs9
 3Gz2t/7jfyrN1BMdqPwjexir0ngtgsHz3brT7VYHNQ5slNoXSs656N/4LPL1D4WeP8pgPW7LdwS
 aChCL8xhae0gNxJ3NmqPRivjhbpu/JFrstO0J1O/cCmVnOdx8a5hz3G5g+ilE6CJZhUinlXNvkP
 Gq62ITE/kqiPJK1g0mYx6Q6BBSP86dAm5x+1b+BaMt2DYSwaDpOHaCrElTBg9FEVVBtZnjSLIXD
 GLRGTRFaFGF+lp9mt/2QBy/Gsdkm4fnT2KAPx0t2PmbJn5zyDkGNo4q1gI99rDKEiSGfoKBkBSi
 FVRjtCdy7y28p6LynZU5beSpXSwyFUmc9dY+8ojiJrmUhywBh7qd+pTqLEjlRwBddjtzRvS+ZOY
 kBcwjfE5+FSFVbIeUMbwK6B34=
X-Received: by 2002:a05:622a:4108:b0:4eb:a3fb:2864 with SMTP id
 d75a77b69052e-4f4abdb452emr236091681cf.69.1766538732556; 
 Tue, 23 Dec 2025 17:12:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiIEwoAJycDNPNnrRQ2r9Fdhu/zOetRe43PPfWrkAnUXdp8EiynL1H09rqeLnPzb9P/WXeoQ==
X-Received: by 2002:a05:622a:4108:b0:4eb:a3fb:2864 with SMTP id
 d75a77b69052e-4f4abdb452emr236091351cf.69.1766538732093; 
 Tue, 23 Dec 2025 17:12:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18620305sm4515497e87.79.2025.12.23.17.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 17:12:10 -0800 (PST)
Date: Wed, 24 Dec 2025 03:12:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 03/11] drm/panel: Add LGD LH599QH3-EDB1 panel driver
 for Sony Xperia XZ3
Message-ID: <xqdy7sdfuptx7dyr6arhqna4pi5is6ivbuqhw7lun7j2g37xqo@iqdc2s2njjnr>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-3-82a87465d163@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-3-82a87465d163@somainline.org>
X-Proofpoint-ORIG-GUID: h2ZxWD8U24Bt1otLrhfGMFZuMgmBCpmA
X-Proofpoint-GUID: h2ZxWD8U24Bt1otLrhfGMFZuMgmBCpmA
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694b3ded cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=QdKhUILdeOfo3pfzIQcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwOCBTYWx0ZWRfX6Hd5mmhCi0eL
 lYpaXzVH/ay6gL42ysKa3GKG4xF42k6JXH5HGpta1kz6zaOHbyThQ5HkSQnCcZI7fqvD8L25NHd
 aUFCALyDPP+Dv5Z+N8tS7OhxWxKGucBp9jT0xDC2RNNEPYSeZGqJJsL+25EcON7dIvvIpzHygeT
 Oigk0md9XvT5JSJJP4rW/hr+DysYaw8NOU2ZvC7pZfndaMITtlofKWHGucnFxDVb0yt4SEbDt+6
 /m+muY9X9nZLVv8yUIFy04iVhkpqGeK8xQUmPlRsUq9hPsU+BcYhbpKNUQJSJ7O3k8P8SP7M0F2
 TQqqSPW+KYHm4df+G2q9u3O1+TI7Th7gV2YyJgZLucaRuq+f0QmRfLo6E2tAlVzAH29SzNJPl9f
 pcn6J+WWCaog1AQT6BpdaRQVPfM93k3FuOlIzZVn5gY9riXW26+AkcAjc9b9H7osBYc273sgiQ9
 7WubcN6bo/VHsKEAFJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240008
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

On Mon, Dec 22, 2025 at 12:32:09AM +0100, Marijn Suijten wrote:
> Sony provides an LGD LH599QH3-EDB1 panel + Atmel maXTouch assembly in
> its Xperia XZ3 (tama akatsuki) phone, with custom DCS commands to match.
> 
> The panel is 1440x2880 pixels and runs at 60Hz.  It requires Display
> Stream Compression 1.1 to be driven at that mode.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  MAINTAINERS                                     |   1 +
>  drivers/gpu/drm/panel/Kconfig                   |  16 ++
>  drivers/gpu/drm/panel/Makefile                  |   1 +
>  drivers/gpu/drm/panel/panel-lgd-lh599qh3-edb1.c | 340 ++++++++++++++++++++++++
>  4 files changed, 358 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
