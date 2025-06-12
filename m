Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFA5AD797A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 19:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD9B10E074;
	Thu, 12 Jun 2025 17:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Q+JsJoRL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6C110E0B1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 17:58:54 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-735b2699d5dso693879a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 10:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749751133; x=1750355933;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=clnvPnA+08sAa8soPFxCY8o8wyfr/+hfTXH3Dbn55uQ=;
 b=Q+JsJoRLGmBYmMqeKMGKf406UQRA/fba7gMqBaNhxoj2OH9zxX1XGPqSIUExfBEHrk
 Y8EyCMJpVJrfItIOfqAXJEGo8cExN08inTGLoOItbPQUEHVuF5R6sY0/CYHI5wNTEARS
 RY2BuTaq/LQh3pJVCyX/WMUvC3aI3I/66t+kM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749751133; x=1750355933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=clnvPnA+08sAa8soPFxCY8o8wyfr/+hfTXH3Dbn55uQ=;
 b=s/5uP9lNReVs6WkD4gaY/E06WzHV/Z33d6wATX+tv7qIOcMZ5hmPfqg++caRE76dIz
 M6HCQzPe64vMoqIzJloJ+IP6j0CTs7wRI8A1U1zKelkQdQaZAWjFEDUztck7bF3afpng
 C1hOwwaNOCZmrhUdz4RVeH8KgbgJX0frqSvigOzP7OvODJ8PsDztummtf8BQbqKjFLIn
 PZXgP0R3fCTWOFuUYZTEzNVYaPdzBPGy4pZUmNqQFzO58RAXJe39yGtvnw6afD3/SLKI
 cLJPTZrLmx6scI/vr3mRpLDjK11R57E7W5DO26FsHoNBnhgrChtGBnhEvLWgitRJzt0p
 VzIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoRATui8MZE+5PVeZ8yuPn3pE2IzyURTqWv6ma48tWA5nQFLHw1f8Dnn8a2aDk0jDdT1vbJvhGRV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAHJzaTiWjoajXxIfOcYnmCJBe57uwGyqwTkVXhuxnCAlo/sr4
 2C1ncOh97tS55ZIXddxI9FOJXBmTGZAWeVx0mHW9e4MtjKIrRR9Rop9C60xDvfRLROEwpslvAqB
 5PbE=
X-Gm-Gg: ASbGnctZbbR5eFz0RA96oqKqeH+D4DxjIRjQiTsMVPYCZ8YhVvDcRj4iQj36PHxcBnc
 qjDwH9NTsECJkesYais8dmEruGUoExT9xFJRmI5rb7NK5V7/7de53oGEq55h+Uwrk9jBQIUz4Cz
 VYiP+YyjCTYPhbT+WHQ8Cb39RbhHZeth31UV1BkV48Tv43mi2kQGU01M/Dgq3vDM2bmM6e2gtHy
 pt6azdr/4289rjQg14Ej7VJLLP0ptk8WFLxB7qRsVUObRMeYri5njHznjhjDlOxOzcMnIvXQwx2
 t7BxeLj+60H7CDGuNM6q0vk7IqgVdJOB48SGPHdyu2sMD+vhERjkoUys5pYXNy9BHVmNCK6rX4P
 fRkwM6nvkwk/hM4YDyojzkdeLVg==
X-Google-Smtp-Source: AGHT+IFb4TFwpC0x4MQToR7/itiapHtJfnQ/rXwDSA7RI2KWl0AQRXKIjezdoic7m3nJzy3Ud1xBZg==
X-Received: by 2002:a05:6830:2815:b0:72b:9506:8db0 with SMTP id
 46e09a7af769-73a24c91bd7mr557236a34.12.1749751132901; 
 Thu, 12 Jun 2025 10:58:52 -0700 (PDT)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com.
 [209.85.161.48]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-73a16a269besm352002a34.2.2025.06.12.10.58.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 10:58:52 -0700 (PDT)
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-60ef07eb7f4so663709eaf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 10:58:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWz/JlG966rE2K56XMu0SAc9KbBHRoHS2HXOlSlTl5uyTv+CyG01P7AVkCZDlY2tBl+GJn32MibXI8=@lists.freedesktop.org
X-Received: by 2002:a17:90b:4cca:b0:312:1d2d:18e1 with SMTP id
 98e67ed59e1d1-313d9eaec5cmr99658a91.22.1749750753525; Thu, 12 Jun 2025
 10:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250528132148.1087890-1-mwalle@kernel.org>
 <CAD=FV=WfV1Kr5hFSqf=t0OS3qFSGfQ3_+LQ-57nMKHXRSYvZ-w@mail.gmail.com>
 <9272e36e-e764-4007-9d9e-8e09b9c08d34@ti.com>
 <c0027ff0e63bcc0fd21aab37af991baf@kernel.org>
 <affbef6e-f253-4dbb-bf64-3cc7d244acbb@ti.com>
In-Reply-To: <affbef6e-f253-4dbb-bf64-3cc7d244acbb@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Jun 2025 10:52:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W8RNcZvg5zgL1wDRmaH_eXrc79YQsMr9Be5HVtOWwwcw@mail.gmail.com>
X-Gm-Features: AX0GCFtU6lZ0xHaIRefuKnlMqTPtRQEV5sBzejA1hcWYrlDz4Mnrn_vwiO-dslY
Message-ID: <CAD=FV=W8RNcZvg5zgL1wDRmaH_eXrc79YQsMr9Be5HVtOWwwcw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: fix REFCLK setting
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: Michael Walle <mwalle@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
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

On Thu, Jun 12, 2025 at 12:35=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.c=
om> wrote:
>
> >> If refclk is described in devicetree node, then I see that
> >> the driver modifies it in every resume call based solely on the
> >> clock value in dts.
> >
> > Exactly. But that is racy with what the chip itself is doing. I.e.
> > if you don't have that usleep() above, the chip will win the race
> > and the refclk frequency setting will be set according to the
> > external GPIOs (which is poorly described in the datasheet, btw),
> > regardless what the linux driver is setting (because that I2C write
> > happens too early).
>
> I am a little confused here.
> Won't it be opposite?
> If we have this delay here, GPIO will stabilize and set the register
> accordingly?
>
> In the driver, I came across the case when we do not have refclk.
> (My platform does have a refclk, I am just removing the property from
> the dts node to check the affect of GPIO[3:1] in question because clock
> is not a required property for the bridge as per the bindings)
>
> In the ti_sn65dsi86_probe(), before we read SN_DEVICE_ID_REGS,
> when we go to resume(), we do not do enable_comms() that calls
> ti_sn_bridge_set_refclk_freq() to set SN_DPPLL_SRC_REG.
> I see that register read for SN_DEVICE_ID_REGS fails in that case.
>
> Adding this delay fixes that issue. This made me think that we need
> the delay for GPIO to stabilize and set the refclk.

FWIW, it's been on my plate for a while to delete the "no refclk"
support. The chip is really hard to use properly without a refclk and
I'm not at all convinced that the current code actually works properly
without a refclk. I'm not aware of any current hardware working this
way. I know we had some very early prototype hardware ages ago that
tried it and we got it limping along at one point, but the driver
looked _very_ different then. I believe someone on the lists once
mentioned trying to do something without a refclk and it didn't work
and I strongly encouraged them to add a refclk.

-Doug
