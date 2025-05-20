Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54908ABE5F5
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 23:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BAE10E26B;
	Tue, 20 May 2025 21:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVO7/Jae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B08410E26B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 21:23:07 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGeDEE018394
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 21:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PJTTKnBKjzIZMKSIryiRh8vV
 CPHt6pjQ+IbbYXOR+bs=; b=PVO7/Jaekzn6FyDP88eo2rAwY4jev+tP0JzYkC6i
 Nm1iVFwMn+ZBhdN+Wa/sBk6UarR8VW6LRQNQRR5bvzVJFruzrSaB+1o7wHMFR2YG
 UA+bfQYSbormVehAN6UZJQ593KF3me35XXm6ARsov4IgPgzOiISUK2AGDbPswb7t
 C6Q8Ksvwz6nfZHvagM1mssjXCV/G0hy0cOoNqXq6/pSCVn2ikDPLyqzExyc3hpTw
 2SYey1mfByN1hSJIMFNmUUcXi3UWrXUT//hiUlqzhp2iHj4Y+dqV3yvQeSpk0d23
 /7KenO/Hb2X6hDNRo8fdaBSBe+uex8YeZiKHudeUIG9Q4w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9rn6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 21:23:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f8d448a7f3so47811446d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 14:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747776185; x=1748380985;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJTTKnBKjzIZMKSIryiRh8vVCPHt6pjQ+IbbYXOR+bs=;
 b=nK9Ql0vcmcXr5zRo104Epzu1us0S/ePboOcLWkk2ZDQwP2JahF2XMRmHr3zjpXVOYK
 gWreJruIdCI6/fV1QLw1O5WzH10Uoj+n4UIOpIfL4Xp4jxE0au0GY+1c9MhEdzCze34N
 TAZRV2VgVpFPbhZcpSQA+hX+XTO0oQVi1igZapPZ4hixVps0Hw+/CBOuF/RaJKOwl5Em
 bbI5q7AB8KznczTgil1XInqa2Sg9V5TSORLiKoS6CJXvMgIm//RDwu4QWnm8aNx4GnKd
 e1V7wm5wFul+x11nCdrW/T+ZtZdpW1Q/xC+QqfFtFunkBlP1yWBM43lZ7fwp+n/AKj21
 HMoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKstSrkK/b+AsweR+POi/hItyI645ZxPtu5EyMQtPoxm1WBpOpb6W6ryDIAFkOdpJQrg2VSs01WAA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWAQH7g2XVFCZP1kFpe5fLl6PdWN5LUwqSmKvcZTTyoeiFJwh2
 tcMKUrOgCfsvd2zNCVuq6et+lnwnV+2H+Lc1DWhUa/+07t51zr1tCuIrlhyRefaMRnrxMrRLeZK
 nCp7sHwkc8XKkcVkLab/M4K0ncIUcjLBYaDwjuxTbP/ii5irWqGxuG5doFnzzm2eS1Neq05w=
X-Gm-Gg: ASbGncs8e4htKr1ZYnOFNEK5QFM5PNguwIBmVZSPoo4sX0dTUYIvLM4M5fZjrFENKxd
 ySs+NDBq+oaDHWVZpPNur/cfAPOd37YUKbIsSDcUkVCRpzyI5mc98I1sSlLQJg7G226rGZq0+DW
 tFKAnq4RW+datfto3Tw++QSdlhjsPZVU/GzGlkxYaVlIwwqGsu+RxYwMSz23zV/zTKbwwQvpjs+
 x8wxM4J04if7Qw0IdMqrlxYuYfdatiHPeLAv9/erjmrDHtShkIWhRQStqWoft3XVNWJiwssPwwF
 KZh6azClv79xNOWiZtNbszUF/5uoNTqtpHn5wg9OggilPnbDVBgVOd6HXo4Kfsj5NoxVVqr3CFQ
 =
