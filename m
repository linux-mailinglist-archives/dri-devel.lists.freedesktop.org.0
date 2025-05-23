Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6E1AC2B2C
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 22:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24B710E1F6;
	Fri, 23 May 2025 20:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TG/4Vp3M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1E210E1F6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 20:57:04 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NAwGKN020981
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 20:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rNIsKJF1mi/LxioSk9Ce9BK3
 pIg2jgjoCqJJ2Z9jo18=; b=TG/4Vp3MopLsVOIKJ5m7+SaqSCGvf4E6s2aa616c
 mfuZIpvNK1BYE0v9y3tA4m67xBaLSCGX+NsF4zyS85nS8kCGmZKUkvZypf7XQTDD
 Q0DvOdx9mTiASt5XjKkfiUy4q3MKxiqoF+/kg0H5rl16wq7PnGI9xpEeFMzfhhmu
 MeR7MxijoOPmWwZ6ivhrshu3dtUb2x8sn5cE/aNs+RhPe8Vuj0+Yf9h2H5lLDCvQ
 pR5n7nqs8A1cPQ9xltRrppCX7ho6TP7OB71PipMJ5LxKiju989Yhc+01Q/YE2uNQ
 a9mfvH7Ji3GePmi07XdKmHOBcPmtc/Sl3o4mvxTcGGTKOA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0bb9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 20:57:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8c6ce05e0so4825716d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 13:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748033822; x=1748638622;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rNIsKJF1mi/LxioSk9Ce9BK3pIg2jgjoCqJJ2Z9jo18=;
 b=qKXJhvdXHcBiMioTvV5hbv7t+bAcqg9gP9dW0J7uPYDwCwdpOxzxa6r7gTtPhmGNaV
 ZID76WwRZJDBBcLpwEtg2BZEsUsVXOCmoUjsvw7XSrli5atmqIfejmrwiUBV7Mrv2A2B
 rjpQJChLM0yu2oFbu7Go852o9306hYBSNkp4PW3M5h1JR+JkH3pQtWwvBHHu1G4AOHU7
 urCUKmJZ7tVlkQ3fFVsHxpnyNld1JinrBXGvG6jXwAjoITDo2Jf5NOgslt94yYWSmmXd
 bmt+Kg0FTiuL8worr2dXeNE5S0+PkiaMnM/Fms2G7kilOyvbD+6EHS8dYaohnp2j2utO
 4wmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGeQy0v6AmI/CoTD1c+rG7hyOsXDFCW2GKLsOEgdv+au0ExIWq4C76veus1oqmFc4+iMI7t7p3hoQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5r5oD9kiCxb4ua62rFNURu3PWPzQZDCIZ7rwm3uCW3F9Epah+
 qFlnGyw4HmVPRrWxbQpY/nID2EvZMlvhnvLffItSHXm5a7Kyb4ATFwG+2+sSsfG46hOZ0a9EJln
 CZ10Qsyi6ZmQtEA69gt1JUbTOlEZOeoB8+zQpOVT6eH3OnXNMXV8Xbx2u7JWJYnnsVx60+uI=
X-Gm-Gg: ASbGnctPKXMuJTWkpHcQL++XlK9Wy4YNwiGoIgsvza6t345s0iC7ODW/PwXkbybUWQV
 RM3qFzzODUhkkVuex2L2mBN82tP5JTxHV3iMpqdrU0vlgoacMX4pHDWiVNjhfC69Jw4gNVxJxt2
 IhDJWZYRz9ZRovKVISVqetQGuaF8QOj1R+CHG9j/Yr28F5dayjGqmpXE+ypB12taFJaCIj6gqsZ
 JwitN89WxvwjyYry+5c/SQW0IPC3C5qfzTsOwmCfMOnCYZsZbEe/Ga/8TSVoGVZsUMB8cKhhQwR
 YiR+jM1G7rMEVPUsP9H4bazwQLRNTMrMY9HcantNjB7A/H14vlfQQipPFcbSkkXNWEx5UtBPiQ0
 =
X-Received: by 2002:ad4:5bad:0:b0:6f8:ad1c:e35f with SMTP id
 6a1803df08f44-6fa9d2baa93mr17732806d6.37.1748033822520; 
 Fri, 23 May 2025 13:57:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXgzEI95DBszlLmAprmrtfWsC7XyZmzEiw7PPtjWrRZ68kAwEl7Vk3FXZ6bBDe1BQSmep8gw==
X-Received: by 2002:ad4:5bad:0:b0:6f8:ad1c:e35f with SMTP id
 6a1803df08f44-6fa9d2baa93mr17732336d6.37.1748033822111; 
 Fri, 23 May 2025 13:57:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cfb3esm38509081fa.104.2025.05.23.13.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 13:57:01 -0700 (PDT)
Date: Fri, 23 May 2025 23:56:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Danila Tikhonov <danila@jiaxyga.com>, Jakob Hauser <jahau@rocketmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: nt37801: select CONFIG_DRM_DISPLAY_DSC_HELPER
Message-ID: <im3otl524ar2kkdj4zpstrsuemwu2iamoudqdznzlqhq2uvfn4@qlkb4fmgkvsp>
References: <20250523121127.2269693-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523121127.2269693-1-arnd@kernel.org>
X-Proofpoint-GUID: ksMxEppNZo9KQ3oq_85pIaXy-5ge0-vC
X-Proofpoint-ORIG-GUID: ksMxEppNZo9KQ3oq_85pIaXy-5ge0-vC
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=6830e11f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=n4_WoJYr638Gx-RNnhEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE5MSBTYWx0ZWRfXxYsW880M07Dx
 8KehBs2KT4z39XdO6ojAwTY0ywN/Nonml31V7dbyvmPCf6A2UzWhDErU3w5DUhuiQURRUOjTqNT
 RQNXVTdNaDwEAbJwN207QhQcrOo+MJ2ci6U/CTzw5PVPOLZEIlXM2qwY8FOgkPT84F62V7sazq0
 +vAgBl4p8sEX/QHRarPLm1bg7yZ9X6ivzQXtin8HFXcIId7BJeAHmekzQpvLDT0YRC0MdYbFaew
 C97Uh/KCtk+g71hXIT5UE3JbM726+8Ygy0LYZ+wt4bBV7JnS7jp4C8fIHfbyOm2wor5gRABrBGh
 vJUanvdtNEL6Sw6oNV87OxPO/HSAU80jXPI+clDIKEoSk2LTvih05249j/1+kSdfvbE9M9c08FF
 4TdJyvWReZ/5tnifyQdl8GRhXXEmkxUtRDqnHQ2Gz1uZUlAbVkFcy7quhsY0lTvGHdlOuOZh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230191
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

On Fri, May 23, 2025 at 02:11:22PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added driver uses the DSC helper module, but does not
> select its Kconfig symbol, so configurations are possible that
> cause a link failure:
> 
> ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-novatek-nt37801.ko] undefined!
> 
> Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/panel/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
