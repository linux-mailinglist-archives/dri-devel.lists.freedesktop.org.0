Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBB85F5D5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 11:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E790410E8EA;
	Thu, 22 Feb 2024 10:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C554C10E8EA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 10:33:33 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dc745927098so1612742276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 02:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708598012; x=1709202812;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hvSpiiUJ9iqys+97G/reNKOm9Cl7wv5bknYElgciSKA=;
 b=LhNzNCf5aBcZg6jHD6rTB1hfglrEDehxKIOsxhJja2il8xCzfWND4zrAybfzMdCkzs
 U18HHONdLWuJtDZAbZI8i2e7mksLGnH3ZiB608vzxY4t49B0ZWFJe9CGmv5fhYog2j90
 a6wnB1sWCZ1WAPNNYjAYZOOF9vHSnB8OC1xfMjH6KyTHZh+QpwyAwj4fESGo8OmS+2hc
 y8B9PSqsgw86ztUuXter0mBiD98+aEgsxYjjSaDr0W8txgHjr5Aed1Q6CVOog1dHvxgi
 A7mw3cIuCijEq9n3Qv6Fh/pIfuPTeK2UdQK4JBySs81D1CftuqI2lX1DKSwMuOPyuJ8y
 Hdlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTnkW+dgO2kDoVA4LOIzaK1ACJnvcg6oFom7kTmhlE/+cnsUWhpngk3veD+2+FovfSIf826d8RAqhgf4JiX/GFcwJoqfWhlB/CBq9dKBDe
X-Gm-Message-State: AOJu0Yw7LMEd5zQAQCHOA50AebOdfd+vTbRODmo30v5nVkiMysfdH2+z
 RFs+aznpgwafrvvVF40pB9jwC/KLcwVRumNfaeLO8v34QYiHm+vilB9GdttXdqk=
X-Google-Smtp-Source: AGHT+IHxlbWPtqMjta/BYAHj7c9SejB2f0fmF8xz6VMdqw/ESRTvZQUa6QHMr0WNvYKAzNDNstOuCA==
X-Received: by 2002:a5b:dcf:0:b0:dcb:b41c:77ef with SMTP id
 t15-20020a5b0dcf000000b00dcbb41c77efmr1855086ybr.24.1708598011764; 
 Thu, 22 Feb 2024 02:33:31 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 e2-20020a256902000000b00dc6e5ea9152sm2829078ybc.29.2024.02.22.02.33.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 02:33:30 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-607bfa4c913so15904987b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 02:33:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXEDcTt/t8UFehgvj1tw/1r9a+vaiAWBt0FypuXJ3QUtb8OxpwTgigGuzByDMI+TbXoQ83jJC7R0Msmp4CG7I+MW01/as2khcFwzkhhI+NZ
X-Received: by 2002:a81:4cd2:0:b0:602:ca0c:fea3 with SMTP id
 z201-20020a814cd2000000b00602ca0cfea3mr18679734ywa.10.1708598010471; Thu, 22
 Feb 2024 02:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20240222095630.85949-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240222095630.85949-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Feb 2024 11:33:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXaaPP9Mx-2SY9_4H-X=-sQATTMCUW4sWPP0mmQL-qmkA@mail.gmail.com>
Message-ID: <CAMuHMdXaaPP9Mx-2SY9_4H-X=-sQATTMCUW4sWPP0mmQL-qmkA@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Fix redefinition errors related to
 rzg2l_du_vsp_*()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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

Hi Biju,

On Thu, Feb 22, 2024 at 10:56=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> Fix the redefinition errors for the below functions on x86 by replacing

Not just on x86, I assume?

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
