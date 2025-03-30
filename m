Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A982CA75B79
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 19:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD1110E172;
	Sun, 30 Mar 2025 17:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/a/T8SF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0E310E172
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:44:32 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UDS8IO028908
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RGy/BXdkn+FaBjrjE0e4Ilhe
 82g2XsSffULT0Mpi/HU=; b=c/a/T8SFK0hvkeaIWm4+QDdjLdgpxofI4GfhWu0q
 IxP6UIO8QduzNTAMP2g8hs6201g+gVtfOdmS2I3IVYFEuk3Vq/qldBd8JJ3Glr/l
 vnLXYW3v1iUkkUtKGjywMNqpOLPo8tFkKyeL3xw2KJIy9zZoijq7eBFJO+wJw8xU
 t2j3RA/C3uZQn9AU5cMvY20+Ve7Wh+jpSNStbG4a+4dhQphDhzq0kN/db3NHuNiq
 QaJ/9xtrAorhel0MaIogJn5XpK3EJzYjaKYXJIod/+Gqz5QWeR66lTDdTPqP9Zt8
 nk6BkXtElnrSuWGXDFDq5J8kH6nBqhpnowShShkNDbfmOA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8xvak3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:44:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2ff799be8f5so5873349a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743356670; x=1743961470;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RGy/BXdkn+FaBjrjE0e4Ilhe82g2XsSffULT0Mpi/HU=;
 b=V4z5c6Eha/I3YPHnNKNHB/uwaWePI4vz1XtZMpSiQWSESJsTzxDa1pgNbUoLCE3x1D
 thdgeH7cqQJW3CK680fKvKGpxHkNL6oqBU8qgQw78oGmHY59l/mXDgdLNwDUz6zfFdHa
 gl4j4UhmPv41LwIvmOT7wjybfLIw46aNzDKDYG14xX6InlDt1ZSl44yx46Zr28krRcgE
 HTrCyMBgMhkAvBAWvZVL0LAXC32eee4JHSmKeLftjGKCL5TQYo9srpVVbt2bXfpVklU/
 ODJ21K9XX71cwgnrbKXZLzXkFTfXOcBSc4/nQZ4LmTlsUBKX7SoimLGtXTaI1MZlwH9e
 I19g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9JGnsIQN7cB6ih85IeLDtzppTlmirYSyvSWez+uZZn2d/XAszWCRexPosbfmArR8nuH6Bhl2FBf4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG5NumJoE7joHFVaiK5aTzUSLOd6b4rd9XQJKluNG27C0NyoEh
 fv2o8uNJ+Cl5HevCkvJope1rko81adk7zdn9V5JjqkNw6tUrqAbmccCnIZglOIsCy+pqYBp6Bf8
 CNR3ioRjq+AqtCnTRouc13fz2wlFIw2yaTIuu4Y3OQO78N8Q1TqvVs7q0QVgvSiQvTYWm4nLEvd
 H6DBcB0audFHNFU6/YwRKCu3R9CHChceS3oc6H/uqo/A==
X-Gm-Gg: ASbGncuWZ8M1THfad7sJGtZf/e9JK1CJDsHIElBo1PzJuq5gwa+Vc7eYQv0zYPYSLQ3
 SrGKeouQl7O5vDE+e5y4B0Ca8a4v57Oc6VqmHLNMbQclXXsM0Q39cRoYa5OBuAildByx8kPlV
X-Received: by 2002:a17:90b:2c8e:b0:2fe:a545:4c84 with SMTP id
 98e67ed59e1d1-305321634dcmr8432003a91.34.1743356669590; 
 Sun, 30 Mar 2025 10:44:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYT5EvuXXuFkySKTzmGaRo+rd5mpcdPSG+aWnOrbUh0FdJS7OnX4GtLZAsl5B9bjpyb5koZKe4LgDVemtvgkc=
