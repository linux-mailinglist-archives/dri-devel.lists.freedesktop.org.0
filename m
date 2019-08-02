Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D60FC7FFD2
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 19:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B716EF2C;
	Fri,  2 Aug 2019 17:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5776EF2C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 17:44:19 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k21so73179873edq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 10:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sgDiEYDdiJFuDcTB6oDSpYwUH0fT/mw8JrnKtQzx9tQ=;
 b=dr7/URsQceLJCEcCAqx7gi5Px+E141rUYEiXm7dRuR98uzbONQOGLcs6xDuETD+pj3
 3n7s2ZnQZeEVuTufhgq2pIt8UY2le7ErKzpJzuTQsx82QCe2SronW47Ff+R0wFRK9oPC
 GfUTAJgzX0FdKBnYiVUgaiCLI7c3e/u6qF4BHZFjkFBZP4YvPYUVxxd7T/aqghHzUofw
 C3dWRnT5n91Ml3SORi7rlFK6jMqGpfOwhEATBANS7pQ89tHkZMa0CEv3dd5om0KeumXv
 ODMg4kzjC2onzuswkzuYHE+XwwE3T80d+0UlWa7dN6LA0UFzJmCEVvi9Kdynlaq5uXac
 Fklg==
X-Gm-Message-State: APjAAAXkTHqgbdjtDQsSmSkwM/n+LCCCeaZY+2gjmmYV4iz+Xv+bpDly
 DzcYQTZ8/dIUTYUcCqJ8MZ5or+f9A1nVIuFyrz0=
X-Google-Smtp-Source: APXvYqz9kbi0qpQeNHQWT+mHgVwMEV0DkWGs0GbJ4SC8+Vb+5VayO6SUN2bWiKDP7T1/Q6TjIdUSJtT0dLQcQpcAHGk=
X-Received: by 2002:a50:95a1:: with SMTP id
 w30mr121209168eda.177.1564767858372; 
 Fri, 02 Aug 2019 10:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <9829813e-dccd-4f66-a953-03c22e89fc2a@email.android.com>
In-Reply-To: <9829813e-dccd-4f66-a953-03c22e89fc2a@email.android.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 2 Aug 2019 12:44:06 -0500
Message-ID: <CAOFGe96RTcohfJq3Z1nXQ9CkHznAW5DuWj0i7tEjt_xp5nzH-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: remove boring message
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=sgDiEYDdiJFuDcTB6oDSpYwUH0fT/mw8JrnKtQzx9tQ=;
 b=YEDqd6kH09el+PtoDQrKOnkzYWI0ZPAI7hiup3MpKu4RZl/ZJnxMQRzADwHfAai4V7
 zaxC7pSR7ROgeWhDp/Ew9j0teea/uinVYHjuEEHW154wPcRct2kGOFGu1o9saIc8UIlC
 H0reZ4G5XKF3IdQ7FjInfTOZSkeOLr6NbXVtQ1g1heAyBB16xAb3Qmj2TW0OnJPCdu0K
 HsYT/ynbR+HLfWULvlLcggoW//L0+czI5NxdqBdMsg8cRQzE/ZgZCRbiH/XXUFQUgJqn
 8yaL3o5Sy3EhYxjrOqsphGxinEMoy4X/qC9zHProiWgoadi5Psu56U5NaMJ0qhyjPkmJ
 0U9A==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0277945343=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0277945343==
Content-Type: multipart/alternative; boundary="0000000000005ac33e058f25e8de"

--0000000000005ac33e058f25e8de
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 2, 2019 at 12:33 PM Koenig, Christian <Christian.Koenig@amd.com>
wrote:

>
>
> Am 02.08.2019 18:28 schrieb Jason Ekstrand <jason@jlekstrand.net>:
>
> On Thu, Aug 1, 2019 at 9:05 AM Koenig, Christian <Christian.Koenig@amd.com>
> wrote:
>
> Am 01.08.19 um 15:45 schrieb Lionel Landwerlin:
> > Just had a few exchanges with Chris about this.
> > Chris suggests that if we're about to add a point to the timeline in
> > an unordered fashion, actually better not add it at all.
> >
> > What's your take on this?
>
> That is a clear NAK. See not adding a point at all means we lose some
> synchronization and that is not something we can do here.
>
> In other words syncing to much if userspace does something nasty is ok
> and defensive programmed, but not syncing at all could have unforeseen
> consequences.
>
>
> So if process A signals 7, process B detects that and signals 3 and then
> process A tries to insert something which waits on 7 and signals 8, what
> happens?  My understanding is that it "breaks" the timeline and so, from
> the perspective of process A, its signal operation on 7 is gone and it's
> attempt to wait on 7 will either -EINVAL because the kernel can't find the
> time point or else just sit there.  Am I understanding this correctly?
>
>
> Nope, what happens is that we note the largest signaled seqno and wait for
> everything without returning an error.
>
> For example if we have signaled 7 and then 3 then any waiting for 7 we
> would wait for both 3 and 7.
>

