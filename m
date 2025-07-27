Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45313B130AD
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 18:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750EC10E132;
	Sun, 27 Jul 2025 16:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qn/TluVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A737010E132
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 16:37:41 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56REPOSN008239
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 16:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wK/7AANYzXjuDWi34c4pgwf9
 uDLv5k83zXcgqhJz5MM=; b=Qn/TluVMApsDuwbUJbomJ8HoK9g5RC/YolwxcDiJ
 4XjDV8hiixmpZtRAu4metDviUyVQmb6gpW3ZRRE9/nK+bft3S6H2+t6I5lVHmWta
 p89PHGsmKd4l1dGIbiLFcQp8N8FSkdmjGL9acM2a+e5BidkLnCx8KoaDm8MyQkAU
 phNRaM4uEjNzh6zD2LnHQ4tzHycwAjaIQXEhjMh5W8KiLql48ocZLGMdhI2fpGAh
 MuUjXM9F8lns4O7uIE+t+FSC2vt/0cf+VF9NScJ3A5bkfG+2aNbJZRIsNg0Ef4FO
 AQ/ZAIVUgSwDHOaPVIHv3JS52Lllu1Rj0828Eiutp6Yc5w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2abhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 16:37:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6fab979413fso74451246d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 09:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753634260; x=1754239060;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wK/7AANYzXjuDWi34c4pgwf9uDLv5k83zXcgqhJz5MM=;
 b=lsk8PZrnaoqkcbNpKQ2CeAqv1gXwKVQPOaQplgeh/aWM8vh2IuxyPqarFndsAJEAFK
 4XrJ+d1wYXH7sRcp3CfcoVlNYMYoISvGKv0ib2LNmROeU7ex0GbYOCxi3pcVryHqD023
 oMGGQ6oR0ojZmbYckCy5q0YrDV0YXyn8u3nODRytbVil/kuS9Zthxj5TvekTDX3WWhZo
 xW810SfxeoHu0Hed5DXxUosL0EMgox6rS4/Q4OFmPp61T3/MWXu7Iw16rQem/wUIV6UK
 E5IkOyEFOq0YRQBMYMJG0sWPefrRHr92BAyTZuSCCpVfCtDnCMOHEMNIfARa9WP2St46
 15Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp28eUbwKMy9xtPww/y3+264Ezr94tzZl5IoJhEuMhxkxYtUPw5rFqkUKUp8aYlZGn297ak/hsZv8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiCmlzXwSD5aiCH8doEeru3c3XC8phYF8WI2vuDhjdRk5Yygxr
 u8bVCCPryKZNYLcijINPBPpi4WIds9M6ayXtaCd8zU630QFqa+ODuMQpXf27sUOXOEu9XaBnORB
 EARG73CgjGMRcg/LWBXW/PHE5oBtlNG9lXq+msI3RLCdI2pLEoPQt5Y+Zq1/eAFhk1gIyGvo=
X-Gm-Gg: ASbGncuKevJE6JgNmTMgHLC+zl5kaw4xl5ZjXBAnzbxu9CpeFMs9rM9zcIziR4vF6Zm
 KE7HCirR2Q5kA7fAJB8sPied8TPO0dIra5qfb//YxiSSSkEl9b0jUGd3rQWRhohIY+HQkLbrfwV
 eaDS7faFlsSr79GBhfRxZv+0fp++awJyiN9YNf5Tj+8mLzu9ZrWxLCkfGUKCO1ghPGoVax7oPI7
 ELAAb1tXpVhOZqHIh3ghhRYbUPUqT40GvjXos9ciq3xavUQuiBBFfT5iF6PkI1NKQlVGd04VSn/
 hhQxARFJLtoxWRk7wynpYfucSzFKT41vgvStZVHSD7wbE+1L0AI19IJZd84J5V3lH+SJmgB+48W
 q09gfTXwMfBiY0LIDPJogR8cDX8HItuDSg4C7iteWIjdOekUyMPoT
X-Received: by 2002:ad4:5d48:0:b0:6fd:37c0:2c74 with SMTP id
 6a1803df08f44-7072052e0b4mr146241676d6.11.1753634259616; 
 Sun, 27 Jul 2025 09:37:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCEzR9cxfhoQf+JRJGJJ+OBE525ZBdzHU5iOMQLP/D8dHXrDVAEtnxnZAfMekTleUclCVblw==
X-Received: by 2002:ad4:5d48:0:b0:6fd:37c0:2c74 with SMTP id
 6a1803df08f44-7072052e0b4mr146241226d6.11.1753634259033; 
 Sun, 27 Jul 2025 09:37:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331f426e396sm8705181fa.70.2025.07.27.09.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 09:37:38 -0700 (PDT)
Date: Sun, 27 Jul 2025 19:37:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Henrik Grimler <henrik@grimler.se>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/bridge: sii9234: fix some typos in comments
 and messages
Message-ID: <dqkflgvnthhej44ocyqkeifixtwjwpyeapq4qpof4ah7kt3ynf@e5svmfyeimga>
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
 <20250724-exynos4-sii9234-driver-v2-1-faee244f1d40@grimler.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-exynos4-sii9234-driver-v2-1-faee244f1d40@grimler.se>
X-Proofpoint-GUID: Uo9DOJoVAKzephPAIFCGUoPNtjri-EVm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NiBTYWx0ZWRfX2MzQyHwwTCah
 9cHGK7bvQn0GTFR0Bodd292jqiPH+drpUQv8ITGzsQctLlG6hoITYs4S+zV4sfYh+MxVSwQpyO8
 XJ+QZxLLDxE/PqYwN+2WbPz70gyPRRwsC1J1NugvmmxXd0+N2IZXUhXGRzUVtM+RNmll/S7mvzk
 QIXmuZU7IzN5rG+w/mzmeR0KQJTxXnc0GLEHtwRI90FBj1sIABDFghORWfHXpcvytuhpqL/lqWn
 +oyUK3KYjJ5qcBmkBZ7F/8aRkPcWLbxruTg7rx4H8+KjviY94JXVhEycLvTfESzTnKW+HV4wn5H
 mn1pwvl1zxOs0rqM+iS18RC6okZ4p3BowDZ0RjDuSAOQ+zOi1bXuRI4wwu4TeDsWLkAHGUzhm82
 UEM66/I7d3BTydwXCohTlkbCiwo5LPR+CfwGvari1m8dbq9saG5Me2Y3jUWzZv9G9q7ITox1
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688655d4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=7HXEQI8gbsEklOhadn0A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: Uo9DOJoVAKzephPAIFCGUoPNtjri-EVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270146
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

On Thu, Jul 24, 2025 at 08:50:51PM +0200, Henrik Grimler wrote:
> Fix spelling and formatting so that the code is easier to follow, and
> so that it is more searchable.
> 
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
> v2: no changes
> ---
>  drivers/gpu/drm/bridge/sii9234.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
