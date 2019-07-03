Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0755EBD8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 20:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9705C6E192;
	Wed,  3 Jul 2019 18:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965E56E0F7
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 18:45:05 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id r185so7248081iod.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 11:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UOZjnjN/BTDjEYeLMkasocpYVEFIZb5nqyqtxL48CkQ=;
 b=kWXWbsvNCSAG9eTwtu0sSlu/HfP+N0IP0Y+6mIyu4KT7qyktd1NUIBGfiCG8ZnHKCQ
 9WcaVRRUR0iic2YITt16KNSQHAZvKirGZw8FsA2fJM6uDMzp2CzKzflbGibBr6wsdjJ9
 gbGsdrHwK+4EURtb7cVE8/RD9eN6Q9F3NH3xa2fbso4O3RHe8BvIIylPLLazAJXDz/i7
 68FWHKp9vQIXcRgRsdHw5GE8/lHRkjQa3U+pXxfjEi79b8YWBacIBsFe9oG/F41SjVaU
 dUnBqNmylS+8UVOnKdk1q2UP0Rp5QJyupuaIYpLrSIe+kIr4YEMOaEbojGXJCADW9LSp
 Wl2A==
X-Gm-Message-State: APjAAAUrAp4ST1qEkX5xTrGDnKzxbBDC/r7o3qODW7tn0NbPs+nSUnY3
 CZTDSfUg3VLAwG0bObTwDHxWqYn7JcnTlus0BLM=
X-Google-Smtp-Source: APXvYqwUFgHJ2uJ8s3KnTar2KoeVIDM3DoH2TZsIptQj5HX4IfRoXQzVfUM3J+zeVelbMwhzvqorHT4AGEGXmj0/WWQ=
X-Received: by 2002:a6b:1451:: with SMTP id 78mr20347364iou.247.1562179504873; 
 Wed, 03 Jul 2019 11:45:04 -0700 (PDT)
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
In-Reply-To: <d1dfe289-8501-8848-6324-c43d6e66a77f@daenzer.net>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 3 Jul 2019 14:44:28 -0400
Message-ID: <CAAxE2A4hgaJ6+AoOGz=b+1aRQEb+eKB88N82KGkcU1w_dnffOQ@mail.gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UOZjnjN/BTDjEYeLMkasocpYVEFIZb5nqyqtxL48CkQ=;
 b=TvmUOVhHifYgsrOCTOxFYD63kZafxCCxHf0soQBGWbeEkqA3i3F/fmRbemv3NpHNWK
 RXEArgzfib9H5WFc+4Mc+hOdNqRe36LQBUDW1VM1tHREE09y6QoTacOz5r/qGZ1r3XVD
 d7t4zniVvLsB3IJCfmxHVUFY9sKiJ4/WwKHG1Rgxf1r6liFk+aYsL6QOhYdoYAKsrDKR
 xtO2o+LEn4yBxgSVWJ/jwBajTXvKVQcyPP6COcrP4o97RU3jC+3uRMA5kt4ApxlQgFVT
 It59B77Rrmi0ZFw04OAFfdeHnzdkmc6iM0P48olWypnQmg1c4jx1KJUwKLkkkLYfT1WN
 km3Q==
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
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Content-Type: multipart/mixed; boundary="===============0773039676=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0773039676==
Content-Type: multipart/alternative; boundary="00000000000076a48f058ccb428d"

--00000000000076a48f058ccb428d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You can run:
AMD_DEBUG=3Dtestdmaperf glxgears

It tests transfer sizes of up to 128 MB, and it tests ~60 slightly
different methods of transfering data.

Marek

On Wed, Jul 3, 2019 at 4:07 AM Michel D=C3=A4nzer <michel@daenzer.net> wrot=
e:

