Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAE0BA87F6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 11:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5467810E3D0;
	Mon, 29 Sep 2025 09:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2xqhC3m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB4710E3D0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 09:00:16 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNJo9F025389
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 09:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K70Xwm8Y+J7KLULBIJyLbfN2P1E5MkuVdQpZLT5gNI0=; b=T2xqhC3mvopWRuOI
 dxF2M5bmsxCdK4g2NM7+MMJNM2TKUmoN2Xx3P7Zm0tFfES4xJro8VhVHUNntVmy8
 +HWYh0qYrsliHlpTf1lRpblNNs1dg+onkfVVUvmVnpCi4ExNZydJEZs8Rufpc9ua
 0+uLj88iEvI509YZRtaz1wjW9+GqNTHx50CiGwmyO9DUxIkEJRdTAvbtoVQuYZWq
 Fu0819rAN/llh0ud1HFmTjj2caKow1zAjKezwNjEKbBLDsfNFGWEjsejHLJwDN1o
 c/btiBM9qnka/NWzUr3JV/rQ04BYJ0eG4+3qwvgJFI5Nz21Y90GDNo5QUBGJDJVO
 DP5P+Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tmkks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 09:00:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4dec9293c62so55210241cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 02:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759136408; x=1759741208;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K70Xwm8Y+J7KLULBIJyLbfN2P1E5MkuVdQpZLT5gNI0=;
 b=WChIY82L0tTumvOal8E+yP8QZltXFiTgQoYsuwHpnYQigs1UJnzkp9JiOAQhsNcMws
 UGsllJFFZ0fvqC6ROHRRPCdEnRED8OjzO/xaju1Zn+8kwfvzFs5kCp9/dddJkWwHR/Rv
 7AQKxTqiAlfJ6ZOXR/ww+xmU9RoY14CoUoqtm9Ceg32BjUh0AvD825NbF8nC9tqMrfnG
 XKGYkztWu09yYbZYKzvLSgT17YGiIwXhp40m4CUclAY1Lh2rxoWIcktQ+P1/oyw7Jljo
 vGUnUJkXtGaGfV+0odF2adI8bnZ5lPyjEfAzdjSu+i7yznhxNH27ZwvR7cOmqOGPEmp1
 xzhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3cdH20VgNa34QQq2yNoQVqp38VLvatjOaswFdFzas09sdcOZHmCQmIcPmw092qc3lMd4Opfku4gk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiBHJ0hwAO2gsA5isa7AwzPSGuI1/FPod45rF8rHD+VHBMduXa
 O1c0InGhnW5BwC7OMY+JBwy/AEdombFVSpfYCP0a5ZvkKNNlapEj9YMMZQk3mWJBSkzJZO21Glz
 nF5z3dpYBbida66tqMNSZl6JIIP40Z6/iyuCcZZenXkUjkDHxnIJRQKZ9ax/RZJutXmtXqls=
X-Gm-Gg: ASbGncv17k3cVQL6DtcQL1CSQM7xLMEEaJ4Pzalo3KySCJGz3wjVS4NgMFva0pv0MwT
 FsGdSJiiAmXVtOmdpYtftGZ8clwokB75G6thRn4ozoCXfaUppClK26kX3L+TRnsLL20ZQ0jS/4K
 Ztf8DCFIba2N6Lqg2fCXNrcP07SszqjW/F1w4wNd/qt2j3bYPhQALnTMQy6yBK3TEanP37oLusc
 8dfBoWiZKWQ+6xAQFZKDS3RtLyy/FFHkbHfIuDPMrvzhpBhmjAu2zoetQxvkfbqwKZyLHBzthJn
 GnNIcGIa/kSY6mOZKEhoaCoypGo7IzbcNicD2LBtXmiuEtLgK74Egip4J8KcKs1b9A5TkHfE1XN
 TEPLkmptvF7RJt5rgB9vPMgSsfgQnvkLJRRhnW+kky9d+t948q7+W
X-Received: by 2002:a05:622a:438c:b0:4db:e906:21d5 with SMTP id
 d75a77b69052e-4dbe90625b2mr119075821cf.5.1759136407796; 
 Mon, 29 Sep 2025 02:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs7jT0iWYWJCXgAu4QKcdkIglyJQcSU8ATVnEsnVaemdKEYJ2P7+RTKKGMTHiRPC2iB6Hy7A==
X-Received: by 2002:a05:622a:438c:b0:4db:e906:21d5 with SMTP id
 d75a77b69052e-4dbe90625b2mr119075461cf.5.1759136406987; 
 Mon, 29 Sep 2025 02:00:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb7713a3dsm26929591fa.42.2025.09.29.02.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 02:00:06 -0700 (PDT)
Date: Mon, 29 Sep 2025 12:00:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Message-ID: <agzmuyty22gxtm7cwpdl7ynmrubot45e65tfavbq5muamn6qnj@2wsbjqlc3pye>
References: <20250926211236.474043-3-imre.deak@intel.com>
 <20250929063644.533890-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250929063644.533890-1-imre.deak@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX7+0cslTxg/hv
 a+vw17BvW5hxB0F2wJIYBxED0TkI+0Jgm5pw10ZEk/U53mTD6ZFQUnfyL0OK35m1qEHGqWeNTYw
 bOTLUfvcwJ69YiTIqUC1XAOKr0PLMkRqyvyUpo4b8Qc5znuTEwpte246BVGLdiCfUC5kUNHjMX+
 Nlfv20TjEHu3373WrtSbrOcZiAk3uZVrrNGaTlbAuYDnvujj6dVA/oUTFE5J0r4uqG/UZpFAK93
 CzQ/+Slq1nhqrI4jQagUeQTf9W8ttl70g40WZbNZ5TNsSXhusByqB3WzcWb3dVXBCmFiOFB15wD
 vnGVHSoLu8O0Dr+BrEp7/9snGDT9+Cn2AeUBJr36UeOrIXO/RJp5eWzGBF6AVTILkuMHuS9wEng
 wjNlIVP2i/6ajz/JMrEbaUx7W5FMAg==
X-Proofpoint-GUID: XmKdRYV1Q_kprc9AyDmUEN4kXu9-4Ny3
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68da4a9f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=wX2-_eRYuEKPtGxe6ucA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: XmKdRYV1Q_kprc9AyDmUEN4kXu9-4Ny3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_03,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
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

On Mon, Sep 29, 2025 at 09:36:44AM +0300, Imre Deak wrote:
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

This one got sent as a separate V5, without a proper changelog. What has
changed?

> 
> Cc: dri-devel@lists.freedesktop.org
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 156 ++++++++++++++++++++++++
>  include/drm/display/drm_dp.h            |   3 +
>  include/drm/display/drm_dp_helper.h     |   5 +
>  3 files changed, 164 insertions(+)
> 

-- 
With best wishes
Dmitry
