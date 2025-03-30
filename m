Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54333A75B54
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 19:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1823B10E272;
	Sun, 30 Mar 2025 17:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXU74ws/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6D010E272
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:17:46 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UEkNON018380
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EcwUdgEiSYf8BTglQ0dIsDse
 ErgZKSvhrPT4HqNTL9k=; b=VXU74ws/EgVaXuLpI3SybCXfNFE+Sk1b6sz/qWN4
 FdRvgA76UV98/HCjnohkWCsIJcOHv/UVw28A6/KRAWokFNP4v0AhlDNiRYIDWsSC
 ynunMDf1SehqTwTrqkQ59fDrUijS8iSmZsnZduXLpoCxWkeL9K3TI9xUqvR5iEu9
 2dyx6X7x6wrpLjzPet1j4kLD1tDNN7lQlS83XKgK5v8dUtQ0B5D/DXFYAM0MC4PK
 dPN9lB5n8O/JPTGpDR8Yy1g0LdS6l7HjIpkX1Gm1Udu77ZgaCN8yC3mIihXntVE5
 lbWEGDkt3nYRuOCW6jI54xlXsmPCWvRWOvsAxh3WxcJ2zw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9mjjg2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:17:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2ff68033070so5885360a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743355065; x=1743959865;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EcwUdgEiSYf8BTglQ0dIsDseErgZKSvhrPT4HqNTL9k=;
 b=tkW5/wLUJqaGSZZ7hvNzMbhWWgxUpxZ+bL1wYyFLp1GuUonjkwk+utcok72yHID8/D
 fC6vvt6PeEGu3dq5b7sN3cD81TOO/2T6Kv7jlnmQxcMLwo2EZDFiRxtveuxUgGpDHQBp
 8RtP8Ud+i8xUCpgReb4QzGBJK5CQE2qULExr44qOHwDcDWgiynX9aGpdGKNtvyIslq9n
 8sDAZ8x8t49FL34oYaoV4RmwIeFM1RiZNwIMQ4jtRwBYHZ3Aom4CCFfvjoIcdT+hhru4
 zaPAMTjQGhoOfsZWSH+BuJT/oWeQM1rbapAV/nw4sxEO6qbDajElVgbGt17ntBANsvp/
 bRAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2GWiWw1ITT6DdwxbHVpxJIMxFm/XL+MxvBQ9xgBqu/YgDANl6p1gLTxAxgZRLDJP8ZcoloDe6eys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoHmsFCvHsYR8ZNBNk/jiCIUWQtpe9qAnK+y34mNZ0Lupe86Ea
 6TvnWhF+39jhQZXRZMeXHkF7oqr9erFyUMHIS3UxKMtxdih8un5WRP4GCpR9KaO75UyAWjKgtYz
 21ikEbU4YyPkSWYg0CCgYBo8gJe8GlTt7rL5p/vzrzAgdplNMIUvbIRb2eVuRt4LOxIufuNVQpm
 lfRaIF51qd/EkPSm74kWkCraP6RGfAU5isC+QtwYRd6g==
X-Gm-Gg: ASbGncs28Pk7eFrhjCpNEQ6VjpMQFiLhq40zOAw2+JHhjb2zpmGo9J0eNx8JHFfaDJY
 PLJMhAO8IxC1eL2EKuH/sDMA6C0n745XTa1T5JrYkM8F+sokC9NHb82vqwsSQqQQ2c+1sBrbo
X-Received: by 2002:a17:90b:3a44:b0:2fe:a8b1:7d8 with SMTP id
 98e67ed59e1d1-305321654e3mr9795819a91.25.1743355064706; 
 Sun, 30 Mar 2025 10:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE169pd79jXAIo01uzlr+kN2gZtfMu7kLVkVb4gh8lE1YluloYnuKAfYmw0Vaz94tUj+Ycsdr2wdfChwIZz4rc=
X-Received: by 2002:a17:90b:3a44:b0:2fe:a8b1:7d8 with SMTP id
 98e67ed59e1d1-305321654e3mr9795791a91.25.1743355064304; Sun, 30 Mar 2025
 10:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v3-1-156801d97a8a@linaro.org>
 <qub7j44btsgd2vdn67jn65c7y7kx4dhjojoh4z5erjalugctad@fyenu2xkuo4b>
 <CACr-zFCOqGmsFnJ_aW7cV99gmQdEtso3JGEiFFeKjk6-p6R54w@mail.gmail.com>
In-Reply-To: <CACr-zFCOqGmsFnJ_aW7cV99gmQdEtso3JGEiFFeKjk6-p6R54w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 30 Mar 2025 20:17:33 +0300
X-Gm-Features: AQ5f1Jp11F-zF0UJKEy2saRvg3cnx5AXZoElc2BHHK_IVeLuKyNtM3nbubHanT8
Message-ID: <CAO9ioeWTgK2AYYt19VSOVjF6rt00xZ=gt1=dUb4A7UEEMwgaSA@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=Mfhsu4/f c=1 sm=1 tr=0 ts=67e97cb9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=SrgeRYV4RCk8RcaWdqsA:9
 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WfIpbEDq2weIOHowO4VoywFb3r1R8pWf
