Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71664C5CBEF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 12:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A34210EA39;
	Fri, 14 Nov 2025 11:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sf5NkDbs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SN1/t2hx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D12310EA39
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 11:03:20 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8Z6ri1686448
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 11:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SsL1HDB38FRgMcij+jx/dBoF3vzUnXEGnTWRlo3FyXw=; b=Sf5NkDbsIzoxNN0g
 fio1is6hSCp4F0VbBAhVOImlbSGrtkPsPOnykwY5S6C3X3+DXOvTi5vxmmfSaosg
 PV6wf/0NoqTkha1yJ7E6P4BC0gB1++ENh49zU28tEaqZwM6SbEy29EHNqwwWH8Cx
 +3X8F0SyZln8FE1mRP3LYwY6U2d30/pkkSe8iTrJARyUCizFIo7DjG2asuIm2dhY
 ogKE7tL3HTflIEoBqJ9CAfaftWU7zr6I4pUZ8H4YB3bQWCX/abr/R1vYkj/2NGZ+
 bnJjU1pzQYmnVkUuiwe6Ehm+wewO7ZvtBXoKBszjWw9IGTJ0xPgmvCXGs1sXm8S+
 iJqcGQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g1wbd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 11:03:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed79dd4a47so54463411cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763118198; x=1763722998;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SsL1HDB38FRgMcij+jx/dBoF3vzUnXEGnTWRlo3FyXw=;
 b=SN1/t2hxKmMqwb/yEkSuQolFSMQtg2YOLaZVBUfQu0k9iNrTtRSJYS5+VkMiB1NxRf
 pPnolOMjZQdMjmQfa2lZKRMVA+jEjvnd61kbEE23CPbNDO5xxfDjBgPD2lybKn2NWRF/
 /Sb5UeuGwxNKy8vAJ33vHm79LWwUEtvXvbmzFSnob7/50s+58wp7DEZPqkmcIuaKSyyM
 9HR+pSbwYqGa1CV9Y2rmiyTPKrqgIU/6icfpXScF5AeKMueYw8QEwY/Tjyp7Z3Dr7hKb
 WXgQJXuFwBtBFMssKXBnzGW26dOrx+DKT1/KyjgByg+dxwjmxYNb6xwyN/o2L5RYIQfY
 MFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763118198; x=1763722998;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SsL1HDB38FRgMcij+jx/dBoF3vzUnXEGnTWRlo3FyXw=;
 b=YwdTNWRzDOTE12liQCUqhNVOVYqJbZs87rxFuvpteOWffRDjfFCVvHQn5ZXh/7947W
 EruTd1PUmxCWM6gScCMJ1T6Oiictoc+wfTBsdRe3JxWICxFIhWbu5C4+aLiGrQC2YAMq
 Kad/KpXDS+C3yQFgSJNFzQ5wLVoaQT4H+RhoVkdRLMfzwgY/9WjY36/LQbwzfUkR1iUj
 4TLs1Kh9W6mxfB0nV5jbprWyOC0QqFSf4YNmaSgOiIcuYTgouFqsb3GJFXXg8b4sZJl3
 rjQp2xEbaNOotVTK3xnsCDspvNTlSjtCf2YzpzPgC8LHAqDwSlbiYX0ejATvyeJg4n8N
 XMEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEGkyvSGqlxx/2R+PkHUWDYyMVA0jFGtnaS3MdKJ+ahupBZ08Q0zYBhKQ9iQrO8yXVIa3QzU0x1mw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYSYiY8YnbHgleAki7htdeG4Yf2OiVai6h2rZgqxMLyNCN7TKf
 tPhACaJ5wnwfgWiZu2zlKhzoBGcqdmUthnBvZN6KYgf6RNNW3ZqBuZTFJopHEkNyJwiMhxdC6Uy
 n1O+l+i0tyGStDrdCohqB9pxsjrX3KkkTfPof9L3BB7L/Onmxve4HVBOnlYOaKDistD2QzVU=
X-Gm-Gg: ASbGncutNcCfPzH2xOXCeZxQvBdBWLqVP5jh/mhj5ezr+KIt5vPDXAgEW5MHCyx+oC3
 g9ehwZJgZIz+nsFNlz47uWEUw8DytRirpXpoPr6IsAlips+wcGvYNXYRzlmRvL5yTamTXLyzQie
 irNofEv2hZBrzV6goZdw9wAwRSZLhYeF8v2isCsmlOF3SjcRuVOB7Qgo8KhU/XPXieKonXcZ+my
 wFnP+vlamKbmChEFaV1sNBIGLWAI68YbdLQs+yMVf2327KMUbEDtGyCcpUj/IzuVWYVwB9aQSv2
 lJnCrk4iz9ZcJAITSC4dySs4kOiM5Eg3BXnUSDE37CRu33hFa3F0scUASUP9vtOiRZNHwMwJ978
 5EN/pZ8t60BpjZ5+NoT8a9gnhfn7IGz58aEzlmarspUfyJQ3kJDcy2ppRmoy3ND4kTyt7hHVY+j
 pEdvJ9OfAvKP6p