Ok, that's reasonable behavior.  I'm sorry, I'm a bit behind on the
implementation details right now and just had a scarry conversation on
IRC.  If what you are describing is accurate, we should be ok.  We should
also make sure that we have IGT tests which ensure this. :-)

FYI, at Lionel and Daniel's request, I just sent out a patch which adds
better design docs for the current sync file (assuming people think they're
actually better).  We should review and land that and then someone should
extend it for the timeline stuff and ensure that all these behaviors are
well-documented.

--Jason



>   If so, it sounds more like an attack vector than defensive programming
> to me.
>
>
> Yeah, completely agree. That's why I also rejected the idea to return an
> error on wait.
>
>
> Yes, more syncornization is generally better than less.  However, if
> you're screwing up your syncronization from userspace and getting wrong
> rendering results, that's your fault.  If you're causing your compositor to
> suddenly start seeing -EINVAL which gets turned into VK_ERROR_DEVICE_LOST,
> that's a lot worse IMO.  I'm not saying that we shouldn't try to be robust
> in this case; I'm just concerned that the suggest solution isn't.
>
>
> Completely agree as well.
>
> The key point is we need to find a balance between keeping things working
> and signaling that something is wrong.
>
> I mean the two options we have is to either ignore such errors and do the
> most defensive thing we can. And the current solution is already pretty
> good at that.
>
> Or we can signal those errors but risk that it can be used for a deny of
> service.
>
> Regards,
> Christian.
>
>
> --Jason
>
>
>
> Another idea would be to add the fence, but also set an error flag and
> deny any further signaling on that syncobj.
>
> Regards,
> Christian.
>
> > I'm fine with this, but rather than add another variant of add_point()
> > maybe we change change the existing.
> >
> > Thanks,
> >
> > -Lionel
> >
> > On 29/07/2019 11:20, Chunming Zhou wrote:
> >> It is normal that binary syncobj replaces the underlying fence.
> >>
> >> Signed-off-by: Chunming Zhou <david1.zhou@amd.com>
> >> ---
> >>   drivers/gpu/drm/drm_syncobj.c | 3 ---
> >>   1 file changed, 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_syncobj.c
> >> b/drivers/gpu/drm/drm_syncobj.c
> >> index 929f7c64f9a2..bc7ec1679e4d 100644
> >> --- a/drivers/gpu/drm/drm_syncobj.c
> >> +++ b/drivers/gpu/drm/drm_syncobj.c
> >> @@ -151,9 +151,6 @@ void drm_syncobj_add_point(struct drm_syncobj
> >> *syncobj,
> >>       spin_lock(&syncobj->lock);
> >>         prev = drm_syncobj_fence_get(syncobj);
> >> -    /* You are adding an unorder point to timeline, which could
> >> cause payload returned from query_ioctl is 0! */
> >> -    if (prev && prev->seqno >= point)
> >> -        DRM_ERROR("You are adding an unorder point to timeline!\n");
> >>       dma_fence_chain_init(chain, prev, fence, point);
> >>       rcu_assign_pointer(syncobj->fence, &chain->base);
> >
> >
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>

--0000000000005ac33e058f25e8de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, Aug 2, 2019 at 12:33 PM Koenig, Christian &lt;<a href=3D"mai=
lto:Christian.Koenig@amd.com">Christian.Koenig@amd.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">



<div>
<div dir=3D"auto">
<div><br>
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">Am 02.08.2019 18:28 schrieb Jason Ekstrand &lt;<=
a href=3D"mailto:jason@jlekstrand.net" target=3D"_blank">jason@jlekstrand.n=
et</a>&gt;:<br type=3D"attribution">
<blockquote class=3D"gmail-m_7174754395707697351quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<div>
<div dir=3D"ltr">
<div class=3D"gmail-m_7174754395707697351elided-text">
<div dir=3D"ltr">On Thu, Aug 1, 2019 at 9:05 AM Koenig, Christian &lt;<a hr=
ef=3D"mailto:Christian.Koenig@amd.com" target=3D"_blank">Christian.Koenig@a=
md.com</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Am 01.08.19 um 15:45 schrieb Lionel Landwerlin:<br>
&gt; Just had a few exchanges with Chris about this.<br>
&gt; Chris suggests that if we&#39;re about to add a point to the timeline =
in <br>
&gt; an unordered fashion, actually better not add it at all.<br>
&gt;<br>
&gt; What&#39;s your take on this?<br>
<br>
That is a clear NAK. See not adding a point at all means we lose some <br>
synchronization and that is not something we can do here.<br>
<br>
In other words syncing to much if userspace does something nasty is ok <br>
and defensive programmed, but not syncing at all could have unforeseen <br>
consequences.<br>
</blockquote>
<div><br>
</div>
<div>So if process A signals 7, process B detects that and signals 3 and th=
en process A tries to insert something which waits on 7 and signals 8, what=
 happens?=C2=A0 My understanding is that it &quot;breaks&quot; the timeline=
 and so, from the perspective of process A, its
 signal operation on 7 is gone and it&#39;s attempt to wait on 7 will eithe=
r -EINVAL because the kernel can&#39;t find the time point or else just sit=
 there.=C2=A0 Am I understanding this correctly?</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Nope, what happens is that we note the largest signaled s=
eqno and wait for everything without returning an error.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><span style=3D"font-family:sans-serif">For example if we =
have signaled 7 and then 3 then any waiting for 7 we would wait for both 3 =
and 7.</span><br>
</div>
</div></div></blockquote><div><br></div><div>Ok, that&#39;s reasonable beha=
vior.=C2=A0 I&#39;m sorry, I&#39;m a bit behind on the implementation detai=
ls right now and just had a scarry conversation on IRC.=C2=A0 If what you a=
re describing is accurate, we should be ok.=C2=A0 We should also make sure =
that we have IGT tests which ensure this. :-)</div><div><br></div><div>FYI,=
 at Lionel and Daniel&#39;s request, I just sent out a patch which adds bet=
