Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42629BAE8B9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 22:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A67810E635;
	Tue, 30 Sep 2025 20:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDOAPyJy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A90D10E2D5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:30:47 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UJ5OHQ010706
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A5MAdGf8N2IXmeD2HSikyGHXMxYdUuVy92vP7GjOTJs=; b=nDOAPyJyz8QfENmG
 6Ya4yWlFzuV+sHmRuXqcoE7XKaVP+2TOCcm3hCC6yVdRDCRwwd/gcwLbUtRAICTA
 6KnVbA6BiDCw2c5AmFQYaHMsZ1VSoDZQnoRR+Ztli0XxOwVpYsv088FtniMUH6Su
 KltjZSLfVpglv0q2ketBHbfrP0FjUB5X7/k1UA/abIyTr+On9m6rUffOKfmxwLSv
 u19+hBete2uQMeDyBG4NOSCclgSUL2HyeDhEfj7ek3VQY4v0fs8ugXSkTsxTTyNo
 Y9Pma35x/+Lve0NBPidw7BSgHx29WF5bYEL2e9bDGN5ASx/i7T2AojlgR3G6/mBO
 u3QzxA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mctqra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:30:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e1015c48c8so5253311cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 13:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759264245; x=1759869045;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A5MAdGf8N2IXmeD2HSikyGHXMxYdUuVy92vP7GjOTJs=;
 b=PD4w/yQumKwW/PJnRscCJ9NZgY6vQduOAq/KSsysVZyzxpbJF4bZsvx0Ini1wuuN64
 LJNRdGZqZVaGvvbS4pzbW2xBRUqaFgUrd+yq1EGd1qG4f98CgcMzspX5MDMG2+J3N1TI
 /QgphCWWK3geFJvavL8eo9tQ63k2u6JqW1re9Y8myUvuASoa3MjQXA4Ykodq+LvojaH7
 NZMl6Bxu2K1R3iRQd/xtuqAFpqfbP7OgeQIDBQRyM2jCO1PvPZx08rQNIJwVIDPEVc2A
 LGEjGg/hV1leNS54llE1CCzX81TKl+NH0XM+Xwp0hmdKtgeAnCeHBrpAUCUsBhhZdOHV
 Afjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqRdeoGRzLN3D3EOhhgbx2RlhMrhtdII+c0TWvyAA6tkh4TGKgLOlTh2JT84YO1D6tttbx59DDdNs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZzXk3uedhchIakQ2mSO6vxf2OmF+/SrJxMeP9G8LY6oFhMCsG
 C/gqEpgMkt20HxVbGpFYdonSyf2WPrkqLGjBThZi67pr4MmuoODWwNyJeAmSqCNdDipgNYG6mw6
 l5DBDqsmSkKMYlPGqtE/QwvGT/1iAH06Z7oJId28lS0Lv/vWNJn+pOBcoAMoPwMvDOqoLXVM=
X-Gm-Gg: ASbGncuT3LgqwnoylxXFCXdyhKj7pouPvrmmNqazuJIdf/2Nk3mtrhslLTEyI73a3mK
 PbTBAwm8ErsWfy2E7RZDeyB78mEFfpgoRJg6SbVwQlQyUEpUsxelvfAwpSYH2mCyUSmvlYRMxYh
 vutFVLji0JC2pi20rcI5PVOCOrk5eW9V+d89HzD9n/x5uP2pMvqVvWsbV6/DXF62sSbIkKtgCbw
 nGTF9WU6FwYVQqaGj1IEZIS7am5WBAYbZxexEoTF2A3/cOtvVzYkQhTfLT/Q7k6YyEZ6fmcBT9K
 xH7xTzem8GGkd/8ff5Nvh8UOnos2SDl8ltbPLGhM8JppltiR3vNKE9t8Ooq7FIChCG+Vn4d9W16
 AeGgBA6Pnk7ggP8/RpH1QAugRi+RJmzQf5slrdHvqWej5U6hnSuNjmKIndw==
X-Received: by 2002:a05:622a:1794:b0:4b2:d40b:997 with SMTP id
 d75a77b69052e-4e27dcb4b08mr75990871cf.11.1759264245462; 
 Tue, 30 Sep 2025 13:30:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGORQhiQcS0PDdJLteS92LEIIj+plRWVAELxeRtbfFmfukIvpLskhG1Uob7e7LVST8jsUGbEg==
X-Received: by 2002:a05:622a:1794:b0:4b2:d40b:997 with SMTP id
 d75a77b69052e-4e27dcb4b08mr75990301cf.11.1759264244891; 
 Tue, 30 Sep 2025 13:30:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5831665671csm5161706e87.75.2025.09.30.13.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 13:30:43 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:30:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH v6 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Message-ID: <uao62medi7zlhu7p7q4ijnzyd4jfvamaumwhxbhun24eqgwhta@scnknn7slpfy>
References: <20250930182450.563016-1-imre.deak@intel.com>
 <20250930182450.563016-3-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930182450.563016-3-imre.deak@intel.com>
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68dc3df6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=tvw-fHIMQa-57OEpRgIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: TEUHLSoa-5yricg68y_4LebAK09X3WSW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfX8uMyO/aNAnDq
 stsciLMDTjmaRqSXjyvb9sIH+JYs9lua1eq+YqY1vr/bbjh5IODug4M0uU84mDHSL/w4DpzCyb4
 ZQIVGWmQy620ww1F5HCCQHb4BpN47Eb4Ik7Fx13Aj4YU92VAxi1iFGJ/YlYWw3kRhRGogwatzFS
 4NE9Z4Uq7IVfNmeteQzxRnGDPCoSX0SvqYjZ+KHI9c/iNgqXnHyVirtmIfRJHNiRfhLgXK4Jg4O
 puaWKV8GzrD4WGTfeoJH3lQRxJLFQoGYcCN/PY5aYi6FvJOjbMjn780iAedJ6gBBdXSDRSYsku1
 IGB+SXRTt7TED0k/cTwnE7WNYeTcU9mzFBDu/zzWmNvXwtiTq8nO/zgylIBdaPB0FgJSyYsa5RW
 XzKLfiWnTLuEx59R/XeGAyGUo5rO6w==
X-Proofpoint-GUID: TEUHLSoa-5yricg68y_4LebAK09X3WSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004
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

On Tue, Sep 30, 2025 at 09:24:46PM +0300, Imre Deak wrote:
> Add helpers to query the DP DSC sink device's per-slice throughput as
> well as a DSC branch device's overall throughput and line-width
> capabilities.
> 
> v2 (Ville):
> - Rename pixel_clock to peak_pixel_rate, document what the value means
>   in case of MST tiled displays.
> - Fix name of drm_dp_dsc_branch_max_slice_throughput() to
>   drm_dp_dsc_sink_max_slice_throughput().
> v3:
> - Fix the DSC branch device minimum valid line width value from 2560
>   to 5120 pixels.
> - Fix drm_dp_dsc_sink_max_slice_throughput()'s pixel_clock parameter
>   name to peak_pixel_rate in header file.
> - Add handling for throughput mode 0 granular delta, defined by DP
>   Standard v2.1a.
> v4:
> - Remove the default switch case in
>   drm_dp_dsc_sink_max_slice_throughput(), which is unreachable in the
>   current code. (Ville)
> 
> Cc: dri-devel@lists.freedesktop.org
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Reported-and-tested-by: Swati Sharma <swati2.sharma@intel.com>
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 152 ++++++++++++++++++++++++
>  include/drm/display/drm_dp.h            |   3 +
>  include/drm/display/drm_dp_helper.h     |   5 +
>  3 files changed, 160 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
