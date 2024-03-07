Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB17D874AFC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 10:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835F4113735;
	Thu,  7 Mar 2024 09:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA25113735;
 Thu,  7 Mar 2024 09:37:02 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-609eb87a9e3so5281177b3.0; 
 Thu, 07 Mar 2024 01:37:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709804220; x=1710409020;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PojEcxi4I/RdiOARzWVwK72o2YrlsxJWpO83mdW8+30=;
 b=AKeUGR0Oq0sLr6Kli1k9KjEGaKtiH0v8jeLYtiKLvCjUcA69IK1r1d8VGZyiV2UtHH
 +UojWrAOhqLtwd97cNYKTRvmXbiM6heSqFJH7U0jYLXl+C4mHgn6emjtzdJ9potb3f+a
 8IuAFdBc977xydXojWU67hW4qudadgH4VPqdJgLpLMV5hziIvO6t68AmO/vomT2FrBso
 hW6rX55Q3tltV5QKX38NR/IDrbGNRr7LzrNQjdmDGHZBcC1fqneV1Gi+zbRAAGKh8z6u
 tMvRVABJWpiotZONLynuqA50kiGT30DzfHMAcpwRIrvT6MevOiu7L+6DHV+C1O+RAWt6
 E44w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4D98fZ8wQnh+3s/wNRPJ/ZhMWNLhfGzvQlV+qcmIxuiWGqGv1KH6IWARqSqsv+n07CzJ+Z2gpHs5mIGOIeSPjpMwNXM6REOXNAfXgAgeElus4goGbucFHAAZd+6UrAw/wDbOKYr78z8FQt2shaXwrZWrnCRhK4mrlvdIEmn6VLOZJQmBhGxR90dtL/X181kk=
X-Gm-Message-State: AOJu0YwTtMSiUmZC60jVTHQCUKg+JoPaYDpmVFznYFQ74hI6W6ITsYxj
 XqJclR1c1ltPC1HOqQxV+diM7s3S4pwh2gMnw4vpPM5Z0t+qem3tiVV8nIP0eKQ=
X-Google-Smtp-Source: AGHT+IGSKQ0uYHXueHopriuhvy/dZjuJhOcYFIndjyngJyPA+zfE+B2JjddEGOMgtVRH6R5Opl2k2w==
X-Received: by 2002:a0d:e890:0:b0:609:cf0d:9d64 with SMTP id
 r138-20020a0de890000000b00609cf0d9d64mr544536ywe.13.1709804219083; 
 Thu, 07 Mar 2024 01:36:59 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 u191-20020a8179c8000000b0060923196f02sm3215811ywc.13.2024.03.07.01.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 01:36:58 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-609eb87a9e3so5280797b3.0; 
 Thu, 07 Mar 2024 01:36:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUepn5zyfzZS0IisSsTZ1Ro8HmaaRKfeOAvKmj6l4uaTcF37A7Ugenvl8RBpCp1ufbYOdydbeN1VZw1yvNFKtgp/ep1K1dluyAdywARMgi1mWYhYzj8RPd8hAY5GR+3TInKurYS0z9e5MWvk1hEhYqJtyJzM/kfXuw0hCxgv3BWNvmKiFG69IFS0jNoWIRg51E=
X-Received: by 2002:a25:abce:0:b0:dcc:97c:5754 with SMTP id
 v72-20020a25abce000000b00dcc097c5754mr540534ybi.5.1709804218030; Thu, 07 Mar
 2024 01:36:58 -0800 (PST)
MIME-Version: 1.0
References: <e22ab28836ee1689ea4781ed53fd2e4e4f84728e.1709749576.git.jani.nikula@intel.com>
 <202403071317.uoW18ZR3-lkp@intel.com> <878r2uxwha.fsf@intel.com>
In-Reply-To: <878r2uxwha.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Mar 2024 10:36:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+54MEdrgYr+4cXnd4oN9i3_cxrpLRhJVzuJuRoUs3Qw@mail.gmail.com>
Message-ID: <CAMuHMdV+54MEdrgYr+4cXnd4oN9i3_cxrpLRhJVzuJuRoUs3Qw@mail.gmail.com>
Subject: Re: [PATCH 22/22] drm: ensure drm headers are self-contained and pass
 kernel-doc
To: Jani Nikula <jani.nikula@intel.com>
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org, 
 oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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

Hi Jani,

On Thu, Mar 7, 2024 at 9:44=E2=80=AFAM Jani Nikula <jani.nikula@intel.com> =
wrote:
> On Thu, 07 Mar 2024, kernel test robot <lkp@intel.com> wrote:
> > kernel test robot noticed the following build errors:
>
> So I'm trying to make include/drm/ttm/ttm_caching.h self-contained by
> including <linux/pgtable.h> with [1], but it fails like below.
>
> Cc: Thomas and Geert, better ideas for the include there? Looks like
> include/asm-generic/pgtable-nop4d.h isn't self-contained on m68k.

I have sent a fix

https://lore.kernel.org/r/ba359be013f379ff10f3afcea13e2f78dd9717be.17098040=
21.git.geert@linux-m68k.org

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
