Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7610A123C9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 13:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D22310E656;
	Wed, 15 Jan 2025 12:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6933A10E656
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 12:33:31 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-4afde39e360so2111881137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 04:33:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736944408; x=1737549208;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N5rKFsU0SvYKs5cu/0lV6coepdrfbvxbzd7PCYDdbKU=;
 b=i3QGuPSmf72edGm9M+FzVwWrhF3gx1xtDRsRV2HwgU1r75et/MDl4VGUwX+tdAWGzx
 magbKPTKA8eWrOZfdwRrN1QCC2XW8yGbcExP0/QRZGRhA0ETkbf9TX1/ptfYy244IuD+
 5VfoHcVTXk01mLbbuvcgtT0Eem9qicVhOp8gaP7sDR5FyJwh1lSyNR0vuiiGisTc/BhP
 R0oHCJpawIHXT6TExf7Q4GkvCOfCuM/q45YkmQL97vn12qMHxRKS47rnbqGNpULrVC4P
 3lIBz9FBH2CHd48lCkERTXOxfMZPWDb9xm7Q9GByCFFBmOKdv4Y49VDt20bYaDmqjeV7
 Gv3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV0JODWiWCZu1YADj2xSanNA+zhM5AIz9Cz8xZmxVHjmIVe8l+P7gTGVrf66TwwoGo8DVrOUzda/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2a4RWAg1jpa89oyiQ0v0BEhKtiAXGoDyz248WqWH6s+G9TfHX
 oi4xzHMOE/IHIyVmtO+ZDOxLlSaWWgkTqI71V4gfEq957oK8UX4DhiH2LGRk
X-Gm-Gg: ASbGnctexz9rl0Y7ZPxjZwwnAOvk6did7Ce/K1EytZ/ewfcTBhuzwre30e1Uq5Tw+ex
 keUGkOkkaN1kcliJ9gfEQbIQw83IZxPpK4N1i7DazW2oLxk92W63ArqRJHf+JolSP1113vWJsWk
 yn+/9BsQNC7l/8BQ6duYmKLn9rrdFVno8kiplCgVA4GxXaWcJufi9OcRpi7Z4+fFhEvCNzHB9yS
 84YK8Lycxeg8HkSMcm6BU84SVIIUeFBu5c6fPNJXML8SF+24BDXC8sMtH2KHoTcmTAjWz2cM9n+
 QkyIccUcnzp7ie+OlwM=
X-Google-Smtp-Source: AGHT+IGTj4Xf+hyATPFjAR1uL83XMJ6tfUPa4Fs8R3msYny13pQvULW2/aigynLox9c4RWqs0rO+kQ==
X-Received: by 2002:a05:6122:50b:b0:518:81aa:899b with SMTP id
 71dfb90a1353d-51c6c46b315mr22730547e0c.6.1736944408034; 
 Wed, 15 Jan 2025 04:33:28 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-51c7fc0128fsm4252586e0c.31.2025.01.15.04.33.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 04:33:27 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-4afefc876c6so2293835137.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 04:33:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUrnkFhhPRVX9RWgapE/xlPY6moI0EfI9GmwTrku4EPynz8HL++2o/PaXpokWV7GlEjGh7IuBWhPWU=@lists.freedesktop.org
X-Received: by 2002:a05:6102:509f:b0:4b2:bc6b:c845 with SMTP id
 ada2fe7eead31-4b3d0d763b1mr22291479137.6.1736944406736; Wed, 15 Jan 2025
 04:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
 <20250115-xilinx-formats-v2-4-160327ca652a@ideasonboard.com>
 <CAMuHMdXwsdP3_3b_OWFZ8J=kuNCga0h5Vo+wR0fdquQjZNuzEw@mail.gmail.com>
 <b7b8cdde-c189-4b9f-8423-c8ab4797b2f0@ideasonboard.com>
In-Reply-To: <b7b8cdde-c189-4b9f-8423-c8ab4797b2f0@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jan 2025 13:33:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnDBt9QbR2bPdKHWgQ7i-OYYJ14ndc270z-hejY=bUdA@mail.gmail.com>
X-Gm-Features: AbW1kvaXtImmdtBVMPEGdxHLwOK_WCSPE2-SMyqu_xlnmeKkjXxXBTI8xgoUL6Q
Message-ID: <CAMuHMdVnDBt9QbR2bPdKHWgQ7i-OYYJ14ndc270z-hejY=bUdA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] drm/fourcc: Add DRM_FORMAT_Y10_LE32
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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

Hi Tomi,

On Wed, Jan 15, 2025 at 12:11=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 15/01/2025 12:33, Geert Uytterhoeven wrote:
> > On Wed, Jan 15, 2025 at 10:04=E2=80=AFAM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> Add Y10_LE32, a 10 bit greyscale format, with 3 pixels packed into
> >> 32-bit container.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >
> > Thanks for your patch!
> >
> >> --- a/include/uapi/drm/drm_fourcc.h
> >> +++ b/include/uapi/drm/drm_fourcc.h
> >> @@ -408,6 +408,7 @@ extern "C" {
> >>   /* Greyscale formats */
> >>
> >>   #define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8=
-bit Y-only */
> >> +#define DRM_FORMAT_Y10_LE32    fourcc_code('Y', 'P', 'A', '4')  /* [3=
1:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
> >
> > R10_LE32? Or R10_PA4?
>
> Can we discuss the "R" vs "Y" question under the cover letter? There's
> some more context about it in there.

Sorry, hadn't read the cover letter. I got attracted by "Y8" and "Y10".

> I took the "LE32" from Gstreamer's format. Maybe it's a bit pointless.
>
> I don't know if it makes sense to add the fourcc to the DRM format name.
> The fourcc is very limited. Rather, we could, say, have
> DRM_FORMAT_Y10_PACKED_32 (or "R", if you insist =3D).
>
> > Does LE32 have a meaning?  My first guess just reading the subject
> > was wrong ("little endian  32-bit" ;-)
>
> I'm not sure I follow. It's little-endian. The pixel group/unit is a
> 32-bit number, where the leftmost pixel on the screen is in bits 9-0,
> and the padding is in bits 31-30, and stored in memory as little-endian.

Ah, the "LE" applies to the pixels inside each word.

DRM formats stored in memory are always little-endian, unless the
DRM_FORMAT_BIG_ENDIAN bit is set, which is what I was hinting
at...

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
