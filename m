Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C14EA3679E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 22:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356F410E077;
	Fri, 14 Feb 2025 21:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fireburn-co-uk.20230601.gappssmtp.com header.i=@fireburn-co-uk.20230601.gappssmtp.com header.b="3dU1jbHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBA110E077
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 21:38:27 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2fbf77b2b64so4627663a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 13:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20230601.gappssmtp.com; s=20230601; t=1739569107; x=1740173907;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7yTRDZMrkOhvbJQIYtlRQpYDM+YNIVDprdd7Qg6LazQ=;
 b=3dU1jbHYXQ/XAmqPZOKHYz6DDIaRsDa4jQua1ALrJAvyl9ekzWxraIipb1NaGw51qe
 wY6wmIXUfL3pgbZiJOlITRlyshmX2nmpqpk5E44f7i6Wzr/fWGPGbbnQQJfw/XKnkuNE
 iAx9rS3PQQGJnDi8wFYDOk6dPgX6qGVyQgtnJn+o+MOHtnZB5rPU1ORtuvnHUAgny524
 GhQA4841NpJJwyb4j6jic6ur9hefaCvFToc1AY6Uz5e6VmNYQlRQvnjWm+LDaS8itGEo
 wu6SwoskX6wUMrSdrWtPd5/RwMBjdGD66PH2nlM1BuO3JtO4+RHZxHfMYGwKQsvOSVrE
 IAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739569107; x=1740173907;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7yTRDZMrkOhvbJQIYtlRQpYDM+YNIVDprdd7Qg6LazQ=;
 b=bBJBdpY69KIY4jVZVNxy9YcwDxzBK+5+tpwZRwttjZjvRp5LZdFCFMGKJsnqxybfrr
 3gD2sljMWlyo4w6l47WZbSAXoSnBglgv6wt/gJFJ+qzZIAwj1x2iwPehgMGQ2GMsHeJb
 Ic/rxEKyc1igVe+ZY5r/yr1Z2p9kVOm7YHiqB1tHBGb6tHCkBUI+/xtoL5piJf6xh4N4
 Wqh6veG435kj1mRjl+4dcsHeZcBKSRHwlXkSvKBpZwQ6hsV8I6uJda9j5dvbH0y1U8CN
 AnePnXTpbtMsckQzCwTE5e7ynjSLgLQiU9vLflbXVs2ey7mhza5rMeZ5INOrjZt48hLo
 1sig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoe9KqAim53AVAnlgvih5SYdC4J8D3yVRxTo0/MbVdLMJELWZCOqXHH7TZt0hK5JOTIB+o4CVA2WA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNSBLsYvMroLg8R2FBWEIVNvzsbwCzxncKTvDgcknGY3/byNkF
 Su6Jeher0nsoutWdFBbOS+TM4kqWhEogIG2CfsaUG8tso1yBShZ2YRAikhL6GlI9Z9jkzpKJ5Gx
 zyBGdrfYZHbqlqlw7/QzNXLx0x+3JLeWv6FCO
X-Gm-Gg: ASbGncuu2AFD4BZL3hkoECxueIoBNH8hyw4lTgy9EuqrCm00G/GgIUp12ovDLoAX2Lg
 dEXXCikUT3MV8+NC9xOhDe9LmJnXouatgu5akP08M1asxQkcuNBIotmpPDYl3hAf/B0ybw2OB1P
 4QGvb5F1LIqxhttAC70J+ijwXp1OqQquY=
X-Google-Smtp-Source: AGHT+IENui0GJMCBzQWaOkk4fCDqan7NKf/uayJ69zcUei4avNx+b62mUVqQFaFt7FdH8dZ2nGXIpkzPY2KqS39HV6Q=
X-Received: by 2002:a17:90b:3847:b0:2fa:1029:f169 with SMTP id
 98e67ed59e1d1-2fc4116bcc1mr1063380a91.33.1739569107014; Fri, 14 Feb 2025
 13:38:27 -0800 (PST)
MIME-Version: 1.0
References: <20250214122759.2629-2-mike@fireburn.co.uk>
 <2025021456-easiness-facebook-636e@gregkh>
 <1911589.tdWV9SEqCh@camazotz> <20250214184539.GC21799@frogsfrogsfrogs>
In-Reply-To: <20250214184539.GC21799@frogsfrogsfrogs>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Fri, 14 Feb 2025 21:38:16 +0000
X-Gm-Features: AWEUYZnQsZuH4SEs06ouAHFBm21FsnizJMKtJPJOoJuOa3R3JVfBQJ_vJ6pPPjI
Message-ID: <CAHbf0-H9j0-wx2RAXBQzTH9oB0XJn+0+8tz5kHqwaoQNA+We-w@mail.gmail.com>
Subject: Re: [PATCH] ntsync: Set the permissions to be 0666
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Elizabeth Figura <zfigura@codeweavers.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-api@vger.kernel.org, 
 wine-devel@winehq.org, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Wolfram Sang <wsa@kernel.org>, Arkadiusz Hiler <ahiler@codeweavers.com>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, 
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000afbad0062e20fedc"
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

