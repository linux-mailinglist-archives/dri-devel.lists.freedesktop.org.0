Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887D9D0E08A
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 03:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541EA10E201;
	Sun, 11 Jan 2026 02:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jw3IG1tc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DafeS92m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DC410E1C5
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 02:16:04 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60B1iZ2o1238647
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 02:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=36jydPMHIlMPDfo/OD/hFrnZ
 gfzZvIz6poGqp6z9gA4=; b=jw3IG1tcLRfKg06DvfNUnLhqf8YGehdjp+D/RHG1
 8lCFrPN2AKQFg1EkGsEyx8s0lNvm4EJq5jRKI7ppnB81gb6WCnxvjVMmUeyMoiIo
 oav2Vo0yqEQfPiXqbAlkrgESaq3QNLmEwlezRgd3+AHWOyiUvOskCHAliTJXGlb1
 cVejzrilO8hU2NkuspxNVKVTKzfSffTclAxHjiqLBZHewJJlOqFHcAqzx/dgpFjQ
 7x9K2xOLrwt18uePcPAEmp2zWatf25t/kned01i4zKL6P8tl/rOOQHJB+QrTyIra
 gpoMLosK32dQvgezHlBEjU2noaOj0FdJ66/Ts66Fhmrj7Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bks258qmd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 02:16:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2194e266aso1373425585a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 18:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768097763; x=1768702563;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=36jydPMHIlMPDfo/OD/hFrnZgfzZvIz6poGqp6z9gA4=;
 b=DafeS92mWru9ESF/jwO3M6eLb5UdCQrpSe6dsnIQtxJRdI91wcdg13fk24LYf8iMN0
 sjS3bfUHkpRRh05NTL0q1JRvJM63BGq5YG9qdT8Rm73ZUUX2A34tOE+RC1zFD07E/F2e
 Us1OJUBxeM/wKyMQhzB10w7tMHZOgCZ9ZE8P3iunjuSPzOuNFMWlta+xkiQbSSmFfhmD
 RoqYkjMRwWYMHLg9+3VB30SVtl94MGuzQHjqIEbtFjnCHPZo4MY2GcSSpmKP7N4rVE3a
 7rre1ZTLlhfzxQ8E4yxpFyhKEPyrK4pqQPJGuM3lLGhH3sWgETM5Huw7dwv3LTxfc3rJ
 yeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768097763; x=1768702563;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=36jydPMHIlMPDfo/OD/hFrnZgfzZvIz6poGqp6z9gA4=;
 b=TS/PWU2YKqdcmQ+KI5NtOGBCi7iOKc5+ChMUTu9Tz45RVzH/aAOZPYEnxibCd3dRQF
 RagCe+DyvceHpeCq31vDl1GvaTFcR6AFwn4KiXit6IPqSBPAjQLau/gT8W5f2lc1WofI
 IbgzUpmX11b5pn3VR1n2nCDhH9K5sqG/ZO/4TQJ79QYtviuvRDNM50dHbD4VXsNooyq7
 kLpsQf8gHGZpUNq7aji1ayh8ekgDqbN4gJ1Wd50iJawziShejNecbUtybl45HO1rzmID
 KJXlqLJyicMFRjD4ljEs78iB/oABEYNmA+knQWLfTv1rBGhXBScpDH3YagZo4fkXw4TD
 VV6w==
X-Gm-Message-State: AOJu0YwVSLg3+/TSu5Y6MDMpaKKYNsojANZnip7tstYACBDR0AotYu4A
 +ERb3wpYIq9DRqhYp561cjDMuXue50WNBM0oojO6wnaYIlxPmren041nbhnGia79aBddbVlfVAT
 wrutYSSJuNsxJBXlVZUPTge24iIJ0SvN0tqZPYBwHwZD0Exqr7s1glDqlunjbRE4Xx368PbI=
