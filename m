Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AB3A1241C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 13:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BC410E4FE;
	Wed, 15 Jan 2025 12:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E8E10E676
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 12:52:42 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ab2c9b8aecaso925306166b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 04:52:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736945559; x=1737550359;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1iqtJoGXK8NCVQOAgXLn4RuPLDEZWgiNUfGioBEklG4=;
 b=RibYxX5LAzIlUoGtxDSHWpSbOv2jZyKiSTXf3s1ZdsYexPq3+3UWv3SpEw9kbK7Z/H
 jFZZeupjUase9wWBjW72v/6zSb057Vjw2PBeY8t46+S1O1B8BFOLSMW7TbOjpdvJqBT4
 xi3ZwTlacBdNA2ELceFTy6QsKbFU3SGjRIEff1+gW2oFPY878DEaQtc7u+r8ORiz8Qel
 3/gyWTGH4q7XCgRj5xdn0WLAJ15zNAROqf3G63JSoYILxow9JPEgXoLYMm7YWI2jMD3Z
 EKF40MYOXoQCRWipepKWmbuDT9wTeNDzyU2e2eFQ+JraRId7HpMWqH1vkRJ47zd7c6OY
 a8Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVriS9aliNeFBEbBssPGedwZKubrT8XLMwVEs54TGtRaHeZ83sLaGLEf9lzKuix6QjUpXUrS9qt+mY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytPfUxmqdUvW1VPJYmpoJ6+Q48qWyIwHkGcHMZSqcdRYzO9ATj
 AwX5RtaR0o3XaWrtrkh3qsVaShiuSVTILAZSrSPRcROvTVwXdPfYuhI0aD3ztFE=
X-Gm-Gg: ASbGncutueE1BtgLbstoZ++UpbfireCBjiFxB/5mwZBsvI4/Kf05BcwW9sFE+FXUjOf
 tbBbJzLNnrJQzwXyKHsautLgNi6MQhvRToJqITU3/M2KRQItkqERaraqtrT9+iNt7AUhwEz9mkh
 cBxSRL8LneKLo/FGjp3snyGN2KNVT/kvIqJ5F5IRh/7tqogCyhuTLn7PCDEaKJcTim3HDYtp+km
 dBGGXccRzpBdV49zIjBVB3OEmwciXCqq02fDYLQ+cOUaLSnZ5NiLngRaUuAGWX8JTubMlnf2Cbx
 KiqfthwqFchZ+zhShM4=
X-Google-Smtp-Source: AGHT+IHHSHAgyKKRXPapLqf6248wEg8besI9K+UMQq+qfDwp4+RWZb35OYFVtIRDHD5tjL0dFzmYQg==
X-Received: by 2002:a17:906:fe48:b0:aab:9842:71f9 with SMTP id
 a640c23a62f3a-ab2ab559c13mr2733988266b.22.1736945558425; 
 Wed, 15 Jan 2025 04:52:38 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95624ccsm748221266b.126.2025.01.15.04.52.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 04:52:36 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5d982de9547so13047582a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 04:52:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX3LyhpWAVsv5u+05xGPHw73fN+teXXI+kHXP3W5DiWPIT72ghAd/dLKkUfPGRKJsQj95aj8AVYm9c=@lists.freedesktop.org
X-Received: by 2002:a17:907:d03:b0:aa6:730c:acb with SMTP id
 a640c23a62f3a-ab2ab16a3bamr2734655966b.8.1736945555374; Wed, 15 Jan 2025
 04:52:35 -0800 (PST)
MIME-Version: 1.0
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
 <20250115-xilinx-formats-v2-4-160327ca652a@ideasonboard.com>
 <CAMuHMdXwsdP3_3b_OWFZ8J=kuNCga0h5Vo+wR0fdquQjZNuzEw@mail.gmail.com>
 <b7b8cdde-c189-4b9f-8423-c8ab4797b2f0@ideasonboard.com>
 <CAMuHMdVnDBt9QbR2bPdKHWgQ7i-OYYJ14ndc270z-hejY=bUdA@mail.gmail.com>
 <6b084e2c-100f-4563-8797-9fd6c862ed0c@ideasonboard.com>
In-Reply-To: <6b084e2c-100f-4563-8797-9fd6c862ed0c@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jan 2025 13:52:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8EeKnV8et81i3UdOexhO3Ry5TTKqp18OvCpJpWT2CtQ@mail.gmail.com>
X-Gm-Features: AbW1kvauPbgf-uHZ3dw6OrY0NssZcC4ux914rffShhHxqYZVZgOZzgF5uFfUPkc
Message-ID: <CAMuHMdX8EeKnV8et81i3UdOexhO3Ry5TTKqp18OvCpJpWT2CtQ@mail.gmail.com>
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

On Wed, Jan 15, 2025 at 1:42=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 15/01/2025 14:33, Geert Uytterhoeven wrote:
> > On Wed, Jan 15, 2025 at 12:11=E2=80=AFPM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> On 15/01/2025 12:33, Geert Uytterhoeven wrote:
> >>> On Wed, Jan 15, 2025 at 10:04=E2=80=AFAM Tomi Valkeinen
> >>> <tomi.valkeinen@ideasonboard.com> wrote:
> >>>> Add Y10_LE32, a 10 bit greyscale format, with 3 pixels packed into
> >>>> 32-bit container.
> >>>>
> >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>>
> >>> Thanks for your patch!
> >>>
> >>>> --- a/include/uapi/drm/drm_fourcc.h
> >>>> +++ b/include/uapi/drm/drm_fourcc.h
> >>>> @@ -408,6 +408,7 @@ extern "C" {
> >>>>    /* Greyscale formats */
> >>>>
> >>>>    #define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /=
* 8-bit Y-only */
> >>>> +#define DRM_FORMAT_Y10_LE32    fourcc_code('Y', 'P', 'A', '4')  /* =
[31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
> >>>
> >>> R10_LE32? Or R10_PA4?
> >>
> >> Can we discuss the "R" vs "Y" question under the cover letter? There's
> >> some more context about it in there.
> >
> > Sorry, hadn't read the cover letter. I got attracted by "Y8" and "Y10".
> >
> >> I took the "LE32" from Gstreamer's format. Maybe it's a bit pointless.
> >>
> >> I don't know if it makes sense to add the fourcc to the DRM format nam=
e.
> >> The fourcc is very limited. Rather, we could, say, have
> >> DRM_FORMAT_Y10_PACKED_32 (or "R", if you insist =3D).
> >>
> >>> Does LE32 have a meaning?  My first guess just reading the subject
> >>> was wrong ("little endian  32-bit" ;-)
> >>
> >> I'm not sure I follow. It's little-endian. The pixel group/unit is a
> >> 32-bit number, where the leftmost pixel on the screen is in bits 9-0,
> >> and the padding is in bits 31-30, and stored in memory as little-endia=
n.
> >
> > Ah, the "LE" applies to the pixels inside each word.
>
> No, to the 32-bit container.
>
> > DRM formats stored in memory are always little-endian, unless the
> > DRM_FORMAT_BIG_ENDIAN bit is set, which is what I was hinting
> > at...
>
> Indeed you're right. The "LE" is pointless. So back to the bike-shedding
> about the name =3D).

As the order inside the container is Y2:Y1:Y0, it _is_ little endian.
Cfr.

#define DRM_FORMAT_YUYV  fourcc_code('Y', 'U', 'Y', 'V') /* [31:0]
Cr0:Y1:Cb0:Y0 8:8:8:8 little endian */

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