X-Received: by 2002:a17:90b:2c8e:b0:2fe:a545:4c84 with SMTP id
 98e67ed59e1d1-305321634dcmr8431980a91.34.1743356669138; Sun, 30 Mar 2025
 10:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v3-1-156801d97a8a@linaro.org>
 <qub7j44btsgd2vdn67jn65c7y7kx4dhjojoh4z5erjalugctad@fyenu2xkuo4b>
 <CACr-zFCOqGmsFnJ_aW7cV99gmQdEtso3JGEiFFeKjk6-p6R54w@mail.gmail.com>
 <CAO9ioeWTgK2AYYt19VSOVjF6rt00xZ=gt1=dUb4A7UEEMwgaSA@mail.gmail.com>
 <CACr-zFA=m=ObUF3ZOgbGth5tXEkfUPczbEveEtsZGvNLXm2q2Q@mail.gmail.com>
In-Reply-To: <CACr-zFA=m=ObUF3ZOgbGth5tXEkfUPczbEveEtsZGvNLXm2q2Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 30 Mar 2025 20:44:17 +0300
X-Gm-Features: AQ5f1JopJpsKWlYgNEeDsWijzZrZlG95psgKKUCGGgfkE5wpBqVHTlAvFRUtsQk
Message-ID: <CAO9ioeWSn4H=y0c62c2TgXtPakhATv33NeYDcMLKMSmLLFo6bg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: jQAWDCdLcRjh2RwnqOZ8rZBL--Q82s8m
X-Authority-Analysis: v=2.4 cv=PquTbxM3 c=1 sm=1 tr=0 ts=67e982ff cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hzK5tJkHoMkwow-xmq4A:9
 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jQAWDCdLcRjh2RwnqOZ8rZBL--Q82s8m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300123
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

