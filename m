Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DE111E8C2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B7C6EB39;
	Fri, 13 Dec 2019 16:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0306EB3C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 16:54:35 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id i72so48921ybg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 08:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=8FzNdl3nPnnq8Hk/UCQIngoeeRIHTu5qxmtSgYUudpM=;
 b=IjH6MCmU3kov5a8S7xmu7ZA2dvFr+yvxFHTq+tTgUItzJ7V9YcWndCrFQqNLYXUlos
 267QZNgp1xsyVRopoM0pq74sYtvqCKGrpJ+CdWkAzlkYsYuHpQPRqALreOrQLHL+zj9y
 FQS2Id7repWkHO8eLoT5Yoo+jaqnseRuREbCujavRj+IjWc9vzNQzj66brU8TOIsBNEc
 Tht4/PEyaowoxYKMZ4eBOW5ozlMo/wp5vlv87qzwZmndag7WXKYaeQwoV5kTs7IoxtZG
 sP0U+Au6ZgDtW1aD0u1m4L9c4zZIBfkMewM1ZMmSQCEVquMUB02iDWXix0f2I+amKabv
 qEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=8FzNdl3nPnnq8Hk/UCQIngoeeRIHTu5qxmtSgYUudpM=;
 b=bkG7CMDaqHJjaj4Q2Y89VltqRpcYVvrSGOfiaJJPXls1A6K+cDFTYVh0+cU9TZgSBr
 AtjM+eA1f3WVte1L/jxbDdNIPZjUqx6p5BdeLlbKc4EQxsXb/3a9uV30HTj11q4o4wSk
 Ui26Bags2S13BaOprwCWvoqTp0I39qNopxd5YDUKoMaiJcGI8Jb+RmH1d8dXl1s5pLXm
 kd/01ST//w/cVoU8H2NUmVjDsv03ms8MfqXwLlPtOHxD3TK7o10pEWpoPErey/P3BmbH
 u9sKmpug3JDACktxIQwAunviH2vR3+OY2t7ai7aXgDBj7VM7M2uSNDPtoMn3QueIhIwp
 VoMg==
X-Gm-Message-State: APjAAAXsKq38NDRc9lT6FDJZK3qG1VZjR4wN4oHFa9t54ZsdNO7y4uj7
 lswQRFZcBGhkDrajt1VZVpmzsg==
X-Google-Smtp-Source: APXvYqzMnqqOAEbvrB3nG2M62D5Xy9GjHof5Hi7JZ9DXxGCC25MrynZlyua0YHsl0FoZskfNq52GZg==
X-Received: by 2002:a25:c186:: with SMTP id r128mr9735658ybf.398.1576256074835; 
 Fri, 13 Dec 2019 08:54:34 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id d80sm4178374ywa.58.2019.12.13.08.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 08:54:34 -0800 (PST)
Date: Fri, 13 Dec 2019 11:54:33 -0500
From: Sean Paul <sean@poorly.run>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v3] drm: Funnel drm logs to tracepoints
Message-ID: <20191213165433.GC41609@art_vandelay>
References: <20191212203301.142437-1-sean@poorly.run>
 <20191213133446.392c9045@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213133446.392c9045@eldfell.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 01:34:46PM +0200, Pekka Paalanen wrote:
> On Thu, 12 Dec 2019 15:32:35 -0500
> Sean Paul <sean@poorly.run> wrote:
> =

> > From: Sean Paul <seanpaul@chromium.org>
> > =

> > For a long while now, we (ChromeOS) have been struggling getting any
> > value out of user feedback reports of display failures (notably external
> > displays not working). The problem is that all logging, even fatal
> > errors (well, fatal in the sense that a display won't light up) are
> > logged at DEBUG log level. So in order to extract these logs, users need
> > to be able to turn on logging, and reproduce the issue with debug
> > enabled. Unfortunately, this isn't really something we can ask CrOS use=
rs
> > to do. I spoke with airlied about this and RHEL has similar issues. Aft=
er
> > a few more people piped up on previous versions of this patch, it is a
> > Real Issue.
> > =

> > So why don't we just enable DRM_UT_BLAH? Here are the reasons in
> > ascending order of severity:
> >  1- People aren't consistent with their categories, so we'd have to
> >     enable a bunch to get proper coverage
> >  2- We don't want to overwhelm syslog with drm spam, others have to use
> >     it too
> >  3- Console logging is slow
> > =

> > So what we really want is a ringbuffer of the most recent logs
> > (filtered by categories we're interested in) exposed via debugfs so the
> > logs can be extracted when users file feedback.
> > =

> > It just so happens that there is something which does _exactly_ this!
> > This patch dumps drm logs into tracepoints, which allows us to turn tra=
cing
> > on and off depending on which category is useful, and pull them from
> > tracefs on demand.
> > =

> > What about trace_printk()? It doesn't give us the control we get from u=
sing
> > tracepoints and it's not meant to be left sprinkled around in code.
> > =

> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > Link: https://patchwork.freedesktop.org/patch/msgid/20191010204823.1955=
40-1-sean@poorly.run #v1
> > =

> > Changes in v2:
> > - Went with a completely different approach: https://lists.freedesktop.=
org/archives/dri-devel/2019-November/243230.html
> > =

> > Changes in v3:
> > - Changed commit message to be a bit less RFC-y
> > - Make class_drm_category_log an actual trace class
> > ---
> > =

> > Even though we don't want it to be, this is UAPI. So here's some usersp=
ace
> > code which uses it:
> > https://chromium-review.googlesource.com/c/chromiumos/platform2/+/19655=
62
> > =

> > =

> >  drivers/gpu/drm/drm_print.c      | 143 ++++++++++++++++++++++++++-----
> >  include/trace/events/drm_print.h | 116 +++++++++++++++++++++++++
> >  2 files changed, 239 insertions(+), 20 deletions(-)
> >  create mode 100644 include/trace/events/drm_print.h
> =

> Hi,
> =

> reading the userspace patch is very enlightening, thanks.
> =

> It uses debugfs, and it uses the generic tracing UAPI. When all
> distributions will enable this debug logging like you do in your
> userspace patch (I really want that to be the end result, since
> otherwise we are back to asking people to manually enable debug and then
> reproduce the failure), does that scale?
> =

> What if V4L2 is the next one deciding they need a similar logging
> framework to debug camera issues? If the trace log is already flooded
> with DRM messages, it will be useless for them?
> =

> Or maybe someone else wants their piece and flood it even more
> aggressively than DRM, making the DRM messages disappear before they
> can be saved?
> =

> Is there a way to pull out messages
> from /sys/kernel/debug/tracing/trace and filter them on reading instead
> of on writing?

Hi Pekka,
Yep, there's also a trace_pipe output from tracefs. So you could pipe the o=
utput
through a classifier in userspace and split off different subsystems.

I think if this type of patch proliferates this could be a problem. In that=
 case,
we'd probably have to become better citizens and reclassify some of our log
messages such that we're not needlessly spamming the trace buffer.

I'm not too worried about this since we have a number of tools at our dispo=
sal.

Sean


> =

> =

> Thanks,
> pq



-- =

Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
