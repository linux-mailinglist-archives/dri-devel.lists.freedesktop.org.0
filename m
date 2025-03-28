Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73018A7492B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 12:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA1710E0F7;
	Fri, 28 Mar 2025 11:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBpNxt4l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0DA10E0F7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 11:25:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S4vcMT011085
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 11:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pqlsG7HVwbMO8SHWDdbJKSEa
 wwKaCkeHowGeR1YIQhE=; b=KBpNxt4lD+OO3TdtoKGcrg8qwE1WcnvJ4TtjIZWl
 0E6CziXrkpGYac0fWEFMBaDRmzr60Ws/XegC44+Zp3D31pY0eUd5zg/iqvjlhNxa
 hg+kvZ9xbLtylQq/kGX5XHjYrtsMC6JTvZeo9/TIY5v0EFLQCXG39a5k7L9/djCB
 8qNmX6npmK5s8RN7bsLClBASc/7rqULlzUhNE1NbHi+2IxfETXnJTUhG+gqw+vDx
 2/02Il/WsN4g/m4G11wiM/ZyUxgUOOU0qs5KTea1kOU500a+Enabz7YzAvffgctW
 k4pLHjxLiQS2lr99VHpg9jIXNzwT6Ncto4J4ixzXRptIqQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0kqmdwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 11:25:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-30364fc706fso3597856a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 04:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743161145; x=1743765945;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pqlsG7HVwbMO8SHWDdbJKSEawwKaCkeHowGeR1YIQhE=;
 b=LUy2m2Bj0mMDQk6IuwvNI1RUx/fuEBmm440TG07w1mAZFkT3qTTtJwbS99oQavNKFc
 zy8qe0TN87Ak7vFV/qoITO1IAKvvMrAviTp//mlYRjFSOWQb7hqNgQCZ311+FrFlsDkW
 o6X+mbf9bHpJyGw0HOrwHapTN5+TVce/GLwVyZ8W5WuzaNkIv1prrtoneXl13kR5418n
 LDcyPlEzFUu43zN2Cn0cyFYEeSJHH7nT6Wc8YOV0MhbLQJx5Zls2MvZyMlauellyzRI2
 uCAve4J3urAxWCd3sU0vZ4R14pFnkpEJNl12VWlFheg2mAvbXOVcV3NdSdoVjHiDFQmc
 sXqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWbsSDOEDS30BehLlE0HU+ck7xHOL7vBu+5Zh2pPBQVvL66Q0JBthmpyEl70yzRgXgf7j2TMnt2pU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT8nl1Br2oXbg3UehEyYcMxZS1JmLhCzXwzErZ0DDM2RdsB6ux
 BaSEMLwYQzbdYYZr1WCcfPEpVTeBlyBOzDUkD1HZYnrgMjG+qmqywnOY96YEH1ze45QdZrKpCFM
 db9C9C5SHT7RttvBEkGUYGxjdfj2UaGm/m9PLOUxbPPNsVoBhfPwyQuIYZq1v9PP4MH3GXvrM8J
 jA/XcbsNq1O9lT8b6EKiyHoz7tWGr/9n8++zsNeVqy2Q==
X-Gm-Gg: ASbGnctngruCZZHVomHTa5uPZAuq2V4CCbHk4dy2omOPKiml9WWC7XWMB0tN6NchoXY
 eEK1RMCPJZD3VI86+Hqb0fhf0OTpx38y06cfszmb5MiUGFFfikRlGTOVqt4lBpUO85hg69A0Deq
 rlS0L7hlpCOONnJFkVGdhBenKLwaqXiA==
X-Received: by 2002:a17:90b:520a:b0:2fe:b470:dde4 with SMTP id
 98e67ed59e1d1-303a7d6629emr14425819a91.12.1743161145445; 
 Fri, 28 Mar 2025 04:25:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENcWU2HRB5T841FEOhELYIRsB9RU5dL+LX2Kxhjm9eEW11rYJtQocJo23zFLw/ZPShrHTSDf86pQll/18SFfU=
X-Received: by 2002:a17:90b:520a:b0:2fe:b470:dde4 with SMTP id
 98e67ed59e1d1-303a7d6629emr14425776a91.12.1743161144958; Fri, 28 Mar 2025
 04:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org>
 <07c48ba0-dcf5-4ece-8beb-f225652c5014@oss.qualcomm.com>
 <CACr-zFBwbniB3H5cnq0higsX6a_G4Be26N-nNL8JAzci8y9_Mw@mail.gmail.com>
