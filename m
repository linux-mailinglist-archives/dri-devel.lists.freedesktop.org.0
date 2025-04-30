Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE74AA525E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 19:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804B910E100;
	Wed, 30 Apr 2025 17:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KcM1vszn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AC610E100
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 17:06:01 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-224019ad9edso1230715ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 10:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1746032760; x=1746637560;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=58Ob5TdaRLI/TNcS+mN0Uupr9ndgBJlrZ3pUusjLfjE=;
 b=KcM1vsznUGIL+C30yaReVCg183n6EzwMl0UB+I2MGobqHrGBBcIS6BI9ydtar88CBu
 C97G0ZlAKZ1nA87rCNdOvVakNjMhuk9Ste6qbGGNL3g++LtZp2YsnI2O8CUQFgSn4wgZ
 PpSk9RfR+ovo9D8oI18AAP3tTkyJRylpI3U34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746032760; x=1746637560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=58Ob5TdaRLI/TNcS+mN0Uupr9ndgBJlrZ3pUusjLfjE=;
 b=MNv7e8DpDJ5dHGeGzqSnppMRlFOI7UrlEYia2ZdMLCT5rj787rFTVyzOzeXiGcH85t
 KaUF6REiE2IZAu1eFlX1JsnpapqUQkBl4+cypLL+v0bfvxh0F7vntX2URtn88hJAJ8Ed
 0WdYsa9DIARBQ93jclQ/4SrhuFbm8KwHENl6kfg2zKNJP4uTkbrHW8fHDTcOhoTygZiA
 zjXP1KYrGl98t9NHEvKRNUSJcVuKK4HstSazdUhG+qOX96bQZ5UIIn2br8XETsIL8Hf/
 lYo/LAP4BTDia5KlK1t8IiKAXPh6haXL1+YtHYSJsoHspGVYINkTNw3kUl6HUaXZXbhI
 QCXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVijt4sachgQCGAc2eEp+dW5DZWPiFLiRiDWgxmLg5iJkHw3B3ZCdjSlwVxUl5JHcchmeblPgMkovk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzY0e8wAfTC5HkyWXVCF0yUWqbkURt05EwEzSw//xo1sp9uC0g3
 +8SvqbLKhuwjPJYWxknOT1IV5JlzSkTZlCtvPLaRNq+liUYhwYSmg7Epq7Vzi/Zr9adFyjER0aA
 =
X-Gm-Gg: ASbGnctoO2vd5wD6vxw7lmi51iZyT9IybNE81MSwxy0p3nXOUX9cFyZjwdD/t+OEtHe
 Q6NKqBZ8RroX9Qf1HI1GR1V8HI8b4UtvKbHMZrE4sO17N1WaPgr3UDu+JXivuWE+V4izAhB2Zz0
 CuvYDdtj0JmAVWvcSRDBEhKXvi+0zJ9ch9jbKYybmxFk2a1t0+RagtfK5DnhSnyRQPCzadfF//n
 K3JgzkT+0CugXpq1udYk9cCBT5jkaQm9cl8kMxrjeEd4E3jAFhdwlPtY0UI3Nr9z6c9AmAo6Uk+
 j+uGdQHNUc0B60u1JRNuIxtze3xLzS01w4sridNVqLJaKgasBb8/vcKxMu2cd55T+qPS4eH32Ez
 hah5jkNNt
X-Google-Smtp-Source: AGHT+IHCy2P04kBLbaTeHnuWpJqKv7MzLD1g/a0vK+AMyNv2dF9u4Uz/lFhrlXGL6qlQQeAUEg27Zw==
X-Received: by 2002:a17:903:41cd:b0:224:a79:5fe9 with SMTP id
 d9443c01a7336-22df3538fdbmr58089265ad.30.1746032759509; 
 Wed, 30 Apr 2025 10:05:59 -0700 (PDT)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com.
 [209.85.215.174]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22de49dccd3sm44194525ad.123.2025.04.30.10.05.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 10:05:58 -0700 (PDT)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b0db0b6a677so47269a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 10:05:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXwvMiskLCojaziJ+a2OK/N3hwkaLH5t4OOlLDHzDDLkXUoHEbc0EoiO9Vtn7a0KI05Il/B6hD9MWc=@lists.freedesktop.org
X-Received: by 2002:a17:90b:2e4a:b0:2ee:d024:e4fc with SMTP id
 98e67ed59e1d1-30a3336490bmr7094252a91.33.1746032757616; Wed, 30 Apr 2025
 10:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
