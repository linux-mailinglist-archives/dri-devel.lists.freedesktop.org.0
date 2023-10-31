Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5767F7DCD68
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EA610E4A8;
	Tue, 31 Oct 2023 13:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2341110E4A8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 13:00:21 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-d9caf5cc948so5072579276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 06:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698757220; x=1699362020;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U2/9SzfZn7NzTarkU7G1sDrbFVriBS+2+GtDvbflE38=;
 b=sRvbn6gH39N1leKgRigoW7czASVNlFCvytOm0wJ74IGvR39OnjTsVXwF8J0nH+ezvV
 hb/CFtBXlY3V8N/kH89Wwa3Hnra8+eMH5/db6i0OSfu5LgDN1hI5ZCIX/yFJtptYBAr7
 v8tUnASfu2tBH1dvMHjwuPoYF/9WUvZw/YHfaGCuctNq7BwENLYRg2Dq/j3dsZ/WChiy
 4qy8LlR6o+iOfwxmGJ86tlue3z+klP+RltVmfq2QREKaVgqNwxYaFcWUG++HMzTVqVe6
 MxWb8POHogTwzhalSvFdLJO6PdjwbjTG2BZ3w0d1cwz6jvzX7BBLA7LfvEeS2IEyireE
 m0jA==
X-Gm-Message-State: AOJu0YzTE7B2a5fdG96uJy7yBeR4+WsLw+DRzkIcc3GGU+X/ro+JkDDP
 HEnzUEHVvKRCUxs2akmfvo74dH/r8zaA/g==
X-Google-Smtp-Source: AGHT+IHFos8dOOGtv4laT2TDgTSeQFNdypChLIqh0FpB5XM97SfWEUooC3HRMeeHbLKKCeL+ucW1OA==
X-Received: by 2002:a5b:88a:0:b0:da0:9523:dde7 with SMTP id
 e10-20020a5b088a000000b00da09523dde7mr10887326ybq.63.1698757219545; 
 Tue, 31 Oct 2023 06:00:19 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 f13-20020a25b08d000000b00da06fc45421sm760396ybj.54.2023.10.31.06.00.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 06:00:19 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-d9beb865a40so5052874276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 06:00:18 -0700 (PDT)
X-Received: by 2002:a5b:c49:0:b0:d9c:7d48:3020 with SMTP id
 d9-20020a5b0c49000000b00d9c7d483020mr10891107ybr.20.1698757218586; Tue, 31
 Oct 2023 06:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231020225338.1686974-1-javierm@redhat.com>
 <b048247c-75e9-488e-a4f3-b227a38bca5e@redhat.com>
 <87v8aso1ha.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdVLf=H7QWaUXrN17ABw9eE1MjBdzFEM0AhMNj8_ULSz+Q@mail.gmail.com>
 <87lebjksoj.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdXdYm6Opyhgte7CaScs_jdPNUqrQTbPCMSQXqkKpKTd8w@mail.gmail.com>
 <87il6nkp6e.fsf@minerva.mail-host-address-is-not-set>
 <2eh6i4ttpepnpehw47zucgrs3rvzugxiay7eqy65phktcm2m4r@zwzyn5rn55yl>
In-Reply-To: <2eh6i4ttpepnpehw47zucgrs3rvzugxiay7eqy65phktcm2m4r@zwzyn5rn55yl>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Oct 2023 14:00:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHq6yE14YqA+GNj=V79Z1rYTK=8Dx5WWw3RczrzMy21A@mail.gmail.com>
Message-ID: <CAMuHMdXHq6yE14YqA+GNj=V79Z1rYTK=8Dx5WWw3RczrzMy21A@mail.gmail.com>
Subject: Re: [PATCH] drm/ssd130x: Fix possible uninitialized usage of
 crtc_state variable
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Tue, Oct 31, 2023 at 12:53=E2=80=AFPM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Tue, Oct 31, 2023 at 12:27:05PM +0100, Javier Martinez Canillas wrote:
> > Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > >> >> Pushed to drm-misc (drm-misc-next). Thanks!
> > >> >
> > >> > Looks like you introduced an unintended
> > >> >
> > >> >     (cherry picked from commit 9e4db199e66d427c50458f4d72734cc4f0b=
92948)
> > >> >
> > >> > ?
> > >>
> > >> No, that's intended. It's added by the `dim cherry-pick` command, si=
nce I
> > >> had to cherry-pick to drm-misc-next-fixes the commit that was alread=
y in
> > >> the drm-misc-next branch.
> > >>
> > >> You will find that message in many drm commits, i.e:
> > >>
> > >> $ git log --oneline --grep=3D"(cherry picked from commit" drivers/gp=
u/drm/ | wc -l
> > >> 1708
> > >
> > > Ah, so that's why it's (way too) common to have merge conflicts betwe=
en
> > > the fixes and non-fixes drm branches :-(

> That's also not as bad as Geert put it: merging two branches with the
> exact same commit applied won't create conflict. If the two commits
> aren't exactly the same then we can indeed create conflicts, but that
> would have been the case anyway with or without the "double-commits"

Oh it is, as soon as one branch receives more commits that make changes
to the same location.  Which is fairly common, too, to the point
that I am surprised when merging a drm for-next branch does not trigger
a conflict...

Cfr. the conflict I had to resolve this morning between commit
64ffd2f1d00c6235 ("drm/amd: Disable ASPM for VI w/ all Intel systems")
already upstream, and commits e5f52a84bf0a8170 ("drm/amd: Disable ASPM
for VI w/ all Intel systems") and follow-up 2757a848cb0f1848
("drm/amd: Explicitly disable ASPM when dynamic switching disabled")
in drm/drm-next.

Note that none of 64ffd2f1d00c6235 and 2757a848cb0f1848 has a "cherry
picked from commit" line in the commit description.

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
