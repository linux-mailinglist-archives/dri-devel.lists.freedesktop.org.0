Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 632BAB19CC7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 09:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C1B10E13C;
	Mon,  4 Aug 2025 07:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzaC4u9X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5A110E13C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 07:38:36 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573NeVF8027684
 for <dri-devel@lists.freedesktop.org>; Mon, 4 Aug 2025 07:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dLPEHMpuSUAhkcXckF10EsuO
 FuqVVkiNf5aJcVkK9Gc=; b=NzaC4u9XYQQcdeh8y8Z9fbooOl/YVEfzubRQLzvq
 8g9yemhfBM+Vm0JLP2QVelbpu88n9X6qCSYEX6mvn3rSHDLgshQvOzkoXNl7xaFG
 WC911Qz67X66ltgYSJEqRVDEFnDCOCB4MwjdYONGULTwLHNpJqepZ49nHNZBzbvt
 lxk8i7kz7kuby6ucbpMkOqjJfMVd3V2jVDj4N7OlmKI1SRNCn1jE273ioJLBpKD0
 gCphCMOsS8VbxHmNwPs6xnvfl8tgrlZnt1Hwp8Aj9vZxY1a5QPQwnqaYvsBmTbGB
 FYQPYWfPjud9if7O3f2MkFPGTpc/K8sBqci5n2E00GilWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqkupm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 07:38:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e696444d0cso388561785a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 00:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754293115; x=1754897915;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dLPEHMpuSUAhkcXckF10EsuOFuqVVkiNf5aJcVkK9Gc=;
 b=HHp+Sfk+XHbnDnoAY6dxoA/VOFCKRAcYJeWlxMyYIZhZaqNByL+QG67/VFux/ri1Fr
 MuDV1GvuanvoGa7+JXKTMdIechtw7F4uOIthWsE0jbKMEBCl+bjCYiK4XFbqsxJii06J
 RRz17WbBPXHF86Ox1G6/Cm9O28lUFQNmYcYBmgFRq3nkdH5zwTkYy2v7T5O5FlBzR3IU
 iS0agLZuEgnwB76JW7o5YQtSKmmJHNvVEPFpO6lsaHa02FZmOc5RyEXegEDr+eX9djZH
 f7gPSKKEqvf538FXaqn2y1WQ9xF1sraxH0rLQnupoo1dPSWzkY65/t7z4gY3A2CakMZX
 GkSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVoC1w25lnZBhbL9i3WFl79zyaVnVhT8gh8cryv6iqr8wtHC6HdtXOoCr45HJkAbMq/TvxL9omPv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5++wGCE+ALfa650tAIN9t/Uws/w57Y/6Vo9p2fwXQppOsfKDu
 iEvBX6+1f8hykVqCyPYWyGSbchT7B52SBDNect6O7jNIXxUF8IpMMVviBZ1XOTFg82ZXTUDyQ6y
 axefh1KhAPTcqr6ud9LRDny7AMA8f46ocdv/vPL2Fy2OY2P/GILZdGYK+sPvMsPMlPXzcNic=
X-Gm-Gg: ASbGncskAg1EU/0VvgZyozDQ3YseUYun4tusppHl0uRQ+GdK9NpLcum/ABotsbKHpYX
 K3UNT0NjrrOg6HktAarvGlI81bZIZM2zFQpFrnwSg5HisANIDrOxQ34QFj9FA7GZAU+hSvMbbfP
 T5bl7PADq1lxa/xG1xMojQVmYKinarPpprW8AQcRQUouNLz4Ubj30NdzFC2xM0XgMLR90YXNKOL
 4gb+HEPFxNGyyVmoiday9is0THWaV0XMbGWg0W7VifOdTRl2jXRgFixdkm08BBKo8mcldtW+xts
 8J6Hn4E2xRaxQf/Evv5+MO808XYQL7q5GnC4rH3ZA6K/BtQC0589xQ8rKHP8gajPlE0dfXeedHb
 KPxBCrbV9rrXqR/UfH7gJNUvI0m46gVsI6BKpW/7w+A6rf9YTqncP
X-Received: by 2002:a05:620a:a01a:b0:7e0:2c05:6ba1 with SMTP id
 af79cd13be357-7e695e8a0d7mr1113352085a.0.1754293114802; 
 Mon, 04 Aug 2025 00:38:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbAIeDchoIpgIbJ3YOHJ8cPnw+3eT6oKOooZ+5+kJViLlpccUv6LJV8vEUOdsgTMkDrMUecg==
X-Received: by 2002:a05:620a:a01a:b0:7e0:2c05:6ba1 with SMTP id
 af79cd13be357-7e695e8a0d7mr1113350285a.0.1754293114341; 
 Mon, 04 Aug 2025 00:38:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88cb22casm1551921e87.167.2025.08.04.00.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 00:38:33 -0700 (PDT)
Date: Mon, 4 Aug 2025 10:38:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: simona@ffwll.ch, sfr@canb.auug.org.au, airlied@gmail.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Describe the newly introduced drm_connector
 parameter for drm_bridge_detect
Message-ID: <zzvczsirgb7inxtdr2sigsyjejxzd6cx2otdq5ugapbafw4zzl@fvxevtwepiz4>
References: <20250716125602.3166573-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716125602.3166573-1-andyshrk@163.com>
X-Proofpoint-GUID: EfFszbXLzJ76oFDxxshDlMYP_IQICHm8
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=6890637c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=qBLgyY_kGNq-VcCgTqsA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAzOSBTYWx0ZWRfXx7fMXZBbXHBL
 BiLX9iKqeUCPgB/kB/Vs93V02HiI1ok91GNdi9FjiMrlncSZGVLjCoPioyQHQqoQVb1xTRFxkyq
 Mtc0a6+ry/RS4gt68Abc9Ebh+7EVZ5Lo5tRM0Kc4uua2H+Exy4XwvhOy/kt55ZMGDVi5bF12lnK
 8zw3zG+oWC9yJzdI/wQnjO6RZcgvQ06+ZE+bEr3eoQnZi8GkGVk1Kj+tQu1/mTVihT/QLUn1Y3S
 OjbQTRd8fQDHJLzF/a10TBIfIHOhEuLFsxBji610FjASDQ6WQPMYGZkyE4kpOEiaaPOYtDhwiTD
 e4FT32LzIWAKrlAG55hccc+sh/JKom31I9uTyfz2TFm33VNtnemH1M8PZi3zNd2hz+zOxc8bSUe
 PhbSj9r1/rMl/zSUrXbwxw3Ay1C0Y/IRaODrJ03Y/JPYETM+9/fUV1Ne1/5AYszaeTLmO2ei
X-Proofpoint-ORIG-GUID: EfFszbXLzJ76oFDxxshDlMYP_IQICHm8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=998 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040039
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

On Wed, Jul 16, 2025 at 08:55:55PM +0800, Andy Yan wrote:
> This fix the make htmldocs warnings:
> drivers/gpu/drm/drm_bridge.c:1242: warning: Function parameter or struct
> member 'connector' not described in 'drm_bridge_detect'
> 
> Fixes: 5d156a9c3d5e ("drm/bridge: Pass down connector to drm bridge detect hook")
> Signed-off-by: Andy Yan <andyshrk@163.com>
> ---
> 
>  drivers/gpu/drm/drm_bridge.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
