Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5D4AEC938
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 19:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDEB10E1AD;
	Sat, 28 Jun 2025 17:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JospkXMp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990E710E1AD
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:06:22 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SFwuBw022729
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=P/7DJz4qD1Ux/n9rrB+wA0uP
 GBpbdiTVQsKaqfj2rGc=; b=JospkXMpyIlPFwWh11b2rCrbiWJgCA9AoqwlmqS6
 VIWd8Ooe5RuovkHuHuInLkwdyx3ARLi7eI+a6qCWMzOf4bvJI71CfOQit2RISwn4
 GAoLrGRmic3FC6j3rtXsCycNmJ0goUwuRzpUqDhPc/3W0QIXGI0MqRVskfJwe+vL
 c2taf0lT85hnsqK7ItQFE05xsRyrcdWH45X3aHXK+olnJNUkdFqbLXRD71bZm6oF
 Oa83ZcoPpwzUaBdHg/6ROfHvZJIspPhHYg4FSuTCMyLjvptmow/2FZkl+5qqTylV
 fF7DL4IDCu9KZQQj+9PwyFJQ9RURnKTzOHbweUFgjL+bTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k13wv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:06:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d399065d55so427036785a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 10:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751130374; x=1751735174;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P/7DJz4qD1Ux/n9rrB+wA0uPGBpbdiTVQsKaqfj2rGc=;
 b=OedASSihrC9avILixpCZq/qFKlxfuXHbbF8XpM/WKK624fnJyhlJHoJ/L/jEXDJ5Kk
 +Q4Wl2qRV81WjKK622h+nskRtW6oe4DyVpjIFRb/Ljj8lRGv6mwIZoLA+AuL/NzoiZVR
 PTSVfGSvjLQ385R6uyI7+iMnq08Bmx+grRLg24LWEtRQ5h/6WD/DY9E0IMBWZslbbT42
 IrNBXGoy7sEY04vyRWXWUn4oXw13TLlghY3Dqx3ZDIAGABiXgBcgOsKB981IbwRXhdP3
 p8007KRhDEpopxNQ97apY8xQoeT1UXtNCXIxVz48TUaF/6DNlcvtRTamXAy+PX2bkgxb
 KmPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh1Z5vqJtXN7Np6gk72wl2up+6ROWKL0P9k46SMC7T2xySPVdNRtMssUpP+xVCr8MPYmvnKdxJYy8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySN8r+gX5ybBZcqNWZt0aGIzq6ZJp7GCktSb0arhMm2VXPkeg/
 2ZxmQzGcwP1f545P0DwyMe0QDhvlbf+asfmg4XhX3AiPU/G1bo0slMMJK3DLL/qaCXkN8aR7vSD
 vQuWoMHDPgVxm0OnrD39aQQszm2mLp0mSrm9f4b0JpKASmIfvaEytJX97wAcItI41RYUixZ4=
X-Gm-Gg: ASbGncv/ww+u0P5n5WSKxLSUHe/37CZrayxPMdorp6FCn6jqFgDKsVFfVw5h7vEPgIw
 Yp/Rl/pYH8ZBYfidWag7/IfvPTSD0fed1HNs7rP99BIJ0RIZQDwC0MkrluAm5/o3/gJ5wkcCOnD
 tv79YiCn9pstF0jXJOBIkxUKi+cHUdlFECaSF3dW3a7gIzVWgAGfDMtvgtvme31QE2BrH1LQVU2
 QWSPjzQOljsq2xCpC4wHcBHoHRXEsTu5p2PhzKVNhnSqTQxppTAFX+1ygI5b7EaWlMOMajmeJno
 T55dKMWyl5TKpWbIZFOKvoAVkC6G7y0DTIkfcIiURUSVl98h/Y12a/31Of5wMZP2CmBhO/QhhS4
 Gcl+BrSQJdFTxslhmEpyaqhp+cbKLevtW1vk=
X-Received: by 2002:a05:620a:2a02:b0:7d0:9847:ff06 with SMTP id
 af79cd13be357-7d4439a4f72mr926784385a.57.1751130374093; 
 Sat, 28 Jun 2025 10:06:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyWnKOkc8ihmFUbXaoFULP01ull831r7hPeYyszUBXGvTvhS6NFoZSzzvvawSodHDNRCfOrA==
X-Received: by 2002:a05:620a:2a02:b0:7d0:9847:ff06 with SMTP id
 af79cd13be357-7d4439a4f72mr926779185a.57.1751130373556; 
 Sat, 28 Jun 2025 10:06:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2d9cc1sm860337e87.213.2025.06.28.10.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 10:06:12 -0700 (PDT)
Date: Sat, 28 Jun 2025 20:06:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 07/10] drm/hisilicon/hibmc: fix dp and vga
 cannot show together
Message-ID: <7mgk3hueodkzodedjxpkzpf2b4x2n3fdqi42lmtsgozlaxv2tc@4cx7nb5pg7tb>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-8-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093104.2016196-8-shiyongbang@huawei.com>
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68602107 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=1_qZpLKbntRvsT6nxJwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE0MyBTYWx0ZWRfX6Flsqyzjy19i
 1IKsX2EeVTJBq+hlJ+gMYz+mM0qkPA9tuXUb97v+hyFNgLQObkQpAX6oTjkSKmHFNgv+nOJB43h
 KwOF3noHAnQg4pbm6lb2ShEwdI0yWbNWOqGgmIUzd3NZowd1Zzl29gQzAwSlgYasWDlQUv7VwI9
 Lf1nLxWbnaJQTmPUChSM6Kg7gXxOQXSV+jLqVYXwXGEklT5c+lKIeJ0ubQCU3O1AC8xrlfdVSZp
 +hw6iBSi+XQF6u6EZv8loCyZjKdrW/fYG6dJVD921sTH9ylnil+RiumHo+xJLlmSLfBKpGiOrw7
 ERIeppO/OM0+cpxrTdk661Iox9F59SdS1MQ4FbebxbBvsjE8bT0ZgX3c2NDgYapyFQ3J9nm3hMB
 zLYKQUT+GPR3Z1S2LrAIDhrOBcPrlpR7s1tfWvemPJPUtCWd6JDkzZxngRdHdsZ39PfBrkpT
X-Proofpoint-ORIG-GUID: GICTKBYerqC-61U9UbCbDqgSryhbwaL4
X-Proofpoint-GUID: GICTKBYerqC-61U9UbCbDqgSryhbwaL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=776 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280143
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

On Fri, Jun 20, 2025 at 05:31:01PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> If VGA and DP connected together, there will be only one can get crtc.
> Add encoder possible_clones to support two connectors enable.
> 
> Fixes: 0ab6ea261c1f ("drm/hisilicon/hibmc: add dp module in hibmc")
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - don't tie VGA and DP status, suggested by Dmitry Baryshkov.
>   - use crtc clone to let 2 connectors can display simultaneous

How does this help? I had an impression that your hw can actually
display only either to DP or to VGA. Can it send the same (aka cloned)
video stream to both connectors at the same time?

> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

-- 
With best wishes
Dmitry
