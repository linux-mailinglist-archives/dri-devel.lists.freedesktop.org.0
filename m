Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C29EACAAA7
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 10:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AFC10E489;
	Mon,  2 Jun 2025 08:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SHbqvxSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F8910E489
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 08:36:08 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-442ea341570so27180065e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 01:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748853366; x=1749458166; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ReE2S4t4eNnXYC4QcPdCyI65wJEE6x8E+xUxw2N25lk=;
 b=SHbqvxShPVrU93SHFtQ5e9etDzHah1EDQ1eYPjL3gxlzYo26eW5Okfm8rkIvNzghuj
 wXIV8Rheo25SYU2t0Z2/W3ztTwqRrldCoWyseE/OvsY8LtVN86Zr9xcjeACOWGrICMZq
 fIjbTgVUv2dslidIEwJkbuiKP9qI5+5Am56WR/RPGfv/K3JoNTQfis/1ElHfa5hktDj1
 2Cxar4d5MEtZLnGJ/esSLEV6PUYQ7I819xSZ+J/scRRZhVBeBH9FKd7sWskbwa0BRyT+
 yWX/1sZadlqSP0BKg8ziLABbwOusCttpboVcOY14WchybIZFOzQlh2TAF4jmIGOKrZFD
 nkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748853366; x=1749458166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ReE2S4t4eNnXYC4QcPdCyI65wJEE6x8E+xUxw2N25lk=;
 b=QFDR/HBv/qdrdh/fWjZjlxZegp9ZMg8IXxggMI03B/FJtclTXTtI6/m3Fl48daffPI
 BdJbKED7eq148oCqbIv2w2yjceF2Dy+d1DyZXwfg9s0qP9rzRWkYOucPBb8XvMeLkytR
 8+UN/XEf1dMrTggUmuZUV5asgZIP70gEiO3sRhJZYCYBpaKxwe+r3Np+lbZa5rjvnqT6
 7DAEkDt7vzgqlOxU9jPo6tRDiU7KrTXvlwM78qT7p53/4Fb0qfOGmZEJsiw/OryOLhXh
 ShWxQmJk16Ujy6UGomAJkbwqevmtnYGNIQUM5IyC2qU61SyMSHTNsuR7XGmxjZF4Brvs
 yLcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHxhs2C7s6FQE8iHRvMHWu8fpSy+aG7oseTyaPdbo18yTGNX9t87Yl7Au2a08mDUWthrUYTB+GBPw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQqH4p5MkIFvlbJ9gi33s6BOrK5l8qkcr6DG+04AiO3Zx7SA9T
 sDyRX8ceusAzeDO7iliiLFsa3wiJGwfHfXXmUibx5jTcv4wQJS3uEBykhXeAY6azNI3RwWn8pe2
 fxOOs0LvCtTrIvWQYlozfoffaxBKZyQI=
X-Gm-Gg: ASbGncvC17k8vTd1Mi7jZWobMYxe3Z1obBb76PI6nlJluARuUtFNrkTGEsWa87iGP+v
 5GFNB/TjZ9RtEcVq2BTt6pZs3Qw9uPD+xABmfbVPHIZnvDmo841fdM43pLUykTpkIGUBZv/JrNx
 3S5+g54zRhrmSJDpaCKYlpGTOdEjofTZWzkfrzI+sEbNXK04CZC/HFXFMm/fpRtpO6WQ==
X-Google-Smtp-Source: AGHT+IG69W12ZGCu5Ibciyi2Few70A36JIuKBZMWYr79JALU3NtHlWhrRdJTCqzf2SQLeYSHqe3MtZ5/V8bjZkDa+Eg=
X-Received: by 2002:a05:600c:1553:b0:442:f482:c42d with SMTP id
 5b1f17b1804b1-450d884316fmr106851685e9.9.1748853366163; Mon, 02 Jun 2025
 01:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530165906.411144-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346CF2602E4EE4E85657C868660A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346CF2602E4EE4E85657C868660A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 2 Jun 2025 09:35:40 +0100
X-Gm-Features: AX0GCFsFXa2JOBjYEpsHfPlVUmvrmRBndrkCsSDYAoOZHvKxkEjaIaPstCsLrCA
Message-ID: <CA+V-a8tXt+ky-gSPN-mthkj2rcX4q86QbF_Bm409_rSAmdsYgg@mail.gmail.com>
Subject: Re: [PATCH v6 01/12] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/V2H(P) SoC
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
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Sat, May 31, 2025 at 7:35=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 30 May 2025 17:59
> > Subject: [PATCH v6 01/12] dt-bindings: display: renesas,rzg2l-du: Add s=
upport for RZ/V2H(P) SoC
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The DU block on the RZ/V2H(P) SoC is identical to the one found on the =
RZ/G2L SoC. However, it only
> > supports the DSI interface, whereas the RZ/G2L supports both DSI and DP=
I interfaces.
> >
> > Due to this difference, a SoC-specific compatible string 'renesas,r9a09=
g057-du' is added for the
> > RZ/V2H(P) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
>
> This patch is already applied in drm-misc-next [1]
> [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Ded6a6d63513ee5=
199841c0a0dc2772ad944e63ee
>
Thanks Biju.

Cheers,
Prabhakar
