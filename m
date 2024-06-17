Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0D190BCED
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 23:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C3010E4F4;
	Mon, 17 Jun 2024 21:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="McsnFeBJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4393310E4F4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 21:29:23 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2bfff08fc29so3998997a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 14:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1718659762; x=1719264562;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AvZIXvMi5FokCR17bpHiTWQ1MBkghfetILWS0Qb82vc=;
 b=McsnFeBJjk2KCGUoT/JhdU5Y7f3GRvMNBCyxHHFs9pbvcBcIUWms20zEVDPaF158wx
 0SZXmlqVUYifatq7lkMiio3pKg0s2e1okmXAOkERiOYb2kx+zvH3UGr01CfYNfSRMNO1
 GqWzV7RFD0hK7igRiQdqddVYToX6jHDZIdzak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718659762; x=1719264562;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AvZIXvMi5FokCR17bpHiTWQ1MBkghfetILWS0Qb82vc=;
 b=eRpeYKIJe3Nh0B1q6+ekLTfC4FqJGjDNU7WwJYiilDIzI0adXWE9Fuw2VOaVwPGmHQ
 EmeXCGjNyYp0Ex4zRkubBI0iQIJvnTSVuUmHH316C4enQF/B7qt1r4oTdUakQh49vj1G
 50kd9MOPyw7inU451vgxWWhMnoRy5JNlPqP+aRiAEu3oaBG60mzHBn+UwHqVyBpjlb28
 5isyefk5OY9EEC4z/GIgLz2keaDqi/JITSGruo+JL5n+Ibk/HBaTaKUPLnDlVqXd6oYL
 Z+0ZuJQi/yndDaj9DLO0rKxcyTZYV0WYWBBPkdzA0EK2EmpWCAFQukU4sgZJBY96XUQo
 S75A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMEPWNmrsCt+4P7hW9cD8eVEt+gW3C099h67JyUjt9VntW8M0puBg9Adcifh93s1niYLW7xE8rOWG7QSogsMCeoCgUMFTGTV86zhE/v5GH
X-Gm-Message-State: AOJu0Yw6ZxaukhkbSAR76xEJ0GIgjg7sfi5Bbh5YSxvfl1Cfv1X0mURe
 vOp23LSDs3a4PFR4Y/TzH3UedSeEvry2XcAVsUeV7Hi61BDugEtJT3a0H6MWYzoBv0QH+n1ew8e
 2xRtPDqozc2BPagtUt7UscJ1ig9Ix00Tgvk4X
X-Google-Smtp-Source: AGHT+IFie0wD6hh4OhaRSKH5dtJZrTI8vZCVNU5SSHlj40iMq2ltW3Ct7Lp85KStbXXUGaUQJdn8L0pK7hmVFzzNQY0=
X-Received: by 2002:a17:90a:af90:b0:2c3:195b:dc36 with SMTP id
 98e67ed59e1d1-2c4db12bb3fmr10563676a91.10.1718659762402; Mon, 17 Jun 2024
 14:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <202406152104.FxakP1MB-lkp@intel.com>
 <20240616012511.198243-1-alexey.makhalov@broadcom.com>
 <20240616012511.198243-2-alexey.makhalov@broadcom.com>
 <20240617090428.GBZm_8HMQ9XJe_VQga@fat_crate.local>
 <19e8a6dd-b0d4-4e88-9ad2-e38787a5aee8@broadcom.com>
 <20240617210208.GJZnCkUIsiXmaQxxPE@fat_crate.local>
In-Reply-To: <20240617210208.GJZnCkUIsiXmaQxxPE@fat_crate.local>
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Date: Mon, 17 Jun 2024 14:29:11 -0700
Message-ID: <CAOWL4WR8mY3srFGTyWeXzop0Buqng2zWsmOe4kYJwjKwrkg_vA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: dac: Fix dependencies of AD9739A
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, 
 lkp@intel.com, zack.rusin@broadcom.com, dri-devel@lists.freedesktop.org, 
 daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, linux-iio@vger.kernel.org, 
 jic23@kernel.org, lars@metafoo.de, nuno.sa@analog.com, 
 dragos.bogdan@analog.com, anshulusr@gmail.com, andrea.collamati@gmail.com, 
 oe-kbuild-all@lists.linux.dev, x86@kernel.org
Content-Type: multipart/alternative; boundary="000000000000a0e14e061b1ca86d"
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

--000000000000a0e14e061b1ca86d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Haha, got it!

On Mon, Jun 17, 2024 at 2:02=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:

> On Mon, Jun 17, 2024 at 01:48:38PM -0700, Alexey Makhalov wrote:
> > > Don't get discouraged, though, when fixing something that is not in o=
ur
> > > immediate area of interest!
> > >
> > > :-)
> >
> > Lesson learned and noted for next time to address only related/new
> warnings
> > and errors. Thanks!
>
> I actually meant the exact opposite. :-)
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
>

--000000000000a0e14e061b1ca86d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Haha, got it!</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Jun 17, 2024 at 2:02=E2=80=AFPM Boris=
lav Petkov &lt;<a href=3D"mailto:bp@alien8.de">bp@alien8.de</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Jun 17, =
2024 at 01:48:38PM -0700, Alexey Makhalov wrote:<br>
&gt; &gt; Don&#39;t get discouraged, though, when fixing something that is =
not in our<br>
&gt; &gt; immediate area of interest!<br>
&gt; &gt; <br>
&gt; &gt; :-)<br>
&gt;<br>
&gt; Lesson learned and noted for next time to address only related/new war=
nings<br>
&gt; and errors. Thanks!<br>
<br>
I actually meant the exact opposite. :-)<br>
<br>
-- <br>
Regards/Gruss,<br>
=C2=A0 =C2=A0 Boris.<br>
<br>
<a href=3D"https://people.kernel.org/tglx/notes-about-netiquette" rel=3D"no=
referrer" target=3D"_blank">https://people.kernel.org/tglx/notes-about-neti=
quette</a><br>
</blockquote></div>

--000000000000a0e14e061b1ca86d--
