Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF651B44855
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 23:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E647F10E029;
	Thu,  4 Sep 2025 21:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQH2Fxz6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0744010E029
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 21:16:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584Int5l008136
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 21:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Mh8AMrdW/g+ZTiJBMaP3XjJz
 yon1YTwT1+baWuYxfZ4=; b=FQH2Fxz6fog71vdvkBS4rxNYjUGXV7+eG01OaBsm
 yMLaThMXmXuStGfvH7SlNCZcTUY3N3mxN3SP96ZvFtCpl3V+kAL+2gKrqafbdKFP
 6h+IMRGKFLs552kncQiW2Vj812qgGGXKaKqHRie2b10QC/ZL9qNVBHXFqh0fYqRp
 S04WQ63ktqO15nxPE+ieUpJfYsLPQjODDxWYw9EaJ5ZSfIFZVswUuOxorYWXJwLY
 ww3BGPrxCccGuJ+9XBeVgqxFqNvVIteihAWFtZ3bcituFquZqzIg6XTNCoUYbB98
 XnrxeeMDjZ6gWmA711DhdTNJ01pnuynxy7+fXAZ4hy2tsw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjrw7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 21:16:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7248ed9f932so13497916d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 14:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757020613; x=1757625413;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mh8AMrdW/g+ZTiJBMaP3XjJzyon1YTwT1+baWuYxfZ4=;
 b=nFpvrTSKuPz8QkEaydJTo1M8B2i1GKU6wYwfqWHa759EOl2Jf1TWERzOWrHA6Lm74W
 5HQlcsUBGxOy3Kd9cGRNt5w5e/ArmzSaS9O2+D9GOxU2M/+oSxPycNebgtW0xei1FqTa
 S6tN935BsR3xFy/5Hu6gvdhroHpnCXfAn8Pa/PcptQwTk27yt24or0jigTOab118pVws
 B8oFRfjRS2LPFjnLy4mD5J2/D9DDPAwaUTRkasa/RQ/FAlfbuRlMDfgyzMP7Rl7bB9yW
 tySLG1ca1pSldAFyh+prmvaLbMQvHfvKKjaMor03CequNjQ2AV7JuZmek+y+QG1gO7AD
 R63w==
X-Gm-Message-State: AOJu0YxwHb0PtNeO1HzCgIevJhbSZmn7cUOtNfkS6DGMZfOawmddgtvi
 H+bp7gASzzkz0X0X4bHGbPNBkUThtTAlcYMzEioFV0cgOyib2FenI+PoFbOZ5viC0RYZokGOINS
 Q6AgRUSE/Vi5oo1bT/ZIX/aqS7BmqqgXCkhMBA0bvAwV3W+D7/eeu9N0OU5D9uUshnJVidXc=
X-Gm-Gg: ASbGnctqMeJu1C7SFMwrQeaw0BtwIjHQ8u75Vnoy2gJ+zJp4T6TKK1Ok1PivFs0VeCT
 16RDoItoL3DKQ5oTOBqg5eWhM2PMWkjlyLOBa9zwKHd+9VSzDAvuHH85nL1Lm0BfAo5yG5PqWD7
 kLJdIsJR3wRIdNixZMm8iVhfW6oWGT3YsqF4M/NVt4g9Jc2cSVtzwbmxCeWNb1E6UM2fgiJdi54
 dVOekmOIxZ2EZqqWPklkddjHUdwrQtxGW0yId0dH/M3JTG+pc1Nn0NnXWpdAG3Qr9MiV06Si3uM
 4Ed9zQ87xABjKmp4ebZLOj0S80uC95TBfwGQjbEQxvMLgcFwH7/tAVVrjWQ+MTQjn77afnYtrUy
 RU9+G716aavzAFjunkIQgMZAnHK8kKtyrRy/tp/0teVM8j2ILNCYB
X-Received: by 2002:a05:6214:4002:b0:70f:a9a3:251 with SMTP id
 6a1803df08f44-70fac7877bemr229450016d6.24.1757020613038; 
 Thu, 04 Sep 2025 14:16:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2H1du5auKnvQbtV9SHrDXiNbYxgk+GtJPZ9m4TugfdymzyxBYc9+tnOTS22ROkQ9dqLXTOw==
X-Received: by 2002:a05:6214:4002:b0:70f:a9a3:251 with SMTP id
 6a1803df08f44-70fac7877bemr229449596d6.24.1757020612516; 
 Thu, 04 Sep 2025 14:16:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ab5c226sm1447746e87.22.2025.09.04.14.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 14:16:51 -0700 (PDT)
Date: Fri, 5 Sep 2025 00:16:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: ilitek-ili9881c: Add configuration for
 5" Raspberry Pi 720x1280
Message-ID: <ojrgzagempsmmlpm44kp623zltzynkdcatq42necy5a25pvfoq@ntkb5gaknszy>
References: <20250904205743.186177-1-marek.vasut+renesas@mailbox.org>
 <20250904205743.186177-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904205743.186177-2-marek.vasut+renesas@mailbox.org>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68ba01c6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=b3CbU_ItAAAA:8 a=VwQbUJbxAAAA:8 a=RF00TdSWAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8
 a=e5mUnYsNAAAA:8 a=dCZUmJHuHaGrPOQQW1IA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=_nx8FpPT0le-2JWwMI5O:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: cpH8mD3fPfC2TGJnDh8ZadJAysM_mY2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX0PIsf6epUs38
 CTdYFHhnGhbwkhziOsgCFFcCR1p5xATRDXVudAOyL9H24HTftTkV5Ke0Gi8m9I6WHfyABYgX7C6
 7pIUzphJiMZugBxmPVk2aZ1ZXEm5jZR6rYg2iQ3F4BQzmjLS62R6LyjTo30BfkqaRgk23ywI2R8
 kKRo8eDip9A774djmliq0z1A3rXCAP11TSZ0pEiI0xazJL/Qywr5CQw6zp6sUu85w25oPw/KZvJ
 een7aSzp1fzw3uyDNhvcLfRGaU8OoJZIwgQjUcio6J9jK0cgcvDpjLvs2HlumQyxLbLWIwAVKwj
 CTpeKepOKRf/RBx4+hFoX5nMtLvQLF3CqUN8uUxhZvFh6sZoTkEZJIhwh/VwEoBEvGq2YZ7NDW6
 B8LLraZI
X-Proofpoint-ORIG-GUID: cpH8mD3fPfC2TGJnDh8ZadJAysM_mY2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
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

On Thu, Sep 04, 2025 at 10:56:57PM +0200, Marek Vasut wrote:
> Add configuration for the 5" Raspberry Pi 720x1280 DSI panel
> based on ili9881. This uses 10px longer horizontal sync pulse
> and 10px shorter HBP to avoid very short hsync pulse.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Turn ILI9881C_COMMAND_INSTR() params lowercase
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 214 ++++++++++++++++++
>  1 file changed, 214 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
