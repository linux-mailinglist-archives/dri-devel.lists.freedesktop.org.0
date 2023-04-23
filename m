Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D298B6EC282
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 23:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B816B10E060;
	Sun, 23 Apr 2023 21:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8776010E060
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 21:37:04 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-94f32588c13so511701466b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 14:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20221208; t=1682285817; x=1684877817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+3ip4SFD8EZ4AogSeaajIrcWIDGjTnupCvB0Wex6sU=;
 b=BiFu6VDoYcTeU8wvs0mVHTjYbn12mqsHHm0FHm/LqRVi62qlw+bF6qVmX44l0LAtiL
 knNGqM1HGnzS24x0qHFzgmYGukcFYpJj4CnoSJYkY2tp4qyCIYuFb0CpsBL2/t+feJ1Q
 BeClrpyYt2MQ8BLLoxS8pjvFhnkBxpGOsOM/bP9Y1L5XDOlsEH/j1S0JlgMgFft+cg6O
 GIOFnyblmF2stvfBm2Bhmr5qjJRm4VL62pmbsJdsHi/vDbzkG9cX1OpG/VdQz5PneGRy
 zI9i4Ne3tweszm5HIi7mLfHGvCDIdq0spz9FnRLq5YiAwUb/rLjkCb+tXHQdHhK2682B
 TpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682285817; x=1684877817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+3ip4SFD8EZ4AogSeaajIrcWIDGjTnupCvB0Wex6sU=;
 b=aS8YfAss9lHS+cpAn43zKZY5qCr1VtCuI92fh52p39rNlJ/93bE+PmE+5iX7tO/mhT
 LzuR0bOK6OynWZ9ylo+AWwajpoN9hu2234pfrD8uCaixmtviBK1BrgJeAOjZb0CyRemL
 sVUpLlVeqVnJ2F5I9yUpaJXUpplEkA4KMezlgT8HtENov9DRzvm9qdCMhaf+LfwmceGI
 RRnzgQyXDN/yHnyAA1Y5ECtw0qcYWdj0WgPGRzmZe31dXGfFa7fRBor5pyX/AFyrH7jS
 CO5AzNDjMNupFguFaKNvL+p/y/6/QvzxLO/vVGm8gvXhHxQP6LjFhFuZus38P2zoXlJo
 Vq+A==
X-Gm-Message-State: AAQBX9fKMb696YdzChRRWkgeocxp+WAIwgVZEL+sMKsB/5L1wHd2NhTp
 dS+xknSN+Zvw/0/QO3Z02E1GXOJlQePjlDAuVIo=
X-Google-Smtp-Source: AKy350YEV07e4rhC2sKUikbC3KSbrZ0KxnyPPhrSLqzhZHnP47SzVPucdMXG0LWYPJZq5gUmWL1XdW9YM7KyAkHFSBk=
X-Received: by 2002:a17:906:9b85:b0:94e:fe77:3f47 with SMTP id
 dd5-20020a1709069b8500b0094efe773f47mr9464495ejc.67.1682285816723; Sun, 23
 Apr 2023 14:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230423145300.3937831-1-trix@redhat.com>
In-Reply-To: <20230423145300.3937831-1-trix@redhat.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 Apr 2023 23:36:46 +0200
Message-ID: <CAFBinCDQRwaTNLeHD973gD-g9aHOwnu+G+U2di7Tz17LPT2DXg@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: set variables meson_hdmi_*
 storage-class-specifier to static
To: Tom Rix <trix@redhat.com>
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
Cc: neil.armstrong@linaro.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 23, 2023 at 4:53=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> smatch has several simailar warnings to
s/simailar/similar/

> drivers/gpu/drm/meson/meson_venc.c:189:28: warning: symbol
>   'meson_hdmi_enci_mode_480i' was not declared. Should it be static?
>
> These variables are only used in their defining file so should be static
>
> Signed-off-by: Tom Rix <trix@redhat.com>
With above typo fixed (or with a comment from the maintainers that
they can fix it while applying):
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
