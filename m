Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFF8A12596
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 15:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F6B10E00C;
	Wed, 15 Jan 2025 14:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A6110E00C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 14:08:34 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-5187aa2c97dso2372117e0c.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 06:08:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736950112; x=1737554912;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=58Hs7ujjh5IWuk6tWQ5BGXRroK3g4h67KngS4jQYbOk=;
 b=je/3DM7mozMhfyOexo65a2e0fZHU2bHGdRlImSn8ohRUpJfkihvdQ5yALPQOLwh6tG
 Tq/LADm3ttigT3w8QQ7YSM6m40d/Cl+cBfoJL6Tw7JFR4anZwXgVzFgsPzMYpBLuPElu
 3HRt3rf1nvIkhDQ8WZMPF1SU6JGzAg6jerBW8LtKFdiDDAw2LyGWdlr06JGTRfrZZK29
 buZzBGBLtbx6nMUjhlc5Mj/e987VqYnzqx2mdn+evRpNF5eFwy/uyihIDYPK8vySoOPV
 19N9M9GaqVfnk5u1CpsLZ/WPE8aO23Ghx3AQ6ZhMh5gXaXvnKmBNXqVK+D7K9xiWgMqb
 SS7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnWb3G0CNpIGuqPsiTbQLUJ0KCZ0wsZ2tu+32Ros+YF6DH1wTIyLZaPBCRDnMWME/PYhOyvKtsoE0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtO3LN2Tj6XID6OWsuvCpcZQrUnf1X9yLkfBoaoaUa353JgVED
 Zsq65sMGFUEjZ3LkXDuZ1O5mbRj049zWtfi8NPmTzlY+wR9Npdbfe1r0pBUQ0HI=
X-Gm-Gg: ASbGncvCf3U233tqllLeSP/2zzxuM3lhm0asCVvO/ixM5HTXiCmVvmnHwxYIqfVaxym
 ILB6BU1UWitNM5+at0xSpwMqWVBq6Wj1SJaBkqu0bCTyNjEtMYveGnC8RKthFF8GZZvZXxoHNvx
 tCDaoevs0JXs+uap9lIvXrgfnywEg/e11ZGjSsAD87eT+pbr6XQ/E5jn8F9Xv5pZ+MM5lK4fld5
 /tHTxjiw4M6dDRWnAgJwP29hovd+ap2CYrrTx77lt407A58V3Eu/SklyJ7nufK+mUc37FV1fhYI
 CPM4q5pZN9Ya/GUWyOI=
X-Google-Smtp-Source: AGHT+IFOunSnTG1FXC4TUEUnbgND58UfvUyZCttL9DH7/vxJNOh70sspsFL+1mA1tBQjkQ+KAhjdAw==
X-Received: by 2002:a05:6122:2a50:b0:51b:10a0:331c with SMTP id
 71dfb90a1353d-51c6c3a149cmr23627342e0c.5.1736950112142; 
 Wed, 15 Jan 2025 06:08:32 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-51c7fd03a72sm4248573e0c.37.2025.01.15.06.08.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 06:08:31 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-4b11a110e4eso1616642137.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 06:08:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXmDfpOavh6Edrtrf17yiKFwogzHW9NhzHq67amZTKMmoG1Y5WeIXn19vVwY9iJBx5RA5ARZWubY4g=@lists.freedesktop.org
X-Received: by 2002:a05:6102:2b81:b0:4b2:48ef:3cf2 with SMTP id
 ada2fe7eead31-4b3d0fe7048mr26300112137.25.1736950111112; Wed, 15 Jan 2025
 06:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
 <20250115-xilinx-formats-v2-4-160327ca652a@ideasonboard.com>
 <CAMuHMdXwsdP3_3b_OWFZ8J=kuNCga0h5Vo+wR0fdquQjZNuzEw@mail.gmail.com>
 <b7b8cdde-c189-4b9f-8423-c8ab4797b2f0@ideasonboard.com>
 <CAMuHMdVnDBt9QbR2bPdKHWgQ7i-OYYJ14ndc270z-hejY=bUdA@mail.gmail.com>
 <6b084e2c-100f-4563-8797-9fd6c862ed0c@ideasonboard.com>
 <CAMuHMdX8EeKnV8et81i3UdOexhO3Ry5TTKqp18OvCpJpWT2CtQ@mail.gmail.com>
 <0b0decd1-6f19-424a-84e5-fc71dceb983c@ideasonboard.com>
In-Reply-To: <0b0decd1-6f19-424a-84e5-fc71dceb983c@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jan 2025 15:08:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXrdV4YRo1nMCVMTga=M+16GT8GkWe+Rk1DkgDZ=abGag@mail.gmail.com>
X-Gm-Features: AbW1kvbfHY4o6YUlFdSWBdaxCXiUM6a4Ff7ECBd3ODRgMUDlTT_h_eEcP0lG6gE
Message-ID: <CAMuHMdXrdV4YRo1nMCVMTga=M+16GT8GkWe+Rk1DkgDZ=abGag@mail.gmail.com>
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

