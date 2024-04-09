Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D578E89D70F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8807112C97;
	Tue,  9 Apr 2024 10:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A841A112C98
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:35:17 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-61814e68cfcso17807677b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 03:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712658915; x=1713263715;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nktIVSuXupLDwEe7/K2WYoIkf/M9z2rTr/fahEtJAJk=;
 b=SXJWaueNVUhDRTsiXtctRS4EwgjMeulLMXt2YBRsL7vm1Fybg2yLCZlS5k6VsJ+S4B
 lGselhWe2pvin9b0BXer3YYOpzmk4Eq1IP8EuIpcJXew4g5mVPRrfjlH2FiMTCdhwkoS
 Wq0mrEpn1Qi/F+tQMPcTLHHwsRqBlQwrmkk3LkpKyQwyZaSHwiSnUdSsJ4VXfH6gZ4vh
 Zxgr0GLG/YQ29NPVMIgnMWcOFeHjxyxwV5vOYPCLP9ANUqOhGv6jlOVjmoSs7Y582B/F
 8cC8r91rVsH6RMruwmybbPmhmkzAQ7b2sqnWgvmgrQnVPBKZK2BvWSyJaECERh2W6xfl
 mZXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMPt92WrvvNWycIk+lik4/1ALtn7gH+9Lv1fVRIWUvF9WW1GtXSeoxc8uHgTQYUlknVwG1ZwjNxu6zAL0gSFXXoI2Ebd5qGtcCSOHsiPfZ
X-Gm-Message-State: AOJu0YyF8cbPlZ44LnqY1amBv5ogQGUKmACH787G42jkiKSGXfu8fcLG
 Qr4sAE677qOSqR1nkI1OvqQY6Vz+oSVGjFNCbLY7iUqWriAheAV262G23eHiSdY=
X-Google-Smtp-Source: AGHT+IFYhH3uSbQaL1vDUr7Hcqtg7wWxgP4saZ/eE8/1QiQ9HssiNiLA4B0MuTMKI2vFAsJF4rd5Zw==
X-Received: by 2002:a81:9c10:0:b0:615:1abe:f2c1 with SMTP id
 m16-20020a819c10000000b006151abef2c1mr10358101ywa.36.1712658915687; 
 Tue, 09 Apr 2024 03:35:15 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 ft1-20020a05690c360100b0061248f16528sm2082951ywb.66.2024.04.09.03.35.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 03:35:15 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dcc71031680so5049391276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 03:35:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVxeDWks6y3j2Ixhy0HTNAqdagfMy5IeGzi/ioKWBGWYH+p8OVM5bVx7slbGboI5UoQnz10RovLaIurJ78XbWwL3KCyVpIoxkcufwcK64x4
X-Received: by 2002:a25:bcd1:0:b0:dc2:41de:b744 with SMTP id
 l17-20020a25bcd1000000b00dc241deb744mr9626198ybm.32.1712658914994; Tue, 09
 Apr 2024 03:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
 <a816fea-9974-d17f-bed6-69728e223@linux-m68k.org> <87sezu97id.fsf@intel.com>
In-Reply-To: <87sezu97id.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Apr 2024 12:35:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMhXFm-kZ50Un1ZFmEcjJ7SnpyEyw65-wucBGpVRUFww@mail.gmail.com>
Message-ID: <CAMuHMdVMhXFm-kZ50Un1ZFmEcjJ7SnpyEyw65-wucBGpVRUFww@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] drm/display: Convert helpers Kconfig symbols to
 depends on
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 Lucas De Marchi <lucas.demarchi@intel.com>, kernel test robot <lkp@intel.com>, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kbuild <linux-kbuild@vger.kernel.org>
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

Hi Jani,

On Tue, Apr 9, 2024 at 12:04=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
> On Tue, 09 Apr 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > The user should not need to know which helpers are needed for the drive=
r
> > he is interested in.  When a symbol selects another symbol, it should
> > just make sure the dependencies of the target symbol are met.
>
> It's really not "just make sure". This leads to perpetual illegal
> configurations, and duct tape fixes. Select should not be used for
> visible symbols or symbols with dependencies [1].

In other words: none of these helpers should be visible...

> What we'd need for usability is not more abuse of select, but rather 1)
> warnings for selecting symbols with dependencies, and 2) a way to enable

Kconfig already warns if dependencies of selected symbols are not met.

> a kconfig option with all its dependencies, recursively. This is what we
> lack.

You cannot force-enable all dependencies of the target symbol, as some
of these dependencies may be impossible to meet on the system you are
configuring a kernel for.

The current proper way is to add these dependencies to the source
symbol, which is what we have been doing everywhere else.  Another
solution may be to teach Kconfig to ignore any symbols that select a
symbol with unmet dependencies.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
