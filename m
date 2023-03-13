Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEA66B8419
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 22:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C99310E642;
	Mon, 13 Mar 2023 21:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5770C10E642
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 21:40:20 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-536af432ee5so268458167b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678743619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ecgxfHAz/UBXIjhNVQyUFhEfo+f44kweGIvOpc2a+8o=;
 b=K2pXxPF4Q5NEb4aJh/ZtgOcay4z11aGdPJNGxoAyPpo5KHia65JmMJB5d/8Zuyw+mk
 tdCZvErxJ2+Ov6F3uwE0QJROGtFxcgLs87rRt5F0kxCCgObLtL179NI1TBOK9gGgGNJF
 Eh1qJPWmBakRFt6FaPcxyZurn1mCFc0uppN0BduNDbYkQ+cupOSDrFYHqqBB3+fKZKrd
 MbQHQFxJIAhFilhE19dQAn6Hs0OfHLcEq+ul1IX3tDPWqnP0oSGLzgbn7d3SK+ZP02oo
 r6ydpI+oGA5J1HikH4j8Apu5N/h8d3h2Vnb/H9bp2xjP5xBYwfX+xhPNTLVqo8zyv8em
 5+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678743619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ecgxfHAz/UBXIjhNVQyUFhEfo+f44kweGIvOpc2a+8o=;
 b=Zgt7Se2ZVUl7LY50eAiH1aakzfCq97Q6BxS761F8UVjLybjhELl1dS5LkwnrMiVeKJ
 hlxP01GdlXLlIffUtkDzUIMT7QGBcNR+ZqJ2t3Fz3tGNaiENOf4I7g9kIn5/e5fV1GGk
 Gm1ufGT363Q+hcf2ofmAc1FSVjB619W8sULOQyhr+LeddzD64/i+8xqmbwrzOjLtk/rB
 TERFCWnQhB48OnbWV+Xym3TbQxbJLByU5BWNOoawiIA7Mdrv0i6BSJ/E4iAzyiMKGEJj
 RsZLHPiyiodqPhMYqsspf4JYykErEkNA2a8U2qs5L4NRmRoGl/b8nbpEREtPFKiTNYgY
 cruA==
X-Gm-Message-State: AO0yUKWPO0PFIcxKMxA21HDmZ2mDKYRCtZG2lv7WhBNQ6RMZiPhQOR0A
 Wa70xXQnvFKvSEsEMTFJUGHoAy2pAgcUVeNLqRdI0Q==
X-Google-Smtp-Source: AK7set8MXe6q7JAQYwdFRB8ZhsrrhbkSYB8JcvLg20wPqKZq56TZe41RwUBKjK5hxxwd+ByFitU1csO05sXE3FhMJro=
X-Received: by 2002:a81:af1f:0:b0:536:4ad1:f71 with SMTP id
 n31-20020a81af1f000000b005364ad10f71mr22810681ywh.9.1678743619469; Mon, 13
 Mar 2023 14:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230313155138.20584-1-tzimmermann@suse.de>
 <20230313155138.20584-25-tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-25-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:40:07 +0100
Message-ID: <CACRpkdZLFuGdSqnDYXnoWEjnVmumT23Rz4Y9QT9-9=Uoj5PUpQ@mail.gmail.com>
Subject: Re: [PATCH v2 24/25] drm/mcde: Use GEM DMA fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, javierm@redhat.com,
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 4:51=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Reported-by: Linus Walleij <linus.walleij@linaro.org>
> Link: https://lore.kernel.org/dri-devel/CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUy=
wxkdszpTC-a_uZA+tQ@mail.gmail.com/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
