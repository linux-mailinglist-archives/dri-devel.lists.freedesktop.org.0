Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C74AC2CB9
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 02:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA9A10E1DA;
	Sat, 24 May 2025 00:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdVRH3BP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A234B10E1DA
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 00:30:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NEGXgs001723
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 00:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eEQ/PXH4AzQrHKjfA3QpTYWm
 6wGaPSgM0A0/Bd20mB8=; b=TdVRH3BPR7B96ouPZ/pQtvICwrM5TbgFYqucqn7h
 gvyTBCH48DHxE6qZpF48pBY9Y03uz9ezPILLBxX0OM+sMG5PjnVQOYVBXUqix1Y2
 9bMUGQK+3BxuIL+oXxfeQhMtDwzdrU7zXYKXbhQ0qUYbvAbDsztQcrBBC8thRLIF
 CxkE/obS0dwWd1eCriYRKnwYbO6RFRMavupMDKKa3ex0W7PozGUghSCtUcrYTHjt
 UAwFX6NSZn+fQTCCAQJVL5BVr8ohg/jEZ6T1SYu1hJrzUDX0HmlzJVL9XNMlTZ3X
 AQT9OsSENqCnFI0Hh/oO+gOJXus/CFUFlqi/NxRanuyVeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf73afy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 00:30:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5e2a31f75so114504085a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 17:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748046626; x=1748651426;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eEQ/PXH4AzQrHKjfA3QpTYWm6wGaPSgM0A0/Bd20mB8=;
 b=xL8T7Nh4+MBcnnJsMeSzi0ro8/8ZtmqTcTv4QxXCc364bfRYfpyrbojqNKKlpg4CGl
 lcQb6j2cevHKWjz5Cau0hB7lFcJ5/J4ng3pC3u/CHqNRmAVQ1DWw8gqwmPRnge5a4ljE
 1JU9fnOMBW6pmMhnQFMvrjkRjm0syshZYktuzZVBGUmrvWmQkXlu/QXd3YVSFdzHnszB
 iB1eC1Py5FDaibp+2bWr3VskVY3LwTQ+qJi9MqpcfNUVft11Ll23U8UEmGo9R27ycLaA
 MhklEE5LdWfw5mBzkU5qccFtT6A44ze2ZJokL3EsaSSOUcMboZq0bPgEBzlDVRQZySP3
 GOpQ==
X-Gm-Message-State: AOJu0YzNNV4zH7UkItTIWzDmUyNk9NY9v40gb1L8snPvDIoK2KtlmFhh
 8RYVEZkNHeQw2DQ6593B7DltrrHamgMi9Ov1b62TU9NQgat6mRLvykn8hXAH1bL3FUWIiigfoa/
 iV7ZwR4OMiy8MUBNSlAvO6ZMNe2zfHjCMHm3Rc970+fzB1nE1ilFcuT9qhUQKAvWPb79D3cs=
X-Gm-Gg: ASbGncu4F9ZoGwZZMUPQYOWAhWp1cJfyZmqAhePR+ElbkGZvR0n4DzeUpRM7LLQZlDf
 9kr/IEJWtMn0GMcivZmDVEVurTrHKg2duwORTQGuasR7mHcAm74tn5iErEXoRJ7nVfmEs9nAZ40
 FD/mrWN03khaV3oCWkwRNmNOn3j/QaDeGFHSxG09O4lEuvQ+FQh7JnUNWL9F7ykoUHokILTzING
 rsnIq5LOUI4CFQ38jG0KBadxQunjzc9pxdV5qyLr/Bvrc2SOGEyzoB7+YseBz9hHs4Kd6uxvFEH
 y0GbMku7pS53/K28QVF8kPigU+WFuGDZQLsT6evW4sHWFFb75NuXRFAkkbm9EuIYNsY1gQ/vS6s
 =
X-Received: by 2002:a05:6214:764:b0:6f5:f4a:a3f6 with SMTP id
 6a1803df08f44-6fa9d2c800cmr26783176d6.27.1748046626349; 
 Fri, 23 May 2025 17:30:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmYI/l7G5xtZG9kstE0qO/gA9/duv04IAkLDk+Q4M6A2rLCetKsnbEjeA4uAr/a/57JKlCbw==
X-Received: by 2002:a05:6214:764:b0:6f5:f4a:a3f6 with SMTP id
 6a1803df08f44-6fa9d2c800cmr26782916d6.27.1748046626026; 
 Fri, 23 May 2025 17:30:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e7017736sm4151153e87.131.2025.05.23.17.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 17:30:25 -0700 (PDT)
Date: Sat, 24 May 2025 03:30:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/connector: move HDR sink metadata to display info
Message-ID: <k4vbzomlwbirprhxxyxegwv7u6g66vyqeqefqogz7hqd75rwrq@7yv7rgsvohio>
References: <20250519112900.1383997-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519112900.1383997-1-jani.nikula@intel.com>
X-Proofpoint-GUID: GzLQuIx3HxUDrzqvjjuuTcXEBlVRPWdi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDAwMyBTYWx0ZWRfX/j0ZsPJu7/F3
 iH0odKBpI13Ctm74QoyoJl4H1QwuZd5k7Xc9tdv+YA2yGW9RFDWPQRRzGMJ4ENSypsisWuneEyC
 Pb7U076l1++fWkWNeTo6DyqgkhaRXxhpSOOfUcngGNxOqP8OP4DJDupi42X5pf9luIKtvFi/GcH
 DV0NJinkcmgqunG6Ir+Ateo8Ln7k3x5odZby9NXRHyEpo7yD20Ui045BXJSrRkh3OfV+htW/9z6
 Qrmeby9lpuH7tVkBISZvEkdIK3UzOFkxuv14p7n91rsQvLhXM5dQVZIFDXfzkEihV6amRFFvwpU
 JcQB8TQDkZ1L6mHC4YuX8o8NhRRvuwpaPU3GRFIxSf6KBDd6dvH10C847Mr3CcMcR4vkontcnwI
 4FqfmWm06uHCFrowoz1Uo3kvVN+DFjcoXQkS5K4CbCEX5XjhFkvIkuxtyGCsW8BrtoXw6whQ
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=68311323 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=eTiSQVBF0D9Q57cMN4AA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: GzLQuIx3HxUDrzqvjjuuTcXEBlVRPWdi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240003
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

On Mon, May 19, 2025 at 02:29:00PM +0300, Jani Nikula wrote:
> Information parsed from the display EDID should be stored in display
> info. Move HDR sink metadata there.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> This depends on commit 6692dbc15e5e ("drm/edid: fixed the bug that hdr
> metadata was not reset") in drm-misc-fixes. Will need to wait for
> backmerge.
> ---
>  drivers/gpu/drm/display/drm_hdmi_helper.c     |  2 +-
>  drivers/gpu/drm/drm_connector.c               |  2 +-
>  drivers/gpu/drm/drm_edid.c                    | 19 ++++++++++---------
>  .../drm/i915/display/intel_dp_aux_backlight.c |  2 +-
>  include/drm/drm_connector.h                   |  8 +++++---
>  5 files changed, 18 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
