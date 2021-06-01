Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDB639755E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 16:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFB46EA76;
	Tue,  1 Jun 2021 14:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C616E10C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 10:01:50 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id k7so11227819ejv.12
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 03:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=60Kdajo/BKEdpmYUDsCGYGVgkz7HdEw6Jt5LKgGDZ+Y=;
 b=rggJ/NJj6tLFy8ZuA+tKrAKvIO9kxyd2uSFgRxgYsMo5jr0GlUx8AggaJgYNe51dBx
 Ny7oNE8RhXSl8h+Vi88PTW+i4JWtztI04Isltmd7XOo9Ad/OVphA5Wh9uhDbSlmpJXxp
 nlpZKbtzL0ZAUlka6FpI9rrM4R1/zDl9JpHAUm92zHdSRDn2QnI4MzOQt1avXRHIFV7p
 AvKvuxPmDviMggN/C3DhBk4/cdU7beOuKINFvK16d1BXogwyCLmB6vYMlOv4l3vcO2iy
 WaOYEKl/INy684O5YE7aQB7LQ9m5oeZH4qEkLhuYECAeXdsIB7C9VXA0T+DdUNaGzDSj
 pSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=60Kdajo/BKEdpmYUDsCGYGVgkz7HdEw6Jt5LKgGDZ+Y=;
 b=m/KaDXi5p+mMt7sLp7MdcJd91SKM60dJqj/Q/YT75Ilq7sxOAjMkn+WczCttnZfRu7
 Q6kognR/0yFpLVjHd+uGIXWBEd7py5eVNWzpJd+lKOZNtRQZ7upMUXxOoCJokOBEgDci
 D9sLjWmwo5TYJeMrfNcTWcz04WpdjAuyyBD+8yjvUX6e1exffCGGvGxhSf0SAuFaQH9k
 Vqnah2chy9Tq41Aj4JPoV0na/vcHuqXfNY4CjOtcgmVzivBET/aPSmDlsBgFqW8G0zaD
 kYDIMk/dOnCKZM9PUtwC/4+CbES3yUScZX2yPVDyTwsnKHB309ptO5aQeejnm+cFtxAG
 nCow==
X-Gm-Message-State: AOAM533w94DYICcsZ5cOZ8AgrknkWCM9K+VwbTQ/LBcNqvJGOWxWzAS/
 bpah0ea7B8pwCtThkdNq/K79weehXC8CbvFc3Iqi9w==
X-Google-Smtp-Source: ABdhPJxHdOPJhWhLABsUexCJTnW7WAsOGgduFBuEyhdzFLDjcZON6lkvHgNzf1kNzy4ZauJeZqqYlw1JdlVKeC8qRbs=
X-Received: by 2002:a17:906:5285:: with SMTP id
 c5mr27813952ejm.282.1622541708707; 
 Tue, 01 Jun 2021 03:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-10-maxime@cerno.tech>
 <813942f4864d87ef0b9c5dff98c23c919bdd88a9.camel@kernel.org>
In-Reply-To: <813942f4864d87ef0b9c5dff98c23c919bdd88a9.camel@kernel.org>
From: Dom Cobley <dom@raspberrypi.com>
Date: Tue, 1 Jun 2021 11:01:37 +0100
Message-ID: <CANUESCF8wpZzv4yEODk+J8gt2div=3Zsgt7S0yoPSb2XN=2RsQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] drm/vc4: hdmi: Remove firmware logic for MAI
 threshold setting
To: nicolas saenz julienne <nsaenz@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000002e5ef505c3b16e10"
X-Mailman-Approved-At: Tue, 01 Jun 2021 14:24:28 +0000
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
Cc: alsa-devel@alsa-project.org, Tim Gover <tim.gover@raspberrypi.com>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Dom Cobley <popcornmix@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000002e5ef505c3b16e10
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Jun 2021 at 09:52, nicolas saenz julienne <nsaenz@kernel.org>
wrote:

> What's to expect sound wise on older RPis?


I'd say 8 channel 48kHz is good. 2 channel 192KHz is good.
Higher than that and we start to lose samples in the HDMI MAI bus fifo.

The firmware workaround made 4 channel 192kHz somewhat more reliable, but
it would still fail when sdram was busy,
so I don't think it's worth maintaining that.

--0000000000002e5ef505c3b16e10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 1 Jun 2021 at 09:52, nicolas saen=
z julienne &lt;<a href=3D"mailto:nsaenz@kernel.org">nsaenz@kernel.org</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><span class=3D"gmail-im"></span>
What&#39;s to expect sound wise on older RPis?</blockquote><div>=C2=A0</div=
><div>I&#39;d say 8 channel 48kHz is good. 2 channel 192KHz is good.<br></d=
iv><div>Higher than that and we start to lose samples in the HDMI MAI bus f=
ifo.<br></div><div><br></div><div>The firmware workaround made 4 channel 19=
2kHz somewhat more reliable, but it would still fail when sdram was busy,</=
div><div>so I don&#39;t think it&#39;s worth maintaining that.<br></div><di=
v>=C2=A0</div><div>=C2=A0</div></div></div>

--0000000000002e5ef505c3b16e10--