X-Received: by 2002:ac8:578b:0:b0:4db:e7be:b40b with SMTP id
 d75a77b69052e-4edf20a3de9mr40782431cf.23.1763118198144; 
 Fri, 14 Nov 2025 03:03:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnk790PmVPOn1c7OeBtDwurCO7QZI3gzzVeXmoG8GqrbzlotEwQFNkCiIoA940ETO47ZtSJg==
X-Received: by 2002:ac8:578b:0:b0:4db:e7be:b40b with SMTP id
 d75a77b69052e-4edf20a3de9mr40781771cf.23.1763118197632; 
 Fri, 14 Nov 2025 03:03:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9ced4adasm9135771fa.26.2025.11.14.03.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 03:03:16 -0800 (PST)
Date: Fri, 14 Nov 2025 13:03:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: federico@izzo.pro
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 nicola@corna.info, David Heidelberg <david@ixit.cz>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v3] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT
 DRM property
Message-ID: <ac7fri2okl3bvzvfnjxg74x5gekn74ii5sslvldfw4ioan57bj@w63zkvngpi4x>
References: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
X-Proofpoint-GUID: 6cLUlL-51I2MN257OVCu8ta8NPbVEfgv
X-Proofpoint-ORIG-GUID: 6cLUlL-51I2MN257OVCu8ta8NPbVEfgv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4NyBTYWx0ZWRfX8K1snuPBI5sM
 aorAoqGqBInfmyksopRBpireGqfNmop7SO1okKg9uoVBN5yve1dwFY2tLbG6av6/l2JR/B6p6gD
 5i82nOqD88xCcr2wG6J/y4T5LW4nwBZAuUI5zGb1sNvznQ5kUN7bXPFfOQ9xMSlbcm9Mv6TRyf9
 BNA1iO2DarGZ6yaCm0bXqZAoM6qT3k7gtzBvBxVwYbc2eyiT5v/I9Ze1By/HiEP3iFzjT9WoEkr
 jRMT7U7wwnZKfCebsxbNXvuEND4gRaPORbhs23BcOme1hsf5guKlasFrcWndN3PFcdye+CZe/9D
 r7TEJd85aiVfY5XtsLydUgw8L6bT+hsbLTHjdqBO5howy+JQTzBZXy+O6YXsfXSFlZ3Txn9TvQK
 Gq3cBCYDEX1Fj9FJXDsvr/KKf5i3Qg==
X-Authority-Analysis: v=2.4 cv=IM8PywvG c=1 sm=1 tr=0 ts=69170c76 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ze386MxoAAAA:8 a=ZFu0rgk015Nm-26e0XUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140087
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

On Sun, Oct 19, 2025 at 12:06:32PM +0200, Federico Amedeo Izzo via B4 Relay wrote:
> From: Federico Amedeo Izzo <federico@izzo.pro>
> 
> Add support for DSPP GC block in DPU driver for Qualcomm SoCs.
> Expose the GAMMA_LUT DRM property, which is needed to enable
> night light and basic screen color calibration.
> 
> I used LineageOS downstream kernel as a reference and found the LUT
> format by trial-and-error on OnePlus 6.
> 
> Tested on oneplus-enchilada (sdm845-mainline 6.16-dev) and xiaomi-tissot
> (msm8953-mainline 6.12/main).
> 
> Tested-by: David Heidelberg <david@ixit.cz>  # Pixel 3 (next-20251018)
> Tested-by: Guido Günther <agx@sigxcpu.org> # on sdm845-shift-axolotl
> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
> ---
> DRM GAMMA_LUT support was missing on sdm845 and other Qualcomm SoCs using
> DPU for CRTC. This is needed in userspace to enable features like Night
> Light or basic color calibration.
> 
> I wrote this driver to enable Night Light on OnePlus 6, and after the
> driver was working I found out it applies to the 29 different Qualcomm SoCs
> that use the DPU display engine, including X1E for laptops.
> 
> I used the LineageOS downstream kernel as reference and found the correct 
> LUT format by trial-and-error on OnePlus 6.
> 
> This was my first Linux driver and it's been a great learning
> experience.

This seems to break several gamma-related IGT tests. Please consider
taking a look, why are they broken by this commit.

-- 
With best wishes
Dmitry
