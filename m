Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F7D74A46A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 21:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B54E10E4A0;
	Thu,  6 Jul 2023 19:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79C110E4A0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 19:32:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbb07e7155so25305e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 12:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1688671958; x=1691263958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NUuKYRwlFUzABWSf5+6iBwx53UilJyfRZ0D3hmTP1sA=;
 b=wwjvOn7ZtmjHXgig4UwagIJ2tdWzskYb8d3pwKOsLO3XQC2hMvKfVEbHlAxbQquyfg
 XTssqv0UZAgHXIlofBZLjxpvJPK0bsuBxSZbBJ2gsTnopXsodSdtrgDiHJNDvUSH17SG
 fhSEn9sWYW4GtB4xe1P1MDS8PcSbCpTBgPMaBI8b1qZjY5XuLSoFLNVuEdgrzhV32NeM
 Q3QOE/jbOZoA2oHTEwJzlOczHylD6fav6AkRWAbveqGF7qOGfsyz9aKvn4D9sCc1CTuN
 fhtkgTIbrHC20wj4UnstqCYgbTu9x2V8YFQ2FyZsZlJ34A3ee9MoHh2iUxpsfzitgXlm
 qYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688671958; x=1691263958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NUuKYRwlFUzABWSf5+6iBwx53UilJyfRZ0D3hmTP1sA=;
 b=d0dPqnIGI32dQ335NN1J07kSEjLJ3QrkPmkjY6CyML7AcoT9GD4QtEHtupgbS1VjUb
 K6KK5/Ftd7pEfBd9R5UwjZur4qhd37kxckADlOuO+NmHuUywEejzh3EdpW6I7X3oE2Jr
 YzkGVDWieZUs04Bs0ePetburmM8akDHkcQd/2aiH38sid/DVs9hOvRdc23n1fPjIO7wH
 zkwo6MfRb3HZkmhch3ZRqnVyuB1uwO2y9ZPQ4Hva+O3DWaHZRnDHaC8OWxdsbNGTbwKV
 gNIlKHMUBFioaZUydifotKY+saLw9wQ8Q2EFY1TgN8v7d0wbEAuqUjD0ro/bBnvg1LY6
 B44w==
X-Gm-Message-State: ABy/qLZwKawjvaaAWg48Yv9F4foHpyJ8DH6dDpC2CUUy7lRMIwW/teU4
 MGctpVq4p3LJHP1WBd/drA93nGkoUiXwqekJlj36tw==
X-Google-Smtp-Source: APBJJlHL9PYr9dSGpbA5exBVajFz1DtuA0DPX5OnGxYtitt5MLyRP/w2oVbM0cmmOZJi3LU8MBO8oJvWu1d71aomjrk=
X-Received: by 2002:a05:600c:5204:b0:3f1:73b8:b5fe with SMTP id
 fb4-20020a05600c520400b003f173b8b5femr16756wmb.3.1688671958285; Thu, 06 Jul
 2023 12:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230704050744.1196293-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230704050744.1196293-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 6 Jul 2023 12:32:26 -0700
Message-ID: <CAD=FV=WNLcw2JbMf7tfob2KgjB8eXTC0p1J4OYnQL4k3Mz3mgA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Add avdd/avee delay for Starry-himax83102-j02
 and Starry-ili9882t panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, sam@ravnborg.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 3, 2023 at 10:07=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> From power on/off sequence for panel data sheet[1], T2 timing VSP to VSN
> needs 1ms delay when power on, and VSN to VSP also needs 1ms delay when
> power off. Some pmic may not be able to adjust the delay internally, so
> let's add a delay between avdd/avee regulator gpio to meet the timing of
> panel.

Unless I'm mistaken, all of this is best handled via regulator
constraints in the device tree. See the file:

Documentation/devicetree/bindings/regulator/regulator.yaml

Specifically, any delays related to actually ramping up / down the
regulator can be specified in the device tree. Nominally, you could
argue that the 1 ms delay actually _does_ belong in the driver, but
IMO the 1 ms number there is really just there because someone thought
it was weird to specify a delay of 0 ms. Given that you already need
remp delays in the device tree, it feels OK to me to just include the
1 ms there.

-Doug
