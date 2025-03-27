Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BC7A73DB1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 19:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373D510E133;
	Thu, 27 Mar 2025 18:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="qtlXXrFE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512B610E133
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 18:03:49 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ac3b12e8518so246050166b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 11:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1743098628;
 x=1743703428; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dbicw8Z0JQZt1O8kLiSpAtlB/Q01eTvFIz70oe6Zn9M=;
 b=qtlXXrFERjdleJ3ljD0V+YfRCEiYAdqHkBo+rehYFhuavNXl6t62KRuBSkoEJiMMoR
 hToMzbaVwKC/+eHW1NC4SXE/5R+qOPE6pzptBGDipQbOvSrnCRNK9ig1gvcLMRWcW51i
 SbSTBJH+yZXk4RTcOsn9BYR/KMSxfa5sCIgcNhsGx0Ln/HoKRtehRaYlpIorYOoBUO0n
 Wz6E96yEeJTmGg233oIJK9HjSFlSxjn8fR/HYeCl+YbjoTHnI1P9JexUEhcrjqqD0xWP
 kI/9GtHGhC0d+g9FYTxSPqv95xZcdR4MNktoAcV+MNfqhwOubGXT/kF+mdAMy8OtwR9i
 +4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743098628; x=1743703428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dbicw8Z0JQZt1O8kLiSpAtlB/Q01eTvFIz70oe6Zn9M=;
 b=u9kTj3c48Szs0MZnWAP9X7Fj486S+RsUZFerbHO7qji7PKBduGChAyOzbULWuG5fVk
 XJnRKCGZfRrSfPJwi293PemyPPELhKPZIZflBl1BJWglYqOsPAsUP5MI6l0SgKBW5H3e
 DHwUY+YZC0utTaPDUkphY40rq0tl/snLlY/gZGjB59TMfVjJ+i0wPeRz8KjTKcdg2u3T
 e6OpedgNATmt8OdZRP5wmqGtpJqSiP9GGNh9r5g09nFpbhJVIm/Ci0t4wDtlq9tGWDUu
 2Xys1nTU6TaTqasQPoOH0Xd+X+qNuRG7+ZKyj7qXJX+hsysFvLUwwoP5xGHmheusqyg5
 z8qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiUqJ2Mx0woZFgQNjd+Q0n7k+o2T6i+4gU62GMxhdESfZoM2oy7I29dhP9JDCeEwYBflA+9a4oixQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjGAmj65rblg7MBZqBgBwxfD57uAUQdcxknI8OPEWISfMXZ85d
 gUejQqtEsfrA+6ZtqjBNO7jCRssGZqPApSZF1QhPbPdpjJq6FB2vLaPJf48beTeaS+cOazDgRka
 MsNnfG86AqocwaWAs3fnQaLhcERCpVAoR6AsHtKUfTqMZrgoF
X-Gm-Gg: ASbGncvYv6EpeUUCi20fg+uYMdPjhTOlVRrJYg7tMNrxvGXubFMl8uBGZTuSQCdCKyJ
 VgRloJE9fSuqxZgJMI5533UGUpeajxB1CCrCkNs0eWOzeoWJU6JvqOf2kZOVORWj6Ad2v043JE5
 NfdvtYLFJ65u0A1Wqgu2FKtRuUT+eXfrvyftcvOoC6AsLd+xbVs3LEhhukMw==
X-Google-Smtp-Source: AGHT+IFelE6ZT8lk2wC8uMQk8JWu4GpRTRVcpkeHSAxMAv581U1nTF8OZkfplT4eSECi7+QEqLmwxT6cOrEOT0JdY8s=
X-Received: by 2002:a17:907:3dac:b0:ac6:b8de:1a74 with SMTP id
 a640c23a62f3a-ac6faecff63mr352259466b.15.1743098627399; Thu, 27 Mar 2025
 11:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
 <CAAgWFh2dHZs2D7R4ejY9sNQ+QCtLQeGGS2PNtcsm_MPeV3edLw@mail.gmail.com>
 <Z-VX3TJPI6Tgin2G@cassiopeiae>
In-Reply-To: <Z-VX3TJPI6Tgin2G@cassiopeiae>
From: M Henning <mhenning@darkrefraction.com>
Date: Thu, 27 Mar 2025 14:03:21 -0400
X-Gm-Features: AQ5f1Jrd3vkEYReJYR0savrLdJ7oh25LCgvIMRK66RMN13RaBW-FbknH-D5WxrU
Message-ID: <CAAgWFh3c=qE+c8Q04W2NXpBLBeXC12qTKLNmZeJA65m+dTMG8Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
To: Danilo Krummrich <dakr@kernel.org>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
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

On Thu, Mar 27, 2025 at 9:51=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Fri, Mar 21, 2025 at 06:06:34PM -0400, M Henning wrote:
> > On Thu, Mar 20, 2025 at 2:18=E2=80=AFPM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > > On Wed, Mar 12, 2025 at 05:36:14PM -0400, Mel Henning wrote:
> > > > +     __u32 width_align_pixels;
> > > > +     __u32 height_align_pixels;
> > > > +     __u32 pixel_squares_by_aliquots;
> > > > +     __u32 aliquot_total;
> > > > +     __u32 zcull_region_byte_multiplier;
> > > > +     __u32 zcull_region_header_size;
> > > > +     __u32 zcull_subregion_header_size;
> > > > +     __u32 subregion_count;
> > > > +     __u32 subregion_width_align_pixels;
> > > > +     __u32 subregion_height_align_pixels;
> > > > +
> > > > +     __u32 ctxsw_size;
> > > > +     __u32 ctxsw_align;
> > > > +};
> > >
> > > What if this ever changes between hardware revisions or firmware vers=
ions?
> >
> > There was some previous discussion of that here:
> > https://gitlab.freedesktop.org/mesa/mesa/-/issues/12596#note_2796853
> >
> > From what I can tell, this structure hasn't really changed since
> > FERMI_C (circa 2011), so I'm not too worried about it changing on us
> > too quickly. When it does change, we have the option of appending more
> > members to this struct in the usual way, or if the change is more
> > fundamental we can return an error from this ioctl and add a new
> > interface. Userspace needs to handle an error from this ioctl
> > gracefully anyway since whether it works or not depends on the gpu
> > generation and what firmware is loaded right now.
>
> We could also define it as
>
>         struct drm_nouveau_get_zcull_info {
>                 __u32 version;
>                 __u32 _pad;
>
>                 union {
>                         struct drm_nouveau_get_zcull_info_v1 info;
>                 }
>         }
>
> just to be safe.

We can do that, although I don't see any other drm drivers using a
similar pattern anywhere.
