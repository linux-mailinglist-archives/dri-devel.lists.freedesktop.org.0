Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC95BC2649
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 20:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BE710E0A5;
	Tue,  7 Oct 2025 18:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CWPMJlo2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F6E10E0A5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 18:35:45 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-637e74e92easo11175692a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 11:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1759862144; x=1760466944;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZpJtd1jW6/1i7crN8sSSQKSLeCc/A80YMIDTIdTXw+o=;
 b=CWPMJlo2Z5frys2jYKrUeQZ8E0mDdvc3YGnnQT/BvbFKsvxhV5wSRm+aIAEei5KyBZ
 oupQG7eoIEnL7a8M4RxCoslJDwP0uhtV1tBmckhGd3Z+M3IIW8STZAgNUsBHM2/SY0dL
 2EU5jT2ljHFrp9/cuJTmNasw5GFnnrTuu0uII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759862144; x=1760466944;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZpJtd1jW6/1i7crN8sSSQKSLeCc/A80YMIDTIdTXw+o=;
 b=gM4xrxsFuuSEH4NRpd7ExNiBCrE9RR/b7NqH5fxpQPXNhHXoAaTJOB8dAvHOluDLPB
 TXHfL0JRhGc82zrOZMDnZu04VOvTOu9q2W2+SsC8Ey7gsv6zDmAAsPU2PyAoDQVVzb2o
 0u/RrX325/umXIcMt5QtYoMAj6ikBut+k+10H1xJYKHPrXu/yyuxBkBguxBAAPwE7OSN
 ZVGpRO6sjx5j83p4UjPpNAv4ebkSxLEtTjJHRGiW7MskT7uM2z5qvGtvUHa2BGH5VYK5
 crWEYd6v378NydiGsMCPoUYeJ6MApz/VXWRty4ajqmSx0kzY9UijRii1g3qJWBOk6PCW
 xc1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUkJgaw/3hYyoV0sUsG8ZwoneagwlptTrQmGjAa/04nzSx/E4PHICTOnv0A8vOqAqUYiD17/DkNOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpvAd+nYnyNMMxc4rN3qHnbMFPszeeFXa2UhXAiLlgTloAwiUQ
 HqS5HgyjvCu/9jkrXMn/BegY4GE+816mLJS9oiWwkg4dZ0Ee3shnOc59hBuqBoJfI0TIgToZx7i
 TbCQ8ynQ=
X-Gm-Gg: ASbGncv0mAzSdIolNZiq4E74gJeqdsfDLfkWQcM82ntQ2AWQbOU9ZOFi0jQo9E3J+n1
 vZt1Qgd8RwPIeTuJ80HImTLQtoYf7hSJ7HecD139THmoRj7uKQBL7jfjjbWonL7Df4M8oeffNW7
 oAv0jHH76yJH+9NMLC2vE8i5WFM+Hmm17KUbYPwf94u1ZuHYtC9nbNxzX6uq5gh3nW3M9aKEA4Z
 tLx/D9f/Yn2l895evSvbwuRDE/f6DWpkh9GdbUYWPn3NeqDZSR64CFxqSej6if4ILVT312sImHe
 qn5WS7/4MwZ4wDznTFyN1F97OuO98FsCuh+7qSYltj1oukJzsht0LeMWGsqootuIY2O9Ru1uRDl
 Ftjx2xGAXhGluwAhh/tFsqCeHDBZXNHNTojFEKOqdZoUl4RQaRPPDWY8HjvfUhH29Hhw1zj1LkP
 nz0iW5PEgM9ZF7VLY9hjOa
X-Google-Smtp-Source: AGHT+IF9uM96BsfUNfV9iXtbymJGeHp/mBvmVMFTJhqPEbsyD4cjU7snkW0j3a3T0z8CVNgSqqf7Rw==
X-Received: by 2002:a05:6402:510e:b0:634:7224:c6b5 with SMTP id
 4fb4d7f45d1cf-639d5c593d5mr367389a12.28.1759862143683; 
 Tue, 07 Oct 2025 11:35:43 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63781c46688sm12933670a12.22.2025.10.07.11.35.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 11:35:43 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-62fa062a1abso12356243a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 11:35:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVkM1VYicXtf7R7fzvUipjohxZZGV3JMmkE0ieZ+jP809fquujTuz3LO1Dr5Ieck5P4pTV/wSFs3vc=@lists.freedesktop.org
X-Received: by 2002:a05:6402:848:b0:639:720d:72d with SMTP id
 4fb4d7f45d1cf-639d5c5942amr376403a12.29.1759862142459; Tue, 07 Oct 2025
 11:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
 <CANiq72kq5YHovH=_a9c0JQgfrAx9gRsQvVo1VfHd-FaupOp7rQ@mail.gmail.com>
 <bd004ac5-9e51-4e90-a3a4-025d74941a38@nvidia.com>
 <3771775.lGaqSPkdTl@hyperion>
 <CAHk-=wj4_zaYJ9ieazt9dnL69R+SL1PEfJtquGVOqsNCVt_rDA@mail.gmail.com>
 <CANiq72kDB1cX1XXX7sc3yQvnaUUYB8q1wVKNxykv8=OV-=rWuQ@mail.gmail.com>
In-Reply-To: <CANiq72kDB1cX1XXX7sc3yQvnaUUYB8q1wVKNxykv8=OV-=rWuQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 Oct 2025 11:35:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=whe8NLsT-TnBxzzW8sCL_X3BN7zv5ELVufy6=sZ_k=uGw@mail.gmail.com>
X-Gm-Features: AS18NWATnozGm7Su-mFLcwXGFGAOFpvtF286zK8E9C7vCjhWFJcx0N9ni2DQ11g
Message-ID: <CAHk-=whe8NLsT-TnBxzzW8sCL_X3BN7zv5ELVufy6=sZ_k=uGw@mail.gmail.com>
Subject: Re: [git pull] drm for 6.18-rc1
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Maarten ter Huurne <maarten@treewalker.org>,
 John Hubbard <jhubbard@nvidia.com>, 
 Dave Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Tue, 7 Oct 2025 at 10:21, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> We can use a trick today to approximate that, which is adding a
> comment after one of the commas, e.g.
>
>     use crate::{
>         fmt,
>         page::AsPageIter, //
>     };

Ok, I think that's pretty ugly, but as a "waiting for official support
for the magic comma", it's probably about the best we can do.

> By the way, I also took a very quick look at the "trailing comma" idea
> to see how complex it could be upstream (it could be either a "just
> accept the multiline formatting if there is a trailing comma" approach
> or the "take the comma as a hint to reformat accordingly" one
> mentioned), and it seems doable. But we will see what they think about
> it -- they don't have much bandwidth, I think.

I wonder how common the magic comma is in the python world - maybe
some Rust people are already familiar with the notion and it might be
an easy thing to convince them of.

Those python formatting tools may be _written_ in rust (well, at least
Ruff seems to be), but I don't know if there's much cross-pollination
of ideas.

> I ran a quick test for the reformatting approach on the kernel, and
> the diff isn't terribly big (e.g. +183 -45). One gets things like [1]
> -- notice how the nested one (`property::`) is kept as a one liner
> because there is no comma there, but the others are reformatted as
> vertical on purpose. And if one adds a comma after `NArgs`, then it
> will make it multiline.

That example change looks sensible to me.

Although that example actually made me go "WTF?" regardless of the
changes involved.

I clearly do not understand the sorting rules either. Why are the
"device::" entries not sorted?

             Linus
