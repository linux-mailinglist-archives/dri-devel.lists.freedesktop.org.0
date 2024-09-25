Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCCE985097
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 03:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F97510E908;
	Wed, 25 Sep 2024 01:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="YXaIhOIT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC1E10E908
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 01:20:07 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42e6dbc8778so10161215e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 18:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1727227205; x=1727832005;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zs0AVZk2FLWrt2LrgFC0RhBODHzfoatv725m/+jHwQI=;
 b=YXaIhOITM1aOQ/gr+7uUQ0YUWE/gtweVvpOjnh7n04PD9oGXiDI5GrIXWBf4nuK2f0
 76SIRYli/oQdonwDziqBqRYLjsF/mnxqQAvS5qq8NauRMT8aHJAtovQKUZS5LVY+8A1Z
 LVMh5ytZX+d0mBoWz4PEFaUFutFTDUILVWgF95nC8q7qhJE7EWx1NZYO3+JlF+6/I51U
 aprk9oKkfJNK2rNURRteNdEPc6/7gzbGYqS0aRmGC5/Q+X1SQjoe2AHDkj8J1YejUVla
 v8EEOJKswjW3Z+ntY1OWnbYR2HWpa81sg+98v80mVHJ4gbnctp9LlSytyZFC0EQ65aE1
 Ai7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727227205; x=1727832005;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zs0AVZk2FLWrt2LrgFC0RhBODHzfoatv725m/+jHwQI=;
 b=hnvm27gGQHzXxejR0LQBD9UBiu9Wn61CJiIRLYApdTnQA9IbH2qLcpEaA2diCg1yBR
 jlM73t3DTVlamj3bD4nwjGJcEvwf/zHB6GtCYs/rbCA7stDArEkJ2osdqlpuPT3o7mH6
 fufcvbOSXJeArbw3mLyjvmcTl6xcCkAtZukzIxSSvEpoxlXKz/rEBi29YECmuGpCdv3q
 838tctt9y8jejCHO3dVuHkY4sQdb9VPzBOHqY5Hu8/K3vnwflrL2lpFk7oKUfqfHiicr
 pcTnM9evZhdY2FYP5hSGxVDPjAk3844kGsbKmysFzyZs9V38gylAhK5GD6v4i6NR146E
 O+dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg2RWISvr/bnhEyDhVptdSNEdC1m5NqdNw0WkLrbVrHSRckvWo8tlX468QvcKMjukJAIJlaTrJeU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSkgP9HvMF6qDhtCK0XcLHkz7aBwuZSwReZS+cxR/77CgqopxX
 ImLDtYlfPUA2yODT6W/giO/eaBhLHKXg3Aplynd07g9kUcUsk+0URK0WCToGw9rNcpw0AN+lS4j
 RWHOPjIh2P+vWh3oAregTaZJsNoLMgwDFDxk/uw==
X-Google-Smtp-Source: AGHT+IH+iFK7y8aE03rQ6NFQhlZMRzXmQpUxS8kKrhs3d7Nbvecq7OUeXWSs1iydGYss6EL6ah3GJcV3VJl+xbqAqBQ=
X-Received: by 2002:a5d:47c2:0:b0:374:c92b:80a0 with SMTP id
 ffacd0b85a97d-37cc2463ef4mr367129f8f.3.1727227205355; Tue, 24 Sep 2024
 18:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240923134227.11383-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240923134227.11383-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <42f0b4b1-87c7-4ebe-94a1-e2ad1a759dd7@quicinc.com>
 <CA+6=WdTTwXSyqGFGM6mqG3djDBH28mAzBUxUEUdr6z7W2g-A7A@mail.gmail.com>
 <c5f575d9-ea47-4f08-883d-36f01f304d75@quicinc.com>
In-Reply-To: <c5f575d9-ea47-4f08-883d-36f01f304d75@quicinc.com>
From: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Date: Wed, 25 Sep 2024 09:19:54 +0800
Message-ID: <CA+6=WdTuq4rOakKPwnC82twT1yWG09w6bcpztAXQ3p_vQqrnyg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panel: jd9365da: Modify Kingdisplay and Melfas
 panel timing
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dianders@chromium.org, hsinyi@google.com, 
 awarnecke002@hotmail.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Sep 25, 2024 at 12:11=E2=80=AFAM Jessica Zhang
<quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 9/23/2024 7:13 PM, zhaoxiong lv wrote:
> > On Tue, Sep 24, 2024 at 5:14=E2=80=AFAM Jessica Zhang <quic_jesszhan@qu=
icinc.com> wrote:
> >>
> >>
> >>
> >> On 9/23/2024 6:42 AM, Zhaoxiong Lv wrote:
> >>> In MTK chips, if the system starts suspending before the DRM runtime
> >>> resume has not completed, there is a possibility of a black screen
> >>> after waking the machine. Reduce the disable delay resolves this issu=
e,
> >>
> >> Hi Zhaoxiong,
> >>
> >> Do you mean "if the system starts suspending before the DRM runtime
> >> resume *has* completed" here?
> >
> > Hi Jessica
> >
> > Sorry, my description may not be clear enough. It should be when the
> > DRM runtime resume has not yet completed and the system enters sleep
> > mode at the same time.
>
> Got it, yes I think the reworded explanation in your reply is much cleare=
r.
>
> >
> >
> >>
> >>>
> >>> The "backlight_off_to_display_off_delay_ms" was added between
> >>> "backlight off" and "display off"  to prevent "display off" from bein=
g
> >>> executed when the backlight is not fully powered off, which may cause
> >>> a white screen. However, we removed this
> >>> "backlight_off_to_display_off_delay_ms" and found that this situation
> >>> did not occur. Therefore, in order to solve the problem mentioned
> >>> above, we We reduced it from 100ms to 3ms (tCMD_OFF >=3D 1ms).
> >>
> >> So from my understanding of this paragraph,
> >> `backlight_off_to_display_off_delay_ms` was added to prevent the displ=
ay
> >> powering off before backlight is fully powered off. You recently teste=
d
> >> dropping this completely and saw no issue with this.
> >>
> >> If that's the case, why not drop this delay completely?
> >>
> >> Thanks,
> >>
> >> Jessica Zhang
> >
> > Yes, there are currently no other issue after removing this delay.
> > The reason why I didn't completely remove this delay is because the
> > panel spec states that a delay of more than 1ms  (tCMD_OFF >=3D 1ms) is
> > required when entering diaplay_off (0x28H), so I reserved 3ms.
>
> Thanks for the clarification -- I see why you included the "(tCMD_OFF >=
=3D
> 1ms)" part now. Can you please specify in the commit message that the
> tCMD_OFF delay requirement is from the spec?
>
> Also can you remove the extra "We" in "we We reduced it from 100ms to 3ms=
"?
>
> Thanks,
>
> Jessica Zhang

OK, thanks for your correction, we will modify the commit message in
the next patch.

>
> >
> >>
> >>>
> >>> This is the timing specification for the two panels:
> >>> 1. Kingdisplay panel timing spec:
> >>> https://github.com/KD54183/-JD9365DA_Power-On-Off-Sequence_V012024092=
3
> >>> 2. LMFBX101117480 timing spec: https://github.com/chiohsin-lo/TDY-JD_=
LIB
> >>>
> >>>
> >>> Fixes: 2b976ad760dc ("drm/panel: jd9365da: Support for kd101ne3-40ti =
MIPI-DSI panel")
> >>> Fixes: c4ce398cf18a ("drm/panel: jd9365da: Support for Melfas lmfbx10=
1117480 MIPI-DSI panel")
> >>>
> >>> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.c=
om>
> >>> ---
> >>> Changes between V2 and V1:
> >>> -  1. Modify the commit message
> >>> -  2. Modify the value of backlight_off_to_display_off_delay_ms.
> >>> v1: https://lore.kernel.org/all/20240915080830.11318-2-lvzhaoxiong@hu=
aqin.corp-partner.google.com/
> >>> ---
> >>>    drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 4 ++--
> >>>    1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drive=
rs/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> >>> index 44897e5218a6..486aa20e5518 100644
> >>> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> >>> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> >>> @@ -858,7 +858,7 @@ static const struct jadard_panel_desc kingdisplay=
_kd101ne3_40ti_desc =3D {
> >>>        .reset_before_power_off_vcioo =3D true,
> >>>        .vcioo_to_lp11_delay_ms =3D 5,
> >>>        .lp11_to_reset_delay_ms =3D 10,
> >>> -     .backlight_off_to_display_off_delay_ms =3D 100,
> >>> +     .backlight_off_to_display_off_delay_ms =3D 3,
> >>>        .display_off_to_enter_sleep_delay_ms =3D 50,
> >>>        .enter_sleep_to_reset_down_delay_ms =3D 100,
> >>>    };
> >>> @@ -1109,7 +1109,7 @@ static const struct jadard_panel_desc melfas_lm=
fbx101117480_desc =3D {
> >>>        .reset_before_power_off_vcioo =3D true,
> >>>        .vcioo_to_lp11_delay_ms =3D 5,
> >>>        .lp11_to_reset_delay_ms =3D 10,
> >>> -     .backlight_off_to_display_off_delay_ms =3D 100,
> >>> +     .backlight_off_to_display_off_delay_ms =3D 3,
> >>>        .display_off_to_enter_sleep_delay_ms =3D 50,
> >>>        .enter_sleep_to_reset_down_delay_ms =3D 100,
> >>>    };
> >>> --
> >>> 2.17.1
> >>>
> >>
>
