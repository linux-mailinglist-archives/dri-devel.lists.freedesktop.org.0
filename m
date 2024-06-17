Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462C490A859
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 10:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4FA10E2D5;
	Mon, 17 Jun 2024 08:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC7810E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 08:25:49 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dfdb6122992so3908691276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 01:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718612747; x=1719217547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YLY1SnZ0n4Z83uISDs682N3/GASj7W3KgbW3tfdB210=;
 b=FhGdb3ZsCDBf+Cm2y4w/h+0hYKwyxM/zxzKyl8qBQz/miKbI0o2fgm7Oe1dpxtqfRG
 l19Z8nsDjfu7Rt0itu/JOkBE+/0F5MzjtbmxsIxdFFiPd3qkwgnZwX2faj0MsUwLhDqG
 A++MQPfdlrCqO5R5cWDzL+snzsvUgPE4/tpAjfonRMfV7oRGXV0QBcBR4eUI+SIFokVv
 c0xCDK+BOZSlqubMmXtX+MheesueQgh/VlU5pBieb6TChW7UJuhMAmGhhOMt3uzpjV/J
 YUGcpdD9+ZB9SH7i1MEay/4elTwFIkRMi81T71Hbz2urjaiGElcEi3OMIVyCbt1i+Hjy
 VT8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNpBqzZyWZ8psgHnmLC1ip4WNpTHyxeBpbGhlduJOZDq3FldhUzOCf0Fw1EV1iGG8SS1R8Dn8V/+xEIz9pX2yKhvdsgkI/XXXr5a7ZbXXb
X-Gm-Message-State: AOJu0Yx4GWRmFYQH+8KO3JGPj+Au8chZL5uPWqIUONsMLkY8ViCe3JS2
 zlb1E4TcgwXokNvxsIuLFgp5TwRlowHoWdRq8crGKOYHwvaXvKhcRVeDwiQV
X-Google-Smtp-Source: AGHT+IFT+mwVRGOqJnlolJx6zX7j71fC1d2Rnm0Myu+IBXASO2K6XMFcXqspN73VdVJdOAdhZznQhQ==
X-Received: by 2002:a25:abca:0:b0:dfb:c1b:a0a5 with SMTP id
 3f1490d57ef6-dff15386537mr7788442276.15.1718612746815; 
 Mon, 17 Jun 2024 01:25:46 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-dff04a4d8absm1839167276.51.2024.06.17.01.25.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 01:25:46 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dfe43dca3bfso4508904276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 01:25:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX4G4CegkqlkB4qb4w3il88FmVqQA+Pc249ZeCZowMSgt0Fg6P8ooKQ9DfOwOjNuwBWWCeoBnG1/YP842B+otJMdbIsTXmIX/hiaSjsACvf
X-Received: by 2002:a25:688e:0:b0:dff:137:b5cb with SMTP id
 3f1490d57ef6-dff153aba11mr7790078276.23.1718612746036; Mon, 17 Jun 2024
 01:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240613154041.325964-1-jfalempe@redhat.com>
 <87r0cxqcrc.fsf@minerva.mail-host-address-is-not-set>
 <4a324a2e-0daf-488e-a3d8-ed27089e6cb9@redhat.com>
In-Reply-To: <4a324a2e-0daf-488e-a3d8-ed27089e6cb9@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2024 10:25:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPVvXBvFRJsRSWbXTf9UQzdExV2ncN2aEsHec06_f79Q@mail.gmail.com>
Message-ID: <CAMuHMdVPVvXBvFRJsRSWbXTf9UQzdExV2ncN2aEsHec06_f79Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: depends on !VT_CONSOLE
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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

Hi Jocelyn,

On Mon, Jun 17, 2024 at 10:16=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
> On 16/06/2024 14:43, Javier Martinez Canillas wrote:
> > Jocelyn Falempe <jfalempe@redhat.com> writes:
> >> The race condition between fbcon and drm_panic can only occurs if
> >> VT_CONSOLE is set. So update drm_panic dependency accordingly.
> >> This will make it easier for Linux distributions to enable drm_panic
> >> by disabling VT_CONSOLE, and keeping fbcon terminal.
> >> The only drawback is that fbcon won't display the boot kmsg, so it
> >> should rely on userspace to do that.
> >> At least plymouth already handle this case with
> >> https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/224
> >>
> >> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> >> ---
> >>   drivers/gpu/drm/Kconfig | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> >> index a9df94291622..f5c989aed7e9 100644
> >> --- a/drivers/gpu/drm/Kconfig
> >> +++ b/drivers/gpu/drm/Kconfig
> >> @@ -107,7 +107,7 @@ config DRM_KMS_HELPER
> >>
> >>   config DRM_PANIC
> >>      bool "Display a user-friendly message when a kernel panic occurs"
> >> -    depends on DRM && !FRAMEBUFFER_CONSOLE
> >> +    depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)
> >
> > I thought the idea was to only make it depend on !VT_CONSOLE, so that
> > distros could also enable fbcon / VT but prevent the race condition to
> > happen due the VT not being a system console for the kernel to print
> > messages ?
>
> Yes, but when writing the patch, I thought that if you have VT_CONSOLE=3D=
y
> and FRAMEBUFFER_CONSOLE=3Dn, then there won't be any race condition, and
> drm_panic can be enabled safely.
> I don't know if that really matters, and if VT_CONSOLE has any usage
> apart from fbcon.

It is used for any kind of virtual terminal, so also for vgacon.

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
