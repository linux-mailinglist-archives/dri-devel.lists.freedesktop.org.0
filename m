Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342149FB9DC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 07:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBE110E290;
	Tue, 24 Dec 2024 06:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kRxh3x62";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2F910E290
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 06:33:50 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3003e203acaso49552411fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 22:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735021969; x=1735626769; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bincwshAYNCJ6hJiNrJokdCtTwI1ZrZprXh0S5Xi7zE=;
 b=kRxh3x62f7LctwtpzGMequoIdMo+eGep4uGQWHCUL9njOI9GuKxQCzzP6lGL28ycGT
 N7kHsj4ttFZQRmt0BZ0YcgpNLkypa4iGu9EXbq9vll5s2Tn4em/UsDtjfSwK+oQwQmlr
 lGNz79NhDqIn2hgjU44ekUlmXnt91eh9CScJggXMc6oYsVKgYMQiUMWTuvjwadx+/bs8
 chDxuWFr2s1voRPFExbv9GAiIBq/GcxpGmzvb0Qa+3ptlz4nyfQgQOajlaedzYB4XJrK
 aFdcdmQ4jwHL3uC/qr+x/ubPuzzsstC092Waj8GH7CrLihZQU89HXyufuvVs+5z+H3E1
 0oAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735021969; x=1735626769;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bincwshAYNCJ6hJiNrJokdCtTwI1ZrZprXh0S5Xi7zE=;
 b=SPUIJgWKA299EskO+7xQhRKVhhe1fzspp/OkMU2jrEAqs0dp1YzSbfKgeqytu7tAiB
 1YKa0oPuNYFm65RjeXmQ+nQoi9fTmS1X9CHAzYF8dEcTRYZGa/Fn4ldsAz/nNupWlwZj
 aDInSNofMipWXcbCUpPAo8WH8ekHwVZpG5dyXeW6j4D2R0dtmjBI6PId+TmvTDY3AU9R
 SsC5JybNW6uTK/vbJa2AJDB9a7whYIgh/Zi4sxJHyUJ/qCcnmeLttAPR8+UVkXdDEmeo
 tN8ETsyN/JVi7TMTaSzyq7DNv6mWN2qxMAe91Z18fB821SiZwHx+qM7Hm/Qjc20FTD4K
 T41w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV8/oRxpcCH1u53SKtjNJD23Qq/CgfpQ30+hdX32zH3+y4IDeOijnXJo+zbqY/MGLAOkWu7tCckbc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVN7+Xa7XiMorKBfDdlZ+wLTujS1lycFufg3PqVBwe8KCaXI1k
 bRoVkI2hyEa/z/w8E8yWShCfr+W93BwBH6D3+vJL/KnaYP5ptumszviMQCfpCjI=
X-Gm-Gg: ASbGnct962bKotBAhfgEz7lp+kEo/ja5k6+YvjdzqwN3cjQfWDYUaVexZGqH4DFuc8p
 yvMsFqakXW+88LVN0L7EG62+nmF+pfv9UcazsM+GLlrL++uHPixnF+Cl38l8eTag+m1gzd+kGtw
 jddgBbeD5JImHi58VOoibtVhi4p3Zhh8S+NaP0AuGzmhLlQDLv75vPb6twuFtP08PKZx+pjYqbQ
 pX/iSsOIvdVSx1plsZEiMYdlgDxMAZ6VQdVdpbEhXzfib2eyhMza9AK+J/dlQVgcD4NiDz5XuLu
 U5BhehlcNs4GVXmExMVif0LcNh9jzUdZfYHs
X-Google-Smtp-Source: AGHT+IG2dUyPsRFhwHcHhqelrSh4mxVgYi+bc7D5YG6R7v8H+FahxoLp7u/H0DSLNi487A5ahAGY5w==
X-Received: by 2002:a05:6512:3d22:b0:53e:39c2:f021 with SMTP id
 2adb3069b0e04-54229533228mr5103052e87.15.1735021968071; 
 Mon, 23 Dec 2024 22:32:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223600508sm1535074e87.94.2024.12.23.22.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 22:32:47 -0800 (PST)
