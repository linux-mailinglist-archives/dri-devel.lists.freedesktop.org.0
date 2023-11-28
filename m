Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D88827FB6F3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9F110E47C;
	Tue, 28 Nov 2023 10:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249DD10E47C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:16:36 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-db4050e68f3so4961295276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 02:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701166595; x=1701771395; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=az09m0h7jONXF1DY571MoHHhddA+pAfUddfadnw5xbM=;
 b=nawKdfeBvKqCaJsxWi4c6G9aWKK9R72U2QBa7nIn5zhjSDEcelwr7+mtg5kB24tqt0
 6NpK2jabDtsKL9wZ+mVZUB21j/NnWLEy4OtGX7ZwaZPuN+UT1RJosNse98pPZYNWt8ob
 64VFJES5SgcoopFV7rXarxDBFGzUmYCsPj8Qi9r22a4iNx2i78v7CkGSkxowoGN0LMR0
 MYJm7FKrVRo+3ARa4/eIjH5eZm6K3HfvDwoiutUr2ZZWFzRjdN3jyHKdZFVHOhD/knSh
 e5EqFlQVGO38DHhgYytDaOk7EinR8YzEdEGc4Qx55XtbBNVmHKitCJ51lc6/9aEV762b
 Rw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701166595; x=1701771395;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=az09m0h7jONXF1DY571MoHHhddA+pAfUddfadnw5xbM=;
 b=qhcxa1lRSIHAVpg2IExB0iTnV9srhc0tpfXzBYPGxPzwkU1YLV3O/D/s/OyBZhIWFL
 JnZXdqPbqv8TjCX5nWa1ws50S6wYUew78GGCRNYu0za0t7/xnvAaB/xAP4io6g8N+WkR
 Vofr3j2rcnrHYjOu1Q6GVRYWBV8sL+cxnTLxlg28gEbkE2A2yG4YLRSsd06nJTKOiSEL
 /e3RV1hJ0mZNmlyb3lq4VN2tGTaNH3ThBvW4fWD9ORdwJ876IxW/xuiO1nwfBik+BXBc
 x/Lnpuv/krj2HkxG+Wqo3jvtWOgXgFuu+JZwghE72cgF6pc+vlWjJgR1ghSO/86efRi5
 31vQ==
X-Gm-Message-State: AOJu0YxXw0dpJ0DRmmhrI80tJCezUqlg9BIoBli8PsfPL675nicDVB2A
 AWIegMdRSMd+uSmQg8qrLbmGpPmj5IZLzqbCWEQVdA==
X-Google-Smtp-Source: AGHT+IEKfi0a8Ktnneb/ArA2n6UZ+H0NiLFIih34xe+5JdldBuidRBT70xvjvMtby6rJJlfMfCIcVYNAtUFQSGFfyGk=
X-Received: by 2002:a25:870b:0:b0:da0:c887:36cb with SMTP id
 a11-20020a25870b000000b00da0c88736cbmr13361932ybl.45.1701166595298; Tue, 28
 Nov 2023 02:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
 <170116632194.2250210.1478661000647719120.b4-ty@linaro.org>
 <b6d79cad-a545-48cb-a0e4-e9fdc457bec3@linaro.org>
In-Reply-To: <b6d79cad-a545-48cb-a0e4-e9fdc457bec3@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Nov 2023 11:16:23 +0100
Message-ID: <CACRpkdaAFoMnjha0+yWPDhj=RGyP3tzFOq5+bp7Uv8H2bkFW1w@mail.gmail.com>
Subject: Re: (subset) [PATCH 0/3] Revert panel fixes and original buggy patch
To: Neil Armstrong <neil.armstrong@linaro.org>
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
Cc: Maxime Ripard <mripard@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 11:13=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
> On 28/11/2023 11:12, Neil Armstrong wrote:
> > Hi,
> >
> > On Tue, 28 Nov 2023 00:10:18 +0100, Linus Walleij wrote:
> >> This series reverts the attempts to fix the bug that went
> >> into v6.7-rc1 in commit 199cf07ebd2b
> >> "drm/bridge: panel: Add a device link between drm device and panel dev=
ice"
> >> and then it reverts that patch as well.
> >>
> >>
> >
> > Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git=
 (drm-misc-fixes)
> >
> > [3/3] Revert "drm/bridge: panel: Add a device link between drm device a=
nd panel device"
> >        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D9b6a59e5d=
b87c2c6b3ca0391176ed4358623d5e4
> >
>
> b4 got really confused that I picked the patches in the wrong order, but =
I applied
> the 3 patched in the 2, 1, 3 order.

Special mistakes requires special fixes, sorry for the mess :(

Thanks a lot Neil!

Yours,
Linus Walleij
