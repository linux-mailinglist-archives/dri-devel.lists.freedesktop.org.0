Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4123B58CC1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 06:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC2510E639;
	Tue, 16 Sep 2025 04:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V7kWr1OJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FBE10E639
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 04:21:22 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e931c858dbbso3080145276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 21:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757996481; x=1758601281; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bogLoMlflI6VbNNnCzsFDXRtZ6mT7yFBE69/g4NDZeI=;
 b=V7kWr1OJAKQ7ZpEKhkz+/8EXyZg9pJMtSqeINkVTib9YlKHRrwxxRjHdsbUhcAeevH
 oxvSpjtS5VEARdvwMwCvYzv0eb5WrenRO35NuhfOGgOfHiAR3S0RUIZ/kn5mztl8bXs5
 otRn7sOrdQHRkbwftKpYoEAbEWj9Ymnvf0ze5y4eZInCVaLNuOHaIVxI15J3SPFvdpai
 ovv1FVkGWMDba5FRbh8JXZrkHr7MKxXkDyYkbJ5tqo/kPIGPh89USMdFi6qbcAUkCeRE
 selmjCXsf7aU33P5yZDAsvSIj0QDfsYDveup6QmW3iIprAM3+sCPgdGWHN8bl6kYggLk
 ocEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757996481; x=1758601281;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bogLoMlflI6VbNNnCzsFDXRtZ6mT7yFBE69/g4NDZeI=;
 b=MoZ/re7UlGBEcCjdX/8MJ2iR98ss7Pkqx37AmSNpk2NLmjayFiUt8hCK3J/8yQCUs1
 x6uK+/H0TEoxPt3735xcF02FJy5FnmlD97Um/PuxkxSnhCVuKA0E8XBk5fb8Hm69v9sM
 9afO0Cp4u8VjZN9icb3ri9zvgFvAhk6zYJeU/B8NS3RqgdLqL+ycmL4LM0OcasAQFgpx
 6HZr+TqDNBDn4cxN5q0zcdhMOdhEenm3wjSuGxAj3M1demGliULPMFxxVnba8O1tTmyn
 5e9pOx0Wy6hCIcZjNH0xngDXO41KBSiDt9j1mKinAUzpwTthF3iQqrLQSrWqUUtIGWQY
 63+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Ol21/MG7NFJ35s3dHaqmLYW3BB3WJ+QX8FvY8WQkdzLo4fB39kD3QZ6hoEt5D1ewi2SWchNsZCE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyB4nn9IljnwCtEpBKUOFSXOkRqW47vL9CThkah2d8pj0SvlyP
 O+z8bMDvAAlcbNfbQBQ7au8JFrmdyoUFua/abgFe8si9Vfg+N7McqSJNof+lil2sZBEtTGZuVya
 QgIOqdmaf3qx0pQ/N+0xd3KzczwoRKaw=
X-Gm-Gg: ASbGncvy5RCdyCJosqmBkYcIvmW1bmAkCQ8EbtJvVT8mLrbHhVUAItiTEhH+JOpm9Bi
 w1J8Eb1y5ATrOSOL0H5MRFpyF6XHv/DGK+O3r3IIMWFzbYPTesNll0vOGextZe781Or7ExEy8Qj
 jHOyz/N6T5mRybmm+Q0GHo1aFgZPSz+B4h+VXu833ORV6mz3jE7PaNnpnRs2NsH/6F+3csua+Az
 9rH49FqIcGEjeTrVPZOm+XFG7vjwiiZyj2iufURwud5QUdGdI01nsUw6jeXXpuDgmuuE4RM
X-Google-Smtp-Source: AGHT+IFyzGXqLS7HgTpLjfWR0n2UfIRuua03WSClBxtb3ipLLNlXWlUaTN5qUbRS4LtdFGTOHy1hA97gOm1mTGj9g3c=
X-Received: by 2002:a05:690c:60c1:b0:72a:78ee:f265 with SMTP id
 00721157ae682-730623e29f3mr107076077b3.6.1757996481126; Mon, 15 Sep 2025
 21:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250913002155.1163908-1-olvaffe@gmail.com>
 <20250913002155.1163908-2-olvaffe@gmail.com>
 <20250915-numerate-makeshift-c076500aaec3@spud>
 <20250915-deodorize-proxy-b18e41fa8668@spud>
In-Reply-To: <20250915-deodorize-proxy-b18e41fa8668@spud>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 15 Sep 2025 21:21:10 -0700
X-Gm-Features: AS18NWDfiAtyEiAampVSnuFJXyQ57PVn2PUsFhR83kG6F0bRG1fbgCjLT-SJhR4
Message-ID: <CAPaKu7TEjG3sWamy3k_YLig=208oXLPhMmbCvPOf96iEL0-uig@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek
 MT8196 compatible
To: Conor Dooley <conor@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
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

On Mon, Sep 15, 2025 at 10:52=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Mon, Sep 15, 2025 at 06:51:16PM +0100, Conor Dooley wrote:
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Hmm, actually there seems to be a more complete binding proposed here:
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250912-m=
t8196-gpufreq-v2-1-779a8a3729d9@collabora.com/
Right. I tried to add the compatible to the binding (this patch)
before adding it to the driver (next patch).

If this patch is not a prerequisite for the driver change, I can drop
this. Or perhaps there is a better way?
