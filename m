Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC93BF2B9F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 19:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAA810E49E;
	Mon, 20 Oct 2025 17:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AyPxJ7eh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFB410E49E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 17:33:04 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-339d7c401d8so1133010a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 10:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760981584; x=1761586384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VI2PtJUq4Sc30HWOhQj8ldzwhG1vYDstA/zAjK88nRU=;
 b=AyPxJ7ehtvGnlu7gVium/xO3xN5ndGmZKE5fbNq1Z5zNw7IMlYvk+iwlm3LyHz328e
 ttMqDe4NExxijF27WiSaeQQydWVFgku86re+HOcQv8oj6nTsFwmTOl55zEMEvinL/UQS
 A1O3AgSqB9+gTEwl+Zz8wkWB7zdEMhFic5SYqqiK6kkvLwxJNmQz14iOdBktG1fMPoXZ
 6Yi9LeMp0TlKDmGox3pb1j3xz3khU/LDkKxAxV0HVzHT/SHz8WI0aDCN1IQjczvoIwaZ
 OA2SVPZAjxj6Mx7nvq5AD/c+r41yT5kuVaVG5Ldbx3f54Kf2jEzrDPfkaRy4j1JOTD0D
 g1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760981584; x=1761586384;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VI2PtJUq4Sc30HWOhQj8ldzwhG1vYDstA/zAjK88nRU=;
 b=smSWEW8ZOpltfT25Mi6a7THQy7OD/gDPLiS4wuJhDQ52esIDLd34z01KKEAiNpJtTh
 URZrFI8iJ6vmG6/Dag310vE5tsQxx4/7+6hO05y6VobPHbGxvJq+RbL38Mu3Y3H2dBqi
 k4YTOxu7xZJNetuWnGVS8XdKQJunThL2HMk5639ZLc/za8+8LwieCCQ/X9eyuElGmiBu
 54FuGxJ0jSCxXrjPOmuALFhfkyubPkhcjL1Wc1aDHSsuRVAjBXsirOYXraLnJP65fzYZ
 isnN0YbkxP1d221PdCShqr8iLbxgtig/y04loAS/OrVGCCujmjiz+jNvtiaFPHy26Y+q
 lCIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn4BdxFb94EOM6Q0duH7eBSpBWgk8O+bI7NYpwItf1BjIzuHF56v76LNuj+fcCndaRtoIZCiZVp0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOsF7v1HJ+yCHeUIGG/Ewsd+FwxnAJ1fqI6g9T0zeHZRlY3pm7
 01hGJkfMG9S0Zg6tB+kNQESPqXxcPcCZT1S/cHWVHV7hcDR8rtMq0tGSPDMCU3/1WRHJhI1yo/H
 f6YU8en3YeL0jVgeL1OmAROWk3I+nW9o=
X-Gm-Gg: ASbGncv9rQIOklHBSQZS8D7uedyqQrWMyh8sodSOQtSedEeXaYZZAl7RVE5Y4vQMkLe
 jKB4ofAGG3BnCTmJwY5xdKRWfrRQJ1/hJN0reSstKR0U5Xw2OzmZ13g7mvTwVZt9weC5+TFgPLO
 7o3tzC7zXbaaRn38nDjfYq6HscAwoAfifWSKg9tK8OlmSOFVzGvj+nS453AlvgzJbbEseVUtLNv
 LFJhi83vXNsIuu0CHVgElWyt327hM+Y4QvbgjZUZeukMkOKxWxIMrPTqDY5yMUDO4MlVI0=
X-Google-Smtp-Source: AGHT+IFU+KqAEkbMCW8Xf53JYAtbqincSoO/rgEjO02snl6niQ+EZQMNsesNeWJPPWOHadiHVfJVBWRPjcMTziYcl0I=
X-Received: by 2002:a17:903:8c8:b0:277:c230:bfca with SMTP id
 d9443c01a7336-292d3e57324mr1368175ad.4.1760981584179; Mon, 20 Oct 2025
 10:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251018054451.259432-1-daniel@0x0f.com>
In-Reply-To: <20251018054451.259432-1-daniel@0x0f.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 Oct 2025 13:32:51 -0400
X-Gm-Features: AS18NWD66tyW2gm21ozKGA5vxvXrn7M693EyUTlpuxSeBNhOvz2jwM0dQyB4ats
Message-ID: <CADnq5_MBLAOsam77vZME=rjOoDMXL_+J+grxXVGz2ekxO=512w@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/radeon: fix up some badness when probe fails
To: Daniel Palmer <daniel@0x0f.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, wuhoipok@gmail.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Applied.  Thanks!

Alex

On Sat, Oct 18, 2025 at 1:51=E2=80=AFAM Daniel Palmer <daniel@0x0f.com> wro=
te:
>
> I have been trying to get a Radeon 9250 running on an Amiga 4000[0].
>
> On that setup it fails to find the BIOS and the probe fails which is
> expected but then a bunch of WARN_ON()s etc are triggered.
>
> I though maybe this is "m68k problems" so I bought an old x86 board and
> there if I have a different primary VGA card the BIOS part of the
> probe fails in the same way and the same scary messages[1] are showing
> up in the console.
>
> It seems like the probe failure path wasn't tested when some previous
> cleaning up happened.
>
> I'll fix the issues with not finding the BIOS if the card wasn't
> initialised in the normal x86 way later.
>
> 0 - https://lore.kernel.org/lkml/20251007092313.755856-1-daniel@thingy.jp=
/
> 1 - https://gist.github.com/fifteenhex/b971bd62c49383a0558395c62c05ce3b
>
> Daniel Palmer (3):
>   drm/radeon: Clean up pdev->dev instances in probe
>   drm/radeon: Do not kfree() devres managed rdev
>   drm/radeon: Remove calls to drm_put_dev()
>
>  drivers/gpu/drm/radeon/radeon_drv.c | 34 ++++++++---------------------
>  drivers/gpu/drm/radeon/radeon_kms.c |  1 -
>  2 files changed, 9 insertions(+), 26 deletions(-)
>
> --
> 2.51.0
>