> On 2019-07-02 11:49 a.m., Timur Krist=C3=B3f wrote:
> > On Tue, 2019-07-02 at 10:09 +0200, Michel D=C3=A4nzer wrote:
> >> On 2019-07-01 6:01 p.m., Timur Krist=C3=B3f wrote:
> >>> On Mon, 2019-07-01 at 16:54 +0200, Michel D=C3=A4nzer wrote:
> >>>> On 2019-06-28 2:21 p.m., Timur Krist=C3=B3f wrote:
> >>>>> I haven't found a good way to measure the maximum PCIe
> >>>>> throughput
> >>>>> between the CPU and GPU,
> >>>>
> >>>> amdgpu.benchmark=3D3
> >>>>
> >>>> on the kernel command line will measure throughput for various
> >>>> transfer
> >>>> sizes during driver initialization.
> >>>
> >>> Thanks, I will definitely try that.
> >>> Is this the only way to do this, or is there a way to benchmark it
> >>> after it already booted?
> >>
> >> The former. At least in theory, it's possible to unload the amdgpu
> >> module while nothing is using it, then load it again.
> >
> > Okay, so I booted my system with amdgpu.benchmark=3D3
> > You can find the full dmesg log here: https://pastebin.com/zN9FYGw4
> >
> > The result is between 1-5 Gbit / sec depending on the transfer size
> > (the higher the better), which corresponds to neither the 8 Gbit / sec
> > that the kernel thinks it is limited to, nor the 20 Gbit / sec which I
> > measured earlier with pcie_bw.
>
> 5 Gbit/s throughput could be consistent with 8 Gbit/s theoretical
> bandwidth, due to various overhead.
>
>
> > Since pcie_bw only shows the maximum PCIe packet size (and not the
> > actual size), could it be that it's so inaccurate that the 20 Gbit /
> > sec is a fluke?
>
> Seems likely or at least plausible.
>
>
> >>>>> but I did take a look at AMD's sysfs interface at
> >>>>> /sys/class/drm/card1/device/pcie_bw which while running the
> >>>>> bottlenecked
> >>>>> game. The highest throughput I saw there was only 2.43 Gbit
> >>>>> /sec.
> >>>>
> >>>> PCIe bandwidth generally isn't a bottleneck for games, since they
> >>>> don't
> >>>> constantly transfer large data volumes across PCIe, but store
> >>>> them in
> >>>> the GPU's local VRAM, which is connected at much higher
> >>>> bandwidth.
> >>>
> >>> There are reasons why I think the problem is the bandwidth:
> >>> 1. The same issues don't happen when the GPU is not used with a TB3
> >>> enclosure.
> >>> 2. In case of radeonsi, the problem was mitigated once Marek's SDMA
> >>> patch was merged, which hugely reduces the PCIe bandwidth use.
> >>> 3. In less optimized cases (for example D9VK), the problem is still
> >>> very noticable.
> >>
> >> However, since you saw as much as ~20 Gbit/s under different
> >> circumstances, the 2.43 Gbit/s used by this game clearly isn't a hard
> >> limit; there must be other limiting factors.
> >
> > There may be other factors, yes. I can't offer a good explanation on
> > what exactly is happening, but it's pretty clear that amdgpu can't take
> > full advantage of the TB3 link, so it seemed like a good idea to start
> > investigating this first.
>
> Yeah, actually it would be consistent with ~16-32 KB granularity
> transfers based on your measurements above, which is plausible. So
> making sure that the driver doesn't artificially limit the PCIe
> bandwidth might indeed help.
>
> OTOH this also indicates a similar potential for improvement by using
> larger transfers in Mesa and/or the kernel.
>
>
> --
> Earthling Michel D=C3=A4nzer               |              https://www.amd=
.com
> Libre software enthusiast             |             Mesa and X developer
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--00000000000076a48f058ccb428d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You can run:</div><div>AMD_DEBUG=3Dtestdmaperf glxgea=
rs</div><div><br></div><div>It tests transfer sizes of up to 128 MB, and it=
 tests ~60 slightly different methods of transfering data.<br></div><div><b=
