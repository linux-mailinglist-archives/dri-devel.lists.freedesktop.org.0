Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F281B28832
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 00:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913AD10E295;
	Fri, 15 Aug 2025 22:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kW83flYO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB05910E295
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 22:11:53 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJHni032105
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 22:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/5zM8IHcV3H7gOoelJ/+z7CJ
 /41CkydC6cvDm/kl5Xg=; b=kW83flYO9wLl1Grkz7IRoSfW7jFiDVuHUaG8briE
 O79Z/pyF2XrLqjis7GA/l/wOiSas7jkcYF79tem2ZXVDi6y+D7Q+a4whV7WfvTqQ
 txVAoVEKoVgkMUBVNMbPCQ/7raC9ICkeq4nYI9Z7VO5dbv3BLvksC1ZX12y4nkZj
 3cdNswY098BE69vYOtsNgcI/7kWxoE2W3IqWBT5Xu/4gyzFL/3xs8feZ1fgfpPIa
 H1yWdFP3afcnfZtE9qQ/hSOfwAGs+eMayZw8Bd2Db8JFIwnbu6yscn2IrMfLm/py
 +heQ/omcnxSGSPJCzQn3Pb/tqEMt86aDTM4Epg/sP/P8Jw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9qa3c33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 22:11:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109acac47so64065361cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 15:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755295912; x=1755900712;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/5zM8IHcV3H7gOoelJ/+z7CJ/41CkydC6cvDm/kl5Xg=;
 b=dVzZuZC69fuzzyTtxJaiX2E8UvLoENIHFlu3SIpL76mk6yUzo7exq8I7wf9fYYCB5V
 +OP6hFjUauvq8GoVagKKDlBiGU8Gc2RtocQKhK91vtoY4D5K1RR/MBnL1PLdY/k84IRG
 39/YFkbYS+QszwNzaVB7niMp8YWo0TwHbxVZCGHbTv/rcWRReMbWtg2LVGpRu3mTKLIr
 Gmezuyt8IPJ+ohneXP9Nf8CZnkThwZk3nq1ForrhlevK6jdGVap1WoO3XWmt88kmEXtE
 xTTcDBDh+Apa2Vfw4stkmAy9GA3VMO/IZKAam/uWxodezH4mSj+lVaXFGaZMh4EQnNSy
 xXyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiRkUK8f20Dx454D1fBdVuVM/x1DwuciLR37f9zq4YmjrFTH5b9lNyK2CEM05thIMtl8o1gb7A5ZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym7LaIUTUhBz3zy7et1Q50SBrrnqJGGQYL+B4LLKCDk3k6lsNN
 +c2yu2kTZb4cSlhbcpmQqhMT5lpTZXhuAd2zLZODMsyCJoCGL8kgfw/BY1XQkagRikg9TEFCKHE
 WUARJr7d7sfg4L3RqANQamrLI/guXEm71pXhZ11rRlmTZvZc2/JeLYC96jwh31dKoRMy5x/U=
X-Gm-Gg: ASbGncvytIEph0NH9rB2Fw0dlibCXXTgS9GXjp4zRhgW8HGq+KRIo5CFfSOLNa3U17h
 psq0CEo3rzoHQxnfwDTW+jjHNPBTyls4pJt+51FlNK4efYiw06iQn0+2wi+QsQlbzBXkp+ROaRk
 jlKLmt8yhcoiaXAG+Qtqo5H4vD3C+GH7ImpStuW7V/bGdAvM4gN3d6j/+NgmA8GP8cD4tY2dS92
 4Zm9Vi/KPb0FbvUuQDhSp4vT5Ys9cokXJodkm+VjjRFAIvjjactSLelijNQvyZifxKW+rBStoNB
 M4yw8J74+WYOABuny1U8WLvujEcTnzlzXUdxLQVvi5jM2IbLsrEDagLHTp85ie0A2DMyCBjbCv/
 BWmxo1/jWUNvJxUzaIYHa5cAr6LZIgXfLNG6m09j6CMyNAhJFeAMi
X-Received: by 2002:ac8:594d:0:b0:4b0:7989:13db with SMTP id
 d75a77b69052e-4b11e2ca210mr52381771cf.58.1755295911621; 
 Fri, 15 Aug 2025 15:11:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrQWvY1JLzgvTKFhi3lkvOceh7xXj0igfHgQCFQG8XwNnsUGy125Fd59SjzF+Z00CJp0H2qw==
X-Received: by 2002:ac8:594d:0:b0:4b0:7989:13db with SMTP id
 d75a77b69052e-4b11e2ca210mr52381311cf.58.1755295911092; 
 Fri, 15 Aug 2025 15:11:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3cc6a3sm519733e87.102.2025.08.15.15.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 15:11:50 -0700 (PDT)
Date: Sat, 16 Aug 2025 01:11:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 johan@kernel.org, linux-arm-msm@vger.kernel.org,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH v7] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Message-ID: <b3h3anmvna2p37gkio7xh7dgl4h7cz7weimu33mwhfk5rtytb2@wvhoskaiwhm4>
References: <20250814-topic-x1e80100-t14s-oled-dp-brightness-v7-1-b3d7b4dfe8c5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-topic-x1e80100-t14s-oled-dp-brightness-v7-1-b3d7b4dfe8c5@linaro.org>
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689fb0a9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=YrjviDGP2Rj_hCM7jl4A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Ohq8sEhu6_CDJoYmPrVEeOIagciO3DSZ
X-Proofpoint-ORIG-GUID: Ohq8sEhu6_CDJoYmPrVEeOIagciO3DSZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX7v4yqu0YkDpQ
 ssYSfDXqNGixsrHjhezeQh9kNh1HYBcUdRJO01aLFRdQSdPvglpKR29aMV6FuZwonj5D/Dwz/Xq
 kqlj9TxsVM7G1Cy9Lf+v8YiqWt3ZjWzusZl+WXLguJVtpFmXy/jZrMmP+AGw52sXmWMX+/dVfcR
 Al/QUCu1b08b72CzlSe89Z3Oc0LbgP6m0xHyRCYsqvEV9wf8ZSHa37/et3MzmfleFQhFmR41Im4
 zvoUar+qgsqkTPgZ4NKfWXK1aIJXNW915s0kqkQQTYOltkfL3Z098VwVLpmJ9D3yonaDxw63WMX
 CR9N1XYdhKJEI1DdE+DVl1Z+tB/9ycuqzPt8L0giLybYt4GfnGuA6346psf6kItL58xi7idExL8
 odZJl0E0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_08,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164
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

On Thu, Aug 14, 2025 at 04:16:09PM +0200, Neil Armstrong wrote:
> From: Christopher Obbard <christopher.obbard@linaro.org>
> 
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
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v7:
> - Take in account invalid bit_count
> - Write bit_count back if clamped within BIT_COUNT_CAP_MIN & BIT_COUNT_CAP_MAX 
> - Link to v6: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org 
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
