Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C306B840C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 22:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAF810E021;
	Mon, 13 Mar 2023 21:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D0010E021
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 21:38:08 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-540cb2fb5b9so162912137b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678743488;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5MoCrv9jwtexNbM0NP+aK8vItTXphA3RLnXqGbEpBLs=;
 b=oBqnejAr+cRAwqwSDggHbvyESDCGAm0IT2diFdiMbosVlO5Ebuhv06xmTVl9Mh/HiC
 neV3kaLcXxQXZ8rWMN8gaBnTm1Qs4vHbNOBsKiKclKcZXxdswwbW7rBFUKdItfCnI55B
 2ciaYsFh+G7t/+4hYcljFYbfjyaEpP3SMr2C9qEUP/kIQsFIHhlZF56rBM4WUzFRQ661
 MMseawNEKdVEkMrE+QDWzPun/jDHPZLOHsF0+5oWgZmpKX/eGOmxBPDExhV/iJDyeQ53
 7MDPKM5XS+1UdJ2cwhsUmyEm2WnUYeGW2PETZiXrAbRMWy1JxeNHHzOrvI5hsaoqnfPl
 S05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678743488;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5MoCrv9jwtexNbM0NP+aK8vItTXphA3RLnXqGbEpBLs=;
 b=J8Z0/J6wqJYG0gSKsVSZ5saMS/2xzh/b5QnAVza7ha/0w+StFK5YqopVIEmMEUm7cP
 ED4SImNzKU100AEyQ4ZrM79qwQKIgEm6WiuTiAflFpqaEyWJmgTaG6rfpvrFnzE2Yj9h
 HXNDu4Rbx10KlQFP2lH2RUmbovXQOS2p5Y5HGqCFbD9n2Ud02x45JBhzCoekWxRoBfMj
 Dg2M+EGeuC1lCOgYuPmg701jStyFU0uXDRbzxYHzi88FJgceAfW5578+63fdEFxFZEWy
 0RSHFwZvHBdtMzVOJDr1VSTcvIJ/FBrZpZzPutSYnlHFEn9I0/z2+QYQWYBrbWdpuCgA
 JwJw==
X-Gm-Message-State: AO0yUKUPE57FzKcvU5oGdYH2t4q1jL2UOaLsxUTL8IcZlOZICPlw4/oX
 XX9oGXU3q11qGLofJQtIGQ9lorVbj273eB9J04NjsTp6XaHqend6
X-Google-Smtp-Source: AK7set8L1lXLBOk8wvAHM9wRqKPNXWlxKrtxI+qzt+FALwwKZEBkTpnXYO0qQldUzFZLmRJDWTgYnC/ZzTNl4HJfoug=
X-Received: by 2002:a81:ae04:0:b0:534:d71f:14e6 with SMTP id
 m4-20020a81ae04000000b00534d71f14e6mr5550337ywh.9.1678743487766; Mon, 13 Mar
 2023 14:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230313155138.20584-1-tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-1-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:37:56 +0100
Message-ID: <CACRpkdZngHNjW0=ZtnjvNV=rfR8tip_iqTE-FDWY+ggsU6DCmw@mail.gmail.com>
Subject: Re: [PATCH v2 00/25] drm/dma-helper: Add dedicated fbdev emulation
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

> Tested with fbcon and IGT on vc4.

Also tested on the U8500 MCDE on Samsung GT-I8190 (Golden)
successfully.

Yours,
Linus Walleij
