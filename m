Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7FABB7D8C
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 20:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56FE10E955;
	Fri,  3 Oct 2025 18:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HAQCRgGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B42D10E955
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 18:10:04 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b00a9989633so94701566b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 11:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1759515003; x=1760119803;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6HcZa5x/ZueKvCVojJriM429YMOmrXwyu7CDTC62Sag=;
 b=HAQCRgGFNiIPUF9afPxliD8CZK9bLm3XPI4TEeuUUChT4+oopECV+i/a1wVD/cawzR
 8uJN7n1CyUHxjTTCDrLvmBvPt4FNsLpf5mujpvb4N/uVVMhrYs5tQ7FgOehY9BHnOBRO
 EFIebV4KU/ZBEbuOO5Ny34jOcIfnOk+fxRBEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759515003; x=1760119803;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6HcZa5x/ZueKvCVojJriM429YMOmrXwyu7CDTC62Sag=;
 b=OJqJx9q9rt10ZN+3uGzJXkL0rJtZE8qpEAHRBfzsuT2GPWGYPBnFG6sDUqvdOcG/BG
 pri4IiuKwK8YbC7woaq32voy6UkcSM6HX/fNph6d+NfB0klRCiC8Al4BlKJViYo3JWSz
 iRAj0Ih1+9Z5JvAilX0xrpxzVKEixwYqOFQhIe+uA4HWPZ0GnM9ruNtmsjgK1IAZd4QE
 nBA8eO+vOcFcaaMeQnMeZqXC14TfFRK7QkPLEMs++2Czx1mKuoBWUQlIB3AFezdBSGPd
 pGA9y2f1RD32G9HnJ2mX6EXr8tzzvTK1GbZ/A4Cyd5WA1hkARGxnYTRlTKaNlG+tsEjP
 nxhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaBh/hcgIv4qvUQDZoHpkSDiidEkoS7Q6r/4jks9TWujSRGydaQcMNiJWyXp+RBQ3MLvCfvhXhZFI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFvN9RSrAOjXw0bunKGUNZRJiRHMY+ChtdGnb0uf4nyiqUuhoA
 Vz6GTvBf4RTtn1NS5nYy/BzJq6aIfgcAl/stPGZCRe1mB63WGnYE52HjVdU5+ReiK65OG6kpspf
 JtwQmAbE=
X-Gm-Gg: ASbGncuvovHaM2m+0I7BTaYiJkvQrR4FHo730cGsVEDw4dFZ/zQGAeq8lwFIGTK6X/Q
 PQBcpTAhmMizFkuPin1VeSIVaftH7z4CiLnTdzZS3ZCmUf2s0uGqgl/6jbR48Q5tsJ7ul5qv1Xl
 3qmhZypjDnYzC3lnzRv+Mkz7qR+ihJu9plKxiLDyklv2tCke75WH1Vvi8NqWefXtUqviKBmRBV/
 PMAcj8pPhmgcyFQjr4rH/Up36ghVsmYoW4GgzzrNxzGEQlZoIp98qyJC+GA3qy+ZSrHiCpi6xZ1
 6vg3B7jppQKd7KKvh9LcmNOtHc2kEklAXQzusY5kf9di0rMaOITrxDj0oJTqRtIXPXPn77UMEnk
 MWF+2S05z6HGkM0xsYJtYrL1QYs19lDcHd64qMHnDjJ5OIOvF+otebK/Fpr1p0ed+zorgQIF6MA
 pgvPG4BpZ6pUbPi6CBlJtg
X-Google-Smtp-Source: AGHT+IFUTqX9Xzj7ziTPTO6DI4u/xzNLfsAhX5VKvfcRSczxqgF7+t7Kevt1aL4uq8ONFlltjfMRnw==
X-Received: by 2002:a17:907:6d21:b0:b27:edf1:f638 with SMTP id
 a640c23a62f3a-b485b8b56b2mr832863166b.23.1759515002599; 
 Fri, 03 Oct 2025 11:10:02 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865986505sm483236966b.23.2025.10.03.11.10.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 11:10:01 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b00a9989633so94696766b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 11:10:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVaPmkYqhOPlfiUmAtYBtKf7M6bumZuNZFryHDhLYM26Hl8nTRPAHYueim2ZUOMoeSNx28Y7yNJluI=@lists.freedesktop.org
X-Received: by 2002:a17:907:94ce:b0:b3f:493c:aa with SMTP id
 a640c23a62f3a-b4859595d81mr997367066b.7.1759515001411; Fri, 03 Oct 2025
 11:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
 <CAHk-=wgO7S_FZUSBbngG5vtejWOpzDfTTBkVvP3_yjJmFddbzA@mail.gmail.com>
 <CAPM=9txjNo==nMA7XcjzLWLO155+1bk2THwPs_BmTLu_5kU_bQ@mail.gmail.com>
In-Reply-To: <CAPM=9txjNo==nMA7XcjzLWLO155+1bk2THwPs_BmTLu_5kU_bQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 Oct 2025 11:09:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgR61VxiHyOKXBJv_HinoFVA2av1EuSHg5NcRGC1fNq3w@mail.gmail.com>
X-Gm-Features: AS18NWB0AZ2Hkgtacs8r8m7VKTE8yKqMQtBylPIC27T3Do3iNp2cujh48qXpsYw
Message-ID: <CAHk-=wgR61VxiHyOKXBJv_HinoFVA2av1EuSHg5NcRGC1fNq3w@mail.gmail.com>
Subject: Re: [git pull] drm for 6.18-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Sima Vetter <sima@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
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

On Fri, 3 Oct 2025 at 03:53, Dave Airlie <airlied@gmail.com> wrote:
>
> I get about 15-20 pull requests in various formats from very different
> groups of people, if I just cut-n-paste them all into the changelog it
> would be horribly inconsistent.

Yes.  Exactly.

> I try to harmonize them for myself, so they are somewhat visually
> consistent

Me too. You just don't do a very good job at it, I feel

> i.e. single level of indenting is my limit.

Why?

Yes. You do multiple merges:

  $ git rev-list --count --merges --author=Airlie v6.16..v6.17
  48

and yes, trying to make the merge messages be legible is a fair amount of work.

But lookie here:

  git rev-list --count --merges --author=Torvalds v6.16..v6.17
  441

IOW, I do closer to AN ORDER OF MAGNITUDE more merges than you do.
And I spend the time and try to do it right. I don't have some "one
level of indentation only" rule, I try to make the merge messages
consistent and legible.

And in order to try to lessen the burden of that consistency, I then
ask the people I pull from to try to have better messages to make it
easier for me to do that.

If you get pull requests from the people you pull from that make it
harder for you to do a better job, please push back on them too.

But maybe you now understand why I am asking *you* to try to do a
better job at formatting. Exactly like apparently you should ask the
people you pull from.

Please.

               Linus
