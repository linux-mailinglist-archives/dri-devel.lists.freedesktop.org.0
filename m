Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE05D369D9D
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 01:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0F56EC98;
	Fri, 23 Apr 2021 23:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B696EC98
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 23:57:31 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id b10so50445381iot.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fr0r8Ldj7zHAa8Bb+IOp3NdGHz8mauAOIu/faRDcCKk=;
 b=AfR6xzU+coOFxhW7mOLDXXm9eII3uQ2v/HDyV4StrsjULOhPUex+A7+FQs/onbrEz9
 H4orsdl5fKofIGPOhlIMqSdGm/gA0zUhKsb8YsHAqFHnBst8mlpbo1HUB96gyOCwzac+
 4EbtwJFEYmcaZ2LGnkWwHUtkN/cjRq7iumJ9i5fC9kmSx6kYd4WihRKfOK5PQXYqLmoD
 mEtNzypOcyE1YQ8gQN2sYmsOCjWqr9tXncNqsdykVGoE/Klgt9zf0foSggP8C1dI6s2m
 PmEh8hBmMq0sf47FyUbF9N2dJYpCeYPd5h6sSDtdkEoat0vWpp9gcoMXGBaOMeI2DzB3
 dEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fr0r8Ldj7zHAa8Bb+IOp3NdGHz8mauAOIu/faRDcCKk=;
 b=V4/elco//eUjMXPF5tQWeS9xzutmkFJiTWWirU7QvpOZ7E6doMpFhHYDTh8Svo6qDD
 DWYdpT9EEHBgvsO7keaG8rynK62KZJK2o/IWlxs0R/hTuX0B+PIC53GIRL8iisFqaFbm
 oUDjVDwttSs362UtSt66d4wdPSg39z0oclUPXS+shb/ko+wQ6zBMOWrPgBKA6m3UmrEe
 02pNKK51sBRZ1MB3q0UEF9OnK0lUuuM8Rd1FukD/FPqMUusByeQyEH+4TCNSRmslU6bk
 9FEwq75yzPjWmrcD60nZ6t6O3O85k6vBBnRaL/xwTO2Cjr86B7gildYMx8k73HFWXgC2
 XIIQ==
X-Gm-Message-State: AOAM533KvVocGwp0hgvqjZa4PmIFFwMKS6Ct0Kdmpgww/nRY3iFhFArT
 N6Hc1l+7fVwkpVzpabU2AaEoWPEONI3vHy9OOQE=
X-Google-Smtp-Source: ABdhPJxCqNCWAhQp9kz4Af33UCWgvP/g3qF17GJYutrPUK1/qPkq4pBOkGlYbPYJ8bbaS+8AHY8NcWD3vw8OBbBvHps=
X-Received: by 2002:a6b:5819:: with SMTP id m25mr4949480iob.99.1619222250759; 
 Fri, 23 Apr 2021 16:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210423034247.992052-1-art@khadas.com>
 <20210423114735.GA5507@sirena.org.uk>
In-Reply-To: <20210423114735.GA5507@sirena.org.uk>
From: Art Nikpal <email2tema@gmail.com>
Date: Sat, 24 Apr 2021 07:57:19 +0800
Message-ID: <CAKaHn9+d5crmmG-aKyLuvyxk+A7aC9qqfX_3wuMXm50pg+pZ4w@mail.gmail.com>
Subject: Re: [PATCH] SPI: meson-spifc add missed calls to remove function
To: Mark Brown <broonie@kernel.org>
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
Cc: Gouwa Wang <gouwa@khadas.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, Artem Lapkin <art@khadas.com>,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: multipart/mixed; boundary="===============0858681840=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0858681840==
Content-Type: multipart/alternative; boundary="00000000000011a9d605c0ac8f78"

--00000000000011a9d605c0ac8f78
Content-Type: text/plain; charset="UTF-8"

