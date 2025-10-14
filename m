Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C6ABDB1DA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 21:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBFD10E013;
	Tue, 14 Oct 2025 19:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WFhYfeFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6097C10E238
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 19:50:25 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EFGrj3005484
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 19:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hoXaxxAh8HM/NnL2U+whNfVg
 Ynbh9JZ3GGYiHNKdMQw=; b=WFhYfeFzTO9webJ7RVqkMZsclTvhFb+CfHvDOT/R
 GATWvzYy0L23twFn/CAaFdL8QwkfRZ77CZIoeiYSX6d3rTn2zn4naA/mWoLCb7N8
 z2RX3Dw/WocYxrfhlwbERqirPMwpAXQ8XyIMVQZ8Ic/e+eDDOn/T2b9sUqbTsZnI
 XHSroKWxZF7KHU3ijsYrOdRHrM2iICLGpUlxPhQg3KiREcQJaRIKpelWOrP4q7+Q
 NzfjAhgIb76nPJBp0XADW2qgTJe1XMVSJHP3+LE3+k53yKOuNf6xztMfHTOeKRVw
 fNc+nd75ZRMTWLdUoLtTSOYUfw6wWz0G/O0nuARhTEXW3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj1tsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 19:50:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-883feb13e83so3286809085a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760471423; x=1761076223;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hoXaxxAh8HM/NnL2U+whNfVgYnbh9JZ3GGYiHNKdMQw=;
 b=MgR0z6xN/RHHMJcQjjTXfnbvkSvpXYah1Fju5++sOoB9M3OK2vNBxH/4pQA8IfIaHs
 Wb+loYxdotEB5SAhgmLYVzJbWP0PA2zDchMdMgNWhgKLGCNy6SigbSP9AoJn5jN/tnPf
 BQtNX+kaw5OlA+qKEVdynbwlWEPrzG6sjXShoIKEG/sROGDlaeKvRxHIALMhDMaCVVYK
 3YMPnSL93VZA80bT9AC2Uz8xN2rybkFScuz3IcZakBAdiUjje/sSQWa3TwgLyhzPe8Bh
 SEdWGjwCDfnrMUhcIgaNpB+gm7VUTlkU0NSSoDkNujzVe9l9pp1rfeJi877XjW8rMZQq
 235g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8H3RigwHRE4Jj9Z9JzLnLUtRby7KaTJdj72nvMBMY8IhqnYpcfEaJZxLFsMvjDar4u2wH5CD+VOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7JzL8zNVWviDbwZNZRykshAFQWisBeJydKJXu8gmiQlMBSpQ1
 yw92JINgHqW4U52YCYQiBdXc9NyeRnj2V9OwHEH87G31aChru54BwKL2lxrWnwOTIBvXN3CVneZ
 MkzImufGPUqIRy5npEbnPGhV80f2XS3SKCHeEZ1/J/dQH1OJAZkib97xWYq1smhTTyFDmQQI=
X-Gm-Gg: ASbGncu1ZEQDq5e8b1zJUAM1j8/stpqgImk6C/SPOB5QcoNQkdzSZ/mShcZTy3ELZ+C
 Zrh4Tn/YSkdAa+QKoVgStJ1tn6TBrsj0LYILHVYUZmc9Aerux7k70g9I2XQXGCwVealsINQgUF+
 4HBT3yXvgI+zzZulg4pd4Z04VAsghY0Of9tdZ10tRNTQKIMZKBWrRdvn8zBkf3GmuZ10vJ0kbR4
 dPoJrJEJfxuBWPvHjl6QjvTwcqVH3JUlfpWBRQ8OjjUV15d7LKad9snOK0BHej51suJgCmvHq1q
 1ZfpCmIUBk2B85nh70pu990Ng39uRPNCrdM5lawWVqmfVeK65haFprZ85N8GR0jOzkMym+A0YfH
 bKjjeztg7dP9naYKlWBYGGaEehdcg748QV8cZbzyCwkD73ox1STe1
X-Received: by 2002:a05:622a:148f:b0:4e7:1eb9:6075 with SMTP id
 d75a77b69052e-4e71eb9639fmr134514341cf.24.1760471423483; 
 Tue, 14 Oct 2025 12:50:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5E8/aPEwYwGIvty7HBIiP6izQb7EW36jmKnfvDtGc+uFowF5L0vJTo44+JikizgOXq93qFA==
X-Received: by 2002:a05:622a:148f:b0:4e7:1eb9:6075 with SMTP id
 d75a77b69052e-4e71eb9639fmr134513931cf.24.1760471422969; 
 Tue, 14 Oct 2025 12:50:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-590881e4e09sm5522722e87.23.2025.10.14.12.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 12:50:22 -0700 (PDT)
Date: Tue, 14 Oct 2025 22:50:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Message-ID: <f4yvyh4yg4mjuukxdee3pdxcslucj2k2icqc4d6qfzzmctlffn@gxtzhgapvnv7>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX1+Tddo28zl1g
 LsO3ZemV2XQ0t5Yq5OQOvvQFkU+tvCxg0fOdz2/aVx/cFlM9t8wOSzLX2/u8lftY2IVFKHARoyp
 s5swpL2OEMicaBKUB14RRRYI16xvAzqidEKgQHRbXtydK9/Ct7Dowpk4w7JPFamMxHbFslsiqnV
 Bj0hOY3a53qK4BB3sjXGF7aYlIKDvP3EaVcXA/bqKRX9kBXb+A+SpBPx9Lc+nX49gEjS3ajN+CC
 xNaM/H53PSHtE4Up0paeyvLS0fxmq1bYtgAqxFrRQXa0OuufjAwZcY+dDqohgQeZUWXIvO8ntQE
 Raytmjz3r2nA2ybv32RrQEuys1/HPaAE30Tor0fPs4VcgLoI6FipNoqqINFfzVJkeQxJBgTZu+k
 iLlc5ByWIEl9DG9hHo3k0knczM2WYA==
X-Proofpoint-ORIG-GUID: JXn1zilaufGcZjxzNVmZiqaoDmwvd_QE
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68eea980 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=rYq5acLp8HI6pBODZ1gA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JXn1zilaufGcZjxzNVmZiqaoDmwvd_QE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
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

On Tue, Oct 14, 2025 at 03:38:32PM +0300, Abel Vesa wrote:
> Describe the Universal Bandwidth Compression (UBWC) configuration
> for the new Glymur platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
