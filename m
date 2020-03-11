Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6541825ED
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 00:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09488895D7;
	Wed, 11 Mar 2020 23:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEB8895D7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 23:36:30 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c20so3234971lfb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 16:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YKKTGMGuC7csysaHUesEZogJs7wnfht4eIuQDMWN8RY=;
 b=m1Rot4bztTgh2wPUxiSW/rqn0jSM0lhavj6u4hAqIl77E3iaCQG/e/kkCksb97Xhqf
 1XvpZHOinpeFWhukb5Adv4V5rnhXTaZKAEZgKjtNi7QxGpGkMQfFlPyPYPjCnfzfBbDK
 UjwFxBhd/Kfd1uCnOa2tBMdTUhBtRSeoSqJq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YKKTGMGuC7csysaHUesEZogJs7wnfht4eIuQDMWN8RY=;
 b=TKt3WlnWuXObHp3BT45RPw/OR0zO8LgKCWiWYuQuqD+4XHTLxyHdNXrKHGti0yW1x+
 +JVahOjSzGsSEoOqRNngqaY+XCil89ecu7guvH1MWLnSG0FdOPBJZWb91k3gj3OzOGix
 m11XHz8EUcy4rK6XCzrBUJkZpc7TunKzN3/YQp8v+WJiXz1TzkjTyT9jM6zZeSoc8G6v
 L685EraTyuC+vXDJlJxFyTFxoZjs7sLr2a3PeUDrKliBaicuNWtCuAR3XFWlVNE3a+2G
 +ZCLdWfTEXSAC7uW6QRQf2J1Rv9gAOXS/sIQ+50d/EQkhTYrbQC9NCumqRkmsE8TAZ7o
 fwYA==
X-Gm-Message-State: ANhLgQ2hUOUjyfhO3iUHSrT94uMgnIwT+3zbI3/By47CeFsF4NheLROk
 YX00/De05P0VjdXV1gswWJrYp6/V694=
X-Google-Smtp-Source: ADFU+vvHlxa7MydcZmTMbkhzmZpvDyuq3cyQGI9RPzakB2jn+OQx9IABTbi5tKNksTs3z+kxklRpFg==
X-Received: by 2002:a19:cbc3:: with SMTP id b186mr3572714lfg.182.1583969788184; 
 Wed, 11 Mar 2020 16:36:28 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id o26sm21874994ljg.33.2020.03.11.16.36.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2020 16:36:27 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id d23so4264233ljg.13
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 16:36:27 -0700 (PDT)
X-Received: by 2002:a05:651c:1026:: with SMTP id
 w6mr3295587ljm.168.1583969787038; 
 Wed, 11 Mar 2020 16:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200310010818.569-1-gurchetansingh@chromium.org>
 <20200310074302.yx6anlvqvsg37yzs@sirius.home.kraxel.org>
 <CAAfnVB=sw=u80mHnZUPf_+WDW-hGNTDSBWLfV+7y3KFN=s6beQ@mail.gmail.com>
 <20200311103609.ei446gelkvbqrdzm@sirius.home.kraxel.org>
In-Reply-To: <20200311103609.ei446gelkvbqrdzm@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 11 Mar 2020 16:36:16 -0700
X-Gmail-Original-Message-ID: <CAAfnVBm1eoGZY7yB8eqEC1eLk=v4dq--O2biQOnWDHCkmguOeA@mail.gmail.com>
Message-ID: <CAAfnVBm1eoGZY7yB8eqEC1eLk=v4dq--O2biQOnWDHCkmguOeA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] *** Per context fencing ***
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: Chad Versace <chadversary@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 John Bates <jbates@chromium.org>
Content-Type: multipart/mixed; boundary="===============1000791270=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1000791270==
Content-Type: multipart/alternative; boundary="0000000000007e257305a09cb425"

--0000000000007e257305a09cb425
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 11, 2020 at 3:36 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > I should've been more clear -- this is an internal cleanup/preparation
> and
> > the per-context changes are invisible to host userspace.
>
> Ok, it wasn't clear that you don't flip the switch yet.  In general the
> commit messages could be a bit more verbose ...
>
> I'm wondering though why we need the new fence_id in the first place.
> Isn't it enough to have per-context (instead of global) last_seq?
>

Heh, that was to leave open the possibility of multiple timelines per
context.  Roughly speaking,

V2 -- multiple processes
V3 -- multiple processes and multiple threads (due to VK multi-threaded
command buffers)

I think we all agree on V2.  It seems we still have to discuss V3
(multi-queue, thread pools, a fence context associated with each thread) a
bit more before we start landing pieces.


> > Multi-queue sounds very interesting indeed, especially with VK
> > multi-threaded command submission.  That to me is V3 rather than V2..
> let's
> > start easy!
>
> Having v2 if we plan to obsolete it with v3 soon doesn't look like a
> good plan to me.  It'll make backward compatibility more complex for
> no good reason ...
>
> Also: Does virglrenderer render different contexts in parallel today?
> Only in case it does we'll actually get benefits from per-context
> fences.  But I think it doesn't, so there is no need to rush.
>
> I think we should better have a rough plan for parallel rendering first,
> then go start implementing the pieces needed.
>
> cheers,
>   Gerd
>
>

--0000000000007e257305a09cb425
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 11, 2020 at 3:36 AM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 H=
i,<br>
<br>
&gt; I should&#39;ve been more clear -- this is an internal cleanup/prepara=
tion and<br>
&gt; the per-context changes are invisible to host userspace.<br>
<br>
Ok, it wasn&#39;t clear that you don&#39;t flip the switch yet.=C2=A0 In ge=
neral the<br>
commit messages could be a bit more verbose ...<br>
<br>
I&#39;m wondering though why we need the new fence_id in the first place.<b=
r>
Isn&#39;t it enough to have per-context (instead of global) last_seq?<br></=
blockquote><div><br></div><div>Heh, that was to leave open the possibility =
of multiple timelines per context.=C2=A0 Roughly speaking,</div><div><br></=
div><div>V2 -- multiple processes</div><div>V3 -- multiple processes and mu=
ltiple threads (due to VK multi-threaded command buffers)</div><div><br></d=
iv><div>I think we all agree on V2.=C2=A0 It seems we still=C2=A0have to di=
scuss V3 (multi-queue, thread pools, a fence context associated with each t=
hread) a bit more before we start landing pieces.=C2=A0</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Multi-queue sounds very interesting indeed, especially with VK<br>
&gt; multi-threaded command submission.=C2=A0 That to me is V3 rather than =
V2.. let&#39;s<br>
&gt; start easy!<br>
<br>
Having v2 if we plan to obsolete it with v3 soon doesn&#39;t look like a<br=
>
good plan to me.=C2=A0 It&#39;ll make backward compatibility more complex f=
or<br>
no good reason ...<br>
<br>
Also: Does virglrenderer render different contexts in parallel today?<br>
Only in case it does we&#39;ll actually get benefits from per-context<br>
fences.=C2=A0 But I think it doesn&#39;t, so there is no need to rush.<br>
<br>
I think we should better have a rough plan for parallel rendering first,<br=
>
then go start implementing the pieces needed.<br>
<br>
cheers,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div></div>

--0000000000007e257305a09cb425--

--===============1000791270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1000791270==--
