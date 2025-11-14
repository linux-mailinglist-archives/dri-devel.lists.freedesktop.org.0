Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38899C5D925
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D0310EA93;
	Fri, 14 Nov 2025 14:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxOhnBg3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZcZdOY3Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23D110EA8B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEDuDmP4123953
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kVORcd5BmpvweB/Iw+GyMgCzu0ji3UnuYmatjp2GayQ=; b=kxOhnBg3XvmjeOzE
 B3mQ2nJExBuvH/Y1wuO9u5ude7VfF2xLSaJ9whpA6bv7gEj7rk5fy9tgvj+f75P8
 eyXZWQVYCkUF/0hIS6mz00UhIss8JQs8vB1FwQ3d6wQtZupaKaoj2YIXRlcofmGg
 fXm5lmR889etm2n1YxjnynBgJiIIKalU1+1DHaDNmfG2nSlLiyy9z04LlqQfXXz4
 rpUCatgUdcBsET0IMdquPxZc7jRQjOlwtUKn6LQQioXlujibC5+YZ9ZPgKvbcPaU
 NFHaqWFSAbDaiPuUANHlJDruvGyumFQaVp0ZTSa9vdVrzf9A+sx9tz2WjgSWx8GG
 xgfJ0Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae5r7r2xa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed6855557aso84295851cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130407; x=1763735207;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kVORcd5BmpvweB/Iw+GyMgCzu0ji3UnuYmatjp2GayQ=;
 b=ZcZdOY3ZTkOJy2kX+qBTW+bwKf/IrUNrx+xrQEZA2cpkcl/vlR1FMcwdXBiWjod6QX
 BqGw9Nsc1MnbUJ7NjgWfdy5PVA0xtmOm4Z/awGQ/N7c+KZxv1nrG7dAwpThUUEw7lITO
 wQX9b1Ox8R8KO1CWd2GqDEqVnxpWZu1FIQiTbWFt5BwumaowRQ8FJ69XsDkjcdUaheVc
 ht4RLFQN/1GhelJT2zdF3FXQHoTt3j/Fi1PXqYBFqV537BGg2rxhniXVmeMJ2a12PwpS
 9dL9yBG+PFVgcRTZ0p97dkuhwpd8zWPLfTkcMxeUo/aFq8Iwa1Alpd5h5U1yxZ+E/DX4
 p/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130407; x=1763735207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kVORcd5BmpvweB/Iw+GyMgCzu0ji3UnuYmatjp2GayQ=;
 b=wYZhRpFCAd0dhg9bQ6uNYniwxdLAXn1VaL22HoW+JGA+tTiPdPmmb0wYLR5HgoZl5a
 HG0N5VGh8tvbZVFCPf6eIzBWSX1+ZcVXzvE1zbZvNwUASskrwIhh4Np9CWg293Dgm+jW
 j52HKSgZxYvqyR5eENTzX0QVJCwrs4IF0nOIFzJrUJpxrdB1Qx80aSusjEjfcHR0Y29b
 6ruVINJ6mpRnclrLEhlh+sGporDz1tC32qYZInugKgchGz31B2BmhwLRl6BKQcMc065R
 8KjcfRFs6dTv/Fbp1FCWqDR6fNly363QbIYh38BOq2Mvf6DKt5cLT+2SeSJjPBS4yBny
 gv5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeIJglyKwxaMERPiz4IZVWn3Zy/2Vdck2yXPuiIlXL2QX2PRiVcadqEJfpaBPBV+e5WfYOCkqXTEc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1aGpv1ngCJ36SteoyWWHOvHFMHEQwZSGT/oltjq1oom9AZLF1
 mpDrxBIAamE2lyvFuB6MT0K8tqsg9JWt1Ko6N+2fQ9k8+I3gJkJgKwFrGYkWh/2HCZDyGchNj4S
 FvqlH8WZ+dN4ZUgHrf8POot5QiZTRkq1sYRDTBOgGvfQiq2Q8sMg3NzvGefeAKQM4bxvLiXk=
