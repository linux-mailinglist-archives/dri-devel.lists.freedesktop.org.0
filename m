Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF835752B88
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 22:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857CA10E77E;
	Thu, 13 Jul 2023 20:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BA110E77E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 20:20:07 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-262c8746f08so170215a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 13:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689279606; x=1691871606;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ByjKI8sFPMlEN7YQ9geGxwGAL2cBDCMNaAzjBV7NkH0=;
 b=F0BVOQTvwF8gO8MqFR8XcNCP59o6HC5NSsmwn32J7aTT/fY7Uk1rkPASYUkLK0RP9K
 XDMxSCZGUhrJ/L2yrgFu5XLwN5fL3Ir28bRVO/WBVd81ouqk6l3Tuju7/+Xk/i8qh13G
 Hc1q22CjTL3ZT4/yMk7bI25jSqbYjm/3FoQdZ+JiUP8yCrIYFK+HdKheAvvlIXvLeVX5
 jZRQ1qamTB4JKLXxUKXS3qW6JgFWLKstk8umtIUhdU+U+WlUtg6EdwuWaOb8JLZd+DE5
 +Pk/9z3slCOgM3gilFCEXnnrdV8v2y4aQBgmUJWNm8ATxI6PQOhT0cJnjawfoPEit1zA
 rMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689279606; x=1691871606;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ByjKI8sFPMlEN7YQ9geGxwGAL2cBDCMNaAzjBV7NkH0=;
 b=cYam+GGn+zIzMYCowDm3LI3kyBdgyeBf8/2Kb+dDV120x2pViN7T2JfCpDH5LOz1tp
 kaJTbgY3Egk/VhvYiJBq9nc8qLvkh1ShDJ1c6ZTixBZeRPQj7IVMb9zQ6/AGqDlZvB2k
 cn/V70SL+Nii4L39BkZASFvFPLAsy5B17s7iB6grinonRw1zXcZip2xtvCPcFZ9FrWXk
 fQFAYVedooFSngO2DJkg2o1z12BzKV4gZQpXP2N6PELtAr4KsJ0LHkpgb4lXRw9CUhmS
 1heTDtKqUhXWkVnLlVh0+yMmC8fdu/e5H3+6MNm3ZWT81GmnvDm+/EXfAEm+nnAa6evF
 Ge2g==
X-Gm-Message-State: ABy/qLbHAZBmOCkQsf5wdD4mWDFaUEXUZmfEh3Is5Xf+9RnGMkKWF60w
 7CW1DKl6MyKj//6wHOu5dyCKeE4m2WrVx/l+enQ=
X-Google-Smtp-Source: APBJJlF6lDjz5Lo//RBprdWEIPvYPeiJg9NsNxMPgdbnmM+tubPcDLTmfieSzW5qXAHCtjUt0/IbpqFhjQLNIt1mNWo=
X-Received: by 2002:a17:90b:4fcc:b0:262:c2a1:c029 with SMTP id
 qa12-20020a17090b4fcc00b00262c2a1c029mr2668009pjb.2.1689279606189; Thu, 13
 Jul 2023 13:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230516164416.11616-1-alex@shruggie.ro>
In-Reply-To: <20230516164416.11616-1-alex@shruggie.ro>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 13 Jul 2023 17:19:54 -0300
Message-ID: <CAOMZO5Br-nMxLSekZL5jLHNpyfOH_KgL1WUgAZ25wu86S2eYwA@mail.gmail.com>
Subject: Re: [PATCH] drm: adv7511: Fix low refresh rate register for ADV7533/5
To: Alexandru Ardelean <alex@shruggie.ro>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bogdan Togorean <bogdan.togorean@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 4:08=E2=80=AFAM Alexandru Ardelean <alex@shruggie.r=
o> wrote:
>
> From: Bogdan Togorean <bogdan.togorean@analog.com>
>
> For ADV7533 and ADV7535 low refresh rate is selected using
> bits [3:2] of 0x4a main register.
> So depending on ADV model write 0xfb or 0x4a register.
>
> Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>

Should this contain a Fixes tag so that it could be backported to
stable kernels?
