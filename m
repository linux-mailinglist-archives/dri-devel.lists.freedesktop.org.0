Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D517FAD21
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 23:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA75710E31A;
	Mon, 27 Nov 2023 22:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED8D10E31A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 22:13:45 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-daf7ed42ea6so4579680276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 14:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701123224; x=1701728024; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uKi3mY9gEWYH12Kzcguh8/xdDNFjc2yj/HRXk8xcrl0=;
 b=dMWKpk9eggaTOtDOihvu6tjxtpRf4T7AxU2sLriVqkJLwm0B8BrjHFS7M+YsmMmERT
 anK7NpjHv324YFqawKOipPXhiIhD7NqxTq3o9Yl7/cbSI6DL18+mt3hw3pm0swliTI3T
 pAZodHVeH6LYwhp1Vy0OnQVtoeKZJ1fLAdHzyvTNFWb4h33muzgl1X5vEBZSvUnkbz8i
 qCWp35mOK0uc6Y/6YVO9uZIi2wzifAyJzELZXAlD7hpMRkAfbQJGbBcB+Nontg0ch9xS
 9vpSUQGgD73R5VphGtiaP2Uz02FEL2HeSyfGgNPfQGVhC+NZ1QDDi65W8LdM3kXYxkXY
 bbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701123224; x=1701728024;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uKi3mY9gEWYH12Kzcguh8/xdDNFjc2yj/HRXk8xcrl0=;
 b=dq1D4dB5Hamf68gpNAMtR0ABNiBoa7PO9INQkVKmGJ6xHEvnbEAj1UW+7eblzFnLVI
 iGfsuZNjDDpyft6uKPPkAuf+QzwF1sD6F4TJ7Q9vj9hZGavTYa8NuhIrxdIF6x2L4FBH
 GKGNy6P4tx4KMffTrFxiwUUMacrGKpxIYvdXfM8h2vgF9QaB293N2hj1MbGdmOD2sgOr
 DLOizHLf8i9y0qem+2KW27gEe13O8HLxiG6Lx+tLKvYewRGEgWUgUk3sDDm9e0xOJ8Vv
 pMYW9yvxZsob1FNPcW+IAmZ038mz85VvKl1o0mHM921ZWhJHcu/J7i5KwJpOWWe3kEmG
 y+jg==
X-Gm-Message-State: AOJu0YwKZ1WcSts1C5o3PwLbu22SMgKVppOjAasBDFPFkE3KRv92SunC
 oqQZXqGJ779tYpzvsRm9xL34MtmTlQjh749KQzRNXQ==
X-Google-Smtp-Source: AGHT+IFgZ18g6DnXLy7RFiYscXNiAu4gCNhHYaxDE8NSduVNzVKpXKWsD8UbOdacoRARcYAA9beD8h6cHEgYoT90gZo=
X-Received: by 2002:a05:6902:49:b0:d9a:cd50:b99a with SMTP id
 m9-20020a056902004900b00d9acd50b99amr12883192ybh.12.1701123224146; Mon, 27
 Nov 2023 14:13:44 -0800 (PST)
MIME-Version: 1.0
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <CACRpkdZAtxh5muhbPKvmUQGtQogs3UhGxNZqnSGWoWQNUL7=9g@mail.gmail.com>
 <k65hxlckssjd46nsrlly6vjrr5nnkrakouzw5pmxgbf6ui3mdl@5ny7j7blkwyj>
In-Reply-To: <k65hxlckssjd46nsrlly6vjrr5nnkrakouzw5pmxgbf6ui3mdl@5ny7j7blkwyj>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Nov 2023 23:13:31 +0100
Message-ID: <CACRpkdbKwycpjuhMfnriqMUcbmwCTb3vJzgzCF7+ARax54q7WQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: panel: Check device dependency before
 managing device link
To: Maxime Ripard <mripard@kernel.org>
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
Cc: sfr@canb.auug.org.au, ulf.hansson@linaro.org, jernej.skrabec@gmail.com,
 rfoss@kernel.org, tzimmermann@suse.de, rafael@kernel.org,
 Liu Ying <victor.liu@nxp.com>, gregkh@linuxfoundation.org,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonas@kwiboo.se, linux-next@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 27, 2023 at 5:29=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Mon, Nov 27, 2023 at 05:03:53PM +0100, Linus Walleij wrote:

> > > Liu Ying (2):
> > >   driver core: Export device_is_dependent() to modules
> > >   drm/bridge: panel: Check device dependency before managing device l=
ink
> >
> > I just applied patch 1 directly to the drm-misc-fixes so we don't have =
to
> > revert and then re-apply patches, because that is a bigger evil. (We ca=
n't
> > rebase these branches...)
>
> Erm, you did wait for GKH or Rafael's ACK to do that, right?

No.

It is a bigger evil to leave the tree broken than to enforce formal process=
,
and it is pretty self-evident. If any of them get annoyed about it we can
revert the patch, or both.

Yours,
Linus Walleij
