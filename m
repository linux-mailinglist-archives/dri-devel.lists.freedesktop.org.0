Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AFE9EA352
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 01:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23A310E2BF;
	Tue, 10 Dec 2024 00:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fTTVStND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F7B10E2BD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 00:07:32 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e3971be41d8so3491280276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 16:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733789251; x=1734394051; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IN0RBBq3l3NKl+qyH0AuSlZDvfzudSlKO6BdtvV0zjc=;
 b=fTTVStNDK/BbTWr9q2N3L3H0P7fzmY+bn0NjeOPUg01IgnfDAbbySeC4VTL1qXW8bu
 WB6flouUTaJfzgYjUooeqUaYv0eLiLiNF8KPbBm0lj7GdOVKIES2AZ4SadDmQ+kTnm4R
 +PBUvctAM805HqROWC4BKSkEOGYiQ8pth1jmYa4ErverSkc70AyT/Lm/W3obvrSKf6go
 JeqBhhg6cD2p3jZ4jdApY4xo/qnSNtSYt9rmLZQ2Ad0NnCYGyVfHKwpq0tdkHU6YF7pH
 cZKU0pfvSBPjxzZcziOmMKHVvUYHwvLs9d0vEtDhNsRWWrsUVwEEzyJ/TDVz1QxQgNl9
 n7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733789251; x=1734394051;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IN0RBBq3l3NKl+qyH0AuSlZDvfzudSlKO6BdtvV0zjc=;
 b=PgSCUs8ysNxRXgBsH047/pzQ8jZXLjUNZyb313FzmiZVsynuZ0yseaSM3t/dgvjtFM
 +/P/nAjtDJYggvF5I5Gj7QbBPnsSsnL+httZuXlid+nRq8iXOLuyQX+NDIlZdQdngS5W
 nmYIhaXIj/FKoVtXUQKmb/Ib3UknGauYcZabOdpYo1uz692OeYFADMja1E02pkfOj+q8
 0jMwzc3Uyhiloz8p2eUv2iF22dpZtR9wZZcrwTJ19xx76OYk3VkrsZLuIpHA6QY1j0S0
 wVWTIY8brUbj1wFC3YxAhfHcYVbQbNbtrbNW+U8G8nT8gjfcFo+RU0QGY47LbzeEEEB0
 l/tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZErEnvLGM3ipIOnQhKw6VZ1nVSNNH5Q2DHbYYOxGlgt8NVrbyVFrCrhzmdJvG333QDJFsVmxcUs0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrBQGLWaXCDtzvjXW9C/HcjqEeTROEfkDEecW2g8qLJLzWagyy
 862+y+pO3q3PtR49zyYl7ezeXqgxJeDCdBxd9sDlWkduTrwn9BAQ9vtSE+NoG4D/fJTxZ4zSDNg
 a7SE/FwRCGQock4H4wVy1X+08g4NQtaFT1rawPw==
X-Gm-Gg: ASbGncuhdwkp/1J7Sf4M/mzmebqJI/RCQ15sYb+WbuWOmoKbEGAcjp+ZDoJj5dFiK2i
 /8xuoQjRj0AuiI1S3dJ96mX+yGp19/ZB/Sao=
X-Google-Smtp-Source: AGHT+IHhWqRs3wlmaCLMsv8F2T5AeqYDnF26AvHeIaRK/o4saq+QXlEUhJpchZj1/9SDJ4krZK9Z/dzQjdgXv6gUJqU=
X-Received: by 2002:a05:6902:2489:b0:e39:9291:7bd9 with SMTP id
 3f1490d57ef6-e3a59b3848bmr1981154276.31.1733789251068; Mon, 09 Dec 2024
 16:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20241209-dpu-fix-wb-v4-1-7fe93059f9e0@linaro.org>
 <9c42bbb1-bf6c-4323-95f9-0ac9e7426d0c@quicinc.com>
 <CAA8EJppMA-AREJata0MWHCDYC-7ra723zhC4Nu_xD59O0mX_Ag@mail.gmail.com>
 <a22262d5-f1e3-498b-a850-d377f29166f1@quicinc.com>
 <eysj65p526ice7taxh5c7whvyb4o4rnxnydgs6wz5ccnjh5mlj@z6xqdbqqy3lw>
 <8b3a4e0d-fcaf-4dcc-913d-1a4aa9546d53@quicinc.com>
