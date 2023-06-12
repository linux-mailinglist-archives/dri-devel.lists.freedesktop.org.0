Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB0872BBD9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 11:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5086A10E1E2;
	Mon, 12 Jun 2023 09:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8838910E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 09:15:36 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-25695bb6461so2204310a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 02:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686561335; x=1689153335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WPacStbH00kO6uHRDNkAWKJsSoKXzXejllyTWwhJV4Q=;
 b=O5kOM+YE34a/v4vqGDwQxrp1QJEQiFzewVl1p34xNJ5z61Nh1eQW3sPp6S5ZGSe1/U
 cjglx5opI9ADJCJ3ZFetB/TqH0gTJAPq8xn4rLHIh8Rjwc/DMRTm6cQL9vo7XENqe/R4
 l4sYJ9Hca7p7zmLvnw/VtxcMyeAhSWnOd9oPd9gtgdsKe02IxfwOO8vHY8AzbgE7WSFJ
 XeBpGdBBV59b3CTnKld24Fwm4IICUFI9Ry5FQncvUTEHjHVNVVF+wI9BAANOJsQB+4Ss
 ANSd+ETUicvjwhbeGhoRTLi7O409lEArKI3Dd6qasmQyS21An/fiSVxo+8YFdM0pRmMI
 2aWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686561335; x=1689153335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WPacStbH00kO6uHRDNkAWKJsSoKXzXejllyTWwhJV4Q=;
 b=EmoXFRHttffIGLjhXr4ePuzjO/dZNToCiolnDMnNoj9a9IzQssUtRII7/QyV63Pf8/
 M74fZ1fmgUkPgkZ9jclQOy6LnsEFkjhQGD2d/DetWkcRyAlj0l0Dtwemy0DBlqqBUm00
 mQC+WIbl51zwFiMQiW8OIc5s6NEtCtxLVWkpmdZa8Cdn0aUQ2AQGHR3cuTYxKPQmqfQJ
 kZPVZxGcequXxtaSXxZ917EyJgCSubLq4fFl6HJtRVOPJFfaoSxddLCOFY8CBhi28m3f
 4dtdgJ6zKvV9cqpxkRf5EscjNv/ocAPJ8sdaeBOzcdij+Hh+i5JTvSQkKnj25xE1nYNM
 lGKg==
X-Gm-Message-State: AC+VfDxK7qYjapAAc8yC7ExoqJo8CCFsUkEcJoz+77Sk3vZar8VH6q8k
 nM9oYiU3E7waeXvOPifrc4QEM6aPzvZL+NlauAU=
X-Google-Smtp-Source: ACHHUZ5/Ibl3ZeKb7ANu+QbAXt842V6UlrL3qkNAQerUYCCQ+uMCk/Cx/JQ69F94J1+bzan81nCMVgw9eU+BFdP3HHo=
X-Received: by 2002:a17:90a:4508:b0:25b:e310:ca6 with SMTP id
 u8-20020a17090a450800b0025be3100ca6mr2879033pjg.9.1686561335497; Mon, 12 Jun
 2023 02:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230612075530.681869-1-victor.liu@nxp.com>
 <c11788bb-9974-3fb9-7cac-db7d55cfde9e@denx.de>
In-Reply-To: <c11788bb-9974-3fb9-7cac-db7d55cfde9e@denx.de>
From: Ying Liu <gnuiyl@gmail.com>
Date: Mon, 12 Jun 2023 17:15:23 +0800
Message-ID: <CAOcKUNUh7itiVKgiXuL6TqEo9uFm2xSNh7k+b+0QoD-MuifaUw@mail.gmail.com>
Subject: Re: [PATCH] drm/mxsfb: Disable overlay plane in
 mxsfb_plane_overlay_atomic_disable()
To: Marek Vasut <marex@denx.de>
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
Cc: Liu Ying <victor.liu@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@pengutronix.de,
 sam@ravnborg.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 5:06=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 6/12/23 09:55, Liu Ying wrote:
> > When disabling overlay plane in mxsfb_plane_overlay_atomic_update(),
> > overlay plane's framebuffer pointer is NULL.  So, dereferencing it woul=
d
> > cause a kernel Oops(NULL pointer dereferencing).  Fix the issue by
> > disabling overlay plane in mxsfb_plane_overlay_atomic_disable() instead=
.
> >
> > Fixes: cb285a5348e7 ("drm: mxsfb: Replace mxsfb_get_fb_paddr() with drm=
_fb_cma_get_gem_addr()")
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
>
> Should this be Cc: stable too ?

Ok, will explicitly Cc: stable.  Thanks.