In-Reply-To: <CACr-zFBwbniB3H5cnq0higsX6a_G4Be26N-nNL8JAzci8y9_Mw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 28 Mar 2025 13:25:33 +0200
X-Gm-Features: AQ5f1JrxhgMaxmJyZU0MNfPc6gRkgQJ5WNKikA3K4Gn68SeH5VdyTI6hypt1zpY
Message-ID: <CAO9ioeUGS0dX8tC6gfB8GmDB136WFUg4erE9NSNBUCcPrYsUTg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp: fallback to minimum when PWM bit count is zero
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: xmuJjhKoEHxh8BOJHc1Fdxq_CpkAs3aF
X-Authority-Analysis: v=2.4 cv=FrcF/3rq c=1 sm=1 tr=0 ts=67e6873a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PAbUfbVKnXYd5dnhZjsA:9
 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xmuJjhKoEHxh8BOJHc1Fdxq_CpkAs3aF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280077
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

On Thu, 27 Mar 2025 at 20:19, Christopher Obbard
<christopher.obbard@linaro.org> wrote:
>
> Hi Dmitry,
>
> On Thu, 27 Mar 2025 at 17:40, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On 27/03/2025 19:25, Christopher Obbard wrote:
> > > According to the eDP specification (e.g., VESA eDP 1.4b, section 3.3.10.2),
> > > if DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > > the sink is required to use the MIN value as the effective bit count.
> > >
> > > Some eDP panels report DP_EDP_PWMGEN_BIT_COUNT as 0 while still providing
> > > valid non-zero MIN and MAX capability values. This patch updates the logic
> > > to use the CAP_MIN value in such cases, ensuring correct scaling of AUX-set
> > > backlight brightness values.
> > >
> > > This improves compatibility with panels like the Samsung ATNA40YK20 used
> > > on the Lenovo T14s Gen6 (Snapdragon variant with OLED) which report a
> > > bit count of 0 but declares an 11-bit PWM capability range.
> > >
> > > Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > > ---
> > > Changes in v2:
> > > - Split backlight brightness patch from T14s OLED enablement series.
> > > - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> > > - Rework commit message to reference eDP spec.
> > > - Rebase on drm-misc-next.
> > > - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> > > ---
> > >   drivers/gpu/drm/display/drm_dp_helper.c | 50 ++++++++++++++++++++++-----------
> > >   1 file changed, 33 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > > index dbce1c3f49691fc687fee2404b723c73d533f23d..0b843d5b634f89f144b62b30311834d118b79ba9 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > @@ -4083,7 +4083,7 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > >   {
> > >       int fxp, fxp_min, fxp_max, fxp_actual, f = 1;
> > >       int ret;
> > > -     u8 pn, pn_min, pn_max;
> > > +     u8 pn, pn_min, pn_max, bl_caps;
> > >
> > >       if (!bl->aux_set)
> > >               return 0;
> > > @@ -4094,8 +4094,39 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > >                           aux->name, ret);
> > >               return -ENODEV;
> > >       }
> > > -
> > >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > +     if (ret != 1) {
> > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > +                         aux->name, ret);
> > > +             return 0;
> > > +     }
> > > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > +     if (ret != 1) {
> > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > +                         aux->name, ret);
> > > +             return 0;
> > > +     }
> > > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_ADJUSTMENT_CAP, &bl_caps);
> > > +     if (ret != 1) {
> > > +             bl_caps = 0;
> > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight adjustment cap: %d\n",
> > > +                     aux->name, ret);
> > > +     }
> > > +
> > > +     /*
> > > +      * Some eDP panels report brightness byte count support, but the byte count
> > > +      * reading is 0 (e.g. Samsung ATNA40YK20) so use pn_min instead.
> > > +      */
> > > +     if (!pn && (bl_caps & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> > > +         && pn_min)
> > > +             pn = pn_min;
> >
> > I wonder, what stops you from implementing this part according to the
> > standard, rather than adding a hack for 0 value.
>
> I am simply quite dense, I do not know this spec or the DRM code well
> at all ;-).

Okay, no worries. It should be pretty easy:

pn = clamp(pn_min, pn_max);

No need to check for pn being non-zero, etc.

> I do appreciate your continued reviews though, however painful it must be.

It's not, no worries.

-- 
With best wishes
Dmitry
