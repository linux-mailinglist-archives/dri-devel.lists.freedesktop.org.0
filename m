Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 885E82D6091
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 16:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B696E3F5;
	Thu, 10 Dec 2020 15:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB2B6E3F5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:56:14 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id a109so5299021otc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 07:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sIO/9tD3JHVfJ2szB/5OE4SOD407u2Banu60gl1U59k=;
 b=ewcQM8qlLJE5BvAFgXJESU9YDYl9eaZI1PRWbmmZHvR4/6bV0em9/QHfLWNWSWYQn5
 96v4izFgpOo0IHQebM1QxA5SlFc9SouteLC04tQYEBaA54HAgdvHkdTwFOIv5zFIfh9O
 5qa2ZnDdS3Ody4cUjtVHEapXejYYz6ozBRpUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sIO/9tD3JHVfJ2szB/5OE4SOD407u2Banu60gl1U59k=;
 b=pK34etYNMjnVcZ/Za+kRkPiJT2yx0YPcIlVtepZxQY/R+pQgAKQ7CQg48v1aoGIs6m
 OAoVNCaeTIhelCyy8mmv/jOC/Rle2jF/P+lILGDsDxH4vcPQaSF8TfQKEznaw++A1hdg
 yKdCr+yVyY6NI1Fl1jWeIFZRP7XKs2tV4asg6Vrf2eEDbiGxk8XQXwDSORc8UR9PFxES
 aqffvvb0Lr6bho3Ivx3nag5pyVrM/cpmceDV2e8VLrsaTj23P3M7BdkOFhmB1tWeezV1
 sLsUYQ8FlrnCUvY2JtpqxVTwkvce3uNLjQy64JqMxw3ushsiOUHbPj9MjnJXSzDPcZhj
 KWeQ==
X-Gm-Message-State: AOAM530J1o8qnOc9BkCKDHSFH4Uuvu0Dk1FxaJaJrfMu+7ONXr50aabk
 98Wj1fYYb2vQ1++9Zv0rgJc+WIMdOtr/pWHjMtjjig==
X-Google-Smtp-Source: ABdhPJx3RM73A0OvBnBsN+o1U9LrRtCyravUuj2bzod700HbeG+pC5KAnNUnd+SU29lcB54bcfWowcEx3vLX4WNwXP4=
X-Received: by 2002:a9d:470f:: with SMTP id a15mr6196752otf.303.1607615774270; 
 Thu, 10 Dec 2020 07:56:14 -0800 (PST)
MIME-Version: 1.0
References: <wrDqxEGdxtotWKrfQH8W8tl2Z8JgdHzUs3wuTth4@cp4-web-027.plabs.ch>
 <20201209004223.GL401619@phenom.ffwll.local>
 <0zedd9O9Bp0DfEH26xBTGvZtqA5bdE2EJDN3z5TXiDIyiwfTnRapgDy69MjAlhMWrzqKTzoYwovpGANNhp1PmneSCrm-xzw9DIeauv1SkgM=@emersion.fr>
 <20201209160223.GT401619@phenom.ffwll.local>
 <W7ZhvStaUaGjlhYSldWxC93V0-tjSEwm-ldyPBpmvkJ9xRw1krfB1TNd5X4hEjkamaEhH1ASD0yiFzMCh72oG8vCeg-HeOt5dRN5U5v_q34=@emersion.fr>
 <20201209194030.GV401619@phenom.ffwll.local>
 <iId0AQqxwalIhTMk-efVSEskNIuLA_pP5h4loD4Mbu17dJF83zbUXu5HZnSekjM73tghP2kE5MNXdMT3D5lus2e-s66PX4V0a_mDka695FY=@emersion.fr>
In-Reply-To: <iId0AQqxwalIhTMk-efVSEskNIuLA_pP5h4loD4Mbu17dJF83zbUXu5HZnSekjM73tghP2kE5MNXdMT3D5lus2e-s66PX4V0a_mDka695FY=@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 10 Dec 2020 16:56:03 +0100
Message-ID: <CAKMK7uFywgzd3JvACQLFupX6C9Cz_+XVHDV34XvNJHXv3TfXdQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rework description of primary and cursor planes
To: Simon Ser <contact@emersion.fr>, Alex Deucher <alexdeucher@gmail.com>, 
 "Wentland, Harry" <harry.wentland@amd.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 4:45 PM Simon Ser <contact@emersion.fr> wrote:
> On Wednesday, December 9th, 2020 at 8:40 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > But it's not enough, can't have two CRTCs with the same primary plane. Well,
> > > I give up, it's just simpler to use Daniel's criteria.
> >
> > Yeah, also with the validation check we'll now real quick if any driver
> > gets it wrong. Then I think we can have a useful discussion about why, and
> > what to do with that case. As-is we're kinda drafting specs in the void,
> > which is always a bit tough ...
> >
> > That's kinda another reason for doing the stricter check I proposed, it's
> > easier to check and guarantee (on both the driver and compositor side
> > hopefully).
>
> Hmm, actually, I'm already hitting a driver which doesn't guarantee that.
> amdgpu with my hardware [1] has the first primary plane linked to the the last
> CRTC, the second primary plane linked to the second-to-last CRTC, and so on.
>
> [1]: https://drmdb.emersion.fr/devices/129e158a4d9f

Huh so crtc are registered forward and planes backward? I guess adding
amd people. And yeah sounds like defacto you can't figure out which
primary plane goes to which crtc, and we just take whatever goes.
Maybe that stricter approach with more guarantees just doesn't work,
ship sailed already :-/
-Daniel

-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
