Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E348BA80385
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 13:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9C810E004;
	Tue,  8 Apr 2025 11:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qq0eafbl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE78F10E004
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 11:59:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Aj7Ji006556
 for <dri-devel@lists.freedesktop.org>; Tue, 8 Apr 2025 11:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SfYGShmqcwDU8m6aPQIeDmLf
 R7GexvsEqe4YAvcqLMU=; b=Qq0eafblor3qJaHW7n07AL9wxfveW1I8JCHLiC+H
 V9piv80KGismzTB5g0giCp2vGl5NiuE7MPsCrHob7HF3WBxcbnvH4rsyfI7Yblve
 d4oodt5CF5fF6IXEi0rv6AqzVcmFMl7ZC1dboI/ZcG+wydrdymBzznPgskQc4DA9
 ljYD+HmmufXng68S2WBHECRg873kfgxI9H9JUsg+hUbihvlrKD0WuyVt6Hhc6Ri7
 1wYLucM3v118dxFdb/2QCDt2lAEYCyF/CfSofY0qFHsugaZE7mRqZyjO8xHL1Adt
 QF3D+iZw6JMSAiSbMUhcFQk3AO/1eQvB+vYKhBfJfKx4Ew==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftfhwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 11:59:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e905e89798so74796166d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 04:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744113558; x=1744718358;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SfYGShmqcwDU8m6aPQIeDmLfR7GexvsEqe4YAvcqLMU=;
 b=kaHjYXkYLfafH8Lmd7G+fylBgFrB92C6tCSH4VG5aq/cTRqM2aIpGtc/yk5oPlZjdp
 0RoFTS1okz0bha7Z8U1t5AiDh9eawG1CBgtiUbvNFjrB36gn36QV5Xbwmzn4tPcZSBCt
 IZkuA7JtSkg/gdBVyG6RdRqm83a8gB7uVlwFtBHG5puTRZXMBgcop9x1ITIPyfB1KSqo
 SZsoErb2S+/3hQ+tj/kfS6xT51WB7TaL769MDfSWcu0cgzLbmB229fA83jFiUQS6x4uN
 vT7ipNCHW4loe3RKuetBdnU6ZCsba+83pjDH8XyvHmHIRT5sppSZlVrHWjwCfT1JQFvo
 KRzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWom2IJMZ3bwybPnJwaumK/VXPDIUIvTa2xWyT8hMHjklhiOUFpMVbPNe5rBSVLtTHfWBFYiqjG7uE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyk6UJuR7y6ryo4zH1UdurFMWPqLbMHo1sHZfYRo5dQQYBD/5kd
 E8IetkXWXJ0I4PSFRZB39zgNGxiL26iJICTT2eeoaE/u/FXgsM9yXjnzHVI2JFIQiDknXcqQITR
 8L8huvtN5DTdguiPD/WzBbyCQMP4Wmgr3iy8DMtFoBUyRpVFz+ZdrbpdlgSwvq9Ns6a8=
X-Gm-Gg: ASbGnctgxZh6nGoOiuRjMcGWffjdx1Lgm7VRjaGAEDTKbnAgGrLCSSbHFDil4cpaGXD
 rv4buaWpUm3WkMfe6twqLJESryd6MnU2bCZNiM5yGzCDolbYQWoRhv1Vmo221rheRaqNQsDsTWV
 oVYI+fkgtSEOzapvWEP1uryfFg8G2Jmv0DxYuuXPEkYokIlOXIV0E5LaQbNnDB+hZrhxznQlhOA
 /xu0unBOJ03UouI66lqQ01V5lvgohrirD5bH/HDbQT98Jsc6o00l5JVQZbHo8pSRjx4jYBo/2t3
 7uqxg4+kCq5olAiSjWFbkWDZKfepEE4FSU2uLbyQCYFivTfC1rpZ0nXf8IrPPwJZw7AOJm8asLn
 JhkQ=
X-Received: by 2002:a05:6214:20a1:b0:6ea:d629:f48b with SMTP id
 6a1803df08f44-6f0b7471828mr249820796d6.19.1744113557865; 
 Tue, 08 Apr 2025 04:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUpzBYgQ78WcZ+1SeialBgHtwM9sX7c9zUkOnk8QyfR5MRu/+7FIzLJ9zYjIy/Tt3IVQbLfw==
X-Received: by 2002:a05:6214:20a1:b0:6ea:d629:f48b with SMTP id
 6a1803df08f44-6f0b7471828mr249820476d6.19.1744113557475; 
 Tue, 08 Apr 2025 04:59:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e65cc04sm1517615e87.164.2025.04.08.04.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 04:59:14 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:59:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 18/34] drm/msm/hdmi: convert to devm_drm_bridge_alloc() API
Message-ID: <6aeiyzkrjgq44lhdjsh6o6rzibwmpcgxjwwx4vefoyk5n3p7h6@uipdbbcxwsbn>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-18-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-18-42113ff8d9c0@bootlin.com>
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f50f97 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=MqdoT2xZwiyagvIbdbwA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: rt6DJO8dp-GYZZ0WFbue3zCHtWRVWmxV
X-Proofpoint-ORIG-GUID: rt6DJO8dp-GYZZ0WFbue3zCHtWRVWmxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080085
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

On Mon, Apr 07, 2025 at 04:23:33PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
