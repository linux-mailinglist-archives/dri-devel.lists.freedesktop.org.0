Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B004EAD7E64
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 00:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8607D10E1C2;
	Thu, 12 Jun 2025 22:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GeZVCphp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A880C10E1C2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 22:31:42 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-234d3261631so10953655ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 15:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749767500; x=1750372300;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dwyktbvIBKH1tMyMKD5NbLWHIgpp8+A1vniQwg1gUU0=;
 b=GeZVCphpgmY9w4dlc9goBUXXF7hlkeQiSqC/syvebn2b+Rc+OHKuZ/AVYySiU69dyb
 4Zg6bf0tA8qpzRs4XUPLhEjZDI7HJGAvcOQ/h69YT5/zRj07smOn9z5R4RENdhKV85+S
 8daBHXFjNr07XTupFAZi9o50Q17CPvdfvKp7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749767500; x=1750372300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dwyktbvIBKH1tMyMKD5NbLWHIgpp8+A1vniQwg1gUU0=;
 b=i5QLS/QRjLRDstfdYCtvyuhZlAt/4CP+L0YuSbXdYNYo7VogG4CoTtWU9ZJhIbms0/
 fSpA2Eo7lTRxDXHcv2ldzok3/QozQAz2g42axcvjwqUAxx4fNkof3VfiBLbzLxMRRNoW
 vkXYmOeGsMZT18/uS+fn/u7kegwj5mc+8XhJzfoy5RyMG8Dz1eemzZCINxEziY+JCkZS
 wyp+zizcr8QGO8yuwEV28q3n6dz3fWRRBjmFUqeYz5Qe8oKmI6JhixNuzwiByZCESpI2
 DH0K4rWdkDKmzsMlXqpNpzeYw/IL9NW8SYiV3Sao4/uNa/PbCL9sTkrNgzPDs6xBio39
 OImA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYs1mHwI0ynhZ5cp6UgCh8Wk17h+MtR2kyfFXRgnnsfWSyH27Q4Y02jj+06rwAgJ6xXqXGa640pCA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzSZx8GianCV3ahoLyifjnknlbDx77OimC+CE+lUgrake5RKk4
 GICpqtOthoFvnMfYHqYsV4uzsc7sKR1CKb3eFC04jIep1Avap0WdT1DJCMYi21RENCXQzsv/wYg
 TnZY=
X-Gm-Gg: ASbGncsajHaRwBVO2BDR2UWuwe1PHiI3hwaGK0Vd8mKYGpe1S4BG8Nc8JCLMf7n6W+K
 NCcGCjKzG3fqljw9fZ3SHfpO4x+5VS9mHH8VSJrgRR5qQgTJ9BXDTS1H6nSJ061eN/ufix8gmFj
 M4qhhWsB7PpTJem+NhgYPvmeERqEK5UQIhslrXmlq6lvcxECsqQJqbJLAFYGCpczuJo2+xl6oB6
 L7LG05qA8ehmixqgyykavP8B1wdTT0nJq9h0+wBfExVmDBY5Li+ASmoVD28c/WQp2Z6FcUSM2Ip
 L5NGQLAkl0tH8apHxa5XK4ud44nyLl4WPLwimbVjI9qB2QC9FqzbKW0DQeKrwAQ4a2leRYB4NQ8
 gF1AOW7ej3cg3zBDpKhTI/cBsTqG2B4h9eZ4lLbDS
