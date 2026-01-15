Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03440D283C6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 20:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766FF10E7BC;
	Thu, 15 Jan 2026 19:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUsztqgQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="btv6OxmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603F410E7BC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 19:49:52 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFg86e2313380
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 19:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vNyvDLfAN8WwlT6zHodw9UdF
 0NznYHtN6ODgBj8iUn8=; b=XUsztqgQbuqTtAauO4BbRi703m24+pKfKphDtgHJ
 yrnswfowqOsQGwwzimVC6p9+cCb22cHJsJBcVGJRjEKRxzCzR7OE+JX4Tjk/3k8r
 oZJ5Eqb/dEyP5YFDAtePk9fB5wCxmgqCjbz8pHVW1Phn5WkFmLRuvAt43UMt6jom
 8AYQUgvp2s3IvVcBFelprbnoHTLKa9/MhdCKCcxDsGJa+ZLp647w0BmxRQuBsvVh
 BG2eCkHtp3bKsxF3cRtFYwFYU9SCtt8cOGex39HIGHfuMXXHSsHXAedu/uf6aV6u
 5dV58bqsA3+rGIxb+bM4L7Jah2hTaUB3+G711eGzrz6ksw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq340gv3m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 19:49:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c2a3a614b5so326921785a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 11:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768506591; x=1769111391;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vNyvDLfAN8WwlT6zHodw9UdF0NznYHtN6ODgBj8iUn8=;
 b=btv6OxmTEh+zq+UbqUU1wKKVjZ768HxEDxYmBOL59MIZ9GqP2ojrSg7GI5PSQfa6bm
 ALEOyZDfcP+QaaqqQf+NymBll7e55D36P2j2hutE9/ErnEd+W94xfdlUaeY1E3F5GSKl
 7G4up1gvQ5Upea/JxNehibozT3a+m/UfG1dH3svBJAz5MFNac3KcNpgCl0HMFzhWqY7e
 B02kiSAZrioAniQqNxBGgpHtMBPFQRMk9sGlBmKzKw8JSZd4Zh8gMCyrEkcG2rm15e4T
 hHnd+wlZmj0QEyjD4oEkpLPX1Bq+5vWLZSB7pIsQPpxW4/lB0yS5JZRpELr7mNALLZzT
 88hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768506591; x=1769111391;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vNyvDLfAN8WwlT6zHodw9UdF0NznYHtN6ODgBj8iUn8=;
 b=JJX/V+5wgzvGaslECsn2aPJL4CJxb2I0k0RD9xqY+r+XSJRQo/Bt89+Ggp6CjwpG0l
 6tV0860EB/4fySw+pT1WwtHiCO9VQNOKndjXk4tblfgb1DypJogy6nD5+peJ6zFH21L3
 yBVCsL38S1CzxowDWZW8r7hJA6X7GBBaVf8OLdhXB2bGaNjxlg6ET1olWbnGNcZ3rIIS
 JZjw0Jf/s4iCDLN461UHoKHY0n3oId2dbLlYlcZmxXGxwSJl0Zkqc3QCr6VoBh3ahRSW
 lTEIO9pKfIelYsxJ6HxIM914+7MSFOOBv12aNq/slUqy+pMwqSRhc3Tqx3aKulsebIvI
 YQbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb/W2nz6/xYkqtW3cNvg67QGvH6T/Pao9l53KmLpYTN3CmfcBA3tD6YQN+zHZeKZcWWpDRaGrCeHU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNlva1bji2rXw5GC7M3zFN1Q6O2Uf2ZSRdezXz2to76Q+vqxNa
 /v0CLCYJm1P3xieGuoE/Vt+ifPA4JdZH45ZI23eraFMqYDkYCXUqG3HCWWOPnSPjRyQrtsYP2X0
 3la8a5d3sDgCC7HXbhdLJm55kaEzM+UQTD5e3H6YziqdhKU5zh+Jj0AaSF0De7UYExFz/rsI=
