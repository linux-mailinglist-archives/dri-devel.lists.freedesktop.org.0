Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 204F0602A63
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 13:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBB710EF13;
	Tue, 18 Oct 2022 11:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5115510E20E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 11:40:03 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id fy4so31450074ejc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 04:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oxmszrkjdvUA1KYoJDVjkI93SGmSCZ+8wp2GJj8LSfo=;
 b=gPttWsx3BCuhR01FMyqJsJhyOfoP5WU4xpfBDTDoCO8MLdjYVhXUKC4yLOZCA92B+u
 OwABFEF88WyArM7C7zhgwbp69y2/NFmlieE42WSJ8btB2gQckqtm6cmbxK3YNMGUYw4K
 Hmt6u257Qyv5KypKn0yXqUNM73p5k9rE1+b7yXhZq7RNF4hkffyj9Xho1JDuR2gndS/V
 2ceVGVEWSt94KtQjm+p7oXJBSewMBbq8qaJ+QFJi0LMHhW/HdM64ju0ZZPW3yKEM30uf
 S+HGR6g1GuXzrjWMkWMYrfwZUa02lJEqsOCkQaCtb6mhMC+wU4vH82MbTWSULAB1IWJ3
 zWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oxmszrkjdvUA1KYoJDVjkI93SGmSCZ+8wp2GJj8LSfo=;
 b=hTtBPFUyn7kPMkxN1TV7xb41repdFuVir7UDnxQUi8AjiDddn4jB6pWDVuxM8jYruh
 v5foZBEn464TJTrorskyxpvB93BPFMtRiY1BkClXhLaBHOCADtNsy3SSZU63Hyjh4H8j
 CeEWTpMrWvWDgTGs5bePFuSllD8wOxwcEFbyq4LiSUGCAfTU3oNURXXciWlhStCe9JaX
 QNZhuQU50B1iwdpXRYHkETkjz4CtZsmnIdxJCcHCSJ/6lVg9lMow4GIykFYHZmkVjLql
 KSkCvORvxXH4hCNKaO3fje/fofD5EwgvB3IDaXOGaOTD/huaMgK5ZHogOpGW8hsKVd8Y
 Gz8g==
X-Gm-Message-State: ACrzQf34nBcSse6ucFZwlMT8qgSIoh4LyvSWs4c6ZXVXmQGFYdQg8KTi
 VV/eWRNsqnYshj6CN9Ahkfs3anPuUHIeVVyb7G6msw==
X-Google-Smtp-Source: AMsMyM7bmSgtbPHk1SAogKM8m5vOu0y1Qot1Btni/Qvhb8b6LfhGOOOhQVeFx4WG1q/ZDfF4Jyp4Klm14GSKPk64X7E=
X-Received: by 2002:a17:907:7606:b0:78e:61d:757e with SMTP id
 jx6-20020a170907760600b0078e061d757emr1914779ejc.690.1666093201868; Tue, 18
 Oct 2022 04:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221012221159.88397-1-marex@denx.de>
 <CACRpkdZd_fNYv2sFRJX7nacz1dAp-dAxEzDfTMRKAy4nB6Jbvw@mail.gmail.com>
 <30a171e3-1b82-34a5-e018-349349e246c6@denx.de>
 <CACRpkdZhe4ie+X+i20q1NmvXCv3XM=4pcnU=W-93n2ik+ZcdMA@mail.gmail.com>
 <c23c24ab-b275-f7d6-3e2f-59fa27212e55@denx.de>
In-Reply-To: <c23c24ab-b275-f7d6-3e2f-59fa27212e55@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Oct 2022 13:39:50 +0200
Message-ID: <CACRpkdZWH=ExhVoJ-jTqz4pJxo6pzh-LfyUvj2cyCfVBRLQhzw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel/panel-sitronix-st7701: Fix RTNI calculation
To: Marek Vasut <marex@denx.de>
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
Cc: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 12:01 PM Marek Vasut <marex@denx.de> wrote:
> On 10/18/22 11:13, Linus Walleij wrote:

> > I've been told to go and poke the DRM git people at IRC to rebase
> > the fixes branch.
>
> That would be #dri-devel on OFTC I think ?

Yups, I pinged and mlankhorst says he will fix it.

Yours,
Linus Walleij
