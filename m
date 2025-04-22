Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CE5A97A5D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 00:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D569C10E062;
	Tue, 22 Apr 2025 22:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHWN2RQt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02F010E062
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 22:21:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKpVrZ025922
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 22:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QFVnrpWb050fxv5AMU0KXMBJxaS68SUI9iug+FP01ew=; b=YHWN2RQtHNBMCJyD
 EYzx9fM5u9uwFTy6s+Nsav9rJpeYHPqbqLNF7mlqS8ucurabTU06FST6MJo02txz
 MdFM1bpQuAsNBtrvW1gb3XcfpvWr+owKEZzFUX2FudDC7Ko+eWpsfosaX1/RXAa/
 IcawMPcfhbAQlDw4eF44JMjm6Hcrfe2zaNo/Pp8RoeN6gAp1gfOgL6KoNa4SBf5r
 rf9IkTd5oMZjDlSEDUUHR2u3Tho0wQGH8VZmdrSX7Sw3O7UX6HND7Bmvwgyjc4tl
 ysJLLbLMA1WBH18a52TlT9DZYKEgX5zysNd8kbTIw88XuK+i5yjfuQ7FYO4g5EPu
 1Q+tYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3g5fx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 22:21:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5750ca8b2so809600885a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 15:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745360508; x=1745965308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QFVnrpWb050fxv5AMU0KXMBJxaS68SUI9iug+FP01ew=;
 b=DY0oqagMtQsGEEOqGD/3Rioi9ho1yDmqH+Riq39yAIyumO7YoLfk+a1DJ7bWlUEI0B
 tXXssQbWdwQSLNOtt4y0gcZCqf/PZFmkrEuYZQZsL5OnxjGS/1U5A4BkyA3YKtZV3I/g
 MHXtfVsEWTnIUmmdazaIR/a6ouqPfnGbjjQjGlwYe1o//Gkx+rEqMUIGnUBY6/hOpuWB
 DcUQ6HILZVgVDKZ+/yj1dOzf+6BE+nf4ob6Pz70YC/TVqf/LQq8Hfqf0RdsalXXDlQzn
 zELBfrQSgMGns8n9dtdF1FetsAMiZFrUskmsHkUNZ2geZpH7xLQz3ECwSC/Px5nvR7ao
 bOHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVQrEZXEx2eFfsmT/+OME5Bdw7RZcais+VMN9+5LoX4rlcpQCTaUU5VhiLqWA9T0KPkd8calh/moM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDwHcdiNhQ+XU7+V+3Hta8g1A8BoIfvkY8d5xQXLZwf3dGoO6J
 v48qydEcYxoIgGaWT+GzJ4uYdmA0qwfa9l3unv0WgudpMJF9tYAonW19zpCamcLgUalLkyJnrmr
 OfNsn3jbUcwLUWhAGCKonSoUEyYaoTsm+3Teblf7xjm4zkBzy5liDwc/wM+VeB/++uWM=
X-Gm-Gg: ASbGncsDAlPL1uhUQdFtWlrlmUtty5w/iqYA/NblxwUOSo1nfJnfLZItBzyU3dcubfZ
 D2wQhH1LMVk9ZopQ639wT53GV9yHeTIiMKxz+tTA65NqXmra8A5+p8FtypzcmEGFM2+/AyUR4dq
 oM2t88ndzSTWmNUoIJH691oXFfzdRyxR7T8zUaDBailCPcQQ4GWzhIbs6IznwNEowsb+XvcXlCT
 hQXoF5AtLt4qZvc/Da6rb88D3ONHP03/9hmFY3jhQLy3UoH+cJ1OaHK+IBUeJOhuCP9WFr2Pe/g
 X+AVOH4uX9ZEF2XiCIgnrtqcEzCS7P9fs7kKkIP3qzs3+1Fv3m9BgbogE5Hv1W/wg820P8OzvJA
 JgXqHVEtCklVhEPcb1cUdI1hT
X-Received: by 2002:a05:620a:2586:b0:7c5:96b4:f5e5 with SMTP id
 af79cd13be357-7c927f849a9mr2413025885a.13.1745360507821; 
 Tue, 22 Apr 2025 15:21:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOiwKU9TBLfD8mAj6HNCGwIQ6VsntnnuJ4wlLR80zdOsb9Oy9RmdN6FhXt95pYuyHYSfsmlg==
X-Received: by 2002:a05:620a:2586:b0:7c5:96b4:f5e5 with SMTP id
 af79cd13be357-7c927f849a9mr2413022085a.13.1745360507403; 
 Tue, 22 Apr 2025 15:21:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31090822ecdsm16630271fa.85.2025.04.22.15.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 15:21:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: lt9611uxc: Fix an error handling path in
 lt9611uxc_probe()
Date: Wed, 23 Apr 2025 01:21:45 +0300
Message-Id: <174536050030.3678509.7013496889543262628.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <f167608e392c6b4d7d7f6e45e3c21878feb60cbd.1744958833.git.christophe.jaillet@wanadoo.fr>
References: <f167608e392c6b4d7d7f6e45e3c21878feb60cbd.1744958833.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tpyPt0jCI60plIuJICPMMEBCYwTqszUZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDE2NyBTYWx0ZWRfX3dgLFUa37gxa
 VMq1bWiza7DvaniMDndsjkOc+3vQEOl0TQ/vtCfUg6EeP2EXdf9SRLSbaCk0mEexiNd1x1x+Dvd
 G4bV/YWhOjf4A+uJ8BLWh8NuN5OqyyQWh6UVLgdWgHTPcNxIEUn5XuunyFqdTTlt3rtCDXEFpjC
 x/tFUHXeAWptTN9nFLq/DeHMqzTc+q0IApzSEIKbcjRe37yM/dAFC5jRNauJHwRKGoapu83wsp5
 yHY+b9+/4/vn7PVUtpLvUpmnKiNdFNYiKcHqamopJQ1CSxZ6Mh0YdEgCc88AbRRS0vOct1J611D
 7e1Ygzaib3QMPmjFNqLHa3zSqdIBLNunzfSYwueM147Ys3nHgph/+4pvOsfL72wDD1J1AKjbNrx
 TF1aROd794TOLsbSNSl6+MwObKq9kdGZTW/l09yXpReKOS0wr59SDsif71KrdcMHA8n1WW6o
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=6808167c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Epe2dFrVDL3RtkqF-aAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: tpyPt0jCI60plIuJICPMMEBCYwTqszUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_10,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504220167
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


On Fri, 18 Apr 2025 08:48:16 +0200, Christophe JAILLET wrote:
> If lt9611uxc_audio_init() fails, some resources still need to be released
> before returning the error code.
> 
> Use the existing error handling path.
> 
> 

Applied, thanks!

[1/1] drm/bridge: lt9611uxc: Fix an error handling path in lt9611uxc_probe()
      commit: b848cd418aebdb313364b4843f41fae82281a823

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
