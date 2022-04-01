Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9369B4EFBAA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 22:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0AB10E090;
	Fri,  1 Apr 2022 20:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D37510E090
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 20:32:46 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2e612af95e3so45157337b3.9
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 13:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tPGbwGIjSebyZCeNuLi9+Wlk2mbuyLsn08A6BcEkwME=;
 b=UMKF5T0fMpD1mp0OzRPRUOJMarOGqDvFGYGzsvKC8eH7JxKHgtYoNBwtg3Sxk7CRZ5
 m9J7Cvk/CuJcfzXJaPEQ/crpWwJE7GQPCfKK3Ktp8H6+cGgVwbdCM/DiC0E9dhFzCv6M
 /W86KwJPkEXmPAToeVBcFngWd6FGsJ+fpYwB5cdwHm6d1uugviDRq4wLNlDhjcPWp/4O
 QViXipmmwiLZFM74q6g3jE1aDR8wq/r+nLQCKuicnXiVpWvK2D37dBvsyuQ12ZLGO4nF
 CWZ1L2flD54O9HZMvpQK9+YOqfoIrdeB56a/NP1KHtsxX6J4n60GagbHLgHL8SpvnC1u
 kA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tPGbwGIjSebyZCeNuLi9+Wlk2mbuyLsn08A6BcEkwME=;
 b=u+NWWsCPPGo29wnf6/vU+no7WQde7G7x7yCFqK0N3TL0nDU86aB9Me1PVYOaaNH998
 OopGRGpexD6OjwKkg4oNdFXQ012j9g/ZY+O1CQcWHygSUfcXek0telAPRhv3V4mJYrvb
 w2yTZp2BBzTluC+tu7saFTVor87yI4pk8jhD7fYUWeVN4OT/4BzWwdZ5jrpekLOf+aWR
 DaKpMh1RWG+uR4qwtEXeWh/81tDNhbRTe4XE69SjyaBzqpZYp/AH28prJKdjesGBtNUc
 Gw2x5C+kqssG+2kpCGvnpIgcihVF3sJimTg7tMraovfJ9S2o+zRrA9TrDVzafLqTxQaW
 ltcg==
X-Gm-Message-State: AOAM532Ld5E4IPFmVQ6GoYSlGVDYQPeFP5UVoISAFMrL+94yp2e/qZNK
 XfkttycLFOs2UFF72/aIFmygwAtw4+7F997cefKWuw==
X-Google-Smtp-Source: ABdhPJxBSFb3fJZnWRsq3YgP5++WVRUDT2A/ziwgi909lW3gutzw8MxUG0u96rzwiYtzd9N/n9aHSAA/7205GwCGwZ0=
X-Received: by 2002:a81:164a:0:b0:2e6:8e4b:7487 with SMTP id
 71-20020a81164a000000b002e68e4b7487mr12034765yww.437.1648845165774; Fri, 01
 Apr 2022 13:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220401150533.7777-1-jagan@amarulasolutions.com>
In-Reply-To: <20220401150533.7777-1-jagan@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Apr 2022 22:32:34 +0200
Message-ID: <CACRpkdYzHvJ82m4kK8igs0pt0qQ+LyjHTBAz2bui_1e4-9VzWA@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: mcde_dsi: Drop explicit bridge remove
To: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-amarula@amarulasolutions.com, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 1, 2022 at 5:05 PM Jagan Teki <jagan@amarulasolutions.com> wrote:

> This driver has been changed to use the resource managed
> devm_drm_of_get_bridge() to get bridge from ->bind(), it's
> unnecessary to call drm_of_panel_bridge_remove() to remove the
> bridge from ->unbind() as devm_drm_of_get_bridge()
> is automatically remove the bridge when @dev is unbound.
>
> Drop it the drm_bridge_remove().
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Reported-by: Maxime Ripard <maxime@cerno.tech>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
