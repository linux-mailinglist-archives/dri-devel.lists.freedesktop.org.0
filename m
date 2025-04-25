Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F69A9C36B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54EB10E8DF;
	Fri, 25 Apr 2025 09:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mQfJItrK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBDF10E8DF
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:28:08 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T6VI022928
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xt2jjx4txmL59hNW/slqoBCJ
 /oGYSTNA7mQ8pWiEl4c=; b=mQfJItrKW7QKh1CevTs4eVfDZpk+xBmfsJ8ePfyr
 MgXxxMg3u2dgrr9RSzxFr9XbRswUPTH+hxBv7oQDcYv2Teli2ugzwXsX+l3hABqN
 aoQfN66dTCS+BqsgAinm9a3y3KMtVtU5oMaFdOh2iBBJiQQmCYBnc+dMC7bVJLeo
 I0g80pPZkllaFWAomLm5UI81/VsbNyJJvWCeALOkng4plnQj4JF6cVM17Spkd6jq
 od8pEIWi0ifYu/hkQ90atrmCfFyZCBoNPD1dDmfjC8MBH2Z0FWYibU4UiX3JCcEO
 DJEP1Ur5hWgMXAoy6BY0iH5ey4ypHT7Hk+VTBGaz7aFz8w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0gjww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:28:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2264e5b2b7cso19459675ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 02:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745573287; x=1746178087;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xt2jjx4txmL59hNW/slqoBCJ/oGYSTNA7mQ8pWiEl4c=;
 b=ggGC9rYylZ+OhnRH33+JoQiOxIkGXwsKMqBo5BCj3f315yQkMl/PKI5DJ/XqUcJF1+
 Sk6t8r8Eol8XtZPom/ybtwgq/DNr1OkgwHgWe3bzGtDI52zmurszrzo2X+SGktfPgmrK
 BE41na4hstSbhlRtKKtLUwNHV7c4S3Yk5Txh0qzk1yjPYuWWXfC7FDJH8/PBOoVlFOnU
 92/aV5svvlT27xeThejByijneOlEwUNTJue7wQF+u+VUNANCP1RhyafIExXlfYif7I0U
 4bY7V367hiI5wMkEh/Wyb4OIiwEv/QIHIG/TUQh1qljfishPt7nwboSOX7O2+cwR1kuc
 mF6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlRyld89GCX1EDRfP33U4sa9T+5GTa9kTScnvKOHd6WUnABapC4LiIRWUaN8zEGSXlkoaY+Rw/OSo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyN7RNKXo3KeXw/eSaEvJT0JRAznnC7RVcV53FGOtHvb6ap+JQY
 DXS4MJfNxTrEGakEdq/t5M2RZIO+ebBvxrRhtvekYZ4IuL0fzzJOUWJciNnk7yADbdTlbuJjWDo
 skRm/HhHDC3Qw9UymHoWyjyv3+J6YUl1yQsddGO8xvd54sJIwVFBD205eQO91VrGY/6tmvE7xta
 uBjC/oanz9EYYJaqvmFrnZb23YIMPtWX/2PPaq0IIJCg==
X-Gm-Gg: ASbGncuO7ja1GwjuT9SK8w+Jx4v1tPNBEkUND0i4eekr1Oh10CprqSDFQdgyqaAQd7/
 balvxTJaMXGEWuyLF6BcH6PQjvTRbx+8AI6giU3jTNY6qK3k3xF+18AA9TcTcU2n+JWhRQZJC1i
 aFI8n9Dy0=
X-Received: by 2002:a17:902:ecc2:b0:224:1ec0:8a16 with SMTP id
 d9443c01a7336-22dbf5ee6c8mr22878865ad.21.1745573286934; 
 Fri, 25 Apr 2025 02:28:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7sY9pNe21FkhpOVYLUJOVzPn9xf8OZzxysQbok+sCqT4QpEP41QTCap95a4a+qxhM7yJVJ2G9ynG4MaRKCCk=
X-Received: by 2002:a17:902:ecc2:b0:224:1ec0:8a16 with SMTP id
 d9443c01a7336-22dbf5ee6c8mr22878495ad.21.1745573286549; Fri, 25 Apr 2025
 02:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-6-c983788987ae@linaro.org>
 <63e5ddf6-151a-42aa-b2cf-003d91b34a04@quicinc.com>
 <s63lvzn35d7xcvw3kkmtasyinxbqa35juyxosdscfk6vhty4pw@hu3dotyklo3r>
 <402bbda7-33c6-49b2-89c7-37372cc07457@quicinc.com>
