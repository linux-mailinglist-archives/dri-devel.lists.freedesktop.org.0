Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF37CC1986B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 10:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF3A10E240;
	Wed, 29 Oct 2025 09:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9340810E240
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:57:47 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-5db4006eb0fso4096542137.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 02:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761731866; x=1762336666;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YD5oEw9KpWTCKMSH/QhCUmd4lqd59nHSldHu11wUAyg=;
 b=ATsyhePMkV8O7ms0XOIbjQf5LyHC02P79PSCpOlpa444AbbrK45XP9nz6qF+Jayn4+
 x8pXMXCllYQ2Ety1USAu6+l4rcz1mCi1VaU55iGBIEOAN+xb0PxXZrOB+uN5ho90iKB+
 Prtz2IdlcOfoE+3BSPpNd93KV2KibPM2A3eOsMJM7zZJMhFeGHYCBpzeJN9K0l10jLjZ
 1i5fnbKX9tGz16KusQ5BMjc22rWb6Lxbq3TqQBI7kNwshdzio93nbWvW3hktP+HUx7uy
 CEGpBxDrERQnymv084wxsNFXFnLdo7SizhHSdHWLC34ahtJYbSnXxypfnGNiR2mhlxzh
 ocuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ9BzfTwCwZQymN9Ms+J5ytIsMXCuBmiiS920vvynFiGWNyILe7jzB/Jr0ugBVw/8tn9ubTli77Vk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yznw6hC9fdwHxPtrthA5fRRbfr7JynAP5yd70mG0hWpvuxA27cf
 QusOga+UPzpkaIYbzjWqXLzZpmCOHTw5MnxNFvL8UEoQWM0Nueud9OFaloCG9RQI
X-Gm-Gg: ASbGncsr5Ab+eJvWSgTkv+tVgpPh7v1ffw4UzKv73iLfMjexepJbUT9zYpCmLoxffJv
 I+FtxvxXrAbC2oBza0Yiqak1ISHYMdjgEiZOOCgBOzGvLRh1yEjm+2Bpu3BRhOcjl1aYYcP01sy
 u4psDvA3LAdRrsslEpmTCSRWZhx2pAlDTgnlse40onh153DgoNkGo7580g31jN8gF3zfWdrCTF7
 gxqXri7RZQmicBw1O5PCkKdwbkI8Wfg6f4S6BYfGk3+NqSNAUFYZ9OHXSclGvfogf4BPv94grw/
 XZb6uZhQtnGrnD1sl4irEWa5dGjA3tjMuTiGllRYEzBsCaLv2tdjG2zvNHzV1hg8Kx8+muz2/lN
 +0kKE8FaYXKH1fh59b9gpEiglXQKwkGIldWFrgQ5UiM9Ra1M7VgchO4EC/vuu5ReN5p7EsSirpH
 mMSS/fmkTDlMLevYjXnUT3E29UFKetP30hK8n7Fg==
X-Google-Smtp-Source: AGHT+IFrqDJENjgXImpHVDCpmFfFYX1g5XAGacpYGDavvCiGBCbBJR8JMpGqw/elm/Sbz2UOuDOVVw==
X-Received: by 2002:a05:6102:5091:b0:5d5:f6ae:74b4 with SMTP id
 ada2fe7eead31-5db9069c517mr538664137.40.1761731865958; 
 Wed, 29 Oct 2025 02:57:45 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com.
 [209.85.217.41]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5db4e5c2fd4sm5032725137.15.2025.10.29.02.57.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 02:57:45 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-5db4006eb0fso4096528137.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 02:57:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVPb2LS8XifrkZgB0oWk8OhNKcLnfRf6qsaNwKWtJnthtu0g/8YkkirGSh4ZjtNt3Hb/lFo+rz3jhE=@lists.freedesktop.org
X-Received: by 2002:a67:e709:0:b0:5db:25b5:9b52 with SMTP id
 ada2fe7eead31-5db90661025mr680222137.20.1761731864265; Wed, 29 Oct 2025
 02:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
 <20251005030355.202242-6-marek.vasut+renesas@mailbox.org>
 <2666bd0f-b2a3-49b4-9458-1b362d9d1b4e@ideasonboard.com>
In-Reply-To: <2666bd0f-b2a3-49b4-9458-1b362d9d1b4e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 10:57:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0gPyMNF1vwnkEcJRc99MbqXW_5SqSwrdy8BL0Nyugkg@mail.gmail.com>
X-Gm-Features: AWmQ_bmg6zSKB2wWHVpJyvexbPet5fvTCfuD320cPH6lsc_P7bdMywzhD0uB4Y8
Message-ID: <CAMuHMdX0gPyMNF1vwnkEcJRc99MbqXW_5SqSwrdy8BL0Nyugkg@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] drm/rcar-du: dsi: Clean up VCLKSET register
 macros
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org
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

Hi Tomi,

On Tue, 28 Oct 2025 at 18:15, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> On 05/10/2025 06:02, Marek Vasut wrote:
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> > @@ -246,14 +246,14 @@
> >
> >  #define VCLKSET                              0x100c
> >  #define VCLKSET_CKEN                 (1 << 16)
> > -#define VCLKSET_COLOR_RGB            (0 << 8)
> > -#define VCLKSET_COLOR_YCC            (1 << 8)
> > +#define VCLKSET_COLOR_YCC            (1 << 8) /* 0:RGB 1:YCbCr */
> >  #define VCLKSET_DIV_V3U(x)           (((x) & 0x3) << 4)
> >  #define VCLKSET_DIV_V4H(x)           (((x) & 0x7) << 4)
> > -#define VCLKSET_BPP_16                       (0 << 2)
> > -#define VCLKSET_BPP_18                       (1 << 2)
> > -#define VCLKSET_BPP_18L                      (2 << 2)
> > -#define VCLKSET_BPP_24                       (3 << 2)
> > +#define VCLKSET_BPP_MASK             (3 << 2)
> > +#define VCLKSET_BPP_16                       FIELD_PREP(VCLKSET_BPP_MASK, 0)
> > +#define VCLKSET_BPP_18                       FIELD_PREP(VCLKSET_BPP_MASK, 1)
> > +#define VCLKSET_BPP_18L                      FIELD_PREP(VCLKSET_BPP_MASK, 2)
> > +#define VCLKSET_BPP_24                       FIELD_PREP(VCLKSET_BPP_MASK, 3)
> >  #define VCLKSET_LANE(x)                      (((x) & 0x3) << 0)
> It probably doesn't matter, but just wanted to mention: here FIELD_PREP
> is used with, e.g., (3 << 2). GENMASK returns an unsigned value, whereas
> (3 << 2) is signed.

Huh?

Either you use the unshifted value "(define for) 3" with FIELD_PREP(),
or you use the shifted value "(define for) (3 << 2)" without FIELD_PREP()?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
