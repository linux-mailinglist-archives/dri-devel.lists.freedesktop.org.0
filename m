Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1043DADAA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 22:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6C76EE4D;
	Thu, 29 Jul 2021 20:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD1A6EE5C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 20:34:10 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id d6so3072556uav.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o4Y7XGlLfPOfyDeTYT9js92suK0o7Zs6bPcUlyBP3+8=;
 b=IZg2BgjV3k6UNdOrECEVLTrx80Xoau0iUyi9ZxmimDHAYIW21N3KoXYwi8FBiEpblj
 eRSZJhGoCHJmZv3Wu7pLbI0bjJsUL/bAkqL2QwJaU0UAO4YrWBOERgJ08fyY50TRt9mT
 liX0skd7CKeJ+yR9uVui4D5jH8THlaMJhb5+MAbCCxUK0UsBgbTYkMbYjOrIXEZBLgV+
 Z958u0DBwE23Qr17SSOe6IfGc1iMuDdlYQCarpSHG8E4ZPsphzrGQErIxl63+ASUHcYz
 M+HuwxHve+21AJ76PGcnIU4yka+n96EvYlEIZ56IVHdS+GImmoIxExAURGNHTEzWx9yM
 lBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o4Y7XGlLfPOfyDeTYT9js92suK0o7Zs6bPcUlyBP3+8=;
 b=IzeLUJP07n/43yQgy+RUm9jliANw7pbfzXs2LBuKnuAsfNRRY1nkRSQJi7TlZd4tZU
 SfBW6qnQ4ZBzIcC1JmXy9KgYUZyNHygb3L4tbrDrSTAohG+OPS5BmdZ+sj2hoJyuprRY
 ZJaJFLxtyU0inozbV4c719hSmlaTC55Hdd/K2GN0wI/2LJ/YT6VIY+rnyZavWOCM4Wc1
 mWsHAualLIDTEGZfuNNaFeet9ysuiYwS+Q66XioDQHSW1HocuRxRtR8BLOSh97Gwo7UL
 lcWWVEeDpIEf6LuH8ONu3eZrJFej6Bn22+nq3eIjv2zjUwVy5gE+Up2NPi4pkdreAhru
 saxQ==
X-Gm-Message-State: AOAM530gb3+OQrCmZf53LYLrVkmDqe1IYyiNhAnc/MOYwiaIn59kLn0v
 RBbQuCDnPSRqqe7J7InMerRbxzRyT+2uX79hxcw=
X-Google-Smtp-Source: ABdhPJxkqdKZiWg0LxV975QQeBwMk7lrI0uKvhgLou0ttFFR9VfQ+CR/YUyA2QxHg9SZ3sS1Fq6fCFQWqgjUtMBsBg4=
X-Received: by 2002:ab0:25c5:: with SMTP id y5mr6789324uan.142.1627590849359; 
 Thu, 29 Jul 2021 13:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-15-sean@poorly.run>
 <CAJfuBxzgHodZ-=dKxpus58SK8=fgvMPEzYS1Sh-5NZkxk+vL9g@mail.gmail.com>
In-Reply-To: <CAJfuBxzgHodZ-=dKxpus58SK8=fgvMPEzYS1Sh-5NZkxk+vL9g@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Thu, 29 Jul 2021 14:33:43 -0600
Message-ID: <CAJfuBxxvNQsL-EvhFkZpU=4vaAzUMjfHF=4kfAULOoR-4z614w@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 14/14] drm/print: Add tracefs support to the drm
 logging helpers
To: Sean Paul <sean@poorly.run>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 kernel test robot <lkp@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Sean Paul <seanpaul@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 2:24 PM <jim.cromie@gmail.com> wrote:
>
> On Wed, Jul 21, 2021 at 11:56 AM Sean Paul <sean@poorly.run> wrote:
> >
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > This patch adds a new module parameter called drm.trace which accepts
> > the same mask as drm.debug. When a debug category is enabled, log
> > messages will be put in a new tracefs instance called drm for
> > consumption.
> >
> > Using the new tracefs instance will allow distros to enable drm logging
> > in production without impacting performance or spamming the system
> > logs.
>
> hi Paul,
>
> I should have started reading here, not at patch-1
> While I still think some of the _syslog name changes are extra,
> drm_debug_enabled() needs it - rename goes with narrower purpose.
>
> a couple comments below, trimming heavily.
>
>
> > +#define DEBUG_PARM_DESC(dst) \
> > +"Enable debug output to " dst ", where each bit enables a debug category.\n" \
>
> I will be borrowing that idea.
>
> > +
> > +MODULE_PARM_DESC(debug, DEBUG_PARM_DESC("syslog"));
> >  module_param_named(debug, __drm_debug_syslog, int, 0600);
> >
>
>
> > +void __drm_printfn_debug_syslog_and_trace(struct drm_printer *p,
> > +                                          struct va_format *vaf)
> > +{
> > +       pr_debug("%s %pV", p->prefix, vaf);
>
> Im not sure about prefixing this way.
> dyndbg query needs to see the prefix in the format string at compile-time.
>
> My RFC patch does the prefixing in the macro layer, when enabled.
> when disabled, prefixing at runtime is fine.
> This looks easy to shake out..
>

Actually, this is more problematic than that.
this pr_debug has just a single point of >control,
whereas all those in macro expansions get individual lines in control file.

I had this problem in an earlier version of RFC patch
where I called pr_debug from within drm_dev_dbg etc.
