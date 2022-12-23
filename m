Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20BB6551F4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 16:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F03B10E1B5;
	Fri, 23 Dec 2022 15:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7F910E1B5;
 Fri, 23 Dec 2022 15:13:01 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id e6so2513055qkl.4;
 Fri, 23 Dec 2022 07:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uA5x2kLHUTXtcmFQoZp7+FQTzRTP8Ad/SAVeAv6jmE0=;
 b=XyugXgsL5uVfIhGhudHO7zKPeb1Be+jNcazGtdq23H/9TaIOosV0qv7xotuMDLzu/7
 +Cqw1GAI3c0rvNY4wu78YGTV6stTnUZWo+nDs+MxMzunWewJE0eJ+crmHAj0/MatHhYv
 bv6zVeVCdVTCq+gbv3DR1jmqgVQfNTeRl+gwyn04vX60LCa55QvVTdbA0PiWCKjNF+Vv
 RizyoxbbfBDKbORjn0ISyOgXuP+eOKrcrKNy6rRFs1tHEomUSgHNY749J1/iFIDgZaCs
 /qmIBWRyh9hWd23CjT63b9hbUNvRnpVe/tCW7Vc9VjRz0TVjx17abaL0Z1FpLHHU5qEI
 uK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uA5x2kLHUTXtcmFQoZp7+FQTzRTP8Ad/SAVeAv6jmE0=;
 b=ompSdznGSm+bicBxBvD380HE+OzkNstU0vkFSE3i0TzYF7lNprEy/F+Q838pf+hY42
 8GJt5+cZg0WGIXL4E659G9McQIoAsVmKgJjozDZySbZk3ET2AZx6Q1pl5bOVVN94I1dS
 +/4L84S7aINcajG5k3YhBrcfebMoVfFpFFvKaROZHjhTz4BKkSEbx8bPQdDtPeWiw+wi
 qU1qTeNeO9DF2ScV94SK6HB3VZ/m7WxN3Wy+6n1qD5sEo7vPXq04Sc0CfC0qX0autOKu
 SjxZsTiZ2JLpDwrZnFO4mC6AhgdzGkP3NQI3khvlkacndYHY6p7s3iAqvJuP3kt4ju4D
 6MlQ==
X-Gm-Message-State: AFqh2kovJW0vHkiTrDqzn4FoROz/yEn4lMUJJdHRTNWmmnpGTp/0lkmp
 SNcVOjc0RuAe8WGz9Bd1wzqcsQy9bUztmpQ0reCGnDdM
X-Google-Smtp-Source: AMrXdXvMTnWLRho3Zk66KTVEYqqgozIB5+/5HVGhKEjW9kXzsrPK5MZPvpxn7AetDLpM5xF9i0vJMEaTHkggrZ6fU1s=
X-Received: by 2002:a05:620a:2103:b0:6fc:ae10:af93 with SMTP id
 l3-20020a05620a210300b006fcae10af93mr495551qkl.22.1671808380622; Fri, 23 Dec
 2022 07:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20220825064701.768595-1-maarten.lankhorst@linux.intel.com>
 <3ec4e382c67ff7d8a1eb05e27b0fbf5fd1e272c6.camel@intel.com>
 <a6cdde0b-47a1-967d-f2c4-9299618cb1fb@linux.intel.com>
In-Reply-To: <a6cdde0b-47a1-967d-f2c4-9299618cb1fb@linux.intel.com>
From: Rodrigo Vivi <rodrigo.vivi@gmail.com>
Date: Fri, 23 Dec 2022 10:12:48 -0500
Message-ID: <CABVU7+sowdqODt1zvoyEK8fjtNQiKmOHt=LhUVDbD+Hok=0Gzw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/2] drm/i915: Remove frontbuffer tracking
 from gem.
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000a8dd6b05f0803814"
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000a8dd6b05f0803814
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 2, 2022 at 4:17 AM Tvrtko Ursulin <
tvrtko.ursulin@linux.intel.com> wrote:

For some reason I has missed this. Thanks Tvrtko for pointing this out.


> On 01/12/2022 22:03, Zanoni, Paulo R wrote:
> > Hi
> >
> > I was given a link to https://patchwork.freedesktop.org/series/111494/
> > but can't seem to find it on the mailing list, so I'll reply here.
> >
> > On Thu, 2022-08-25 at 08:46 +0200, Maarten Lankhorst wrote:
> >> Frontbuffer tracking in gem is used in old drivers, but nowadays
> everyone
> >> calls dirtyfb explicitly. Remove frontbuffer tracking from gem, and
> >> isolate it to display only.
> >
> > Ok, but then how can the Kernel know if the user space running is an
> > "old driver" or a new one? Assuming everybody is following the new
> > policy is at least risky.
>

Agree. This is a very old problem. That won't go away simply.


