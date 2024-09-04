Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 787CB96BA60
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 13:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399C510E76B;
	Wed,  4 Sep 2024 11:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vKYRNwCo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E34410E76C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 11:25:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E4E9DA43F48
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 11:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE212C4CEC8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 11:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725449134;
 bh=+KMQuQqQRGR0aY39TlGQZ7tL4nVD2u9TC1QpZBv2oMo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vKYRNwCo5aTWrDWigov72LRpz+0dAC1yKltddxd1Q7CLVXX4hQtfuhkwqW14asyfI
 kvT0I7yMENz9qmMGL38fRSUqtDlC0HKAZCfFfH/kOV3Nlk1V+lh0c2mxXsCk/eEWwa
 YXMH5tFSRUrqTAc51fLNAgryIY0gTQWvIyr3P/fWC9k51mDi9pCUc0BhODYxBYLKH4
 3IHLYqwKR2WzzhYBdddcdfeb4qjT4ncZOKABPnmmgFP21ZpFlhyo6m1PDjh4BCe6Ry
 GrCpjvmSU0MS1QU636zav7JN3lV3k3mHUWbsz+XhrPlaWSXTMkn6uPKf5rLJGW9Ju2
 Dh2m8SEXJia7w==
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e1d06c728b8so1408134276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 04:25:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUhxrUGwkDr0PSac+wvw5Oz1W/ekIRuZE+PHNe3XpHin+DvYM7EQ09FVVL6MG4BDoUWRJy6txKI1do=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKZLshBxcOmkEu4TUtBpDszr2C8gbbWdD3urIVxETAptTUYbcY
 HtLeauiwbS4+Sc3bEo+LPNdwYnemwyONrUowEpQldrxmxdUft0/AZNrPlEJVAL1xUN4kHk6oXyh
 3rZKMfA3mnycPkW9MB6VXZsLQuymVEiAnShxJeQ==
X-Google-Smtp-Source: AGHT+IEejZl+9S30Uc+ThJkEsWzJ8GWCDx7DoEI33JqK69Ah+TNODSU6WBUWh1C3XwAmt0bJBwA+1E9T/+gKO2LwN/E=
X-Received: by 2002:a05:6902:1b11:b0:e1d:13a3:87af with SMTP id
 3f1490d57ef6-e1d13a3892emr964315276.29.1725449134017; Wed, 04 Sep 2024
 04:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240904125206.6708daff@canb.auug.org.au>
 <87ikvbspun.fsf@intel.com>
In-Reply-To: <87ikvbspun.fsf@intel.com>
From: Robert Foss <rfoss@kernel.org>
Date: Wed, 4 Sep 2024 13:25:22 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4bQKoT6PsGAkFEsMY5UA3B4dRpSBvqDkUFKyM=dkOcXQ@mail.gmail.com>
Message-ID: <CAN6tsi4bQKoT6PsGAkFEsMY5UA3B4dRpSBvqDkUFKyM=dkOcXQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Marc Gonzalez <mgonzalez@freebox.fr>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: multipart/alternative; boundary="000000000000b639910621496e28"
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

