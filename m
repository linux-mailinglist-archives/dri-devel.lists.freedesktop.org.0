Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7EC565ACA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C17D10E679;
	Mon,  4 Jul 2022 16:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C53D10E027
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 10:34:51 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q9so9364096wrd.8
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 03:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MMkGWFU4NKTFoY/gyV2TbvrHl0y9qunL2xl3N6W14tk=;
 b=Ou5663QSRKw8PmdWyHt+E9TWtwf5r9WBYNNLcxLB6fp1cAdSJWglKZZRxS8DLylog8
 knGJoi7UdYIJwnctZmHXGYjvd+VW9h2MQrScmjW7J/DHM6heTF39G9UKkHq4r+dxiohr
 GR9Dzchr+G3vJ+IliW6nMcsBW7AXpRseaVTNTE02P0ZtXejYr95m0JDMvi+n7gQFX42C
 RKTO7diuPkX7xGmpcMuiimXl/2/pgrx87LNRCiiPzNuNRtzwbeq2q4aq6xofCjxK7UY1
 j4+yPmB9MUhWvYHU+22EhmDZN2VC0eIcBl20hLLzLMTfhPQmCYWpRtSh85q+PGeC3F5g
 eTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MMkGWFU4NKTFoY/gyV2TbvrHl0y9qunL2xl3N6W14tk=;
 b=Ne7IeB8cBNuLKZ2IXEtpu54RMesVynrLEzKXUdLsgxFesZW50IMUj2KRIyp/SIS9wi
 BDb42uBZCxj8RTMHy+i4G4O0qhgKB3IQYs+H2tCm7Z1/6frNSHaawakpOju8ZR6HYPff
 8N1NaRhQ4huuJUQ+kvp9D4o6FDPfpbugmd4zdhIHfhtcXrrqweOwFOkwtIC9p9PHY/PO
 oFfnnrk5tydeYvsxjBN/TihBPCSran3YcZJaNrlZMWGBLCQvjyefxnzdpDVKfpI4+0KP
 83yP08LWiJw9jLCBiGKdpuZrmhllkxcWq6vaMDfbCP01d5yB2LQ3UuOrhCDf512GlnKy
 WDew==
X-Gm-Message-State: AJIora+KqDrIfJ1LyLq2Ti6ftf0LtJoD9NVZKIeFTOBhprvwV7Q38nSS
 txoDiI+8b6EOwDk25O/sOVwxO0Tpewf8hcsLWLE=
X-Google-Smtp-Source: AGRyM1tqhfI+O3Sz1VtvwJlMpn/enF+dVvImfc1kOj4T6ept8hnVYr4j4AkxANAOFGlNahVNlAVF/a9DwV5YakROit8=
X-Received: by 2002:a05:6000:798:b0:21b:8ca1:9b52 with SMTP id
 bu24-20020a056000079800b0021b8ca19b52mr22298416wrb.374.1656844489793; Sun, 03
 Jul 2022 03:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220702230727.66704-1-paul@crapouillou.net>
 <YsE6mZanHLy9LpBd@ravnborg.org>
In-Reply-To: <YsE6mZanHLy9LpBd@ravnborg.org>
From: Christophe Branchereau <cbranchereau@gmail.com>
Date: Sun, 3 Jul 2022 12:34:38 +0200
Message-ID: <CAFsFa85U+smMtVgwUeN1T21LFSHwdbqcKRvVAVacV4-=ALn82g@mail.gmail.com>
Subject: Re: [PATCH] drm/ingenic: Use the highest possible DMA burst size
To: Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/alternative; boundary="00000000000043256705e2e42b6e"
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
Cc: David Airlie <airlied@linux.ie>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, stable@vger.kernel.org,
 list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000043256705e2e42b6e
Content-Type: text/plain; charset="UTF-8"

Hello, fixes the hdmi glitches for me on jz4770.

Tested-by: Christophe Branchereau <cbranchereau@gmail.com>

On Sun, Jul 3, 2022 at 8:43 AM Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Paul,
>
> On Sun, Jul 03, 2022 at 12:07:27AM +0100, Paul Cercueil wrote:
> > Until now, when running at the maximum resolution of 1280x720 at 32bpp
> > on the JZ4770 SoC the output was garbled, the X/Y position of the
> > top-left corner of the framebuffer warping to a random position with
> > the whole image being offset accordingly, every time a new frame was
> > being submitted.
> >
> > This problem can be eliminated by using a bigger burst size for the DMA.
>
> Are there any alignment constraints of the framebuffer that depends on
> the burst size? I am hit by this with some atmel IP - which is why I
> ask.
>
> Patch looks good and is a-b.
>
> >
> > Set in each soc_info structure the maximum burst size supported by the
> > corresponding SoC, and use it in the driver.
> >
> > Set the new value using regmap_update_bits() instead of
> > regmap_set_bits(), since we do want to override the old value of the
> > burst size. (Note that regmap_set_bits() wasn't really valid before for
> > the same reason, but it never seemed to be a problem).
> >
> > Cc: <stable@vger.kernel.org>
> > Fixes: 90b86fcc47b4 ("DRM: Add KMS driver for the Ingenic JZ47xx SoCs")
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>

--00000000000043256705e2e42b6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, fixes the hdmi glitches for me on jz4770.<br><=
/div><div><br></div><div>Tested-by: Christophe Branchereau &lt;<a href=3D"m=
ailto:cbranchereau@gmail.com">cbranchereau@gmail.com</a>&gt;</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, J=
ul 3, 2022 at 8:43 AM Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg.org">=
sam@ravnborg.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hi Paul,<br>
<br>
On Sun, Jul 03, 2022 at 12:07:27AM +0100, Paul Cercueil wrote:<br>
&gt; Until now, when running at the maximum resolution of 1280x720 at 32bpp=
<br>
&gt; on the JZ4770 SoC the output was garbled, the X/Y position of the<br>
&gt; top-left corner of the framebuffer warping to a random position with<b=
r>
&gt; the whole image being offset accordingly, every time a new frame was<b=
r>
&gt; being submitted.<br>
&gt; <br>
&gt; This problem can be eliminated by using a bigger burst size for the DM=
A.<br>
<br>
Are there any alignment constraints of the framebuffer that depends on<br>
the burst size? I am hit by this with some atmel IP - which is why I<br>
ask.<br>
<br>
Patch looks good and is a-b.<br>
<br>
&gt; <br>
&gt; Set in each soc_info structure the maximum burst size supported by the=
<br>
&gt; corresponding SoC, and use it in the driver.<br>
&gt; <br>
&gt; Set the new value using regmap_update_bits() instead of<br>
&gt; regmap_set_bits(), since we do want to override the old value of the<b=
r>
&gt; burst size. (Note that regmap_set_bits() wasn&#39;t really valid befor=
e for<br>
&gt; the same reason, but it never seemed to be a problem).<br>
&gt; <br>
&gt; Cc: &lt;<a href=3D"mailto:stable@vger.kernel.org" target=3D"_blank">st=
able@vger.kernel.org</a>&gt;<br>
&gt; Fixes: 90b86fcc47b4 (&quot;DRM: Add KMS driver for the Ingenic JZ47xx =
SoCs&quot;)<br>
&gt; Signed-off-by: Paul Cercueil &lt;<a href=3D"mailto:paul@crapouillou.ne=
t" target=3D"_blank">paul@crapouillou.net</a>&gt;<br>
Acked-by: Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg.org" target=3D"_b=
lank">sam@ravnborg.org</a>&gt;<br>
</blockquote></div>

--00000000000043256705e2e42b6e--
