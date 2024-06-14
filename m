Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18F4908413
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 08:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C37810EC3A;
	Fri, 14 Jun 2024 06:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1FD10EC3A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 06:58:41 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-63152a07830so14155007b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 23:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718348320; x=1718953120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YDOgifzl3qyZK60HJDKWjPvBElHMmzoiAuXGri3GZ3k=;
 b=IcPYYaG3C6ns1LDHPS6LQpD5MIe8TtlmR1pMdBXaVtJECnh7OqHxUygG7o7yoMbtl7
 y7mfDJZkSGd/iO+zKi/lTmvCl5H8Nlh6VxwiOnM8Jd0Xa3faiJUR3+f3Ro3xRd+W6HRa
 Y8jTFLIz2vZ07PBQOfvUg1ioSbuCp6syBAfZeo/+wyOfQ0RAKCpe65Y748g7sQWPVtP+
 7ngimBl+1bmIFzFgI+1gowXw7m0n/wIiFWqia14JatfjMIiRYiw4tJYatMbO7qHxccxe
 B7Odfhsc+GA3nxQHjxyg60yKA0TxdH+RckNwUF61K21AWfUASefVJu5sEcl9sSMMdeqp
 1O8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnrs6lOGZ+bikQECtBH8efODetO1HdSEgU2D9l78WZ3IK+HyXGRQScGhephueNgXrhP7m0KaGE5phbYv5zVToE8stYGndeguJqbHyMDLwN
X-Gm-Message-State: AOJu0YyaEEft0zLlkUYWXbPaJAKFF3ci2pX3XTasZPK0MsjgoACOO2sB
 yY5HME6x7GL1t2uKW4Vu9HlSZUMrjnkUHb1trcrvbAQK2ICowsBRVN4dsHCd
X-Google-Smtp-Source: AGHT+IGIADuvxPbt6WqZQVXvHaaid4GAPgS3/31l5C7LhshkfxhtE0aemhvW1Lg4zL92QGBHvMlwvA==
X-Received: by 2002:a81:910f:0:b0:62f:ad9c:cd4 with SMTP id
 00721157ae682-6322470facfmr15295387b3.41.1718348319549; 
 Thu, 13 Jun 2024 23:58:39 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-63118e99dbfsm3948507b3.66.2024.06.13.23.58.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 23:58:39 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dfe43dca3bfso2274572276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 23:58:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUmXelURZyfd3jYfO5Vnueqd8j2Ec6lk4kXVllrzUrcBcbdtcVvRy6QfPx8+5ISMGJvFTBc8Yj0q1rX6clnhsS0N+dk8DPQI5vC/jOhKTTJ
X-Received: by 2002:a25:ad62:0:b0:df7:955f:9b99 with SMTP id
 3f1490d57ef6-dff1549c637mr1516577276.47.1718348318895; Thu, 13 Jun 2024
 23:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718199918.git.geert+renesas@glider.be>
 <386a229b-6904-465d-b772-921f99815e8c@redhat.com>
 <CAMuHMdWy15T1JPH6w=xLyx_-zpHJA_VUe_Mu+h5zNPXEZw8+RQ@mail.gmail.com>
 <cff14393-d702-4fcd-8a13-034692dc931e@redhat.com>
 <CAMuHMdUGEuX+8EP3gbCB-Kgri=h34q0ryjOd5-KE-4+fWWwsGQ@mail.gmail.com>
 <20240614075949.3a3c667f@canb.auug.org.au>
In-Reply-To: <20240614075949.3a3c667f@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jun 2024 08:58:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUn4w74q0-_xDvX5vZogR68pKjmmRw0rC26jcr6_vcPMA@mail.gmail.com>
Message-ID: <CAMuHMdUn4w74q0-_xDvX5vZogR68pKjmmRw0rC26jcr6_vcPMA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/panic: Fixes and graphical logo
To: Stephen Rothwell <sfr@canb.auug.org.au>, Maxime Ripard <mripard@kernel.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
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

Hi Stephen and Maxime,

On Fri, Jun 14, 2024 at 12:00=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> On Thu, 13 Jun 2024 11:48:15 +0200 Geert Uytterhoeven <geert@linux-m68k.o=
rg> wrote:
> > > > Has the drm-misc git repo moved?
> > >
> > > It moved to gitlab recently, the new url is
> > > git@gitlab.freedesktop.org:drm/misc/kernel.git
> >
> > Time to tell Stephen...
>
> linux-next has been using that URL for some time.

OK.

Looks like the top commit of last drm-misc PR [1] is part of the
drm-misc-next branch. but not of the for-linux-next branch, while
Stephen pulls the latter.
Is that a drm-misc or a linux-next issue?

Thanks!

[1] a13aaf157467e694a3824d81304106b58d4c20d6

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