ter design docs for the current sync file (assuming people think they&#39;r=
e actually better).=C2=A0 We should review and land that and then someone s=
hould extend it for the timeline stuff and ensure that all these behaviors =
are well-documented.</div><div><br></div><div>--Jason</div><div><br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div=
 dir=3D"auto">
<div dir=3D"auto">
<div class=3D"gmail_extra">
<div class=3D"gmail_quote">
<blockquote class=3D"gmail-m_7174754395707697351quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<div>
<div dir=3D"ltr">
<div class=3D"gmail-m_7174754395707697351elided-text">
<div>=C2=A0 If so, it sounds more like an attack vector than defensive prog=
ramming to me.</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Yeah, completely agree. That&#39;s why I also rejected th=
e idea to return an error on wait.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">
<div class=3D"gmail_extra">
<div class=3D"gmail_quote">
<blockquote class=3D"gmail-m_7174754395707697351quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<div>
<div dir=3D"ltr">
<div class=3D"gmail-m_7174754395707697351elided-text">
<div><br>
</div>
<div>Yes, more syncornization is generally better than less.=C2=A0 However,=
 if you&#39;re screwing up your syncronization from userspace and getting w=
rong rendering results, that&#39;s your fault.=C2=A0 If you&#39;re causing =
your compositor to suddenly start seeing -EINVAL which
 gets turned into VK_ERROR_DEVICE_LOST, that&#39;s a lot worse IMO.=C2=A0 I=
&#39;m not saying that we shouldn&#39;t try to be robust in this case; I&#3=
9;m just concerned that the suggest solution isn&#39;t.</div>
<div></div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Completely agree as well.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">The key point is we need to find a balance between keepin=
g things working and signaling that something is wrong.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">I mean the two options we have is to either ignore such e=
rrors and do the most defensive thing we can. And the current solution is a=
lready pretty good at that.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Or we can signal those errors but risk that it can be use=
d for a deny of service.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Regards,</div>
<div dir=3D"auto">Christian.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">
<div class=3D"gmail_extra">
<div class=3D"gmail_quote">
<blockquote class=3D"gmail-m_7174754395707697351quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<div>
<div dir=3D"ltr">
<div class=3D"gmail-m_7174754395707697351elided-text">
<div><br>
</div>
<div>--Jason</div>
<div><br>
</div>
<div>=C2=A0</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Another idea would be to add the fence, but also set an error flag and <br>
deny any further signaling on that syncobj.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt; I&#39;m fine with this, but rather than add another variant of add_poi=
nt() <br>
&gt; maybe we change change the existing.<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; -Lionel<br>
&gt;<br>
&gt; On 29/07/2019 11:20, Chunming Zhou wrote:<br>
&gt;&gt; It is normal that binary syncobj replaces the underlying fence.<br=
>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Chunming Zhou &lt;<a href=3D"mailto:david1.zhou@amd=
.com" target=3D"_blank">david1.zhou@amd.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 drivers/gpu/drm/drm_syncobj.c | 3 ---<br>
&gt;&gt; =C2=A0 1 file changed, 3 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/drm_syncobj.c <br>
&gt;&gt; b/drivers/gpu/drm/drm_syncobj.c<br>
&gt;&gt; index 929f7c64f9a2..bc7ec1679e4d 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/drm_syncobj.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/drm_syncobj.c<br>
&gt;&gt; @@ -151,9 +151,6 @@ void drm_syncobj_add_point(struct drm_syncobj =
<br>
&gt;&gt; *syncobj,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&amp;syncobj-&gt;lock);<b=
r>
&gt;&gt; =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prev =3D drm_syncobj_fence_g=
et(syncobj);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 /* You are adding an unorder point to timeline=
, which could <br>
&gt;&gt; cause payload returned from query_ioctl is 0! */<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 if (prev &amp;&amp; prev-&gt;seqno &gt;=3D poi=
nt)<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_ERROR(&quot;You ar=
e adding an unorder point to timeline!\n&quot;);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_chain_init(chain, prev, f=
ence, point);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcu_assign_pointer(syncobj-&gt;fenc=
e, &amp;chain-&gt;base);<br>
&gt;<br>
&gt;<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-de=
vel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a></b=
lockquote>
</div>
</div>
</div>
</blockquote>
</div>
<br>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--0000000000005ac33e058f25e8de--

--===============0277945343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0277945343==--
