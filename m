Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48EDA94E2D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 10:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095CC10E16F;
	Mon, 21 Apr 2025 08:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhU2q7K+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C95610E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:38:52 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KMU2UI016032
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ax4toDTbfRew2W1ICEa9lIo8
 jWxUgyyjE5FmJLig2p4=; b=mhU2q7K+FNgdKXEFmaZ4R/muJD4mgBJpHgcj6HtW
 yCoqqxIyoqAqD+ymHBhjMkWAvhahHWO+Xa1a1D2bXFL7PUF427kMMIB6soLeYBIE
 SIWeDHdcW9yK+lVhQMo4++ZbkxcZw6SdNh1ipVilEhB5XBCM1JXyIa/QhSXKYt4z
 taZJL1NzvFnUP9IWA7XgBLE8bg8NMEafsHeorssxfU2gv8E0ZRWXnjHKsTmN3g41
 3H3wIxAVX9m43dYhnCsS6mI8IkyVuhJ3DjQuvutC4uzTwMPCtSdVTbuWM8BDr5cT
 0i42wS5GhC8Br761eEmU9xmAqONlxferBMx/CSURFAqGqw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643wwknhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:38:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8f9057432so78735676d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 01:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745224730; x=1745829530;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ax4toDTbfRew2W1ICEa9lIo8jWxUgyyjE5FmJLig2p4=;
 b=T1wnR8KTB9RFm0BhJjtcA0oIgO2YJPFORj+fmcVK4bDHzwNIQdhd5W7Pvk+72BAPnL
 qfGWDhjSx+QYEd6d3CYgInl0MxUkCs4tdWIpZR3upOD3Yni1/XA//WFPyR7qQ+C4RrnG
 b4mk8TNiXgUeZwLG9r0pKfGSpNWGsGKRCQsVNq7MSYGaXOrCO4Q8kjwvvrnjqwEK82kH
 t4/Cbf12U7mHZ+jQ67oxyb/YITMhLrKb0S4WQixE1znSbqpK9an0hyZ/k+drE7AhllwS
 NUtNWaletwWCO9rjnf2c8ohbsCYPiqWl5UsDFMNkrxpep+62fUNe+IX5nVBKOg8oomt/
 8wCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ70SrEORz2sS5GtlgvViB2GRo7yS4ZS/3r/yCPc0aXCI/R9211pg8IMEfh4Ju6hNRCat9YXJgSu4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4rZK8gsD1mwuvCu9N6eL0Tc+7tYEo/OX9R+/UXlapvO041FTv
 wx3AXpCPqbB1ESb1cDxBzrJsXY7bSl2UHctD8+OglinaT9Nm/xbERZqRwWQmByBFHB7Z/dGKbq9
 rpha1Dt/GDeIOJKUEKnGTBNSWDIiyAkV0zJ66JbMOQ1oVnH6LhIQxsn/NVr+cYH6WpDI=
X-Gm-Gg: ASbGnctebKUpEzInLa1pTmIJzSCDg+37PSi13U6WZN1X9KK5pduco1R/kk3KRowZFwH
 0/trUKwU7vU2DdMoTwpHWbAadgAEllMPdxNw6MLOUVQfhfWkk1O1iiefq0n+0GCGZQn7RWgxhuE
 qxRV39u8H9PQUPnTRkeznwrdBz3Vf7sRnrsJqB6hVaMlVtH8DlCAOUZ1rCELEe2w2+GNpeU9Wbo
 ngJU3hWxB+CUqeEuTLAo+CPIszoZ2zSGp2GCv7i51+al8XFc9Csa9HGDREpzVT75zPyzqZVRukE
 6LNEPs4LMGOaeoWQPtn8sDrFk3hdYyY/DqUdraQi0kv29seVwTh+7hJIBbfxn5RI+p9FgYnvPIw
 =
X-Received: by 2002:ad4:5f8e:0:b0:6e8:fa38:46aa with SMTP id
 6a1803df08f44-6f2c46527b9mr206777816d6.33.1745224730319; 
 Mon, 21 Apr 2025 01:38:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF40++SY6SyUhHgwohwJQP/ezAB2infSDy3w/t56HhaTqCSHraLVTK/mrG5s/kw5dQ9HIHYIg==
X-Received: by 2002:ad4:5f8e:0:b0:6e8:fa38:46aa with SMTP id
 6a1803df08f44-6f2c46527b9mr206777386d6.33.1745224729825; 
 Mon, 21 Apr 2025 01:38:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-310907a68c3sm11769241fa.50.2025.04.21.01.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 01:38:48 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:38:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Don't create Python bytecode when building the
 kernel
Message-ID: <4k2arpghozy5fjrjove6nrh24qth3yp4educuso4y47gk7gycd@ol27dzrba55d>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744789777.git.mchehab+huawei@kernel.org>
X-Authority-Analysis: v=2.4 cv=IpEecK/g c=1 sm=1 tr=0 ts=6806041b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=gjwTPFk3WlCVuFmdJm8A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: DS5DvoCt1X-F0TMwsWbFJxHqYyv20yZ7
X-Proofpoint-ORIG-GUID: DS5DvoCt1X-F0TMwsWbFJxHqYyv20yZ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210066
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

On Wed, Apr 16, 2025 at 03:51:03PM +0800, Mauro Carvalho Chehab wrote:
> 
> As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
> when W=1. Due to Python's normal behavior, its JIT compiler will create
> a bytecode and store it under scripts/lib/*/__pycache__. 
> 
> As one may be using O= and even having the sources on a read-only mount
> point, disable its creation during build time.

Would it be possible to properly support O= and create pyc / pycache
inside the object/output dir?

> 
> This only solves half of the issue though, as one may be manually running
> the script by hand, without asking Python to not store any bytecode.
> This should be OK, but afterwards, git status will list the __pycache__ as
> not committed. To prevent that, add *.pyc to .gitignore.
> 
> ---
> 
> v3:
>  - changed the order of PYTHONDONTBYTECODE;
>  - patched also scripts/Makefile
> 
> Mauro Carvalho Chehab (2):
>   scripts/kernel-doc.py: don't create *.pyc files
>   .gitignore: ignore Python compiled bytecode
> 
>  .gitignore                    | 1 +
>  drivers/gpu/drm/Makefile      | 2 +-
>  drivers/gpu/drm/i915/Makefile | 2 +-
>  include/drm/Makefile          | 2 +-
>  scripts/Makefile.build        | 2 +-
>  scripts/find-unused-docs.sh   | 2 +-
>  6 files changed, 6 insertions(+), 5 deletions(-)
> 
> -- 
> 2.49.0
> 
> 

-- 
With best wishes
Dmitry