X-Gm-Gg: ASbGncvkaB9EgQZVB5/1MnuDqWiYoHeTN6iauot0bCo2zWGd5gHyNHg1gXlPDWDand+
 6YAQWbmqsAbksk8Gu6cUYBVVb1Y4qbeNJUyoOGV9M57fL26aylF7fxYvFXfEi27EUwJwnCUHHyB
 Sh5v8D0qqntJEK1cwFzdnqtNFSatCsd/oRJO+yGN7tJ3lCPlZoF19JXEyzShL11tPPUvYfB1+dH
 OJRZP1GMjnAC7M0BKYC/+R5dzV952l1h87yQbEDaLuuW3+RJW2nZElYcBVnduXqVhDQn02V0/23
 b0wv/ktai3cIHGFyrOkQCtbL25uL7Fbr3ZNH1USTIWnszu6XImt/RUJVE+HOqbl/y85t1TZ08GG
 wUi4WardbsxTwEfadh5+jtoZdV43jXQQEbRU+Bpj7a/ZdoUWC87iJN6fL8n6+Sgb+ZkZLrMkjN4
 O5yano4cBaP7LY
X-Received: by 2002:ac8:7f84:0:b0:4e8:916f:9716 with SMTP id
 d75a77b69052e-4ede70ace82mr110839661cf.36.1763130406920; 
 Fri, 14 Nov 2025 06:26:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmQo+aCQCjvCk5e76s4w1boHfDoEoeJkhdDuyaoO1EvXqxjOf/iL1LbyOWdf2SGW30aTGtBw==
X-Received: by 2002:ac8:7f84:0:b0:4e8:916f:9716 with SMTP id
 d75a77b69052e-4ede70ace82mr110838941cf.36.1763130406353; 
 Fri, 14 Nov 2025 06:26:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/4] Add DisplayPort support to QCS615 devicetree
Date: Fri, 14 Nov 2025 16:26:36 +0200
Message-ID: <176312947282.1737000.8802274913506269356.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
References: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX2rj8IvBaCVQH
 zvIUpDv5UDsy3qm/OdYiJta0GbdUeeTyZsmv/O/0mf7ZR84xmGhPNonlzRB0Dcc5a39UF3rSAoX
 5VOKkig75NezAUuDF0ebmzJXdld927tsUPHXAjAKxb8mVsPvfYAj99rVmwjGFn4tL/hbK/oMsME
 t4poY0IdciIrKeKxe5w4pXTuRiDcb142elY38DhBPRpeR9dGTa4vj5pXrX1XXmH+vbG3IVMGaCa
 x8jORwaQmiXumWDTKaTDcWHLDaQ6hgDpEd+mfyYlqe0ttirJ62Wn8YH+x0wKJvl6jZqb2EyY2GR
 l7b1O8VpjfKhidiw70lnZvyjBNxtNDpPo/RDwRHYtSqdQLi8NoVCXZ+d+8dpqq+tKpS8djM45fy
 yvrdg0WnKGmD2MIkOuCeBa7PrGCKJw==
X-Proofpoint-ORIG-GUID: pTGF4lve3sG-TSxxIR97G6Q-pofCbtdv
X-Authority-Analysis: v=2.4 cv=BJO+bVQG c=1 sm=1 tr=0 ts=69173c27 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=CQcgnb-tr3BYDHGJJJgA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: pTGF4lve3sG-TSxxIR97G6Q-pofCbtdv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140116
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

On Tue, 04 Nov 2025 09:33:22 +0800, Xiangxu Yin wrote:
> This series enables DisplayPort functionality on QCS615 platforms.
> It introduces the required bindings, updates SM6150 dtsi for DP controller
> and QMP USB3-DP PHY, and enables DP on the QCS615 Ride board with
> connector and link configuration.
> 
> Depends-on:
> https://lore.kernel.org/all/20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com/
> https://lore.kernel.org/all/20250926-add-displayport-support-for-qcs615-platform-v7-1-dc5edaac6c2b@oss.qualcomm.com/
> 
> [...]

Applied to msm-next, thanks!

[1/4] dt-bindings: display: msm: sm6150-mdss: Add DisplayPort controller
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a2e6c262a5d3
[2/4] dt-bindings: display: msm: sm6150-mdss: Fix example indentation and OPP values
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5fb24290cb5b

Best regards,
-- 
With best wishes
Dmitry


