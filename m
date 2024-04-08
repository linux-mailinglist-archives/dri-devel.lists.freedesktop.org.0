Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8809089CE3C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 00:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5FB10EC48;
	Mon,  8 Apr 2024 22:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y6q6n1WL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C02310F07E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 22:08:09 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dd02fb9a31cso4416409276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 15:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712614088; x=1713218888; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VMPTa7YZG9SFezIxNc9hWe537aXkTHEaz4nODnhs3/4=;
 b=Y6q6n1WL9Xj51OHVyAVucw3c+A/Oi/cMP+hk/ilxd9Csddoioyd0G6FOEy7LaRMRHm
 Rg2GD7vl954SmPrnQsYoddk6n6W+iEADr9V3YH0zHpF+mQzNof+tAmL0l9rpkkOhNOmy
 SzjsF84JVoovXBaUTuqCY97F0UTqORjvaAiKZcssVTZY3GSj75rjB5E3zkiv5ALbquFG
 fWJXTH/etp4skqOCr1c7T554fyrKFdA7LQOxVfr7l2ipTSZ7eVS8m+4Na+e97w49lyWu
 WzncCe27pX2+ES/1lB29U3oDZ6cBzAW5BcoSqcUtFRtgGlN2KZm3MvZWnxOW/l31wn2A
 CiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712614088; x=1713218888;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VMPTa7YZG9SFezIxNc9hWe537aXkTHEaz4nODnhs3/4=;
 b=S0jOaQA1G0y1olCpiQywcvCnAjyVPYoulGXKy972QyoOyUB/lubmQkBK9Aj5AyP9Er
 2mRe7+2ioPI8RaPGDdHhf2AWqf11VwpZfhh4bF9fN3PubTSPw06KRw1TW258wr7gOj/l
 a2dLdVH8fOLaNCvowDOQG+Qo5l1GOFTD8J0HiAw+mxR6026zzkEFpfRY5wklrSR710Ja
 l0Fq/y8d4nrFnSf33eAijF15JdB3JMdweDemRIYgLCCljHnJVn+o74FqLiKU7GHPVhEn
 sZQ7VwWa8UVl0n5B/b8/8+WiKN0inavJXUl6WKlFWZ8UTmdR6Ip+Xs1Jxm2acnkfX1CN
 1gyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXunojeMwG2gCCtkDYf4qD7oT0g5WopKMinRpkL1cKStl9FypxSLGPtCOGrje19sheJvlaQaYxSsYZkqYefXGUvTvNWr/kGP87fQrhL5+yQ
X-Gm-Message-State: AOJu0YxG2conL+QNz0hhf3ibnuzXCsO84sRs+mEFACcEreatGPfCBzki
 wCj9vgtkDUVH3uDKyTr670OlMht2W6Y1tCXUFUMJI5O13ZrS04u8ImT9GIT/cutbq5Dnk5kWxlZ
 EFPjo5tnKNrbeWgDmC4R/n5ha+12D/7P5nuTYSA==
X-Google-Smtp-Source: AGHT+IHnwDBFmtmInPRd6q4lnmrUf3qgd9ZdW3vy7JyOs/HLpkeABlYPfLgTMEPSv4mYhPXpglVRbif+gfL2zsRQTqA=
X-Received: by 2002:a25:48ca:0:b0:dc6:9daf:35c7 with SMTP id
 v193-20020a2548ca000000b00dc69daf35c7mr7528021yba.28.1712614088530; Mon, 08
 Apr 2024 15:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
 <ale6wbwzkfagcg2q6glb4vsxu3pthhkk3tquv2ixlatbdryqvh@xscsq2h6emho>
 <01cb1c0d-a801-37f9-2f55-2bbd8d3a68b9@quicinc.com>
 <CAA8EJprzH0LiWNx9Udt6og3G063odY6ccvaAgsNS1r3zG8TmdA@mail.gmail.com>
 <905222ad-612a-3eaf-d966-23c89c99e1f0@quicinc.com>
