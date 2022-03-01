Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E970F4C8475
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 07:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139A210E2C6;
	Tue,  1 Mar 2022 06:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD0610E2C6
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 06:58:46 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id dr20so4762628ejc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 22:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QYsiFVQHdZcPjO/ZUoDCE6brHT6hFn2HFdPyVO5Cw0Y=;
 b=nflMB1TtWHV3ShfuBIpM+GgouOaj+PGKDLjhAiM9/zh+SqQ8ikkqf8GT7drznPB3yJ
 k2pRdvGi15sVD2dYowU3qv9UL45uh1SUobfQZQ/lhcqUYlTpqbaJDFLUgL1r2q6s0Iql
 JaPUQuhBTjJb2xGdONxtOu5gforjEDukEip3AWM/IpgRN7ffJwZpMe4tZa8fZj6nR3q+
 nohv9okY4ae0wievCS01wZk7L6z4D9wSpPtdPcAmgPXad9QwCjuh2e2FcJMPmzevlPAv
 Zs+kH5eFCWEHtQwl7vABuiVGQCoKUo3ZIEnG4PqNdDCpe53CN6jtXPZtX7nan76cfOdP
 6BVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QYsiFVQHdZcPjO/ZUoDCE6brHT6hFn2HFdPyVO5Cw0Y=;
 b=3xXYI3qSGJ7tdo04sSFS7KdANn16b/QblCd1kSYXQZOUEp30AjorFtfUqK0NbMBuRd
 aSTkAaNNKHdWjEd4HtpmP3ltQdiua/Gu0Vp7jQr/Yd1+l8zyawNR81WAy2QbU3lJ9xmG
 PuGrCrl2s+L4EeVGqJI1CRh+FDZG9JIHBLMwoEJL+EJ2keusy+u2owknk6ukDGefLCeX
 vas1cFvvMEXO/GX1zcUZGAZYDDbc3QFYUUis0sskRcnsvdFxNngloEfiSaoVbodwOYZZ
 U6nZYO9lzc1yOOUmcHLZjyX7Qll4e/JS63Jihg89AzwOrMAV629b0s2qRrQi3ZqBaaBe
 gKwQ==
X-Gm-Message-State: AOAM531y+Apet/VZMAkRzzKMUzP5nYHr+FK+sF08pkADk45wlq5JngwV
 RfI7oZ4A36JCZk3dPFfZBYQNIbcCA9T8xbdOcww=
X-Google-Smtp-Source: ABdhPJxZyM9XR4dkt3Th1av02+hKXWdTEDeKLArtZSArZ9VmlfH/9nL8FQD2wm9sqsp98RmWGqGeCEL3t0iXpzQcitA=
X-Received: by 2002:a17:906:3109:b0:6cc:7a1:8db0 with SMTP id
 9-20020a170906310900b006cc07a18db0mr17752117ejx.266.1646117924908; Mon, 28
 Feb 2022 22:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20220225164231.904173-1-broonie@kernel.org>
 <CAJMQK-jGCX6Zp0gkfgqeA6=0zuWiSbWbytUixH3VFiwX9wtLNQ@mail.gmail.com>
 <CAPM=9tz0igKq1W3N_QseF97jqCY2Q9iSYwoFBVx2qJ8rWeVx-w@mail.gmail.com>
 <CAG3jFys+J1389TSADvR1jYOOQXig2thftfXKtgsGZLWkwA34bg@mail.gmail.com>
In-Reply-To: <CAG3jFys+J1389TSADvR1jYOOQXig2thftfXKtgsGZLWkwA34bg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 1 Mar 2022 16:58:35 +1000
Message-ID: <CAPM=9twxPqBtn=wog=g-0xgMgyCcmv2bq61mobh2zz1+J1SLXA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Robert Foss <robert.foss@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002c32e705d922b23d"
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Allen Chen <allen.chen@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000002c32e705d922b23d
Content-Type: text/plain; charset="UTF-8"

Yes, please do., sorry for HTML, stuck on tablet.

On Tue, 1 Mar 2022, 1:33 am Robert Foss, <robert.foss@linaro.org> wrote:

> > > >
> > > > Caused by commit
> > > >
> > > >   b5c84a9edcd418 ("drm/bridge: add it6505 driver")
> > > >
> > > > I have used the drm tree from yesterday instead.
> > >
> > > hi all,
> > >
> > > The following fix should be able to address the errors. Should it be
> > > squashed into b5c84a9edcd418 ("drm/bridge: add it6505 driver")?
> >
> > Can you send a patch with this to dri-devel? It's far too far down the
> > tree to sqaush anything at this point.
> >
>
> Patch submitted & reviewed.
>
> https://lore.kernel.org/all/20220228081421.1504213-1-hsinyi@chromium.org/
>
> Should I apply it drm-misc-next?
>

--0000000000002c32e705d922b23d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, please do., sorry for HTML, stuck on tablet.</div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, =
1 Mar 2022, 1:33 am Robert Foss, &lt;<a href=3D"mailto:robert.foss@linaro.o=
rg">robert.foss@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">&gt; &gt; &gt;<br>
&gt; &gt; &gt; Caused by commit<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0b5c84a9edcd418 (&quot;drm/bridge: add it6505 dri=
ver&quot;)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I have used the drm tree from yesterday instead.<br>
&gt; &gt;<br>
&gt; &gt; hi all,<br>
&gt; &gt;<br>
&gt; &gt; The following fix should be able to address the errors. Should it=
 be<br>
&gt; &gt; squashed into b5c84a9edcd418 (&quot;drm/bridge: add it6505 driver=
&quot;)?<br>
&gt;<br>
&gt; Can you send a patch with this to dri-devel? It&#39;s far too far down=
 the<br>
&gt; tree to sqaush anything at this point.<br>
&gt;<br>
<br>
Patch submitted &amp; reviewed.<br>
<br>
<a href=3D"https://lore.kernel.org/all/20220228081421.1504213-1-hsinyi@chro=
mium.org/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lore.ker=
nel.org/all/20220228081421.1504213-1-hsinyi@chromium.org/</a><br>
<br>
Should I apply it drm-misc-next?<br>
</blockquote></div>

--0000000000002c32e705d922b23d--
