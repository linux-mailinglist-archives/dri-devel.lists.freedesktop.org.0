Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3794889CE49
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 00:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4E110FDD8;
	Mon,  8 Apr 2024 22:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K2xKx8BZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E8910FDD8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 22:09:21 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-615019cd427so42454487b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 15:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712614160; x=1713218960; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7VCBp/0IT3jpVEswtjWNK+e5ZOhS7JJVdmnMRHam+WQ=;
 b=K2xKx8BZKf4ighUZraxfRJwY0oPZ/M6xce/+A7ii/Ex2wCaVP31R+DRf00JymnO0fa
 5K2vQ1CwkOtC77DodEt5Rtq0NqlDTrVKlycZEqOeTyliCYsYkOLEuU66//fI6vRwRleL
 dCLHIM0yKtEgEJi0rdvilo4wAGj0N0ZE2ivpjE+eRzANaMGF+Sa4U+8AaNXLpZbQ1CFz
 8wbmPP2Ve9v6b2gPnRDuiwiFR16/kAEIXWm8AJKgizOwv1yXkbn72eWmEmx+CxgyHhIM
 E7Dc9PGPlPg6ttAxmutHbB9FBkS6t5xutrXxBuExDRKwNucf4gEiCcWG0yketaL/xtBQ
 8KUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712614160; x=1713218960;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7VCBp/0IT3jpVEswtjWNK+e5ZOhS7JJVdmnMRHam+WQ=;
 b=ntPGzrC84C+wrZ6bZbHkDm3ceKzdQEiCVVlX08HLQt3fjQ2ldHazCZspcZEJWIu7z/
 mFlDLwUi+tN+dpCVYHJ4uVy/OhEu/GtOicNx9edWiIXGXsBAWS9tDHA53RlmJL/9CZH+
 UyFXhIi6YolQDMPnS0Ls5tjsFfSKleozlSO4IPdx/BnxqgoseZYRKiIbpklvoNwMhc9P
 76+DH9f9LasOfQUoHltPGZuQAIaeGCG6/wFvZwZcwrRRd1UP+y/Kxon5CZNDT0EYPpEg
 axdRIv6lSbYaMt68BHPAYQMzZPD/oRP1CsUUymUnM3I1mEXrVYiCMICaonz7nxgAptkO
 wU/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxiuKBvZcqbpCAL5heB1Ds9tlng8y5D81CVdJeJRm3jw0jogyFNJKZCGWZ17fLbqSwM3yizhFudt/8pQzWaFMAN3GkW1tCwJp0IdTFsRai
X-Gm-Message-State: AOJu0YymkV95p1BpyF+tbs/p/Wp10pyqJ7nopprm+Kwevx9z9tutUm46
 n3N3fOuqWa5StrjaOKFJqbtDROYXSyX+nd0BF0A514BAbvoKXtWz99FmwDjZWS7v8sJR4CegWCR
 fqZxIKLWYd8q2Quh2zQWt5rS9quSo/BVvE5qyiw==
X-Google-Smtp-Source: AGHT+IF37BOaV6VJ6j9BQQ4oZ93fuRAAJqf4ze80Vmy8wpcnL6+gzsfqT9wn4U4sN1xkiJb0FYo6F0zwOhyHcyl1thU=
X-Received: by 2002:a25:2d19:0:b0:dcc:a5dc:e9d6 with SMTP id
 t25-20020a252d19000000b00dcca5dce9d6mr9254293ybt.30.1712614159952; Mon, 08
 Apr 2024 15:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
 <ale6wbwzkfagcg2q6glb4vsxu3pthhkk3tquv2ixlatbdryqvh@xscsq2h6emho>
 <01cb1c0d-a801-37f9-2f55-2bbd8d3a68b9@quicinc.com>
 <k7f22hyltul4h4o4vqe6prc2yx3mm2q4dzk66j3xrsdpdtqllb@3c6ul4fpimwz>
 <b7ed299d-4cf7-8829-fd7f-e518aef05fb2@quicinc.com>
 <CAA8EJpqYWXs+KzZcrJA0zL2KNhpHQ+5xNpVNPmepztujmVJf=w@mail.gmail.com>
 <d2442e2d-80fc-c580-3452-57fab0dabf3f@quicinc.com>
In-Reply-To: <d2442e2d-80fc-c580-3452-57fab0dabf3f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Apr 2024 01:09:09 +0300
Message-ID: <CAA8EJppw0jkkHKNucgOg56OD_eH2Afx875m0oRBCtj=EOSJr4g@mail.gmail.com>
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

