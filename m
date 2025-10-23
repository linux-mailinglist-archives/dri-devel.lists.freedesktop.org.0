Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11EAC0069C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 12:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3D310E1E3;
	Thu, 23 Oct 2025 10:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aKvEXBY3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D4810E1E3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 10:14:55 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-59054fc6a45so942771e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 03:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761214494; x=1761819294; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kCE2z4wkYGzvbLAc/K6W1fc+2osskFtUXN3TNkuq9e0=;
 b=aKvEXBY3WiViV3yCbznOPjxWn86Y3a0zROFwxtR4WAuP1uUW6dinctBAXIK8FqhiyU
 JmXsGuj5jBRxgAWWWIXWKpOZzPbqjFyvz5aFxKeenSB1+lzzaUTeKsdOthc68EmC5ckd
 vqMTAKKPZV6heYwiaLiT09p4W+jks8lbn5ARVJeNEpu3QjRYmatU1Qh+NE1fx+lum/e/
 ez5RMaVOTEtj99+jeonRkFADoxFcxx/Er5rAl6SNCKknlsK/TWZBXEib0MJe0wSf1GIJ
 JxlJbko++6vm1BDfB782g5JkZpyNGYy0++h1fdcAWcaD83M3kLJecgA25Zz/KXVQdwMx
 h1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761214494; x=1761819294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kCE2z4wkYGzvbLAc/K6W1fc+2osskFtUXN3TNkuq9e0=;
 b=hkRwzsRiyMS09TABYHxzV+HlMkdyNHWYBByxWND0i8m+xa9a3Z9WCpw0+6SYKTmaCz
 u4VCw/QHJiBkzRYPlcBIiG74nG/LKk7xGYomwIUqpKRPKEDMEEbQ5vzjuUQuNzBlCuFO
 nmeL5+wM+F5lDh3mYvHzfVvNDPPlGUyOcAgIMBA+Ep0Bm1gqCv8jAqAVmcOujf1JnfUS
 51gsea/tXgDRzPGPsg7a1JaCAAE7GAOj5x8bu8TzLk9daTRChWEvdFOYDaYR+GeB0vp3
 LH1nNDVQD+byPeR1E3PMvsgkXDkJu8f2Xwa8FwwLenuzqHUvkVmBJZzbu686QOXA6FkU
 Xvlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWArStiF6Q01UJ9RU9fL0kIED6eIZPnn+/hvswfGqpHe0x2Vrms954vhLI5tGp5xY7BIS2SO095ALg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXfG764StiPLvzE93dORa+7DbWvKNZdj3LxleN3QyFEPVV4hEI
 dJzrss+1T4FRsNOz4vCfhpVGpQIVkqhQsM4hLvzehy6JwefKfSTrwKamonY0KYGSttLKUdSI+m8
 z046thg5sShEz/vEGYW64IXe/QrXAE48=
X-Gm-Gg: ASbGncs+oUESnS3gSEZgbZ5o26kOGyYGPBdnM71sIe5tkTP8t/nEd+emx70MMG7OEpD
 Q1+tSy0WVRg/PCryd+0rqI9kOuzLvLFU+ocpT8FqUr+0FAAqqe3j9vWFmWqMbhdOhSDflm/LPIK
 96iH3IldazeYRUFabr4AWaR8TJRuci3GJD8pZPvPJCJGcUVxX7vklFUGj7dINLX4xEvuPFQYYZe
 cfKbn/75IfeRR7VyjJ8j3KKlJZ9n/yzZMfSyEKzz++1Bz3ErtVbaWyf70oXdw==
X-Google-Smtp-Source: AGHT+IE78l4zjJijoLwVzewdgQkLJWS54jIN7RllyKzp4Mq+f0mmNw/Ii8gOTYnEGn18nRcwOV/Glk3RuLed1KICQ4Y=
X-Received: by 2002:a05:6512:b11:b0:55f:6adb:b867 with SMTP id
 2adb3069b0e04-591d859984bmr7477224e87.45.1761214493617; Thu, 23 Oct 2025
 03:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
 <20251009233837.10283-3-mohamedahmedegypt2001@gmail.com>
 <CAA+WOBvVasy2wRP_wmP-R6Q8y5B4sN08jNYfHuDVjiWXV+m23Q@mail.gmail.com>
 <904ba70f-b1bf-4745-8e92-d27a6c903673@kernel.org>
 <CAPv6GL2DQ_wY=r4eV_V=nBGaj20HtYzRfJg==rQJtuO8Fo+HAg@mail.gmail.com>
In-Reply-To: <CAPv6GL2DQ_wY=r4eV_V=nBGaj20HtYzRfJg==rQJtuO8Fo+HAg@mail.gmail.com>
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Date: Thu, 23 Oct 2025 13:14:36 +0300
X-Gm-Features: AWmQ_bnwiEKbYnJwbZXRCmBHVtFK5pPcT6vg0cz54jq0PEpcBMa2utOihxE5H34
Message-ID: <CAA+WOBvfStqh+HTXYrrD_=YUXPYNaKLgHPLQ9g07gfQmAXKAWA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/nouveau/uvmm: Allow larger pages
To: Mary Guillemard <mary@mary.zone>
Cc: Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org
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

The other thing making me hesitant of depending on
nouveau_bo_fixup_align() is that VM_BIND is entirely client controlled
and there isn't really (at least as far as I understand) way for the
bo_fixup_align() path to have enough info to e.g. work around the
"client allocates size and binds to address not aligned to that size"
issue (likely the reason for hitting the mismatch case. this didn't
show in the older kernel versions because everything was forced to 4K
anyways).

On Thu, Oct 23, 2025 at 12:39=E2=80=AFAM Mary Guillemard <mary@mary.zone> w=
rote:
>
> On Wed, Oct 22, 2025 at 10:56=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> >
> > On 10/22/25 12:16 PM, Mohamed Ahmed wrote:
> > > Pinging again re: review and also was asking if we can revert the
> > > select_page_shift() handling back to v1 behavior with a fall-back
> > > path, as it looks like there are some cases where
> > > nouveau_bo_fixup_align() isn't enough;
> > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36450#note_=
3159199.
> >
> > I don't think we should add a fallback for something that is expected t=
o be
> > sufficient.
> >
> > Instead we should figure out in which exact case the WARN_ON() was hit =
and why.
>
> The reason I wrote this code initially was to handle addresses
> provided by userspace that aren't aligned to the page size selected
> during BO creation.
> This is something I did trigger when typing this patch initially with
> my distro provided version of mesa (likely 25.0.x but it has been a
> while)
> Thomas Andersen also confirmed on nouveau irc channel that he did hit
> this case with an old version of NVK and this patchset.
>
> I think we could just remove the WARN_ON and properly document that
> this was previously allowed and is there for backward compatibility.
>
> Regards,
> Mary Guillemard
