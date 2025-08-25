Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C50B34753
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 18:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB7B10E505;
	Mon, 25 Aug 2025 16:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KrQIHYcs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04AB10E501
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 16:30:15 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-77031d4638bso2612163b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 09:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1756139410; x=1756744210;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1jtHSRITSR2AwU52EE8r+JEB4b68kRsZxs/LuenG8cw=;
 b=KrQIHYcsk2hhEPh5kxdyk2qu6onBrhoQyGU9swyNmRWwPasU7Qt80qAZ5UmsSxMtPI
 G8QbiW4qUOveKRCTkncGoDdC6mUESIzkzIAWok7zHQF8oHX+z55SLYcFhprwJIiqiva2
 lYHw5fxDgdhH1I3PrkYEy0EvjIgiKnoafIYL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756139410; x=1756744210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1jtHSRITSR2AwU52EE8r+JEB4b68kRsZxs/LuenG8cw=;
 b=dkMvl3VBzeBsk6YIhRTVi32MfD3kMVVFjj7e9vTJj8Eugg1GLqYHfMHxVTf6wqAfu4
 0jLhHUumAZa8kScou0IQ0e2DFog1zpzF4zCOqc7UVKL6/vUj40uVO39qpQixjzPHU5AT
 z/DGoVbHokpDfJb4S8q9eaeMiuNKPykmpeK+V8lFaORp4xlgT6RoPPOjJMt41mx+tLeZ
 2xSxngsZ4ZlJAOP8Xy1G9KcT+lo8ZOD4Y7QgwEBuqKXbH0yAGSb/gFo5ByVBNaU+Gxc0
 NoMIz4AIQVUMQTGViykSVRjI0QPDiHVIJdbmTLsIa6AaSvFJVL9prgEyxAXiIRYmGS8k
 hmVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1HCm9HdipEbWZxmEQ9qiXF67yci4qZpzcByogkCVqrQEcx+RgkaK8bxODP0G2afFbNS8aEL01Huc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHmrOBGKbs25GR6rMpVyAoFiNtP05CIsJ/0eFVCisy2U3BOhPz
 9UpHfL43hlJxf3e8nI/7k/RG1+RnfeRSThg7oVOhpJ7b1j8sojif5Dtfl34NtFVenrHDKRTCNg1
 KdAg=
X-Gm-Gg: ASbGncvU1Sgj9PTq48I2Yty6h/kbuTtAf8hTVN/3QH0hvqFDv6C2Iv55xtODqQJwF8m
 PhIgjNbw9AELlzKegjQrPoD36Pikfw56muEmUGWyZIBi5QKqU9sFWTE6opNWTrafwTzQVGwF+g1
 nMmZVm0oFuGquX7q+z6ejqN1qInyTU6+NkMcoebITu2xsJjPcJyXfBtlUP0mWUwKP68yR3vnhb8
 fy2cMfCRxPmsEuFXp7dZgnHXUd6jpZ8fcBy3IZAqwkmEAvuXusU7EE949C76+KRP40EQx6acpyc
 4SZqAS46Q3fif6qZivIcHgntztIAvd20vuAxjJ//P4jdxeFr+EPF+cIgivmdm5Xui+BKnl1i6Be
 QMwwkNeJ5CaDCMEGjmVzny7Uwna0zxmDjGd+Qt/7Rn6wwD0CTB/84Sk0hY0cAAbmrcw==
X-Google-Smtp-Source: AGHT+IEV9YOeqg51ALQ0+Num0puVRvHZ5zxHYM76Wa3+w2Lg/3u/368jgkxR3tDKUjQc1juWOGWAEw==
X-Received: by 2002:a17:902:eb8b:b0:246:a4e6:50b8 with SMTP id
 d9443c01a7336-246a4e655fcmr93370515ad.56.1756139410112; 
 Mon, 25 Aug 2025 09:30:10 -0700 (PDT)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com.
 [209.85.214.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24668889dbbsm72485275ad.132.2025.08.25.09.30.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 09:30:06 -0700 (PDT)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2469325d158so12317435ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 09:30:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV5s6B6IGgc6sSHtB+c4MOGlXH/omCr2G6cUYpt4/yknOWc19AHaeet7w4xa5JUyCtRORDd5qC6Ai0=@lists.freedesktop.org
X-Received: by 2002:a17:902:d486:b0:246:b46b:1b09 with SMTP id
 d9443c01a7336-246b46b2296mr70233575ad.30.1756139405901; Mon, 25 Aug 2025
 09:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250818115015.2909525-1-treapking@chromium.org>
 <20250818115015.2909525-2-treapking@chromium.org>
 <CAD=FV=WCfFWHAh=XxA_jZpMsS_L0U_k=_g_oj36Nd=4winZ24g@mail.gmail.com>
 <pr01os80-s752-1rqp-782q-65nr8222npq7@xreary.bet>
In-Reply-To: <pr01os80-s752-1rqp-782q-65nr8222npq7@xreary.bet>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Aug 2025 09:29:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wi88Az-Uce9eS9iWE7byqXUhPWZUnNzPxb2G00J=xVXg@mail.gmail.com>
X-Gm-Features: Ac12FXy0EZz9bvA-Qu-6WzcG016UETXUzwRyI68kZYgUXuuPbSw64uhWpNOBD3o
Message-ID: <CAD=FV=Wi88Az-Uce9eS9iWE7byqXUhPWZUnNzPxb2G00J=xVXg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] HID: Make elan touch controllers power on after
 panel is enabled
To: Jiri Kosina <jikos@kernel.org>
Cc: Pin-yen Lin <treapking@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
 dri-devel@lists.freedesktop.org
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

On Tue, Aug 19, 2025 at 1:55=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Mon, 18 Aug 2025, Doug Anderson wrote:
>
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
> > > Fixes: bd3cba00dcc63 ("HID: i2c-hid: elan: Add support for Elan eKTH6=
915 i2c-hid touchscreens")
> > > Fixes: d06651bebf99e ("HID: i2c-hid: elan: Add elan-ekth6a12nay timin=
g")
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Note: cuddled the "Fixes" tags and the "Reviewed-by" tag next to each
other while applying.


> > > ---
> > >
> > > Changes in v3:
> > > - Collect review tag
> > > - Add fixes tags
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
> > Re-iterating my response from v2 [1] so it's still seen even if people
> > only look at the latest version. :-) If HID folks don't mind us
> > landing this through drm-misc, feel free to Ack this patch.
>
> Acked-by: Jiri Kosina <jkosina@suse.com>

Pushed to drm-misc-next with Jiri's Ack:

[2/2] HID: i2c-hid: Make elan touch controllers power on after panel is ena=
bled
      commit: cbdd16b818eef876dd2de9d503fe7397a0666cbe

NOTE that I added "i2c-hid" into the subject prefix to make things
more consistent.

-Doug
