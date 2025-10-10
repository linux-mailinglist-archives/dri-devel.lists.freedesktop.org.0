Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8A1BCE2BE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 19:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F87A10EC65;
	Fri, 10 Oct 2025 17:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mc1wGhAn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7723A10EC65
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 17:56:22 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-280fc0e9f50so3985345ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 10:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760118982; x=1760723782; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QCmMvXhYPJMDbeiu4F6ExT6qgUVkPhneV+v5LfsjIUQ=;
 b=Mc1wGhAnosv7CIo8R621uqgnu1Gb7PAmmpi2MuDBm7jOvlTXkrgMMojd6lVyIAhT3R
 CUgtc67y7ikvKYeG0Xm9ChYaRabfGjqNphOHQwIOgA42o+LFDYzvtluPvJOd1YX1+Swm
 UAVcgRiIJSuZDhz15lNfyGuNJ6+7UOzSS542zSpILblX1Fp+WQpjeeuWfTArUURcTgwV
 a1X0cejupBEsX4mPX577BCW3JuHaCJyRrG4QPTBsqjjXEqa/cxFXME1th6GId3/lZX+J
 jjP4FXAduReV2qpwvlohvN4ceWkjDPMjpnq7P9rMkD9jvwjm3VMlEGYWYjyBekasmbYr
 cetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760118982; x=1760723782;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QCmMvXhYPJMDbeiu4F6ExT6qgUVkPhneV+v5LfsjIUQ=;
 b=tNa2kencwHuaYxBdfRNLVHfVScyLk0Scqbj/Rbkdnk9X4eHO8PrRzFJ93zfXXGsaaw
 4oIzAu8ggJ2ttFwHRnT296g+gWUxMxfK//DaOKgCXTRh9gyLBKm2i/PY5mxaocetEt5Y
 fnlBGipqhHNRZSfj+sgk/3rcGBcD/OQHSwX8WSOrrtU3aSfxSX/wSBuaQIU2LltKaxUZ
 aSGhZ0q4PDQX+xrLUdtl5i6RDp1eWkkwLnvJMJe/tQoXLloCZbzlBXq3w3eHBRIAlB4e
 GFbBRTKMKucGpEY9OM8rpRMlVBFfzxDz8Gpmgs8b3tXZKJPna38Eb1PtFbbXr4PCzf/z
 WYww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUarwCFuFIFtag8T9VeVhCCOPVxs7R6NI9mLjP3mdt47q6FMPo+52djTHZ1ElodiagAsp+9xZMGZeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3qorp/XUkDK5LjMs9v5y31n6ds4lksj8F13fU/k1ZI7stLzMB
 g+8BxwFfkF6RUmRCfDz7mPrI3AFacZxeDAUNH44b43HJ0PyFJAKmCsl7D+i7gmB9kXEVCxChVrF
 zhn9DfsS3STxAU55GwI6Vlb3jW26mhxk=
X-Gm-Gg: ASbGnctnj+V9AOWkLZtnPTWKXoOhfJ9Du15YlLoIYTEJJpj/0fCvatoJ5PJa12QUFJq
 cXxo9XAGX8PdnH5LPi33XADaNX7nqieQggCYKJujywZBinMH/0ZmphivzT7DsWRge5+J+g3z5fE
 Eo6Bci6WajM51HUfE4S3mrjC0CPEgR9S/mOEzrXQJ7M3G2zkmAX/ATnSWVFXuGMRYyD5UE4vPR9
 jX+sR4VHlEczeKl1XHAYfUcaIPoaG5svQJR2su+Yd2r7tNi/VfJq1ID8df6mZSAwXY6Wi1u6v/z
 IYQtl9vmjkflwp9QYVg2smj0E9YeiZ8AI/xjKcBZgwql
X-Google-Smtp-Source: AGHT+IErDZhGht8Q40upZIbRDfo9H5F5zwiTUHyBtlxroHX0A9XfFZxl4TsHpOiRcasjpaOjRktRyfefCj5CGQhZNo0=
X-Received: by 2002:a17:902:da87:b0:269:8407:499a with SMTP id
 d9443c01a7336-2902723ba15mr96224555ad.1.1760118981915; Fri, 10 Oct 2025
 10:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
 <CANiq72kq5YHovH=_a9c0JQgfrAx9gRsQvVo1VfHd-FaupOp7rQ@mail.gmail.com>
 <bd004ac5-9e51-4e90-a3a4-025d74941a38@nvidia.com>
 <3771775.lGaqSPkdTl@hyperion>
 <CAHk-=wj4_zaYJ9ieazt9dnL69R+SL1PEfJtquGVOqsNCVt_rDA@mail.gmail.com>
 <CANiq72kDB1cX1XXX7sc3yQvnaUUYB8q1wVKNxykv8=OV-=rWuQ@mail.gmail.com>
 <CAHk-=whe8NLsT-TnBxzzW8sCL_X3BN7zv5ELVufy6=sZ_k=uGw@mail.gmail.com>
In-Reply-To: <CAHk-=whe8NLsT-TnBxzzW8sCL_X3BN7zv5ELVufy6=sZ_k=uGw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Oct 2025 19:56:09 +0200
X-Gm-Features: AS18NWBHmzOKd8qIpJZZyZFAg4-H2OpmRvLlXowYddpXdIHzElTdr46iW0guefI
Message-ID: <CANiq72mhc6b35=cZ0Y4N+gRpX_x8FYJnnJZPgS359KnREcwWAw@mail.gmail.com>
Subject: Re: [git pull] drm for 6.18-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Maarten ter Huurne <maarten@treewalker.org>,
 John Hubbard <jhubbard@nvidia.com>, 
 Dave Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Tue, Oct 7, 2025 at 8:35=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 7 Oct 2025 at 10:21, Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > We can use a trick today to approximate that, which is adding a
> > comment after one of the commas, e.g.
> >
> >     use crate::{
> >         fmt,
> >         page::AsPageIter, //
> >     };
>
> Ok, I think that's pretty ugly, but as a "waiting for official support
> for the magic comma", it's probably about the best we can do.

Sent:

    https://lore.kernel.org/rust-for-linux/20251010174351.948650-1-ojeda@ke=
rnel.org/

Cheers,
Miguel
