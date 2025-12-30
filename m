Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81146CE9719
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 11:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A43B10E8AD;
	Tue, 30 Dec 2025 10:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4D910E8AD
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 10:42:47 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-5598b58d816so7259368e0c.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 02:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767091366; x=1767696166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+mbKEnmZAcKrKemN4xL227aXv/cGZhXjnFcbO82dy/o=;
 b=ax7wZNaNXAH2RKnPBcw7TkeJ6aEhv18Cudv96ugfGVrWcQZ7EBzwzHtRpmqTGK8ccQ
 YjjLmIvGVX/uhDG6YbLQo2rcerdpU8IuAJgfovywb4FxKw/tnRO6T7664W5h/NZQZ1L+
 LWiLUE+xhwiqqHRfzlMfydeCc4SgLfjS8+U1lMKefSnVrUnl9ubppuDTaT7pVJVWHPEZ
 ytFDv5bX5QYqTY+InEmZdLE95sQ8pGvjDIi/dZB4KtP5aAT3x0pW43Nad1Vxh+JhLpL/
 SqfSpzVoPNaE8o5O0nka6ZU7kCVKbFv3mwwAijpCFsWaZ+9WT8QSKC/9kPqQ2L0pMgxT
 BWVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE1Z+WJS+il+DLq1K/CZxXVLvxIKIbfNVbzD6mtxknIHI+yRQf0bSeyWugdFQc7gRXv4WTJ10b3mg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRWDDf2murCA5UpK8VDcImRcrcAbrq4mYxURz8V7hqALfSaLMg
 WWuA3KWASf+0+FO4W4TTzlotmtvdEOlevLQS6ycrTma6YGghZLvGF8XryMNDe2OB
X-Gm-Gg: AY/fxX6fisKW0VtUXMm+jb3UUxSIA/btQpUFaXIJ052u1g0k5egIk5akzwI2N5dKls5
 oC3FFJt23pYeg6loiIERmg24TziQ0ndwmsXs/cxvIzbi7Xsa18zR18lYB5pJcH0v26vhS7C6Uhc
 ohH0dNrTWICDqUc5JCJ5I+JbE6T5YjFxBxPU3jsAfJb58+G+UNxmfuBbRg6k8MNGtr4EPSXl5o7
 kwzFm8JGxRUkEOlsVXvl83WGrzSKylWmbH6EScJQGxrtRLgBpE58YFkSMMMAMNIv3S0C2SIVw5z
 nJtH1FidNoazUTrIc/7PAJER0hHahRr2DuUCwvjeNWCKRgMrsDlMzwh7wEuxKUWBVRMfFIbHntQ
 2WuniXnlagV++/gTmS2gISkn+48SyTNKUSVi8huWvbCSPNU8aZ5h4EeGsIxqUWafK6pQ3EI5oqe
 mo3ZXQCnDAOwWW4BOp9jR/jPSoIIgFg+UxtZ/11AWcfBp0sh5D
X-Google-Smtp-Source: AGHT+IEA2JNvA3MjwjcnIqtz1R7QXvoP4TBittOYg71y7ptzZxiClPSYNb9wIw2MtkVBVCADfttDfQ==
X-Received: by 2002:a05:6122:1d91:b0:55b:305b:4e27 with SMTP id
 71dfb90a1353d-5615bef2335mr12220113e0c.19.1767091365840; 
 Tue, 30 Dec 2025 02:42:45 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5615d04b70fsm10251093e0c.4.2025.12.30.02.42.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 02:42:45 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-5eb8f9be588so4071634137.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 02:42:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV5TiJGRsO+Pwv59IA3uw5nur4+wOBZsKlghnLCo0TnE85UBrOe3Wriy6jwdciuL1yqbmcV+A96KL8=@lists.freedesktop.org
X-Received: by 2002:a67:e702:0:b0:5de:31b1:1ffe with SMTP id
 ada2fe7eead31-5eb1a827522mr13153064137.32.1767091365057; Tue, 30 Dec 2025
 02:42:45 -0800 (PST)
MIME-Version: 1.0
References: <20251230052827.4676-1-chintanlike@gmail.com>
In-Reply-To: <20251230052827.4676-1-chintanlike@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Dec 2025 11:42:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUEXBRW68sPMrVX5B6ebtbbS93umtrB_BZsegD4mym_+A@mail.gmail.com>
X-Gm-Features: AQt7F2pZRr92trscSLmSOVfaiLPojcm1vUHVQnsT-rKg90xEirIjjF_9VqRIcIM
Message-ID: <CAMuHMdUEXBRW68sPMrVX5B6ebtbbS93umtrB_BZsegD4mym_+A@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
 deller@gmx.de, gregkh@linuxfoundation.org
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

Hi Chintan.

On Tue, 30 Dec 2025 at 06:29, Chintan Patel <chintanlike@gmail.com> wrote:
> This series makes CONFIG_FB_DEVICE optional for fbdev drivers that use
> it only for sysfs interfaces, addressing Thomas Zimmermann=E2=80=99s TODO=
 to
> remove hard FB_DEVICE dependencies.
>
> The series introduces a small helper, dev_of_fbinfo(), which returns
> NULL when CONFIG_FB_DEVICE=3Dn. This allows sysfs code paths to be skippe=
d
> via runtime checks, avoids #ifdef CONFIG_FB_DEVICE clutter, and keeps
> full compile-time syntax checking.
>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---
> Changes in v3:
> - Use PTR_IF() to conditionally include overlay_sysfs_group in
>   overlay_sysfs_groups
> - Decouple variable definition and assignment in fbtft_sysfs_init/exit
>
> Changes in v2:
> - Add dev_of_fbinfo() helper (suggested by Geert Uytterhoeven)

by Helge Deller, not me.

> - Replace #ifdef CONFIG_FB_DEVICE blocks with runtime NULL checks
> - Switch to fb_dbg() / fb_info() logging (suggested by Thomas Zimmermann)

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
