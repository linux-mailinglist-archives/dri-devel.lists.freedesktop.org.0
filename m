Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C37B10EF9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 17:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD9A10E975;
	Thu, 24 Jul 2025 15:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FZ/c/cpr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF9610E03A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 15:44:12 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ae0dffaa8b2so238828366b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1753371851; x=1753976651;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Mjpmrfxd/v0JpwF7YUxdgp+tuUqNPC5F1qAamn0lqqk=;
 b=FZ/c/cprKIyJfZkwT9tA7LkuZTTvT+V5bAHLVeiHwvdgXF9S5ulH/X9VgwW7hORFXT
 oVVd2go7MrPCy08KbjbjFvbgN/XnJybaHIMyxgSq92qkcGuHV3Biezr/6Fe9nTHcMll8
 2CgSqTWNOYkr22zepXuB7ZP3SoHuNUMiZqKA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753371851; x=1753976651;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mjpmrfxd/v0JpwF7YUxdgp+tuUqNPC5F1qAamn0lqqk=;
 b=ZthoNsbP0f+2UBZaylzG2MojN+KlJcfAU6NNcF5YK8MP1BhvGqXINBmkjUEXbKyuNG
 agvlyHbRVuwGzN63x7WR5p5ZiFOznrIWWo2CV5M0jDBjAT5EP1uB+EEa5rGITxQzcKHR
 3ZOhHmfu6eH1ooaGz17r5iSq5X7+7RG8ODitX1kS61/3DjXfevqus/2ZrKlBkLZ92m9r
 x7eJdS02EW52WvXO3/H5lKIvL+aueRc4qm0zxSTLSCXfyimwZuSs1BqV4R0f57xNvnLL
 l15sULi8e6ec3e0heHUvh3D1w3nqqriEXWOQvK8zRn4ouukCEEUF45lrQnS1ojl4A9nq
 Fmfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz0X+aZylgHAiz0taGOx48zrMw2oPbI1jgHsKcItjZ3vnFA+xN6bU/Qj524bIxgIhHJg5iNGnmbmQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXWsqWTXioTtqDq+x69PiVWUHnZY0cLsqjUCcEE9jip4WvnDn/
 ZNFJQ89t1w3f/s93qN2oyBeri/OKZIW+Hkt2VUVnUD/tBxwfr8l4UsZSIhrVQyAjVZMEnhoB0CX
 9dymjSxM=
X-Gm-Gg: ASbGnct2OnhWE1iyXomCP1Ts/hzpk0LPOdlDzQy1ZSbmtQmYt7G7gFrF1oLU9wOGIxS
 jeUecjnzIRQUjFuD1SY6mm3KjpZHRs+umFgD9zDF/UNs0VuDIdOlAtk9sw/48YDrgj1mSbuhUg2
 S+83mauRM9Y2lbvvO1vaLJbbWl8cPTtwfvT8qkC5JzxPYWYXdh4Bd5Ka1LAYS3/gJN/7xhO4jFA
 oaTzIG+1Ai23TCvWX9rfknoige3Pa070OTyNrJ+IT/YbH+H4KM0dDc27e3fRIr/IdBkx99UCM+b
 gSxMHN6CVX516DXOnJjnJJMgB+e5ju2QdL+Xwd19IFDbqFsLvXY/MlELvGcg3Cgl/rZs5B4Z4yl
 YsfB/2cVOGEyOEAb/t9Ah6aHXEZfSX2vNaqwji58fjf/wB86d2M9Ae78CULYEoD/pNawKbJ0e
X-Google-Smtp-Source: AGHT+IHJixNUMall+XPZFgDKTwVoHubaCcNB2rp5ob+ZSgsx/EJPcGPw73zSaXwv7OIjTWqZAHGafg==
X-Received: by 2002:a17:907:7b81:b0:aee:e698:1afd with SMTP id
 a640c23a62f3a-af2f8d4fc11mr735080366b.43.1753371850826; 
 Thu, 24 Jul 2025 08:44:10 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47f85ee73sm124363866b.116.2025.07.24.08.44.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 08:44:10 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-607cf70b00aso2276879a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:44:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWAtPsF06aBNuAXuE5gxYCypVMZsqEHvIdANhF9c/0nNhspnRjYFg9oRcedLbf/sKRKQYnuHtEGk9M=@lists.freedesktop.org
X-Received: by 2002:a05:6402:5244:b0:60c:4521:aa54 with SMTP id
 4fb4d7f45d1cf-6149b5902c3mr6837921a12.17.1753371849006; Thu, 24 Jul 2025
 08:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twUCJj4X-2jf0VG5+A2YN9Gk8hjOAhJ2hxq4SdgZfvtMA@mail.gmail.com>
 <CAHk-=wgLQ+EPeV+JzrvkPWt2jeteqwsRkf-X61jjfV8pefgXeg@mail.gmail.com>
 <73d6e78c-a360-40d7-9123-e00d47ee2a7a@linux.intel.com>
In-Reply-To: <73d6e78c-a360-40d7-9123-e00d47ee2a7a@linux.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 24 Jul 2025 08:43:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj8t_0By0LOCa_sJ_BPhvdBg3SuQPgkBYWycxeh9DNipg@mail.gmail.com>
X-Gm-Features: Ac12FXydeKBt6S9LzXamLxkh9jnQ3kcsPJ5_fVc9HQF90V33v-OymCtO9Q6ha0w
Message-ID: <CAHk-=wj8t_0By0LOCa_sJ_BPhvdBg3SuQPgkBYWycxeh9DNipg@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.16-rc8/final (resend in txt for sure)
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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

On Thu, 24 Jul 2025 at 01:50, Jacek Lawrynowicz
<jacek.lawrynowicz@linux.intel.com> wrote:
>
> Such behavior propagates down and makes the community miserable.

Google "friendly ribbing".

               Linus