On Tue, 9 Apr 2024 at 00:17, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/8/2024 2:13 PM, Dmitry Baryshkov wrote:
> > On Tue, 9 Apr 2024 at 00:08, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 4/8/2024 1:41 PM, Bjorn Andersson wrote:
> >>> On Mon, Apr 08, 2024 at 12:43:34PM -0700, Abhinav Kumar wrote:
> >>>>
> >>>>
> >>>> On 4/7/2024 11:48 AM, Bjorn Andersson wrote:
> >>>>> On Fri, Apr 05, 2024 at 08:15:47PM -0700, Abhinav Kumar wrote:
> >>>>>> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>>>> [..]
> >>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>>>> index d80f89581760..bfb6dfff27e8 100644
> >>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>>>> @@ -1665,7 +1665,7 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> >>>>>>                     return;
> >>>>>>             if (!dp_display->link_ready && status == connector_status_connected)
> >>>>>> -          dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> >>>>>> +          dp_hpd_plug_handle(dp, 0);
> >>>>>
> >>>>> If I read the code correctly, and we get an external connect event
> >>>>> inbetween a previous disconnect and the related disable call, this
> >>>>> should result in a PLUG_INT being injected into the queue still.
> >>>>>
> >>>>> Will that not cause the same problem?
> >>>>>
> >>>>> Regards,
> >>>>> Bjorn
> >>>>>
> >>>>
> >>>> Yes, your observation is correct and I had asked the same question to kuogee
> >>>> before taking over this change and posting.
> >>>>
> >>>> We will have to handle that case separately. I don't have a good solution
> >>>> yet for it without requiring further rework or we drop the below snippet.
> >>>>
> >>>>           if (state == ST_DISCONNECT_PENDING) {
> >>>>                   /* wait until ST_DISCONNECTED */
> >>>>                   dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
> >>>>                   mutex_unlock(&dp->event_mutex);
> >>>>                   return 0;
> >>>>           }
> >>>>
> >>>> I will need sometime to address that use-case as I need to see if we can
> >>>> handle that better and then drop the the DISCONNECT_PENDING state to address
> >>>> this fully. But it needs more testing.
> >>>>
> >>>> But, we will need this patch anyway because without this we will not be able
> >>>> to fix even the most regular and commonly seen case of basic
> >>>> connect/disconnect receiving complementary events.
> >>>>
> >>>
> >>> I did some more testing on this patch. Connecting and disconnecting the
> >>> cable while in fbcon works reliably, except for:
> >>
> >> Thanks for the tests !
> >>
> >>> - edid/modes are not read before we bring up the link so I always end up
> >>>     with 640x480
> >>>
> >>
> >> hmmm, I wonder why this should be affected due to this patch. We always
> >> read the EDID during hpd_connect() and the selected resolution will be
> >> programmed with the modeset. We will retry this with our x1e80100 and see.
> >
> > BTW, why is EDID read during HPD handling? I always supposed that it
> > can be read much later, when the DRM framework calls the get_modes /
> > get_edid callbacks.
> >
>
> Well, dp_panel_read_sink_caps() is in dp_display_process_hpd_high()
> currently. We read the edid there.

My question was, why is it done this way? Can it be dropped? There is
no need to store EDID in the driver data,  is it?

>
> get_modes(), parses the EDID and adds the modes using drm_add_edid_modes().
>
> >>
> >>> - if I run modetest -s <id>:<mode> the link is brought up with the new
> >>>     resolution and I get my test image on the screen.
> >>>     But as we're shutting down the link for the resolution chance I end up
> >>>     in dp_bridge_hpd_notify() with link_ready && state = disconnected.
> >>>     This triggers an unplug which hangs on the event_mutex, such that as
> >>>     soon as I get the test image, the state machine enters
> >>>     DISCONNECT_PENDING. This is immediately followed by another
> >>>     !link_ready && status = connected, which attempts to perform the plug
> >>>     operation, but as we're in DISCONNECT_PENDING this is posted on the
> >>>     event queue. From there I get a log entry from my PLUG_INT, every
> >>>     100ms stating that we're still in DISCONNECT_PENDING. If I exit
> >>>     modetest the screen goes black, and no new mode can be selected,
> >>>     because we're in DISCONNECT_PENDING. The only way out is to disconnect
> >>>     the cable to complete the DISCONNECT_PENDING.
> >>>
> >>
> >> I am going to run this test-case and see what we can do.
> >>
> >>> Regards,
> >>> Bjorn
> >>>
> >>>>
> >>>>>>             else if (dp_display->link_ready && status == connector_status_disconnected)
> >>>>>> -          dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> >>>>>> +          dp_hpd_unplug_handle(dp, 0);
> >>>>>>     }
> >>>>>> --
> >>>>>> 2.43.2
> >>>>>>
> >
> >
> >



-- 
With best wishes
Dmitry