In-Reply-To: <8b3a4e0d-fcaf-4dcc-913d-1a4aa9546d53@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 Dec 2024 02:07:20 +0200
Message-ID: <CAA8EJpqOT9gWLL1PDMnwXHnKpySNhWwoz1XMxXM6aZJEuJg0Tg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dpu1: don't choke on disabling the writeback
 connector
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Leonard Lausen <leonard@lausen.nl>,
 =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>, 
 Johan Hovold <johan+linaro@kernel.org>
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

On Tue, 10 Dec 2024 at 02:03, Abhinav Kumar <quic_abhinavk@quicinc.com> wro=
te:
>
>
>
> On 12/9/2024 3:51 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 09, 2024 at 03:36:29PM -0800, Abhinav Kumar wrote:
> >>
> >>
> >> On 12/9/2024 1:55 PM, Dmitry Baryshkov wrote:
> >>> On Mon, 9 Dec 2024 at 21:54, Abhinav Kumar <quic_abhinavk@quicinc.com=
> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 12/9/2024 2:04 AM, Dmitry Baryshkov wrote:
> >>>>> During suspend/resume process all connectors are explicitly disable=
d and
> >>>>> then reenabled. However resume fails because of the connector_statu=
s check:
> >>>>>
> >>>>> [dpu error]connector not connected 3
> >>>>> [drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Failed=
 to resume (-22)
> >>>>>
> >>>>> It doesn't make sense to check for the Writeback connected status (=
and
> >>>>> other drivers don't perform such check), so drop the check.
> >>>>>
> >>>>> It wasn't a problem before the commit 71174f362d67 ("drm/msm/dpu: m=
ove
> >>>>> writeback's atomic_check to dpu_writeback.c"), since encoder's
> >>>>> atomic_check() is called under a different conditions that the
> >>>>> connector's atomic_check() (e.g. it is not called if there is no
> >>>>> connected CRTC or if the corresponding connector is not a part of t=
he
> >>>>> new state).
> >>>>>
> >>>>> Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to=
 dpu_writeback.c")
