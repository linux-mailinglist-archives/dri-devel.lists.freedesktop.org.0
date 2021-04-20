Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6437D365B82
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 16:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511FC6E53E;
	Tue, 20 Apr 2021 14:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E035989B7B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 14:54:01 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id a4so37937619wrr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 07:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7EnE0sILCEAAxZ75hu+FoNcaJ2O6wqh81pzTh1A5KoE=;
 b=SGIcX7ioYGt0l+x9jMEuivD2+2lf1E26L9alBPajnDNTGFybUMrCYBelaK+oRfLAe1
 nt2WHRCQtnvBA6w+DwbyT7n8RMsarr1R9UimlbtPH0dLXMHf901vhcTfUjkWy0rqYaMG
 mO+vPPknE2OhlK4RX6PBtyh86SqB4rhxzrKkP7vNPYjzYjzhrZGES+LxU2W3Q+h8cD1j
 SvSPlHH7zuFH5N6L/G9QT8BLrvmVsyaKfKImdVnxzP36/S5Y8fGM2G5CYSa8B6+AyK69
 kpt+vxu2rBofUYNeQoFmsuSq4wdlavNonqLW9nNzmqQmE8FjRF8h1TueTYknSeFshm2g
 bG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7EnE0sILCEAAxZ75hu+FoNcaJ2O6wqh81pzTh1A5KoE=;
 b=dTf1XYqPhHHVZPPtSl9z1TTdDXvuritgC2mQZVeSMZOrWmDQjTqfI4ArFMUsUfzbMc
 LxQ0xe1Sckdw0hQo9SgwpSnFxBpdtgC7+Y+sqU1OO724VwSIYsB5LIPjAzRLHmkXppb7
 FZB2aDDW4Th00SuOtKNk3CzqO7iDMorTHxQ7//SBOgYVfzp4vaEBVa+ybFSSW6Eg9L1W
 dDtVEKzZ60UT2z5vsvWWJ3lFJtOrbUfQ44gvfpKNTLJgJT+4Wy7xDooRC79RN/wWSuIc
 LeLQPOIcMgNLcRrWKDd4WqGl9f4R4DANokETA9211j5bJx7rL5GmLYO6Q7gkdTihFmmu
 sUGA==
X-Gm-Message-State: AOAM531ic8FypCW12G+lHiWC2jMrPLS3OJaXUyCSzHRxu/Y7eqVgtyw3
 uX9nf3FEhItJcnCH2jLKPOiRFLCc8D9iH5H3Bw5kzcd21h/lITyO
X-Google-Smtp-Source: ABdhPJwb29/x/stUryS9wXKW47RvIS1zQKywEO44AYiK6HL/r2X6XjsjqyWESUglNCDwG/qXd8uisA8vPIy1K4CartU=
X-Received: by 2002:adf:ce90:: with SMTP id r16mr20960095wrn.354.1618930440431; 
 Tue, 20 Apr 2021 07:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
In-Reply-To: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Apr 2021 15:53:10 +0100
Message-ID: <CAPj87rO7_Q2L0PogryGmuxLJk-DA3ckM+6vmDioErZ3_6s0iRQ@mail.gmail.com>
Subject: Re: [RFC] Linux Graphics Next: Explicit fences everywhere and no BO
 fences - initial proposal
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0520485914=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0520485914==
Content-Type: multipart/alternative; boundary="000000000000d17bf505c0689de9"

--000000000000d17bf505c0689de9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 19 Apr 2021 at 11:48, Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wrot=
e:

> Deadlock mitigation to recover from segfaults:
> - The kernel knows which process is obliged to signal which fence. This
> information is part of the Present request and supplied by userspace.
> - If the producer crashes, the kernel signals the submit fence, so that
> the consumer can make forward progress.
> - If the consumer crashes, the kernel signals the return fence, so that
> the producer can reclaim the buffer.
> - A GPU hang signals all fences. Other deadlocks will be handled like GPU
> hangs.
>

Another thought: with completely arbitrary userspace fencing, none of this
is helpful either. If the compositor can't guarantee that a hostile client
has submitted a fence which will never be signaled, then it won't be
waiting on it, so it already needs infrastructure to handle something like
this. That already handles the crashed-client case, because if the client
crashes, then its connection will be dropped, which will trigger the
compositor to destroy all its resources anyway, including any pending waits=
.

GPU hangs also look pretty similar; it's an infinite wait, until the client
resubmits a new buffer which would replace (& discard) the old.

So signal-fence-on-process-exit isn't helpful and doesn't provide any extra
reliability; it in fact probably just complicates things.

Cheers,
Daniel

--000000000000d17bf505c0689de9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, 19 Apr 2021 at 11:48, Marek Ol=
=C5=A1=C3=A1k &lt;<a href=3D"mailto:maraeo@gmail.com">maraeo@gmail.com</a>&=
gt; wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div><span style=3D"">Deadlock mitigation to recover from segfault=
s:</span><br></div><div>- The kernel knows which process is obliged to sign=
al which fence. This information is part of the Present request and supplie=
d by userspace.<br></div><div>- If the producer crashes, the kernel signals=
 the submit fence, so that the consumer can make forward progress.</div><di=
v>- If the consumer crashes, the kernel signals the return fence, so that t=
he producer can reclaim the buffer.</div><div>- A GPU hang signals all fenc=
es. Other deadlocks will be handled like GPU hangs.</div></div></blockquote=
><div><br></div><div>Another thought: with completely arbitrary userspace f=
encing, none of this is helpful either. If the compositor can&#39;t guarant=
ee that a hostile client has submitted a fence which will never be signaled=
, then it won&#39;t be waiting on it, so it already needs infrastructure to=
 handle something like this. That already=C2=A0handles the crashed-client c=
ase, because if the client crashes, then its connection will be dropped, wh=
ich will trigger the compositor to destroy all its resources anyway, includ=
ing any pending waits.</div><div><br></div><div>GPU hangs also look pretty =
similar; it&#39;s an infinite wait, until the client resubmits a new buffer=
 which would replace (&amp; discard) the old.</div><div><br></div><div>So s=
ignal-fence-on-process-exit isn&#39;t helpful and doesn&#39;t provide any e=
xtra reliability; it in fact probably just complicates things.</div><div><s=
pan style=3D""><br></span></div><div><span style=3D"">Cheers,</span></div><=
div><span style=3D"">Daniel=C2=A0</span></div></div></div>

--000000000000d17bf505c0689de9--

--===============0520485914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0520485914==--
