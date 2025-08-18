Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F53FB2A0B8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 13:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8517710E03F;
	Mon, 18 Aug 2025 11:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aXQwlM6O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E2210E03F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 11:49:23 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-74381dddc44so1928414a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 04:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755517763; x=1756122563;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qBkXPQV0cttwpZ/Oqv6+Tt8UJNgRpyr0OqG6N5z1tUw=;
 b=aXQwlM6OxTIXA3jbgSBVUhHIRxe5htnCpTHYMTV45t7UUhdG0E23cMByLn/7NHl3Gx
 +XORT1xCN500fHX+l6gnZq3FlJ04r25wUrpjfcxDacZBDTIL2gQHZgp5G7AWtrOAMrlZ
 sX4iU/xKGuj1b6xOzZvFJfXeh4B/yH8IkUHmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755517763; x=1756122563;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qBkXPQV0cttwpZ/Oqv6+Tt8UJNgRpyr0OqG6N5z1tUw=;
 b=Jf5Ql2yPar/2xs+UGGxWO/+rsH5/XD2xsOaYQDnYKnc1KBRsNfkLJBKxLd4iLL6yob
 E6uFDBmbEy1AHyg0sBax4yQGYPGIu86B72KmeEB4BKiy83Lnmj1c46p5C0JATi0g78KP
 wyzaoFmblURVwKOGyTX3V4DVJc6zpVd4QjRjWnhw8fhHSj2XCCsGfxuzViF72ueDsJjX
 1lSUSejCLCA4KFoua6lvtty+srvJR/VtXXCYlGajtcFxqMvJINWMtQ7B8B6Yb1ZsuRGH
 qPWzsviIn3NpkBcLrXLm0HirWqPSK797Vsb3JVSItdXd2t+hfsLziKqvkymylBPfpmqM
 FO9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbuUZ/i7W6FuU6kH2DeoaxfzdC25UMmLQ1bSV+EfVSWY+e1gzGglYcH6sdmE3R30lRSeGr7k20p/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxu+jSZYDT/BcYOxKXO8K9Y9JV3pO78dLG8rXcjyaxFYHm7oZ98
 wUKrWsdj72yURJRiYgQ5ZAXGwMnZ0lcqIJnHdDsiQ4pLtpbzjzQiDWCzU6s65pfivQaG7vM/41R
 whINA+ZiKna+hSE0U7dGpbKyp+BXqRKAZ1qp+Jesu
X-Gm-Gg: ASbGncvWw1DQNa+26Kdns5zrr3mJoIHn4pgcewkZmtCnwAhO6+sfVvrx4Kt5RYGahIy
 e6qvOx5DZ4onKLXEDgpkZUuJKEuiLnW6akqTz38LaZO7towveJqZtpWycH++pEzTQox/4T4RmE1
 gUIooOl9tkz113cew2hcxzLBv4WXLUEUT0YqQTxb+IY7yswMQBc15Y4z8gGqJ8DK51raLbXPURC
 DNRQLGi5QG+gbsn6eZo2EhP6u2qNrdOlhQ=
X-Google-Smtp-Source: AGHT+IGOrevAZMdMR35TQYz9V0RYWV6O5lZuferONAOF8A4s0GktGz1sklzFdvoHdRv/jUxqbIMnIRsYVj7HAlGNmY4=
X-Received: by 2002:a05:6830:1d4:b0:742:bcc6:b9 with SMTP id
 46e09a7af769-74392435e1cmr6007985a34.15.1755517763065; Mon, 18 Aug 2025
 04:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250813125132.1319482-1-treapking@chromium.org>
 <20250813125132.1319482-2-treapking@chromium.org>
 <CAD=FV=XmMwocA_oZVi2OS2Z4+5LBT4BXZE2C1mx1U-Tcs+5SOg@mail.gmail.com>
In-Reply-To: <CAD=FV=XmMwocA_oZVi2OS2Z4+5LBT4BXZE2C1mx1U-Tcs+5SOg@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 18 Aug 2025 19:49:12 +0800
X-Gm-Features: Ac12FXz0AOcX5exZjSyNkDlB3GDDZeIXt2uYcE6IJQgNmruLiB9UCQ3nqe8R-4Y
Message-ID: <CAEXTbpcTJVCqR-NAfddd2H9oLUitcUi3XnX1GQf7hA06-Vx9UQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: Make elan touch controllers power on after
 panel is enabled
To: Doug Anderson <dianders@chromium.org>
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

Hi Doug,

On Fri, Aug 15, 2025 at 8:27=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Aug 13, 2025 at 5:51=E2=80=AFAM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > Introduce a new HID quirk to indicate that this device has to be enable=
d
> > after the panel's backlight is enabled, and update the driver data for
> > the elan devices to enable this quirk. This cannot be a I2C HID quirk
> > because the kernel needs to acknowledge this before powering up the
> > device and read the VID/PID. When this quirk is enabled, register
> > .panel_enabled()/.panel_disabling() instead for the panel follower.
> >
> > Also rename the *panel_prepare* functions into *panel_follower* because
> > they could be called in other situations now.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > ---
> >
> > Changes in v2:
> > - Rename *panel_prepare* functions to *panel_follower*
> > - Replace after_panel_enabled flag with enabled/disabling callbacks
> >
> >  drivers/hid/i2c-hid/i2c-hid-core.c    | 46 ++++++++++++++++-----------
> >  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 11 ++++++-
> >  include/linux/hid.h                   |  2 ++
> >  3 files changed, 40 insertions(+), 19 deletions(-)
>
> This seems reasonable to me.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Given that this affects devices that we already had support for
> (you're changing the behavior of two touchscreens), should it have a
> Fixes tag?

I'll add Fixes tags in the next version.
>
> We'll also need to figure out a process for landing the two patches. I
> can easily land the first one in drm-misc-next, but then it'll be a
> while before the i2c-hid one can land. Is it OK to wait?

I'm okay with waiting for the next release for i2c-hid patch to land.
Or should will ask the HID maintainers to ack this patch?
>
>
> -Doug

Regards,
Pin-yen
