Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F081F57D5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 17:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B2A6E5CC;
	Wed, 10 Jun 2020 15:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210316E5CC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 15:30:13 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id a127so1235353pfa.12
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 08:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Am24crIC+zRfq8I8n93/ZjGiDoZosDQrAqxUJdqS3ZM=;
 b=BKXx3SOyUvkDpf/X6HJW9wmsPI7C0cUoPqr1ArNq+pYFyLKoC6r21AEsN9rDscOEg3
 HoOgpgojOwP1M3ymn/O1csUpkvdvRljUcB9xEHncX5XzuSz5jShc9+WGeq7B4HPrHWi5
 RrhmVJlusLIiJMQ0g1FqxQe2KiOR7BfUMRKY1i90aY9ckpC5iVlwZaRyx3jm5+GhHUSQ
 2vjD4j2RKNQ4M21SDQloQW2dgEP8dxgG+6vHWakGdj78P3Dk8idjCbQEyAVocYqL6NP6
 8SQQrxc8hAqBgURcqAQ35/jMbcPlX3ecycMdZIqOLvm4kHTvMLbAIhRUpi+7ZGAxOJm/
 Wdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Am24crIC+zRfq8I8n93/ZjGiDoZosDQrAqxUJdqS3ZM=;
 b=jJ2qHHUYNYkR73Kc/oJS1XX+fVGjyHuIbtUDo4m6J2jO0c9bsGtpcozK2qOgxloZNo
 cfhPXtvI5cNElsl3gRwSaKHdpHDPNajVthScQP11rh983U8/xwoFexBo/PMiwIzoRw8q
 1l+R6DDfVMQcZ2O9WOJhb3O4RrryQoadKXFSyYYa5faEj7ubY3zv8KrY0WPHCCzXSRgB
 xYHmWYhQMQe0RS3U15ec6jlCVZiGKqLasWMxzoVOsMaWOZ4rnB/Xa7Bmdek2BDpRtoIg
 U/DY4wMC1AXyknZoTElxOmt1U6Z+rLu2G8lc0esBaUXa0/Qd0poD3AohnXjAwny76N2m
 +xIQ==
X-Gm-Message-State: AOAM531Gsw2MMOhci7X8jt8dtUPqM/Ot8vKeyXwv8gSwqWMVQkUb8aQU
 Go/FSCwhgZ2pPxHKSF9ImThrUktHbKbJ5ILOObtvGBcTtFU=
X-Google-Smtp-Source: ABdhPJxp9L2HOD2Z7AYkahM2j6pxJ54dqJDz9gGr5QAUSYQgKY6NYaHg3BmnE2NOtUFXCERInPhRY3BU5HpOIELaWGo=
X-Received: by 2002:a92:8593:: with SMTP id f141mr3594946ilh.264.1591803011947; 
 Wed, 10 Jun 2020 08:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <202006090859.AP8QhpSU%lkp@intel.com>
 <20200609154932.696-1-sean@poorly.run>
 <20200610110140.3c0da742@oasis.local.home>
In-Reply-To: <20200610110140.3c0da742@oasis.local.home>
From: Sean Paul <sean@poorly.run>
Date: Wed, 10 Jun 2020 11:29:36 -0400
Message-ID: <CAMavQKKqDUQgAMPX9wCvZ-GZMQNiqU3YYKnyUaGL73cd844JJQ@mail.gmail.com>
Subject: Re: [PATCH v6 13/13] drm/print: Add tracefs support to the drm
 logging helpers
To: Steven Rostedt <rostedt@goodmis.org>
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
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Chris Wilson <chris@chris-wilson.co.uk>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 10, 2020 at 11:01 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue,  9 Jun 2020 11:49:19 -0400
> Sean Paul <sean@poorly.run> wrote:
>
> > +/**
> > + * drm_trace_printf - adds an entry to the drm tracefs instance
> > + * @format: printf format of the message to add to the trace
> > + *
> > + * This function adds a new entry in the drm tracefs instance
> > + */
> > +void drm_trace_printf(const char *format, ...)
> > +{
> > +     struct va_format vaf;
> > +     va_list args;
> > +
> > +     va_start(args, format);
> > +     vaf.fmt = format;
> > +     vaf.va = &args;
> > +     trace_array_printk(trace_arr, _THIS_IP_, "%pV", &vaf);
> > +     va_end(args);
> > +}
>
> The only issue I have with this patch is the above. I really dislike
> the use of trace_array_print(), as that is made to be for debugging and
> not something that should be in a production kernel.
>
> Ideally, every instance should just pass the data it wants to record,
> and you add it to a trace event. There's already a drm trace subsystem,
> how would this be different. Perhaps create a drm_log subsystem, and
> you only need to have your instance enable it?
>
> I guess I'm still confused to why this is needed over just having trace
> events? What's special about this case?
>

Hi Steve,
In v2 I had added trace events throughout drm in this manner. See
https://lists.freedesktop.org/archives/dri-devel/2019-November/243318.html

The feedback I received was that exposing the events in such a
structured way would bind us to the trace formats and make things more
difficult moving forward.

Aside from the UAPI concerns, wearing my ChromeOS hat (with full
knowledge that most upstream folks won't care about this), this
solution also misses on making problems easier to diagnose from
logs/user feedback. It requires that driver developers add tracing
beside their logging, and makes backporting upstream code even harder
than it is right now. If we can intercept the existing and new logging
at the source, it's much easier to ensure the flight recorder is
accurate. We've been shipping this (v4) in CrOS for ~months now and
it's been invaluable. With this experience in mind, I'd be really
hesitant to change course.

Sean

> -- Steve
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
