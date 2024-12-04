Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CEA9E3780
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 11:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FBD10ECC4;
	Wed,  4 Dec 2024 10:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gnei1TMP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E7C10ECC4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 10:33:01 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53de035ea13so6657318e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 02:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733308379; x=1733913179; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ppe03tUIW7WD8Jqhkp0U/tHsYLrNjJSJ37fXxnlfNqg=;
 b=gnei1TMPF6jwMSpOM21HQKJDhLcR9A9P2cj4SQzP8YHBOxyZy2HB/jJ1HYzvs1FUKl
 ztU8GmOEINU2D/Ayh3wIIw5PAF4bG4q2NV/IKOnhpp4mqlSqyZ63Bcc5fUkBeHYO5DVl
 TtIVDmRo/ZlJVx7Yurr7fqPkg3IiVCvxuLtlleOnKoMrfRWZTciINYfAgQeyKJZbx1qU
 MG2AZIc2h4uNEhjrVjrirdQXF+GoaYZRHsV3a0sWLYntjKFuTqjY5sWrdzjbiJw7/sWp
 HNdOF7ZwV97OhQPRsN6XUCmpU6ZGMgega9+kgk7qPaBQyOII5NX3gXU+mL6/msTEnMar
 kY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733308379; x=1733913179;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ppe03tUIW7WD8Jqhkp0U/tHsYLrNjJSJ37fXxnlfNqg=;
 b=mRulqvdMlm9xbyB+Q9aYMdoNYUOLFfpVChe0Ei2IiyF5vg4uVrL9MVdTH2/cFsMWpn
 whK4L8O/iulSv3msV9e0q+r3Z/4FgmDK3PgNDi3l49qsnOwFj8SW89AHTCElDcNr2Ht2
 au9E07n3UNs9iaI1DPl0pIcYs8VEEBzkpH8gnuFX0pktjdZGOLRKTV6KuNk0YeEwKnOr
 7UUThR7o95FL3F/8U7++Ks1tvEJf/EUn2+4exUq6xUB94A2L9PxXMowdevscDcTqKOzS
 ZlTC4hccg3S3hf+gos96guVA1SuRYyviJ8J/YXe4vJn8EwaTfM1jhtMq6MIzpREdcdxA
 nrhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYHE+Iaxn3eXEtw2sbH/8rsvgslDWn0R4ddSHWT84xCUEphWj1ZghzS1UXAMTX2rpJUuzo+T+I4bc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSDw7Zzh//yUECAs8Z3fWjpEp0FLLe0E5HBpAhGr9Y+qLiE/Ch
 jdrDxZsbV943RQJWKNAwHJgsIS8HIK7LE6ucCSA2Rxev3SbZgyo/5kALuvul1rc=
X-Gm-Gg: ASbGncsAfqnRqmLprInAXkqcPqaN41gTdzcBJw/gpNI5VgzNG+XbPOqcbDmPfr0cnQj
 iAalT9qsLgXJ87pdZ3u+7uEqEPykzoA07zmPbqmPJIyVqEXJY0DWWIqH9bwC6Lwlj16X+D/ExqO
 cH3SytvfDU7GAyU+zhN+bqJ49dt1hit6hc1M4tzPE+MpEERY4yZARkiTQb+ho+MCMbMW5U0TZET
 rmTrWSuOLakOMj9vN4vCkGCLwGeIqp06cZ+NQ51FnzGyhz6kxzyrQPNZhF0Xh00DpJOxtFaMEtO
 5ZJ+yTl7Ns7abMmnphIEGwrxMJZh0Q==
X-Google-Smtp-Source: AGHT+IHL92KqbDealhWN0qObA87bFxVW8RNuX5axtUU6JP1euGlIEGb+VzsyjLdTqiD4pqMh1UTrHg==
X-Received: by 2002:a19:5f05:0:b0:53e:12dc:e805 with SMTP id
 2adb3069b0e04-53e12dce857mr2063012e87.45.1733308379303; 
 Wed, 04 Dec 2024 02:32:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e1cbef3a9sm190560e87.222.2024.12.04.02.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 02:32:58 -0800 (PST)
Date: Wed, 4 Dec 2024 12:32:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 2/4] drm/msm/dp: remove redundant ST_DISPLAY_OFF checks
 in msm_dp_bridge_atomic_enable()
Message-ID: <orsov5jni37n7m3xm4qdiurnfzdubxy45itmrb5gwi243l2l5t@vz623b5c35n5>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-2-8d0551847753@quicinc.com>
 <f6oh3kid5dfiqe7jy7j3d4gcv4evbtztzpgiygvzfsu6qlim2j@2vsulwcau6tr>
 <58d28874-0fcc-42f4-831d-1f304f7d9d4f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58d28874-0fcc-42f4-831d-1f304f7d9d4f@quicinc.com>
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

On Tue, Dec 03, 2024 at 07:24:46PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/3/2024 5:53 AM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 04:39:01PM -0800, Abhinav Kumar wrote:
> > > The checks in msm_dp_display_prepare() for making sure that we are in
> > > ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.
> > > 
> > > DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
> > > msm_dp's atomic_check callback returns a failure if state is not ST_MAINLINK_READY.
> > 
> > Can the state change between atomic_check() and atomic_commit()?
> > 
> 
> Good question.
> 
> I cannot deny that such a possibility does exist.
> 
> From what I can see in the state machine today, the only possibility I can
> think of here is if a user very quickly removes the cable as soon as they
> connect the cable like so fast that the connect was not yet processed before
> disconnect.

If the cable has electrical issues, it is possible even w/o user
intervention.

> 
> Similarly, if an irq_hpd fires after atomic_check but before
> atomic_enable(), and moreover if we hit the sink_count == 0 case in
> msm_dp_display_handle_port_status_changed() during this irq_hpd,
> 
> In both these cases, then we will transition to ST_DISCONNECT_PENDING state.
> 
> Without this change, we would have bailed out in the ST_DISCONNECT_PENDING
> case.
> 
> But other than this, I cannot atleast think of a case where a different
> state transition can happen between atomic_check() and atomic_commit()
> because for other transitions, I think we should be still okay.
> 
> But this is purely based on theoretical observation and hypothesis.
> 
> Is it better to add a check to bail out in the DISCONNECT_PENDING case?

I think so, please.

> 
> OR document this as "To-do: Need to bail out if DISCONNECT_PENDING" because
> even if I add this check, I dont know if can make sure this can be validated
> as the check could never hit.
> 
> 
> > > 
> > > For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
> > > there is an atomic_enable() without a prior atomic_disable() which once again
> > > should not really happen.
> > > 
> > > To simplify the code, get rid of these checks.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
> > >   1 file changed, 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 992184cc17e4..614fff09e5f2 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -1513,12 +1513,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> > >   		return;
> > >   	}
> > > -	state = msm_dp_display->hpd_state;
> > > -	if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
> > > -		mutex_unlock(&msm_dp_display->event_mutex);
> > > -		return;
> > > -	}
> > > -
> > >   	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
> > >   	if (rc) {
> > >   		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 

-- 
With best wishes
Dmitry
