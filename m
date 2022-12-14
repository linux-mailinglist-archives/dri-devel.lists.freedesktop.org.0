Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A2664CE82
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 17:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B8510E433;
	Wed, 14 Dec 2022 16:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620E510E433
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 16:57:22 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id cg5so2920649qtb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 08:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=agVDFFKJFuVbFCeaUoWdnFDXYV/1IHy12toe/hpOLu0=;
 b=EPMA72F12RqVSbESZuY4zDHMwGmAhtgdnQrZBEqlSxQqpM4M43NRMoXyT7MrSEq6ZQ
 gPnS1j+39ZREYQF4hSyiy7NUROLJX0cAULmFC7FmKNW+aml7e0EFDxAKdHajk514q5/a
 +kyKfiSWjF5opd9BrR6Do2kfOf4sVXNKPlszM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=agVDFFKJFuVbFCeaUoWdnFDXYV/1IHy12toe/hpOLu0=;
 b=shMtrzCjukK2DzuaM+6EvdynzILHW90iSrSPeGgprdMg/i5bwjzcTdxPAgbt4Z8lXl
 dhbC9zCMybP5VtyXogwJl6lLO/T10aC4ACupcCiGRj0ejnpw+ymrKl/u7kyxGS2fUohd
 99iISmLRtWNsSfGlT8Wnu7INQs1uDiOvY38NgSzHkTvxQLF5u++y86WR9gM+kvd6mNOy
 803ntJbMzw5r2eBMRQRdBdL2kiAdsQXllMJ5dQT6UDFNNwMTonFmelrUqIvTBDBYhYaG
 9id9Lk5wBwyg+/qxtP6HoOPeoqCy1exFmqDANB6HUpydbP7sunSYE0AN5LEBjyMEeZ/y
 S8DA==
X-Gm-Message-State: ANoB5pkvWeSFVsULdQLcfYontRLXbOH9wltUYDZKxX+z+5JtgVG7wPI9
 qXMnx8IZdy6iGyM/MPQjNJwYOsU1fHMh+FY9
X-Google-Smtp-Source: AA0mqf6BBBtuQhYj3/7ES1uqRp5rstSxYykIPwg8wC0calEW+LXa2MLtdQbKBjj+Kosl6Dr8mIA7nw==
X-Received: by 2002:ac8:4514:0:b0:3a8:ef7:f29c with SMTP id
 q20-20020ac84514000000b003a80ef7f29cmr21355696qtn.46.1671037041159; 
 Wed, 14 Dec 2022 08:57:21 -0800 (PST)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com.
 [209.85.219.52]) by smtp.gmail.com with ESMTPSA id
 h3-20020ac85143000000b003a7e2aea23esm1928496qtn.86.2022.12.14.08.57.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 08:57:20 -0800 (PST)
Received: by mail-qv1-f52.google.com with SMTP id c14so222835qvq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 08:57:19 -0800 (PST)
X-Received: by 2002:a05:6214:a45:b0:4c7:20e7:a580 with SMTP id
 ee5-20020a0562140a4500b004c720e7a580mr32561826qvb.43.1671037039015; Wed, 14
 Dec 2022 08:57:19 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txGCMqyriq_xiwgFCUBa-PpHvSuRQuptAHusHcjpH+zqA@mail.gmail.com>
 <CAHk-=whVsxgtwvnK2=WRvs_i+miknfB2R7dQ4U8oooBFJZYH6w@mail.gmail.com>
 <4b1f104f-3b2a-532d-3354-11c68c5b9aa6@amd.com>
In-Reply-To: <4b1f104f-3b2a-532d-3354-11c68c5b9aa6@amd.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 14 Dec 2022 08:57:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=whnOofeSoLu2wWN7H0GZQmdj6R_T0b8MavC1zLvgCUapA@mail.gmail.com>
Message-ID: <CAHk-=whnOofeSoLu2wWN7H0GZQmdj6R_T0b8MavC1zLvgCUapA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.2-rc1
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 14, 2022 at 12:05 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Anyway we need to re-apply b09d6acba1d9 which should be trivial.

Note that my resolution did exactly that (*), it's just that when I
double-checked against Dave's suggested merge that I noticed I'd done
things differently than he did.

(*) Well, when I say "did exactly that" I don't actually know some of
the other fencing changes that happened, so there may be a reason why
something further should still be done.  So I can only point to my
merge commit a594533df0f6 and ask people to verify.

It does all at least work for me. Knock wood.

                  Linus