On Sun, 30 Mar 2025 at 20:21, Christopher Obbard
<christopher.obbard@linaro.org> wrote:
>
> Hi Dmitry,
>
> On Sun, 30 Mar 2025 at 18:17, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sun, 30 Mar 2025 at 20:11, Christopher Obbard
> > <christopher.obbard@linaro.org> wrote:
> > >
> > > Hi Dmitry,
> > >
> > > On Sun, 30 Mar 2025 at 17:42, Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Sun, Mar 30, 2025 at 05:31:20PM +0100, Christopher Obbard wrote:
> > > > > According to the eDP specification (VESA Embedded DisplayPort Standard
> > > > > v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> > > > > less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> > > > > the MIN value as the effective PWM bit count.
> > > > >
> > > > > This commit updates the logic to clamp the reported
> > > > > DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> > > > > DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. This ensures correct
> > > > > handling of eDP panels that report a zero PWM bit count but still
> > > > > provide valid non-zero MIN and MAX capability values. Without this
> > > > > clamping, brightness values may be interpreted incorrectly, leading
> > > > > to a dim or non-functional backlight.
> > > > >
> > > > > For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> > > > > ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> > > > > supports AUX backlight control and declares a valid 11-bit range.
> > > > > Clamping ensures brightness scaling works as intended on such panels.
> > > > >
> > > > > Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > > > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > > > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > > > > ---
> > > > > Changes in v3:
> > > > > - Properly rebase patch on top of latest version of drm-misc-next.
> > > > > - Make patch more generic by clamping PWM bit count to advertised MIN
> > > > >   and MAX capabilities (suggested by Dmitry).
> > > > > - Link to v2: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org
> > > > >
> > > > > Changes in v2:
> > > > > - Split backlight brightness patch from T14s OLED enablement series.
> > > > > - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> > > > > - Rework commit message to reference eDP spec.
> > > > > - Rebase on drm-misc-next.
> > > > > - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> > > > > ---
> > > > >  drivers/gpu/drm/display/drm_dp_helper.c | 48 ++++++++++++++++++++-------------
> > > > >  1 file changed, 30 insertions(+), 18 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > > index e2439c8a7fefe116b04aaa689b557e2387b05540..fcc26cb96a51066a503433b2dc660126155d179c 100644
> > > > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > > @@ -28,6 +28,7 @@
> > > > >  #include <linux/init.h>
> > > > >  #include <linux/iopoll.h>
> > > > >  #include <linux/kernel.h>
> > > > > +#include <linux/minmax.h>
> > > > >  #include <linux/module.h>
> > > > >  #include <linux/sched.h>
> > > > >  #include <linux/seq_file.h>
> > > > > @@ -4033,8 +4034,33 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > > > >                           aux->name, ret);
> > > > >               return -ENODEV;
> > > > >       }
> > > > > -
> > > >
> > > > Nitpick: please keep the empty line.
> > >
> > > Sure.
> > >
> > >
> > > > >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > > +
> > > > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > > > +     if (ret != 1) {
> > > >
> > > > No. Please take a look a few lines below, where you are removing
> > > > corresponding lines.
> > >
> > > Hmm, the original code which reads CAP_MIN and CAP_MAX both check if
> > > ret != 1 too, am I missing something ?
> >
> > Yes, you do. Please scroll this email a few lines down.
>
> OK, so just so I understand fully before preparing next version, no
> change is needed in the logic in this line? Just a commit message
> change?

Let me do that for you. This is from your patch:

@@ -4061,21 +4088,6 @@ drm_edp_backlight_probe_max(struct drm_dp_aux
*aux, struct drm_edp_backlight_inf

         * - FxP is within 25% of desired value.
         *   Note: 25% is arbitrary value and may need some tweak.
         */
-       ret = drm_dp_dpcd_read_byte(aux,
DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
-       if (ret < 0) {

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

So... I don't know what to say here.

>
>
> > >
> > >
> > > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > > > +                         aux->name, ret);
> > > > > +             return -ENODEV;
> > > >
> > > > Hmm. Why? It was 'return 0' before and your commit message contains no
> > > > explanation.
> > >
> > > Yeah, basically returning 0 here would not set bl->max but indicate
> > > success. Is my logic correct? I will simply update the commit message
> > > if so.
> >
> > Please describe that in the commit message why it's required for those
> > two reg reads to succeed.
>
> Sure.
>
> >
> > >
> > >
> > > > > +     }
> > > > > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > > +
> > > > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > > > +     if (ret != 1) {
> > > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > > > +                         aux->name, ret);
> > > > > +             return -ENODEV;
> > > > > +     }
> > > > > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > > +
> > > > > +     /*
> > > > > +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> > > > > +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > > > > +      * the sink must use the MIN value as the effective PWM bit count.
> > > > > +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
> > > > > +      * correct brightness scaling on compliant eDP panels.
> > > > > +      */
> > > > > +     pn = clamp(pn, pn_min, pn_max);
> > > > > +
> > > > >       bl->max = (1 << pn) - 1;
> > > > >       if (!driver_pwm_freq_hz)
> > > > >               return 0;
> > > > > @@ -4054,29 +4080,15 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > > > >        */
> > > > >       fxp = DIV_ROUND_CLOSEST(1000 * DP_EDP_BACKLIGHT_FREQ_BASE_KHZ, driver_pwm_freq_hz);
> > > > >
> > > > > -     /* Use highest possible value of Pn for more granularity of brightness adjustment while
> > > > > +     /*
> > > > > +      * Ensure frequency is within 25% of desired value.
> > > > > +      * Use highest possible value of Pn for more granularity of brightness adjustment while
> > > >
> > > > Huh? I don't see a corresponding code change. If you are fixing the
> > > > comment, it should come as a separate commit.
> > >
> > > Sure. I will drop this hunk.
> > > I folded it into this commit as it was a leftover artifact of moving
> > > the code around.
> >
> > Please refrain from folding unrelated changes.
>
> Sure. I will be more careful in future.
>
>
> > >
> > > >
> > > > >        * satisfying the conditions below.
> > > > >        * - Pn is in the range of Pn_min and Pn_max
> > > > >        * - F is in the range of 1 and 255
> > > > >        * - FxP is within 25% of desired value.
> > > > >        *   Note: 25% is arbitrary value and may need some tweak.
> > > > >        */
> > > > > -     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > > > -     if (ret < 0) {
> > > > > -             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > > > -                         aux->name, ret);
> > > > > -             return 0;
> > > > > -     }
> > > > > -     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > > > -     if (ret < 0) {
> > > > > -             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > > > -                         aux->name, ret);
> > > > > -             return 0;
> > > > > -     }
> > > > > -     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > > -     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > > -
> > > > > -     /* Ensure frequency is within 25% of desired value */
> > > > >       fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
> > > > >       fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
> > > > >       if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