On Wed, Jan 15, 2025 at 2:46=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 15/01/2025 14:52, Geert Uytterhoeven wrote:
> > On Wed, Jan 15, 2025 at 1:42=E2=80=AFPM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> On 15/01/2025 14:33, Geert Uytterhoeven wrote:
> >>> On Wed, Jan 15, 2025 at 12:11=E2=80=AFPM Tomi Valkeinen
> >>> <tomi.valkeinen@ideasonboard.com> wrote:
> >>>> On 15/01/2025 12:33, Geert Uytterhoeven wrote:
> >>>>> On Wed, Jan 15, 2025 at 10:04=E2=80=AFAM Tomi Valkeinen
> >>>>> <tomi.valkeinen@ideasonboard.com> wrote:
> >>>>>> Add Y10_LE32, a 10 bit greyscale format, with 3 pixels packed into
> >>>>>> 32-bit container.
> >>>>>>
> >>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>>>>
> >>>>> Thanks for your patch!
> >>>>>
> >>>>>> --- a/include/uapi/drm/drm_fourcc.h
> >>>>>> +++ b/include/uapi/drm/drm_fourcc.h
> >>>>>> @@ -408,6 +408,7 @@ extern "C" {
> >>>>>>     /* Greyscale formats */
> >>>>>>
> >>>>>>     #define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')=
  /* 8-bit Y-only */
> >>>>>> +#define DRM_FORMAT_Y10_LE32    fourcc_code('Y', 'P', 'A', '4')  /=
* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
> >>>>>
> >>>>> R10_LE32? Or R10_PA4?
> >>>>
> >>>> Can we discuss the "R" vs "Y" question under the cover letter? There=
's
> >>>> some more context about it in there.
> >>>
> >>> Sorry, hadn't read the cover letter. I got attracted by "Y8" and "Y10=
".
> >>>
> >>>> I took the "LE32" from Gstreamer's format. Maybe it's a bit pointles=
s.
> >>>>
> >>>> I don't know if it makes sense to add the fourcc to the DRM format n=
ame.
> >>>> The fourcc is very limited. Rather, we could, say, have
> >>>> DRM_FORMAT_Y10_PACKED_32 (or "R", if you insist =3D).
> >>>>
> >>>>> Does LE32 have a meaning?  My first guess just reading the subject
> >>>>> was wrong ("little endian  32-bit" ;-)
> >>>>
> >>>> I'm not sure I follow. It's little-endian. The pixel group/unit is a
> >>>> 32-bit number, where the leftmost pixel on the screen is in bits 9-0=
,
> >>>> and the padding is in bits 31-30, and stored in memory as little-end=
ian.
> >>>
> >>> Ah, the "LE" applies to the pixels inside each word.
> >>
> >> No, to the 32-bit container.
> >>
> >>> DRM formats stored in memory are always little-endian, unless the
> >>> DRM_FORMAT_BIG_ENDIAN bit is set, which is what I was hinting
> >>> at...
> >>
> >> Indeed you're right. The "LE" is pointless. So back to the bike-sheddi=
ng
> >> about the name =3D).
> >
> > As the order inside the container is Y2:Y1:Y0, it _is_ little endian.
> > Cfr.
> >
> > #define DRM_FORMAT_YUYV  fourcc_code('Y', 'U', 'Y', 'V') /* [31:0]
> > Cr0:Y1:Cb0:Y0 8:8:8:8 little endian */
>
> Hmm, I see. I hadn't thought LE in that context, but I think it makes
> sense when there are multiple pixels in one container. So the "little
> endian" above would refer to the order of Y1 and Y0. So is Y1 the
> least-significant-pixel? =3D)

No, Y0 is the least-significant member of the container, which
corresponds to the first pixel ("little end first").

> But, say, in
>
> #define DRM_FORMAT_RG88         fourcc_code('R', 'G', '8', '8') /* [15:0]=
 R:G
> 8:8 little endian */
>
> the "little endian" refers to the 16-bit value itself? Which is not
> necessary, as the default assumption is little endian.

I think so.

> In any case, when considering your latest point... "LE" in the name
> makes sense? But with a quick look I didn't find any formats that would
> have "big endian pixel order", so maybe we can just assume little endian
> pixel order too.

[CDR][124] have. See the descriptions of the commits that introduced
them for the rationale behind this:

b92db7e4fe740daa drm/fourcc: Add DRM_FORMAT_D[1248]
d093100b425df6fe drm/fourcc: Add DRM_FORMAT_R[124]
e5bd7e3e4a68f0be drm/fourcc: Add DRM_FORMAT_C[124]

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
