Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC1CC27162
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 22:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B95A10E0FF;
	Fri, 31 Oct 2025 21:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dDuUOOOh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF5D10E0FF
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 21:58:56 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-64034284521so4827994a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 14:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1761947935; x=1762552735;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xE6WipI2wT7zx49o6znOjJfBT3HaeWb9dkgAF7wb63Y=;
 b=dDuUOOOhv/1TkMyHZZ3y8rwKi1/o172BoRyhABEiVdIPvsMXQfR8z0vNMid6ZEwB/1
 89FKmXUhvSpGREXHieq0Y3IFWa3PyJEHLKWzngwCKnhEmYzzNXnzzS1VvE60pkamyTAr
 IejLlRaU7Qpys7qiKPA0HOde+OfUZL1Xle3Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761947935; x=1762552735;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xE6WipI2wT7zx49o6znOjJfBT3HaeWb9dkgAF7wb63Y=;
 b=Up/RQ57c6OBxCVCo4kTqHiM4xpRq55ADYaOrRegM0FaDTVqfqE2/4yjgStAgRp0bP5
 4nOXd1MYn/kAqUIcs94ctsrmLlO6s8RaMqb5EEWioxZpUk49KQLqrnhN2hv5yTxyl5pe
 kvI1H+hp9PTNgChLPSPEe1EAKNoVp3rvC5TVIQca3vkGqDogx6WtL8PA9840mLC14XBc
 yzvTAypCsDTO/EkakWmWAcq6Qt048zEAFUCcu4i58gkuuia7e4L7vQorjvv5rnk99vqk
 e/+dDzu4YL8z4TkPp1i9poUAvbVQkeAgbEt/p6Coof131ZAubrbUqxwT0SKrqNtL9Pm0
 k6HA==
X-Gm-Message-State: AOJu0YyS8PmL5fcPYZV7gpsBFX+b4HD68oPY2rSWWsPoSHOsS6nVPSPD
 YlhT7BRaY5p0IkCYM9wmaDvljN8KzNNlFKNm3RQNAhWA3LHNOkr65nDoOxPi82MsTkqrcxtJfLn
 Es1nZrb8=
X-Gm-Gg: ASbGnctIVpAGGf6/p4uZhKKywd6Yvzp2yQRz+Nb53Q9Rsb+bTnArCY3n0Yrda4+At4w
 khFjpVo835gZieQMcDdOC4Xl0F4M94/WpMHTsNX9q3E9mTTzC6JniOaz1AIW2qBRMC9d3NHcAj6
 9bY4yQK0PavGzjKncLZCnpzLaMVaK/tGKPPM7cLWI+ZolPzo1ZT5+/DH9KEstxoI6CzyGq56J3u
 Xa85Vy2KzqihD6KV4M5pB7jgUWA9q2fvYJMkpRp8QIbBEeGdaZlu0p/CmVUPW0h+NL38XVgIO/T
 4owfDKQwgE7xmjNsOAzzh9TPGrHdn86PBSXbFkkjONRMtS3vCpVTwUhXu6H8iNWk5uo0ttegCj3
 B6uHZLQtK9Fu7xII20JBEg8dgBMv4wMtEKqrh6dxpmVV+IN3woukASWRMlTUYSap4KmC/qVql3E
 FoC7048Jzh0pXWfvM2dTrN4kxelX2mK7oIFF8KGXp/Kh24L5aVlPmQJ3o1bF1S
X-Google-Smtp-Source: AGHT+IF4gaa9/uYsu5jd8UhcnA3wnI3p+XtSY4a7bNisbNHh7RTp5UKFZYgbEBbsNhciZ4T5E+r6FA==
X-Received: by 2002:a05:6402:348f:b0:640:6c3c:64bf with SMTP id
 4fb4d7f45d1cf-64077024dbbmr4127211a12.32.1761947934872; 
 Fri, 31 Oct 2025 14:58:54 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6407b438384sm2610494a12.25.2025.10.31.14.58.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 14:58:54 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6408f9cb1dcso764218a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 14:58:53 -0700 (PDT)
X-Received: by 2002:a05:6402:1e88:b0:63b:f519:9120 with SMTP id
 4fb4d7f45d1cf-64077024c5cmr3754034a12.31.1761947933255; Fri, 31 Oct 2025
 14:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <aQUs9m_M8NbteVhR@phenom.ffwll.local>
In-Reply-To: <aQUs9m_M8NbteVhR@phenom.ffwll.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 31 Oct 2025 14:58:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgfWAWx1a-yah=bKmoXOHTd8-c-Eof59UDL-06y7HYJhw@mail.gmail.com>
X-Gm-Features: AWmQ_bkeSiG8JqK7TRwYqdO1Xz99HmCSHnOeaGkt4Jid8d46UFS-6QvLLvxuBDA
Message-ID: <CAHk-=wgfWAWx1a-yah=bKmoXOHTd8-c-Eof59UDL-06y7HYJhw@mail.gmail.com>
Subject: Re: [PULL] drm-fixes for 6.18-rc4
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@gmail.com>
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

On Fri, 31 Oct 2025 at 14:41, Simona Vetter <simona.vetter@ffwll.ch> wrote:
>
> And yes, the tag is a bit wrong, I was asleep (or well more correctly,
> processing some 6.19 -next PRs while this one one was simmering and gotten
> confused).

I was all confused about this comment because I had already edited out
the "for 6.19-rc4" part of the message on auto-pilot when I was going
through the email and was looking for the error and wondering "what is
Simona talking about?"

I had to go back and look at the original tag contents to go "Oh, _that_".

Which shows that I really only start paying attention to version
information during the later part of the release cycle, when pull
requests might be for the next merge window.

During rc3 I just assume it's fixes for the current release and would
only react if the diffstat or the explanations said something else...

                   Linus