> >>>>> Cc: stable@vger.kernel.org
> >>>>> Reported-by: Leonard Lausen <leonard@lausen.nl>
> >>>>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
> >>>>> Tested-by: Leonard Lausen <leonard@lausen.nl> # on sc7180 lazor
> >>>>> Reported-by: Gy=C3=B6rgy Kurucz <me@kuruczgy.com>
> >>>>> Link: https://lore.kernel.org/all/b70a4d1d-f98f-4169-942c-cb9006a42=
b40@kuruczgy.com/
> >>>>> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> >>>>> Link: https://lore.kernel.org/all/ZzyYI8KkWK36FfXf@hovoldconsulting=
.com/
> >>>>> Tested-by: Gy=C3=B6rgy Kurucz <me@kuruczgy.com>
> >>>>> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> >>>>> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>>> Leonard Lausen reported an issue with suspend/resume of the sc7180
> >>>>> devices. Fix the WB atomic check, which caused the issue.
> >>>>> ---
> >>>>> Changes in v4:
> >>>>> - Epanded commit message (Johan)
> >>>>> - Link to v3: https://lore.kernel.org/r/20241208-dpu-fix-wb-v3-1-a1=
de69ce4a1b@linaro.org
> >>>>>
> >>>>> Changes in v3:
> >>>>> - Rebased on top of msm-fixes
> >>>>> - Link to v2: https://lore.kernel.org/r/20240802-dpu-fix-wb-v2-0-7e=
ac9eb8e895@linaro.org
> >>>>>
> >>>>> Changes in v2:
> >>>>> - Reworked the writeback to just drop the connector->status check.
> >>>>> - Expanded commit message for the debugging patch.
> >>>>> - Link to v1: https://lore.kernel.org/r/20240709-dpu-fix-wb-v1-0-44=
8348bfd4cb@linaro.org
> >>>>> ---
> >>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ---
> >>>>>     1 file changed, 3 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/driver=
s/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> >>>>> index 16f144cbc0c986ee266412223d9e605b01f9fb8c..8ff496082902b1ee713=
e806140f39b4730ed256a 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> >>>>> @@ -42,9 +42,6 @@ static int dpu_wb_conn_atomic_check(struct drm_co=
nnector *connector,
> >>>>>         if (!conn_state || !conn_state->connector) {
> >>>>>                 DPU_ERROR("invalid connector state\n");
> >>>>>                 return -EINVAL;
> >>>>> -     } else if (conn_state->connector->status !=3D connector_statu=
s_connected) {
> >>>>> -             DPU_ERROR("connector not connected %d\n", conn_state-=
>connector->status);
> >>>>> -             return -EINVAL;
> >>>>>         }
> >>>>
> >>>> Can you please explain me about why the status was not already conne=
cted?
> >>>>
> >>>> In all the places I checked (unless I missed something), if the dete=
ct()
> >>>> callback is not registered, the connector is assumed connected like =
below:
> >>>>
> >>>> 404     if (funcs->detect_ctx)
> >>>> 405             ret =3D funcs->detect_ctx(connector, ctx, force);
> >>>> 406     else if (connector->funcs->detect)
> >>>> 407             ret =3D connector->funcs->detect(connector, force);
> >>>> 408     else
> >>>> 409             ret =3D connector_status_connected;
> >>>>
> >>>> We do not register .detect for WB as WB connector should be always
> >>>> connected.
> >>>>
> >>>> What scenario or use-case is making the connector status to somethin=
g
> >>>> other than connected?
> >>>>
> >>>> The places which mark the connector as unknown seem to be covered by
> >>>> warnings in drm_probe_helper.c but the bug report doesnt seem to be
> >>>> hitting those.
> >>>
> >>> Because nobody asks for the getconnector on that connector. For
> >>> example,drm_client_for_each_connector_iter() explicitly skips
> >>> WRITEBACK connectors. So, drm_client_modeset_probe() also doesn't
> >>> request ->fill_modes() on that connector.
> >>>
> >>> I'm almost sure that if somebody runs a `modetest -ac` on the
> >>> unpatched kernel after boot, there will be no suspend-related issues.
> >>> In fact, I've just checked on RB5.
> >>> /sys/class/drm/card0-Writeback-1/status reports 'unknown' before and
> >>> 'connected' afterwards. You can easily replicate that on your
> >>> hardware.
> >>>
> >>
> >> Yes this is correct, I just checked on sc7180.
> >>
> >> It stays at unknown till we run IGT. This matches your explanation
> >> perfectly.
> >>
> >>>>
> >>>> I am wondering if there is some case in fwk resetting this to unknow=
n
> >>>> silently (which is incorrect) and perhaps other drivers dont hit thi=
s as
> >>>> there is a .detect registered which always returns connected and MSM
> >>>> should follow that.
> >>>>
> >>>> 111 static enum drm_connector_status
> >>>> 112 komeda_wb_connector_detect(struct drm_connector *connector, bool=
 force)
> >>>> 113 {
> >>>> 114     return connector_status_connected;
> >>>> 115 }
> >>>> 116
> >>>
> >>> No, that won't help. You can add a detect() callback and verify that
> >>> simply isn't getting called. It's not resetting the connector->status=
,
> >>> it's nobody setting it for the first time.
> >>>
> >>
> >> What we found is that drm_atomic_helper_suspend() which calls
> >> drm_atomic_helper_duplicate_state(), uses drm_for_each_connector_iter(=
)
> >> which does not rely on the last atomic state but actually uses the
> >> config->connector_list which in-turn disables all connectors including=
 WB.
> >>
> >> Is this expected that even though WB was not really there in the last
> >> atomic_state before the suspend, still ended up suspending / resuming =
and
> >> thus exposing this bug?
> >
> > Note, atomic_state is a "patch", not a full state. Thus the described
> > behaviour is expected: it walks over all connectors and checks their
> > drm_connector_state information. Some of the connectors (if they were
> > not touched by the commit) might have been skipped from the last
> > drm_atomic_state structure.
> >
>
> Yes, I understand the patched part. So what i meant was, we observed
> that CLIENT_CAP_WRITEBACK was never set which means WB was never exposed
> as a connector so it could not have been part of any commits. IOW, it
> would have never been enabled. In that case, is it still right to
> disable WB connector and enable it again considering that it could not
> have been enabled at any point before this.

... to disable WB connector on suspend and restore its state on resume ...

Yes, it's correct behaviour. It requires less clumsy code and less
special cases compared to using some other euristics in order to
select, which connector was ever enabled.

>
> >>
> >> I am  now more convinced of this change as I understand the flow bette=
r. But
> >> wanted to highlight above observation.
> >>
> >>>>>
> >>>>>         crtc =3D conn_state->crtc;
> >>>>>
> >>>>> ---
> >>>>> base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
> >>>>> change-id: 20240709-dpu-fix-wb-6cd57e3eb182
> >>>>>
> >>>>> Best regards,
> >>>
> >>>
> >>>
> >



--=20
With best wishes
Dmitry
