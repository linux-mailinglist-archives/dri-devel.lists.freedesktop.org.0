Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2E760968
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 17:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDDD6E4F1;
	Fri,  5 Jul 2019 15:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665276E4F1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 15:35:43 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id g20so10365252ioc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 08:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mm5AUPc8XzNE4tTn2xJvPiFQcaotETQmUOodp4CHg6w=;
 b=nAgSMHvf11e8iz35wNxjkfPO5UOUkWfLc8ekk152nHJn/dxnYIA16ZnCn8jKcbWJRJ
 xJyXVqvcv46xeIvVWiNHgpFneHHRaYz5+oNbIecruxBP58nWtDx1NQ//kpEFhx3wx2iW
 n1WU6St6Du3I63lIyWH+OukDYhLxcGigHWgdOTS+8GEeHjPHTJlGmOtyyY4LKPEiZFu1
 cP5us2fIYADYGldxiylSQlxOBhSPuvgehiOjXXDiePHI33xRaXFX/b3VxAbwbNrpeCAm
 c0pMbgqmqhH/zMFCaC7Wj3jebbMQZ9IS0bugik3IFIZDtNqffNg7bWxukeHBwFbHFvzr
 Kt6g==
X-Gm-Message-State: APjAAAVTMcWYfe1NmwbXw9LGL7dAlb4ZWcVC++Dsi4k0TYZYle01tQq8
 Qe3hfUC+Xcifd0Pusc+1IsfmVT8RFcgtZB1BkWo=
X-Google-Smtp-Source: APXvYqxMmXWLZIPeQ9CIlbhV3hIcyAfQwDSpEQuTuLMGOduCNs8JuruoylTv3Nb3sZvb+/sYrpA+0Q7XexMCHCzV0KI=
X-Received: by 2002:a02:c487:: with SMTP id t7mr3458760jam.99.1562340942601;
 Fri, 05 Jul 2019 08:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <c3b38b60-7c1a-730d-8de0-e3c880902003@daenzer.net>
 <627b7fff64edcba0f8d8b5ced79a351821c419c7.camel@gmail.com>
 <792d0f36-b8ae-bef9-3b07-95677637ba00@daenzer.net>
 <f986d6687e2b1f1fc8a93f86cbc8fd1ab971663a.camel@gmail.com>
 <d1dfe289-8501-8848-6324-c43d6e66a77f@daenzer.net>
 <CAAxE2A4hgaJ6+AoOGz=b+1aRQEb+eKB88N82KGkcU1w_dnffOQ@mail.gmail.com>
 <ba05faee86fd702f0ba9baa2322a5e32c27432d7.camel@gmail.com>
In-Reply-To: <ba05faee86fd702f0ba9baa2322a5e32c27432d7.camel@gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 5 Jul 2019 11:35:05 -0400
Message-ID: <CAAxE2A6K-oaZqOJr+k0fZfwCmrPO+tfygu8EjDwk9PNgk4qU=Q@mail.gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mm5AUPc8XzNE4tTn2xJvPiFQcaotETQmUOodp4CHg6w=;
 b=gw7REWAwLLW1YmY6BvNT2yn7ASD//8e8msArbinqy0oarMuii35d9kp1UhDaHJ/Zuf
 kFmr4kjcuG1GjxO+zDqTEGPNJsrPU/4GSdEXudjLFk/3i9zkJMOrehZ0ZqLEqbPle+H+
 JwVRliZwlNsXLmvzSnD6/2ZBPnge9DWCdsNTI9tsfixV1vjwfBxrgsazobVnP0TT4fF3
 py3HFboJWF3NB6PsS96001pBTvatPJhiBzVvbUn9Dg0qBKTC3YEZjQJKr1Ra/07RITxS
 O+3LKMOkd3JegJuI915s5rZkB5b3XUX0p8gtoFqEQPuynF4ahzUKEP6eOZFJjELZ/v0W
 gVFQ==
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
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1932331122=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1932331122==
Content-Type: multipart/alternative; boundary="000000000000e6e62d058cf0d81d"

--000000000000e6e62d058cf0d81d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 5, 2019 at 5:27 AM Timur Krist=C3=B3f <timur.kristof@gmail.com>
wrote:

> On Wed, 2019-07-03 at 14:44 -0400, Marek Ol=C5=A1=C3=A1k wrote:
> > You can run:
> > AMD_DEBUG=3Dtestdmaperf glxgears
> >
> > It tests transfer sizes of up to 128 MB, and it tests ~60 slightly
> > different methods of transfering data.
> >
> > Marek
>
>
> Thanks Marek, I didn't know about that option.
> Tried it, here is the output: https://pastebin.com/raw/9SAAbbAA
>
> I'm not quite sure how to interpret the numbers, they are inconsistent
> with the results from both pcie_bw and amdgpu.benchmark, for example
> GTT->VRAM at a 128 KB is around 1400 MB/s (I assume that is megabytes /
> sec, right?).
>

Based on the SDMA results, you have 2.4 GB/s. For 128KB, it's 2.2 GB/s for
GTT->VRAM copies.

Marek

--000000000000e6e62d058cf0d81d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, Jul 5, 2019 at 5:27 AM Timur Krist=C3=B3f &lt;<a href=3D"mai=
lto:timur.kristof@gmail.com">timur.kristof@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2019-07-03 at 1=
4:44 -0400, Marek Ol=C5=A1=C3=A1k wrote:<br>
&gt; You can run:<br>
&gt; AMD_DEBUG=3Dtestdmaperf glxgears<br>
&gt; <br>
&gt; It tests transfer sizes of up to 128 MB, and it tests ~60 slightly<br>
&gt; different methods of transfering data.<br>
&gt; <br>
&gt; Marek<br>
<br>
<br>
Thanks Marek, I didn&#39;t know about that option.<br>
Tried it, here is the output: <a href=3D"https://pastebin.com/raw/9SAAbbAA"=
 rel=3D"noreferrer" target=3D"_blank">https://pastebin.com/raw/9SAAbbAA</a>=
<br>
<br>
I&#39;m not quite sure how to interpret the numbers, they are inconsistent<=
br>
with the results from both pcie_bw and amdgpu.benchmark, for example<br>
GTT-&gt;VRAM at a 128 KB is around 1400 MB/s (I assume that is megabytes /<=
br>
sec, right?).<br></blockquote><div><br></div><div>Based on the SDMA results=
, you have 2.4 GB/s. For 128KB, it&#39;s 2.2 GB/s for GTT-&gt;VRAM copies.<=
/div><div><br></div><div>Marek</div></div></div>

--000000000000e6e62d058cf0d81d--

--===============1932331122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1932331122==--
