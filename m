Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD0DB024BD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 21:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7104A10E3C6;
	Fri, 11 Jul 2025 19:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="U24Jvj3R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5643710E3C6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 19:43:13 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ae3703c2a8bso463749266b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 12:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1752262992; x=1752867792;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y9ZfdodvbHY+23Mq1hb6r26JRQ5egJtJgCen/4Rtzlo=;
 b=U24Jvj3RPZZVUv/C4cTPVmADHa1UXGbxwVVMP6MNq/icyZ0jHP09WgEP1fX1Lq9kcl
 3Ned4Hibv5JLpdAmaKJpOoyzcU623pYzu1KrXGm89/p2JxriYC+8MHfHCpG6GJ4DTdeU
 S6zOZU0rJRu/h/I+ANGc8p0vW4BQ7f1cfXzq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752262992; x=1752867792;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y9ZfdodvbHY+23Mq1hb6r26JRQ5egJtJgCen/4Rtzlo=;
 b=wWVBR8n4PNrOGZnHxMZp9LW/0BYPBzY8bzkQLN7LRIn0KShu/QAKWRCVrgg2COBWug
 JcIB9EjWtsZiutCMkjgxUoPaqcooGkgrmIXEHV1lRNboY6HZZ/R5vuLk+vFFIlT4XCcN
 AfLde+GvK975uhv2M66K1ukp7OB6gsFoN7d7hSZSwmUS6l33vKCTP42//0xeJT15Xtcl
 NBpF4wo5K2xTBUqf4idMQM+v3DeueZotXR/xEAKDstQMdcYL8Ic+U2fWqQrVgaMKm6wT
 VBKerK9F85bRrDJjvl1/RHuucrWr5jDWUH0B+0lK9O3duN7h+XNgS/z044wTPUUuXbUz
 wxCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdHDYc3DNLCnUv+xjEntHi0LN0zJZSCcmCXWb95SKVi3ijpUvYERllUu990hphH4VwPUR8fR5EpFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxstT8kcqWq6HWfVg1Rnf4n+MWa4znQt+EyeNLklHbZ8g5PvRk6
 VQH0eU1mSfk8wCwDPkgiUe6ARwffgxgr1QFIV4wuaCA0N+rp8OYL0+uPU+ua1UePXEmGK2Gb6Qj
 5drBj97httQ==
X-Gm-Gg: ASbGncvWMXlIFbQ10t3Qc4lylSvGC2NV6IIgzCsVEHuXDVyJMAsPKnceWpR944HDkmI
 0nRCZ8+1Q1qNaezoetHf7ezgzcOOHlwaEf3vQvwoVCYMJzNAb0gdxs28KkyDwT3zKdxLcYerRkz
 2YHnklIeJFR9mPyloF11Y9D6d7qikquAQMukkIsVO2k4Db+/9nLTqzucFel3OAPU5stYyDM4jSA
 QaQ9qKiSwK3tk+Gr7TzO9MFzimAd/GorGOVz97ttDvCaOkyfqGyWEqijEAzcbKN1ia7fjLzJvDS
 ueMPsEYoKMx0jB7RXnF+rW1see2vzDZc8AT7ryuv8vVraB5qS9lbD3XEeO85lxB4ZgPlq8PrR3s
 yUwkhyqVUNIwJ/v7KHHR+3r9sIYyC1q+Lrc+2J0oyENcMCcYcv/ih37PaEusCkLepfJIgPbAS
X-Google-Smtp-Source: AGHT+IHsv7V4HQzsHJSLvwYT+9QupuGXtwJwN5Y1KZCIX/Nseuy7RcVv7FcZgejz8Cgz4D+3PIiTgw==
X-Received: by 2002:a17:906:6a10:b0:ae3:6ff6:1aad with SMTP id
 a640c23a62f3a-ae6fbdb5416mr504395366b.14.1752262992021; 
 Fri, 11 Jul 2025 12:43:12 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7ee569asm344063766b.44.2025.07.11.12.43.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 12:43:11 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-604bff84741so4677094a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 12:43:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXxZHhcpuO7cT+sImeR2T/so26Q41PgLtsDRF4eqirRwFM6K9mMXg1AonN6hQSZvO7oN/2wH/3X1os=@lists.freedesktop.org
X-Received: by 2002:a05:6402:b57:b0:60c:6a48:8047 with SMTP id
 4fb4d7f45d1cf-611e765cb6fmr3016397a12.11.1752262990316; Fri, 11 Jul 2025
 12:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250711151002.3228710-1-kuba@kernel.org>
 <CAHk-=wj1Y3LfREoHvT4baucVJ5jvy0cMydcPVQNXhprdhuE2AA@mail.gmail.com>
 <20250711114642.2664f28a@kernel.org>
 <CAHk-=wjb_8B85uKhr1xuQSei_85u=UzejphRGk2QFiByP+8Brw@mail.gmail.com>
 <CAHk-=wiwVkGyDngsNR1Hv5ZUqvmc-x0NUD9aRTOcK3=8fTUO=Q@mail.gmail.com>
 <CAHk-=whMyX44=Ga_nK-XUffhFH47cgVd2M_Buhi_b+Lz1jV5oQ@mail.gmail.com>
In-Reply-To: <CAHk-=whMyX44=Ga_nK-XUffhFH47cgVd2M_Buhi_b+Lz1jV5oQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jul 2025 12:42:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=whxjOfjufO8hS27NGnRhfkZfXWTXp1ki=xZz3VPWikMgQ@mail.gmail.com>
X-Gm-Features: Ac12FXyPtqVJ9Y08_msIv6jNrtKjZmcd0_WCbnv2xHgZgXnR4R8GpwOuT4Zyud8
Message-ID: <CAHk-=whxjOfjufO8hS27NGnRhfkZfXWTXp1ki=xZz3VPWikMgQ@mail.gmail.com>
Subject: Re: [GIT PULL] Networking for v6.16-rc6 (follow up)
To: Jakub Kicinski <kuba@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@gmail.com>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, 11 Jul 2025 at 12:30, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So that "Oh, it worked this time" has been tainted by past experience.
> Will do several more boots now in the hope that it's gone for good.

Yeah, no.

There's still something wrong. The second boot looked fine, but then
starting chrome had a 15s delay, and when that cleared I got a
notification that 'gnome-settings-daemon' had crashed.

And the backtrace is basically identical to the one I saw with
gsd-screensaver-proxy.

So it's some socket that times out, but reverting these three

  a215b5723922 netlink: make sure we allow at least one dump skb
  a3c4a125ec72 netlink: Fix rmem check in netlink_broadcast_deliver().
  ae8f160e7eb2 netlink: Fix wraparounds of sk->sk_rmem_alloc.

did *not* fix it.

Were there any other socket changes perhaps?

I just looked, and gsd-screensaver-proxy seems to use a regular Unix
domain stream socket. Maybe not related to netlink, did unix domain
sockets end up with some similar changes?

                   Linus
