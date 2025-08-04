Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE134B19AED
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 06:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA2210E29D;
	Mon,  4 Aug 2025 04:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bo7617qy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABAD10E29D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 04:59:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5740sLWN019447
 for <dri-devel@lists.freedesktop.org>; Mon, 4 Aug 2025 04:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yeGhNT6CpWXNeXfNa1CkflGC
 25gJ2duSKHQEY7KN6SY=; b=bo7617qyml3M3oHt4aEetrcNFwAT1BVfLs/RKZov
 3jnztyUX6lOxcGf5IgAjuWpv9s67PZsnGbCv0JvrvaEoL32n1zVbXReY0HlVuba5
 NNHNnB9QWEIVkcwm4ek4gNaVsB38+MnJlDPVMWz1Y/uigbzBjM9ok1wo7FxAW7WP
 x2MBUoeKyKkh7E+RGPuakgL5ex6KvfIDCR+oK+LcVn+WnqtobRqi7VLZGZGcysVA
 OZpEeBPneqWs+BSy62jZV9AAb4yfkzE1oPL+9Gy2RHMaAVV65fPXA9ee7lkO2IRr
 dUuEZ6BsLI5VvQDQ6EDLcaYsfb+r2LnWKD+7nzhUi9VgNA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek3f7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 04:59:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ab758aaaf3so114984391cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 21:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754283564; x=1754888364;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yeGhNT6CpWXNeXfNa1CkflGC25gJ2duSKHQEY7KN6SY=;
 b=SdeFyTDBgadzNSR02OUFIMOV98VE/oIsVSrVpaHSixy4FX4290WPlSXDSz+XdG6sCj
 3mymeFAkjCBcWz90ozqtBZWXcmIfnFed2Pimb5zN4kJX/gWxVudTJkd3xQyj1nUb63R5
 C2fLiHh4TIpWuEAEq3Az3H1NM9CSCLaD+QIddquNtX5H2vPeIYi6FS5FLjaCSj5D2O1C
 dqg+NSaOY8PPE2NqfiS62QSjmsSZgBmrRnXTEmrjz622Ph9tou8sJYZErBGlNyXUmgkl
 My5+td/SLVYls7plNkazyRoWteA3qHU3tfiQCF4E0W3NNnPntkERVnsimHgche5sRC+l
 08Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC2GVyd5NU1AJRujqhp+s72dWVMOkDv0UcLDjJ2oGIZI5+tRLttO+Z96RQrxrAOEKMJn51fhxhnz0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAbht0W6uXXsuckAhMlSzyzpQUq4iGMW1tCZGmcA0CsmLgNR72
 4hkOwh+BhDjnQg0d56H4s99uNJ+aNdKsH8QgC4EkWQ48gdqABEfY9KiMVGYXCb4l2xnyu4qIio+
 sln9xkhE+CEvqZdb30YGv6KtuliTEfRGwzkBUcVgcKn4YBt7/BJIWdm5kWYj4PwZIq1hoh64=
X-Gm-Gg: ASbGncsJgRhp+NGZmc9nOLE7ieCxeec9xY9FiOYQFaDeRfUqlJmZjQKa4TDaxRe+Mla
 mEVjy/hf7S3uvAfNfA1ZcAGvPl1Apx4gSUxMhhgDpKrJKQcdN0vsLcRK0+eS8563jbe7JHz7dK+
 wr/o186f10/+xhXpfi7xznt3KFiNu4FNQ4RoBfWwggvfxWH7xHyuYzVv2B86mpoZ9BBiNCiH5Ad
 5+CtobBYQWlPuVEmSzDG+d/QHSagWwAX4GqFKObw/KBDwsU+B5yVTYbEBBPcWlZ3lI3TSkToxzs
 puNsPMaH47PpNl+NH3vrq68m+YZ3o/x1PMmwayXR9mMOo9drG26e8oNL1W/IhezwkiaLO7JQTwa
 5CFC3p1dIC0cq4mRW+xkB9psRk0sgAJKnoSA8127VDDK7z5j/bkYZ
X-Received: by 2002:a05:622a:450:b0:4a9:cd88:2ce5 with SMTP id
 d75a77b69052e-4af10d09751mr121949721cf.43.1754283564352; 
 Sun, 03 Aug 2025 21:59:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmwHf8jvLAtm/gyRWNMuLZ9kuudQb+4jLxAHzs9hy9eB9XwniHX4P/UvGkhGHloFivD0TmCA==
X-Received: by 2002:a05:622a:450:b0:4a9:cd88:2ce5 with SMTP id
 d75a77b69052e-4af10d09751mr121949571cf.43.1754283563888; 
 Sun, 03 Aug 2025 21:59:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898beb4sm1514807e87.30.2025.08.03.21.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 21:59:23 -0700 (PDT)
Date: Mon, 4 Aug 2025 07:59:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] drm: Fix potential null pointer dereference issues in
 drm_managed.c
Message-ID: <lkpoiqz6crzief6exijz4khb5liptodcoo75hkvc6dqzacn2i3@uz2rekanykf4>
References: <20250804022021.78571-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804022021.78571-1-haoxiang_li2024@163.com>
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=68903e2d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=bfg20SR7mBSTREqmtXgA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAyMyBTYWx0ZWRfX88CeMLMzlLQv
 LHXpTKSdOvfuNz+dWqqYtM+g1YwHDCtuWCs5FlWl2rfo114HsaBM40u31K38TPOGUy6rGRH4ggv
 /QriJLyIgxqKAxCq6JVR48e36Y0KAWPYmDyYvHGQc+FJJILEmHEgLHW7ZsZJOOY4EmAgl7AZdwd
 jeHV2oglgQGSXSMHt2/qOUKm/QMNm1gbmeiT4sZUr2CuA1uw8uzSYek/LNLgFF1aYT+CajOaCIO
 ws095Nm7gsZ+UziqDbwItyeUCnM6HOAuDWpQqeXVLNjHq4r9nBLEMHs6XksaXXJxwBjuJ8iNqBQ
 vftsGxUD4A7VCtQ/V9uYk9vQ0W35R18db1fxjHf6bSWFeVUWgnrfyDv0Gd2/OfAq4xn06Zq0KN1
 EiREUbplGWSt3xLZ89MpyfsxfPOkvBEo0nAq8xjdbgs3903CfDFOwA9YKXl3mQARes+kmjD0
X-Proofpoint-ORIG-GUID: 6JvtqMOTqOFfge7eWpTXQNYDVB8kVvQS
X-Proofpoint-GUID: 6JvtqMOTqOFfge7eWpTXQNYDVB8kVvQS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_02,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=853 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040023
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

On Mon, Aug 04, 2025 at 10:20:21AM +0800, Haoxiang Li wrote:
> Add check for the return value of kstrdup_const() in drm_managed.c
> to prevent potential null pointer dereference.
> 
> Fixes: c6603c740e0e ("drm: add managed resources tied to drm_device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
> Changes in v2:
> - Modify a fix error. Thanks, Dmitry!
> ---
>  drivers/gpu/drm/drm_managed.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
