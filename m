Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B41CB18FA2
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 20:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53ADE10E180;
	Sat,  2 Aug 2025 18:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TCdjk5kB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835CF10E180
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 18:27:29 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 572EpF2i025943
 for <dri-devel@lists.freedesktop.org>; Sat, 2 Aug 2025 18:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wHjJfO2eVz1RXrskPBrgz9SqYwFlP2w6be1JZyceH5A=; b=TCdjk5kBVzKXLWQd
 2XyhncFC7KbWEH47xV/M8yKgJi/qbU6IghYNFzIXyPEtXG/qHIZB7naeeXAgo/+I
 VMJ/YAfV79fXjob0o7yQ/34Yiky43X6KHM2itWcfbi2DAaOXgaL4Y/zZmIP9elgK
 llCS1kqn585tgfZSVlkbRBBBy5FohpgIqTfMP2h3iysFvivWjBbNRMSEoi3U8VKi
 MFb863cbX1ElrHjSWXwoxk3coIiN2pljp8mvybv7XFMPa+7q0u/o1hmwFstVK4xO
 x/D0nslno8BLEJT7YpEljIeMhJyutFwcJjTPes0DXu9WVVNRgOkjjl1XPaOvf5VK
 sgZWKQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489a91s7r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 18:27:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ab81d016c1so34111431cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 11:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754159248; x=1754764048;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHjJfO2eVz1RXrskPBrgz9SqYwFlP2w6be1JZyceH5A=;
 b=oIFaDt+NEkElZAGs9TAjgXMoCAYOg1S2/SU1A5uHK6X5YT/MbpFdhlSeTv1622ZYJY
 SlFHU7Ob2hKqXCz0/F/yoDR4dOadW2iHDYliCU1VJ/fCcHPKHgUOdZ49FDKBqnc18Wte
 5tglfdedoItqFiVTT43tQUsmdnAugfNYTMWAt5vHfOek8Xl4simbS3IBg6XEl+s+CFVF
 DxCnr9aG1rszpXWXbm+UTrWHMv8C2sLewAhYkvpKYolRhQFX3701p5OWT6+qNrqaWBT9
 jB4PMCe3Hp/uA1ujN+u8zjWRq5R7GaY/1Di800QFy+jR8uKNxJizzdKYUky8pNb6qzP8
 Hm3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsf6aoAcQvjrTJLs7Lcm7UxLmPV0LUfZ5aW8PlvWYY2JBtzhTwv9zWdKXPYQAGhAsuViRE4Udh8Zc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQYMTU2mYoWoOYihwsQCRLwHML31vNuGXwG3O83ieQsoN/RfcM
 JPCIZmCFXqy8sWHv89s338eVu0pJLVe2GAeRA1o1IpVZ9LqSIPuvv5yyBfCKeMtaNPLOb7zD+aZ
 tqJ0H/013jo3I9X1fRh4H7dY8UllXh4fPPwvQWwc8+6hagPkUlkMJlC/x6Jo/PlA1ZGhn+iM=
X-Gm-Gg: ASbGncsIVSJS/Av4cmVbuE+l1RXMuweE9Mbg6Ej9LjsOQ0Ss06TMpx+NqIt3qlFjwiv
 hoiBaOUa7GAci6+LgyOR2tu1wu5/TQi+V718i3Ot4Mpj03JgloTljc5sf9jb59C/9Q41jvOySrw
 TDmsspyXxY0MARWe2KNu8qj+6uK43QbG1i8N22s+RyFz15inHOPU24bbEoeNvNCkqBZMv7lI4OS
 19E8vdixe9EcC+E7tceNWDXU7pLkW/o5aY79Q4mLhuVqizS/RX9+tKykwxM/2oAk0WESwpjZAoW
 SU2/JnZOEcg/wopu7LQnQ2SyUkWCYbRv8XgT+YR1BvlpfLMJ9TiSpchaFXXqR2aNRzZL6dz0PAQ
 spzQaU8JP36eDr+PE4ZsS5oWShTHf5hHwsLiGDE6KD5eOgF3lVc7g
X-Received: by 2002:a05:622a:1988:b0:4a4:41a1:b944 with SMTP id
 d75a77b69052e-4af1096838amr47219071cf.1.1754159247547; 
 Sat, 02 Aug 2025 11:27:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdwUz9W6djQbx6Jk8PlmiYRWeWMq+sa/EoP9yp8VFX0101q5L3EsmEA3Pw+flip/kig9JF8w==
X-Received: by 2002:a05:622a:1988:b0:4a4:41a1:b944 with SMTP id
 d75a77b69052e-4af1096838amr47218801cf.1.1754159247079; 
 Sat, 02 Aug 2025 11:27:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bd58sm1081590e87.8.2025.08.02.11.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 11:27:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250708085124.15445-1-johan@kernel.org>
References: <20250708085124.15445-1-johan@kernel.org>
Subject: Re: (subset) [PATCH 0/2] drm/bridge: fix OF node leaks
Message-Id: <175415924590.3214054.15582803445369224429.b4-ty@oss.qualcomm.com>
Date: Sat, 02 Aug 2025 21:27:25 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: OUluc_pWyF1g9XTF2W58iultzqmAnKZV
X-Proofpoint-GUID: OUluc_pWyF1g9XTF2W58iultzqmAnKZV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDE1MSBTYWx0ZWRfXzedd3ryggPS3
 2NgT5+P7ttsNR+c4u1O6eR25W2REPfGkaRrlsiB29MkAwpJv6FHXRvNxGG5wTTkYGiS5fYYd+zG
 kwAHc/FPOk0+wfSYr46k+AG5cJPKXcpuNCcr/lSckrIljU41A0EJmvaCodWxOV4s/hv3VSKeDQJ
 OxewdUtywMEagbh8xXWY57Y5AQmOG+qh4RbpSOHqmbYct1bcRRKl9tQ+kOGXlp0/IWZJG3yZX2U
 8/KejS4ItGlnrwnnGSGZL98yumV54otWg25T4+ALRS9AXrhtZkifWEhA5yF1kI7jFQsuqEzFmqn
 e4GXDnjfmfTmiPk1yDqcDfgoygONiONH6jO6s3PWSR10ccSXNRtWuo/nn/sLf6gv0a4nl3yxsn9
 4vSYzNVnfr2YyUOEb5eOmgu+Cr6sxugMMl0nchDLyftBLV2t8FOKj8g4U85722RlcMHyU3Nj
X-Authority-Analysis: v=2.4 cv=UdpRSLSN c=1 sm=1 tr=0 ts=688e5890 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=nbYGOYP4SzQJCf5zM18A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020151
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

On Tue, 08 Jul 2025 10:51:22 +0200, Johan Hovold wrote:
> Make sure to drop the OF node references taken when creating bridge
> device when the devices are later released.
> 
> Johan
> 
> 
> Johan Hovold (2):
>   drm/bridge: fix OF node leak
>   drm/bridge: ti-sn65dsi86: fix OF node leak
> 
> [...]

Applied to drm-misc-next-fixes, thanks!

[1/2] drm/bridge: fix OF node leak
      commit: be71ce9796c36517c677ab1d3c6691423dd0bdec

Best regards,
-- 
With best wishes
Dmitry


