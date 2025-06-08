Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84F3AD11F1
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 13:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78BA10E1D0;
	Sun,  8 Jun 2025 11:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDO/6iO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (unknown [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1770D10E1DA
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 11:43:38 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558Bd6ng023598
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 11:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KTYnpnxP2jDpRXwJfnn4X1n+
 ANjLC5E6uu5I3qOiUUA=; b=aDO/6iO+EV0Qu9gsE9AHLjjhV1BHkuPYR5N4vWnO
 7Nt7rnWHQa2v5niBYHf1HWgOvRUxlAnqxx9oXBdxOIdsIcPmx4GAB++AgUDX96Wm
 0hgP5DthfTkYulikj+KQWgl77AHcEhV1JJTpjlT2Gqv15Pjb1j6htpST+44r5SQy
 il+Y0CPp/zvWitCAvgeM7wvdd7T9Iesdg5xJLB7FF3ex55i/Dc0qm6HU27WUtUsD
 548nA2kJuvCHkg3MVRwJe9zXxNj5ZP5J6SSRD7bjBtO5qLbYdyMxaZi3LMk0nifU
 jf5mwZslDcT98azHv2XbZyMkigiPJ231QeqMn8D7cUaEMg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dt9jpya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 11:43:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c9305d29abso654257385a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 04:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749383006; x=1749987806;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KTYnpnxP2jDpRXwJfnn4X1n+ANjLC5E6uu5I3qOiUUA=;
 b=H28RRUzHuJqslh+4YnvLDTcxAE0LYN6LjzWmbdKoMGyw7W5z7o5UWSlmmgk3yLi77l
 xGLnBoW7RhSue3UyR1Eq00Lc1O7hklwAZNgzqe9FHpVOid8rZ54lghT3HbFvfPIVTEbj
 BA/g/0AnoYmbDhq4VaiwbmXqX5qsr9+qFzDRNjPozqTY41WSctKqvEFRo7ms7SQophNB
 ZOVRXz4ZET7vgRM/m2g/T/32cPtPSdk4hPJjJIfexhz2v8epNPZB4vYnm/W95r6Kanqy
 aNbCWDzpmjk0bnnKUKcXB/xkvxxpv7HtnmdA0I1VJJBgYtJlxCyrUYmA3lIYNyu7clGe
 pXkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSBB3k4VgbejdDwCd2iciTr/AAp1rHAQ7gGORpgb28D7/INsA8bGBU9QrgxssPdkPLStMsGqCEoYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPe3rHCMv1NKqT7KmkIvY9TYXW15DcY/JgWRy4fuGCGkuIQfc6
 kR1g4MEgcir0HB5a6Sfxz5IhYmGOT/VgM2P9czPiz55oB+qM7Gj1dOTSQF9I4aoRimctQXZ6AXY
 mvColSOQDa5rYifRnOjrzhWfw1LKX8afCA4aIImlDvhf99+3ByqU9hea22Tw5Uy4ZIc8RI1w=
X-Gm-Gg: ASbGncvdyHxpZJAecdWvNMip1z3WZdg1/OuWQRaV+Der+kUkWM6KKQ+2S+L7y9OmHZF
 sBumSYt/5Mt4MrmUAduCZxh/djmxNDhj8pduEEvxdGMh3fa5YhsWWR7rpmbLTazZ2qwvGW5xFsc
 0I67BCH5KCTIsuYuyChv1f36BWP/Ml1VK6oUyUA2tJ8jehEDc0QfAyygZbfSilHOjYO/yfmuYxC
 z48ZWocV/07Aj8NMDpS8hEEWg7NBtaarL7kVccFM3eeMR8XCndX0l6zF6GTb9lRvOuMvG5sM1h+
 IiWVVcCPwb960EVJRiTvV81ZXJsWv7yelnzYQ3tcHCVX/3sFsOBpH0W+K59pBEcaeU0XGGwfBwU
 ClAmH3b6rBA==
X-Received: by 2002:a05:620a:488a:b0:7c7:a5b7:b288 with SMTP id
 af79cd13be357-7d22986ea6amr1667821885a.19.1749383006144; 
 Sun, 08 Jun 2025 04:43:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx/EpAODosk83tulqFuHuiVq5dUCTu3lISRNpkj+6RBz25vmWkLHW7LWuHxX4phMvcGJfeXw==
X-Received: by 2002:a05:620a:488a:b0:7c7:a5b7:b288 with SMTP id
 af79cd13be357-7d22986ea6amr1667817885a.19.1749383005732; 
 Sun, 08 Jun 2025 04:43:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772a22csm753989e87.144.2025.06.08.04.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 04:43:24 -0700 (PDT)
Date: Sun, 8 Jun 2025 14:43:22 +0300
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
Subject: Re: [PATCH drm-dp 03/10] drm/hisilicon/hibmc: fix irq_request()'s
 irq name variable is local
Message-ID: <oof3yrny3x5vglnjvcsz6brpn2a4l2nkmpepnykojqquytfj56@vz5sk7coojhw>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-4-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530095432.1206966-4-shiyongbang@huawei.com>
X-Authority-Analysis: v=2.4 cv=KpNN2XWN c=1 sm=1 tr=0 ts=6845775e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=OipRdqZyLDe-kEwkaogA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: L-k-Ow4L1J_eS5aeGfiumhTYwDlz6Nn6
X-Proofpoint-ORIG-GUID: L-k-Ow4L1J_eS5aeGfiumhTYwDlz6Nn6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDA5MSBTYWx0ZWRfX8dSjYrST7R5D
 8wMC8P7PIPqpPp34toHd1V2p5PRHlBwUfXA44zxQwe5nFYHjRrCvJiWOFFNHrvRgGdl5WrILjJ+
 VMuYo+5Lo84k0FmUkUyZ0IEBvUZqujDqQANQBolFvFv313G9kRBZvodeJ7J5IcJLQ29E4s0bkt2
 v94hOi+DYClqz8aqlm9/Q4KTKpyZs3kk/l60+/Pq6aqVaurVcZ4RSDo32dOHf5p4GxX/eyUivNi
 hhTLWZN9Owtx4WfAEIFR6DV8N39S0tfl0Jn6ssaC0wKxs2hCAHDNti3B6ygRQKFjknAmY9l7yBA
 kIgZU4e7jtaqThY2sad8U7vFICGViTkSJxc0oaWE8GosG6BRKhCtLCHoMwRZn7bkw/fWw8p2fOb
 IGSN1byCXz/KSzqyRD6KhSuVyelpiyStTJ4OQ2ZGobVATNMQ2/TChZIcZTTlwCrLIAn0M4ZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080091
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

On Fri, May 30, 2025 at 05:54:25PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> The local variable of irq name is passed to devm_request_threaded_irq(),
> which will make request_irq failed. Using the global irq name instead
> of it to fix.

This doesn't explain, why does it fail and which IRQ name is actually
expected.

> 
> Fixes: b11bc1ae4658 ("drm/hisilicon/hibmc: Add MSI irq getting and requesting for HPD")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 768b97f9e74a..4cdcc34070ee 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -32,7 +32,7 @@
>  
>  DEFINE_DRM_GEM_FOPS(hibmc_fops);
>  
> -static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "vblank", "hpd" };
> +static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "hibmc-vblank", "hibmc-hpd" };

Please point to the corresponding IRQ names as currently implemented in
the upstream kernel.

>  
>  static irqreturn_t hibmc_interrupt(int irq, void *arg)
>  {

-- 
With best wishes
Dmitry