--000000000000b639910621496e28
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 4, 2024, 11:58 Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Wed, 04 Sep 2024, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > After merging the drm-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > drivers/gpu/drm/bridge/ti-tdp158.c: In function 'tdp158_enable':
> > drivers/gpu/drm/bridge/ti-tdp158.c:31:9: error: implicit declaration of
> function 'gpiod_set_value_cansleep' [-Wimplicit-function-declaration]
> >    31 |         gpiod_set_value_cansleep(tdp158->enable, 1);
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/bridge/ti-tdp158.c: In function 'tdp158_probe':
> > drivers/gpu/drm/bridge/ti-tdp158.c:80:26: error: implicit declaration of
> function 'devm_gpiod_get_optional'; did you mean
> 'devm_regulator_get_optional'? [-Wimplicit-function-declaration]
> >    80 |         tdp158->enable = devm_gpiod_get_optional(dev, "enable",
> GPIOD_OUT_LOW);
> >       |                          ^~~~~~~~~~~~~~~~~~~~~~~
> >       |                          devm_regulator_get_optional
> > drivers/gpu/drm/bridge/ti-tdp158.c:80:65: error: 'GPIOD_OUT_LOW'
> undeclared (first use in this function)
> >    80 |         tdp158->enable = devm_gpiod_get_optional(dev, "enable",
> GPIOD_OUT_LOW);
> >       |
>  ^~~~~~~~~~~~~
> > drivers/gpu/drm/bridge/ti-tdp158.c:80:65: note: each undeclared
> identifier is reported only once for each function it appears in
> >
> > Caused by commit
> >
> >   a15710027afb ("drm/bridge: add support for TI TDP158")
> >
> > I have used the drm-misc tree from next-20240903 for today.
>
> Fixed by commit 532f0d109658 ("drm/bridge/tdp158: fix build failure") in
> drm-misc-next.
>

Thank you Jani

--000000000000b639910621496e28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Sep 4, 2024, 11:58 Jani Nikula &lt;<a href=3D"=
mailto:jani.nikula@linux.intel.com">jani.nikula@linux.intel.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Wed, 04 Sep 2024, Stephen Ro=
thwell &lt;<a href=3D"mailto:sfr@canb.auug.org.au" target=3D"_blank" rel=3D=
"noreferrer">sfr@canb.auug.org.au</a>&gt; wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; After merging the drm-misc tree, today&#39;s linux-next build (x86_64<=
br>
&gt; allmodconfig) failed like this:<br>
&gt;<br>
&gt; drivers/gpu/drm/bridge/ti-tdp158.c: In function &#39;tdp158_enable&#39=
;:<br>
&gt; drivers/gpu/drm/bridge/ti-tdp158.c:31:9: error: implicit declaration o=
f function &#39;gpiod_set_value_cansleep&#39; [-Wimplicit-function-declarat=
ion]<br>
&gt;=C2=A0 =C2=A0 31 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_value_can=
sleep(tdp158-&gt;enable, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~=
~~~~~~~~~~~~~~~<br>
&gt; drivers/gpu/drm/bridge/ti-tdp158.c: In function &#39;tdp158_probe&#39;=
:<br>
&gt; drivers/gpu/drm/bridge/ti-tdp158.c:80:26: error: implicit declaration =
of function &#39;devm_gpiod_get_optional&#39;; did you mean &#39;devm_regul=
ator_get_optional&#39;? [-Wimplicit-function-declaration]<br>
&gt;=C2=A0 =C2=A0 80 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tdp158-&gt;enable =
=3D devm_gpiod_get_optional(dev, &quot;enable&quot;, GPIOD_OUT_LOW);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 devm_regulator_get_optiona=
l<br>
&gt; drivers/gpu/drm/bridge/ti-tdp158.c:80:65: error: &#39;GPIOD_OUT_LOW&#3=
9; undeclared (first use in this function)<br>
&gt;=C2=A0 =C2=A0 80 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tdp158-&gt;enable =
=3D devm_gpiod_get_optional(dev, &quot;enable&quot;, GPIOD_OUT_LOW);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~<br>
&gt; drivers/gpu/drm/bridge/ti-tdp158.c:80:65: note: each undeclared identi=
fier is reported only once for each function it appears in<br>
&gt;<br>
&gt; Caused by commit<br>
&gt;<br>
&gt;=C2=A0 =C2=A0a15710027afb (&quot;drm/bridge: add support for TI TDP158&=
quot;)<br>
&gt;<br>
&gt; I have used the drm-misc tree from next-20240903 for today.<br>
<br>
Fixed by commit 532f0d109658 (&quot;drm/bridge/tdp158: fix build failure&qu=
ot;) in<br>
drm-misc-next.<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Thank you Jani</div></div>

--000000000000b639910621496e28--
