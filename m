Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6D149D626
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 00:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C917710EDD6;
	Wed, 26 Jan 2022 23:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430DA10EDD3;
 Wed, 26 Jan 2022 23:29:51 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id m11so1213399edi.13;
 Wed, 26 Jan 2022 15:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uuHRqUjjWj306VYDNNFTEUHxBvFeBcIWZoiUoK8EevM=;
 b=qwjX1cWBXoM+3a+Gn/oty1HJw46DqERcb9qculQ2bNmPnYaWbY7J02DySub8ersawd
 KKewDvcyecqPwWwGoEu/0hjYlQKYcPKkVKkYM3+Na6Z+J4w5i9emmGxpnG6XJD0Akco8
 /mRSf1QKQRjGMCKI/4IIlPFSQ2tNpIXKk2qBoR+zY7nfC3aS90dV30iQhWbH+uNBNQjr
 70sIGR0dTKVzKqoLF10XHIKCHPC/4pEONVyCYSfzcNjcA6qWvbhJNnYJ5CZBwUdN7mfa
 IvpEfqyaN/jMnjRzCB1Dwga4hqNAIheURUX2zsTAPkL8thBQhtVD8f+dIYE+oU5HNwlh
 ANHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uuHRqUjjWj306VYDNNFTEUHxBvFeBcIWZoiUoK8EevM=;
 b=lRU9GbLq+IrmJn3Y+lq4XuR+8mbl0JvVcAEAtI59imXpJIyhrwKzVkCJ+XTO/G5gZd
 76/38XLUAMkQYQFzbkkc64q2P0gdPksFywVTtFjaVIOGOJ1GtwvmrOXIoC6vOdQafgc4
 pxnPNKE8HKviN69ujfH64wAAJ5PKAk4e23ZVJrrNGzL7AP0TUiMNoRwaSiaTwNLJIUS9
 bqJuRDeF7M6q1d9avthoO4uThzWgsa/uDaySWsK87jNw5jQ9sYWW5pXf7qETQOwZGlmV
 3SQ5J0OVDFi+DzX3FYVUnD6hDb5HuIuiHfhOgFGDVoy0I8uMwmAf5QvYOEQjrl5SmVOm
 nb5w==
X-Gm-Message-State: AOAM531mhCj3FJSaG4d0oAchjSxWWNxER7VUMJVZB/4MIvFb/ydRhJD/
 60IBfVIMJaqG0bt4jrDbyV2O5vp3JHSdWlOODz0=
X-Google-Smtp-Source: ABdhPJyH9hbSNXgw6tHQLivrAsV/11pw5UrW6RKktuvZXRzTspkAhHj4b5LWupnKPU1nx947zygnzNiRIu0QhzY2L+o=
X-Received: by 2002:a05:6402:f0c:: with SMTP id
 i12mr1263576eda.156.1643239789350; 
 Wed, 26 Jan 2022 15:29:49 -0800 (PST)
MIME-Version: 1.0
References: <20211214140301.520464-1-bigeasy@linutronix.de>
 <20211214140301.520464-5-bigeasy@linutronix.de>
In-Reply-To: <20211214140301.520464-5-bigeasy@linutronix.de>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 27 Jan 2022 00:29:37 +0100
Message-ID: <CAEsyxygWP50qP9Xj-GmAycb6Ex8DET2c4DbY-i3dnocaXZ=JZA@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/i915: Use preempt_disable/enable_rt() where
 recommended
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000ecd74505d68493f8"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Mike Galbraith <umgwanakikbuti@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000ecd74505d68493f8
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 14, 2021 at 3:03 PM Sebastian Andrzej Siewior <
bigeasy@linutronix.de> wrote:

