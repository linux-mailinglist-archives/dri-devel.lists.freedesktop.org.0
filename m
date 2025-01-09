Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 540D8A06D23
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 05:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B8E10ECDF;
	Thu,  9 Jan 2025 04:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zuOoSXkD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6BA10E33D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 04:37:00 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e479e529ebcso639202276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 20:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736397359; x=1737002159; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2lA5obqQucU5/GDB3hY6NFMYJYRA6Azxw0umsmePTs=;
 b=zuOoSXkDes4UJmwkAG8QDDqW9wFbG6jCu2bev27H+m4Vc5gCPWgPJUtya9t4ds43qp
 EhujAMuAHtmVTp0fUAgvh9sI/AbSVE1lbt7Y8BP7ZzQ+euskyb3QynKjqqP6nL8IGJIG
 LqLa8g9OBI2AnHGKoxKehW8BfRYWl3atOa3tFbHMZXht1LRee2rw2nTRgIBdFH9x5CCT
 tezIEQmgrxXhXsIK5PcxbQ4BWPQ5uOktqnc/rI0+Ko3uOCzwARLdRpHQGTAbkd8Avw9A
 SC9xPUhhMBJ2Yy8OjfYavcGGlCqxdmuASGg0wixPn7P91iq2N63XC424NKIrP/HXLnYz
 BG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736397359; x=1737002159;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W2lA5obqQucU5/GDB3hY6NFMYJYRA6Azxw0umsmePTs=;
 b=vSk2un9TATO9gCRJvyMwimgYfo5rL4xC9HXR+b6OmyUw5Gf6tvtJ2YHWfYmd/dc5b4
 6WSzkKNHVhbpkaTJMdalHIbirGiabgyU7ZkAJjwwN3cigXeXmBvdUuzWF9CzofJD5YC4
 czNmGYpC/O7gGKauuTptHiEqrSaqvbfjrMG7BioEmySg3mNrkuMkGtQiCuzgSAux8XDZ
 Lj8rlAu7hGgw3LSjARRVVWIQ0AKYNp0jpU8NFrhIVr3hxgc3l67v+WBbWHlwHrOuMEBf
 uyaJ1p2qmGQk6UAxAvjtIAITqcQ3vvHgg1OTKev9gqawKrcnVifHAkNOplfSwPZOsa+Y
 XUYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRueqPpjWb/5PN3HmZCbRm9oV6OdmhMAXCkfHnbvwmgjPw+7MY+vK+Qfh+WPg9U1BdR2FsxAaZo04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVk4tP2Vn2YsZe9PPvuq9Ileoos430xJHOUMXRLqQglB/TByKE
 R7RbAy8HT8+4jvUdpRlkYjJOAcbgAq+ZVixYugPhaErDQ+jssg47CtadTzT1bolLIhHABmyTVpK
 ek0mqoP3FiPxn7UwK2G6rGPJh45IR4wM5/L//yw==
X-Gm-Gg: ASbGnctW/oDEPsu22eI9KteUiTZ4fmNiM1/8wCjLFfydDqB+mrXQSGT52eMlOJukuLQ
 gUB7UxOE07/3GcUnSubs8lW7SbQzICDRyrEauxN4=
X-Google-Smtp-Source: AGHT+IGOg8iJXEfcZC1yEBLxBYLM51wSN33t6xFZdQKxKOAnmTXYvgx2qkkbhrdSEQ3TJ0Z/Bd3vEe/bnLexkgMJAI4=
X-Received: by 2002:a05:690c:6711:b0:6ef:60db:5e8d with SMTP id
 00721157ae682-6f531223024mr41819237b3.4.1736397359247; Wed, 08 Jan 2025
 20:35:59 -0800 (PST)
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-4-92c7c0a228e3@linaro.org>
 <yqbze4h6obiwulmvh64r62slaiih75hzescf5tjwqgtmhqy3wi@y4uedbo5jrzu>
 <95b83e6f-e455-4df0-b121-a1d900de0a56@quicinc.com>
In-Reply-To: <95b83e6f-e455-4df0-b121-a1d900de0a56@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 9 Jan 2025 12:35:48 +0800
X-Gm-Features: AbW1kvYMXvUWTaBYKAZC_PvZ4Q-vNHu92otZcT1Tqs-rCkGo9VRaKARW_Jgj4_g
Message-ID: <CABymUCOGzvR0utNUR3-6bFDi3c3yRTUu=CcTo2-eTKBvpoU-PA@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] drm/msm/dpu: decide right side per last bit
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
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

Jessica Zhang <quic_jesszhan@quicinc.com> =E4=BA=8E2025=E5=B9=B41=E6=9C=889=
=E6=97=A5=E5=91=A8=E5=9B=9B 07:41=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 12/19/2024 2:09 PM, Dmitry Baryshkov wrote:
> > On Thu, Dec 19, 2024 at 03:49:22PM +0800, Jun Nie wrote:
> >> decide right side of a pair per last bit, in case of multiple
> >> mixer pairs.
> >
> > Proper English sentences, please. Also describe why, not what.
>
> Hi Jun,
>
> Can we also add a note in the commit message on why the last bit check
> works?

Sure. How about this?

    Currently we only support one pair of mixer, so counter's
    non-zero value is enough to mark the right one. There will
    be case with multiple mixer pairs, so let's use the last bit to
    mark the right mixer in a mixer pair. If the last bit is set, it
    marks the right mixer in the pair, it's left mixer otherwise.

>
> Thanks,
>
> Jessica Zhang
>
> >
> >>
> >> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
> >>   1 file changed, 2 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_crtc.c
> >> index 7191b1a6d41b3..41c9d3e3e3c7c 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> @@ -369,11 +369,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu=
_crtc_mixer *mixer,
> >>   static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
> >>   {
> >>      struct dpu_crtc_state *crtc_state;
> >> -    int lm_idx, lm_horiz_position;
> >> +    int lm_idx;
> >>
> >>      crtc_state =3D to_dpu_crtc_state(crtc->state);
> >>
> >> -    lm_horiz_position =3D 0;
> >>      for (lm_idx =3D 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
> >>              const struct drm_rect *lm_roi =3D &crtc_state->lm_bounds[=
lm_idx];
> >>              struct dpu_hw_mixer *hw_lm =3D crtc_state->mixers[lm_idx]=
.hw_lm;
> >> @@ -384,7 +383,7 @@ static void _dpu_crtc_program_lm_output_roi(struct=
 drm_crtc *crtc)
> >>
> >>              cfg.out_width =3D drm_rect_width(lm_roi);
> >>              cfg.out_height =3D drm_rect_height(lm_roi);
> >> -            cfg.right_mixer =3D lm_horiz_position++;
> >> +            cfg.right_mixer =3D lm_idx & 0x1;
> >>              cfg.flags =3D 0;
> >>              hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
> >>      }
> >>
> >> --
> >> 2.34.1
> >>
> >
> > --
> > With best wishes
> > Dmitry
>
