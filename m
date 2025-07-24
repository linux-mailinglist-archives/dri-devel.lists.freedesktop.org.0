Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40B1B109A9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 13:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462F010E1F8;
	Thu, 24 Jul 2025 11:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtWQumYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C571510E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 11:55:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9u5U0013721
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 11:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mINbh0hT0mOMLjUaQwlGXcWW
 ToNWDwkhWfpfbCEFXxs=; b=JtWQumYZJkZLJV4AipaSDwxut0syaib3lRas6zal
 9hzcGjFLqShot4RHdNHklOX5WV+cPhH47AAe8yqT0jX2d8dZgOUbuVwDQN3OKcIo
 pBJnKVL2u527aYZm/oNeiLL+semul1dK55OAdm1vjxvEljN2GLcEAIlh/uo/IQnN
 M/daUF+SHZ/V3H5qR5zNd3iJ5CTzl317BIg/R3VLv9vHtebx4LuqPL39ye3qbMjo
 dn/BtO5izWiF09IRSUhHoca91PjSQQn6OGqTH3NALZKHEmPZ7bsVy3zkYTl7E/Si
 5rnvn6vHyUC/lAVtRld3HfnxzmR/Bbwj4BInBbpO5p/ZKQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hxkvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 11:55:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fabd295d12so19601646d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 04:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753358127; x=1753962927;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mINbh0hT0mOMLjUaQwlGXcWWToNWDwkhWfpfbCEFXxs=;
 b=e6oGa/nhyfd6wcFRieKA66cZ6k9Nl7E0MDhm1j9XniXwDTbwzEwgfotvFidiiGazbF
 PdWwI7r0jie2dGdT4x6iJC/f0h0buzj9GHJpo3d86YwtMPcGCIJSDpZDsxDwbD80J7wN
 u7nC9FsHwKI07QcHHVvMa16a23EvKVPUFX5KE/C40+wgp7Sx2BgqwDREA2RQx03pIy+b
 tpe4fu9UsLJMbjy0oJV5wxM0chqHUEiw0Z2/5CmGY3JESZ2fiXBQp2U8EBI3Vp3o+gg5
 HEPMetgdelqn+hEYlr8fWCusaNNhEHSjLczqNXxHTlTE0Szrkj5v4Tg02cXCO/TiR952
 C/zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW0WnNIXKoyNv1dbrqZScSnu3IrsepmVt3HSBjyiiwgem6n8V9V76/5KSbb7V8HySNuk1qjv+jE2k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygaZ9FDm6sEEaf10nMaTg3v27G76XfwqgcYPnArs0ShgyvctXL
 9txaF4lCjZWoQbS2zasngSEy7re6kjJbw/yfy4y3hyviSB6xneKcm7urLf+bF9gqvFRquPxLgEB
 pOaRoAbpijehBoMZj8AAe6C56HElnIbgwhXUCB/PPRf9riOXxZAH0dov/6v8l6G/3ahW3LOs=
X-Gm-Gg: ASbGncuZ0kkt0KW38KYRVD37JkKRf7P9cQe/mAwdb9V8wGJ5NrWc6UuFe7iQ5jyUdZo
 UsUKn48XpInPV3IKjR97PIpiInS9jtm2opgvy/xjjLpSeybO58dQeTFr6zIYWOf2DGWCIpx0LB0
 Y8VtyZItB0xDIunHMfjD6th5N+iskyYA5vEKkJe3iRzqQoD5OQXAKJtqexU4FGpPr30DxbLZFIb
 SyGz6b2xR1LNNZoNMlwWJHMTpyfleyYPrSDbfSshdaMnchqrq4ANDh7U1RwnFfA3zT8yMHBiRu7
 PTQjOkK1R7+w5Arwj3m9HQd4FVSTJ5wDXUN8C2V2izkjz0apgXUyKcfgTeQ+UhEew1VW6pS+fBO
 i/hhbcD5i0MQ8EVBs73g/7zhMVK6INHFEqCegPB8pdwht0At8IlFN
