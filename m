Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 303CE613C24
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 18:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A6510E157;
	Mon, 31 Oct 2022 17:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B7910E130
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 17:27:20 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id l5so13462112oif.7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 10:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vZb9O7A86rz8+IQHhKdSDQNKGuKZTMRvSTbUELAFyhU=;
 b=h1hB9HuHXRa1HPSi5UWqu66ChcO14JgFV58gQFFQX0uGCmxmBQPIUWjMiptcWUFuAl
 m4VKpOgOt7PR04c0HXt2NPQaFSc8vb/KOgs5L6jVNV0HQtBHQfkPNrUDj90LNB6Mx1ke
 JjxSsHyxDjDrgv9+8dXAnfl/bHO3PAIDOm5AzjSQYgY9XWYJHQAw7XPXRfhs+JL7+YQc
 zzLPNuLLHy0XQfo45m9DNNkWo4OB08AdgHgQYP72jWetkd7XTFreQ4TaIYiP+yV0GEzc
 f2uOf4/BCjwsP6253nVGl8xVK6lujFOkGDS5DLgbFqaTZKpOxqDa8FkLy/57t15ihI+J
 8ogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vZb9O7A86rz8+IQHhKdSDQNKGuKZTMRvSTbUELAFyhU=;
 b=2R/YP8bcMHnU5L0nUozLlretLUyNnlh5pZysjCo8cQVrdh3maLm671te/eHdfuIbyX
 Mbnx7JFDKx1O8CifQcbolj38okRC+80ePnUrJzCXaPYMoGSne/VaKTqJXmiG6HG96Bu4
 EUMqJtkTzf8SY5MCLrWYS0ExXVBfEu8T2vKk2FwzHGQhMDjYnFgsAl5yu93/w3jxEWQg
 PTcPCCyi/tOXb5YHG0bSmVEPCvVHYkXxlhRJSHx4n+jFJVk4+v+XHCpwtd9DVY+AIa/X
 mQWzCxUu5zGrYBVYYbBzoP9aFZ9nlrTQTW6c7nozwnL4xenXtN5ZXIzMT8EQSAteh8og
 SyUw==
X-Gm-Message-State: ACrzQf22tvwMWExPL1hvDnobjC8vNiLtJL7NK+wc1pVKve8yfMuLZgiN
 LVlbxkg7nOyhXKRKnJnDlpjtoGweWtABaAhtwRw=
X-Google-Smtp-Source: AMsMyM5zaFuIfJ74PrdQV9tjel2ST/eLXwCkMGirZyjbjam9sBQtYl97KJ6IndBO3adBVAnB9Y2sOTOJ3uKG+mI6n+k=
X-Received: by 2002:a05:6808:14d2:b0:354:c733:abd3 with SMTP id
 f18-20020a05680814d200b00354c733abd3mr7361828oiw.96.1667237240077; Mon, 31
 Oct 2022 10:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221031165834.GA10150@duo.ucw.cz> <Y2ABatgNLVAAjpSW@intel.com>
 <20221031171952.GA10666@duo.ucw.cz>
In-Reply-To: <20221031171952.GA10666@duo.ucw.cz>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 31 Oct 2022 13:27:08 -0400
Message-ID: <CADnq5_PBghDvCe2vbXFusOCCpzS5CgPg_9S3doXN7dkFWeLrFQ@mail.gmail.com>
Subject: Re: 6.1-rc: names of video outputs changed?
To: Pavel Machek <pavel@ucw.cz>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 kernel list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 31, 2022 at 1:19 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > > I used to be able to do:
> > >
> > > pavel@duo:~$     xrandr --output HDMI1 --mode 1920x1080 --primary
> > > warning: output HDMI1 not found; ignoring
> > > pavel@duo:~$     xrandr --output VGA1 --mode 1280x1024 --below HDMI1
> > > warning: output VGA1 not found; ignoring
> > >
> > > ...but now I have to do:
> > >
> > > pavel@duo:~$     xrandr --output VGA-1 --mode 1280x1024 --below HDMI-1
> > > xrandr: cannot find crtc for output VGA-1
> > > pavel@duo:~$     xrandr --output LVDS-1 --off
> > > pavel@duo:~$     xrandr --output VGA-1 --mode 1280x1024 --below HDMI-1
> > >
> > > Notice the change from HDMI1 to HDMI-1. I believe that's new in 6.1 or
> > > so. Who did it and why? Hardware is thinkpad x220, and this breaks my
> > > scripts :-(.
> >
> > Are you sure you didn't just switch from intel ddx to modesetting ddx?
>
> How do I tell?

Check your xorg log.

Alex


>
> I don't think I did such changes recently. It is Debian 10.13 system
> (rather old) so I don't think it did update for me.
>
> Thanks and best regards,
>                                                                 Pavel
> --
> People of Russia, stop Putin before his war on Ukraine escalates.