X-Received: by 2002:a05:6214:1302:b0:6f8:ac7b:c1ab with SMTP id
 6a1803df08f44-6f8b08bfa84mr302151476d6.34.1747776185563; 
 Tue, 20 May 2025 14:23:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSNH/J3cdOwkKYoEGIk9Q5AXGp27fsWVQp+pVM4ZLDvbwZD5a2qcj2J/WGs8mI5wFvjVD1oA==
X-Received: by 2002:a05:6214:1302:b0:6f8:ac7b:c1ab with SMTP id
 6a1803df08f44-6f8b08bfa84mr302150946d6.34.1747776185076; 
 Tue, 20 May 2025 14:23:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084cbbcasm25005051fa.46.2025.05.20.14.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 14:23:04 -0700 (PDT)
Date: Wed, 21 May 2025 00:23:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 15/24] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
Message-ID: <f4ciopex6fo6u77shetfa3hjb3ehvy3brkocyjcbd6xchkmgxs@v6xfxhye24hg>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-15-8cab30c3e4df@linaro.org>
 <j47udhqq3ldsza3cr6a6rd5dq7uxjgpolbmdhmpzvzt7glpuva@v5tgkydlywag>
 <b4f68273-6c3d-4ca5-8b8d-8837f3f03683@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4f68273-6c3d-4ca5-8b8d-8837f3f03683@linaro.org>
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682cf2ba cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=SyEZ2-kNlmUJddv_52kA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: L-AgAhUELrsE0ZVNdoI940OSq06JDymP
X-Proofpoint-GUID: L-AgAhUELrsE0ZVNdoI940OSq06JDymP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3MyBTYWx0ZWRfX9Mrf/Fk+9Pqq
 6to9ZSlge7nOzo/C48NuZwk6sTBjtpzPtQfcNL53rLHdbcNRKiH4jBXpS8yK4AYnItiHPW4E7lU
 GootA/V7yTBVn60Sb7l62oUHxkdC+MN6Uxbmb2AMxXbeMhGBW6/LKHc/dk850Mn8O6B+DJTo+h+
 u9wW6qoagMtM2JE81NT6K54F1NOhrFq1pcyJ2SRuIKv0Iq/szxrysAYmeIWXjlp6kT6xzow4Vej
 lqjw0Kc9O3zPmiTnteBXJSPDyW57gCMNapthB9tH9m8t4m54qEdI/WaX91KBMeG5Uv3ecaHfcKP
 srW1rTSKGkFjj1Zmvkqn6PvXGHcqZeu/OvNl+suPFpWESIsPEzoObeFDUkuuird6X6/qmkkqXSm
 iyNbGYY+LMB/WXHR0IQ35xUDbMTQf22sEh+QtTEbinXcRHoSTpz09Mos256LDknf7KmBAwpm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200173
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

On Tue, May 20, 2025 at 12:57:25PM +0200, Krzysztof Kozlowski wrote:
> On 03/05/2025 00:44, Dmitry Baryshkov wrote:
> > On Wed, Apr 30, 2025 at 03:00:45PM +0200, Krzysztof Kozlowski wrote:
> >> Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
> >> masks and shifts and make the code a bit more readable.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Changes in v5:
> >> 1. New patch
> >> ---
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             |  9 ++++++---
> >>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
> >>  2 files changed, 16 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> index ca1a120f630a3650bf6d9f9d426cccea88c22e7f..7ef0aa7ff41b7d10d2630405c3d2f541957f19ea 100644
> >> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> @@ -362,17 +362,19 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
> >>  static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
> >>  {
> >>  	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> > 
> > This (and several following functions) should be triggering a warning
> > regarding empty line after variable declaration block.
> 
> Hey Dmitry,
> 
> I am implementing all the feedback and probably rebasing but to clarify
> this part:
> 
> There is no checkpatch --strict warning here exactly for the reason I
> was saying. For readability there should be no empty line after because
> such statements are expected to be together. I don't mind of course
> adding one, so I will implement the change.

I'd prefer this:

u32 data;

data = readl();
data &= foo;;

> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
