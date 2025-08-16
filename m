Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B720B28E86
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 16:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF2C10E37F;
	Sat, 16 Aug 2025 14:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Abkg/rLO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CBE10E37F
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 14:40:38 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3b9dc5cd4cbso1995892f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 07:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755355237; x=1755960037; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bEVp2bSntnyTwfVfXWziCxVIcG52kRRMrwRWIVBmE4c=;
 b=Abkg/rLOWYSAB2uC8OssOBdW7v6FNMlarulU/6rLvikY/hh9qsPXGXIM/1csX/kF1/
 xmfYhh2pqX+qF/CuidiHVFoJx3HWbDmKKPT1ggF5EpZGOxmpG7q+3ftThsubEYB1zPvY
 PpTrGlk+4S1tG7gTnrCoEj7vjVedKiW8IOuPgwiN/xyDtGUXJHQxTdeMY8kYdFw1YeTB
 TfVdJ1x3vXTMctSfV3N80ZctLYjgmAMQsnqrVS5qaejaOr32FvXN15cmdPfMa7KOwBD8
 j9tG8vuOXxeXdHXuDX/BXbwLgsejqHdpRzXKolqe7ni2uB/IifnccQreCRsA5XQAcJZf
 C94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755355237; x=1755960037;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bEVp2bSntnyTwfVfXWziCxVIcG52kRRMrwRWIVBmE4c=;
 b=YgDqNy6LTYN6XCtPLdlZiDmnSpmrnK4Er5UsSL0+py4GB8RdcERQwmFQRiLbTOemBG
 xsMcqAJBM7FXaFYNKGycTvMR9Msgw/DL2rH6QFJv6yGpnt7Bkx8oR8qAShzL3GYWAImK
 osPlfqfxAAL/Jm7LW4Z2w/aA/ab9HqknB5PNbdL0eWUZZGuzIvHFEUO7fzf5gs3B9/nP
 tpJF0i2ECbhfyokv29qgmxlQMefq6SwMrbWE6wMje8fQveyvgyHt9MirsErOMkA9QytA
 /gdz2D8hJwkTFkWWwNVEgdoVDDPkTcFGl4xBPTOUASTckcIIMYKch/k4dNOaOAL7fsoH
 kDrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/mTBIijvCCamk3iw2U28eFLX/5yzSi9j7iywqjxw104v7kS6KAwZaRS3wpYKDvSvUD8Ee2t081l8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzG2Z1mn7ZtI/TkfuSXt/M3bkutEWMhApVqqmDFj9f+37bFLoI9
 qpL0foBoqK7aDiXv89gDy4e4dRX78WFXnpKFA4+WCo1IDXHV4E93K6eOO1AYx6n8XvxjCEKtXWG
 AV22S0zbvJMwz9E/E6ler54y5JjqCeTg=
X-Gm-Gg: ASbGnct5bypENjGD8Q0I1tienj/9Icxgfrjh98x594QAcltHBptecXKz80QYDm2ZRzq
 clx9LhKSiN0nPKPnXIL5W0vIJQVQMvBlCafUGcci3b3Ujlbmgyuf1foSUg5RQXCn6CDJX3mgNnh
 7cJZ1TWtLbrouERFIg9Q7Ioe3sGRYS4lzCQYV3J4gNSxm6xQu2RVXjUx29TUCF1uTJRBywf36Kx
 8Zmd4U2
X-Google-Smtp-Source: AGHT+IHp35MrDWaLiZzp4YV5fNDq6L616Ev7qDE+6xfiG5+5888/Lv+BZqWqm33wVOprQZ+ZwPVE4XHRuiLA4qvBTeo=
X-Received: by 2002:a5d:5f89:0:b0:3b7:78c8:9392 with SMTP id
 ffacd0b85a97d-3bb67007abbmr4800366f8f.19.1755355236622; Sat, 16 Aug 2025
 07:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250717142139.57621-1-clamor95@gmail.com>
 <20250717142139.57621-4-clamor95@gmail.com>
 <83755868-09b3-4bd1-8b40-0a4b9f497d2f@gmail.com>
In-Reply-To: <83755868-09b3-4bd1-8b40-0a4b9f497d2f@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 16 Aug 2025 17:40:25 +0300
X-Gm-Features: Ac12FXzzNUQYc36G3RYOi-Qo11V4GYr7RUJ5Mk2svpoCrcavmPcInJckclXVTds
Message-ID: <CAPVz0n053GB+igaEVkUT-cnbLxyom6fma-C+-DhRzDtxnfdQ1g@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI
 calibration logic
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000556852063c7c7db5"
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

--000000000000556852063c7c7db5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 16 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 17:3=
7 Dmitry Osipenko <digetx@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:

> 17.07.2025 17:21, Svyatoslav Ryhel =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > @@ -525,6 +599,14 @@ static int tegra_mipi_probe(struct platform_device
> *pdev)
> >               return PTR_ERR(mipi->clk);
> >       }
> >
> > +     if (mipi->soc->dsi_v0) {
> > +             mipi->csi_clk =3D devm_clk_get_prepared(&pdev->dev, "csi"=
);
> > +             if (IS_ERR(mipi->csi_clk)) {
>
> Doesn't look like the clock needs to be prepared. Normally, you would
> need to have clock prepared if clock is enabled/disabled from a context
> that can't sleep, like under spinlock or in IRQ handler. AFAICT, this
> not the case here.
>
> Thank you, I will take thin into account.

--000000000000556852063c7c7db5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">=D1=81=D0=B1, 16 =D1=81=D0=B5=D1=80=D0=BF=
. 2025=E2=80=AF=D1=80. =D0=BE 17:37 Dmitry Osipenko &lt;<a href=3D"mailto:d=
igetx@gmail.com">digetx@gmail.com</a>&gt; =D0=BF=D0=B8=D1=88=D0=B5:</div><d=
iv class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">17.07.2025 17:21, Svyatoslav Ryhel =D0=BF=D0=B8=D1=88=
=D0=B5=D1=82:<br>
&gt; @@ -525,6 +599,14 @@ static int tegra_mipi_probe(struct platform_devic=
e *pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(m=
ipi-&gt;clk);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (mipi-&gt;soc-&gt;dsi_v0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mipi-&gt;csi_clk =3D =
devm_clk_get_prepared(&amp;pdev-&gt;dev, &quot;csi&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(mipi-&gt;c=
si_clk)) {<br>
<br>
Doesn&#39;t look like the clock needs to be prepared. Normally, you would<b=
r>
need to have clock prepared if clock is enabled/disabled from a context<br>
that can&#39;t sleep, like under spinlock or in IRQ handler. AFAICT, this<b=
r>
not the case here.<br>
<br></blockquote><div>Thank you, I will take thin into account.</div></div>=
</div>

--000000000000556852063c7c7db5--
