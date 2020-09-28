Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB1127BDAD
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112B989E26;
	Tue, 29 Sep 2020 07:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD1F89FF7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 15:58:22 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id a16so1681418vke.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 08:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skarbek.name; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=z7HCB+V/9/s0aVUEKsoSbFdR3sjfSN4Z5lZRR15GnCw=;
 b=ra8YHlS5NSorGdhwec0zWV4XDkpqqTQH0ut+iPVjBp0djFaJshYuYjGGs68d5erNzv
 9ORN9v6wzKgWMg4uIxmqQlO60LT/y5tojrqKpL1cmSB/rLOwxkhEfQQtcJRDV0QFJ7Pz
 IoNQR73berpBGHEOlUgn5zzg9cJHSRxFCxajc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=z7HCB+V/9/s0aVUEKsoSbFdR3sjfSN4Z5lZRR15GnCw=;
 b=YxH1cykg128nMnwBVQh+0Okh9+GyE9IoqlVFdq7cTXcMrKDpVlRsYfPqwSZfuV91sd
 8z1w7uHl9xYEnyW++aXKV1cVNV1RrP5KOWC0bnJxzh3Dys3OfJVTLiT+5L/QTSQmzGcJ
 appZk4DlG2jVNSWKZ7HUMFud4G0n5yEgL9BjeFFX9H3Bgfy1za11PZj0QyCUa3vAJSKC
 onqK4ICXITQmIk0k2Qm1+r8n8iGhM3Vt/SRpxGCbhveWQPLAs6WnK8PhQuJL42lx8VOj
 yn9sGaUtBhkS6mzhj7A5zWjKPyEGVVp0B9UxTabHkGGtvfGh4sWKop9tScIiWmyQODqM
 6WMw==
X-Gm-Message-State: AOAM531Eji+9VAHMAMtJY2OE/uIrh81MYwQjLUFxtYYJwnwIwDkPYcbw
 u7oldvWC1BJANFktRdPOtvB6IRaTiphhkrVOQNREo7pmLJmFuECqQ6g=
X-Google-Smtp-Source: ABdhPJxIEe0kE2BA0JWRXMsn4fCUKS6FYNJqPnlDzgaIOH1lzfbg1AXc9BKRKEkbDT1Z6C2qv5A86tEmOv4r/d7yE7s=
X-Received: by 2002:a1f:26cd:: with SMTP id m196mr69017vkm.7.1601308701762;
 Mon, 28 Sep 2020 08:58:21 -0700 (PDT)
MIME-Version: 1.0
From: Marcin Skarbek <marcin@skarbek.name>
Date: Mon, 28 Sep 2020 17:58:11 +0200
Message-ID: <CA+StVuDqPHYZwG_GscLFGEiZ=TfchBw7Dh96tuer15jXej50fw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
To: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Content-Type: multipart/mixed; boundary="===============1959784657=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1959784657==
Content-Type: multipart/alternative; boundary="000000000000583e5505b061bcc4"

--000000000000583e5505b061bcc4
Content-Type: text/plain; charset="UTF-8"

Hi Deepak,

I have tested your patch using Fedora 32 as a guest and Windows 10 Pro 1809
as host (Gen 2 VM). No issues with building or loading the kernel module
and I have successfully run SwayWM inside VM using hyperv_drm.
Unfortunately, I'm unable to change the resolution beyond FHD. I have a
WQHD monitor and I would like to utilize it fully with VM running in
full-screen mode but SwayWM detects only FHD as a max available resolution.
Also, performance is less than desirable, even mouse pointer rendering is
sluggish.
I'm a poor C programmer so I won't be very helpful with development but let
me know if there is anything I can do to help with testing future versions
of this patch. This is something that I really would like to see in future
kernel releases.

-- 
Regards
Marcin Skarbek

--000000000000583e5505b061bcc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Deepak,<div><br></div><div>I have tested your patch usi=
ng Fedora 32 as a guest and Windows 10 Pro 1809 as host (Gen 2 VM). No issu=
es with building or loading the kernel module and I have successfully run S=
wayWM inside VM using hyperv_drm. Unfortunately, I&#39;m unable to=C2=A0cha=
nge the resolution beyond FHD. I have a WQHD monitor and I would like to ut=
ilize it fully with VM running in full-screen mode but SwayWM detects only =
FHD as a max available resolution.  Also, performance is less than desirabl=
e, even mouse pointer rendering is sluggish. </div><div>I&#39;m a poor C pr=
ogrammer so I won&#39;t be very helpful with development but let me know if=
 there is anything I can do to help with testing future versions of this pa=
tch. This is something that I really <span style=3D"font-size:calc(var(--re=
m)*1px*1.0625);letter-spacing:0px">would </span><span style=3D"font-size:ca=
lc(var(--rem)*1px*1.0625);letter-spacing:0px">like to see in future kernel =
releases.</span></div><div><div><br></div>-- <br><div data-smartmail=3D"gma=
il_signature" class=3D"gmail_signature" dir=3D"ltr"><div dir=3D"ltr"><div>R=
egards<br></div>Marcin Skarbek<br></div></div></div></div>

--000000000000583e5505b061bcc4--

--===============1959784657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1959784657==--