X-Gm-Gg: AY/fxX4K1slJwCPQgnghKfYFws0txQhejal79teMrpATBgWDmCbt17oJhWp7oIGnZ0s
 aIedI6DOu6PmGGIGQfF+9WTlpxjpb0uduSlFTKAs4wc1MWBpLtZAcnwDEwWBekfqSHquv0PnWTB
 lJ0MiTcCLzlfGRYND6gbGbBNDbBRxOwhMhJGJ8ypO2goD9oNjb9famXUD6cAHriheN83pavw33Y
 4KZCSkRKWYj5jiXjqQYVJ0h1iR5YZTCvP2GY34bx/vCub/QpVMMoCK/IsgfXCUfoM/13Hs3TMJb
 E/W8vbmPLm+3oSCEUS9FbA31vvBtiAkVSc18dGnnyuNCHnxnHvacEn9RAtnRnDISsHF1lNQWg3K
 Kw/n5sNpIbLAubKIPg4r055SpkU/SXRZYHAXZCxHqlUdNjIybK2NX1G/9HLYm0pTTevkruwto+N
 g7LPgVFlxKzQDhnLGvQTx7S6A=
X-Received: by 2002:a05:620a:1a23:b0:8c6:a522:14a2 with SMTP id
 af79cd13be357-8c6a5221655mr223789885a.35.1768506590630; 
 Thu, 15 Jan 2026 11:49:50 -0800 (PST)
X-Received: by 2002:a05:620a:1a23:b0:8c6:a522:14a2 with SMTP id
 af79cd13be357-8c6a5221655mr223785885a.35.1768506590140; 
 Thu, 15 Jan 2026 11:49:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf39c150sm102366e87.78.2026.01.15.11.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 11:49:49 -0800 (PST)
Date: Thu, 15 Jan 2026 21:49:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v6 10/12] drm/msm/dpu: Add Kaanapali SSPP sub-block support
Message-ID: <izgoqm4e2ydqrelg4sxc5a4ggnqzqei66m55ds5wvvfbhkgyat@trzbm74n6ctm>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
 <20260115092749.533-11-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092749.533-11-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: vQfYlrbuxRc8xtL5ODKUun_t_Cx_qri_
X-Authority-Analysis: v=2.4 cv=bp9BxUai c=1 sm=1 tr=0 ts=696944df cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4dFScLpsznfeEuoa3zcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: vQfYlrbuxRc8xtL5ODKUun_t_Cx_qri_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1NCBTYWx0ZWRfXzA3pD9lLNYti
 n0FuH69+n8EJdaZ/E8Jpf0L1ZTjuzESrcjTLlT1IMdvdDyR5Mg/l7DvpaXk3IhmOAHh4sVBC/r2
 6BrLWyYmBzNsY/E2WX4hbL3ly7JhDfT/JT60NyH0x1trDxYrh+vvnAzQMZD+HN90931q4HV11+j
 W/2jNebWcnAJlxKfA5Hz5eJ0iGWmCJ0DtbvEiFcxg0hrGkf5sbfe7mfBV931cj3KOU14/bZhlXK
 ibZDE7OoAZttklJVd5DMoR4/j0ITm9O35XpUlTPLeW9Z9It/FeMQILnhoq40uhk9VWENv7ajzSf
 JUhR8/dMNz2EwIEYcEK19ISwg1kOhAryeyk6cbt6xhxQ3TsS1rOr49tC0D2issKOIhETlCsM6Yb
 GgzSRUU6QX4vfoU5PKVau5dsCaIh1FHlgqfJbSm3908JXPRA1K9XXqlgN/Z1r4FMiDX8Z971e1Z
 nbFWSE0WAFEotGM3uYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150154
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

On Thu, Jan 15, 2026 at 05:27:47PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add support for Kaanapali platform SSPP sub-blocks, which
> introduce structural changes including register additions,
> removals, and relocations. Add the new common and rectangle
> blocks, and update register definitions and handling to
> ensure compatibility with DPU v13.0.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile                  |   1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
>  7 files changed, 371 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
