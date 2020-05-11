Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292271CE87F
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16266E7D3;
	Mon, 11 May 2020 22:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAA46E575
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 20:25:19 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id u12so6487366vsq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 13:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5m+n+vN0cZegpc+blupg22nb4Y2+YVeAj8bN0X8ffBo=;
 b=k/Z/BwoPAULpHkQgkeh4PmzZmqr8KN8Kl2kmj0pgJ2e9cuhKMyphcpR7SfAUOLATJ3
 CjIkk+NVUG1re/zIz9EMXO72MJvOJ/r2lKmmka53U+07+WkWFPniLr76m1KJ9zWsmsxp
 ZKTRz8DWPbua07fLChA/V4Bpc80rIUST7i5ePdzxVgceE93HeaVQ8JhGa7+lDHqVd8vm
 hBV2oEWA7KZvTndJuteNQyFQPUB/zbCOhMyQ98t9hl/hGbu+yGh6RPkNzOSIO7T1Tn9l
 QPvllpmSfeFYd3V/6b2ieCXQcRrP42+Ty0nKB+gDZEqoJ1qTURz0eywVV+0A4P9WCRP6
 nNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5m+n+vN0cZegpc+blupg22nb4Y2+YVeAj8bN0X8ffBo=;
 b=mpdwyBrUuIuN+HKeKHssMzuWdt8UTkPeCNNFPzYDUpwWsoWKkC3Q8tA3psIlWnfhlW
 rQiSj2/27vzBtsZRZBiou+8udSB9VxhK22+510YIIV519PD1AwCpkYnUpRyB+S+WuWAR
 EkJQCvnR+tycBp2GBZmuk6DGugBWfCKoqlQrCb25j12ZqbaAoXTtekWIxogizr5EWiNE
 f1qde8Sr7YdEBJYDb9yCUfpxa2xpmrbJixUiUZGJRGdTPLoKvTCFkYYLcvrL7al1k+15
 wGYdJuWekqLRkZ1xDtPwFXTAGdx1/65sU76otDMMH3j3xitkNdtyJKoPAwiahqbkC9UE
 YJ8A==
X-Gm-Message-State: AGi0PuZPsJw1Di44S35PuTsIwO9DJsDieXn5f8DTkJEHtx/sSwvO1JR9
 jyqYNM6RKb4uCznyrIUq5KeVZzCjncNNcOW7Yg==
X-Google-Smtp-Source: APiQypKZdTxRPxsFu0n+HFQITNg34Jhqz7x/8f0v6rhTTV2thYtF0OxsOrpZy1MJjbjCI7wCZv7We3ye766s43Jgs2w=
X-Received: by 2002:a67:6dc7:: with SMTP id i190mr12406610vsc.75.1589228718804; 
 Mon, 11 May 2020 13:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
In-Reply-To: <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Mon, 11 May 2020 21:25:06 +0100
Message-ID: <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Approved-At: Mon, 11 May 2020 22:51:58 +0000
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: multipart/mixed; boundary="===============0844276597=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0844276597==
Content-Type: multipart/alternative; boundary="00000000000040539a05a565259d"

--00000000000040539a05a565259d
Content-Type: text/plain; charset="UTF-8"

A segunda, 11/05/2020, 21:21, Alex Deucher <alexdeucher@gmail.com> escreveu:

>
>
> Note there is no loss of functionality here, at least on radeon
> hardware.  It just comes down to which MMU gets used for access to
> system memory, the AGP MMU on the chipset or the MMU built into the
> GPU.  On powerpc hardware, AGP has been particularly unstable, and
> IIRC, AGP has been disabled by default on radeon on powerpc for a
> while.
>

So this basically just drops support for the AGP GART? What happens to the
AGP signalling rates (beyond the base rate)?

>

--00000000000040539a05a565259d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">A segunda, 11/05/2020, 21:21, Alex Deucher &lt;<a href=
=3D"mailto:alexdeucher@gmail.com">alexdeucher@gmail.com</a>&gt; escreveu:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Note there is no loss of functionality here, at least on radeon<br>
hardware.=C2=A0 It just comes down to which MMU gets used for access to<br>
system memory, the AGP MMU on the chipset or the MMU built into the<br>
GPU.=C2=A0 On powerpc hardware, AGP has been particularly unstable, and<br>
IIRC, AGP has been disabled by default on radeon on powerpc for a<br>
while.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">So this basically just drops support for the AGP GART? What happens t=
o the AGP signalling rates (beyond the base rate)?</div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000040539a05a565259d--

--===============0844276597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0844276597==--