X-Received: by 2002:ad4:5aae:0:b0:704:f3ef:cbc2 with SMTP id
 6a1803df08f44-707006800c0mr78839496d6.33.1753358126504; 
 Thu, 24 Jul 2025 04:55:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd1t3+gJxk8pnw1F60NxFlYtusGeWg+p73JrUwlRncJWEKckPZk4d7/2qrIO4VrYiW8onn3Q==
X-Received: by 2002:ad4:5aae:0:b0:704:f3ef:cbc2 with SMTP id
 6a1803df08f44-707006800c0mr78839116d6.33.1753358125983; 
 Thu, 24 Jul 2025 04:55:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b53b2286asm327797e87.32.2025.07.24.04.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 04:55:25 -0700 (PDT)
Date: Thu, 24 Jul 2025 14:55:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Danila Tikhonov <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: display/msm: add stream pixel clock
 bindings for MST
Message-ID: <5nqzjnrivsuuttslzfecdwzigkqhdipy2wbjmgaa5mijr3w5hl@rbz47vnykzzn>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-4-72ce08285703@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-dp_mst_bindings-v3-4-72ce08285703@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=68821f2f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TLo0AdDBy_HI3n6x0gMA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4OSBTYWx0ZWRfXxYtUcbXE6uKM
 iXPANsHW0vEqO2r4Ppoi9qHIlbQQQC+warDmvhOx3kbOVYksHDL/+8hSXOzdxSBle9ELPlFcKUQ
 lMiW8pUFXjGnWWqf03A1a9Rt2IVL93931dLFJ5J7VH2f2emU5liRsos52kZYMKGR5xnIVQd6HUg
 ZKdw1PULR5RlQ54vdaMGmUOGyY64ono5kiPryuUN3pZ3YqQlPO281ZoHv+NpDaQ7LmFZ3AAJPik
 55p98tzl5viZszhcO+DlVjgm/ZenpopCkx7Tywqf+qTO2toTHTRLgguhojfDZ5TQft+a0nsBpKh
 xEq7lqAdyQnibyl/j8Z8b8Q+smqeqnwPJ2wk5zbtZbHtcA1oErGT0pTiWUuqJ8YjmCDnTNbCNxh
 f4Yo0e8odjF6/9Z70P6ZFtNy1KcfRPuEgCkcEbOEvSkVaDDsAohdJnT/77fG7JyNxmPKgnxT
X-Proofpoint-GUID: vGZqnt6aO5zmUU4uYb_v56DBzFvHsH6d
X-Proofpoint-ORIG-GUID: vGZqnt6aO5zmUU4uYb_v56DBzFvHsH6d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=883 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240089
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

On Thu, Jul 17, 2025 at 04:28:46PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On some chipsets such as qcom,sa8775p-dp, qcom,sm8650-dp and some more,
> the display port controller can support more than one pixel stream
> (multi-stream transport).
> 
> These chipsets can support up to 4 stream pixel clocks for display port
> controller. To support MST on these platforms, add the appropriate
> stream pixel clock bindings
> 
> Since this mode is not supported on all chipsets, add exception
> rules and min/max items to clearly mark which chipsets support
> only SST mode (single stream) and which ones support MST.
> 
> Note: On chipsets that do support MST, the number of streams supported
> can vary between controllers. For example, SA8775P supports 4 MST
> streams on mdss_dp0 but only 2 streams on mdss_dp1.
> 
> In addition, many chipsets depend on the "sm8350-dp" compatibility
> string but not all (ex. SM6350) support MST. Because of these reasons,
> the min/maxItem for MST-supported platforms is a range of 5-8.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 36 +++++++++++++++++++++-
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 10 ++++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  6 ++--
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  6 ++--
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  6 ++--
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  6 ++--
>  6 files changed, 59 insertions(+), 11 deletions(-)

I've cross-checked. We need to stop declaring SM6350 as compatible with
SM8350, it doesn't provide MST support (and so there will be a need for
a driver update too). Other than that, please document DP MST on SDM845.
With those changes in place, I think, all platforms will be covered.

-- 
With best wishes
Dmitry