> >
> > (crazy idea: have an ioctl for user space to tell whether it knows how
> > to DirtyFB and another where it can even say it will never be touching
> > frontbuffers at all)
>

To be honest we had this "crazy" idea back there. But we thought that the
frontbuffer tracking would be easiest than new api...
We were wrong... and we probably need this now if we want to remove the
frontbuffer tracking.



> >
> > Also, when I wrote igt/kms_frontbuffer_tracking, it was agreed that
> > whatever was there was a representation of the "rules" of the
> > frontbfuffer writing contract/API. And I see on the link above that the
> > basic tests of kms_frontbuffer_tracking fail. If
> > kms_frontbuffer_tracking requires change due to i915.ko having changed
> > the frontbuffer writing rules, then we should do it, and possibly have
> > those rules written somewhere.
> >
> > But then, having the Kernel change expectations like that is not
> > exactly what I learned we should be doing, because it's the recipe to
> > break user space.
> >
> > I'm confused, please clarify us a little more. More sentences in the
> > commit messages would be absolutely great.
>
> Right, +1 - we need to be sure there aren't some binaries, running in a
> distro somewhere, or whatever, which rely on this and then we are not
> allowed to break them. As minimum at least we need an audit and versions
> to know how old libraries/programs we are talking about here ie. when
> did everyone stop relying on implicit tracking.
>
> Regards,
>
> Tvrtko
>

--000000000000a8dd6b05f0803814
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br><br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 2, 2022 at 4:17 AM Tv=
rtko Ursulin &lt;<a href=3D"mailto:tvrtko.ursulin@linux.intel.com">tvrtko.u=
rsulin@linux.intel.com</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gm=
ail_attr"><br></div><div class=3D"gmail_attr">For some reason I has missed =
this. Thanks Tvrtko for pointing this out.</div><div class=3D"gmail_attr"><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 01/12/2022 22:03, Zanoni, Paulo R wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; I was given a link to <a href=3D"https://patchwork.freedesktop.org/ser=
ies/111494/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.freedes=
ktop.org/series/111494/</a><br>
&gt; but can&#39;t seem to find it on the mailing list, so I&#39;ll reply h=
ere.<br>
&gt; <br>
&gt; On Thu, 2022-08-25 at 08:46 +0200, Maarten Lankhorst wrote:<br>
&gt;&gt; Frontbuffer tracking in gem is used in old drivers, but nowadays e=
veryone<br>
&gt;&gt; calls dirtyfb explicitly. Remove frontbuffer tracking from gem, an=
d<br>
&gt;&gt; isolate it to display only.<br>
&gt; <br>
&gt; Ok, but then how can the Kernel know if the user space running is an<b=
r>
&gt; &quot;old driver&quot; or a new one? Assuming everybody is following t=
he new<br>
&gt; policy is at least risky.<br></blockquote><div><br></div><div>Agree. T=
his is a very old problem. That won&#39;t go away simply.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; (crazy idea: have an ioctl for user space to tell whether it knows how=
<br>
&gt; to DirtyFB and another where it can even say it will never be touching=
<br>
&gt; frontbuffers at all)<br></blockquote><div><br></div><div>To be honest =
we had this &quot;crazy&quot; idea back there. But we thought that the</div=
><div>frontbuffer tracking would be easiest than new api...</div><div>We we=
re wrong... and we probably need this now if we want to remove the</div><di=
v>frontbuffer tracking.</div><div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Also, when I wrote igt/kms_frontbuffer_tracking, it was agreed that<br=
>
&gt; whatever was there was a representation of the &quot;rules&quot; of th=
e<br>
&gt; frontbfuffer writing contract/API. And I see on the link above that th=
e<br>
&gt; basic tests of kms_frontbuffer_tracking fail. If<br>
&gt; kms_frontbuffer_tracking requires change due to i915.ko having changed=
<br>
&gt; the frontbuffer writing rules, then we should do it, and possibly have=
<br>
&gt; those rules written somewhere.<br>
&gt; <br>
&gt; But then, having the Kernel change expectations like that is not<br>
&gt; exactly what I learned we should be doing, because it&#39;s the recipe=
 to<br>
&gt; break user space.<br>
&gt; <br>
&gt; I&#39;m confused, please clarify us a little more. More sentences in t=
he<br>
&gt; commit messages would be absolutely great.<br>
<br>
Right, +1 - we need to be sure there aren&#39;t some binaries, running in a=
 <br>
distro somewhere, or whatever, which rely on this and then we are not <br>
allowed to break them. As minimum at least we need an audit and versions <b=
r>
to know how old libraries/programs we are talking about here ie. when <br>
did everyone stop relying on implicit tracking.<br>
<br>
Regards,<br>
<br>
Tvrtko<br>
</blockquote></div></div>

--000000000000a8dd6b05f0803814--
