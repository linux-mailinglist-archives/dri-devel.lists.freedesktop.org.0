Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06015A73DE3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 19:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161EF10E150;
	Thu, 27 Mar 2025 18:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cd80CeK4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB9E10E150
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 18:19:05 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REkV0Z012382
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 18:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aoTWrCFaTivid1BuHrnm332W
 Z/Dokh4BgKZtGbAUu1c=; b=cd80CeK4WxWfMcGL07XRq4yDvenoVRFLslM8W+Vn
 ckjms+fSPzqemUOUQJRtBxuctGNdVGO1L9BNQyLvjpPlfiXEyPkgokhR5H/dk/M5
 GLCVUWn6ZC6ZVq7nKeMYyS27XB0tuz19kRkUdAP18PUqM+DGSBhqSgynKfJvApde
 MPzikmpiF28SPpvhMMWpsvjN39fCYhTU+BcxFXSaW4H5woL5i4c7EuvZ6Cabs3hE
 +AmnrfpYbulqD5UqFEuEOgBM20wtvieOJD6JPMgqwwiYwfqv+ccSZpK+VOYg9M9n
 PpOF0SeYrINNTNMDxBfL1Gn4hydgk6nVrRE7lDo75n6iZA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mmutkw93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 18:19:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e8f9450b19so29145466d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 11:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743099543; x=1743704343;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aoTWrCFaTivid1BuHrnm332WZ/Dokh4BgKZtGbAUu1c=;
 b=NvzCfz+TuvQ1IksojG73AEjMFrlWRq1xXet4YbtZQ/MDF7kBTXmhNckPgZb73SoB2I
 pqWUCDzvTsaMsTLr+WP5byt83hPiO9hljsp5q3Pbrs34HK8VzXSnGCQuyL/t2B+swbpk
 v1jYc4NR1A3Ecjmbi5W7KvERlcqn1xrFXrXwxMBWRVm70C7oQ3Y502HKOQFQjNyd0f72
 8o87ATMe947cz5IC6y8xaKVzxjiBTfSpraI/LmLgqGQfTE6aWcV03r6U4Xq+n2hGQvyk
 vnCfO90ne9onh3Y5oE4rs+R/ntRE8AQSmLGg46ubNtHx8HRSTkBj7D9W7xDcIj5+ZDj+
 aUKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBXeshh2wZyGMoNZ/j2JQZzrdKo5/4/QnZ2AB4xtIeD83n83bVMqIK2MTSpHj4RTTAMEno98XlgKY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9/y+MMrW91i6Rf/EzFYiAKrDTsadFTJ4V+XNhsV/6wugUxYNm
 cptBNm8bpWthFDweUEZYsYKrt5NJw4Hdm8muE0F5S1p+EowKMf1Zt3i2Gx54kif22ggp+YBCv9s
 PlHCqraNp1BoNz6wnIfUOxdb40bCHrcmnUkrKHSNmQ934mNLrbsoy+2kxTTRLMhh4kt0=
X-Gm-Gg: ASbGncuXuCtkJ4Bq/bzPfLwoJrou5m+t7G/DQizBD7TsndBKvxvs4QnfasQP3KCy/BC
 6vsj0hO2DOlzDdl++fpINYAIcK+B/BVup9LRxrk1ygItZa75h/Q/78MZzJjhmFVNO83Htzdka0t
 e36L99g0PwkG7hcH2IhUIOp8Yx/m3GrYHBC4hn7+DEgrstpRpdmh4JMxTRkjdPHPdCW1Oz5aSda
 jZoC4IoEEnT79SWI+/u1d0E1IoBfOPv4ZJwvHadKRPhCdFJKihs4u6gatoB6j+glDOh5zMa6Ld3
 M4+Izs76p2FCMXGxX9ofEtzqa74dmYRP/hJUQ01zrIy0XkeNVKKlkX61sd9mhWIL19OuJ6Z9YZm
 0vh0=
X-Received: by 2002:a05:6214:acf:b0:6e4:5a38:dd0f with SMTP id
 6a1803df08f44-6eec7a1c135mr19080336d6.4.1743099543423; 
 Thu, 27 Mar 2025 11:19:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9dDznt/s+L1U6PUheExCjDdx3yIKXC/gqQ9LPSRjyQx/jUB8el6fToX37owEQAfsVb1ktvA==
X-Received: by 2002:a05:6214:acf:b0:6e4:5a38:dd0f with SMTP id
 6a1803df08f44-6eec7a1c135mr19079606d6.4.1743099542867; 
 Thu, 27 Mar 2025 11:19:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2aa891fsm329301fa.7.2025.03.27.11.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 11:19:01 -0700 (PDT)
Date: Thu, 27 Mar 2025 20:18:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 eDP panel
Message-ID: <72ku7mr3mhaeq75tbqnib5xqq3nectjf3mukznfnllbd5i5kpu@fdvvrvqj4stk>
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
 <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-1-45d5f2747398@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-1-45d5f2747398@linaro.org>
X-Proofpoint-ORIG-GUID: 5zrHJxltvWAWvVtsPW9CzjXWk8nUPpYl
X-Authority-Analysis: v=2.4 cv=MqlS63ae c=1 sm=1 tr=0 ts=67e59698 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=sU2P-X2MzWrGebKF_qIA:9
 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 5zrHJxltvWAWvVtsPW9CzjXWk8nUPpYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_03,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503270125
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

On Thu, Mar 27, 2025 at 04:56:53PM +0000, Christopher Obbard wrote:
> The eDP panel has an HPD GPIO. Describe it in the device tree
> for the generic T14s model, as the HPD GPIO property is used in
> both the OLED and LCD models which inherit this device tree.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
