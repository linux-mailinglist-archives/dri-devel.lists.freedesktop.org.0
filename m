Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BDF906938
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF6B10E096;
	Thu, 13 Jun 2024 09:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47AC10E096
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 09:48:30 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dfac121b6a6so628468276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718272109; x=1718876909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EN0VUZxh89jUmzyj9eWjf3yLJ8FuHbgZqiXwyWKisEc=;
 b=a4VmOLtwupWsu5a4hZZuT0CT0RsfTcdrMtV4oOMJK9dVuuUFp3jQx3ggSJMpbVl8dO
 A3zQAFElGhsRCsHeFq3vulTfQOtJgPK6N01TaEUpkzSEPSSEtYBtbM7uyKkrR9uXThrP
 bXXAKFQN8Q/blmS9YdPEN7zi9p1Y0R29+OA4i93+QY+WXHNJ/lZz5tne1eN2fWsuALP4
 VXNDMDiXT3PMDachUMerG8sSg96PEWhuvoXQO41McJFQrkPJqZw8iymMRAN/URNZ/Xd/
 Hp6grzLT00fXY9PYqTOxI2jGyhpi+wEUJ+N47/eL6LGS4OX+ov0ZOgdDQ7IbLFzNFZlp
 7aXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq0JM1EI5wnqO+JRM5QyZpYNEu2/rpSNj9FlESazNDUf1XZZo+ymkBPox0iAR8teanGaVisLxvT8Yq4uahTbr6yqYdXq2Xvvivz0kHaOJI
X-Gm-Message-State: AOJu0YzlVKl+NkWboA6OLH1vSkweipX8m+EObFkObjsRiUSWkgcY/Bkw
 LD7M6erfnQ9xE8zYB1Ln96jMocF3J6ca0WQvo+FCyep153b35XoZCbY8M13J
X-Google-Smtp-Source: AGHT+IEkT9Ubl0tp9rVtffxjW6pSnC4gE09OPRO2EWdUR+PAxReFQ3l+SW/SRz6zqiRSTEnKPBAUyA==
X-Received: by 2002:a25:84ca:0:b0:dfd:a1bc:a97c with SMTP id
 3f1490d57ef6-dfefebc94fcmr1238996276.4.1718272108918; 
 Thu, 13 Jun 2024 02:48:28 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-dff046686cbsm145545276.13.2024.06.13.02.48.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 02:48:28 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-631443f1a04so2596247b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:48:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVZs6B9QT58sLwrUM8VNfh2nMOLAdrd/ySGNzqQ+Qp8JcE09WBdQgNTfK/MPvIrlWrkoCGD36QrJ7RD2rp4PSEIz/8YPBV0thIj1btk/oYV
X-Received: by 2002:a81:cb0a:0:b0:622:c70b:ab2b with SMTP id
 00721157ae682-630bc213d3emr11655287b3.2.1718272108416; Thu, 13 Jun 2024
 02:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718199918.git.geert+renesas@glider.be>
 <386a229b-6904-465d-b772-921f99815e8c@redhat.com>
 <CAMuHMdWy15T1JPH6w=xLyx_-zpHJA_VUe_Mu+h5zNPXEZw8+RQ@mail.gmail.com>
 <cff14393-d702-4fcd-8a13-034692dc931e@redhat.com>
In-Reply-To: <cff14393-d702-4fcd-8a13-034692dc931e@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jun 2024 11:48:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGEuX+8EP3gbCB-Kgri=h34q0ryjOd5-KE-4+fWWwsGQ@mail.gmail.com>
Message-ID: <CAMuHMdUGEuX+8EP3gbCB-Kgri=h34q0ryjOd5-KE-4+fWWwsGQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/panic: Fixes and graphical logo
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>
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

Hi Jocelyn,

CC sfr

On Thu, Jun 13, 2024 at 11:41=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
> On 13/06/2024 11:32, Geert Uytterhoeven wrote:
> > On Thu, Jun 13, 2024 at 10:38=E2=80=AFAM Jocelyn Falempe <jfalempe@redh=
at.com> wrote:
> >> On 12/06/2024 15:54, Geert Uytterhoeven wrote:
> >>> If drm/panic is enabled, a user-friendly message is shown on screen w=
hen
> >>> a kernel panic occurs, together with an ASCII art penguin logo.
> >>> Of course we can do better ;-)
> >>> Hence this patch series extends drm/panic to draw the monochrome
> >>> graphical boot logo, when available, preceded by the customary fix.
> >>
> >> Thanks for your patch.
> >>
> >> I've tested it, and it works great.
> >
> > Thank you!
> >
> >> You need to rebase your series on top of drm-misc-next, because it
> >> conflicts with a series I pushed last week:
> >> https://patchwork.freedesktop.org/series/134286/
> >
> > I had seen that you said you had pushed this to drm-misc-next[1]
> > before I posted my series, but couldn't find the actual commits in
> > drm-misc/for-linux-next, which is still at commit dfc1209ed5a3861c
> > ("arm/komeda: Remove all CONFIG_DEBUG_FS conditional compilations",
> > so I assumed you just forgot to push?
> > However, the latest pull request[2] does include them, while linux-next
> > does not.
> >
> > Has the drm-misc git repo moved?
>
> It moved to gitlab recently, the new url is
> git@gitlab.freedesktop.org:drm/misc/kernel.git

Time to tell Stephen...

> and the drm_panic kmsg screen commit is there:
>
> https://gitlab.freedesktop.org/drm/misc/kernel/-/commits/drm-misc-next?re=
f_type=3Dheads

Thanks!

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
