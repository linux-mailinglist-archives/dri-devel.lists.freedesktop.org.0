Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC78867163
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 11:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9A910E4DF;
	Mon, 26 Feb 2024 10:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426E210E4DF;
 Mon, 26 Feb 2024 10:38:42 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6087d1355fcso14920167b3.0; 
 Mon, 26 Feb 2024 02:38:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708943920; x=1709548720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FrYmo90Nesq3SfmWdmUZ7XCViXsN5VGIIAMhD4WvIKo=;
 b=Mfanh7pLt6p7lov3wPHnmFyePu1DQDPgE8xVl2z7aJxdxQIwBoRr/soZFyX04ZJv4w
 dFgCPXbriUCtvom6QRqxYjDS9XlLVc8wa2nqiPTHHA4069gOgU3UO/v/KnFZ6iabialM
 +01GL7UMv9Kvz4Myo7baa8ofJAY+sRMyiGi3GoAM8rNl9C9aSHrZYIcG1cTyVeImaRH0
 cQfxcQ678C1TZs8hOpbnq+cQymly4pgzIHg/hdwBTqWN7YgIrXAtyqpRLipycA6XVJqY
 1v1wxal3Fl9zkqUq2ynxZ3c70X1OAHH2y8i/EP92GL0GwbMzlnxZC7Ms8ICQe8ZpPtmL
 s8hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD8mWjSkqrz3lAi23bWnm1DwLXUiXEJNfHWDmfVMbeji8uFbBwdwmW4SAcg1cConkjMvjwRPGPHx8HvQEMPflUn1Z3j2Osoi5M/rGpGlJ+rDt36ICZvXZCpck2DAq1QofYv42RSb0xr0hxx20fxyw=
X-Gm-Message-State: AOJu0YxIMpmN0fDixBIRlOsysq8sfCUfouNLxMQdQUxW5KDI798r+jyj
 P29D9X+qEeoMyGzB2iX9fgTLdBYIB2+maYjmswFOMrx/U2qJHnt3MbneMUBtsI8=
X-Google-Smtp-Source: AGHT+IGlj/b9wnvU83YGJHDLFD68u1B3FqziIGOoNMHYBUD5T3d5Y1+JTtXNKk3uHWIXxMwfc1wpUg==
X-Received: by 2002:a81:bc52:0:b0:608:8427:206 with SMTP id
 b18-20020a81bc52000000b0060884270206mr6154868ywl.27.1708943919647; 
 Mon, 26 Feb 2024 02:38:39 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 p201-20020a0de6d2000000b00608b3e03ec7sm1118766ywe.90.2024.02.26.02.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 02:38:39 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dc6dcd9124bso2957043276.1; 
 Mon, 26 Feb 2024 02:38:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVYdTtrVPAdW+tgOElH5uubyS5+fsXVkDTstouwUQ/bNvtpAi6UAkMR9LIBib5UJ92EpB9w9OE7z7irxhfMAJNDpVzB0O3olVPuRJ/vzNHgh52fiAvzCUO/zgpakiUpEZPtthDNwrXTG/M0dyo3j0I=
X-Received: by 2002:a25:2fc3:0:b0:dcd:3a37:bdb1 with SMTP id
 v186-20020a252fc3000000b00dcd3a37bdb1mr4219609ybv.44.1708943919042; Mon, 26
 Feb 2024 02:38:39 -0800 (PST)
MIME-Version: 1.0
References: <20240215174431.285069-7-matthew.auld@intel.com>
 <96bb6e97-34d9-4e4a-b618-85c17e809738@intel.com>
 <5a9e1f30-19fc-486f-b7f5-016d82580d2f@amd.com>
 <4aea62d4-8c2a-4406-b81e-240dca772da4@intel.com>
 <45059d66-6e80-406b-aae2-72f8b8d142cb@amd.com>
 <dc8c7d2b-4c2f-41dd-9812-3699444d5273@intel.com>
 <94afe80c-9e4f-47a7-a758-17ab26eb4c00@intel.com>
 <58e423e8-316e-40e0-b622-136ca6cc0189@intel.com>
In-Reply-To: <58e423e8-316e-40e0-b622-136ca6cc0189@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2024 11:38:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUjwXS=Ow+DccWbcee9+vbkdD7dWp5M9FrnC-nFRZcwTw@mail.gmail.com>
Message-ID: <CAMuHMdUjwXS=Ow+DccWbcee9+vbkdD7dWp5M9FrnC-nFRZcwTw@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/tests/drm_buddy: fix 32b build
To: Matthew Auld <matthew.auld@intel.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Maxime Ripard <mripard@redhat.com>
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

Hi Matthew,

On Mon, Feb 26, 2024 at 10:58=E2=80=AFAM Matthew Auld <matthew.auld@intel.c=
om> wrote:
> On 19/02/2024 12:24, Matthew Auld wrote:
> > On 19/02/2024 10:48, Matthew Auld wrote:
> >> On 19/02/2024 10:30, Christian K=C3=B6nig wrote:
> >>> Am 19.02.24 um 11:28 schrieb Matthew Auld:
> >>>> On 19/02/2024 09:53, Christian K=C3=B6nig wrote:
> >>>>> Am 19.02.24 um 10:42 schrieb Matthew Auld:
> >>>>>> On 15/02/2024 17:44, Matthew Auld wrote:
> >>>>>>> Doesn't seem to compile on 32b, presumably due to u64 mod/divisio=
n.
> >>>>>>> Simplest is to just switch over to u32 here. Also make print
> >>>>>>> modifiers
> >>>>>>> consistent with that.
> >>>>>>>
> >>>>>>> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous
> >>>>>>> test")
> >>>>>>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >>>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> >>>>>>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> >>>>>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>>>> Cc: Maxime Ripard <mripard@redhat.com>
> >>>>>>
> >>>>>> Any chance someone can push just this single patch here, since it
> >>>>>> fixes 32b build? It already has an r-b from Arun.
> >>>>>
> >>>>> Already working on this. Just give me a few more minutes.
> >>>>
> >>>> Thanks.
> >>>
> >>> No, problem. I would have pushed this earlier, but my build server
> >>> doesn't want to work any more. Looks like the SSD has passed its
> >>> warranty :(
> >>>
> >>> Should I push the other three patches to drm-misc-fixes as well? I
> >>> currently can't even build test them.
> >>
> >> Need to send a v2 for that. One minor change in the test just to be
> >> consistent with using u32. Thanks.
> >
> > Sent v2. If you could push that when you get a chance. Thanks.
> >
> > https://patchwork.freedesktop.org/series/130075/
>
> Gentle ping on merging v2.

Your v1 and a fix from Linus already made it upstream:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/driv=
ers/gpu/drm/tests?h=3Dv6.8-rc6

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
