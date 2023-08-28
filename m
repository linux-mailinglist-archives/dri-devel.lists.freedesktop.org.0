Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E06B78BB0F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 00:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B5310E364;
	Mon, 28 Aug 2023 22:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BE410E364
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:39:14 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5657a28f920so1810865a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693262354; x=1693867154;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HcWugy4FfAsRRLNZLuk5CmgbDUPnvpdUf0zbh9zIsCo=;
 b=MP73UVnC8bBJVHy9EOZoaC7oTS4K4ufjuIJl8WvnOMcBi9atD5HtD66EJAJj7UrDqz
 Z2V1PadfaFqPbDYzgdKaYtIBWoY2SFh7xMWKf2um0Ziab1SUTqqO3DynvtjftkicUkhZ
 ANZClw9uwndzhHfTwfMWjTFV0HJI3S86QfaofrYGMa8uEtWPr30U1fZK5qH9l+Tn9R5E
 EWXEZuE/9K16EMBPQfrQG4FLJdzC9JHyCEH5buHMk9Bp3mxEx8E4YGPnqQFu3XzzoOWd
 l6eVePBAnfd2ATzxbVLTj1RtiPivm6T6jfWoRs5smJNPUVxbG7VKDyP1q+Y6BlFdrl1B
 9jKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693262354; x=1693867154;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HcWugy4FfAsRRLNZLuk5CmgbDUPnvpdUf0zbh9zIsCo=;
 b=aUR42L8Pr4+qJM/4PEfyTNzGk6af26y1+Pdmmh2HY7C/MtCAOpJjC9wbS8EPOjfUFC
 XBOIVIv/LRxWgeujN2b7Bwl1SMOJRPT6KiGWZ8chGfEe6hYYXQ0aJZa8DVKTCGbhzJR6
 80l8EYaBb0cLJxRJW0RBs2j3XgYR4YeWJ3Rr9biShReJlabkwVCEhgR8XHObuHdV5Heh
 HDP/MT3z5VIYlTyJi3KKw7GCup1uPaCNkm5MwRKD4IISLr6aPs2IP+X8HpL6b4AfL09c
 jOCFK3965FqvDQ2h38mnez+hnezUNKBv1qUapbozXeemk5uvtNtYAFPhc2g2H/F5uDU4
 Lkcg==
X-Gm-Message-State: AOJu0YwtPjTtmAS4teQtufgsuA0mNiTb6dYUPq1TeGTwNilnGPRl0BYW
 rSnQdE6nMyroxw8sPvLZuTNnRs12MImjCNhruiw=
X-Google-Smtp-Source: AGHT+IGHXO796tTurZs6XtySiM72Rkx3bFG0r8wCpRe3WhLIBaVJBUr0b/cvwAyijyMcVeAMRboJUNzS1fRZjh41zk0=
X-Received: by 2002:a17:90a:7021:b0:268:ac99:4bb4 with SMTP id
 f30-20020a17090a702100b00268ac994bb4mr20964263pjk.46.1693262354315; Mon, 28
 Aug 2023 15:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-4-b39716db6b7a@pengutronix.de>
 <CAOMZO5AFEDMT1de2O2sUUuw8E0ZRCyD4QVVCKxAtfRaisU5gVw@mail.gmail.com>
In-Reply-To: <CAOMZO5AFEDMT1de2O2sUUuw8E0ZRCyD4QVVCKxAtfRaisU5gVw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 28 Aug 2023 17:39:03 -0500
Message-ID: <CAHCN7xLuzWk53dTOM_ySVTGuqNZwCXDiZ236CXavyjSKZp-sRA@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/bridge: samsung-dsim: adjust porches by rounding
 up
To: Fabio Estevam <festevam@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 kernel@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 Michael Tretter <m.tretter@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 1:26=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Michael,
>
> On Mon, Aug 28, 2023 at 12:59=E2=80=AFPM Michael Tretter
> <m.tretter@pengutronix.de> wrote:
> >
> > The porches must be rounded up to make the samsung-dsim work.

...at some resolutions and refresh rates.

>
> The commit log could be improved here.
>
> The way it is written gives the impression that samsung-dsim does not
> work currently.

This is a big improvement in the number of resolutions and refresh rates.

Reviewed-by: Adam Ford <aford173@gmail.com>  #imx8mm-beacon
Tested-by: Adam Ford <aford173@gmail.com>  #imx8mm-beacon