In-Reply-To: <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Apr 2025 10:05:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wc9TnDg6vDb8r5A8dT9TvOzU2kNSKi_6TzTtb0ka=8jA@mail.gmail.com>
X-Gm-Features: ATxdqUFGEFgUWcVP9tpAp7IAvVZ1WS2kKN7Qn8lT1mnsHdTLRM-PhtyTgbA3XGA
Message-ID: <CAD=FV=Wc9TnDg6vDb8r5A8dT9TvOzU2kNSKi_6TzTtb0ka=8jA@mail.gmail.com>
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
To: Nick Bowler <nbowler@draconx.ca>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Wed, Apr 30, 2025 at 6:28=E2=80=AFAM Nick Bowler <nbowler@draconx.ca> wr=
ote:
>
> Hi Doug,
>
> On Mon, Apr 28, 2025 at 01:40:25PM -0700, Doug Anderson wrote:
> > On Sun, Apr 20, 2025 at 9:26=E2=96=A0PM Nick Bowler <nbowler@draconx.ca=
> wrote:
> > > I recently noticed that on current kernels I lose video output from
> > > my Blackbird's AST2500 BMC after a reboot
> [...]
> > >   ce3d99c8349584bc0fbe1e21918a3ea1155343aa is the first bad commit
> > >   commit ce3d99c8349584bc0fbe1e21918a3ea1155343aa
> > >   Author: Douglas Anderson <dianders@chromium.org>
> > >   Date:   Fri Sep 1 16:39:53 2023 -0700
> > >
> > >       drm: Call drm_atomic_helper_shutdown() at shutdown time for mis=
c drivers
> [...]
> > Bleh. That's not good. If I had to guess there's some subtle bug /
> > missing timing constraint that's being triggered here. A few things to
> > try:
> >
> > 1. Add a several second delay after the call to
> > "drm_atomic_helper_shutdown()", like msleep(5000) or something like
> > that. That's kind of a shot in the dark, but it's fairly common for
> > panels to get upset if you turn them off and then turn them on again
> > too quickly. This would be my blind guess of what is happening.
>
> Adding msleep(5000) does nothing except that once the video turns off
> it now takes 5 seconds longer to reboot.

Dang. Thanks for checking.


> > 2. Could you give more details about what panel you're using?
>
> According to the documentation I have for the machine, the video output
> of the AST2500 BMC is connected to an IT66121 HDMI transmitter.
>
> Then in turn I have that connected to some generic HDMI->VGA adapter
> (PrimeCables branded).  I also tried with another much more expensive
> device (Extron DVI-RGB 200) and observe no difference in behaviour.
>
> i think these devices are working and there's just no output signal
> on the hdmi port.

I've got a pile of crappy/generic HDMI to VGA adapters and I've had
mixed success with them working. They're not really passive adapters,
so they somehow need power to convert the HDMI to VGA. They seem to
run off the power given to them by the HDMI port and I've seen cases
where (I suspect) they get into a bad state. I've seen cases where
they need to be plugged in at just the right time in order to work and
I suspect that there's some sort of chicken-and-egg problem here.
Maybe in most states the HDMI port doesn't get power if nothing is
plugged in but (because of their design) they can't report plugged in
without getting power? ...but then there are maybe some cases where
power is given anyway? I'm spitballing here.

I don't know much about the Extron DVI-RGB 200.

Do you happen to have anything that's just a normal HDMI sink, like a
TV or a standard monitor that takes HDMI?


> > Ideally it'd be great if you could say which device tree you're using t=
oo.
>
> Not sure how to answer this.  Do you want me to look at something
> specific in /proc/device-tree?  Or dump it somehow?

Ah, I get it. On many device tree boards people use a dts file that
lives in the Linux source base and then bundle it with the kernel.
Looks like yours is provided by your firmware?


> > 3. Any chance you can gather the `dmesg` from a failing boot and
> > provide it somehow? Are there any errors in the logs from the failing
> > boot?
>
> To clarify, there is no boot failure.  There is just no video output
> after rebooting.  I can then boot Linux again by any method that works
> without being able to see the screen, and then everything is fine once
> I do that.

Super weird. So every other boot works?

I guess I'd be interested in other types of tests to see what's going
on. Aside from trying some other, more standard HDMI sinks, I'd love
to see the results of:

1. HDMI is supposed to be hotpluggable. If you've got a boot where the
display isn't working, what if you unplug the HDMI and plug it back
in. Does it fix it?

2. Does the hotplug experience change if you boot with the revert?
AKA: boot up with the revert (so everything is working normally),
unplug HDMI, wait a few seconds, plug HDMI back in? Is this different
than #1?

3. What about if you fully power off and then power on? Does the
display work reliably in this case, or are things different between
ToT and with the revert?

4. What about if you fully power off, unplug the HDMI, wait a few
seconds, plug the HDMI, and power on? Does that work? Are things
different between ToT and with the revert?


> I've attached the dmesg output (gzipped) from after such a reboot.
> Except for the order and the timestamps, the messages are identical to
> when I boot after rebooting a kernel which does not disable the video.

Thanks! dmesg could still be useful but I was hoping for some error
messages. I guess not.
