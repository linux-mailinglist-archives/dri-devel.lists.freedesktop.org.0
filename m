Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FCA37AF24
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 21:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D9E6EAD0;
	Tue, 11 May 2021 19:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com
 [IPv6:2607:f8b0:4864:20::f4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BC26EAD0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 19:13:07 +0000 (UTC)
Received: by mail-qv1-xf4a.google.com with SMTP id
 a6-20020a0ce3460000b02901c4f39aa36aso16305380qvm.21
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 12:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=p5OF8uCnVHGhsJH/LB13/zRAsll4eW+Rnf3hqCAjaGs=;
 b=QGCnwNOfvwAHBlH2u/xTMVmWyzEi17mtrBYFHlBxWo/hJvrQ3gT69fp+5BHv7DhTwW
 oMT15L7Cb+z2UKDXuhYZOfBOb9sDRo+WHINPY/Az8vtSPUemEpnxW5Iymj8rQbQd8Ccd
 KhBTHIoKB4QVmEdDbq4YgrYJaWl2OZLSD0zy+yNfnmrBBMVZF71F+RDKK6LY/u17qQFX
 xGy7dXAf5+onoDSAH1Q+v+BY8tGoqM/F1RLWmJBrljss13uGAiVUxb3Fhn4pFpD9zS2c
 /W4ty0mfwt48QFOap46V50vwZqfFSrfF3H5tzlNdEZGtUGIdWzEbmq/x2ElnXj0yn4L0
 lZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=p5OF8uCnVHGhsJH/LB13/zRAsll4eW+Rnf3hqCAjaGs=;
 b=hJHkq5v3CsSSwRMJ3jJPkXaNa8J80uOiAwfJhCFfJKuo669vZNI7YRIQo2aGRW+XuT
 SjFHwEJtCFmDc1vREiwOAw7/QK13zDiDWXnqk6b+qWhlnAn8XuvkStmyWOQZ08LE/9Rk
 QKfZ69bYsVRhWVingzLbb+GTFsmHMaeIiA7u6IrcAXzBfaE4nOsqLoG/RYhmfWz3Wb8y
 7j9p63x5V8m9uucZSuU+7s+uMuzIxhSWNvIS+uRXoY3kRFqZM8KhxlzN8YpLn8zOizAO
 NdMMRqwKq7hpBPvpEManshPmepm04JIdCLuuZM4HLVKmRm5aihcSPK7w4WgmAq3SWZWR
 y8Qw==
X-Gm-Message-State: AOAM5329J9hi46EHagt+DS154cArY6xJwRoqlJIiSnV3cvN6+j/yeiYG
 Ycx0/wf0P0o13wqvz0rZdgWC1o5dtt6f6FY=
X-Google-Smtp-Source: ABdhPJwg7uMX+NWke5KhkxiXSzGh9CILFYm94jMx+Qr+MSyD42OBNjsGV3LXlQqaLV6aPqHqshLXb7ZyOmgItXQ=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:24c0:6742:b823:eafe])
 (user=saravanak job=sendgmr) by 2002:a0c:df08:: with SMTP id
 g8mr31455206qvl.12.1620760386837; Tue, 11 May 2021 12:13:06 -0700 (PDT)
Date: Tue, 11 May 2021 12:12:58 -0700
In-Reply-To: <CAE-0n53AcL807G3WLp7phQUNN6umuwUikiz_5bNfcHdRbThu=Q@mail.gmail.com>
Message-Id: <20210511191259.1139635-1-saravanak@google.com>
Mime-Version: 1.0
References: <CAE-0n53AcL807G3WLp7phQUNN6umuwUikiz_5bNfcHdRbThu=Q@mail.gmail.com>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
Subject: Re: [PATCH] component: Move host device to end of device lists on
 binding
From: Saravana Kannan <saravanak@google.com>
To: swboyd@chromium.org
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
Cc: Saravana Kannan <saravanak@google.com>, rafael@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rmk+kernel@arm.linux.org.uk,
 kernel-team@android.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Stephen Boyd <swboyd@chromium.org>:
> Quoting Daniel Vetter (2021-05-11 06:39:36)
> > On Tue, May 11, 2021 at 12:52 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > >
> > > On Mon, May 10, 2021 at 9:08 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > [cut]
> > >
> > > >
> > > > >
> > > > > > I will try it, but then I wonder about things like system wide
> > > > > > suspend/resume too. The drm encoder chain would need to reimplement the
> > > > > > logic for system wide suspend/resume so that any PM ops attached to the
> > > > > > msm device run in the correct order. Right now the bridge PM ops will
> > > > > > run, the i2c bus PM ops will run, and then the msm PM ops will run.
> > > > > > After this change, the msm PM ops will run, the bridge PM ops will run,
> > > > > > and then the i2c bus PM ops will run. It feels like that could be a
> > > > > > problem if we're suspending the DSI encoder while the bridge is still
> > > > > > active.
> > > > >
> > > > > Yup suspend/resume has the exact same problem as shutdown.
> > > >
> > > > I think suspend/resume has the exact opposite problem. At least I think
> > > > the correct order is to suspend the bridge, then the encoder, i.e. DSI,
> > > > like is happening today. It looks like drm_atomic_helper_shutdown()
> > > > operates from the top down when we want bottom up? I admit I have no
> > > > idea what is supposed to happen here.
> > >
> > > Why would the system-wide suspend ordering be different from the
> > > shutdown ordering?
> >
> > At least my point was that both shutdown and suspend/resume have the
> > same problem, and the righ fix is (I think at least) to add these
> > hooks to the component.c aggregate ops structure. Hence just adding
> > new callbacks for shutdown will be an incomplete solution.
> 
> To add proper hooks to component.c we'll need to make the aggregate
> device into a 'struct device' and make a bus for them that essentially
> adds the aggregate device to the bus once all the components are
> registered. The bind/unbind can be ported to probe/remove, and then the
> aggregate driver can get PM ops that run before the component devices
> run their PM ops.
> 
> Let me go try it out and see if I can make it minimally invasive so that
> the migration path is simple.

Yes, please! This is the right solution. We should put all these aggregate
devices in some "aggregate" bus (needs a better name) and NOT a drm bus because
AFAICT components are not specific to the drm framework.

You can also create device links (without the STATELESS flag, and a bunch of
other flags) from the aggregate device to all the component devices and this
will automatically fix all the ordering issues too.

I'd be happy to help with this if you want and happy to review this too. Please
Cc me when you send out this series.

-Saravana

> 
> >
> > I don't feel like changing the global device order is the right
> > approach, since essentially that's what component was meant to fix.
> > Except it's incomplete since it only provides a solution for
> > bind/unbind and not for shutdown or suspend/resume as other global
> > state changes. I think some drivers "fixed" this by putting stuff like
> > drm_atomic_helper_shutdown/suspend/resume into early/late hooks, to
> > make sure that everything is ready with that trick. But that doesn't
> > compose very well :-/
> 
> Yeah it looks like msm is using prepare/complete for this so that it can
> jump in early and suspend the display pipeline before the components
> suspend themselves. The shutdown path only has one callback so we can't
> play the same games.
