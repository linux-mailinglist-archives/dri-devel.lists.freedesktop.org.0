Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1449086A9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 10:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065D110E113;
	Fri, 14 Jun 2024 08:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE4A10E113
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 08:45:16 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dfdff9771f8so2103612276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 01:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718354715; x=1718959515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EiCB/V+P1k2dIn6UNeliORv8jYhwFlA7j9q655dR7a8=;
 b=JWHjBeLAydnnl0SNVnimNHBJ3QG+lmT0/wPgPiEQzJxnVWC8gxBNgjckAv/UlHkdB2
 CQQuLnJyHyLCKbvd/UCidq9WnY75Hr23J+5novI3GSTxxuPmit1ffsm6OIBCk4t+/jJK
 tjxGUwVkgUrkIQxjnF2pyGP7o4csx0A5MqXtNPhIXAfH3N1ijWtuEaSZxwQXGbtCx40h
 oVfaPAC4EwiXG0SRVdk6c91aQshwPMsEGD4/z/eD+DOyfuSsjctkllzf8bgNWQiP7Hf3
 gQOLT4SsliSXzGZM85PFtCgNOH0t8nRR+X36AcpxQqr+nL+eYGDElxdU0mdiABZS+EzM
 4Z3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEAE8b5GK1TmAKnDv6QX8xk4n+heCnyqlnz6v6uRQXjwXa5HYbn9hxEcn2WPhPb/IDNNX7D5kYqpr9T59pXlNjdeVr0usVELHIrplr3NgY
X-Gm-Message-State: AOJu0Ywnn+CLvSi0vbS2If/DYK3vkehpH6HRrtSyklCOQ0/2Us6IrDsa
 bIlrxh35cye4S1hYtqhXq44JxGm6PIlg8GaxyJP5OP4pgLS71mqqEv5leiJP
X-Google-Smtp-Source: AGHT+IFh1NrpkOAR8yCXB25BjrGpN5fSkIoOJc9iHzNEU+sJecicFFCUm0TWtJ6cqDPr9UMf7qbMPA==
X-Received: by 2002:a25:24c:0:b0:df7:7065:24cc with SMTP id
 3f1490d57ef6-dff15470905mr1780403276.61.1718354714740; 
 Fri, 14 Jun 2024 01:45:14 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-dff04a4d7e9sm443915276.41.2024.06.14.01.45.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 01:45:14 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dfea5f628e9so2255866276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 01:45:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXJi9W1hWYyOEZnb8Jmvog4tfI0cqyoHfaVuDST9Yih0uJaNrOHZyGqKyJKHaWxzIxX89qjjETdIY1Sy0m3ymYFUBDKr5dKkrFbH1hWYiq4
X-Received: by 2002:a25:b21d:0:b0:dfb:dc8:a0ac with SMTP id
 3f1490d57ef6-dff1544368amr1814971276.42.1718354714280; Fri, 14 Jun 2024
 01:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718199918.git.geert+renesas@glider.be>
 <386a229b-6904-465d-b772-921f99815e8c@redhat.com>
 <CAMuHMdWy15T1JPH6w=xLyx_-zpHJA_VUe_Mu+h5zNPXEZw8+RQ@mail.gmail.com>
 <cff14393-d702-4fcd-8a13-034692dc931e@redhat.com>
 <CAMuHMdUGEuX+8EP3gbCB-Kgri=h34q0ryjOd5-KE-4+fWWwsGQ@mail.gmail.com>
 <20240614075949.3a3c667f@canb.auug.org.au>
 <CAMuHMdUn4w74q0-_xDvX5vZogR68pKjmmRw0rC26jcr6_vcPMA@mail.gmail.com>
 <20240614-fractal-organic-doberman-ee0cc5@houat>
In-Reply-To: <20240614-fractal-organic-doberman-ee0cc5@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jun 2024 10:45:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUmHQ43kH-5KOR7crL_-G6S=h5WmpLN3zo+snu_OuhkLw@mail.gmail.com>
Message-ID: <CAMuHMdUmHQ43kH-5KOR7crL_-G6S=h5WmpLN3zo+snu_OuhkLw@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/panic: Fixes and graphical logo
To: Maxime Ripard <mripard@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Jocelyn Falempe <jfalempe@redhat.com>, 
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

Hi Maxime,

On Fri, Jun 14, 2024 at 10:35=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Fri, Jun 14, 2024 at 08:58:26AM GMT, Geert Uytterhoeven wrote:
> > Looks like the top commit of last drm-misc PR [1] is part of the
> > drm-misc-next branch. but not of the for-linux-next branch, while
> > Stephen pulls the latter.
> > Is that a drm-misc or a linux-next issue?
>
> This was a drm-misc issue, it should now be solved

Thanks, confirmed!
(and updated my .git/config for next renesas-drivers release again ;-)

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