> I would expect the driver to unregister the controller at the start of
> the remove function, suspend doesn't really make sense here

It's strange - But without spi_master_suspend i have randomly stucks when i
try unload this module - as was written before
i was test it (load/unload module in loop) and for me suspend make sense
here

If anybody has another solution - or real problem not here - please write
to me the right way!

PS: i have another way for solve this problem (may be it can help us fix
problem in kernel)

# before unload module need
echo -n spi0.0 > /sys/bus/spi/drivers/spi-nor/unbind
# after unbind driver we can unload module without problem
rmmod spi_meson_spifc # can stuck without unbind driver before ...


On Fri, Apr 23, 2021 at 7:48 PM Mark Brown <broonie@kernel.org> wrote:

> On Fri, Apr 23, 2021 at 11:42:47AM +0800, Artem Lapkin wrote:
> > Problem: rmmod meson_gx_mmc - not stable without spi_master_suspend call
> > and we can get stuck when try unload this module
>
> > +++ b/drivers/spi/spi-meson-spifc.c
> > @@ -359,6 +359,7 @@ static int meson_spifc_remove(struct platform_device
> *pdev)
> >       struct spi_master *master = platform_get_drvdata(pdev);
> >       struct meson_spifc *spifc = spi_master_get_devdata(master);
> >
> > +     spi_master_suspend(master);
> >       pm_runtime_get_sync(&pdev->dev);
> >       clk_disable_unprepare(spifc->clk);
> >       pm_runtime_disable(&pdev->dev);
>
> I would expect the driver to unregister the controller at the start of
> the remove function, suspend doesn't really make sense here.
>

--00000000000011a9d605c0ac8f78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&gt; I would expect the driver to unregis=
ter the controller at the start of<br><div>
&gt; the remove function, suspend doesn&#39;t really make sense here</div><=
div><br></div><div>It&#39;s strange - But without <span>spi_master_suspend =
i have randomly stucks when i try unload this module - as was written befor=
e</span></div><div><span>i was test it (load/unload module in loop) and for=
 me suspend make sense here</span></div><div><span><br></span></div><div><s=
pan>If anybody has another solution - or real problem not here - please wri=
te to me the right way!</span></div><div><span><br></span></div><div><span>=
PS: i have another way for solve this problem (may be it can help us fix pr=
oblem in kernel)<br></span><div><br></div><div># before unload module need =
<br></div><div>echo -n spi0.0 &gt; /sys/bus/spi/drivers/spi-nor/unbind</div=
><div># after unbind driver we can unload module without problem</div>rmmod=
 spi_meson_spifc # can stuck without unbind driver before ...</div><div><sp=
an><br></span></div></div><br></div><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Fri, Apr 23, 2021 at 7:48 PM Mark Brown &lt;<a=
 href=3D"mailto:broonie@kernel.org" target=3D"_blank">broonie@kernel.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Fri, Apr 23, 2021 at 11:42:47AM +0800, Artem Lapkin wrote:<br>
&gt; Problem: rmmod meson_gx_mmc - not stable without spi_master_suspend ca=
ll<br>
&gt; and we can get stuck when try unload this module<br>
<br>
&gt; +++ b/drivers/spi/spi-meson-spifc.c<br>
&gt; @@ -359,6 +359,7 @@ static int meson_spifc_remove(struct platform_devi=
ce *pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct spi_master *master =3D platform_get_d=
rvdata(pdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct meson_spifc *spifc =3D spi_master_get=
_devdata(master);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0spi_master_suspend(master);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_get_sync(&amp;pdev-&gt;dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(spifc-&gt;clk);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_disable(&amp;pdev-&gt;dev);<br>
<br>
I would expect the driver to unregister the controller at the start of<br>
the remove function, suspend doesn&#39;t really make sense here.<br>
</blockquote></div>

--00000000000011a9d605c0ac8f78--

--===============0858681840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0858681840==--
