Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42EFC0EF49
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 16:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605EB10E4E2;
	Mon, 27 Oct 2025 15:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXl9Ky+8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068FF10E4F2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 15:28:47 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RBJjD22546727
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 15:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YrpC/Eij51oIcLt5fwITYt7x
 pzA6N/JSreOhEW3wMcU=; b=fXl9Ky+89oD+F37ykbRqhqQ3dkXcpSACYzcYskik
 WZpI/aMEkH22yOmFh3SshHaNj9KDqs3bYZMDF0FpbTiUvgplvZ5feNcCBjya0//2
 O5sidI6HDx6bqtPtAPvyJuTkzXVvXxQiTGul73MyoFNxawgFtKM4S9SAcuah67eo
 8D7yfw6QNSzjonTu2dLuVJSb5g9WKOpkfn50GypsFIy0E1tYhFsztJFosY4kXZM1
 LWsnrHSUdtvQXV4lY5iGbr28GMrUbUOWqUFENIXUyh40M/lLLfDzZ32VqR1DLWjm
 4fULpVLiCOuhYh0xxIcY8sNWyoR9zVkXmDi4C6B3f12xsg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2gu7m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 15:28:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ecf5d3b758so39539321cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761578926; x=1762183726;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YrpC/Eij51oIcLt5fwITYt7xpzA6N/JSreOhEW3wMcU=;
 b=lkkbMitAJ2UOrV1soDcyW1UgMhuz8NzOvxGLfw9VMQhxlOI6C5xGnijvM2dCLz8pyr
 HgqF163rhBF6Wu2dS4MJAFdM1sQSHkfbmW+nsJKJJLaI5TNhF8PO93HATL6e0TladDIB
 MSJycj2DyxBlP8yCA+KM4xvaNyfN4yF9ruSP2nrenGaTO/jrtEheBNNL4o45n+G/UsVh
 Ehpupc99qwF+BLtsPdEKsw3eiqlOUnrmJufJ2ymLzVxpUwifRBG49t7sxdbxguFXWIbs
 KzsaOUIKBMQFLc7+zfBZhMB1gVsNW7VXZKuFEe+3dLUGSBrXcTJLXxCzFE8J+BEohWGj
 BcGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpZNGqY/hacY9oxgwiC7Inz/vgozkX3bkoZiflp6KYwa5ZBmGwTJY7J1npXDj4+n3J3Gl/ZpLsbts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwoAfAEil5ESAVrvZIILx5ktQaoP99CRifouOiIrg3afv1DcTi
 RVhlLs94wfLd+ONGGye5OtbmG+UH+qRSkPOuKyrY6McjWjma3Ky1BsbBtILnXin13uZS9D+C5Ss
 OoB5vRSiRKeFnAG3JHsUb5lVI4bZCkpilhQB3BxUvPzZkBA08gavE8h8jWoQvLXMYqlk1nSk=
X-Gm-Gg: ASbGncvMFB13oBH4fHj8tiY2tEfnNyayfbm6hwzSJhqFz+SVE+kKKPTbmiEC4ixHF+r
 mwSH/d5GNZ9IAQfkmML2cVfeNq6Nmnf4j93BzfrALhBCKE31K+dUx8NTRKgOcuBKlghSHe0Z6kj
 IlK/yu1JVFCrQjGG9lqYI/UC4GlCRDFMKy9uY9jhaNaOr8kR51jFEGpevyaQsKwlnMcE46a/Gtu
 yFDWs6EHte6OX4KXy+3n1OqlcTL/26Y+JqzgFz3X7jtQyYY28wy6PjrpVDuxrUhS0F8JQ/6ymOn
 Z/zakBwZNaWnyxpPJEFk02Sk+tRWRNov8Z88vwGbNxSY2gqwgojL/dgY955OhZFrfYc3kGwukCT
 xIunWGiQblkKKGmd9cOSHFjgYRfUtFpT+5chlpSbhQcYxCdkMwxm+d4lDblWr9oel8D5TYkL/mS
 jbB+r/YFhYhHoC
X-Received: by 2002:a05:622a:210:b0:4d8:afdb:1264 with SMTP id
 d75a77b69052e-4ed075ae66amr5031761cf.51.1761578926162; 
 Mon, 27 Oct 2025 08:28:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjv+f9Wm8zIpfZr0CI4TlRCnBPRjNZSJNUnKZu9weamrR66/3k2l4bfVFcQ9Uy6J4XGbePmw==
X-Received: by 2002:a05:622a:210:b0:4d8:afdb:1264 with SMTP id
 d75a77b69052e-4ed075ae66amr5030901cf.51.1761578925321; 
 Mon, 27 Oct 2025 08:28:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f700fbsm2410946e87.81.2025.10.27.08.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:28:44 -0700 (PDT)
Date: Mon, 27 Oct 2025 17:28:42 +0200
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
Message-ID: <2ppfdoqa3fyjysfv4kiincmpbdstkgfwxso7tlfcfyfmwsndok@7krfjzdvsozv>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
 <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>
 <vngf7cnsj36ddg4pdm72airm2nketxk3m34qw6f65ompimpcfl@r3lbv73tmutj>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vngf7cnsj36ddg4pdm72airm2nketxk3m34qw6f65ompimpcfl@r3lbv73tmutj>
X-Proofpoint-ORIG-GUID: ajXp9B04y2rMVeAbcLIiuiSF09JQ0gMP
X-Proofpoint-GUID: ajXp9B04y2rMVeAbcLIiuiSF09JQ0gMP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE0NCBTYWx0ZWRfXxTkOgV9E8CcP
 HUvDrnmJLv8eHns8slfuVDdV5DxkypBDBnKIePzWDd6tZH3wvUSfRGjQ1Dxb6Csp2OGs2ekpOub
 wXM8oBShYIIydGkHf0hmp+Gah+fTQmauLi5mytc/ihMqmEFaYQK0GZsSKav3qricA5f4xoKGId4
 rN5Ra3yM0mOodAb1+r/uOlxPxJouBSqJI+bErFepfWhuLWIA4LNX+9XXOkVq+uNFPfs30cwMgsl
 L+aIaNzszpt/10cadRKkka/6dSZLEPZ2Z0vBWmmGcCSta7OgiD03Ij7ZrnjG54nfPiXHXV4Fq+L
 go3pWR/WrXXpAZ4e2yGHkY30b6OkGEx5l95J6STuu5qBA+Q4wfBgbcfzonBD+Cxuv2LT6N42Uiq
 BMXTKXhSKvPHkfR1oerebL/GC5bhNw==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=68ff8faf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=L6mQZqrAOGHZejgJyMIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270144
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

On Mon, Oct 27, 2025 at 05:03:43PM +0200, Abel Vesa wrote:
> On 25-10-27 14:29:01, Dmitry Baryshkov wrote:
> > On Tue, Oct 14, 2025 at 03:38:32PM +0300, Abel Vesa wrote:
> > > Describe the Universal Bandwidth Compression (UBWC) configuration
> > > for the new Glymur platform.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > > 
> > 
> > Bjorn, do you indent to pick up this patch on your own or would you ack
> > merging it through the drm/msm tree?
> > 
> 
> Please note that v3 is out:
> https://lore.kernel.org/r/20251027-glymur-display-v3-0-aa13055818ac@linaro.org

Thanks. The question is still valid though.

-- 
With best wishes
Dmitry
