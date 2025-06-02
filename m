Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2694ACAAAB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 10:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B7410E48F;
	Mon,  2 Jun 2025 08:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EEfXK1Fb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4303D10E48F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 08:36:32 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a4fea34e07so897361f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 01:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748853391; x=1749458191; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iGdLxQJedJR10q6IJUr1rxrGXieIgbBd7uldv9npHUA=;
 b=EEfXK1Fbjblaft/hobjK5KphCtdrmD57Fvolo+eJNmAiQ0mfhRY1Vu2xu2ph2lpnWB
 /+KaYnBHOMx72K+U39yQw/2vnxcIDOO3f6Nh1kN4VyLcxHfQZwlsyNr6t25+edL9dC7C
 jzZDPBnLRVA61LqMIbKDMEpx2rZGM9RbB1Q45rpGVh1Zkp+ygGeJfGEWpPONLcuiklZZ
 laD/RDOwKaqGiOPISjZJVRr8OqauEmXYq9IcMLSllLQofivQ0btkSEQDhjZaoumBl0U1
 5sbQd6U/QPf98+lf8mhJw1BqNjkvU1bVpmKXte9e96VgqENjeVmGMsWCJ8J0XPh90DhC
 bnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748853391; x=1749458191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iGdLxQJedJR10q6IJUr1rxrGXieIgbBd7uldv9npHUA=;
 b=r9wLetbHFbxYVJnz2i/WSdzaMuuuq6c4mrBHtH4sn5ZXz1mwXi+zd5vHwK6jBPr5FQ
 8yDpgWRYrScLfSSLrwHQZ6RpSPklRSkoqq5OLbxUryKX6NnZPoVmMzisrJNm6b3n3QFC
 AcUqzDvoeWTiVzd3J00g31+vFBxnpXjLJj29psEvYBL7u9RcTRHpVeD1QWSA3oZ5ThzD
 zp0vM5btgDzp43a4LZR3vyJtNenUiiuxMgjD6vbRV4jqbSTvpzr4fj6/ADpE1mXJXphn
 02m2GnwXmgPP6Yd+0oQmf2KKHJ0c37qeVK8h6EORdzjvylp6f/StJGceSsttHajdf6hZ
 DD/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT/fMYQo67yKQRC1SPZxvBYA0NwB0xF+y0Z/JSx5cj4JeX5t7OX1+OvZOiaxDUnxS4etkw03M9iqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6HZ65I1xPAGAwcIplG/2x7aOOn5KvhCeDXpa8zWs3pF1Tvmtv
 tLIr+JrlDWmeMCZ5naAK1VFI0U0jeixHQ+Hpjniyg8Zh6HNBXE2yaOOKekp9Wf+4OqqNdfzYxXS
 1gSX2drMtoKwx7J6csN4FSEoAz+IKTpE=
X-Gm-Gg: ASbGncsnblxML68r8UiYrOumv8DAbyadO8y6aEKekoypjvU1mTWu/8fpWyJ/kqoTfVc
 d5Tdu9V+ugAo04sliFPaaVfNcftoEZBFdxI3CjLeuiNg+DWpY5UoLDpJ7ywc6afpCb6gdh0ZIXo
 StZ53IoDCjP9wn/GacNxzosfBMhoz3JIo0BiqhmhwtORTnu/0tsCq7JYPs+kYH8hOI5A==
X-Google-Smtp-Source: AGHT+IEl1yFIws4sUhYVt+mceahGviWsgSBrMHfHPOC+CYt5sYV8U0pDAY6BGzpas6W8OjgINEKeDfDm8N6CfrCK8Bo=
X-Received: by 2002:a05:6000:2303:b0:3a4:d8b6:ca3f with SMTP id
 ffacd0b85a97d-3a4f7a364d6mr8102292f8f.30.1748853390528; Mon, 02 Jun 2025
 01:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530165906.411144-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346673EBBFD1FB88D29E51B8660A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346673EBBFD1FB88D29E51B8660A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 2 Jun 2025 09:36:04 +0100
X-Gm-Features: AX0GCFv6flm37VNpA6T95t0a6H6J7zZ0q6BdfwG8BeDqYZlmDD1D5hs6SRIgbro
Message-ID: <CA+V-a8v9AnFjhGY0ULde8p=oct++PuBUusi=DfwObdAFjSkouw@mail.gmail.com>
Subject: Re: [PATCH v6 02/12] drm: renesas: rz-du: Add support for RZ/V2H(P)
 SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Sat, May 31, 2025 at 7:36=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 30 May 2025 17:59
> > Subject: [PATCH v6 02/12] drm: renesas: rz-du: Add support for RZ/V2H(P=
) SoC
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The LCD controller (LCDC) on the RZ/V2H(P) SoC is composed of Frame Com=
pression Processor (FCPVD),
> > Video Signal Processor (VSPD), and Display Unit (DU).
> >
> > There is one LCDC unit available on the RZ/V2H(P) SoC which is connecte=
d to the DSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
>
> This patch is already applied in drm-misc-next [1]
> [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D1f957fbb88b61e=
af5ac9bf2db6bc2e54121a4359
>
Thanks Biju.

Cheers,
Prabhakar
