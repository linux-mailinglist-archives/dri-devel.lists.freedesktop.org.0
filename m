Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A9CB54A66
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 12:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94FE10E14F;
	Fri, 12 Sep 2025 10:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KglbGKZy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349A810E14F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:52:02 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fDAq018532
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=sc6ZaRdU870GtUz0ddcaJRC5
 N+bG/TcHWfDRb085fYA=; b=KglbGKZyau0m7rAfBtql8TcV3fcXhTM7IRNfHSM4
 rF2R3h55HNvAAehUvUeSIJipGzrkTmsIXkpAP4Zp3ct56EckVcUgbSE37bG3m9/x
 DZE8ngbQ2V+07qXuBQAu/PWgi7Ae3u+9Pgjz2t4qDH7+QpdpkOgfSStc1tPR/BIO
 AEqVJgKVNn4mXEAeb1xuKqynNrJoi25eFFzp+dtMBenfkCxG1f80DWz+E1ezUGv1
 3wbBWm6QU599/45i10OCayUyfxJJTYNsHoo6wq/EdlS4qID7rmiAtrd7iK4qm469
 gteRU/oxWdaTh+ANAeoDnrxfKWeYpEBhUjqu0ctuhdO17g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ak8dk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:52:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b6090aeaacso48892301cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 03:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757674320; x=1758279120;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sc6ZaRdU870GtUz0ddcaJRC5N+bG/TcHWfDRb085fYA=;
 b=OjDn2fwSBCPeq6Rfa+aSGVP8B9rWI2GTwA43gXCk7e2HpXrs6fUZzSfOTOIFeFqo+P
 MtVvU/H8ijMrT2wzgG/mVhYHx5chM86fsGntcgtshDfbJi2COQx/GO8/ClKr4aH1v+H/
 fh6/rTJx+zZwZ5Px3LJDQSHiU5NDpbd344NaeKJ9zKyewiYhX8ojd/WGZ6YybYJU24Pb
 Yje4ExvtOIv3NlhEbNHSXZGKbFKfyvnOhrbwI6FwyMQLWUuKJDn9wxDbl/p7irkOvnUd
 ouPuWXS3/wdaD9crf1DA2Fv1cDta7u7wH+DlismLUH1FU6SHk8vYglhZ77jVn3s9qQqQ
 gExQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV24CFlBHeG4933JQ3f7PJqEnqRITp1fVfLhZh7Vo9nqA80ktuF5vm19tsaU5p83hE/6t/8KCkEmcw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy71NDs9MZC9IhehuhDCw3JFyasxGPC0kJXL4zdZng/AFHBp/f2
 rlS3077aTMVH9jvSdcD7D2i/C+WLh+EuKiFN3fi8jUtB3px3ziTHKk3xNAbigERNszpEh6tHIG+
 NXjP6sPkF41aueoGRXsfduUAGjRt5rIx0PrVGGkP7P1K3jipCACpt+ObTy7C8yQlvqCVLEyw=
X-Gm-Gg: ASbGncuTiD+Kna0b8Etak4ri/+OTHnJ/rwdisoYPsfbVTAEEvboP3UtgpVWgo9P79nN
 2rQkY7QgrDJX46tccai9WPHphszaQXuJ18CX/5AUjNnyif0SrKpxphfrd8vrTiJrQY9fp32lk8k
 RykV6k96fmxdd91iJpQX2la7iiAkG7rvtbbzrM5gzCezIPlel18XCTXkaOlOZNEnjbD/BadFzCW
 zc6M4X3w/7v5OsXpOkoOKUi/ul76AmetWwIq5h8jp6gl+VRE6SszDcqMywd5GsbYjN2OZf4Irmc
 M3K1onsA4jcWSoI1JFxja2YtpK+0zR0f7jeENygB4oDUtRk7fRJLRdL8DeI7QIVweJtRa5LVTl2
 Fs2k0FfPy3zebQuqM/RcCopZJv0FFzsBVqtpObdNXesbL5Kchp63j
X-Received: by 2002:a05:622a:355:b0:4b3:5081:24c8 with SMTP id
 d75a77b69052e-4b77d14cce4mr29097371cf.56.1757674319859; 
 Fri, 12 Sep 2025 03:51:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1+roIEGAbRV03P+o9D7MGOVoPmamN2QAkYmfx/FAe0qn4B/Og1foVsAi/kIVH/xOLtFDijA==
X-Received: by 2002:a05:622a:355:b0:4b3:5081:24c8 with SMTP id
 d75a77b69052e-4b77d14cce4mr29097151cf.56.1757674319346; 
 Fri, 12 Sep 2025 03:51:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1a821180sm7960691fa.32.2025.09.12.03.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 03:51:58 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:51:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 07/17] drm/exynos: exynos_dp: Add legacy bridge to
 parse the display-timings node
Message-ID: <xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-8-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c3fb51 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=xJsYSp2GQeFlw7CnCu0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: MbCic-6NxqcwKShLViVlURLKVCaXyZoF
X-Proofpoint-ORIG-GUID: MbCic-6NxqcwKShLViVlURLKVCaXyZoF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX1pQVCVotGrNR
 +GlQGK7LAqrM7ZhmjuVzcBT5m/Ma5bLtpQy1zLsJMAA24qj4HWJdyjocyJA1I/x5TxffC9NPjYu
 /K/o5o8jc+1p7Do25wlqsUenpnf92dpTst6IavmnpENfmvrmK65JTlJNh1dR3f72iJL/JSeIL/J
 3kTzoX7bkpPi1hV4SDgtPGn7rx875E2MwtJeY7n1EhzYb0fFUFMbi5S533VDUGY02reVpgWdQl3
 cnNxs2EnO7NOJu5XlnQbNQzVusbEsTMy5XkcgFR63/ffMcKgg2dO2uGVXu6WH2svG1/jAa/zCXl
 6IpE5hxH/SVSSMM/bHQQVLIYmcFmfKCDVmhIkyf1prUJnZOttmXtzuQBnqNSGaFRbzaLQWHYj8Z
 n+QEeoS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

On Fri, Sep 12, 2025 at 04:58:36PM +0800, Damon Ding wrote:
> If there is neither a panel nor a bridge, the display timing can be
> parsed from the display-timings node under the dp node.
> 
> Adding a legacy bridge to parse the display-timings node would get
> rid of &analogix_dp_plat_data.get_modes() and make the codes more
> consistent.

If it's the same as imx-legacy-bridge, it might make sense to pull it
out of imx/ subdir and use it as is.

> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 132 ++++++++++++++++++-----------
>  1 file changed, 82 insertions(+), 50 deletions(-)
> 

-- 
With best wishes
Dmitry
