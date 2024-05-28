Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FF78D1F83
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 17:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C1210E33C;
	Tue, 28 May 2024 15:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="onedG0Hi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3196F10E3D5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 15:02:47 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-62a083d7ee9so8078657b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 08:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716908566; x=1717513366; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z++uhhvIB2oDHAa6QHEw7J8dkFtocwFpzuVPNehNXnk=;
 b=onedG0HiQZ4fzIdPGdMucYGeWx8EV5RB0byGSpA1cyJLMJR8SxwDLNn/SoIBRyljhA
 4703s23ocAOQhgG0LW8EFkcu8rKHXCV86HV4bwV86z4861FEG4wv/1xP45N4Svkc8yG4
 q4s12m5oCtRIBVA56C3GLtDcMEItqvuAEWzIyOnzf4JAHx5O1kt4aA+yuyVMzZn6XEF8
 y/SC3892NeCS1KKqZgQ7KiA5kC0MIqRFQr8ub3BniIQ4WCZcOzuoGKB6X8y0hcNk2naK
 eCSPxLyMunvhUpCoC/xvK2FUF2Z6disRfgFArZMis1c8xxx8LXqiPceHth67njYnX23J
 0dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716908566; x=1717513366;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z++uhhvIB2oDHAa6QHEw7J8dkFtocwFpzuVPNehNXnk=;
 b=SgtCMFZ9NxZyipDsBJZ1x/cWNz0Nfmac3Wa4z4I/SCj+bTcOYeLeDcC3+DLEi/iH83
 8vJbSQJd2T2FZT30s/fDU1nRHaezfEV6k0u0024aYKOrLK10f0jpiZgSwqcpvWIxuWYf
 ObTe+WNj5U/KeKSRHYQWKdDJfh/vXQoqxSIMYcRmYCHn6rXtVYoGrfI8Sj0+0K7sym12
 V4p0We8AnWsecjgD+JN9ULR61nTL/q3+GWEzfbZfn2efm62GT+fSY1NzxfohoFJVx/+t
 WaHmXkKBGxbLyXZwmxqjQRHjE03GOEevxWBobv4A4fV6tkvt4baH+Tclz/f70AfEFbL0
 Swog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaBsJUe4SKb7AihXLFP1h3demBtnoEgt8B+RSOxJrSl0pwzGcCd/GejRqf3QytO8Y+Jnz8ZjcSYrk0vdLbv2Go1WIZG05jHnKLZocHTl3a
X-Gm-Message-State: AOJu0YwuQqMEJTDbS12vHSgYeQe1EIZ0i0wHkgHFxTerRi45qIMlDcWc
 vSguVgNYmaL/EUQUCZ9siDzeslhHdAzMbAn2oFHMYjMAD2h1NctYJBpYRi3LBBNEMpCvrmYEGZm
 1NCaq0wekA1p72PJgPBsAbrHoa2a67wuBMnkULQ==
X-Google-Smtp-Source: AGHT+IGP1znZ3LDpAzmQtOKli77ftgpKpvGh++LuRA4lLhU3jCZJJbgZDa3scINgUvUv9bv+tUK4rihdTfM+OChzfh8=
X-Received: by 2002:a05:6902:2489:b0:df4:8147:4e19 with SMTP id
 3f1490d57ef6-df77226363bmr15382555276.62.1716908566001; Tue, 28 May 2024
 08:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <d3de652f-ce89-4f57-b900-07b11f8bf8f9@free.fr>
 <20240528-potoo-of-pragmatic-tempering-df08f1@houat>
 <0cd0136a-bbaf-482f-8e81-a858a6cdce2e@freebox.fr>
 <20240528-prophetic-masterful-hyrax-563f82@houat>
 <3tiuyvc2bg3d3wz3eqrou3ngkpb3h5gamtocv74bfkkqty4qag@it5publzvl5z>
 <20240528-placid-eccentric-axolotl-cc9fdc@houat>
In-Reply-To: <20240528-placid-eccentric-axolotl-cc9fdc@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 18:02:34 +0300
Message-ID: <CAA8EJprNNovVPDmeJNCNi3c4F2-Bnh=Y1ZbiDEw6DtFs8w1pKQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bridge: simple-bridge: Add support for TI TDP158
To: Maxime Ripard <mripard@kernel.org>
Cc: Arnaud Vrac <avrac@freebox.fr>, Marc Gonzalez <marc.w.gonzalez@free.fr>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, DRI <dri-devel@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 28 May 2024 at 18:00, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, May 28, 2024 at 04:50:10PM GMT, Dmitry Baryshkov wrote:
> > On Tue, May 28, 2024 at 11:17:56AM +0200, Maxime Ripard wrote:
> > > On Tue, May 28, 2024 at 10:05:50AM GMT, Arnaud Vrac wrote:
> > > > On 28/05/2024 09:43, Maxime Ripard wrote:
> > > > > Hi,
> > > > >
> > > > > On Mon, May 27, 2024 at 06:03:56PM GMT, Marc Gonzalez wrote:
> > > > > > From: Arnaud Vrac <avrac@freebox.fr>
> > > > > >
> > > > > > The TI TDP158 is an AC-Coupled HDMI signal to TMDS Redriver supporting
> > > > > > DVI 1.0 and HDMI 1.4b and 2.0b output signals.
> > > > > >
> > > > > > Since it's an I2C-programmable bridge, it could have a proper driver,
> > > > > > but the default settings work fine, thus simple bridge is sufficient.
> > > > >
> > > > > No it doesn't. That bridge supports HDMI 2.0 which means you'll need to
> > > > > change the TMDS clock ratio when programming a TMDS character rate
> > > > > higher than 340MHz. And you'll need hotplug support to deal with it
> > > > > properly too.
> > > > >
> > > > > So sorry, you need a real driver there.
> > > >
> > > > Hello, this is an HDMI redriver, which simply cleans up the HDMI
> > > > signal, so no programming is needed to support HDMI 2.0.
> > >
> > > I mean, if I'm to trust the datasheet, it is more complicated than that.
> > > It snoops the DDC bus so it can update the TMDS clock ratio bit if it's
> > > sent on its input side, but that wouldn't happen with DP for example.
> >
> > If I understand correctly, this chip can work in two modes: dummy and
> > I2C-programmed. In the former case it is fully transparent, including
> > HPD passthrough, it doesn't require any additional programming, just
> > Vcc, Vdd and pin straps, etc.  And the second mode is a 'brainy' one,
> > when the chip is fully controlled over I2C.
>
> Right, and like I said, the situation is more complicated than "it just
> does passthrough" like simple-bridge does.
>
> > From the Linux standpoint these two modes will use single compat string,
> > but two distinct drivers: for the former mode is is enough to use
> > simple-bridge (fixed to support two supplies), while the latter one
> > needs a proper I2C driver.
> >
> > Does that solve your concern?
>
> We need to be careful here: if there's two drivers with the same
> compatible and bus, both will be probed.

I was thinking about i2c_driver and platform_driver, so there should
have been no conflict. But Arnaud wrote on IRC that on this device the
bridge is connected over I2C. This rules out simple-bridge anyway.

> So we need to take it into
> account when designing the binding.
>
> Maxime



-- 
With best wishes
Dmitry