r></div><div>Marek<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Jul 3, 2019 at 4:07 AM Michel D=C3=A4=
nzer &lt;<a href=3D"mailto:michel@daenzer.net" target=3D"_blank">michel@dae=
nzer.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On 2019-07-02 11:49 a.m., Timur Krist=C3=B3f wrote:<br>
&gt; On Tue, 2019-07-02 at 10:09 +0200, Michel D=C3=A4nzer wrote:<br>
&gt;&gt; On 2019-07-01 6:01 p.m., Timur Krist=C3=B3f wrote:<br>
&gt;&gt;&gt; On Mon, 2019-07-01 at 16:54 +0200, Michel D=C3=A4nzer wrote:<b=
r>
&gt;&gt;&gt;&gt; On 2019-06-28 2:21 p.m., Timur Krist=C3=B3f wrote:<br>
&gt;&gt;&gt;&gt;&gt; I haven&#39;t found a good way to measure the maximum =
PCIe<br>
&gt;&gt;&gt;&gt;&gt; throughput<br>
&gt;&gt;&gt;&gt;&gt; between the CPU and GPU,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; amdgpu.benchmark=3D3<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; on the kernel command line will measure throughput for var=
ious<br>
&gt;&gt;&gt;&gt; transfer<br>
&gt;&gt;&gt;&gt; sizes during driver initialization.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks, I will definitely try that.<br>
&gt;&gt;&gt; Is this the only way to do this, or is there a way to benchmar=
k it<br>
&gt;&gt;&gt; after it already booted?<br>
&gt;&gt;<br>
&gt;&gt; The former. At least in theory, it&#39;s possible to unload the am=
dgpu<br>
&gt;&gt; module while nothing is using it, then load it again.<br>
&gt; <br>
&gt; Okay, so I booted my system with amdgpu.benchmark=3D3<br>
&gt; You can find the full dmesg log here: <a href=3D"https://pastebin.com/=
zN9FYGw4" rel=3D"noreferrer" target=3D"_blank">https://pastebin.com/zN9FYGw=
4</a><br>
&gt; <br>
&gt; The result is between 1-5 Gbit / sec depending on the transfer size<br=
>
&gt; (the higher the better), which corresponds to neither the 8 Gbit / sec=
<br>
&gt; that the kernel thinks it is limited to, nor the 20 Gbit / sec which I=
<br>
&gt; measured earlier with pcie_bw.<br>
<br>
5 Gbit/s throughput could be consistent with 8 Gbit/s theoretical<br>
bandwidth, due to various overhead.<br>
<br>
<br>
&gt; Since pcie_bw only shows the maximum PCIe packet size (and not the<br>
&gt; actual size), could it be that it&#39;s so inaccurate that the 20 Gbit=
 /<br>
&gt; sec is a fluke?<br>
<br>
Seems likely or at least plausible.<br>
<br>
<br>
&gt;&gt;&gt;&gt;&gt; but I did take a look at AMD&#39;s sysfs interface at<=
br>
&gt;&gt;&gt;&gt;&gt; /sys/class/drm/card1/device/pcie_bw which while runnin=
g the<br>
&gt;&gt;&gt;&gt;&gt; bottlenecked<br>
&gt;&gt;&gt;&gt;&gt; game. The highest throughput I saw there was only 2.43=
 Gbit<br>
&gt;&gt;&gt;&gt;&gt; /sec.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; PCIe bandwidth generally isn&#39;t a bottleneck for games,=
 since they<br>
&gt;&gt;&gt;&gt; don&#39;t<br>
&gt;&gt;&gt;&gt; constantly transfer large data volumes across PCIe, but st=
ore<br>
&gt;&gt;&gt;&gt; them in<br>
&gt;&gt;&gt;&gt; the GPU&#39;s local VRAM, which is connected at much highe=
r<br>
&gt;&gt;&gt;&gt; bandwidth.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; There are reasons why I think the problem is the bandwidth:<br=
>
&gt;&gt;&gt; 1. The same issues don&#39;t happen when the GPU is not used w=
ith a TB3<br>
&gt;&gt;&gt; enclosure.<br>
&gt;&gt;&gt; 2. In case of radeonsi, the problem was mitigated once Marek&#=
39;s SDMA<br>
&gt;&gt;&gt; patch was merged, which hugely reduces the PCIe bandwidth use.=
<br>
&gt;&gt;&gt; 3. In less optimized cases (for example D9VK), the problem is =
still<br>
&gt;&gt;&gt; very noticable.<br>
&gt;&gt;<br>
&gt;&gt; However, since you saw as much as ~20 Gbit/s under different<br>
&gt;&gt; circumstances, the 2.43 Gbit/s used by this game clearly isn&#39;t=
 a hard<br>
&gt;&gt; limit; there must be other limiting factors.<br>
&gt; <br>
&gt; There may be other factors, yes. I can&#39;t offer a good explanation =
on<br>
&gt; what exactly is happening, but it&#39;s pretty clear that amdgpu can&#=
39;t take<br>
&gt; full advantage of the TB3 link, so it seemed like a good idea to start=
<br>
&gt; investigating this first.<br>
<br>
Yeah, actually it would be consistent with ~16-32 KB granularity<br>
transfers based on your measurements above, which is plausible. So<br>
making sure that the driver doesn&#39;t artificially limit the PCIe<br>
bandwidth might indeed help.<br>
<br>
OTOH this also indicates a similar potential for improvement by using<br>
larger transfers in Mesa and/or the kernel.<br>
<br>
<br>
-- <br>
Earthling Michel D=C3=A4nzer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http=
s://www.amd.com" rel=3D"noreferrer" target=3D"_blank">https://www.amd.com</=
a><br>
Libre software enthusiast=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mesa and X developer<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-de=
vel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listin=
fo/dri-devel</a></blockquote></div>

--00000000000076a48f058ccb428d--

--===============0773039676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0773039676==--
