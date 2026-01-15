Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD313D22ECA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212AD10E6CD;
	Thu, 15 Jan 2026 07:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iDFOIc5w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F9710E6CD
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:49:18 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-430f57cd471so361512f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 23:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768463357; x=1769068157; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GtxAoaTpJU6r++xlIpmAaAG/bZOXfH9n2gzVC3kL6Pc=;
 b=iDFOIc5w4Gs0aYprfSb2E015o8joezMVJBVkXtPl+uy2HLuG5ZKFU4NNEBk9gije5k
 WtkxsulIkNdaHS3ux1s5zNkC9BsnLX1E53BdJiPdlFCvVa63CJLlYLZxaZueBOQbaRMd
 UkxQTwYGui/P/Wn6KqP9zgfmFeRDnzSR8iwtRFILyXGsokYP1xGfFIC14H0B4y5lIplq
 CWSDMuTBPK05+wiRI8lTtoKUyHe5J6julnZccQRDfipyrGkJAXgn5ly8Kq9KN8Hq/Hzs
 /NEX9J0UkXsHYpmQsj2IZs+UkYne1c+bbjVE9bQEgnOdH5POqET5r0qfp0ChIp2SBbsf
 SK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768463357; x=1769068157;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GtxAoaTpJU6r++xlIpmAaAG/bZOXfH9n2gzVC3kL6Pc=;
 b=UFqfUUuyEhLGG8lGpiVTXVxVQPTDZwTJrz0xpfhV+6sIj+z5lFzLy4IxgGU8TaZy7s
 JFNghlflFcb2ddvvD7GIjkk7wCm79hA4VusthZDwmm2Wl3BbX91yJkCqK3OJr3F3/lSZ
 1dSGRKL4aVSGvEAoapoRX1B/8LbzeK5vC13mJtcm2tFo6jTg+e8YzQ/JqAYERJjRPeYe
 rbDPzqJImnZQhiNAn7kWed/Z5kfSMQDL1Uoig9QGQVSrRfrULi5dvP60Y/bhjdMTZeuT
 9FWMpG0AOzYP2VnGX5uKr0378qfDdCb8wjrMke7Mz4/N1F5Ht0hgcsKNs81JsFEuGSv9
 sNBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7TW+SsZ6iBwYmqk3kjAPXe31RMKv8txWpQxTuwoOexrYK6wuCm8UoEbfvlzPAQ/uLzcJgPWPvfr0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHjpKXgOil4eI5SGzV+N+fNNLWDBYsGcacpLs7f2lCaXNYTvoQ
 /MhwAasciSs6b7WBzxiQgfr46qChBj2PScIUTlIErv+OA2KATa2CFfS0rqaSs6xOZIoduK1PmdO
 MbhfHrZc4869JueZxLdeBG+odZ/v6vKU=
X-Gm-Gg: AY/fxX636tOArBWfCID9dNZJRXdVQjKCoWddcaHQLulYQqE3WZNRwZsNaaJYm63Ve3i
 QazvdGTYtUX7hBw59Slt8YaXaJVXmsoJsH5Bg6xW0ciAmrT5hmO8U7ZOmd6oBhTdJ9ad+aPh0+p
 7VLR/NC/ss2sOyT/gutFfRjOWRDQXp71aA2Ylq8W1wIJ/d1yMBv33eQyYYhI3y9vKu6xml0syXJ
 lYBPz2P8pjlEjY9G31RQry1cb1sNj08ZEvhWfLttx5Jzg5GVcY0NhdTd7/mwdZVWpxvx/gZ
X-Received: by 2002:a5d:5d86:0:b0:432:8504:b8a9 with SMTP id
 ffacd0b85a97d-4342c571e43mr6373650f8f.62.1768463356624; Wed, 14 Jan 2026
 23:49:16 -0800 (PST)
MIME-Version: 1.0
References: <20251204061703.5579-1-clamor95@gmail.com>
 <20251204061703.5579-3-clamor95@gmail.com>
 <7012249.lOV4Wx5bFT@senjougahara>
In-Reply-To: <7012249.lOV4Wx5bFT@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Jan 2026 09:49:05 +0200
X-Gm-Features: AZwV_Qi0zcbXk0tsiK_qJ_9rRb1cx2nEQ98pWwmRVMmkpOG8O8-PqPUPy2GYvG0
Message-ID: <CAPVz0n3JEHtUOq4qaZbqPu97NXdYxx_=5im4rxoEWi8EbKmKEw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4 RESEND] gpu/drm: tegra: dsi: move prepare function
 to the top of encoder enable
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

=D1=87=D1=82, 15 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 07:54 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, December 4, 2025 3:17=E2=80=AFPM Svyatoslav Ryhel wrote:
> > The tegra_dsi_prepare function performs hardware setup and should be
> > called before any register readings or there will be a risk of device
> > hangup on register access. To avoid this situation, tegra_dsi_prepare m=
ust
> > be called at the beginning of tegra_dsi_encoder_enable.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dsi.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> > index 278bf2c85524..8e80c7efe8b4 100644
> > --- a/drivers/gpu/drm/tegra/dsi.c
> > +++ b/drivers/gpu/drm/tegra/dsi.c
> > @@ -914,6 +914,12 @@ static void tegra_dsi_encoder_enable(struct drm_en=
coder *encoder)
> >       u32 value;
> >       int err;
> >
> > +     err =3D tegra_dsi_prepare(dsi);
> > +     if (err < 0) {
> > +             dev_err(dsi->dev, "failed to prepare: %d\n", err);
> > +             return;
> > +     }
> > +
> >       /* If the bootloader enabled DSI it needs to be disabled
> >        * in order for the panel initialization commands to be
> >        * properly sent.
> > @@ -923,12 +929,6 @@ static void tegra_dsi_encoder_enable(struct drm_en=
coder *encoder)
> >       if (value & DSI_POWER_CONTROL_ENABLE)
> >               tegra_dsi_disable(dsi);
> >
> > -     err =3D tegra_dsi_prepare(dsi);
> > -     if (err < 0) {
> > -             dev_err(dsi->dev, "failed to prepare: %d\n", err);
> > -             return;
> > -     }
> > -
> >       state =3D tegra_dsi_get_state(dsi);
> >
> >       tegra_dsi_set_timeout(dsi, state->bclk, state->vrefresh);
> >
>
> The section of code before the tegra_dsi_prepare call was removed in 'Rev=
ert "drm/tegra: dsi: Clear enable register if powered by bootloader"', so t=
his patch should no longer be necessary.
>
> Mikko
>

You are correct. I have found this when rebasing onto v6.18 which was
much later then this series was resent. Obviously, this patch would be
dropped on the next resend/v3. Sorry for inconvenience.

>
>