X-Proofpoint-GUID: WfIpbEDq2weIOHowO4VoywFb3r1R8pWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300120
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

On Sun, 30 Mar 2025 at 20:11, Christopher Obbard
<christopher.obbard@linaro.org> wrote:
>
> Hi Dmitry,
>
> On Sun, 30 Mar 2025 at 17:42, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sun, Mar 30, 2025 at 05:31:20PM +0100, Christopher Obbard wrote:
> > > According to the eDP specification (VESA Embedded DisplayPort Standard
> > > v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> > > less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> > > the MIN value as the effective PWM bit count.
> > >
> > > This commit updates the logic to clamp the reported
> > > DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> > > DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. This ensures correct
> > > handling of eDP panels that report a zero PWM bit count but still
> > > provide valid non-zero MIN and MAX capability values. Without this
> > > clamping, brightness values may be interpreted incorrectly, leading
> > > to a dim or non-functional backlight.
> > >
> > > For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> > > ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> > > supports AUX backlight control and declares a valid 11-bit range.
> > > Clamping ensures brightness scaling works as intended on such panels.
> > >
> > > Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > > ---
> > > Changes in v3:
> > > - Properly rebase patch on top of latest version of drm-misc-next.
> > > - Make patch more generic by clamping PWM bit count to advertised MIN
> > >   and MAX capabilities (suggested by Dmitry).
> > > - Link to v2: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org
> > >
> > > Changes in v2:
> > > - Split backlight brightness patch from T14s OLED enablement series.
> > > - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> > > - Rework commit message to reference eDP spec.
> > > - Rebase on drm-misc-next.
> > > - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> > > ---
> > >  drivers/gpu/drm/display/drm_dp_helper.c | 48 ++++++++++++++++++++-------------
> > >  1 file changed, 30 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > > index e2439c8a7fefe116b04aaa689b557e2387b05540..fcc26cb96a51066a503433b2dc660126155d179c 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > @@ -28,6 +28,7 @@
> > >  #include <linux/init.h>
> > >  #include <linux/iopoll.h>
> > >  #include <linux/kernel.h>
> > > +#include <linux/minmax.h>
> > >  #include <linux/module.h>
> > >  #include <linux/sched.h>
> > >  #include <linux/seq_file.h>
> > > @@ -4033,8 +4034,33 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > >                           aux->name, ret);
> > >               return -ENODEV;
> > >       }
> > > -
> >
> > Nitpick: please keep the empty line.
>
> Sure.
>
>
> > >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > +     if (ret != 1) {
> >
> > No. Please take a look a few lines below, where you are removing
> > corresponding lines.
>
> Hmm, the original code which reads CAP_MIN and CAP_MAX both check if
> ret != 1 too, am I missing something ?

Yes, you do. Please scroll this email a few lines down.

>
>
> > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > +                         aux->name, ret);
> > > +             return -ENODEV;
> >
> > Hmm. Why? It was 'return 0' before and your commit message contains no
> > explanation.
>
> Yeah, basically returning 0 here would not set bl->max but indicate
> success. Is my logic correct? I will simply update the commit message
> if so.

Please describe that in the commit message why it's required for those
two reg reads to succeed.

>
>
> > > +     }
> > > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > +     if (ret != 1) {
> > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > +                         aux->name, ret);
> > > +             return -ENODEV;
> > > +     }
> > > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     /*
> > > +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> > > +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > > +      * the sink must use the MIN value as the effective PWM bit count.
> > > +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
> > > +      * correct brightness scaling on compliant eDP panels.
> > > +      */
> > > +     pn = clamp(pn, pn_min, pn_max);
> > > +
> > >       bl->max = (1 << pn) - 1;
> > >       if (!driver_pwm_freq_hz)
> > >               return 0;
> > > @@ -4054,29 +4080,15 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > >        */
> > >       fxp = DIV_ROUND_CLOSEST(1000 * DP_EDP_BACKLIGHT_FREQ_BASE_KHZ, driver_pwm_freq_hz);
> > >
> > > -     /* Use highest possible value of Pn for more granularity of brightness adjustment while
> > > +     /*
> > > +      * Ensure frequency is within 25% of desired value.
> > > +      * Use highest possible value of Pn for more granularity of brightness adjustment while
> >
> > Huh? I don't see a corresponding code change. If you are fixing the
> > comment, it should come as a separate commit.
>
> Sure. I will drop this hunk.
> I folded it into this commit as it was a leftover artifact of moving
> the code around.

Please refrain from folding unrelated changes.

>
> >
> > >        * satisfying the conditions below.
> > >        * - Pn is in the range of Pn_min and Pn_max
> > >        * - F is in the range of 1 and 255
> > >        * - FxP is within 25% of desired value.
> > >        *   Note: 25% is arbitrary value and may need some tweak.
> > >        */
> > > -     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > -     if (ret < 0) {
> > > -             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > -                         aux->name, ret);
> > > -             return 0;
> > > -     }
> > > -     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > -     if (ret < 0) {
> > > -             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > -                         aux->name, ret);
> > > -             return 0;
> > > -     }
> > > -     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > -     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > -
> > > -     /* Ensure frequency is within 25% of desired value */
> > >       fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
> > >       fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
> > >       if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
