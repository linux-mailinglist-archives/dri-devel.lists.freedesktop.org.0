Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC147FE97
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 18:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBBD6EED5;
	Fri,  2 Aug 2019 16:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54876EED5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 16:28:37 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k21so72931756edq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 09:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B4r9/nQF2R/dIE9dpfSSCgGE3NJm4gxNES6ALw1i6YA=;
 b=pkgoVp/OqzqpVxKnZdJ3uZb46q/rh0iGWwcpfLGTJm1JGhfaE09qMGkIPEf64FGi0x
 76Zws+qX8kh1wcecpu+hUKR1KUM/+tAty3U0rVonluQ//zUNDJjCeIRbosmIxdIoaep/
 +byVrV5w8ShxYWTjQ8gy1jEjw+g0KFBzSZMGASvu1PwaFLJCuHq4jKsHT/KHRFfYEBub
 0y3PVI3ubHz6fzecbff92nzz/G+KAfHbCStLwwLJWJkKPxErhvVkTTs+QmaJEN4jMCVB
 0rQkWBDftIKqQMt5emp6X/Z6vPlpqHIPq6i79UXrfBVMZLX1UEca0d8R5kVx4oQAo//4
 vvRw==
X-Gm-Message-State: APjAAAVZ52FTl6FDqsR5f/WX45eSuVuq1cJYzdF7Va60gRTJ87gB+AGc
 ZyXTpzQT0oeH4nR8WozTxcEwFaOWPEuc5acAEC8=
X-Google-Smtp-Source: APXvYqxyd6qgEzT+5HY7uUBZG8kNI22vrha87G64WS+7yAyz4zxED2JdwGddJIkPt6/iDJ/SkgYeoI2jDq+BghnBSJk=
X-Received: by 2002:a50:95a1:: with SMTP id
 w30mr120826060eda.177.1564763316190; 
 Fri, 02 Aug 2019 09:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190729082039.23837-1-david1.zhou@amd.com>
 <9c4f887f-b561-f751-cdcf-d773a9fd7e91@intel.com>
 <f67940b4-82a9-987e-1fb7-6960bd93426a@amd.com>
In-Reply-To: <f67940b4-82a9-987e-1fb7-6960bd93426a@amd.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 2 Aug 2019 11:28:25 -0500
Message-ID: <CAOFGe96z7y6KYY9-xwbsgx8h-CaFk45w-YveS_nSY7bBOwwoBw@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: remove boring message
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=B4r9/nQF2R/dIE9dpfSSCgGE3NJm4gxNES6ALw1i6YA=;
 b=bmLQci0ioCFsgLrVGPKylsnv5+sR7O5v81fe2P66vzGYPTlYrKZpDFuszSPJBHN5aq
 2JXIUdbtKC2fl7P9lKXtH3cKy8mkcWwDZF6U/KurM+6e4fu3xFDLQOfF3ZB3QIpz+a9+
 y5YyQDQB5g3gRe84ua3+YntJ/DJZBlZZRmlws8XOIPHa7btS8bAiMCWHr//YCK3A6MfH
 9XWc+wOzs66lxP2lwShL80mLNYVbte/8sXuC6jxyqCwMTiOFbwFb3cYi4RQxXlJZe8SG
 WBnIVz9pdzH1v0zD/234VWar30Hf0q3GNDZVJaFIcVfwG/pq2mepfze2rh3S8ZvEk8uM
 Nzdw==
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
Content-Type: multipart/mixed; boundary="===============1688523817=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1688523817==
Content-Type: multipart/alternative; boundary="0000000000009e95ab058f24d971"

--0000000000009e95ab058f24d971
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 1, 2019 at 9:05 AM Koenig, Christian <Christian.Koenig@amd.com>
wrote:

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

So if process A signals 7, process B detects that and signals 3 and then
process A tries to insert something which waits on 7 and signals 8, what
happens?  My understanding is that it "breaks" the timeline and so, from
the perspective of process A, its signal operation on 7 is gone and it's
attempt to wait on 7 will either -EINVAL because the kernel can't find the
time point or else just sit there.  Am I understanding this correctly?  If
so, it sounds more like an attack vector than defensive programming to me.

Yes, more syncornization is generally better than less.  However, if you're
screwing up your syncronization from userspace and getting wrong rendering
results, that's your fault.  If you're causing your compositor to suddenly
start seeing -EINVAL which gets turned into VK_ERROR_DEVICE_LOST, that's a
lot worse IMO.  I'm not saying that we shouldn't try to be robust in this
case; I'm just concerned that the suggest solution isn't.

--Jason



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

--0000000000009e95ab058f24d971
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Aug 1, 2019 at 9:05 AM Koenig, Christian &lt;<a href=3D"mail=
to:Christian.Koenig@amd.com">Christian.Koenig@amd.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Am 01.08.19 um 15:45 s=
chrieb Lionel Landwerlin:<br>
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
consequences.<br></blockquote><div><br></div><div>So if process A signals 7=
, process B detects that and signals 3 and then process A tries to insert s=
omething which waits on 7 and signals 8, what happens?=C2=A0 My understandi=
ng is that it &quot;breaks&quot; the timeline and so, from the perspective =
of process A, its signal operation on 7 is gone and it&#39;s attempt to wai=
t on 7 will either -EINVAL because the kernel can&#39;t find the time point=
 or else just sit there.=C2=A0 Am I understanding this correctly?=C2=A0 If =
so, it sounds more like an attack vector than defensive programming to me.<=
/div><div><br></div><div>Yes, more syncornization is generally better than =
less.=C2=A0 However, if you&#39;re screwing up your syncronization from use=
rspace and getting wrong rendering results, that&#39;s your fault.=C2=A0 If=
 you&#39;re causing your compositor to suddenly start seeing -EINVAL which =
gets turned into VK_ERROR_DEVICE_LOST, that&#39;s a lot worse IMO.=C2=A0 I&=
#39;m not saying that we shouldn&#39;t try to be robust in this case; I&#39=
;m just concerned that the suggest solution isn&#39;t.</div><div><br></div>=
<div>--Jason</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
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
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listin=
fo/dri-devel</a></blockquote></div></div>

--0000000000009e95ab058f24d971--

--===============1688523817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1688523817==--
