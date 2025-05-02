Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70797AA7C69
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 00:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B84410E970;
	Fri,  2 May 2025 22:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLsXxWq/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D5B10E970
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 22:48:20 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KB49H002204
 for <dri-devel@lists.freedesktop.org>; Fri, 2 May 2025 22:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eleFOyC3fOtiERUR0ch/uTI7
 FND8UmJHhoCAGFzcQJU=; b=eLsXxWq/CovyGDefzgsC83Ma03HfEVHyVuNYVy6L
 yPDK82DlulowW/tsmLvam7BTRo1DdnJxxGJB91LGYdzH6/7g1dqkus/cYjeO8Z/O
 lJxBwSqnAsGHA0KpQEoFAHpkGW7sRjbV5EgdqhP+eFy/wlzm+J9w7dBRCmesjILA
 4f6kgbAs29w8V5CTubgnQjpCSe2auxetfeV37XeSVRKWbi+rAwuYWI3H5iEMabzg
 g0UH/UTARw3Mtx/cyRd9DJBeiqLQjaR1qyb9+RC9IXb9cZbQt9xEOloowIgmAnhM
 V+m8TTAdE8OM8TjgYTwo5cBBJTu2Dh1FzumCo9+mK7fxiQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubskpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 22:48:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c955be751aso436222185a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 15:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746226098; x=1746830898;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eleFOyC3fOtiERUR0ch/uTI7FND8UmJHhoCAGFzcQJU=;
 b=t1FuBBvWfWvzeBpUc1Y/D+3yzUEqeHXEGL8ahIEa9+KVJHvD/aWuzfYEW3f51HqIrp
 ftmIjb910dsU+6fIL/wgvxJnUtgWipYNkt5uePHsjR2IvVTLI0ZeJI++w6C//79wcM/R
 DQ1X1uYEDoDmRlq2NNbQ2D9Wu+tQ5Cy3xLqdyPXymoyc+UYgOI53z0dCSocFy1gzttkb
 8qDzwS+zE7RwldsEZ8Ae5zmo0YDMpMJI9yINbcKajNIwlW3RLLeSyf0kcv7XH7/34U0k
 fvdW7TBart3AfmxILx0mBhjkclAPhXkpYcdtx8RCgvYx2JHUgghtCO0Jkev4mcF//kHp
 JCIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyc2BMj4TJjfNS6gWIBwDRCZRdhMKQJA9i69VFRU1RU4PiEVLILTpXWsCCk36XK4g6zL/CRQ3/dc8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNG7RdMaHbJW/r4cFLwi3hfppCOZXWoqJSeL5cacXDn7nC9BjA
 e5lET2FnGOoJlxxXoQu/fsRi5U9vupDBcZu1YKN5B/N6obK9O5gAKrXfOa+pBmikLiRhR9r9BE3
 UpJ1zBXpOs6UJseM9GF2BL+LplwAperdH/jTPSV1w3YSuT1kp4ZVOmoH2rGz1ceUj53o=
X-Gm-Gg: ASbGncvblrYKzKdbdgkzwy/T8mCztdC0BIfv1RT4cVirm1ZUV0OiBVIy5m19x04B6N2
 wsoYC/bRsmHyy6I826nS1vGZb9SvqMa9eqOAv1FANfRjycm3TBVvopl8Pi5EETG9UZT2ILkjEyh
 hQ6ZK0QHiDVguqxTrgse1D+/Q0MZOWNhZDMdoW5rl+NRKMYdjlRqrRsBGRgHlGYB3BmKBiZV57B
 hfEn4WI6AIvGZFrFcyZswWY3Yvp8EXrHvdRIUgErJt1bHTOrgLJ6WaaYZSIXtUHpkTaWIwO6yls
 0Mq8wgfDUCai0DtQhmCckN8ZTjZdJk1nmou/b93AjloIdKCFREJcXBXDqA0nppAshvZH7SiUSr4
 =
X-Received: by 2002:a05:620a:2903:b0:7c9:443e:7026 with SMTP id
 af79cd13be357-7cad5b2093dmr658530885a.8.1746226098379; 
 Fri, 02 May 2025 15:48:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxvVUCE28kLO4ASUoCbxheAfyetz9Jt5+OUgHDim+9B4loVIqn+DtUk4rE7DTKtJgIyo0Arw==
X-Received: by 2002:a05:620a:2903:b0:7c9:443e:7026 with SMTP id
 af79cd13be357-7cad5b2093dmr658527185a.8.1746226098052; 
 Fri, 02 May 2025 15:48:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f69cfsm511823e87.227.2025.05.02.15.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 15:48:15 -0700 (PDT)
Date: Sat, 3 May 2025 01:48:14 +0300
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 17/24] drm/msm/dsi/phy: Fix missing initial VCO rate
Message-ID: <sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-17-8cab30c3e4df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-17-8cab30c3e4df@linaro.org>
X-Proofpoint-GUID: Ynx0MN1AWwvyiU5wVgmB9AOAno3aANBL
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=68154bb3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3iPOKqzCR-5T2sWUWG0A:9
 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NiBTYWx0ZWRfX4dkhvt65kO5K
 EL3AQqNjRtCiB9KL8zjkya4vjQZANsuM+BF7jBF7BV6hVl1DedmoOQqiERAGKfaOYy+2gQoyj/n
 l/FjLXdhWVlajcBno/cZebY8OXD0IwPUaWZao0/euSFfYt3eW+i9q4TxXBnm6BfX5ufjTGliB00
 xtc/rhi15UODAMIgush95NKC8jC8g2iwb/tXWuhwnzfa0EWpJARs7LgHi7Rtxok/pWI2T4CbNIO
 n+9d96ZVjhLarNeOHtSnV1b9aii6gf+1QyQn9s2Cy8rpBBWEVb81HuOwA0FAsgSpwSziunpp1MZ
 57wCWtAe1zIhhUJi0wOIKiFMdU1nUzDxIV4CPVSj/CFBIJQwiAa/36uJ9zKGT3wk4ePsfwG7n2j
 8W1h7viTpRKEkuZjM8O2pLwHBSfiojymPgH+lktS6m/czvp8hMkhFe7D89W3IrG5VTVmYhIF
X-Proofpoint-ORIG-GUID: Ynx0MN1AWwvyiU5wVgmB9AOAno3aANBL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=723
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020186
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

On Wed, Apr 30, 2025 at 03:00:47PM +0200, Krzysztof Kozlowski wrote:
> Driver unconditionally saves current state on first init in
> dsi_pll_7nm_init(), but does not save the VCO rate, only some of the
> divider registers.  The state is then restored during probe/enable via
> msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
> dsi_7nm_pll_restore_state().
> 
> Restoring calls dsi_pll_7nm_vco_set_rate() with
> pll_7nm->vco_current_rate=0, which basically overwrites existing rate of
> VCO and messes with clock hierarchy, by setting frequency to 0 to clock
> tree.  This makes anyway little sense - VCO rate was not saved, so
> should not be restored.
> 
> If PLL was not configured configure it to minimum rate to avoid glitches
> and configuring entire in clock hierarchy to 0 Hz.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please implement similar change into the 10nm driver.

An alternative approach might be to do something like (14nm):

        cached_state->vco_rate = clk_hw_get_rate(phy->vco_hw);


-- 
With best wishes
Dmitry
