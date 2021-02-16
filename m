Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2300F31C7C7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 10:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0536E3D3;
	Tue, 16 Feb 2021 09:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D896F6E3D3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 09:09:39 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v7so12006066wrr.12
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 01:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=K5zC5Y1zvesaXwk7zKrXE6Sqg4y3GDAfdw86rtI8m6o=;
 b=apOi8qqe7jYCfTsdg9jYa8ZrUBRJbUmEArshiR1i9FfkUoecNLS9KkVJcm/QJRL5DL
 /9T3XDBGoBqCDzbr8zdH/7xPgZh8a/WcCs6TA+IjXaisFenEZ2KaMvQBJ5CSClTzVoot
 0g6vceEQPdrP5n158Jz2msejzcc589GAAqUtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K5zC5Y1zvesaXwk7zKrXE6Sqg4y3GDAfdw86rtI8m6o=;
 b=Fj2tawElGjcn367vwg5Q2M7axtkXRpzW2KPyQI5idi0hzuM3IahLEojj3P3EhL4en/
 WlwGNkWUUSqy7hwb2KTfrYCg+n4p23tSow9vYS2uZQ+F1grijyJvSgeQbJ4Palm6z8xn
 9+lmg2iR6ySdkfg5KpeF8yn4tweE450FJ+LCwm8ejjY0xToa7Ej0OvK1seH/T3MtfEPF
 fRx5D6v9pgHR0TXtXnutMuccezwL3TX2mtyD1/6tji+pttFnnWp1fmCLSzXRUdJqXSNe
 oDytiDbpSxfEgm7b1iNW4H3jNGj8JAvBjh/eUPuf1QLgjgwfrxLMLB4NmkIBeJlTAAUZ
 oo2w==
X-Gm-Message-State: AOAM532gyWTYcTn2P0v5Dq8wzJ1JUN9lUIO1fgg1F1AZm5KDzDL7Ntiu
 lH2h0TwNoRUvLM6AOdN0A3KUlw==
X-Google-Smtp-Source: ABdhPJzdZcOoTuCKynHice6z5PD8IYy6n4mOt3kwBaTsySFHj1AcBgs/+6shoAJ1fW4RiLQTiIgn/Q==
X-Received: by 2002:a5d:6602:: with SMTP id n2mr22288886wru.150.1613466578573; 
 Tue, 16 Feb 2021 01:09:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z1sm221367wmi.22.2021.02.16.01.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 01:09:38 -0800 (PST)
Date: Tue, 16 Feb 2021 10:09:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/3] video: Remove in_interrupt() usage.
Message-ID: <YCuL0DR8CQXEKTjP@phenom.ffwll.local>
References: <20210208223810.388502-1-bigeasy@linutronix.de>
 <20210216083500.brcafu6mo2yiz3cg@linutronix.de>
 <YCuFli/TEl6gysTb@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCuFli/TEl6gysTb@kroah.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-fbdev@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 16, 2021 at 09:43:02AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Feb 16, 2021 at 09:35:00AM +0100, Sebastian Andrzej Siewior wrote:
> > On 2021-02-08 23:38:07 [+0100], To linux-fbdev@vger.kernel.org wrote:
> > > Folks,
> > > 
> > > in the discussion about preempt count consistency across kernel
> > > configurations:
> > > 
> > >  https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/
> > > 
> > > it was concluded that the usage of in_interrupt() and related context
> > > checks should be removed from non-core code.
> > > 
> > > In the long run, usage of 'preemptible, in_*irq etc.' should be banned from
> > > driver code completely.
> > > 
> > > This series targets the video subsystem. The omap patches are a repost
> > > of [0], the amba-clcd is new after I received no feedback on my analysis
> > > [1].
> > > 
> > > [0] https://lkml.kernel.org/r/20210127172902.145335-1-bigeasy@linutronix.de
> > > [1] https://lkml.kernel.org/r/20210127174408.ududpwfrbg3dhyxj@linutronix.de
> > 
> > Could someone please apply the series? Video seems unmaintained.
> 
> It's the merge window, no one can apply the series...
> 
> Please resend once 5.12-rc1 is out.

drm trees are always open, to avoid the merge window blackout lol :-)

Reason I didn't merge anything is that I'm intentionally letting fbdev
hang in there, in the hopes someone picks up review&patch apply duties. It
already worked a few times but then people move on again ...

Anyway patches queued up in drm-misc-next for 5.13.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
