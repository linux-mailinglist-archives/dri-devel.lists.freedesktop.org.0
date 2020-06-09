Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C531F3BA5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 15:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E65C6E054;
	Tue,  9 Jun 2020 13:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08626E054
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:15:35 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id b10so5958247uaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=zRiCT68ebfZO+dYP1GKBMH11KztZtq0+Vr8p7D19VtM=;
 b=bVbY6HJogGpgJH7xBNq06rpUyKn0VNEhTh9PAo5Vvxdw2mxHsQy7o1Z7HtATyFnuxs
 oisWcDh45bLHbcHCzIHpi8PHcDAF+43hZqn5RWMz+ZcrQnUUAxKkqjzWQRIOWqomEwMT
 vmyS3FMP8XXf6nKtjukeAn5azqcrIMxrkHa4v9BVaOCK3oQIrKA1QzKld2uMjvSi9NKZ
 fP8Y5CXA1GVOkdqc9liYwmK4UAfRWffr5GHEICFbIDtnXFxf/3/YT+7i1YdcSC1DqFyU
 KqZ4aSQi+iclHE/AUarqCMR3yVdZnn7mN6vd/HFGssd7JYAFIP6ocH071YHTUVBtve8W
 lWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=zRiCT68ebfZO+dYP1GKBMH11KztZtq0+Vr8p7D19VtM=;
 b=Jaq+BzYSSi+rSRWVmVWPZM7wb2w6SWXE+k+7IffinG25fr6g5ifnzwfRhBKIJuy8vN
 u5MfkDkfXVpdCO2JMTVAWxUGy2gK+Ld+KiCbfce6/pWnlp1rvyNY+3jHHVLiVBEfuPdR
 OYgMjPx+uytOwBGbHuJuuQ6gt5Sz08fKqCfTnKh3Bv/GLHeJGvP0XtQaLG850ofJPITA
 mmxw4RAzfoopggDfF3AZYEEE3EXCGnibroqsLFiSc0wI4QnMztNjBcbN5zfcDV/Ur2rw
 jpNNzKaOFy0ENfVSrAcuawE/s2+QchPOs9W9KEM8xdo6WHhdnXbNaGDtqv+PpdW9r9hI
 KYlw==
X-Gm-Message-State: AOAM5339uUOWsCVlelNt6tFtH3VEeDxZLIe8q+4sy1wm0EoqR4pzpciC
 IKvJKQLVYbAPeviXeYpqkNOYEOvG6A0xU5P0u8Q=
X-Google-Smtp-Source: ABdhPJy8/bWc1KRuGHObqE6GwOz8lPFmH46CCpo7u9BKyaesQyEHymG2cCPpWyloosewzv/uMgm1ABcDxLxFhcdzMZY=
X-Received: by 2002:ab0:13aa:: with SMTP id m39mr2748519uae.1.1591708534689;
 Tue, 09 Jun 2020 06:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAE_1dBEKtzDgEp0bM907+_48AgQ8xhdJ-akryC+GMje6RZ7i1A@mail.gmail.com>
In-Reply-To: <CAE_1dBEKtzDgEp0bM907+_48AgQ8xhdJ-akryC+GMje6RZ7i1A@mail.gmail.com>
From: Moses Christopher <moseschristopherb@gmail.com>
Date: Tue, 9 Jun 2020 18:45:23 +0530
Message-ID: <CAE_1dBHzzLWeswyT9agZO_kbyjZUc+X4x7vohw5gkbfNYA7xKg@mail.gmail.com>
Subject: drivers, video: logo: Query regarding logo selection at run-time
To: linux-fbdev-devel@lists.sourceforge.net, dri-devel@lists.freedesktop.org
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
Content-Type: multipart/mixed; boundary="===============0515825262=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0515825262==
Content-Type: multipart/alternative; boundary="000000000000cbd49505a7a68589"

--000000000000cbd49505a7a68589
Content-Type: text/plain; charset="UTF-8"

Hi,

I'd like to know one if my approach towards the following problem statement
is correct or wrong,

*Developer should be able to select a logo on runtime using kernel command
line argument or something similar.*

As far as I see from the drivers/video/logo section, we need to implement
some mechanism to compile two ppm files into the kernel binary and provide
a mechanism to select the addresses based on kernel command line argument,
to switch the logo.

Is this approach valid ?

*Background information:*
I would like to generate one kernel binary and use it in two different
variants of same hardware. And to differentiate the variants, I would like
to use two different boot logos.

Kindly provide any suggestions or feedback.
Thanks for your time and patience.

Best Regards,
Moses Christopher B

--000000000000cbd49505a7a68589
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" =
class=3D"gmail_attr">Hi,</div><div dir=3D"ltr" class=3D"gmail_attr"><br></d=
iv><div dir=3D"auto"><div dir=3D"auto">I&#39;d like to know one if my appro=
ach towards the following problem statement is correct or wrong,</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><b>Developer should be able to sel=
ect a logo on runtime using kernel command line argument or something simil=
ar.</b></div><div dir=3D"auto"><br></div><div dir=3D"auto">As far as I see =
from the drivers/video/logo section, we need to implement some mechanism to=
 compile two ppm files into the kernel binary and provide a mechanism to se=
lect the addresses based on kernel command line argument, to switch the log=
o.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Is this approach vali=
d ?</div><div dir=3D"auto"><b><br></b></div><div dir=3D"auto"><b>Background=
 information:</b></div><div dir=3D"auto">I would like to generate one kerne=
l binary and use it in two different variants of same hardware. And to diff=
erentiate the variants, I would like to use two different boot logos.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Kindly provide any suggestion=
s or feedback.</div><div dir=3D"auto">Thanks for your time and patience.<br=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Best Regards,</div><di=
v dir=3D"auto"><font color=3D"#9e9e9e">Moses Christopher B</font></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><br></div></div>
</div></div>

--000000000000cbd49505a7a68589--

--===============0515825262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0515825262==--
