Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18F32B95D3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 16:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DB489BF4;
	Thu, 19 Nov 2020 15:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD56989BF4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 15:11:09 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id t143so6634784oif.10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 07:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JdqkWSW9a1z1SVdGoG8hy8zdS0knZMDZmMXxm1Wmdt8=;
 b=KrpNjX0WODmJF84y1iHPQX2qZzuES2LX2P221m9sJNTfwuwxu6hpK4JWFdrL2/H5lY
 Pu2WuXCypBceXoEf03QRJdC7ZJdypKeOjpID7SvyV9Kp8PqELasCnGMV2vabViZccRXg
 Z3lf1rvu/Q6tKBeVdO3AFO9IamwuuvldZgG68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JdqkWSW9a1z1SVdGoG8hy8zdS0knZMDZmMXxm1Wmdt8=;
 b=DN24QK+9Cp9pgj2zirRpY4tXMjwEWqvohby2SFEWGDqdNSfRW0Rfh0xa1ajMqCvIYC
 NUXqpzJS2Nieqj5hTa1lx0049l5w5MQaikV81HlFo6MB14GGZKsmPeVIpuecBo5N15iX
 c6v7q/a8/E0mU03rwuvtiE0LP3ScgTaI+veZJfrC4hca8vMwy6gSEAZsl04Up0Q+8BMt
 Dsg39qesyDuncBFBPGTBQmsU5vOWbqGScbtNCKSgQRkKentrC7xPxyKq6bBCkg+XnmWX
 tenJeGk6c6ccf6qgPsN/vhlCxfyd0bJetf1RRl7oLVZRuIXxlYsBTq2eBqsqluN629Pv
 9VWQ==
X-Gm-Message-State: AOAM533VUi5MONLjlwMHvgbADiEmJCqeMlu7Nwfz9M6tD87hvZFOZoXd
 xpgC0IVDvBfppnXA2pbftVE9/ezaUebIWrqj5lg6qA==
X-Google-Smtp-Source: ABdhPJyc3DHapCPUR/HHhc1a36YrqgEuXr50FTsLT0tmaXXDtJYaO8t+L+SGEMGffyuWBGHKy8w0p+PMlAMqkU19f0Q=
X-Received: by 2002:aca:7506:: with SMTP id q6mr3200770oic.128.1605798668916; 
 Thu, 19 Nov 2020 07:11:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605169912.git.yepeilin.cs@gmail.com>
 <20201113211633.GY401619@phenom.ffwll.local>
 <X68NFzaAuImemnqh@kroah.com> <20201114081021.GA11811@PWN>
 <X6/K/S9V7rj2hI5p@kroah.com>
 <X6/L/lE2pA7csBwd@kroah.com> <20201119083257.GA9468@PWN>
In-Reply-To: <20201119083257.GA9468@PWN>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 19 Nov 2020 16:10:57 +0100
Message-ID: <CAKMK7uF_AOrfTDVZwmxn_C-5sTBDu_v9KGH07wO5hTa98Z8Ucg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] console: Miscellaneous clean-ups, do not use
 FNTCHARCNT() in fbcon.c
To: Peilin Ye <yepeilin.cs@gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 19, 2020 at 9:33 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> On Sat, Nov 14, 2020 at 01:22:22PM +0100, Greg Kroah-Hartman wrote:
> > Ah, here's a hint:
> >       https://wiki.archlinux.org/index.php/Linux_console#Fonts
> >
> > The setfont tool should help you out here.
>
> setfont seems to work fine, I tried Georgian-Fixed16 (256 chars) and
> Uni2-VGA16 (512 chars) under /usr/share/consolefonts/ in my Ubuntu box,
> including setting all consoles to the same font:
>
> for i in {1..6}; do
>         sudo setfont -C /dev/tty${i} /usr/share/consolefonts/Georgian-Fixed16.psf.gz
> done
>
> Font rotation also seems to work fine:
>
> for i in {1..4}; do
>         echo $i | sudo tee /sys/class/graphics/fbcon/rotate
>         sleep 1
> done

Thanks a lot for checking all this.

> One last thing I can think of is tile blitting, but I don't have the
> hardware (e.g. a Matrox G400 card, see FB_TILEBLITTING in
> drivers/video/fbdev/Kconfig) at hand, nor did I figure out how to
> simulate it after searching for a while.  However based on the other
> tests above I believe vc->vc_font.charcount is set properly.

tbh I'll just go ahead and delete it if it's broken :-)

Userspace we have to keep working (and there's actually people
creating new products on top of drm display drivers using fbdev
emulation and /dev/fb/0 interface!), but kernel internal stuff like
fbcon acceleration we can trim pretty aggressively I think.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
