Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D45CB2F666
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 13:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E6C10E106;
	Thu, 21 Aug 2025 11:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CO4IqZYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E9710E106
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:21:51 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bMnV024499
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zonI9zf6V3fVEPfNtYwfqKy0
 ZS/GQ3VH3Sfpylh+OmU=; b=CO4IqZYJPlfAJVErHKpC2/oi7tq3LS7dJ7xyiha1
 EJdrRGUKno3AoK77n0wm7ZJ1zerKjWqcaeQ4kRA42l8XbTI5vhWlUMlxVj8f+unT
 YGMu/QQL6CAnj4CYWoJYIybqJug57vvMFMpqSB/sXPZYBxbmKe4fSUVYB5rU0bbc
 hwCinx4/cx+/r+ZR8fYwnpcQOacju5cENe7j2zZYAjPg/j2plHPdeE4RS9OGpImx
 0YKdlRlNTU9F7W5n2uISfaZshRcPYtcM7iYgkTDaiqr2RH2RIv8YAW5E3S6CVN0Q
 0TdNzPjViD14jSSr5lQl66fJc6skX/tuBgpn+87Ry5Wh1w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ad895-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:21:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70bc9937844so21374266d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 04:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755775310; x=1756380110;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zonI9zf6V3fVEPfNtYwfqKy0ZS/GQ3VH3Sfpylh+OmU=;
 b=E/frPffF+MhAsqDXjnn99s71r2zr0sNZtxAILYSJi4W4bl+u3cD1G+FsZULLATcP3H
 HPC0PFlnyC/WTz2G0p1tiKz37WtqmuRpyaHjcoutOMSgG4iqkPqmzFsjBOXkphSGeubG
 pwxl2VYSKfMqx86cDJCbJlTxmgcYfkcmC6RjizaV+2lbdYfiY25RX0YngbGD67wkiY2N
 LAYBOvXR2aNOCCtknleuriRlbJrf1bQotYiPM/gENzakO/P/4afIrcETe7Ev0Obr071o
 4wTUM2PbLB89T+XZJ+0xG0veu2OSexFXWk1oB5ZPNARKy9hK9KIUbeTYolj140N4FjmV
 2WKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpsErE15NTw1b8UJuwtakO/+e2Gr/id9vRjkBme5GgVw02EsBbnPa7Ws2NOfsuBcR1Hq64jEoSbrk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlYrhY6Bgvr+atmFNUA4uaD8AUVGD8BGO92qPbXY+PDuuWZolb
 GV7y/CJKXCIGcKRm+DJ+7LLlWcUfpdChxEg6uGDrLVex6kGZWH3VMflxcPCCVFJvPO3OaDpYdvC
 Y5YKwH7XZz0o4leXgdgEeq9CUKQkatreiKC38OAvW/pQAxXSS0i1XEQguQ3hIbQR+bYwpwOg=
X-Gm-Gg: ASbGncvMMKG3tE2E3suzdKVaHaLn2ezJs0inXiqJrE72sOMYQoAcbGP9ktjXuTudXI6
 u0j5/SXqsPDl1BnWjBkL45tfQsmoE9cvh0RgEnTsOMJrIkVHDtFrlSNQYvsaH+n5IeN7BkbIV0S
 pEXuIJsBpZ4iN1Lc7Zt1Y06xSqs4zpia+jo+MqUHH3WTU40JtzhV5V8iY4aaPerfQp10yChZvh3
 VKOXWwDTBL/w4sq3lMaSIdQ6w+EHN6BcC3yFSQ+FAsZ6Forc+GtgZ5KsNNLkPx0NCR08K4Tk6e2
 Q8DCczgXDY0Soe2Ut9fRL4PmhPRiiU7xNI6+MFKvihJPi0LkBl109Rc7Khfc3v0J1LLmNzxFQD3
 THdCKw03NR3pCS+hmAu33lxpfncxfeY9WXum9Kx5GKgHvuCJGrF40
X-Received: by 2002:a05:6214:2249:b0:70d:657:e6a5 with SMTP id
 6a1803df08f44-70d88fde89dmr18528556d6.47.1755775309786; 
 Thu, 21 Aug 2025 04:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF/C+D5ck8SnHsMpLfWrHvRO2/uQ1fp+kAA7zaA6wAh315PaUy9SeWMpDSUALjBQx2xcDCuA==
X-Received: by 2002:a05:6214:2249:b0:70d:657:e6a5 with SMTP id
 6a1803df08f44-70d88fde89dmr18528116d6.47.1755775309221; 
 Thu, 21 Aug 2025 04:21:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef36acffsm3000969e87.66.2025.08.21.04.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 04:21:48 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:21:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tests: modeset: Add drm connector
 atomic_[duplicate/destroy]_state
Message-ID: <nr5dbddxfr24c2g3ybq3pkg45krjlqrs3wjovaglu75ofvz6r4@q4qdfg76ngvr>
References: <20250811063403.98739-1-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811063403.98739-1-xiaolei.wang@windriver.com>
X-Proofpoint-ORIG-GUID: E5Pnw2rO9kglwMp7LCFRMYsGsVrzFpXB
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a7014f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8 a=r0MfjTZIDPvKbUZ3oGwA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: E5Pnw2rO9kglwMp7LCFRMYsGsVrzFpXB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2v68c1sG+MVN
 gxYIImRo3H/vUflTsZ8+7BSlAqDN7QgKZ92nUSkGds49/VWkpkUoF+dxazQ1c/QFpoJtljF4W1v
 ygfhXxrU7T/PpscZQm+8CXwddbBe8n0O94qU5ky+zrk8ZxsuzJ/mqmMoFtq9+8iw34A3PWTw5eq
 B1uMmOPgrFeZ5987SV9Qw/mcihAV+pRVFOu2joLqHcnzKxbKpZskqZoJjghovOZEcv1Fv7jOaMO
 M8VXDkv5AUwa35UdXSkP7OwHVUAhF9tqxyjVo4TvLRZGeNydyx2XebhdZeEN1GeWqiEi7bisX/+
 aPkce48yNn3eWBMm1gcIyowY9GoumMANbhvlRZkwLajaCZaiE41T+2zcs7AGDTF2mWYqE8EGGaM
 uM0mr+4sXcPax2xV4mq9o3/p3uXL5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Mon, Aug 11, 2025 at 02:34:03PM +0800, Xiaolei Wang wrote:
> Commit 66671944e176 ("drm/tests: helpers: Add atomic helpers")
> added the atomic state path, so adding the drm connector
> atomic_[duplicate/destroy]_state is also necessary.
> 
> WARNING: CPU: 0 PID: 96 at drivers/gpu/drm/drm_connector.c:234 drm_connector_init_only+0x934/0xee0
>  Call trace:
>   drm_connector_init_only+0x934/0xee0 (P)
>   drmm_connector_init+0xe0/0x1b0
>   drm_client_modeset_test_init+0x290/0x534
>   kunit_try_run_case+0x110/0x3b4
>   kunit_generic_run_threadfn_adapter+0x80/0xec
>   kthread+0x3b8/0x6c0
>   ret_from_fork+0x10/0x20
> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/gpu/drm/tests/drm_client_modeset_test.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Fixes: 66671944e176 ("drm/tests: helpers: Add atomic helpers")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
