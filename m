Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2377B6C1FA7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 19:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BC510E223;
	Mon, 20 Mar 2023 18:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07FD10E223
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:26:36 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id y4so50522689edo.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 11:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1679336795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bIfBJvw4GqAMhW5twcZsJZl6S9pMqZHlkEyev/gaORI=;
 b=VAd9dDtgxN14PqtMJWYqSIEAFzFtFFNLlsJrPb/OCGinTMVnOJidMx0e64v2l0xPkR
 MuZblZBj0ZGFj01L4KSaoHWQWQIycrRIPm5FO7lfaRrKDUr6pRwx6cubkTGNaZgiChYf
 +1i8FPpcIeEpe6DVWw3oQ8CAOQ7OEQOw5ZhKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679336795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bIfBJvw4GqAMhW5twcZsJZl6S9pMqZHlkEyev/gaORI=;
 b=AUYn9A48J3JM2QUNEKpQONja3TrMmNAvwmEp8cGJ9eOFHMvEuE3OMXA5RkqrAef2I3
 x7+s7rOk4eB9JKPBNdPVbUvyeg0vwVqM8JipRHLC/3zelEpQTMYXdJBK5J6UVaOZ+GOY
 J0V3sLf3w2mmZFWlu1XZUXNAGOPTBBmxs8u+zIzja8ppwwt5W5C5W6tEJZnnZ6uwZvBV
 QbcDMjJRB3KdB1GNeH3qvhjK4DE2RwWBACm2xe2eaxMJ/XRB/t4hr3ZmMelfTms22Yhp
 wgZqJQdhUWIOvAnI23M6TAnr6ULA9tK/j9hyjk8OGihIxBsbo7jvri10ZHhRLhEJD+fr
 3qkQ==
X-Gm-Message-State: AO0yUKX+RtxuaHvCBuj1485RkRBzrVjQLW4T3+0IGqYr8pJTbCn0J+Yu
 M6YAmJYwTjAuSka7KL4aI4gFvjMBwkDzbwBf9UFgE+yd
X-Google-Smtp-Source: AK7set9WOTrj2NDaTiDMcfjo6tTO/PLUzTKr3YNxWaT0Lr7Z4XuG+SVV9j087lGVsEsXGIlrUaIHKg==
X-Received: by 2002:a17:906:2896:b0:931:a321:7640 with SMTP id
 o22-20020a170906289600b00931a3217640mr10665239ejd.74.1679336794905; 
 Mon, 20 Mar 2023 11:26:34 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 x28-20020a50d61c000000b004c19f1891fasm5300235edi.59.2023.03.20.11.26.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 11:26:34 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id cy23so50338511edb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 11:26:34 -0700 (PDT)
X-Received: by 2002:a17:907:9b03:b0:932:da0d:9375 with SMTP id
 kn3-20020a1709079b0300b00932da0d9375mr288149ejc.4.1679336794015; Mon, 20 Mar
 2023 11:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
In-Reply-To: <20230320180501.GA598084@dev-arch.thelio-3990X>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 20 Mar 2023 11:26:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
Message-ID: <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
Subject: Re: Linux 6.3-rc3
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 11:05=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On the clang front, I am still seeing the following warning turned error
> for arm64 allmodconfig at least:
>
>   drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uniniti=
alized when used here [-Werror,-Wuninitialized]
>           if (syncpt_irq < 0)
>               ^~~~~~~~~~

Hmm. I do my arm64 allmodconfig builds with gcc, and I'm surprised
that gcc doesn't warn about this.

That syncpt_irq thing isn't written to anywhere, so that's pretty egregious=
.

We use -Wno-maybe-uninitialized because gcc gets it so wrong, but
that's different from the "-Wuninitialized" thing (without the
"maybe").

I've seen gcc mess this up when there is one single assignment,
because then the SSA format makes it *so* easy to just use that
assignment out-of-order (or unconditionally), but this case looks
unusually clear-cut.

So the fact that gcc doesn't warn about it is outright odd.

> If that does not come to you through other means before -rc4, could you
> just apply it directly so that I can stop applying it to our CI? :)

Bah. I took it now, there's no excuse for that thing.

Do we have any gcc people around that could explain why gcc failed so
miserably at this trivial case?

                   Linus