Date: Tue, 24 Dec 2024 08:32:44 +0200
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
Message-ID: <ldcydwcuwkwwng4d3b47pjz3ndhuhwerz6t3drwmifdzh7g3nl@3y6es72w74d7>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-2-8d0551847753@quicinc.com>
 <f6oh3kid5dfiqe7jy7j3d4gcv4evbtztzpgiygvzfsu6qlim2j@2vsulwcau6tr>
 <58d28874-0fcc-42f4-831d-1f304f7d9d4f@quicinc.com>
 <orsov5jni37n7m3xm4qdiurnfzdubxy45itmrb5gwi243l2l5t@vz623b5c35n5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <orsov5jni37n7m3xm4qdiurnfzdubxy45itmrb5gwi243l2l5t@vz623b5c35n5>
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

On Wed, Dec 04, 2024 at 12:32:55PM +0200, Dmitry Baryshkov wrote:
> On Tue, Dec 03, 2024 at 07:24:46PM -0800, Abhinav Kumar wrote:
> > 
> > 
> > On 12/3/2024 5:53 AM, Dmitry Baryshkov wrote:
> > > On Mon, Dec 02, 2024 at 04:39:01PM -0800, Abhinav Kumar wrote:
> > > > The checks in msm_dp_display_prepare() for making sure that we are in
> > > > ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.
> > > > 
> > > > DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
> > > > msm_dp's atomic_check callback returns a failure if state is not ST_MAINLINK_READY.
> > > 
> > > Can the state change between atomic_check() and atomic_commit()?
> > > 
> > 
> > Good question.
> > 
> > I cannot deny that such a possibility does exist.
> > 
> > From what I can see in the state machine today, the only possibility I can
> > think of here is if a user very quickly removes the cable as soon as they
> > connect the cable like so fast that the connect was not yet processed before
> > disconnect.
> 
> If the cable has electrical issues, it is possible even w/o user
> intervention.

And the possible desynchronisation between DRM atomic states and HPD
state machine brings back the topic: can we get rid of the state
machine instead of trying to fix it? I'd rather see a patchset that
removes it completely. The link training should go to the atomic_enable,
etc, etc. Please? Pretty please? I'd rather see imperfect solution which
has possible issues with some of the dongles (as they can be fixed later
on) than having the imperfect HPD state machine which is known to break
DRM framework expectations.

> 
> > 
> > Similarly, if an irq_hpd fires after atomic_check but before
> > atomic_enable(), and moreover if we hit the sink_count == 0 case in
> > msm_dp_display_handle_port_status_changed() during this irq_hpd,
> > 
> > In both these cases, then we will transition to ST_DISCONNECT_PENDING state.
> > 
> > Without this change, we would have bailed out in the ST_DISCONNECT_PENDING
> > case.
> > 
> > But other than this, I cannot atleast think of a case where a different
> > state transition can happen between atomic_check() and atomic_commit()
> > because for other transitions, I think we should be still okay.
> > 
> > But this is purely based on theoretical observation and hypothesis.
> > 
> > Is it better to add a check to bail out in the DISCONNECT_PENDING case?
> 
> I think so, please.
> 
> > 
> > OR document this as "To-do: Need to bail out if DISCONNECT_PENDING" because
> > even if I add this check, I dont know if can make sure this can be validated
> > as the check could never hit.
> > 
> > 
> > > > 
> > > > For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
> > > > there is an atomic_enable() without a prior atomic_disable() which once again
> > > > should not really happen.
> > > > 
> > > > To simplify the code, get rid of these checks.
> > > > 
> > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > ---
> > > >   drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
> > > >   1 file changed, 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > index 992184cc17e4..614fff09e5f2 100644
> > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > @@ -1513,12 +1513,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> > > >   		return;
> > > >   	}
> > > > -	state = msm_dp_display->hpd_state;
> > > > -	if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
> > > > -		mutex_unlock(&msm_dp_display->event_mutex);
> > > > -		return;
> > > > -	}
> > > > -
> > > >   	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
> > > >   	if (rc) {
> > > >   		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
> > > > 
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
