Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDD2A1267B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 15:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1279310E764;
	Wed, 15 Jan 2025 14:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC38910E778
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 14:49:48 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-85c4e74e2baso1477341241.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 06:49:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736952587; x=1737557387;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jb3WMc7I3EjeyDChxpxmp2z3Ge1ULEmUo6kS7KQbLBs=;
 b=oovwAKyuHhO8U4yKigoIfBicb/fcw/oRwwBR33bqo6iAkIBsgh0MUK95BOvrLPHVIL
 OyeBwYzzYqIpcxFwyt73ZvTmtVPmyu+2goUqSS6CZy9W3lb5P4BgSqeaKnKBgVqT8tdP
 WodnEBBi7oLRh9nrjeLuFU2CR3OVDCt9W0MMuRtl0/g0h6yeG8jYVzhyJi3cAp0Xg1O+
 h696aVRxnSvbPbFrtXuk1RByB1KX7mKHs0KXAmPoJcJxh1xk1hWEgUo2SEngJRSjL7XN
 KdESd+3Wx8Eai8UK6zb6pKcXgMiG4+7E6mnhD/taA06ZIQ3EoB/iq4e1KTOhaVvuKBx6
 UIEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYf3d0ppXf0qvML+8JfULWb56kBkIRAh+pFEUApZSzEHuoriBIUOuFtgTZdhccxixfNqg8Z+SmvTI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCR39bJsgcksNdYMiVzTQNooGpm2b8DAJ+/ITGDrVd55yQyumM
 2q+5aogPC7lAxY2/TPmjCSOHOTrrs25J0SlUsA2VF6QosJ1JLm18OmgndKnHtfU=
X-Gm-Gg: ASbGncu9uWoSgfX78lBzxejYP9Lw+qGbyqihDPDH0R9ls/Goc49GOICO14uF2wK6LE4
 YTof225zSbO236RuJ/zGwsESvSUgsx4D+RqfiVSv9/pbn/jhFVnkGgBGZOjFmdePopPnuDbUHCI
 WwzNhitvPheVWPLBk39G8mO5WKCF+IoFxPIOnmsmTAJySQ1qgsrMCbJQEUsf3vXpKIq6sgVFueg
 UjfK8h77Fu8K6Svy4dnILg+Jh+Z//6DPSf68UPfTDjuGAw1BvU5J2NPgp4XUP6ppIv8MMEtpeTM
 Dg+T/+7nf02dE9yWzQI=
X-Google-Smtp-Source: AGHT+IEnMbYEWPSzK7w3sQS2x03r6QdsQcJBzi98SIAibFnKmqQaynLgIfy0W/UDV5hxX42Q3lCiHQ==
X-Received: by 2002:a05:6102:e10:b0:4af:c519:4e7f with SMTP id
 ada2fe7eead31-4b3d10485b5mr23328428137.18.1736952587249; 
 Wed, 15 Jan 2025 06:49:47 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-8623154b562sm5748336241.25.2025.01.15.06.49.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 06:49:46 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-4b24d969db1so1805330137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 06:49:46 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVbmVKBOMmFTDvGJ/3fOa3NsiYTwP2wp9kTRgUkwHvIwt523wIH+E/Heqq+2CvKElytQxhws49IFmk=@lists.freedesktop.org
X-Received: by 2002:a05:6102:b09:b0:4b2:cca7:7d51 with SMTP id
 ada2fe7eead31-4b3d10482d8mr26088574137.19.1736952586805; Wed, 15 Jan 2025
 06:49:46 -0800 (PST)
MIME-Version: 1.0
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
 <20250115-xilinx-formats-v2-4-160327ca652a@ideasonboard.com>
 <CAMuHMdXwsdP3_3b_OWFZ8J=kuNCga0h5Vo+wR0fdquQjZNuzEw@mail.gmail.com>
 <b7b8cdde-c189-4b9f-8423-c8ab4797b2f0@ideasonboard.com>
 <CAMuHMdVnDBt9QbR2bPdKHWgQ7i-OYYJ14ndc270z-hejY=bUdA@mail.gmail.com>
 <6b084e2c-100f-4563-8797-9fd6c862ed0c@ideasonboard.com>
 <CAMuHMdX8EeKnV8et81i3UdOexhO3Ry5TTKqp18OvCpJpWT2CtQ@mail.gmail.com>
 <0b0decd1-6f19-424a-84e5-fc71dceb983c@ideasonboard.com>
 <CAMuHMdXrdV4YRo1nMCVMTga=M+16GT8GkWe+Rk1DkgDZ=abGag@mail.gmail.com>
 <0004c685-b8c6-4df1-acb4-7c80a9d3255e@ideasonboard.com>
In-Reply-To: <0004c685-b8c6-4df1-acb4-7c80a9d3255e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jan 2025 15:49:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUSqiwGynNTCs7eVcr5EL4Toud90AVRb=85egWfDAc6Ew@mail.gmail.com>
X-Gm-Features: AbW1kvZ8qLbNDg2ifMBzJCr-rfWERpWGg5o-Lh1utJkoLEP54a_Q-fpkYR4VlV4
Message-ID: <CAMuHMdUSqiwGynNTCs7eVcr5EL4Toud90AVRb=85egWfDAc6Ew@mail.gmail.com>
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

On Wed, Jan 15, 2025 at 3:34=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 15/01/2025 16:08, Geert Uytterhoeven wrote:
> > On Wed, Jan 15, 2025 at 2:46=E2=80=AFPM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> On 15/01/2025 14:52, Geert Uytterhoeven wrote:
> >>> On Wed, Jan 15, 2025 at 1:42=E2=80=AFPM Tomi Valkeinen
> >>> <tomi.valkeinen@ideasonboard.com> wrote:
> >>>> On 15/01/2025 14:33, Geert Uytterhoeven wrote:
> >>>>> On Wed, Jan 15, 2025 at 12:11=E2=80=AFPM Tomi Valkeinen
> >>>>> <tomi.valkeinen@ideasonboard.com> wrote:
> >>>>>> On 15/01/2025 12:33, Geert Uytterhoeven wrote:
> >>>>>>> On Wed, Jan 15, 2025 at 10:04=E2=80=AFAM Tomi Valkeinen
> >>>>>>> <tomi.valkeinen@ideasonboard.com> wrote:
> >>>>>>>> Add Y10_LE32, a 10 bit greyscale format, with 3 pixels packed in=
to
> >>>>>>>> 32-bit container.

> Well, this is all somewhat beside the point. So is "_Y10_32" (or
> "_R10_32" if we use R) fine?

IAARDD[*], but "10_32" makes me think it stores one 10-bit pixel in a
32-bit word (i.e. a 32-bit variant of R10). So [YR]PA4 would be better.

[*] I am a rookie DRM developer...


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
