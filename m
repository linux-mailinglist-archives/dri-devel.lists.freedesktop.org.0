Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D738DA75C3C
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 23:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C3710E035;
	Sun, 30 Mar 2025 21:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LAxadOv/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2511E10E035
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 21:04:31 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UJPW1T031659
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 21:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3X6Nn/r33CGbszSe9hk9BLTV
 HHvnvfD6wtlycd8PuBg=; b=LAxadOv/QHvLzwTQTwB3SYZYC72e1jYrqWv/qDpd
 3mixVkWbNjF7qyV2alXTrJfQKGRfn1NiPni5dioCJY9VDEbpWIM1CyK7Oy4xd/VF
 rvdA6567kyK2G+Chew3tH/QpCQuNoKeQKgtWP8FlaMqdwGSGA2Qp5B0VfKTSzWEo
 3Xugxb0frz1mMyHeNZvrChpulHPC0tP16pm0hUgzbEtXPQrBaz6PyCo0hUBsOv7Z
 sJecBIu6El9/mQSQg5taaCPquKPGB32Tfaw/ebxGQwwl6mRaCcKZKRoXuRcWp8De
 umML/35bYneJ84VjyURMEbcoiOElCB/mlBcXnF1Q+zPX9w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1ntptv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 21:04:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c572339444so599067785a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 14:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743368664; x=1743973464;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3X6Nn/r33CGbszSe9hk9BLTVHHvnvfD6wtlycd8PuBg=;
 b=r8e7S1YZ3yA5ID5thjYNvIphoTvluVzHOjrG94KXlWcNz/6MA+8Y0X1vpEtliijMFh
 OzYYJuEUlmf0yrV8ApML8h0SHsWHRCjf2tHPEos98iLHXxFZ/8oLjsAvMVd748eDiDeJ
 p76dDEzOAJhA8cMvciXNTSatmPgw+PaIY5xnWJBEokWrQeF4xEbFodCJl9Yjs/nUCKju
 Zbg+eMdyrjm8UX/l4D1RbKLJFVmgrSNw4fNVgBvzGydIq94yBk/0FAjx6cV014F866Zo
 D497wF8VuI4NkqMKqwiqcKUgSC0tNd5AGS0B0coA0w5gjBxbhDebCzHjJaJLFUkOZE9l
 dygg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7xDxM38nysQwcC6fYgeschlyZNO9U2+KqYOglNZTmlzAMNqvrchdKWz89iI4cXUzYF3Q1FqE1E8g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLIwucByHsx51+DM1YM5vvkKXkcd5ZatdND7xUKtRwvzJfxVvf
 eK2nQb7cOJfM7wbaAg6YXv9GR1CPoQao0I/9JMwrAfKJv33TJ1DVqyKg4Rvzqlw1/cqZEK7CPzU
 Me5541RV8cIlOVIxPxTfky8b8gZ5iJsak7WUTf4aXafP8WR5/4+0OLthujIDBOt8VNQ0=
X-Gm-Gg: ASbGncvB5apSRT3IsZq3tHbzNV9IoFCc+QRFmm/WW133eIG+wn2m7qdctaf5sCMgR8t
 w0N5lRPi10w2669eHT2VLEY8OQQ263LqDx6VdYRD/9aEDU9uSVf3yA+zX6gF6lRYflznmkQ/AY0
 ZyZ+M1yLTj0162eGAEBVYdWAoiQDUmLYM6QVVVhs1evvBFGRBMr4iaqWtyJ3yq5MqmQXAXiFPn2
 IAki/Hdqmj+yYYNU5TCc31qXM85pmV1gmgp3GBNUgwGNmlstUm1hxviQyxr/U0hpDAdEmfrek/J
 2d+E4BKurcZjdxscplG+C48eq8mrSSlxi7VmV0XatX+3Sc3bdesAc2y3zTQIt6XMYQL9iEEsQcP
 ZOcs=
X-Received: by 2002:a05:620a:2602:b0:7c5:9788:1762 with SMTP id
 af79cd13be357-7c69087dd85mr976182585a.45.1743368664376; 
 Sun, 30 Mar 2025 14:04:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFecXN9y0zoQAa8fj/MXgg/6i+xjGFaT9P8pLvrmKMOlDv1NT79vP3JOyImWAorOmGWxcr0PQ==
X-Received: by 2002:a05:620a:2602:b0:7c5:9788:1762 with SMTP id
 af79cd13be357-7c69087dd85mr976178985a.45.1743368663997; 
 Sun, 30 Mar 2025 14:04:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2b4ccd3sm11858171fa.66.2025.03.30.14.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 14:04:21 -0700 (PDT)
Date: Mon, 31 Mar 2025 00:04:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Message-ID: <toxbemskkjxel3xp7ddkon64x4uetiqjw3bnqdxu7kuercxybh@swnbp4dpw2cf>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
X-Proofpoint-ORIG-GUID: gMWzk9nj-OeR4v9gFPsSFlRxAnI5dLy3
X-Proofpoint-GUID: gMWzk9nj-OeR4v9gFPsSFlRxAnI5dLy3
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67e9b1d9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=YrjviDGP2Rj_hCM7jl4A:9
 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300148
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

On Sun, Mar 30, 2025 at 08:31:07PM +0100, Christopher Obbard wrote:
> According to the eDP specification (VESA Embedded DisplayPort Standard
> v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> the MIN value as the effective PWM bit count.
> 
> This commit updates the logic to clamp the reported
> DP_EDP_PWMGEN_BIT_COUNT to the range defined by _CAP_MIN and _CAP_MAX.
> 
> As part of this change, the behavior is modified such that reading both
> _CAP_MIN and _CAP_MAX registers is now required to succeed, otherwise
> bl->max value could end up being not set although
> drm_edp_backlight_probe_max() returned success.
> 
> This ensures correct handling of eDP panels that report a zero PWM
> bit count but still provide valid non-zero MIN and MAX capability
> values. Without this clamping, brightness values may be interpreted
> incorrectly, leading to a dim or non-functional backlight.
> 
> For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> supports AUX backlight control and declares a valid 11-bit range.
> Clamping ensures brightness scaling works as intended on such panels.
> 
> Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
