Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CC3B2AD1B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 17:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CFB10E4A6;
	Mon, 18 Aug 2025 15:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XB6y5Z77";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9C510E492
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 15:46:03 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2445824dc27so38743755ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755531963; x=1756136763;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rL4a5MAx53SYD7+WOx5HJxIWAtu+xXDJ6eJQwEroQJM=;
 b=XB6y5Z775iH4STtWbv66LWTTTZpjZMzWpaa4f4BWAEg/w0zibcBxZhDcObmu9E9GjA
 10kKtZjMz0EhvpjhsfOx1ga6/Pnoe7ExiQ7kAd33bhq/atYRnz9emydoYdU81FPnVgwp
 NfVAkcbThbmVOPJ83pqu0rLh2RUWh9dhwrEpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755531963; x=1756136763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rL4a5MAx53SYD7+WOx5HJxIWAtu+xXDJ6eJQwEroQJM=;
 b=g8cr0uVajr1QuEghXw7c3tVI4V50tzSvBIksA7CrYDLATf0IBijCn7FS+v7hM1YK5d
 5BXRsadrqwt67k+elNJLjxacFUot/xgo1JxsxInfCpdszn3jwADszqcclnP1AphwQ21/
 5cq+yBEJKucbpvRdhcgJRuDwBLRf/PQ3vYv6D8hM8WFSE662Hdua+Y3euPFs2paae690
 SACHq+zrTu35yNVL+PjBucn9IokwHK4IpEAMIrIDARUZJ2SBstTJcdVYAm8J0cp6CdIs
 CATt2ET7kAfGWnUYFs5LDxd/LABRgYXYJUtL6C+r0CegYB3w1602BAW/BAkKRzWDA0YI
 TcjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLW3++caeniYxhRNOGlNLT6JIJ4C+VA6zf36bQE0RuRqhBUBUEpAwp6ZqmI821lfCxRkvzB7ELf0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSOeIZxQTC/uhR9ismHOdpVGIR/x2dkXtX+aC2nQASbNi2lbG9
 cX+3uprjKLpQSxvGbPDYaGw//6BsHqH0Uu/zjo889pIPVEu7O832WTzKVU+bt/wHVxAvV5AYsEr
 T5xg=
X-Gm-Gg: ASbGncuS/T3dhQfdZ+5SsexfYdcCwViQFvd3UIlWbJ4AmqG8/BfgZ+5eUa+FRS/hkJn
 /AHX+OQOY7rEeaQQvUXemvhGSQpIpAij37MSXFSY8U52tN1MFWVFNfurDscb6RTG8ykaUyqz/oF
 yyE8yQEUFCBL0U1uuIxB50wTDYzhMXR+6nyzoNGhHPfLlWDWbFD03ljjPaLB3i/u1hF+InYbqvB
 zcQylBsUDyyJMMKMSz9GKElUS0UyxpdKpxXd9t3Bnl8ji8JMUfRr6JjPAtoOCw9QAInffDBJI8L
 buY4oUX+THfOrm+Gmuitl9aYBqq2JxAHX8NrDfLkTqhseYEE2oQ+QMcFFYxJ6cv9hZu8vt2g2Xu
 oUBpwwZ4uy7hx4/gNPLv0TcBy1XXt+BL8hpavLJYbQKuLgi2BmKeOuqNTSwfyLo8Kql83OzNnB1
 PN
