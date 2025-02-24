Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4776A42BC4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 19:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF0910E05F;
	Mon, 24 Feb 2025 18:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KwSX8ePd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A2E10E05F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 18:40:47 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5462ea9691cso5278680e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 10:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1740422444; x=1741027244;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UCTg3g/tkcfH1gJmx3kVcTsAp9a72p1V4y77QyBKanE=;
 b=KwSX8ePd95QkbczXTWFj2AShrvi6kaTIH53LSnJWjTpfxDtNl1ERqRJaeif7ULAhkz
 9MPqdkL8+yB9iPEvlUnH1QZy4EoLss3U4mekemnk9uPigiDcr1XClbGVwhSkyxM8VRlT
 Kc5E1Krx+mbPwSqan++ZwDAlaoRM4StIIvglE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740422444; x=1741027244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UCTg3g/tkcfH1gJmx3kVcTsAp9a72p1V4y77QyBKanE=;
 b=gFkIt968Iybpl8GyQGjPPUZIBjUgc7dZ6r3NYfsGMXH8UTCiLUTmX4JnQF5fU7Fpss
 kq5+4o2xoJKL+0SpGpT42pSXv07Y3FPD1nWV+wjLJ0kpMqgRU7b2OKzxeudG1Wlyf/En
 K5w/hw3W7mueKLsE332VmjYn3wNCEV8ZTQDOdOTTmsWo6OrsDqT0dTpf2GDSPHYnY8xL
 wXRjn1z4aaN/TaX8WkvkQyRBGS65/HM/bixlMy24swrKqmGirZXUJxXDcZ1pdOSgOiEX
 EYMfx7RMMVlpVLaicP2cLrdxORVJVzZeti+xlUJUoHnKYqYmUQfo0OUJImlT155rW6V3
 cRzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUknlBdT9IMdwNNrpx0SWfMmJnihO0XvRiEWUy+nFONq+2wVouAW+ygi8IU/wg/ZWNbuYmvhdbEP8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykTxBVxttb4C71tvQj6WcI3vygBV3Rgc32tHPWYBrAvuwCh7FK
 eGJtZNAXblOCPzrLeuMS0ldc+ODHi3YDtd7hxh9MKz9t/4vkEZJ9R7efmjc2x6oAvIxXWUJ0Lz5
 v7Q==
X-Gm-Gg: ASbGncufx4fR1uqz5j5Jb6Dy6GSkqx7OYZFBFR+UjmQ9MzzTez+WfGFlCTWN6FhKOv7
 5XLFXnyi98YbWG2u1DsnmjzK80sandCRm/l8P8/VjptumQ39araVSGALmDMba24MQ74GhCxxEj6
 ZqT6FIBLDEmJJ9CT+gv0FG0i1KtPw6Pg/pwB2fvMX8ZcbD+QT7ESuh2eqVUqnD+s/TUeX8ziK89
 4sRe+2FdIevmmJPKNZsLIPV3ku1PZpOE0Gdf/kNyqvF+3qnIdFP97I3p4gD6C3AeKxdyhPTG4CM
 pfPRDiRJNhwIPG7XKSwUEOhRp5zgG3mNqAI7BaHgJichoxitVijKpc9Eq/0HAQN27g==
X-Google-Smtp-Source: AGHT+IGbUQeDkMRrdKeZ/jWPUgh5C9fkbIEeDdn9LRS6mc/9ESoLQr62B62K9FIL8fx5eIGEPOSfwQ==
X-Received: by 2002:a05:6512:1244:b0:545:b28:2fa2 with SMTP id
 2adb3069b0e04-54838edd962mr5790104e87.7.1740422443953; 
 Mon, 24 Feb 2025 10:40:43 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54839148352sm1069755e87.79.2025.02.24.10.40.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 10:40:43 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54622940ef7so5398267e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 10:40:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWfOPJhzDUgkhHuFufH1X+MOjnXZy+7z2kyBJqjR7tGDtlaqNoDPVBrm83dlY+LVLC17eUWAeBEigg=@lists.freedesktop.org
X-Received: by 2002:a05:6512:e99:b0:545:c51:4a0f with SMTP id
 2adb3069b0e04-54838edd8e6mr6201702e87.4.1740422441508; Mon, 24 Feb 2025
 10:40:41 -0800 (PST)
MIME-Version: 1.0
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
 <CAD=FV=Vyx8vAeRohw3W11Tuv26_-zi-GV__G2cXFxF+e76MJkw@mail.gmail.com>
 <20250218-fabulous-agile-corgi-9a5ee0@houat>
In-Reply-To: <20250218-fabulous-agile-corgi-9a5ee0@houat>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Feb 2025 10:40:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UPY-VGr0qWnHcmdJpVGo-xqJyT81FxqJVp3qcrhcii2A@mail.gmail.com>
X-Gm-Features: AWEUYZn5kJ7jvupKGMyzFLJ3TnjjiDiS2fSx64zjhWAkyHi1oX6mHN7o3rYIme8
Message-ID: <CAD=FV=UPY-VGr0qWnHcmdJpVGo-xqJyT81FxqJVp3qcrhcii2A@mail.gmail.com>
Subject: Re: [PATCH 00/20] drm/panel: Move to using mipi_dsi_*_multi()
 variants when available
To: Maxime Ripard <mripard@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joel Selvaraj <jo@jsfamily.in>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>,
 Jianhua Lu <lujianhua000@gmail.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Artur Weber <aweber.kernel@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Tejas Vipin <tejasvipin76@gmail.com>
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

On Tue, Feb 18, 2025 at 1:55=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> > I also questioned whether this really made sense to try to do with a
> > Coccinelle script and I still don't think so. It looks like Dmitry has
> > already reviewed the first few of your patches and has repeated my
> > advice. If you want to help with the effort of addressing this TODO
> > item then that's great, but I'll stop reviewing (and start silently
> > deleting) any future submissions of yours that say that they're done
> > entirely with a Coccinelle script unless you address this point and
> > convince me that your Coccinelle script is really smart enough to
> > handle all the corner cases. I'll also assert that you should review
> > Tejas's submissions to see how these conversions are expected to go.
>
> I couldn't find that in your first answer though. What corner cases do
> you have in mind, and why do you think coccinelle can't handle them?

My gut says that it is a difficult problem to make this kind of change
purely with Coccinelle. That's not to say I couldn't be convinced if
someone gave some good evidence showing some amazing patches generated
by a Cocinelle script. To show this, I would expect someone to
understand what Tejas has been doing and then compare that to what the
script can produce. In theory, you could even run the script on an old
version of panels (before Tejas's fixes) and compare what the script
does. If you can make the results nearly the same then that's amazing.


> Also, why do you think ignoring a contributor after a second mistake is
> a reasonable reaction?

Just to be clear, I said that "unless you address this point and
convince me...". My problem was that I brought up the questions of the
suitability of Cocinelle for this problem in response to v1. Then I
saw v2 posted without any reply to my concerns and with the same types
of problems. I was simply saying that if a v3 was posted in the same
vein then I would ignore it. I'm more than happy to have a
conversation, but if I start getting new versions that ignore previous
feedback and no response saying why feedback was ignored then I will
start ignoring new versions. That feels pretty reasonable to me.