--000000000000afbad0062e20fedc
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Feb 2025, 18:45 Darrick J. Wong, <djwong@kernel.org> wrote:

> On Fri, Feb 14, 2025 at 12:13:03PM -0600, Elizabeth Figura wrote:
> > On Friday, 14 February 2025 07:06:20 CST Greg Kroah-Hartman wrote:
> > > On Fri, Feb 14, 2025 at 12:28:00PM +0000, Mike Lothian wrote:
> > > > This allows ntsync to be usuable by non-root processes out of the box
> > >
> > > Are you sure you need/want that?  If so, why?  How did existing testing
> > > not ever catch this?
> >
> > Hi, sorry, this is of course my fault.
> >
> > We do need /dev/ntsync to be openable from user space for it to be
> > useful. I'm not sure what the most "correct" permissions are to have
> > in this case (when we don't specifically need read or write), but I
> > don't think I see a reason not to just set to 666 or 444.
> >
> > I originally assumed that the right way to do this was not to set the
> > mode on the kernel file but rather through udev; I believe I was using
> > the code for /dev/loop-control or /dev/fuse as an example, which both
> > do that. So I (and others who tested) had just manually set up udev
> > rules for this, with the eventual intent of adding a default rule to
> > systemd like the others. I only recently realized that doing something
> > like this patch is possible and precedented.
> >
> > I don't know what the best way to address this is, but this is
> > certainly the simplest.
>
> Paranoid defaults in the kernel, and then a udev rule to relax the mode
> at runtime.  You could also have logind scripts to add add per-user
> allow acls to the device file at user session set up time... or however
> it is that /dev/sr0 has me on the allow list.  I'm not sure how that
> happens exactly, but it works smoothly.
>
> I get far less complaining about relaxing posture than tightening it
> (==breaking things) after the fact.
>
> --D
>

I did create a MR for systemd first
https://github.com/systemd/systemd/pull/36384

>

--000000000000afbad0062e20fedc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 14 Feb 2025, 18:45 Darri=
ck J. Wong, &lt;<a href=3D"mailto:djwong@kernel.org">djwong@kernel.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, Feb 14, 2025 at =
12:13:03PM -0600, Elizabeth Figura wrote:<br>
&gt; On Friday, 14 February 2025 07:06:20 CST Greg Kroah-Hartman wrote:<br>
&gt; &gt; On Fri, Feb 14, 2025 at 12:28:00PM +0000, Mike Lothian wrote:<br>
&gt; &gt; &gt; This allows ntsync to be usuable by non-root processes out o=
f the box<br>
&gt; &gt; <br>
&gt; &gt; Are you sure you need/want that?=C2=A0 If so, why?=C2=A0 How did =
existing testing<br>
&gt; &gt; not ever catch this?<br>
&gt; <br>
&gt; Hi, sorry, this is of course my fault.<br>
&gt; <br>
&gt; We do need /dev/ntsync to be openable from user space for it to be<br>
&gt; useful. I&#39;m not sure what the most &quot;correct&quot; permissions=
 are to have<br>
&gt; in this case (when we don&#39;t specifically need read or write), but =
I<br>
&gt; don&#39;t think I see a reason not to just set to 666 or 444.<br>
&gt; <br>
&gt; I originally assumed that the right way to do this was not to set the<=
br>
&gt; mode on the kernel file but rather through udev; I believe I was using=
<br>
&gt; the code for /dev/loop-control or /dev/fuse as an example, which both<=
br>
&gt; do that. So I (and others who tested) had just manually set up udev<br=
>
&gt; rules for this, with the eventual intent of adding a default rule to<b=
r>
&gt; systemd like the others. I only recently realized that doing something=
<br>
&gt; like this patch is possible and precedented.<br>
&gt; <br>
&gt; I don&#39;t know what the best way to address this is, but this is<br>
&gt; certainly the simplest.<br>
<br>
Paranoid defaults in the kernel, and then a udev rule to relax the mode<br>
at runtime.=C2=A0 You could also have logind scripts to add add per-user<br=
>
allow acls to the device file at user session set up time... or however<br>
it is that /dev/sr0 has me on the allow list.=C2=A0 I&#39;m not sure how th=
at<br>
happens exactly, but it works smoothly.<br>
<br>
I get far less complaining about relaxing posture than tightening it<br>
(=3D=3Dbreaking things) after the fact.<br>
<br>
--D<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">I did create a MR for systemd first=C2=A0<a href=3D"https://github.com/s=
ystemd/systemd/pull/36384">https://github.com/systemd/systemd/pull/36384</a=
></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000afbad0062e20fedc--