X-Google-Smtp-Source: AGHT+IE60r44v21VAXVM6/jqpuWuabRrgyQ4UCBsF2lH5Apdnt//YBmMl0N8ut0O0aoKgC1Q0wN6kQ==
X-Received: by 2002:a17:903:2ac4:b0:235:91a:4d with SMTP id
 d9443c01a7336-2365d8c24f4mr10130895ad.23.1749767500066; 
 Thu, 12 Jun 2025 15:31:40 -0700 (PDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com.
 [209.85.214.172]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365de78292sm2288365ad.133.2025.06.12.15.31.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 15:31:38 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-22c33677183so13586255ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 15:31:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWgkSOPdiQcdt97G3aXQT+4ylIkuV0MVzHia0Se2NvNsz4t0dgzosbTnXQhO5gGHyBq5imBRIhe2OA=@lists.freedesktop.org
X-Received: by 2002:a17:902:7897:b0:235:f45f:ed2b with SMTP id
 d9443c01a7336-2365d8899b5mr7590235ad.1.1749767497346; Thu, 12 Jun 2025
 15:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250528132148.1087890-1-mwalle@kernel.org>
 <CAD=FV=WfV1Kr5hFSqf=t0OS3qFSGfQ3_+LQ-57nMKHXRSYvZ-w@mail.gmail.com>
 <9272e36e-e764-4007-9d9e-8e09b9c08d34@ti.com>
 <c0027ff0e63bcc0fd21aab37af991baf@kernel.org>
 <affbef6e-f253-4dbb-bf64-3cc7d244acbb@ti.com>
 <CAD=FV=W8RNcZvg5zgL1wDRmaH_eXrc79YQsMr9Be5HVtOWwwcw@mail.gmail.com>
In-Reply-To: <CAD=FV=W8RNcZvg5zgL1wDRmaH_eXrc79YQsMr9Be5HVtOWwwcw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Jun 2025 15:31:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTjEVfNtAOww1=UXbAknXNzWd0fcB5UMBEJrO2gt_hvg@mail.gmail.com>
X-Gm-Features: AX0GCFvUyoDVZ-yfWfDuQVyUKmfjzsNqfasYr_Z32aszeEmyUIEU-2Jt1vX3uuU
Message-ID: <CAD=FV=XTjEVfNtAOww1=UXbAknXNzWd0fcB5UMBEJrO2gt_hvg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: fix REFCLK setting
To: Jayesh Choudhary <j-choudhary@ti.com>, Lucas Stach <dev@lynxeye.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi,

On Thu, Jun 12, 2025 at 10:52=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Thu, Jun 12, 2025 at 12:35=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti=
.com> wrote:
> >
> > >> If refclk is described in devicetree node, then I see that
> > >> the driver modifies it in every resume call based solely on the
> > >> clock value in dts.
> > >
> > > Exactly. But that is racy with what the chip itself is doing. I.e.
> > > if you don't have that usleep() above, the chip will win the race
> > > and the refclk frequency setting will be set according to the
> > > external GPIOs (which is poorly described in the datasheet, btw),
> > > regardless what the linux driver is setting (because that I2C write
> > > happens too early).
> >
> > I am a little confused here.
> > Won't it be opposite?
> > If we have this delay here, GPIO will stabilize and set the register
> > accordingly?
> >
> > In the driver, I came across the case when we do not have refclk.
> > (My platform does have a refclk, I am just removing the property from
> > the dts node to check the affect of GPIO[3:1] in question because clock
> > is not a required property for the bridge as per the bindings)
> >
> > In the ti_sn65dsi86_probe(), before we read SN_DEVICE_ID_REGS,
> > when we go to resume(), we do not do enable_comms() that calls
> > ti_sn_bridge_set_refclk_freq() to set SN_DPPLL_SRC_REG.
> > I see that register read for SN_DEVICE_ID_REGS fails in that case.
> >
> > Adding this delay fixes that issue. This made me think that we need
> > the delay for GPIO to stabilize and set the refclk.
>
> FWIW, it's been on my plate for a while to delete the "no refclk"
> support. The chip is really hard to use properly without a refclk and
> I'm not at all convinced that the current code actually works properly
> without a refclk. I'm not aware of any current hardware working this
> way. I know we had some very early prototype hardware ages ago that
> tried it and we got it limping along at one point, but the driver
> looked _very_ different then. I believe someone on the lists once
> mentioned trying to do something without a refclk and it didn't work
> and I strongly encouraged them to add a refclk.

Actually, I may have to eat my words here. I double-checked the dts
and I see there's at least two mainline users
("meson-g12b-bananapi-cm4-mnt-reform2.dts" and
"/imx8mq-mnt-reform2.dts") that don't seem to be specifying a `refclk`
to `ti,sn65dsi86`.

Neil / Lucas: is that correct? ...and it actually works?

-Doug