X-Gm-Gg: AY/fxX5m0ja2cQb5OczLFMsh3jkEYbhaQLE4Q/oNmSxcz+b+zf5N+fpfaisKhlAQ9vP
 OssNRr5AHBNToAMRt0ouTuEsGkeXmRVP7RnBG4liwyTTTnXRvEjNg97BK1lwTAk5n24jeEHA/HK
 X+ink9e0VWp23F74yySb/Qsdn+4eCPh+xHPYez7b/yStpRFaRoMZWMDquDhcEkZZQ6PzvJSS4eg
 rx9z0FZPWCbj3fkQC0qzDRBzt7QAYlv3DYV2tMWD09YnUWwd/aAZTRZ+SZQzZ3aY+DBl+onZoLX
 fWWo1jdWVudFKAWzEmFe/cPTGfoP6v+cU3DEGbCw0WryDTieA6SqwRZKVCzT8rcHDvzN1Kncwc7
 hNtm4ctkBdixXQFnTf6Fi+IBy2ZR/KtI4VWl24Obk+mbcf92ZPqxDcftYnVHid0Kye+S5a91lG0
 /vWGDr/nhSD360honLyaRSrg4=
X-Received: by 2002:a05:620a:4729:b0:8b9:b84b:4e3f with SMTP id
 af79cd13be357-8c38940babfmr2056522185a.62.1768097763251; 
 Sat, 10 Jan 2026 18:16:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjON8JUr9rP3ckXKrY4koDtuqcBKVzXl5l7P2QrwesMAKpa5V5NKX8AYDkATwzdlygkHvSYA==
X-Received: by 2002:a05:620a:4729:b0:8b9:b84b:4e3f with SMTP id
 af79cd13be357-8c38940babfmr2056519885a.62.1768097762773; 
 Sat, 10 Jan 2026 18:16:02 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb3a0046sm30552681fa.8.2026.01.10.18.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 18:16:02 -0800 (PST)
Date: Sun, 11 Jan 2026 04:16:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm: Fix x2-85 TPL1_DBG_ECO_CNTL1
Message-ID: <r6yx23davlqzcgpjfneml4bur5qsb5qrjh2y6hjo52n34ykb37@ma32n25wxpnl>
References: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
 <20260109153730.130462-2-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109153730.130462-2-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDAxOCBTYWx0ZWRfX97F+7D+NpN9D
 QBPYa/Thy0dPBvuCpGxSm4RQc6hOj6DIiolP0Zy0ykFndH0+sQA7tgRTMvxpv3YsKl1sp4ui0nJ
 66hb0aH/BiypgTUzstKECEWGTAKunsGS3nMEM8BrVWaYVxCtrd0ti+MWQv7QmvLNbqGul9oxrbx
 i4iI40Kl054F92ogWn/IL5wlrbb0Rc0Pph9l51ZafW7tt6fOY6A92ZP2HRcWnsG/g6knK9yPll7
 oqDyg498VNW9lDeA+nEP8vjBT7yhePdd57iSHAZuOXeorL3amK16JM4XAfA239T2QBJiQYjsuIH
 +/4dsq8IUM8vGbiz6ViI7oaX1fo8i7ML73frpQ5FFgeggrlwB1f01Gdws8dBGCntqgncHayurfI
 sK3BJ371LVNSouKIDYouDrJxr49sCqWm6EOOM7WRzaCU58eT5SbceICJULQqJhJqkz5fwbyiaB2
 cDZ1EBPogR0ZCiQ/v0w==
X-Proofpoint-GUID: DFpZXeBDSuZyvgKeRaj1IoJHH_cvGQld
X-Proofpoint-ORIG-GUID: DFpZXeBDSuZyvgKeRaj1IoJHH_cvGQld
X-Authority-Analysis: v=2.4 cv=EMELElZC c=1 sm=1 tr=0 ts=696307e4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GOW6-3cM_b2aOis-rAcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110018
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

On Fri, Jan 09, 2026 at 07:37:28AM -0800, Rob Clark wrote:
> We actually need to set b26, just claiming to do so is not enough :-)
> 
> Fixes: 01ff3bf27215 ("drm/msm/a8xx: Add support for Adreno X2-85 GPU")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
