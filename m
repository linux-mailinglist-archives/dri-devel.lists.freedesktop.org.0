Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A85ED7D4D4E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 12:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5274B10E318;
	Tue, 24 Oct 2023 10:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7AD10E318
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 10:08:29 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6ce532451c7so1073828a34.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 03:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698142109; x=1698746909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fgLdb8aZYAs0Y0vcAtZXYMnjVSNSuVBAYZU46oMnylE=;
 b=ac8VtlX9spa8tKRmbDLC6pvgdN/vsLhwgPwFJ47kRnrM5hCvpKpAg02tOa4G6GFnJS
 L4N9e01iRRgQhR+0Le78FqX000DyIIXtYXb2hoK+PjpmiPmfZp5/pnpVoTDHvdsLlg71
 esdLCUFz1gXgxZ66FV/kqv8Y2QEqdmnMgy6NueKQrM8Y5s9yBvThwU41lvu3MnxZvvYq
 5Zr4UWdae3xXDV8KxL0HpqhKuZXwmeOwkBM+I+DwXmm0DWVSW5QrRg2Wb/NHVXBFEdFG
 sLDnflCNreWzYGjbErinSHy21scEELeVb1DQfXQayH7K3LVp9zygIyV/oGXKxQ9Qnlgf
 ivFw==
X-Gm-Message-State: AOJu0YygqhvByhoc63/liUw9t+KwjpIBEQAILN4eWlU/kCavhlowKweB
 EDJ9dc3exHk0uHe5UPdDo6/kPC+zZzpICg==
X-Google-Smtp-Source: AGHT+IFuPHVICgq4hMIQ8MyhIGGsQlTrWescxofgMVrdoSX+fV1j3Nt4oOaW9PolMiti2frTCZLtHg==
X-Received: by 2002:a05:6830:4387:b0:6bc:de62:86b with SMTP id
 s7-20020a056830438700b006bcde62086bmr13155674otv.7.1698142108980; 
 Tue, 24 Oct 2023 03:08:28 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 da11-20020a05690c0d8b00b005a7b785f66bsm1175393ywb.39.2023.10.24.03.08.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 03:08:28 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-d8a000f6a51so3949374276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 03:08:28 -0700 (PDT)
X-Received: by 2002:a25:b9cf:0:b0:d9a:5908:a29 with SMTP id
 y15-20020a25b9cf000000b00d9a59080a29mr10249227ybj.64.1698142108080; Tue, 24
 Oct 2023 03:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694767208.git.geert+renesas@glider.be>
 <CAMuHMdWfBTKdXvZutg4LvWqBjuz-X=ZjzX0LKPqD=JxYuLoPRw@mail.gmail.com>
 <CAMuHMdUF61V5qNyKbrTGxZfEJvCVuLO7q2R5MqZYkzRC_cNr0w@mail.gmail.com>
In-Reply-To: <CAMuHMdUF61V5qNyKbrTGxZfEJvCVuLO7q2R5MqZYkzRC_cNr0w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Oct 2023 12:08:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXTpMYqdFzro3kX-3wXYC8N6z2abiMTiXXpV9xn1ohj0Q@mail.gmail.com>
Message-ID: <CAMuHMdXTpMYqdFzro3kX-3wXYC8N6z2abiMTiXXpV9xn1ohj0Q@mail.gmail.com>
Subject: Re: [GIT PULL v2] drm: renesas: shmobile: Atomic conversion + DT
 support (was: Re: [PATCH v4 00/41] drm: renesas: shmobile: Atomic conversion
 + DT support)
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 16, 2023 at 11:59=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
>         Hi David, Daniel,
>
> The following changes since commit 389af786f92ecdff35883551d54bf4e507ffcc=
cb:
>
>   Merge tag 'drm-intel-next-2023-09-29' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-10-04
> 13:55:19 +1000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> tags/shmob-drm-atomic-dt-tag2
>
> for you to fetch changes up to 1399ebacbf590dfbac4fbba181dd1595b2fa10ba:
>
>   drm: renesas: shmobile: Add DT support (2023-10-16 11:47:48 +0200)
>
> ----------------------------------------------------------------
> drm: renesas: shmobile: Atomic conversion + DT support
>
> Currently, there are two drivers for the LCD controller on Renesas
> SuperH-based and ARM-based SH-Mobile and R-Mobile SoCs:
>   1. sh_mobile_lcdcfb, using the fbdev framework,
>   2. shmob_drm, using the DRM framework.
> However, only the former driver is used, as all platform support
> integrates the former.  None of these drivers support DT-based systems.
>
> Convert the SH-Mobile DRM driver to atomic modesetting, and add DT
> support, complemented by the customary set of fixes and improvements.
>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/r/cover.1694767208.git.geert+renesas@glider=
.be/
>
> Changes compared to v1:
>   - Rebase to drm-next,
>   - Add Acked-by.
>
> Thanks for pulling!

Ping?
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
