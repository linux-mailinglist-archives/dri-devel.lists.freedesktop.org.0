Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1531CB4480
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 00:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8F210E6B4;
	Wed, 10 Dec 2025 23:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nFPo1vGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958A810E6B4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 23:40:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B043460122
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 23:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B0CC19421
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 23:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765410036;
 bh=8mdLuUcGNhGwX2gZHAmIZ6TtNKnsq4Y0pG8qMt1mrCc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nFPo1vGqtw0H35+0xJ9ovp4hL1kEZ/6urfDJX2DdjFoeubG0FvSB/A7h59U1Dyemp
 wjn+9r06KdIOSea2eUyuUDoymYVzfkB1F2H2jyCljZTouyTQ7KfWHubQpS8F0E5KCR
 YYyVluY7t3wumxZyw6a+IkiuFZi8mRBt3VO7VhHqrbs5BFO2jZ1LG5YkLx880J9Rg5
 0EbyKaZoKSmgMIfjXcC3wwr+8hwLbaeVx21s97ek3rcYJaIeCwJuJ+DQhaoDIpEMEc
 xbMIFhn1oolj6qVDciLehI0LzopmZ8pJkLgyG17fk7jFWC6ZshMFfD7Ontp7ZuDfWk
 F1jkApAHrIXdg==
Received: by mail-yx1-f51.google.com with SMTP id
 956f58d0204a3-6420c08f886so386615d50.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 15:40:36 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVuXbQRAq3cQYee0VTi026lNN8/Vs4wxLl0cBAA3jb57TZStFZI0LS6lt22vEQIN71qdsfxxAaYZb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpvNAPUAgeSCHH+3pUAg1jcMEw/fo6nZXui9R/r1egkwBlFpFM
 +2H/Fno2VCjsDVarIO+zQ2cZaiuEmqCvExZJCBlVwgoNzia3FXVAwkfLNBFnnlWJXRhrGxV/RGl
 rzUcx/CZGQTAUVqvCrS4t7QCEih1KqCA=
X-Google-Smtp-Source: AGHT+IGVSX6bWe1V3h9eascvdn6Qxs/rl1BajRaprfaYmLEr1fi/VfmHD5WOEArIukLacDzxPjqg3v+hzYz5nYqHPTQ=
X-Received: by 2002:a53:e033:0:b0:63f:c487:17ab with SMTP id
 956f58d0204a3-6446eb4ddd5mr2874211d50.47.1765410035784; Wed, 10 Dec 2025
 15:40:35 -0800 (PST)
MIME-Version: 1.0
References: <20251125194215.427111-1-eslam.medhat1993@gmail.com>
In-Reply-To: <20251125194215.427111-1-eslam.medhat1993@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Dec 2025 00:40:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLkJPooShT2j75umJAoP9jazSiEAP2bBw5dX97iHih_DRQ@mail.gmail.com>
X-Gm-Features: AQt7F2pY4sPeCXoWAGEggpijH_07u-cnfVeY1SHOymqRvvPrJ6-JQxfrcoTXugg
Message-ID: <CAD++jLkJPooShT2j75umJAoP9jazSiEAP2bBw5dX97iHih_DRQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: pl111: replace dev_* print functions with drm_*
 variants
To: Eslam Khafagy <eslam.medhat1993@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Nov 25, 2025 at 8:42=E2=80=AFPM Eslam Khafagy
<eslam.medhat1993@gmail.com> wrote:

> Update the PL111 CLCD driver to use DRM print macros drm_*() instead of
> dev_*(). This change ensures consistency with DRM subsystem
> logging conventions [1].
>
> [1]
> Link: https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functi=
ons-with-drm-device-parameter
>
> Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
> ---
> v2:
> * Add mssing include file drm/drm_print.h
> v1: https://lore.kernel.org/all/20251122004951.567753-1-eslam.medhat1993@=
gmail.com/

Patch applied and pushed for next.

Yours,
Linus Walleij
