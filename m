Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47167B44762
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 22:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A13F10EAD8;
	Thu,  4 Sep 2025 20:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GgeF3d1Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279EA10EAD7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 20:35:59 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584GUqYE018468
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 20:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Tt589PDYtmgXBtt91hE76lALxNkXhAXljuUNCjbCoDA=; b=GgeF3d1Yz/PadKz7
 iKKXreREj7vtD0jxWfwrC801p3Wwai4LLhOGuT7obmfufrMbt9ZlG3IXWBbTg+OW
 qb1oYl+iH4K5wPEBYkqtpg2TV0mfvBWC4v4Lilm6JTOwRtvzKGEb1V2zXD5DRlAv
 nPtGFLE95gN77ZuWUPVFHgNuiY66gYYmP1T8HRurFtJKC1HDw8v/v5eB8ndMfWLi
 /xUXYEBNlrBSZOoO1j80wKeMmn005ng/uohRpgxPVhKxvRsViNfz1bDTwntG28Dx
 Uy418h2srHNPqPWC8IZZhmKleH1hMN6rMiix1O8vfMUaDT5zbwvS13+EnLK+HiAe
 2GKczg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48yeburnmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 20:35:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b31bea5896so16483531cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 13:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757018157; x=1757622957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tt589PDYtmgXBtt91hE76lALxNkXhAXljuUNCjbCoDA=;
 b=sKp+JMIZ14Kr71y+cPN82nJMGAI0Cnk8BRCzLGTILzznOPbyfOxtakvyH4pI0BtNhT
 NAcKytawieLBBwwEnKfMc+opSY4B3+gxR9ddNEszkSmDnm3xZgHcGiZKm6XUKDcDuaS9
 XkqhrlW7Ax6CVKOUO2uXejdMpzPfbYBrnLXll4tE+uNnOvjkV2QOwmtVfYvfOEuZpZLp
 i61s5ljzKJdQNLzjJkFDm8dPkaDn0l4NOikjhUflrfUruAHBiI4Jb93l89BnmH8jSObt
 w4drqnQGZn+Pdhw1QHOm/KczVIG1Hu0OKX8oWLywnuJcGJr1DM/uUNL5DAxqAo/Z4KXR
 MKLQ==
X-Gm-Message-State: AOJu0YwPeSFo+kmM+imJ74NmJUig+Gi6N8NXVM4eL1El9cVS7VPoftit
 h+1ge7sI5pShH3mqe7hd5e+bp7iB/VVJSj+lfLvFWupWs1w0h+HEGJZRCsoQVHE/AbPAwMXlxI2
 zQYfUHFB5FhQ+v+jZSeLGT8lmlrngAnyoakSROTsopFL2g2L8ZsUVl0S14AzEqwn1RGFvQIA=
X-Gm-Gg: ASbGnctCJ/7Kpsn5ZvUYVhxnKoV7Mg5FIM99DpiMErqhKNSyG2RYtpbTPnzepj4KObp
 dDyX38gYtxMljb640DjQNsltxj4amurPQj3OrVmhV4yRxDUpKK2HLf3w1Tz7pDjDr3U8mL+2Pvu
 7cT3lLs2HC2oEft1vgJmyxARpsunDZOFPY7dd/3XOAbYQZyDOfPLOGtNjpD8IXa3Q8JQuQCjcfp
 CcDoekSb1R/b5gDhQ93WtosKcSSvR+JFpJ3DO8CFsodn2fXyOgj7p0YoNPdL78SiavstuS+ydDF
 F7UgRYOzDGkAPIHLe3oPdr24jnedq5VHQg0EQU7YB2/cLodjCQgAXaAek13Xjs3L3HW6bS5ExcW
 2EkDempjxvWY4kQiOzcVoB2jHYseofTBOq2bQWaCd3SFcB2GQF2Z7
X-Received: by 2002:a05:622a:342:b0:4b4:9590:c1c3 with SMTP id
 d75a77b69052e-4b49590d088mr76501661cf.18.1757018157305; 
 Thu, 04 Sep 2025 13:35:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBPbN8uDovbbXZAUwxmYfDiuXZ/b7xnAQwwFKJyQuUmCvhdF4Ek0DU61jabZ/QAgBnMMTYCQ==
X-Received: by 2002:a05:622a:342:b0:4b4:9590:c1c3 with SMTP id
 d75a77b69052e-4b49590d088mr76501161cf.18.1757018156640; 
 Thu, 04 Sep 2025 13:35:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50cbb54sm16701921fa.64.2025.09.04.13.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 13:35:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Devarsh Thakkar <devarsht@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Nathan Chancellor <nathan@kernel.org>
Cc: dri-devel@lists.freedesktop.org, patches@lists.linux.dev
Subject: Re: [PATCH] drm/bridge: cdns-dsi: Select VIDEOMODE_HELPERS
Date: Thu,  4 Sep 2025 23:35:51 +0300
Message-ID: <175701814843.2511186.11223011208724829948.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250821-cdns-videohelpers-v1-1-853e021908cf@kernel.org>
References: <20250821-cdns-videohelpers-v1-1-853e021908cf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k0FAPKvjBow7CprDaCwG9unKvTQC5GRv
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=68b9f82e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GyFj89KpxmL9ovfeiVUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MyBTYWx0ZWRfX5HtHUFYM3zgd
 1i/IXNCtbeAWGctwdgAINFherVqGSMNoZ0cRcgZF0AYYW6xMPhLeF8WOA0kVDgG3DTctUrLeese
 I2skMqby/EVJ/B7yBtSmPn/Q2agmpN4eO69Fg/4G3VcA/bgw6xIZtnoexP0njOe1K/4vgCN7UIv
 k4WeX+8OtcKNLm/AwFYH70OssBv6iJcinMEjwlTYSNL7jFI7H+FtccvqpX2+DRU0HFcS/CTBv0m
 7VGf/rtasDoKK9sJOjA0sQc54BZ1kzayCaIq3N7lnSpP5RiY8qqiLptd19v5uAzce98xNmW8VDI
 YM6IB6ysk+WbRqjYQronvl/FcJTM4uHABIEHlwJ3a3tE7CCsEAVEtjsY4iERsvA72vgV9iUxJzj
 9hO1SMsv
X-Proofpoint-ORIG-GUID: k0FAPKvjBow7CprDaCwG9unKvTQC5GRv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509040163
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

On Thu, 21 Aug 2025 13:52:12 -0700, Nathan Chancellor wrote:
> When no other driver selects CONFIG_VIDEOMODE_HELPERS but
> CONFIG_DRM_CDNS_DSI is enabled, there is a linker or modpost error:
> 
>   ERROR: modpost: "drm_display_mode_to_videomode" [drivers/gpu/drm/bridge/cadence/cdns-dsi.ko] undefined!
> 
> Select VIDEOMODE_HELPERS to ensure that this helper function is
> available to the driver.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: cdns-dsi: Select VIDEOMODE_HELPERS
      commit: 28fa7f5243c02a812af50707c9805c2b57deceeb

Best regards,
-- 
With best wishes
Dmitry