> From: Mike Galbraith <umgwanakikbuti@gmail.com>
>
> Mario Kleiner suggest in commit
>   ad3543ede630f ("drm/intel: Push get_scanout_position() timestamping into
> kms driver.")
>
> a spots where preemption should be disabled on PREEMPT_RT. The
> difference is that on PREEMPT_RT the intel_uncore::lock disables neither
> preemption nor interrupts and so region remains preemptible.
>
>
Hi, first thank you for implementing these preempt disables according to
the markers i left long ago. And sorry for the rather late reply.

I had a look at the code, as of Linux 5.16, and did also a little test run
(of a standard kernel, not with PREEMPT_RT, only
CONFIG_PREEMPT_VOLUNTARY=y) on my Intel Kabylake GT2, so some thoughts:

The area covers only register reads and writes. The part that worries me
> is:
> - __intel_get_crtc_scanline() the worst case is 100us if no match is
>   found.
>

This one can be a problem indeed on (maybe all?) modern Intel gpu's since
Haswell, ie. the last ~10 years. I was able to reproduce it on my Kabylake
Intel gpu.

Most of the time that for-loop with up to 100 repetitions (~ 100
udelay(1) + one mmio register read) (cfe.
https://elixir.bootlin.com/linux/v5.17-rc1/source/drivers/gpu/drm/i915/i915_irq.c#L856)
will not execute, because most of the time that function gets called from
the vblank irq handler and then that trigger condition (if
(HAS_DDI(dev_priv) && !position)) is not true. However, it also gets called
as part of power-saving on behalf of userspace context, whenever the
desktop graphics goes idle for two video refresh cycles. If the desktop
shows graphics activity again, and vblank interrupts need to get reenabled,
the probability of hitting that case is then ~1-4% depending on video mode.
How many loops it runs also varies.

On my little Intel(R) Core(TM) i5-8250U CPU machine with a mostly idle
desktop, I observed about one hit every couple of seconds of regular use,
and each hit took between 125 usecs and almost 250 usecs. I guess udelay(1)
can take a bit longer than 1 usec?

So that's too much for preempt-rt. What one could do is the following:

1. In the for-loop in __intel_get_crtc_scanline(), add a preempt_enable()
before the udelay(1); and a preempt_disable() again after it. Or
potentially around the whole for-loop if the overhead of
preempt_en/disable() is significant?

2. In intel_get_crtc_scanline() also wrap the call to
__intel_get_crtc_scanline() into a preempt_disable() and preempt_enable(),
so we can be sure that __intel_get_crtc_scanline() always gets called with
preemption disabled.

Why should this work ok'ish? The point of the original preempt disable
inside i915_get_crtc_scanoutpos
<https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/i915_get_crtc_scanoutpos>
is that those two *stime = ktime_get() and *etime = ktime_get() clock
queries happen as close to the scanout position query as possible to get a
small confidence interval for when exactly the scanoutpos was
read/determined from the display hardware. error = (etime - stime) is the
error margin. If that margin becomes greater than 20 usecs, then the
higher-level code will consider the measurement invalid and repeat the
whole procedure up to 3 times before giving up.

Normally, in my experience with different graphics chips, one would observe
error < 3 usecs, so the measurement almost always succeeds at first try,
only very rarely takes two attempts. The preempt disable is meant to make
sure that this stays the case on a PREEMPT_RT kernel.

The problem here are the relatively rare cases where we hit that up to 100
iterations for-loop. Here even on a regular kernel, due to hardware quirks,
we already exceed the 20 usecs tolerance by a huge amount of more than 100
usecs, leading to a retry of the measurement. And my tests showed that
often the two succeeding retries also fail, because of hardware quirks can
apparently create a blackout situation approaching 1 msec, so we lose
anyway, regardless if we get preempted on a RT kernel or not. That's why
enabling preemption on RT again during that for-loop should not make the
situation worse and at least keep RT as real-time as intended.

In practice I would also expect that this failure case is the one least
likely to impair userspace applications greatly in practice. The cases that
mostly matter are the ones executed during vblank hardware irq, where the
for-loop never executes and error margin and preempt off time is only about
1 usec. My own software which depends on very precise timestamps from the
mechanism never reported >> 20 usecs errors during startup tests or runtime
tests.


> - intel_crtc_scanlines_since_frame_timestamp() not sure how long this
>   may take in the worst case.
>
>
intel_crtc_scanlines_since_frame_timestamp() should be harmless. That
do-while loop just tries to make sure that two register reads that should
happen within the same video refresh cycle are happening in the same
refresh cycle. As such, the while loop will almost always just execute only
once, and at most two times, so that's at most 6 mmio register reads for
two loop iterations.

In the long run one could try to test if
__intel_get_crtc_scanline_from_timestamp
<https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/__intel_get_crtc_scanline_from_timestamp>()
wouldn't be the better choice for affected hardware always. Code and
register descriptions suggest the feature is supported by all potentially
affected hardware, so if it would turn out that that method works as
accurate and reliable as the old one, we could save the overhead and time
delays for that 100 for-loop iterations and make the whole timestamping
more reliable on modern hw.

It was in the RT queue for a while and nobody complained.
> Disable preemption on PREEPMPT_RT during timestamping.
>
>
Do other patches exist to implement the preempt_dis/enable() also for AMD
and NVidia / nouveau / vc4? I left corresponding markers for
radeon/amdgpu-kms and RaspberryPi's vc4 driver. Ideally all kms drivers
which use scanout position queries should have such code. Always a
preempt_disable() before the "if (stime) *stime = ktime_get();" statement,
and a preempt_enable() after the "if (etime) *etime = ktime_get();"
statement.

Checking Linux 5.16 code, this should be safe - short preempt off interval
with only a few mmio register reads - for all kms drivers that support it
atm. I found the following functions to modify:

amdgpu: amdgpu_display_get_crtc_scanoutpos()
radeon: radeon_get_crtc_scanoutpos()
msm: mdp5_crtc_get_scanout_position() and dpu_crtc_get_scanout_position()
ltdc: ltdc_crtc_get_scanout_position()
vc4: vc4_crtc_get_scanout_position()

nouveau: In nvkm_head_mthd_scanoutpos(), one needs to put the
preempt_disable() right before

args <https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/args>->v0
<https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/v0>.time
<https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/time>[0] =
ktime_to_ns <https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/ktime_to_ns>(ktime_get
<https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/ktime_get>());

and the preempt_enable() right after
args <https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/args>->v0
<https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/v0>.time
<https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/time>[1] =
ktime_to_ns <https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/ktime_to_ns>(ktime_get
<https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/ktime_get>());


Is the plan to integrate these patches into the mainline kernel soon, as
part of ongoing preempt-rt upstreaming?

thanks,
-mario

[bigeasy: patch description.]
>
> Cc: Mario Kleiner <mario.kleiner.de@gmail.com>
> Signed-off-by: Mike Galbraith <umgwanakikbuti@gmail.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/gpu/drm/i915/i915_irq.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_irq.c
> b/drivers/gpu/drm/i915/i915_irq.c
> index 038a9ec563c10..8e9ff0bcbc7e4 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -916,7 +916,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc
> *_crtc,
>          */
>         spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
>
> -       /* preempt_disable_rt() should go right here in PREEMPT_RT
> patchset. */
> +       if (IS_ENABLED(CONFIG_PREEMPT_RT))
> +               preempt_disable();
>
>         /* Get optional system timestamp before query. */
>         if (stime)
> @@ -980,7 +981,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc
> *_crtc,
>         if (etime)
>                 *etime = ktime_get();
>
> -       /* preempt_enable_rt() should go right here in PREEMPT_RT
> patchset. */
> +       if (IS_ENABLED(CONFIG_PREEMPT_RT))
> +               preempt_enable();
>
>         spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
>
> --
> 2.34.1
>
>

--000000000000ecd74505d68493f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Dec 14, 2021 at 3:03 PM Sebastian=
 Andrzej Siewior &lt;<a href=3D"mailto:bigeasy@linutronix.de">bigeasy@linut=
ronix.de</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Mike Galbraith &lt;<a href=3D"mail=
to:umgwanakikbuti@gmail.com" target=3D"_blank">umgwanakikbuti@gmail.com</a>=
&gt;<br>
<br>
Mario Kleiner suggest in commit<br>
=C2=A0 ad3543ede630f (&quot;drm/intel: Push get_scanout_position() timestam=
ping into kms driver.&quot;)<br>
<br>
a spots where preemption should be disabled on PREEMPT_RT. The<br>
difference is that on PREEMPT_RT the intel_uncore::lock disables neither<br=
>
preemption nor interrupts and so region remains preemptible.<br>
<br></blockquote><div>=C2=A0</div><div>Hi, first thank you for implementing=
 these preempt disables according to the markers i left long ago. And sorry=
 for the rather late reply.<br></div><div><br></div><div>I had a look at th=
e code, as of Linux 5.16, and did also a little test run (of a standard ker=
nel, not with PREEMPT_RT, only CONFIG_PREEMPT_VOLUNTARY=3Dy) on my Intel Ka=
bylake GT2, so some thoughts:<br></div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
The area covers only register reads and writes. The part that worries me<br=
>
is:<br>
- __intel_get_crtc_scanline() the worst case is 100us if no match is<br>
=C2=A0 found.<br></blockquote><div><br></div><div>This one can be a problem=
 indeed on (maybe all?) modern Intel gpu&#39;s since Haswell, ie. the last =
~10 years. I was able to reproduce it on my Kabylake Intel gpu.</div><div><=
br></div><div>Most of the time that for-loop with up to 100 repetitions (~ =
100 udelay(1)=C2=A0+ one mmio register read) (cfe. <a href=3D"https://elixi=
r.bootlin.com/linux/v5.17-rc1/source/drivers/gpu/drm/i915/i915_irq.c#L856">=
https://elixir.bootlin.com/linux/v5.17-rc1/source/drivers/gpu/drm/i915/i915=
_irq.c#L856</a>) will not execute, because most of the time that function g=
ets called from the vblank irq handler and then that trigger condition (if =
(HAS_DDI(dev_priv) &amp;&amp; !position)) is not true. However, it also get=
s called as part of power-saving on behalf of userspace context, whenever t=
he desktop graphics goes idle for two video refresh cycles. If the desktop =
shows graphics activity again, and vblank interrupts need to get reenabled,=
 the probability of hitting that case is then ~1-4% depending on video mode=
. How many loops it runs also varies.<br></div><div><br></div><div>On my li=
ttle Intel(R) Core(TM) i5-8250U CPU machine with a mostly idle desktop, I o=
bserved about one hit every couple of seconds of regular use, and each hit =
took between 125 usecs and almost 250 usecs. I guess udelay(1) can take a b=
it longer than 1 usec?</div><div><br></div><div>So that&#39;s too much for =
preempt-rt. What one could do is the following:</div><div><br></div><div>1.=
 In the for-loop in __intel_get_crtc_scanline(), add a preempt_enable() bef=
ore the udelay(1); and a preempt_disable() again after it. Or potentially a=
round the whole for-loop if the overhead of preempt_en/disable() is signifi=
cant?</div><div><br></div><div>2. In intel_get_crtc_scanline() also wrap th=
e call to __intel_get_crtc_scanline() into a preempt_disable() and preempt_=
enable(), so we can be sure that __intel_get_crtc_scanline() always gets ca=
lled with preemption disabled.</div><div><br></div><div>Why should this wor=
k ok&#39;ish? The point of the original preempt disable inside <span class=
=3D"gmail-nf"><a href=3D"https://elixir.bootlin.com/linux/v5.17-rc1/C/ident=
/i915_get_crtc_scanoutpos">i915_get_crtc_scanoutpos</a></span> is that thos=
e two *stime =3D ktime_get() and *etime =3D ktime_get() clock queries happe=
n as close to the scanout position query as possible to get a small confide=
nce interval for when exactly the scanoutpos was read/determined from the d=
isplay hardware. error =3D (etime - stime) is the error margin. If that mar=
gin becomes greater than 20 usecs, then the higher-level code will consider=
 the measurement invalid and repeat the whole procedure up to 3 times befor=
e giving up.</div><div><br></div><div>Normally, in my experience with diffe=
rent graphics chips, one would observe error &lt; 3 usecs, so the measureme=
nt almost always succeeds at first try, only very rarely takes two attempts=
. The preempt disable is meant to make sure that this stays the case on a P=
REEMPT_RT kernel.<br></div><div><br></div><div>The problem here are the rel=
atively rare cases where we hit that up to 100 iterations for-loop. Here ev=
en on a regular kernel, due to hardware quirks, we already exceed the 20 us=
ecs tolerance by a huge amount of more than 100 usecs, leading to a retry o=
f the measurement. And my tests showed that often the two succeeding retrie=
s also fail, because of hardware quirks can apparently create a blackout si=
tuation approaching 1 msec, so we lose anyway, regardless if we get preempt=
ed on a RT kernel or not. That&#39;s why enabling preemption on RT again du=
ring that for-loop should not make the situation worse and at least keep RT=
 as real-time as intended.</div><div><br></div><div>In practice I would als=
o expect that this failure case is the one least likely to impair userspace=
 applications greatly in practice. The cases that mostly matter are the one=
s executed during vblank hardware irq, where the for-loop never executes an=
d error margin and preempt off time is only about 1 usec. My own software w=
hich depends on very precise timestamps from the mechanism never reported &=
gt;&gt; 20 usecs errors during startup tests or runtime tests.</div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
- intel_crtc_scanlines_since_frame_timestamp() not sure how long this<br>
=C2=A0 may take in the worst case.<br>
<br></blockquote><div>=C2=A0</div><div>intel_crtc_scanlines_since_frame_tim=
estamp() should be harmless. That do-while loop just tries to make sure tha=
t two register reads that should happen within the same video refresh cycle=
 are happening in the same refresh cycle. As such, the while loop will almo=
st always just execute only once, and at most two times, so that&#39;s at m=
ost 6 mmio register reads for two loop iterations.</div><div><br></div><div=
>In the long run one could try to test if <span class=3D"gmail-n"><a href=
=3D"https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/__intel_get_crtc_sca=
nline_from_timestamp">__intel_get_crtc_scanline_from_timestamp</a>() wouldn=
&#39;t be the better choice for affected hardware always. Code and register=
 descriptions suggest the feature is supported by all potentially affected =
hardware, so if it would turn out that that method works as accurate and re=
liable as the old one, we could save the overhead and time delays for that =
100 for-loop iterations and make the whole timestamping more reliable on mo=
dern hw.<br></span></div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
It was in the RT queue for a while and nobody complained.<br>
Disable preemption on PREEPMPT_RT during timestamping.<br>
<br></blockquote><div><br></div><div>Do other patches exist to implement th=
e preempt_dis/enable() also for AMD and NVidia / nouveau / vc4? I left corr=
esponding markers for radeon/amdgpu-kms and RaspberryPi&#39;s vc4 driver. I=
deally all kms drivers which use scanout position queries should have such =
code. Always a preempt_disable() before the &quot;if (stime) *stime =3D kti=
me_get();&quot; statement, and a preempt_enable() after the &quot;if (etime=
) *etime =3D ktime_get();&quot; statement.</div><div><br></div><div>Checkin=
g Linux 5.16 code, this should be safe - short preempt off interval with on=
ly a few mmio register reads - for all kms drivers that support it atm. I f=
ound the following functions to modify:</div><div><br></div><div>amdgpu: am=
dgpu_display_get_crtc_scanoutpos()<br>radeon: radeon_get_crtc_scanoutpos()<=
br>msm: mdp5_crtc_get_scanout_position() and dpu_crtc_get_scanout_position(=
)<br>ltdc: ltdc_crtc_get_scanout_position()<br>vc4: vc4_crtc_get_scanout_po=
sition()<br></div><div><br></div><div>nouveau: In nvkm_head_mthd_scanoutpos=
(), one needs to put the preempt_disable() right before</div><div><pre><spa=
n class=3D"gmail-n"><a href=3D"https://elixir.bootlin.com/linux/v5.17-rc1/C=
/ident/args">args</a></span><span class=3D"gmail-o">-&gt;</span><span class=
=3D"gmail-n"><a href=3D"https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/=
v0">v0</a></span><span class=3D"gmail-p">.</span><span class=3D"gmail-n"><a=
 href=3D"https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/time">time</a><=
/span><span class=3D"gmail-p">[</span><span class=3D"gmail-mi">0</span><spa=
n class=3D"gmail-p">]</span> <span class=3D"gmail-o">=3D</span> <span class=
=3D"gmail-n"><a href=3D"https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/=
ktime_to_ns">ktime_to_ns</a></span><span class=3D"gmail-p">(</span><span cl=
ass=3D"gmail-n"><a href=3D"https://elixir.bootlin.com/linux/v5.17-rc1/C/ide=
nt/ktime_get">ktime_get</a></span><span class=3D"gmail-p">());<br></span></=
pre><pre><span class=3D"gmail-p">and the preempt_enable() right after<br><s=
pan class=3D"gmail-n"><a href=3D"https://elixir.bootlin.com/linux/v5.17-rc1=
/C/ident/args">args</a></span><span class=3D"gmail-o">-&gt;</span><span cla=
ss=3D"gmail-n"><a href=3D"https://elixir.bootlin.com/linux/v5.17-rc1/C/iden=
t/v0">v0</a></span><span class=3D"gmail-p">.</span><span class=3D"gmail-n">=
<a href=3D"https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/time">time</a=
></span><span class=3D"gmail-p">[</span><span class=3D"gmail-mi">1</span><s=
pan class=3D"gmail-p">]</span> <span class=3D"gmail-o">=3D</span> <span cla=
ss=3D"gmail-n"><a href=3D"https://elixir.bootlin.com/linux/v5.17-rc1/C/iden=
t/ktime_to_ns">ktime_to_ns</a></span><span class=3D"gmail-p">(</span><span =
class=3D"gmail-n"><a href=3D"https://elixir.bootlin.com/linux/v5.17-rc1/C/i=
dent/ktime_get">ktime_get</a></span><span class=3D"gmail-p">());<br></span>=
</span></pre></div><div><br></div><div>Is the plan to integrate these patch=
es into the mainline kernel soon, as part of ongoing preempt-rt upstreaming=
?<br></div><div><br></div><div>thanks,</div><div>-mario<br></div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
[bigeasy: patch description.]<br>
<br>
Cc: Mario Kleiner &lt;<a href=3D"mailto:mario.kleiner.de@gmail.com" target=
=3D"_blank">mario.kleiner.de@gmail.com</a>&gt;<br>
Signed-off-by: Mike Galbraith &lt;<a href=3D"mailto:umgwanakikbuti@gmail.co=
m" target=3D"_blank">umgwanakikbuti@gmail.com</a>&gt;<br>
Signed-off-by: Thomas Gleixner &lt;<a href=3D"mailto:tglx@linutronix.de" ta=
rget=3D"_blank">tglx@linutronix.de</a>&gt;<br>
Signed-off-by: Sebastian Andrzej Siewior &lt;<a href=3D"mailto:bigeasy@linu=
tronix.de" target=3D"_blank">bigeasy@linutronix.de</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/i915/i915_irq.c | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_ir=
q.c<br>
index 038a9ec563c10..8e9ff0bcbc7e4 100644<br>
--- a/drivers/gpu/drm/i915/i915_irq.c<br>
+++ b/drivers/gpu/drm/i915/i915_irq.c<br>
@@ -916,7 +916,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_=
crtc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock_irqsave(&amp;dev_priv-&gt;uncore.lock=
, irqflags);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* preempt_disable_rt() should go right here in=
 PREEMPT_RT patchset. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ENABLED(CONFIG_PREEMPT_RT))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0preempt_disable();<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Get optional system timestamp before query. =
*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (stime)<br>
@@ -980,7 +981,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_=
crtc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (etime)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *etime =3D ktime_ge=
t();<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* preempt_enable_rt() should go right here in =
PREEMPT_RT patchset. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ENABLED(CONFIG_PREEMPT_RT))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0preempt_enable();<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock_irqrestore(&amp;dev_priv-&gt;uncore=
.lock, irqflags);<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000ecd74505d68493f8--
