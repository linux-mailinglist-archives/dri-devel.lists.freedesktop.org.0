Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A3CA9378B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 15:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D2F10E1BE;
	Fri, 18 Apr 2025 13:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d7WZhDdj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B9A10E1BE;
 Fri, 18 Apr 2025 13:00:06 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-223fd44daf8so3353945ad.2; 
 Fri, 18 Apr 2025 06:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744981206; x=1745586006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l8JNtE4WoAq9/1lxNRUODtbBYrROtMNzFv6IeY4kWjg=;
 b=d7WZhDdjFqCx0rOvAlYReebiZsHhuaslTUEAIy0xTnjCyvDe6DodBv48K7UvaPVdPp
 5tJOVIlaRW5/19ggNZpUrVjSmoXz5/4SaCliEbGKp5dogz9GXEAHaqhASTnQzbA4SBIk
 Dg+akh3JXDZv4JN447oksjEgL8AJQTP2cBqiHIY3HhCj/Fw8SthaLIAkfzFIhHosWSt8
 n1OHppgObSehjs9ch1XEXbWdk0c6MeQO+mSWVYDAyowOUdkaKmKcHb+W7zTE6I1VqR7p
 sE1N/L98RZ/g5Rk+6RFasvyl5TeH3WwhB+pkp2JD1DVDj7y2WNOxgwDOjXztcGaSlfja
 S5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744981206; x=1745586006;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l8JNtE4WoAq9/1lxNRUODtbBYrROtMNzFv6IeY4kWjg=;
 b=cSfmnwc7hPhj6jecz48jw7bJBi1TSVG3l0suIRPdDiWgpDLWrsqNYquM3x8apbGhq5
 qzIf9ILXUe00f2uEFAFSK1h2pLhO8qFomhsAVhYVhFQgr4m6pBeuxaONWmcQ5Iy2mImc
 DGZy4UBMLbNPLfKDDNOyJ6+CIG7SfAlx2HZeUvsmcs+G3ujEJptBV5uNDRRL7cdrnyQp
 Y3YSscfL2LRy8lCoc3R+G+e63U32OGGkAUw4zItzNXWkXgjU3YkQyPaqHc9u0/f7u5Xm
 f9MPlXkovMKKWM5rSVaA6e83m+mumulNSYG1Ql9pbgi3u8DHzV0olSTXykD5QY3lmekr
 LN0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9BdEja63O0hAnxY1887y9p1D0yk9a1F+/zXmazydhDJNj4QDPFggJhqLiZpxtxhJdM6iveZp4TtVC@lists.freedesktop.org,
 AJvYcCX+lzBnjYP0kokvv5Lf+q4hAs1zKKdPkI6wNkTrkyY5RHCxiIuw+TsJHuERGbF/9KtaOtHCU5Wn@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAACLOBQZMPnx3VI6D6nxO33C/Rlu/VP+IwQIla0gEeYDGfyy5
 Fqlp5OtIzKVoRQD7XQLgrHvo9z4sPmDzsgoz/wlfwxw5bCbGg8LdEiaFSVz5ybksS+w8zMpCup8
 mal17PYj2cszXYDnryERZKntPAbppFA==
X-Gm-Gg: ASbGnctv/AjNk3MWxNWw5EP+/B9h5CTTZqENDVIFzQ8c0qlLdsrNzHVZnBm+kbsY/Ld
 VnUmAMSNDrXcPnahfdx/XFCXdchAFg463Goi+b2aDAhixa7iV+Tm++fvSox3s0klsW/hdVzA6TC
 NEcsWDrpq1bob6bn4i3ujcJw==
X-Google-Smtp-Source: AGHT+IGXaicF/YetTuwq7s8eBQVZCstjIo+yxIkShv38GuaKB72IC1mUOGVgw6U2wfXMrWNvIRt5K3Celpi0igA/0l4=
X-Received: by 2002:a17:902:cecf:b0:21d:cdb7:876c with SMTP id
 d9443c01a7336-22c5356dcdemr15485185ad.3.1744981205862; Fri, 18 Apr 2025
 06:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250418002117.130612-1-linux@treblig.org>
 <20250418002117.130612-3-linux@treblig.org>
 <ab85b3c9-46cc-4148-9de5-dcaabea130ea@wanadoo.fr>
In-Reply-To: <ab85b3c9-46cc-4148-9de5-dcaabea130ea@wanadoo.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Apr 2025 08:59:54 -0400
X-Gm-Features: ATxdqUEolXit984ANdGjgXNbP2P1Sp8M7f-qILNT6MUa_IQPkkR459ABsXKExIs
Message-ID: <CADnq5_MrEQ2XGbNho6xd9Um0R6kEEpZBeu0e-97o6-D=juD0gw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/radeon: Remove unused radeon_doorbell_free
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux@treblig.org, alexander.deucher@amd.com, harry.wentland@amd.com, 
 sunpeng.li@amd.com, siqueira@igalia.com, christian.koenig@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Fri, Apr 18, 2025 at 2:18=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 18/04/2025 =C3=A0 02:21, linux@treblig.org a =C3=A9crit :
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> >
> > radeon_doorbell_free() was added in 2013 by
> > commit 75efdee11b5d ("drm/radeon: implement simple doorbell page
> > allocator")
> > but never used.
>
> Hi,
>
> I think than instead of being removed, it should be used in the error
> handling path of cik_init() and in cik_fini().

Yes, ideally.  Care to make a patch to fix that?

Thanks,

Alex

>
> CJ
>
> >
> > Remove it.
> >
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >   drivers/gpu/drm/radeon/radeon.h        |  1 -
> >   drivers/gpu/drm/radeon/radeon_device.c | 14 --------------
> >   2 files changed, 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/r=
adeon.h
> > index 8605c074d9f7..58111fdf520d 100644
> > --- a/drivers/gpu/drm/radeon/radeon.h
> > +++ b/drivers/gpu/drm/radeon/radeon.h
> > @@ -686,7 +686,6 @@ struct radeon_doorbell {
> >   };
> >
> >   int radeon_doorbell_get(struct radeon_device *rdev, u32 *page);
> > -void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell);
> >
> >   /*
> >    * IRQS.
> > diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/r=
adeon/radeon_device.c
> > index bbd39348a7ab..4127ffb4bb6f 100644
> > --- a/drivers/gpu/drm/radeon/radeon_device.c
> > +++ b/drivers/gpu/drm/radeon/radeon_device.c
> > @@ -392,20 +392,6 @@ int radeon_doorbell_get(struct radeon_device *rdev=
, u32 *doorbell)
> >       }
> >   }
> >
> > -/**
> > - * radeon_doorbell_free - Free a doorbell entry
> > - *
> > - * @rdev: radeon_device pointer
> > - * @doorbell: doorbell index
> > - *
> > - * Free a doorbell allocated for use by the driver (all asics)
> > - */
> > -void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell)
> > -{
> > -     if (doorbell < rdev->doorbell.num_doorbells)
> > -             __clear_bit(doorbell, rdev->doorbell.used);
> > -}
> > -
> >   /*
> >    * radeon_wb_*()
> >    * Writeback is the method by which the GPU updates special pages
>
