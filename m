Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FF7A79599
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 21:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EB110E062;
	Wed,  2 Apr 2025 19:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBDTP1UP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31ED210E062
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 19:05:52 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532EawI1026076
 for <dri-devel@lists.freedesktop.org>; Wed, 2 Apr 2025 19:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aNv+Exi/x+6zLqx3K598mkaN
 UBCpfHCqFlxecl+OZYQ=; b=aBDTP1UPhADmOUbn7XNTxM1ATs/b3BpxbguCZ0mG
 BTl7b614oFagq5xG2wiO8KkGXLRP+mmQ88ymN1Ubwzr4Z1UG9/j778JSNhl8doWz
 wvFcJNxxZYg6HcH0mdp7xPv9QucGji32dIlKV8/YRok2nLaTzF7/SdF3rujmTku6
 Oxg1BS31rIsIzMjlH0os1UWySW46TpOQgy41mGK73fp9ZVIDfDq+ma7s+WP0sZfm
 7zt55jBgd9hKo0yFItk42jSIZtMV8z7pF4EmJPDDn96WpbgmqJlBzDt6eQh5rJUL
 GXpvazGdqrkkaXoKIzMg58aIwfI/juc65r2MdFTHPjlvJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ryhft6a0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 19:05:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5e2a31f75so25609985a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 12:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743620750; x=1744225550;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aNv+Exi/x+6zLqx3K598mkaNUBCpfHCqFlxecl+OZYQ=;
 b=KtR9m9JR2LbWTAw0eQRSp2qDUte4DzvBkaMHUjZEEwrSeP5RWwjIAhxdv/uYyDgQNC
 uxd2StjqOC/PXuZXUGzLpOJMxP1ct9j28TIRF9Vw1aYorsPFcDNRGw8hQIrBcOyGaWIA
 4apgq3NRQFyjMePUW+k5O3t1AhnIZL9k2GgzN0yFtrw//sDai8M/yZ4Leus5D/2jFMbF
 7OblDW3Co58NM43yoKxltNfF85WoXjI00jao8nvk3jA1MyIXh7pJ0srdQDF1uzh199zz
 qv2fJxCKUdCfQA8JzvHCou4EU4qw763Bh/sESXQ+qCWhLm+Zg5ZQO3QC9BwgcII/gazJ
 cEag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLBQVHfvjPBYAwDX7gUG7X0pBtIWBjKKmb65mXD8O3KZV4n3yQIXxmui6SnvgIBJYybDpB5ZAF3Hk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhSJ9GupQ0VLT61fTvOrb8tQEQoUWfRoIgQNkQWDWsQbuR92Q+
 hugT5a1c/bliqse0JCJyhVPd2DXBEF7/hRsnAucX4OGWpGA2r/1aWeWvF9uAvB6uARXuAjbx1iJ
 eNo/zlC9sc1FqcKI7QnQnm731cL4ks6fYpXHVy4B/ezfTyo6WPiGkhfWMEY/3KB+99hg=
X-Gm-Gg: ASbGncse244jsCPPmZAw7RK+ampCt+sf/IzglpeJW1T8MshkjQM8e92KNYY4BIHPA/M
 RMtKP8qA4ugtnkVfUHjlHvBw7S4WwHlvhECXBJ42Ij8CFUlMylYc+1UBYmjoJ5TUw+kfAIiJ8f7
 OxuQnRdnUkQ2vWiDV9WqydqyDNDfKwCh7x77cGCFFOP1KPuoMnmMJ40pNpfBGVvey9nzOWsCEsG
 YXq5wwtQzCGF0ikUXe4YGFCxWSEu4wivPgBHFP/+jthtTxNsAPsdwLjrPq4N7W3EKz+1knlLEPA
 iiunAMNYnq7TKZB8+7ZJ/YSnucimOJbDbprTAT5oGrvVc7sORkW/RJJ59GOnuE89JSHaqdxQnmW
 FvQo=
X-Received: by 2002:a05:620a:29c7:b0:7c5:4c6d:7fa5 with SMTP id
 af79cd13be357-7c690896fddmr2672062785a.48.1743620750141; 
 Wed, 02 Apr 2025 12:05:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8J7P7HnsNUJiKk+d80XC3m2q80+v0m+GfXwPH2siZjMmkZCvyDbrkLkhIfmK680GiWDm+lQ==
X-Received: by 2002:a05:620a:29c7:b0:7c5:4c6d:7fa5 with SMTP id
 af79cd13be357-7c690896fddmr2672058285a.48.1743620749776; 
 Wed, 02 Apr 2025 12:05:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b0959fd16sm1753250e87.215.2025.04.02.12.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 12:05:48 -0700 (PDT)
Date: Wed, 2 Apr 2025 22:05:45 +0300
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
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: x1e80100: add epd hpd pinctrl
Message-ID: <pqmol3quk562bjwnwyvtlzgukabl5rc7uzmco3b2ossrcn6jsb@kypjeag3zrh3>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-1-ff33f4d0020f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-1-ff33f4d0020f@linaro.org>
X-Proofpoint-GUID: F7BMPA9ZFVAYNTeheBN-23w3sn_ISoue
X-Authority-Analysis: v=2.4 cv=RrfFLDmK c=1 sm=1 tr=0 ts=67ed8a8e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=D80HWN4mW-IyzX5GbT4A:9
 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: F7BMPA9ZFVAYNTeheBN-23w3sn_ISoue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_09,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 mlxlogscore=735 clxscore=1015
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020122
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

On Wed, Apr 02, 2025 at 03:36:32PM +0100, Christopher Obbard wrote:
> Add edp_hpd_active pinctrl to the X1E80100 device tree.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