In-Reply-To: <402bbda7-33c6-49b2-89c7-37372cc07457@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:27:55 +0300
X-Gm-Features: ATxdqUHcGBSXlw8hFJp5C9Ri6LceneKkEY0gyZGnRt8lLgLrZ0UNEEiCOxxayBo
Message-ID: <CAO9ioeXhjrOyKz3N3oU6QxW+u6WUC4R5XXqWgb=7iF7Hk0Q_nQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm/msm/mdp4: switch LVDS to use
 drm_bridge/_connector
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: X7VZPFqBK547UrcQwv_xrD_1ZXDYDs5k
X-Proofpoint-ORIG-GUID: X7VZPFqBK547UrcQwv_xrD_1ZXDYDs5k
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680b55a7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=ZLr3lU9xobrfYbAAIvMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OCBTYWx0ZWRfXyjW78iYKIi33
 xuQeG6UfxfKK7cDtLboBNqHmD35xo+pJAApAA06fL9DP6XKEYtJxCXtcfGjnEIKAG8gEbFe1w1A
 /MhSs5DmOrXiOiNsDWyiCc4q5yIj5zwmtK7IbuBz2IbHLumoW26FhBR38YdNkxmLXJiHKvwm39q
 tXO+BNeJbgDj9B6nhq2EHNIC3ON36H6GWWAS97pDmBv8MEX5QhbitNPXXFg/49w0SbdDlvNHYX5
 pJLe69Hvzr+BYlc7WAsx0Y2B5ootTKjq2Jt5wPYCEZxQrsq3LggaW6QLPj7WGlSo1sECf9KtFx0
 XT6WwKZBODGoQXrW7TLP5od8QkaFUQTjJXg2UnRQ3mZUXvRZm3cToNmadN1CusoPlKv1qyf6SI6
 tu7mAe3jEl2kDxlnG2Reb8lwJ+/9d0lYPv4r45Tyyzu5xOtm5BSHGGUGPcqRCbwZxZ2dy1h9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250068
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

On Fri, 25 Apr 2025 at 00:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/24/2025 3:23 AM, Dmitry Baryshkov wrote:
> > On Wed, Apr 23, 2025 at 07:04:16PM -0700, Abhinav Kumar wrote:
> >>
> >>
> >> On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
> >>> LVDS support in MDP4 driver makes use of drm_connector directly. However
> >>> LCDC encoder and LVDS connector are wrappers around drm_panel. Switch
> >>> them to use drm_panel_bridge/drm_bridge_connector. This allows using
> >>> standard interface for the drm_panel and also inserting additional
> >>> bridges between encoder and panel.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/Makefile                       |   1 -
> >>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 +++++--
> >>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 +-
> >>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  20 +----
> >>>    .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 100 ---------------------
> >>>    5 files changed, 28 insertions(+), 133 deletions(-)
> >>>
> >>> @@ -199,27 +201,43 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
> >>>              * bail out early if there is no panel node (no need to
> >>>              * initialize LCDC encoder and LVDS connector)
> >>>              */
> >>> -           panel_node = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
> >>> -           if (!panel_node)
> >>> -                   return 0;
> >>> +           next_bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, 0);
> >>> +           if (IS_ERR(next_bridge)) {
> >>> +                   ret = PTR_ERR(next_bridge);
> >>> +                   if (ret == -ENODEV)
> >>> +                           return 0;
> >>> +                   return ret;
> >>> +           }
> >>> -           encoder = mdp4_lcdc_encoder_init(dev, panel_node);
> >>> +           encoder = mdp4_lcdc_encoder_init(dev);
> >>>             if (IS_ERR(encoder)) {
> >>>                     DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
> >>> -                   of_node_put(panel_node);
> >>>                     return PTR_ERR(encoder);
> >>>             }
> >>>             /* LCDC can be hooked to DMA_P (TODO: Add DMA_S later?) */
> >>>             encoder->possible_crtcs = 1 << DMA_P;
> >>> -           connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
> >>> +           ret = drm_bridge_attach(encoder, next_bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >>> +           if (ret) {
> >>> +                   DRM_DEV_ERROR(dev->dev, "failed to attach LVDS panel/bridge: %d\n", ret);
> >>> +
> >>> +                   return ret;
> >>> +           }
> >>
> >> Can you pls point me to the lvds bridge used with this apq8064 board? I was
> >> unable to find it. Just wanted to compare that against this while reviewing.
> >
> > It's the panel bridge, wrapping one of the LVDS panels.
> >
>
> Yes but what I wanted to check was which LVDS panel was being used so
> far. Looks like for arm32 the dts is missing? As I couldnt find the lvds
> out endpoint. So can you pls point me to the lvds panel you verified
> this with?

I used the AUO b101xtn01 panel connected to the LVDS connector on the
IFC6410. I'm not posting DT bits since the panel is not a part of the
kit.

>
>
> >>> +
> >>> +           connector = drm_bridge_connector_init(dev, encoder);
> >>>             if (IS_ERR(connector)) {
> >>>                     DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
> >>> -                   of_node_put(panel_node);
> >>>                     return PTR_ERR(connector);
> >>>             }
> >>> +           ret = drm_connector_attach_encoder(connector, encoder);
> >>> +           if (ret) {
> >>> +                   DRM_DEV_ERROR(dev->dev, "failed to attach LVDS connector: %d\n", ret);
> >>> +
> >>> +                   return ret;
> >>> +           }
> >>> +
> >>>             break;
> >>>     case DRM_MODE_ENCODER_TMDS:
> >>>             encoder = mdp4_dtv_encoder_init(dev);
> >
>


-- 
With best wishes
Dmitry
