Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D7DBAE84D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 22:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AB510E2D7;
	Tue, 30 Sep 2025 20:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="phrIoJPh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C8E10E2D7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:18:42 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBfwLC030612
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1prKZ4v8aUicNJIrRPB93Z2q
 BSZpWbI16ikZz4dczC8=; b=phrIoJPh//YjDsPd6tBBkta/NYufyjsIgztdxLMZ
 AZvqOF5x6Cq7k7hO3vWlIFKi/Q2l3CWCZ11YULAuW0t0OZ2b3pl1O6nmoSAG/bwC
 CtM3r5IUdX/w8EzIqd8MAT3aJxZEMkPVQb1yO63P53KW7/XTuzgjHBdgQP4bqgRg
 cfd7QNe1bDajr5SObgGIQKwRT8CWlory66hqslK3qw9GPJaZUJa7kxlc+Jom+3Lv
 JEt1iGDAxu74RjzeriRN0JIGkq3+4tnjVbc9ygx8n83DhmbX3WOnWKfDb+7IvjPz
 xDLpEU2gkmxtKgNCeVzbUsmQvgS762iIdaQf7uEdPYnU8g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdj3h0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:18:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e1f265b8b5so47602661cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 13:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759263521; x=1759868321;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1prKZ4v8aUicNJIrRPB93Z2qBSZpWbI16ikZz4dczC8=;
 b=AVWkw4iEhJYv8QOHTqoe2OdaS120LOLCUvaHJFcMskycFGmlNYkk23SIfK14bcDUjv
 Vaf6LCtbE9er7JLdHkbzijuvwTe/EdBBU4U2pzFgJrflyG2DrPN8xIfYuj184wsrwLY8
 YJHuM0CyhB50I6pDeE5zV6IwzfhasMRfhJ4e5umhYdQlRQZhlnTHbsdlmH5rxj8OxbuK
 aHl6wOpDmBp+2ctqaeDTZhaa44FIjNm1niMT9SWvTBJqLhDgT8APkeVfQgqnzX42bqfG
 ujBKrtO01PWBiRUeqEa2MlANimtFinb41g5xkPbEJzPsnsVDbJQ7sa7B6HUa98c5DhGK
 v9sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNobIP1dvEiM+SXSRr4uoaYS4lUD32RTDfisB95NqJulnr1fbwnV1wMGugRlMWP9lno083bakra30=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3ZZZx9hsI+Xw0uXZYUhvIbyBDw3LDTEafinSSaJ1dKHvNQELV
 VjHmv4Jpyt2WRErOARYQm1AwoNAdHGY4r+hNUupXeTOCcetPD59EOFB3qBiyMFzgSUqQMpFONHs
 AeAbg+182eXlInoHm5N32SL0oSh0B8MSr/buVMs7ibxzggNQAQ0JUyoBMEUT7CcvbWfAB5Co=
X-Gm-Gg: ASbGncvTvyBdy9vUQMun5juZ9ID/c03THtHe1htuTFN4xGuYNZyS00/dkXNLCt23eCH
 tZh7Ej0Z+MGahqjeYEVMKXePAaEfyd45KMz6bFrQ+qAS+Xej7mIA/pPw99jZ2Vr6kqNWgFKjXzS
 3CE4DtklcMgZ7c0lQakEP/ULCZ46Gl67ku9VOm4hDvRyzXJmkcn0NteOOXODMIURA8bn+bKqdyU
 sW/f0N3/w0XDme0ShkUCeVw4nMU54zlSUm8FaDhK2APscXEZZluCVDNvqWWBiZ+8xg7hASWLNCJ
 Zip5vQ3Z/eff0hxERPSiraEshVcI9RylxW/eXyI5P/6lDptQU3GBBE/feWBXQFh/KSqZJiDFCwk
 r8H2xZ6rqmnt9N6ugclkBRmsljNl3T5K7N6ID2NZhzBDZAK3zeM+sQ7SbIg==
X-Received: by 2002:a05:622a:4cf:b0:4da:207:f0f8 with SMTP id
 d75a77b69052e-4e41c54839bmr12914641cf.11.1759263520696; 
 Tue, 30 Sep 2025 13:18:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSxICdUQhJwxyOP6ey50e51aF0tOi4+IPIxh6uK7udyhkmudoTzU3ziqUxuPBP2Y+j6k4Wbw==
X-Received: by 2002:a05:622a:4cf:b0:4da:207:f0f8 with SMTP id
 d75a77b69052e-4e41c54839bmr12913881cf.11.1759263520062; 
 Tue, 30 Sep 2025 13:18:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb528259dsm35069431fa.31.2025.09.30.13.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 13:18:37 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:18:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 10/18] drm/bridge: analogix_dp: Remove unused
 &analogix_dp_plat_data.get_modes()
Message-ID: <hh4kn3qmwdbfev27xrs7eng7adfyli5xt7oiy7xgmviz2pzyql@rgggrhqckdjy>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-11-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-11-damon.ding@rock-chips.com>
X-Proofpoint-GUID: QjmMVGtuy3b7ysoVf5JV68-zhX9kfGfQ
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dc3b22 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=eBbjTLbptxnSh8XXWekA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: QjmMVGtuy3b7ysoVf5JV68-zhX9kfGfQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX9DcgWfkufYng
 ylelogbQ2i5JX5wZhqjkG/f0ug/gQFP/ZuJRTza0lGjcsto55RsdIfIr+wIYpG65Wq1KhFV9wkE
 m73zd02ThQTrJZ4gtQnI2fKjWqrL5elZ1+62f7iVFCABJMm2t4uVgUn2mH6maPiWRVP5RfuYrKD
 zVkVNDFmk0f9DlnkRt3qbvZIV2ydB8Sd8yzXoHDt7Xw45TSUt+ELB8vzzFgH2rCVIn39cM8nBNB
 h/F6+0BNCs62bJPINVCMhhqHksxsg/fEajmZ9IgmXvEhBpnmvbpwQP/e6xSESjA2wka3Cv/m7ct
 Ht23px7gAhk92LTJTqXIqjGj+0hukvQFBuJp0MK7pdcRrozBtFzUg5JnH6sG43vVW9Lb1aG2mhA
 7ySDD7poUuf5KS0EHjH4yKsz4EDz0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
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

On Tue, Sep 30, 2025 at 05:09:12PM +0800, Damon Ding wrote:
> The callback &analogix_dp_plat_data.get_modes() is not implemented
> by either Rockchip side or Exynos side.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 3 ---
>  include/drm/bridge/analogix_dp.h                   | 2 --
>  2 files changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
