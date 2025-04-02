Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EDDA795A5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 21:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4E510E8C1;
	Wed,  2 Apr 2025 19:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjwq2uGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAC010E8C1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 19:10:23 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532A5VF2027388
 for <dri-devel@lists.freedesktop.org>; Wed, 2 Apr 2025 19:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zmUYkVYqvGzbPDQXyu/mUYb4
 7LYlnrBBpOgNv+07v8s=; b=jjwq2uGFX3im1U8tRkkH0D97x1TydXUWEqQVwtV1
 gsnsIRkjMTvH5GSU/zjcOSj8lJnANasDKqM39G0Fk5O6q9ZHecUvrxmIucamsGAd
 VQ16CGgzkPhQqQiFwLgoz0Kn7y/yFuxsfjtH9bn8v/k7RwWYjhcbDXxwD/U/evWg
 gnXUIiVd1RRBKFvJ6DXy0v9LXW1QqMgG2C8LkEgkXzBI4ht/RJqUxAfgoOPxAqxF
 yCCHbSFKQwVxDr4TFfpu4wOpx3WdALaqob9X1wEHaWOlTxLM+TqBRu+I6GQTzJWR
 MtaZwnzWgnGhc82YXAO/IySu3uZwCdpDYzy7saATvcB/fw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45s36a1et4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 19:10:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so21173485a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 12:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743621021; x=1744225821;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zmUYkVYqvGzbPDQXyu/mUYb47LYlnrBBpOgNv+07v8s=;
 b=ckP4Pg5inHxdNgsPV4JDX600CEqiCCXDOecmoiDCI+Rw2T3XjqVyO1M0GQH3sRPQaN
 Tt/SJAJ2jP09xrtvQxsDsT5XFekvMPvDKNxwi4em+QJANffY8oX4E7OPHA7dQuCMCPVe
 ozQcfX2hO/SdkTWuEK/xOv/xR3kODUDqlP7gkhxp+7ALeyscEVkz2zULNrjlXzrqGIjX
 g38wrbcATAySiax60qawyvdYq5Tjq7Z7FELFnG5svS7GmSrBdRSAawgVQtq2kg9RsIBI
 PMe5B5i0TWnmX50WBIfQ7cWdFYGoCP8fenh+hfsxHkCj1+kXJNHGne2TDKCq2N7c1e7/
 4sUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMNRstyLO0ihziP/Su5sL/8e2VMDy/sKmuS/BarvLRvxaRzWUtzp1EGnp+K/uqOfe7Jgt0ViqlPic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwN4R+2cevlsC2tOZKaUa5WGlnVvrNcNlyii6nXKm7pZ4mEkzm1
 64y+5YWrvMwfXgeB/3o92fflNtF54BTvNDP/7VAQTI4kfClLA1gRSAUYzCoaQflvyarlEoKJHyp
 aVkMUSL4/GZmiiZuBNoaD//GbKDhBML0D8teEvaBlxBvRDKizR9c7cAsARCHJPPhBiPQ=
X-Gm-Gg: ASbGncsZ7oDip5d0k3nKL821zJNGZs6I6o94ir1mSsM1k908OLgS/3u35Pw0u3KzZnJ
 YkIx8YnTkf5RU3Hta/o1IsBvDj1rHs7sNHuDisDziIOkgspLunj+IptghC3SUX7XnxZoAwwS+Ac
 VPj6IbO/66sUG+qA4E0DknUjUL3AXjLRkZTNwULZRB4qk1571ZUXy+2OasSEeIRARiOXhKo6oRe
 db9PTugdpCqJTWKkCY/8yalxQlIAE5U+D9008S/1AFzH3ZYr+zfBB6clbbecZiwoWDSIaqlHac8
 e1yUuTLEOvrOzaZrV5PFObkSjX7UWTgKV+aPuOGiOBuuLY0dndSSDDEsEPd77dpyRa36/Vcmxkt
 Iubo=
X-Received: by 2002:a05:620a:2685:b0:7c5:3b9d:61fa with SMTP id
 af79cd13be357-7c69072a6ffmr2450036085a.26.1743621021603; 
 Wed, 02 Apr 2025 12:10:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL12WrxSm3dTTl0ltF+TFscnVQIRQop3TdWFVMRKTPWUPSA00Q+ercIZwKI0JKi3FN2ZJRbA==
X-Received: by 2002:a05:620a:2685:b0:7c5:3b9d:61fa with SMTP id
 af79cd13be357-7c69072a6ffmr2450032285a.26.1743621021206; 
 Wed, 02 Apr 2025 12:10:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b09591191sm1712994e87.193.2025.04.02.12.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 12:10:20 -0700 (PDT)
Date: Wed, 2 Apr 2025 22:10:18 +0300
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
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
Message-ID: <a4wlwnhgxxzgarkbwtpwqsh42ksmp63xgqwewgatg43esc37zq@wc4bbkjvlpjn>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-3-ff33f4d0020f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-3-ff33f4d0020f@linaro.org>
X-Authority-Analysis: v=2.4 cv=W6M4VQWk c=1 sm=1 tr=0 ts=67ed8b9e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=bmQPT5UhyNeoAJmEc28A:9
 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HlVy0p-gIIypqdZ0ozF7CDjeuuETLqo2
X-Proofpoint-GUID: HlVy0p-gIIypqdZ0ozF7CDjeuuETLqo2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_09,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=809 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

On Wed, Apr 02, 2025 at 03:36:34PM +0100, Christopher Obbard wrote:
> Add the Samsung ATNA40YK20 eDP panel to the device tree for the
> Snapdragon T14s OLED model.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
