Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF2AAD333A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 12:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D6410E4D1;
	Tue, 10 Jun 2025 10:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CLzHshdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8333210E10A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 10:09:23 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3a510432236so4110290f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 03:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749550162; x=1750154962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mu3tJ3WQQn2lPprGjrNb/HlokFlYuCSBcp9oAp61tB4=;
 b=CLzHshdC7V4IQB7PyKQGgUjaTwnmL5B3rVzgSFjEjbJlBXrsxzSvRpiLtM610/XQll
 Y8+AjBgJjv+1K4wW9OQNNEV8RqHupvQTTrgEoO21DSuBZGOzb7K2j9/nxwBE/kQVx0TR
 tSM/n+yKp9S6yYvyGIH5u944j8Z8P4ytRkycp5Gkjj5idc+iS57VAT5reTHLMSGLP96k
 5enhFloXw3WtAzPAjg/duMqKiOe8NuN80UGxtmFhcgrW4n5lEbBKCy+Ls0ET+NVtInUW
 qn8kyinZ0Yg1e9U8iREbcUfzMIrKxE5azLjeIdrYzFF0CL2anWd20TL3sZoi8zSTDks3
 PDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749550162; x=1750154962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mu3tJ3WQQn2lPprGjrNb/HlokFlYuCSBcp9oAp61tB4=;
 b=bz5yKEfdYBA1nqQkV5lGeani1+tlUXdG/2XdLgScpEoow88K4mJ8bxz5pukBZ8QnMv
 DGrSYlSpRDQqvR12MB1W8EsAn9NLIcK4mG+Hc9RLNOIXKvCbahTTQPFh/zrWZn3hHaGb
 puy2K04APp9/Yz2Fg43rpc2JGCUPCALNoyagazJZjaKsad08sCdZu+sB/p0t97n26SAM
 CRBBkDbPVfO6wnVMwmo0MoyRsq7liGC4dreAgfVIcAifReFK+vAZHWHdMUQ5eZkw+spM
 VzI6lQbKxHnl7fwPsu+KtzmFyPPgc2O9Ee4WpwGSeHaKEnCEwCITbvMWoGFmVw1xPOLl
 pyCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo5urViuDBCFy4VP7IlRtBzM7A+3jtNXd2ETW7qGuRoLaofuvJM29FCMhzDpbhKNmlBBFp7ZZ1rTI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+tRXJZK66YcweFRlARiuZvFhdxlZ2SgLtPf68sPwT4HctVaNq
 qccpc2kpp1eWLYxjXjw/g+0lCvrRiXJuqHPRtJyt6/Lm3trom0gC2+6pxVxn2xQWNggGYSk2zr/
 xdCr6S8NSj6QPjZ5itiA368i4LWNR3BY=
X-Gm-Gg: ASbGncvKAoaZvOvvLoj6Z7UV940dbVFeuGiR4++r5UaYPkyDpmXnddkuL6m9uySGJOq
 zJhz8CTKjRsqSNzEZGbcVnL3Eh7Yi9lcozqpA2fjzU6FV2iEgJirzg7izFNlnKbeMZBXktG75TJ
 jUneD2jkhkPXVLoi0908anVEO2p13C6XWSXo156+L+6vz/XWUQQ52BsOpERPoM4oU4fO/NMey5f
 9CH7q4luOY8+Q==
X-Google-Smtp-Source: AGHT+IGjgvRkM2W8kgSyX4TbWWmhSsHWLzeNNdPZfCrgDmOedOEofl5Xw6zzPhED/r+Zf+OBYUsJu2Nd2s2pudULcBw=
X-Received: by 2002:a05:6000:1ac9:b0:3a5:2e9c:ef0 with SMTP id
 ffacd0b85a97d-3a531cdd224mr13644239f8f.46.1749550161590; Tue, 10 Jun 2025
 03:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250609231905.511904-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250610095753.GD24465@pendragon.ideasonboard.com>
In-Reply-To: <20250610095753.GD24465@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 10 Jun 2025 11:08:55 +0100
X-Gm-Features: AX0GCFtKRVuCrs4eEulMDJyNEUDBid3H4vZNN_u0ANsEVyoc5QWq-7m8nQNNlaM
Message-ID: <CA+V-a8tOZEfZzXzT8hvKcRt+2TSYb0LEw_WsBfm++ug6xJ5UDg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: renesas,rzg2l-du: Add support for
 RZ/V2N SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Laurent,

Thank you for the review.

On Tue, Jun 10, 2025 at 10:58=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Tue, Jun 10, 2025 at 12:19:05AM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document support for the DU IP found on the Renesas RZ/V2N (R9A09G056) =
SoC.
> > The DU IP is functionally identical to that on the RZ/V2H(P) SoC, so no
> > driver changes are needed. The existing `renesas,r9a09g057-du` compatib=
le
> > will be used as a fallback for the RZ/V2N SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Assuming this gets merged after
> https://lore.kernel.org/r/20250530165906.411144-2-prabhakar.mahadev-lad.r=
j@bp.renesas.com
> ("[PATCH v6 01/12] dt-bindings: display: renesas, rzg2l-du: Add support
> for RZ/V2H(P) SoC"),
>
Above patch is already merged into drm-misc.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Ded6a6d63513ee5199841=
c0a0dc2772ad944e63ee

Cheers,
Prabhakar
