Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9624FA736E8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 17:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF3D10E1A3;
	Thu, 27 Mar 2025 16:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0073410E178
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 16:35:53 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-86fab198f8eso602173241.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 09:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743093352; x=1743698152;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ibdtL0f3H8DnAPyEw/T+T3QYX14z3U6slG7wOxVtOcQ=;
 b=qYHdtTc8weZ9jrRMGL8/7OSzM/Fb96ItZkfwPZjXPWBhtU4My7hjVzttkrqoTProK0
 7dbNG2jMyclvv1QWqsJqX6a4GYt+eIKh3nGTn+pzxoD9L3GIEcXo/kXdasF4GqgPuMuo
 eLNzmHVItfawqG6usH3a5vb6xJXsHZq2D0MfPjj8BBKHF+F6M6QdRSr079dzWy5i/AWw
 uqbQU5mRyLE6i/rzLvgBrARUe9DD8FR0EGZrQ1XXp+kRHJaCrxI8nCLHEi2FiCT7Nn0r
 bKflD8Qesh4mxHcad8rixS921LmcZuBXXqerBiOHcY+kjdcLFrit2FNlqlDaGHlA1SLx
 dXLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6EkZWSm58a6YNaewVqgntXT++huWkSMiK6rJlJFyIYtH3MJVEXWnjPcCquX6J4iA9kyrsdf7TRNk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxk09MbQPdnOJRT5BIMpKua9HFBQqiSD/xgVd8C/qMVRxnkFDK+
 tXk1xr1fM2vDDCWZwKYRaqzGSVKMW/79enTkd+VetAOBdZOE4NZlyI3FeHn7l3c=
X-Gm-Gg: ASbGncttIJ2hqg1m+7nVCa0QY+Wc0XYTWx5UhLlKfbYVca1O3ZVqroj+NDJf4mI1U4D
 s0D2MPnJiNmmAf+NDBqibMCcCWZy4nExzbauHfkUDQh3BOW1ndQlOTRKZD6DSF2iM+1wnWcPhK/
 LZCGNXtCXyyI7xsECe8KcEYsXviWht2+GWUFG5XUwNaFC/CwamQOlvG06VhIIRTH82k9pkHb95i
 1MHTxWnMVgF/SJGQqwOLxVyS+RblYtaMPUtRacEhCoWAFtP45yhlSmoPJ1FoTTtM7cfet5cSCHF
 0knQngikL8n6ajCC2NxJCPIioZbnp9PvKuJGDSzObmeBDlwT9GZvuMPTAdnbtST6tJ+N5GGJsc0
 5XmCN3cLikmySTvSesA==
X-Google-Smtp-Source: AGHT+IEzYSW0b0wLj/r8o1piTBW0LkiV+6FyOj97lo55GxTehdHH+fNQ7lkEkkQ/wUuDujRnynGxyg==
X-Received: by 2002:a05:6122:401b:b0:520:6773:e5c5 with SMTP id
 71dfb90a1353d-52600a3ec62mr4087905e0c.7.1743093352032; 
 Thu, 27 Mar 2025 09:35:52 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5260e6a0d03sm30457e0c.5.2025.03.27.09.35.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 09:35:51 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-86fbc8717fcso582470241.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 09:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUYulfCtrZ1TsjXZejPs3TFp7ADbj5nIsPpx4Oi2S3ucyjPQh84cJKMZ6H/5yAN57mZzNkqFDQPjRU=@lists.freedesktop.org
X-Received: by 2002:a05:6122:1d48:b0:520:5a87:6708 with SMTP id
 71dfb90a1353d-5260071fe18mr3630874e0c.0.1743093351421; Thu, 27 Mar 2025
 09:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
 <CAMuHMdXM1B1c=62EpcuUdpdpaBRZSJLXb1GBB0egzp7Fyeo5-w@mail.gmail.com>
 <b195971c-52e6-463e-a440-83dde4346e65@ideasonboard.com>
 <20250327112009.6b4dc430@eldfell>
 <b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com>
 <20250327175842.130c0386@eldfell>
In-Reply-To: <20250327175842.130c0386@eldfell>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Mar 2025 17:35:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
X-Gm-Features: AQ5f1JpeqSn4PpS1s7kqwyEJE-2D6rFE_STOfuC_nMbBosIVwkbb55ssK1rcc48
Message-ID: <CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

Hi Pekka,

On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen
<pekka.paalanen@haloniitty.fi> wrote:
> On Thu, 27 Mar 2025 16:21:16 +0200
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> > On 27/03/2025 11:20, Pekka Paalanen wrote:
> > > On Wed, 26 Mar 2025 15:55:18 +0200
> > > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> > >> On 26/03/2025 15:52, Geert Uytterhoeven wrote:
> > >>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen
> > >>> <tomi.valkeinen@ideasonboard.com> wrote:
> > >>>> Add greyscale Y8 format.
> > >>>>
> > >>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > >>>
> > >>> Thanks for your patch!
> > >>>
> > >>>> --- a/include/uapi/drm/drm_fourcc.h
> > >>>> +++ b/include/uapi/drm/drm_fourcc.h
> > >>>> @@ -405,6 +405,9 @@ extern "C" {
> > >>>>    #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> > >>>>    #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> > >>>>
> > >>>> +/* Greyscale formats */
> > >>>> +
> > >>>> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
> > >>>
> > >>> This format differs from e.g. DRM_FORMAT_R8, which encodes
> > >>> the number of bits in the FOURCC format. What do you envision
> > >>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')?
> > >>
> > >> I wanted to use the same fourcc as on V4L2 side. Strictly speaking it's
> > >> not required, but different fourccs for the same formats do confuse.
> > >>
> > >> So, generally speaking, I'd pick an existing fourcc from v4l2 side if
> > >> possible, and if not, invent a new one.
> > >
> > > what's the actual difference between DRM_FORMAT_R8 and DRM_FORMAT_Y8?
> > >
> > > Is the difference that when R8 gets expanded to RGB, it becomes (R, 0,
> > > 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) where c1..c3 are
> > > defined by MatrixCoefficients (H.273 terminology)?
> > >
> > > That would be my intuitive assumption following how YCbCr is handled.
> > > Is it obvious enough, or should there be a comment to that effect?
> >
> > You raise an interesting point. Is it defined how a display driver, that
> > supports R8 as a format, shows R8 on screen? I came into this in the
> > context of grayscale formats, so I thought R8 would be handled as (R, R,
> > R) in RGB. But you say (R, 0, 0), which... also makes sense.
>
> That is a good question too. I based my assumption on OpenGL behavior
> of R8.
>
> Single channel displays do exist I believe, but being single-channel,
> expansion on the other channels is likely meaningless. Hm, but for the
> KMS color pipeline, it would be meaningful, like with a CTM.
> Interesting.
>
> I don't know. Maybe Geert does?

I did some digging, and was a bit surprised that it was you who told
me to use R8 instead of Y8?
https://lore.kernel.org/all/20220202111954.6ee9a10c@eldfell

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
