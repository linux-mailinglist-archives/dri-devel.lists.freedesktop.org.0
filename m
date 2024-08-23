Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A2395CE06
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 15:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906DA10E830;
	Fri, 23 Aug 2024 13:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G0cqcGrt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DC510E830
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 13:34:17 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-7093705c708so2070518a34.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 06:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724420056; x=1725024856; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1V8EaxQnaBDXe1y+LWTn8riTWK3pRHcJdVTal1134ZQ=;
 b=G0cqcGrtrHgOy0nFkcqS8oF+QlcebDxfABrmqO4NGHsrKovDjRpOMl0bfvBWPeHGGD
 bkNqIpvKVwphVRbjFHJ30U6fe9Cb8x5dC4w1GuSYZni0qQRasVuTcTrStbzXwxEDf4p7
 L2IPXmNSHwVb93VhAlZb9A71zerlxTlVqy2dLS74XTNqEjlunGKeEiS9so+/meiTCnm9
 P3C88rLEP7WGbq7lr1JRqoIQgZO+cIYIR0aePjjrHqVUZn9MU4Yb5XZ0wqmBSVgBgVMD
 iVT4pAqcXGLY7bAPzNIs4rKXvgiCZKrUJD0nmpjAZf4YmaGvIXHZwK/LreaDTYOHHK+D
 XsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724420056; x=1725024856;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1V8EaxQnaBDXe1y+LWTn8riTWK3pRHcJdVTal1134ZQ=;
 b=VYnK2R4hNNShTBctj6QdzSdFzyOcyPNCfdpUKlMQx2su6y5+ZrBqzFJhP0ztOSu1Fd
 q/LevulbVFg7DccMVcIT3R4CtXBDfap4tr+YBIudti44lL/qr+l3CP0e74F44xBNtSZr
 tKI6+rhMKelbvnDdjuc1YJXEznxki6d7lOfW4uCKl5Gdza95lwZlutxgFR3czD3S6JoC
 nTcHKAdnBfcDptuIii3AtM5YQtrLUljOyUWzBWmVAFaC/IYipkYsBhvEHOvOLGgLulTo
 LoU61LUDBirGqDrblIsZwHC9Bop06I/LwpVYj2GzVrZr8dwZ54JsKnnWkXOcgcc1LqcU
 opeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ0WFeagoBsWC0HbHWwJ1iAkXcsEoHvRm5tNDfS04ISD5c7osnmP4CS0OzgI/tQ808gXbiAVVhQjA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyidvexW8HwomzQoAilpfkLzJVSE+5tdIHshGfJ/ertY8dJoS2p
 dj8Aaeb5WTPoyKHDnJ3/dhGtSPLRwUEwP1sA12nu86eV89Jd539AmBy4bmWFIc8aQo02wF/P8kH
 VpkhaITQmKYZy9FYRyKYkfY2zIeA=
X-Google-Smtp-Source: AGHT+IHbB5QRyvqlUtV21r1qprqllwzE0VQOI/2Y41jOQUP1AWcLr4N5vjCpGEffzRdSyH8EHf8rKDZSpOoXYyLScOQ=
X-Received: by 2002:a05:6358:52d0:b0:1ad:d28:976e with SMTP id
 e5c5f4694b2df-1b5c22ebb82mr261068655d.28.1724420055873; Fri, 23 Aug 2024
 06:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240625123244.200533-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240626055108.GA10453@pendragon.ideasonboard.com>
In-Reply-To: <20240626055108.GA10453@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 23 Aug 2024 14:33:49 +0100
Message-ID: <CA+V-a8tcWVTzDgBMhn8aQaX934MKwOePp3PhMF4TcXqBK2nhAA@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
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

On Wed, Jun 26, 2024 at 6:51=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Tue, Jun 25, 2024 at 01:32:44PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > All the RZ/G2L DU specific components are located under the rz-du folde=
r,
> > so it makes sense to move the RZ/G2L MIPI DSI driver there instead of
> > keeping it in the rcar-du folder. This change improves the organization
> > and modularity of the driver configuration by grouping related settings=
 together.
>
> I was thinking the same the other day. Thanks for beating me at sending
> a patch :-)
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Do you or Biju has committer rights to drm-misc to push this patch ?
>
We dont, can you please queue this patch via your tree?

Cheers,
Prabhakar