X-Google-Smtp-Source: AGHT+IE14S7wMor5i25w7TPi1ATMxs8wfzLJs3DJuKgie5l3o1DZIsEVGutE/6Y5wujhdMGjnP0Xyw==
X-Received: by 2002:a17:903:1b6d:b0:242:9bc5:31a1 with SMTP id
 d9443c01a7336-244790079d7mr116845585ad.57.1755531963000; 
 Mon, 18 Aug 2025 08:46:03 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com.
 [209.85.215.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446cb0dc22sm84260135ad.66.2025.08.18.08.46.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 08:46:02 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b4716fa7706so2955234a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 08:46:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVaEEeAwIfAo7K5RIHYw7SYwG0EV3+nofTcQSbHQWlYxvkYvNtBChF/0f/A+5MdLMwAz+GEqJIU21s=@lists.freedesktop.org
X-Received: by 2002:a17:903:22cc:b0:234:8a4a:adad with SMTP id
 d9443c01a7336-24478f71be3mr130935345ad.26.1755531961668; Mon, 18 Aug 2025
 08:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250813125132.1319482-1-treapking@chromium.org>
 <20250813125132.1319482-2-treapking@chromium.org>
 <CAD=FV=XmMwocA_oZVi2OS2Z4+5LBT4BXZE2C1mx1U-Tcs+5SOg@mail.gmail.com>
 <CAEXTbpcTJVCqR-NAfddd2H9oLUitcUi3XnX1GQf7hA06-Vx9UQ@mail.gmail.com>
In-Reply-To: <CAEXTbpcTJVCqR-NAfddd2H9oLUitcUi3XnX1GQf7hA06-Vx9UQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Aug 2025 08:45:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UV8_XGmxC=7Z18PEnj6wKz+yZQuV_4h+LJh_MNCqszvg@mail.gmail.com>
X-Gm-Features: Ac12FXw4q2jsZWPukvpps6uXMC47W9riQkJS9EcpIvFu79iTZtix4Q66btupXkE
Message-ID: <CAD=FV=UV8_XGmxC=7Z18PEnj6wKz+yZQuV_4h+LJh_MNCqszvg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: Make elan touch controllers power on after
 panel is enabled
To: Pin-yen Lin <treapking@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Chen-Yu Tsai <wenst@chromium.org>
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

On Mon, Aug 18, 2025 at 4:49=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Hi Doug,
>
> On Fri, Aug 15, 2025 at 8:27=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Wed, Aug 13, 2025 at 5:51=E2=80=AFAM Pin-yen Lin <treapking@chromium=
.org> wrote:
> > >
> > > Introduce a new HID quirk to indicate that this device has to be enab=
led
> > > after the panel's backlight is enabled, and update the driver data fo=
r
> > > the elan devices to enable this quirk. This cannot be a I2C HID quirk
> > > because the kernel needs to acknowledge this before powering up the
> > > device and read the VID/PID. When this quirk is enabled, register
> > > .panel_enabled()/.panel_disabling() instead for the panel follower.
> > >
> > > Also rename the *panel_prepare* functions into *panel_follower* becau=
se
> > > they could be called in other situations now.
> > >
> > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > >
> > > ---
> > >
> > > Changes in v2:
> > > - Rename *panel_prepare* functions to *panel_follower*
> > > - Replace after_panel_enabled flag with enabled/disabling callbacks
> > >
> > >  drivers/hid/i2c-hid/i2c-hid-core.c    | 46 ++++++++++++++++---------=
--
> > >  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 11 ++++++-
> > >  include/linux/hid.h                   |  2 ++
> > >  3 files changed, 40 insertions(+), 19 deletions(-)
> >
> > This seems reasonable to me.
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > Given that this affects devices that we already had support for
> > (you're changing the behavior of two touchscreens), should it have a
> > Fixes tag?
>
> I'll add Fixes tags in the next version.
> >
> > We'll also need to figure out a process for landing the two patches. I
> > can easily land the first one in drm-misc-next, but then it'll be a
> > while before the i2c-hid one can land. Is it OK to wait?
>
> I'm okay with waiting for the next release for i2c-hid patch to land.
> Or should will ask the HID maintainers to ack this patch?

I'll also respond on the v3, but probably the easiest is just:

* I won't wait for a response for the HID maintainers before landing
patch #1 into drm-misc.

* If HID maintainers don't want to Ack the patch for landing through
drm-misc, we'll just pause landing of patch #2 until things percolate
to mainline.

-Doug
