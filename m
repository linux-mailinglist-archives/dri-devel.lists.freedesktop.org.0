Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4F43DAD84
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 22:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333976E05C;
	Thu, 29 Jul 2021 20:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DDF6E05C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 20:25:15 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id j10so4207856vsl.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 13:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lBdn7VN2Nno1m5VvrO3GvYTE3nugjPKskWU7Pju/ERw=;
 b=r9vV7JMBnPO62EL2VUICbAFx8C2tGlsIQO/fcJJaJl87M75tJV+Y/QhqvcDgOGa0Su
 0Wb8H//QBNKoMxkDQOJI3fQDMTv3z8fr9cEijD6ZDFkPHQc5OAcFtbt8FgocVrbWPgUD
 yq8lrx9m8N9GudzISoo0qe7vbl1ZFdYEhURGlhCGttFeMRF4rOUa84pNsRn8+CQ8Rn8w
 mmwSJpKyTskDPvsoltX+4P4Lxz5Xpynut9VMF08mP7rXbgZrr8wVjeThWMREHv2SEmdw
 9hGVt1cO33iIzs2UoBQNRs+Bse4UJwIXKMUVsU1s1Bb4EKAKWan5OhvfM5bo1KDHj83E
 Tt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lBdn7VN2Nno1m5VvrO3GvYTE3nugjPKskWU7Pju/ERw=;
 b=N9yIegdXN1w/Chz9qB3wms+NhjTWScBBF8fGWi53775LaRngPCeh6+K2rjoeYDqUJs
 mGOtjUA4DYHd4gfJojF51e/Ia6E3AK0S6eerQlvuB86gmoYSFJzA0Ms1AnD1k+QvI6jw
 SkUOe1DdopXsqZAT69+swFb5+M+UHMyallKzTtDlwkvhz+rtnP7SVb9hOSUPIv4tsbvK
 XY1/+3cu8BxZBpl0ZMYkC4fmX9pOf6sa+bQiPLRD5RgbF/F1ozNBgTHD9AwbVSxIdbVV
 9xLqQ5xsePvYIFnd46Hi7LLvAfTXb7pRbxNk+4FXLxpS2rcSOfxKcavTalYNVjG5chEt
 92Ug==
X-Gm-Message-State: AOAM5336L48Q0ff6Y/myCuz2eASQHw0QMeCPdDkxV8weBbnuMoYVuuJb
 O+WNAnYFXslo3QE+ktc300dfQPIE26adlcOt5pE=
X-Google-Smtp-Source: ABdhPJwvegtLMIJa3KxAedmoLYxHB/3ZlALI/vMckhb4T9koneIOzB7rW4C88Np7ShZ2CS4RkKi/yQKtA+Ngy2MIp0E=
X-Received: by 2002:a05:6102:c48:: with SMTP id
 y8mr6247230vss.14.1627590314443; 
 Thu, 29 Jul 2021 13:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-15-sean@poorly.run>
In-Reply-To: <20210721175526.22020-15-sean@poorly.run>
From: jim.cromie@gmail.com
Date: Thu, 29 Jul 2021 14:24:48 -0600
Message-ID: <CAJfuBxzgHodZ-=dKxpus58SK8=fgvMPEzYS1Sh-5NZkxk+vL9g@mail.gmail.com>
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

On Wed, Jul 21, 2021 at 11:56 AM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> This patch adds a new module parameter called drm.trace which accepts
> the same mask as drm.debug. When a debug category is enabled, log
> messages will be put in a new tracefs instance called drm for
> consumption.
>
> Using the new tracefs instance will allow distros to enable drm logging
> in production without impacting performance or spamming the system
> logs.

hi Paul,

I should have started reading here, not at patch-1
While I still think some of the _syslog name changes are extra,
drm_debug_enabled() needs it - rename goes with narrower purpose.

a couple comments below, trimming heavily.


> +#define DEBUG_PARM_DESC(dst) \
> +"Enable debug output to " dst ", where each bit enables a debug category.\n" \

I will be borrowing that idea.

> +
> +MODULE_PARM_DESC(debug, DEBUG_PARM_DESC("syslog"));
>  module_param_named(debug, __drm_debug_syslog, int, 0600);
>


> +void __drm_printfn_debug_syslog_and_trace(struct drm_printer *p,
> +                                          struct va_format *vaf)
> +{
> +       pr_debug("%s %pV", p->prefix, vaf);

Im not sure about prefixing this way.
dyndbg query needs to see the prefix in the format string at compile-time.

My RFC patch does the prefixing in the macro layer, when enabled.
when disabled, prefixing at runtime is fine.
This looks easy to shake out..
















> +       drm_trace_printf("%s %pV", p->prefix, vaf);
> +}
> +EXPORT_SYMBOL(__drm_printfn_debug_syslog_and_trace);
> +
>  void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf)
>  {
>         pr_err("*ERROR* %s %pV", p->prefix, vaf);
> @@ -246,6 +278,14 @@ void drm_dev_printk(const struct device *dev, const char *level,
>         struct va_format vaf;
>         va_list args;
>
> +       va_start(args, format);
> +       vaf.fmt = format;
> +       vaf.va = &args;
> +       drm_trace_printf("%s%s[" DRM_NAME ":%ps] %pV",
> +                        dev ? dev_name(dev) : "",dev ? " " : "",
> +                        __builtin_return_address(0), &vaf);
> +       va_end(args);
> +
>         va_start(args, format);
>         vaf.fmt = format;
>         vaf.va = &args;

here and below, you re-prepare vaf.
can you just prepare once, and print 2x to different printers ?
or is that not allowed for some reason?

maybe macros to reduce linecount ?

 thanks
Jim