In-Reply-To: <905222ad-612a-3eaf-d966-23c89c99e1f0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Apr 2024 01:07:57 +0300
Message-ID: <CAA8EJpp6Lc7sc5fnKp+O8TYdaywiE+dZ=YJin351s=r5rxi+Kw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: call dp_hpd_plug_handle()/unplug_handle()
 directly for external HPD
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_jesszhan@quicinc.com, quic_bjorande@quicinc.com, johan@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 9 Apr 2024 at 00:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/8/2024 2:12 PM, Dmitry Baryshkov wrote:
> > On Mon, 8 Apr 2024 at 22:43, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 4/7/2024 11:48 AM, Bjorn Andersson wrote:
> >>> On Fri, Apr 05, 2024 at 08:15:47PM -0700, Abhinav Kumar wrote:
> >>>> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>> [..]
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> index d80f89581760..bfb6dfff27e8 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> @@ -1665,7 +1665,7 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> >>>>               return;
> >>>>
> >>>>       if (!dp_display->link_ready && status == connector_status_connected)
> >>>> -            dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> >>>> +            dp_hpd_plug_handle(dp, 0);
> >>>
> >>> If I read the code correctly, and we get an external connect event
> >>> inbetween a previous disconnect and the related disable call, this
> >>> should result in a PLUG_INT being injected into the queue still.
> >>>
> >>> Will that not cause the same problem?
> >>>
> >>> Regards,
> >>> Bjorn
> >>>
> >>
> >> Yes, your observation is correct and I had asked the same question to
> >> kuogee before taking over this change and posting.
> >
> > Should it then have the Co-developed-by trailers?
> >
>
> hmmm, perhaps but that didnt result in any code change between v2 and
> v3, so I didnt add it.

So who authored v0 of it? From your text I had an impression that it
was Kuogee. Please excuse me if I was wrong.

>
> >> We will have to handle that case separately. I don't have a good
> >> solution yet for it without requiring further rework or we drop the
> >> below snippet.
> >>
> >>           if (state == ST_DISCONNECT_PENDING) {
> >>                   /* wait until ST_DISCONNECTED */
> >>                   dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
> >>                   mutex_unlock(&dp->event_mutex);
> >>                   return 0;
> >>           }
> >>
> >> I will need sometime to address that use-case as I need to see if we can
> >> handle that better and then drop the the DISCONNECT_PENDING state to
> >> address this fully. But it needs more testing.
> >>
> >> But, we will need this patch anyway because without this we will not be
> >> able to fix even the most regular and commonly seen case of basic
> >> connect/disconnect receiving complementary events.
> >
> > Hmm, no. We need to drop the HPD state machine, not to patch it. Once
> > the driver has proper detect() callback, there will be no
> > complementary events. That is a proper way to fix the code, not these
> > kinds of band-aids patches.
> >
>
> I had discussed this part too :)
>
> I totally agree we should fix .detect()'s behavior to just match cable
> connect/disconnect and not link_ready status.
>
> But that alone would not have fixed this issue. If HPD thread does not
> get scheduled and plug_handle() was not executed, .detect() would have
> still returned old status as we will update the cable status only in
> plug_handle() / unplug_handle() to have a common API between internal
> and external hpd execution.

I think there should be just hpd_notify, which if the HPD is up,
attempts to read the DPCD. No need for separate plug/unplug_handle.
The detect() can be as simple as !drm_dp_is_branch() || sink_count != 0.

>
> So we need to do both, make .detect() return correct status AND drop hpd
> event thread processing.
>
> But, dropping the hpd event thread processing alone was fixing the
> complimentary events issue. So kuogee had only this part in this patch.

I'd prefer to wait for the final patchset then. Which has the HPD
thread completely removed.

>
>
> >>>>       else if (dp_display->link_ready && status == connector_status_disconnected)
> >>>> -            dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> >>>> +            dp_hpd_unplug_handle(dp, 0);
> >>>>    }
> >>>> --
> >>>> 2.43.2
> >>>>
> >
> >
> >



--
With best wishes
Dmitry
