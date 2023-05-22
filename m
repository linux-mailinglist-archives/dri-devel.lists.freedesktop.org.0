Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0934370D6E8
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D5510E40B;
	Tue, 23 May 2023 08:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2732F10E107;
 Mon, 22 May 2023 09:30:18 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f3bb61f860so1708475e87.3; 
 Mon, 22 May 2023 02:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684747816; x=1687339816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N2xyW26ygJSV7jGPDNFX5kKvBpAiH74OJxHDLif1V4o=;
 b=RUD8CW17ehLYABgkufotE7+2qA9MpQEUmH+a8Rzsv+BHTFpkQXkp/vUAoPyUND4WUa
 df8zjLmWIsuyQpd0DvHu/G3O1/2e4FVgynUTVzKZOAHv9L/ks4U2wElYhdG0cnXNDszK
 gTO/PkGc7RM8MyNAW2R1JXFqVuLd8vUvteqAFCV4ZHPafnbrsgCOMF9tMaGlDLolyrMT
 itm3YGRJC6uJ8Sd1fKBuIgsQ3GwQti55DHbBOfA/xI6JndZhdZZLa4YvdkyDekb9MBGh
 QVy2wxgngibHXKXssGnCfKbqsalSZPeUWc3hs2T62tJ5IaU+EyDu2k4A0jQw6RLQ8yJZ
 bd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684747816; x=1687339816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N2xyW26ygJSV7jGPDNFX5kKvBpAiH74OJxHDLif1V4o=;
 b=SHNjvLfzXyBTYeoYYRA9xKp2NIW5ITm8L9IzE5HCm+nDnAeOG0FCej0kqQ1XdB5+s4
 sfSZ9ABBiFvziSQ2LRAVOIS3iu2eI/kUWe9rM6WgjKSTdK7SK0f86Fj3J+5DynC9qIKB
 Wj/E9wm0VR9g9d+lBaLbSpxAlxpCzyl/Q2qp2Wr08WKG3ZkXlwomk7SpjuMvzeSvNoR6
 30LvTBn4RPV3s0TRGYB9K65qQZXKz0J6jCza5+D4ltRIQUb0d1jHXn3ulpqhatksX04j
 id8L2kI5mdLgbZSDCl4bayeX7NWfj+K+4RRRNk6mfd/60MCfiyUOsW+IjpMRCdlOOjnl
 /ahQ==
X-Gm-Message-State: AC+VfDxnv0Hn+LReQga3qIzSHGuhO5PkO5rT5J0KtmmS8OSz9TN6aaeR
 CF6CKJYNJyrMSBoF8ugjqksbXaSGXYw+CLmblxU=
X-Google-Smtp-Source: ACHHUZ6/K2VPQrqZf4bbMsZ6RsWzfsJGdcrFrCLU2weoNL6fRpXehhPH0QBKWbv2BmkB7pm4G6ojPKMVBze4qdsiKeM=
X-Received: by 2002:ac2:4259:0:b0:4f3:a55a:bace with SMTP id
 m25-20020ac24259000000b004f3a55abacemr2981630lfl.7.1684747815493; Mon, 22 May
 2023 02:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-2-d1bac46db075@freebox.fr>
 <6e807c05-a990-5692-3f84-2e4153c8c278@linaro.org>
 <905b4150-6e15-4172-10cf-19aa0ebf817c@quicinc.com>
 <50fc88f9-4304-110c-84e8-15dfdeee062f@linaro.org>
In-Reply-To: <50fc88f9-4304-110c-84e8-15dfdeee062f@linaro.org>
From: Arnaud Vrac <rawoul@gmail.com>
Date: Mon, 22 May 2023 11:30:02 +0200
Message-ID: <CAN5H-g4zEkxrUr2_0QZfNHndVqF=L-Bx3OTbKnFjQVmoYc7FyQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 02/11] drm/msm/dpu: use the actual lm maximum
 width instead of a hardcoded value
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 23 May 2023 08:13:57 +0000
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Arnaud Vrac <avrac@freebox.fr>,
 Jeykumar Sankaran <quic_jeykumar@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le sam. 20 mai 2023 =C3=A0 22:49, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> a =C3=A9crit :
>
> On 20/04/2023 20:47, Jeykumar Sankaran wrote:
> >
> >
> > On 4/19/2023 3:23 PM, Dmitry Baryshkov wrote:
> >> On 19/04/2023 17:41, Arnaud Vrac wrote:
> >>> This avoids using two LMs instead of one when the display width is lo=
wer
> >>> than the maximum supported value. For example on MSM8996/MSM8998, the
> >>> actual maxwidth is 2560, so we would use two LMs for 1280x720 or
> >>> 1920x1080 resolutions, while one is enough.
> >>>
> >>> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> >>
> >> While this looks correct (and following what we have in 4.4), later
> >> vendor kernels specify the topology explicitly. Probably we should
> >> check this with the hw guys, because it might be the following case:
> >> even though a single LM can supply the mode, it will spend more power
> >> compared to two LMs.
> >>
> >>
> > Yes. 2 LM split will allow the HW to run in lower mdp core clock. Can
> > you maintain the split_threshold in the hw catalog until per mode
> > topology is available?
>
> I don't think it warrants the trouble, unless we have a real usecase
> when the device is short of LMs.
>
> Arnaud, I'll mark this patch as Rejected for now, unless it fixes an LM
> shortage for your platform.

It's fine, if I remember correctly I wrote this patch because display
wouldn't work before I fixed the LM pairings on msm8998, but now it's
not a requirement anymore.

>
> >
> > Jeykumar S
> >>> ---
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++-----
> >>>   1 file changed, 5 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> index 1dc5dbe585723..dd2914726c4f6 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> @@ -53,8 +53,6 @@
> >>>   #define IDLE_SHORT_TIMEOUT    1
> >>> -#define MAX_HDISPLAY_SPLIT 1080
> >>> -
> >>>   /* timeout in frames waiting for frame done */
> >>>   #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
> >>> @@ -568,10 +566,12 @@ static struct msm_display_topology
> >>> dpu_encoder_get_topology(
> >>>        */
> >>>       if (intf_count =3D=3D 2)
> >>>           topology.num_lm =3D 2;
> >>> -    else if (!dpu_kms->catalog->caps->has_3d_merge)
> >>> -        topology.num_lm =3D 1;
> >>> +    else if (dpu_kms->catalog->caps->has_3d_merge &&
> >>> +         dpu_kms->catalog->mixer_count > 0 &&
> >>> +         mode->hdisplay > dpu_kms->catalog->mixer[0].sblk->maxwidth)
> >>> +        topology.num_lm =3D 2;
> >>>       else
> >>> -        topology.num_lm =3D (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? =
2
> >>> : 1;
> >>> +        topology.num_lm =3D 1;
> >>>       if (crtc_state->ctm)
> >>>           topology.num_dspp =3D topology.num_lm;
> >>>
> >>
>
> --
> With best wishes
> Dmitry
>
