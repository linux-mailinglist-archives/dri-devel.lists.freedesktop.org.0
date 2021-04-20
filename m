Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D543660F1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 22:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C825D6E8C7;
	Tue, 20 Apr 2021 20:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6135C6E8C7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 20:33:36 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 t14-20020a05600c198eb029012eeb3edfaeso32743wmq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 13:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dot1S2WUXdDAJy8DTSBlbUGNbczdrI5EBdPQfEViNNY=;
 b=Xqda/YYoD+EQcVXHE3NhjtclB46r0QnI3sYGif9B+P7gjbiyRLCjCE/yHzUUasBpMR
 rljpJH4IsDXVtRf7bh2a2EnAarKd3oa5KDRgPOJx0yr9yfKC+AvOzHugE8CT7RkMmTBd
 hg0YTnLh/gO03knxjWAQ8HCwJX/TcfMmK4R7jnxei3T1U8IyzE9LxGDiXTNPNxqn9sNN
 gK+MTexcuLeTZKXkHbOER3n4u/OR6uBWd5DjI9+dUhJfveaufI44XVnfdj0Z6AiirvS6
 KQng72ow8s/EdEe+N9ZMbQGf/TxqKS9kJXLdLpL881pBuphndMj3Lcf9SKreMaSvCoj3
 FHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dot1S2WUXdDAJy8DTSBlbUGNbczdrI5EBdPQfEViNNY=;
 b=EvCUPluIp4me7AtGnqJACv1n+mXxMGneB7VI77Sz5a832Qo1RXYxoIWFNrN7a2iu8M
 ydksicgfd0g26j2fI6EBpj+EV791PIBcz6jVyEXuNVbv8oGor6/7lHVA9ePZObK7zsSg
 FCAf5+jpk521GHhaPr8RUkUP4Ap0IWrqHLlzRBT17UsNmvM9vekagpghF5VsTD7ayUlj
 2EgmqcJQcX5eOA1NgmXFol/3TwVU7izFM0nIoKTBU3fUG5l3IVlwpr4k6M+f9LBuKddi
 A6E18lv3tWqdK1sMOazGX77QxvIWQGFJ4dWCr0cFdtaB3dGSdfh6kCuPp2eqRZd6LzRG
 KL/Q==
X-Gm-Message-State: AOAM533qHvn5mQeJoe37oZ1Sc0We9T8pBjrB5E8uTxdf/pSNMas4jWuh
 L8ahBNeVRGGkYkhDPRaw0TdIXppGYvVK8c1t4ySm6w==
X-Google-Smtp-Source: ABdhPJzCViC5+Pj9awNnIyaNZesTt//053z5unM20FUpANqn5HCNlgXN4CKct9S7ywPcC8mhQnfnjfSRBQeVU3t0HWc=
X-Received: by 2002:a7b:cd98:: with SMTP id y24mr6168114wmj.52.1618950815040; 
 Tue, 20 Apr 2021 13:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
 <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
 <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
In-Reply-To: <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Apr 2021 21:32:47 +0100
Message-ID: <CAPj87rOfv0w8jF4CO8PUHQXTfq+2GE=BDmRRWjOMkQ0wH3CPAA@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Daniel Vetter <daniel@ffwll.ch>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: multipart/mixed; boundary="===============1734018502=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1734018502==
Content-Type: multipart/alternative; boundary="0000000000003d5cda05c06d5c54"

--0000000000003d5cda05c06d5c54
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 20 Apr 2021 at 20:30, Daniel Vetter <daniel@ffwll.ch> wrote:

> The thing is, you can't do this in drm/scheduler. At least not without
> splitting up the dma_fence in the kernel into separate memory fences
> and sync fences


I'm starting to think this thread needs its own glossary ...

I propose we use 'residency fence' for execution fences which enact
memory-residency operations, e.g. faulting in a page ultimately depending
on GPU work retiring.

And 'value fence' for the pure-userspace model suggested by timeline
semaphores, i.e. fences being (*addr == val) rather than being able to look
at ctx seqno.

Cheers,
Daniel

--0000000000003d5cda05c06d5c54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, 20 Apr 2021 at 20:30, Daniel V=
etter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The thing is, y=
ou can&#39;t do this in drm/scheduler. At least not without<br>
splitting up the dma_fence in the kernel into separate memory fences<br>
and sync fences</blockquote><div>=C2=A0</div><div><span style=3D"">I&#39;m =
starting to think this thread needs its own glossary ...</span></div><div><=
span style=3D""><br></span></div><div><span style=3D"">I propose we use &#3=
9;residency fence&#39; for execution fences which enact memory-residency op=
erations, e.g. faulting in a page ultimately depending on GPU work retiring=
.</span></div><div><span style=3D""><br></span></div><div><span style=3D"">=
And &#39;value fence&#39; for the pure-userspace model suggested by timelin=
e semaphores, i.e. fences being (*addr =3D=3D val) rather than being able t=
o look at ctx seqno.</span></div><div><span style=3D""><br></span></div><di=
v><span style=3D"">Cheers,</span></div><div><span style=3D"">Daniel</span><=
/div></div></div>

--0000000000003d5cda05c06d5c54--

--===============1734018502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1734018502==--
