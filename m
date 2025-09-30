Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9B6BAE8A7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 22:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3233B10E62D;
	Tue, 30 Sep 2025 20:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5LOIFdV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107E310E62D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:29:41 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCEuYs015464
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=R5sl3ZNZwJRriIGWPQB/a/Ct
 xB1WoaSGeN5QScEiQ7Q=; b=o5LOIFdVBZ//v/2E1TnvIcqUjzye/Ka5ijY8xeC0
 d9YkC/9/1wv4SoPLu4fEQ0ZW1lZln041JrDY8SwcqEguun2K84mIpjGkPm7JkD7v
 zjCVofucFtUpNFoX33CWX21J4ED2mYM8MHunzDINF63/Rbi8Sz1Z/letyLi34kQL
 t6dSAeW3005RM/Q9mur/Fg4XuhGi6fa1fTXYw4ygq/8axfnxp+9bTI6CnKXIOnQx
 Wnk8uIyreZgUPFfe9wgn4hsqEbVhMbJSqUBcHtLj4/8EdPE12sPGoqHGfRFtqKR4
 EDhz5ZYVUf46AOpEPYCN7YccyVCzqeVUb6SP7Ni0pR4QbQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr2bvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:29:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4de23c3b40aso127782241cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 13:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759264179; x=1759868979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R5sl3ZNZwJRriIGWPQB/a/CtxB1WoaSGeN5QScEiQ7Q=;
 b=UWkRKx3VV41MMIGE86UAejvy1VMrtm33DI+UgUcWcYlDN7d4Kxy4MjM7R4fKwr/Pzt
 EL5pcILGdPpkDlYQehrbbFDRMGwWza7zr2cqWgIc2RG8pjMfbd0SOlUFkkGeCRcDDVQ5
 3kSWqBrXzfmpzS9/8msAmtb30f79aZgBKEou7kuiaCQbgRW+ts+9v+gMR07KVavKMJgq
 U0AU4+d7Hn/tP6x5lh/naBdysFhHNzMxZYjDQSm+p1BQAMTl650eNIsI0IkfDYN/GLAm
 C3aOOwtDu/CMBvHiqG+dRnUjbtn7FDdG+5cF+l4pCwJ+264lAD6ztFxblULMSXyZ3oux
 NFdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUTURheDi4UYMZ2qFTZxWgnjjRyBbxXbUzFJWJGexI21oJAWNz+iO1iVkmiYn/967QYD5saZBQkXI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7LMRjIWJbw3MMsWsHji53i+SqaTH/KbTVAaNKGw0ZbAhR3NRw
 VniL8UUyh/rtu+3+j5hA0bu27lI/Ndh1Qmx64n9g6w+JS2/1jDV1Y/80V2FitdkamU5dJ+85c0c
 HUxEzRKxAKHq5sME2EoRgy1WpI+OeTjPOjjWKdijZi/H/IkEa+RAYzytY+u0ddP1NAqO3di0=
X-Gm-Gg: ASbGncsp0wOgS8Db6GLa4xqwp3nCG7svZzDebXHqp7CUayJnexLy6ebMuEL552hWrZr
 U4NK64bpkcgDl4g13trNDgI4i3CuoIfu5xLcc5Am327E6q2+ZsCriwk9gBp6xg4loROxGz5heqB
 gCm8Nb0NulnJIAK7rUsUN69GUCfLzYXrPhBhyLs6JziM3xecwZ+uPxWX1bIKazQ4oX6usW0hQjO
 NWTbiE04sP23CptYlQjPk5WREnmlHx+MGlJzReNZ3Irl0pkfaC2jDxvoA1VVMN0WE7LA6XAKXDE
 mBDWR8NKTAxRSCs3+JVNojil7mYXXfsPI1DQwQWZ1Esd+5H8uCfdn8rRnbh+r66T+lGDjPsP29y
 cfDMInDsaH6QKCCjPxSBRs/0MOC1WRG4GiANCA/IDCD5EWbVRQ+IComhz/Q==
X-Received: by 2002:a05:622a:58c3:b0:4b5:ffc4:d87b with SMTP id
 d75a77b69052e-4e41e25672cmr12692821cf.63.1759264178854; 
 Tue, 30 Sep 2025 13:29:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWqYNQ5DcdbJzz/fom5G6oGKnCTXV+GrXUnR7tUKQp7CbjCVYz/Y9aUaVBAEusZAM09X6HlA==
X-Received: by 2002:a05:622a:58c3:b0:4b5:ffc4:d87b with SMTP id
 d75a77b69052e-4e41e25672cmr12692511cf.63.1759264178263; 
 Tue, 30 Sep 2025 13:29:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5831665671csm5160974e87.75.2025.09.30.13.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 13:29:37 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:29:35 +0300
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
Subject: Re: [PATCH v6 00/18] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
Message-ID: <hvakijaevs7ucwvlnf6x6aqj5k465g2rc3ba7zexjmamy7mxg6@gnyhlf5jj3wn>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-1-damon.ding@rock-chips.com>
X-Proofpoint-GUID: gwR_XHAzRm0sKIzGwVZzpoD--GVPV9Ht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX0AtXNLLYS9bV
 biKt226Tnp/hPlB5i+aKrw7aYOKil0rdtl7VBVGHfxDcoFndjyGKiAb5QFDQT2XPY1VMrvpaA8h
 CbMMw4+hOG5rdE1OOCEsoIJbv/Sp8t1FzYMgI94pfT3qBEO22JR6gYhegpawzPZbU82hCrv72XJ
 LwKfVQXUS70RUFGlNjZcAZy7fe97OIiISzTNxKiZRflAoHdDnONKEUshzVCdI9UJDmc9zyhRwri
 +CQ2E7BFs8fiClDsvN3jLe7ceKppDzXi2eGnhg0/cdSU9aIJkIgY1RdO/U2yMeD81QNnOIk8YS6
 V/fZpPy9MuhBzQCe9rWPiHQnYznt2FczkETUYrkQVwCUZXIebUPZ2oB4SsMgy3UByIRiNJeUarh
 lA1vkSrwVQYuiS2NDo3qd5S74hQj1g==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68dc3db4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=6YOL-LhRVAKcL1tHTEcA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: gwR_XHAzRm0sKIzGwVZzpoD--GVPV9Ht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
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

On Tue, Sep 30, 2025 at 05:09:02PM +0800, Damon Ding wrote:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3 is to add a new parameter to store the point of next bridge.
> PATCH 4 is to make legacy bridge driver more universal.
> PATCH 5-10 are preparations for apply drm_bridge_connector helper.
> PATCH 11 is to ensure last bridge determines OP_EDID/OP_MODES capabilities.
> PATCH 12 is to apply the drm_bridge_connector helper.
> PATCH 13-15 are to move the panel/bridge parsing to the Analogix side.
> PATCH 16 is to attach the next bridge on Analogix side uniformly.
> PATCH 17-18 are to apply the panel_bridge helper.

Note, only patches 1-13 made it to the list:

https://lore.kernel.org/dri-devel/41c2a141-a72e-4780-ab32-f22f3a2e0179@samsung.com/#related


-- 
With best wishes
Dmitry
