Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39C8AFA163
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 21:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA2010E23C;
	Sat,  5 Jul 2025 19:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hg4m6If+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C6510E23C
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 19:19:51 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565JJp5E014780;
 Sat, 5 Jul 2025 19:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=h0r+raSjr3qG0pDwi4k/j9K+
 amUMQGQ1pbpuuZU5sz8=; b=Hg4m6If+4HXMvUgCd89eTqWygkAs5ZjYu7MAaC2N
 umwQ0U4X9fdcF3B24dGZ8RySl4FRkfBgM+v2QTX2+aw3BgIflky9qEL9HkDDVGK+
 jIUTsVSTYLCTS/AB//bqqSn/U2q8+iTSGUQwCtRSNVK2im98q56fqfc9kupmjsGP
 Z7prLTlKUzkNkqHFejuTAUCh3/p7bgTZRui1bWSm0RTOh+QQnfbZY8FlR9JVxek3
 /MzEj5TbRJOcYsHZL9JxPsdov4dsBjFL6koEgaQXZae64oTSSR0RVb0w2FZ/gPoL
 gFlsl91FciN7fIEYgNriwIHDUKdV57CCgsRkxGilkRvG2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtk1pjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 19:19:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d446ce0548so314633385a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 12:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751743189; x=1752347989;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h0r+raSjr3qG0pDwi4k/j9K+amUMQGQ1pbpuuZU5sz8=;
 b=F47z3QmJ2BwB8JsKDbG4zk2+o8auxBH5MrPSDpWqHz9vfVFcVVaq+d6wSgFih0pd/2
 Nzr3IImLCBmqKqM3dKC73AB5J4RZR5vz+f2G9bUPjla4oiTmdSkvB3EWw2hKDqL6Iofj
 oX1GsrAAYdoJ0Uwlkn7g8iohVYd3kaMETdvJxQetBsY5q20sb/6itki2E6gaDG+s2zy/
 1PNmOiztWWPQe+qILYzPycdv6Gx6aSihUsZ9yOACp+rGF8heO+1422GQ1C3GNrjAngHC
 2tpJTDJxdhRYOne2UnQ06n5CVvdvwldB074U5VeM3hSxEgbe11DiOOjm2Awq6Tbsz2yV
 luZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjwSviB3pRQGBh20fLldRSU+5eyqSXbxdFBlPOo70Z3RchNdmrb80Q2IfdSCQjIf3tj2FNEDwm8WQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIYEw8wGL8/EEM2rvfdmsxQvv1ZditpnTjHHl762RcnirG7deE
 t+Va3yM5yM/amFuOEI6iD/KBBXCSHVa7O2Z4VEWrPAVYqxC6+eQnnFE4JAhLtkFHNCRFVHswQJV
 iIalHtSspXb2on3nCGJYAKUwEsLHtHVic9gE0Bgtk6rnJjEfInqwwUREyfjyBQSvyBwttwqw0lH
 K96HNefg==
X-Gm-Gg: ASbGncvuPyjLksdltKm/UmG4e8MNyo13tckLCHTH7v8CGjPNKdwKezrHHDzbR1201/B
 G9UQ1fnEgabcKBMzO+1hjkUw1Ws/I53WBo2QFViDJg51gZdDrKNL+8inshkPeLmG3ON+XCBGBoW
 zN6mlnBMGr/Z6wmOYB20NHZ27rKi3IaV+IUQ2NBxW2eJ5Izo6crm9fxALsiKFmy3aRSj5uAU7kw
 pDQCkR+0jaI3BWuYr6KL7DlTrJKPogffMgAlfsdqkerYg7JgqKJ+MhennhBvxdN2bz/ts+oe8o7
 T+G+o0OJLA1Ip65vn/SwG0uREawLEKFWcD+XYsgnFC3JrTkihb3Rr4cTZKNqUwp7n8cC8FkeWwN
 LIHSmNvhGHpnnVj+bbPwJd6dUeTDlvi0HhWc=
X-Received: by 2002:a05:620a:2913:b0:7d3:d156:37d6 with SMTP id
 af79cd13be357-7d5df102b4amr936997585a.6.1751743189406; 
 Sat, 05 Jul 2025 12:19:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAxmBHCJAc86I5mwaeJPv9D+3BoHZHqIdYljEW4zYDWfi2OGcqvLdGuYK+a57w2SLv7bRiaQ==
X-Received: by 2002:a05:620a:2913:b0:7d3:d156:37d6 with SMTP id
 af79cd13be357-7d5df102b4amr936994885a.6.1751743188975; 
 Sat, 05 Jul 2025 12:19:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556383bb16dsm669107e87.24.2025.07.05.12.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 12:19:48 -0700 (PDT)
Date: Sat, 5 Jul 2025 22:19:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Colin King (gmail)" <colin.i.king@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: tc358767: fix uninitialized variable
 regression
Message-ID: <m4bitkuvouisk6ebhnz6yzkmrojuocos4tvjjmxahjg2dp2kgm@sxjmymi445vy>
References: <20250704-drm-bridge-alloc-fix-tc358767-regression-v2-1-ec0e511bedd0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-drm-bridge-alloc-fix-tc358767-regression-v2-1-ec0e511bedd0@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEyNyBTYWx0ZWRfX8m6BemH72w6c
 Xh3j62LZKSzo7GdlNDqU4KWCLupULy2XHRvM1+m8gDPt/IQ/raAXrR25VdJKyNhzgSe9jffxBL2
 TXrJpd7xvsAOG//hU1kWdltVJymqIKie6+GUp65MDJLtCXFgFVYr+SYMlGqnAIXEtmzwmYZMHDi
 o0TGm93AQqSMt8h6FIs0Si0pjm9wK7R096T2IX7CzeUEEvLapL49GjPd3vTDw0IQf4rnGQYIVBH
 3AegZLQWhkVL3MrfnlB8ECa0JolK7qgcEaxptvoQvifgtYqux5UZhx1TKVZB4y3PB6WGNqM4/ZG
 QQs/sJOhRH8+CCBxbqerooJ0Sp3CqZ+H52MxPYpac3DPXnGb4eLGkljQ8vCv7Qq2ohJWJ7AfSuf
 62PD9AhuEsrH2uDlqXbhjV4xD4qkxsyvbfx39NU4k35LkaNJJvbIqKV/lbzf3eOoz9SXNoqT
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=68697ad6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=Nrv5o8RMzHmR80szmAIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: C77_2j6lshqUTABiACZ3Vcaqq6MXLt_X
X-Proofpoint-GUID: C77_2j6lshqUTABiACZ3Vcaqq6MXLt_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050127
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

On Fri, Jul 04, 2025 at 01:30:18AM +0200, Luca Ceresoli wrote:
> Commit a59a27176914 ("drm/bridge: tc358767: convert to
> devm_drm_bridge_alloc() API") split tc_probe_bridge_endpoint() in two
> functions, thus duplicating the loop over the endpoints in each of those
> functions. However it missed duplicating the of_graph_parse_endpoint() call
> which initializes the struct of_endpoint, resulting in an uninitialized
> read.
> 
> Fixes: a59a27176914 ("drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API")
> Cc: stable@vger.kernel.org
> Reported-by: Colin King (gmail) <colin.i.king@gmail.com>
> Closes: https://lore.kernel.org/all/056b34c3-c1ea-4b8c-9672-c98903ffd012@gmail.com/
> Reviewed-by: Colin Ian King <colin.i.king@gmail.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> - Link to v1: https://lore.kernel.org/r/20250703-drm-bridge-alloc-fix-tc358767-regression-v1-1-8f224cd063c4@bootlin.com
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
