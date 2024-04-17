Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DCB8A85C8
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 16:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F7F11357E;
	Wed, 17 Apr 2024 14:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7B0113584;
 Wed, 17 Apr 2024 14:18:24 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-61af74a010aso17307027b3.0; 
 Wed, 17 Apr 2024 07:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713363503; x=1713968303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=avO898yqsUcNC4lZWFklgBAuRw3SczTcgwrfOeGT8Mg=;
 b=uCQDGeMh2jM68QrA5gHFfbiZk2PTSwdjJIVUAy9GlBSiben9wz0jD2cK5hrmWmdfDK
 Er12E+b2hb0TDuUZqz8IRrl9XtTE0ek0+s1g8nLQ4ccZrKExBEvw4syjcCFP/FiQekhQ
 vvHSs/OY/B576xCPNUyL+GdGnL65bE5K5UGMHYYFoSzRaZnQxTvjm2UP7pbFYyTtP3dV
 JJMASwGu3Wg9vnpgTmPdzYPFzxh2iZLgY1MBTvkejet9ge+sTUthDt4zvLp9wFrZlITp
 e1p1eoebiawmvc3VWBA5dkS0pbqalZdAv6Lqh74n/gFzmzKNTA45z0ERwEg6IQavwa7e
 wIHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCViXRy2gz6d/vC0H3krmGQE3xWYcDf0aOtyPaoUA4Zp+ylLQQzE42SUYgU9o7Etjwa/zDAAeQG+mJP7Yyxq0JjNeKVkSRDvXmGT5se7XmSrJEcfEl/B4tV5b1hqnYzsb0qVwtIzcOwrCLjuKNu72YxqhEmZ4ef1psitVt/7jp3JmJk/lp4rIRptSc0p0b78VHxJ874KIa3/9/QCyG1oE0nSprgHzZ2kVI0i4kgOjTnasa6qXHIB72wqLpmChVaOs9SHgRAcznJ8HrI93BJLzQ==
X-Gm-Message-State: AOJu0YzNCn8i8ZtckcQd0qIXxU1dEEK9a1HqOWMH6kjokz6MvfXnbWF9
 PoHB7p/Tgzy98fAMevkZhat7Ln9SfkAY45tUECoDvfs4r+Q5gvIU39aVJV09QHY=
X-Google-Smtp-Source: AGHT+IHNr3Y9g+ZtnN7PahGTnEtFh//WgVu8UE3NsI6VGdBemEXwbokZFIgjtw57xq91gTMej6XB6Q==
X-Received: by 2002:a05:690c:dca:b0:61b:f21:1fb with SMTP id
 db10-20020a05690c0dca00b0061b0f2101fbmr1829655ywb.1.1713363502958; 
 Wed, 17 Apr 2024 07:18:22 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 v30-20020a81b71e000000b0061abd7e611asm1588625ywh.103.2024.04.17.07.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 07:18:22 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-615019cd427so42311337b3.3; 
 Wed, 17 Apr 2024 07:18:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUSs3a2k+0pBM3lIpXkpcHMwDvWvLEp/4sCA7k9pZq6nHmbrdj6jCaW7yTXnsALKT0VV/jrDrEM7ImvfUORy/KGoTvGbLB6QnnnVKxb6hovwgkXH2tkQPmk11R3VzEzLJrxWpB951rNKN3I0PlLMuWAQx37GtGo4KJuH0PpVL+Y37ZTrWllZVnEZ81/CXQIf3FHMBwn6NH+Ai7yD6oDj4jrhh/49BuhYnEdQPXwyWO+Ia6C963cuihG1upfp6wrjTPyGz+Go9dPcyDgvg8wag==
X-Received: by 2002:a81:ff02:0:b0:618:94a6:6ca1 with SMTP id
 k2-20020a81ff02000000b0061894a66ca1mr10536616ywn.27.1713363502402; Wed, 17
 Apr 2024 07:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240214215756.6530-1-mario.limonciello@amd.com>
 <20240214215756.6530-4-mario.limonciello@amd.com> <Zc1JEg5mC0ww_BeU@intel.com>
 <9831e9bc-d55f-4a72-950a-684a757af59c@amd.com> <Zc5cPjpNZydqKeS8@intel.com>
 <ecbaadf9-dfa1-46af-9a7e-cfd7aa1120be@amd.com>
In-Reply-To: <ecbaadf9-dfa1-46af-9a7e-cfd7aa1120be@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Apr 2024 16:18:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1XYpu3JeP3W-dZpO8kmN75XckuPRnw2zLW-ZqD4634g@mail.gmail.com>
Message-ID: <CAMuHMdV1XYpu3JeP3W-dZpO8kmN75XckuPRnw2zLW-ZqD4634g@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] drm: Add support to get EDID from ACPI
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Hans de Goede <hdegoede@redhat.com>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, 
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 linux-fbdev@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, 
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Mark Pearson <mpearson-lenovo@squebb.ca>
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

Hi Mario,

On Thu, Feb 15, 2024 at 8:04=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
> On 2/15/2024 12:47, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Thu, Feb 15, 2024 at 12:20:56PM -0600, Mario Limonciello wrote:
> >> On 2/14/2024 17:13, Ville Syrj=C3=A4l=C3=A4 wrote:
> >>> On Wed, Feb 14, 2024 at 03:57:54PM -0600, Mario Limonciello wrote:
> >>>> --- a/include/drm/drm_connector.h
> >>>> +++ b/include/drm/drm_connector.h
> >>>> @@ -1886,6 +1886,12 @@ struct drm_connector {
> >>>>
> >>>>            /** @hdr_sink_metadata: HDR Metadata Information read fro=
m sink */
> >>>>            struct hdr_sink_metadata hdr_sink_metadata;
> >>>> +
> >>>> +  /**
> >>>> +   * @acpi_edid_allowed: Get the EDID from the BIOS, if available.
> >>>> +   * This is only applicable to eDP and LVDS displays.
> >>>> +   */
> >>>> +  bool acpi_edid_allowed;
> >>>
> >>> Aren't there other bools/small stuff in there for tighter packing?
> >>
> >> Does the compiler automatically do the packing if you put bools nearby
> >> in a struct?  If so; TIL.
> >
> > Yes. Well, depends on the types and their alignment requirements
> > of course, and/or whether you specified __packed or not.
> >
> > You can use 'pahole' to find the holes in structures.
>
> Thanks!  I don't see a __packed attribute on struct drm_connector, but
> I'll put it near by other bools in case that changes in the future.

FTR, don't add __packed unless you have a very good reason to do so.
With __packed, the compiler will emit multiple byte-accesses to
access multi-byte integrals on platforms that do not support unaligned
memory access.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
