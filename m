Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EBA38D228
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 01:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FF36E8A3;
	Fri, 21 May 2021 23:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC01F6E8A3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 23:56:04 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id a4so11096756ljd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 16:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xV/zcZZmjMB2lMxY7tGt9DtNWfH1pvDZsCFKmDpfnOc=;
 b=Li5AXrEfKDYOBoJTHlK4Tw9+1se1u8DJC+ZfzYoKbuijFOqYXLFxJ/9jNn3na7KKw/
 K5v6wWmah+b6WecoQ0NtcXahunZngjXz3QjRv/EAHIuJpYIdZzGtqZIqbikHS5EGRra1
 pBArwZL6fsAERFO+S3E8a2xgfV45imF/Ma1TzYheor/PNjs1p8v82QdLbjTMBZZIaDll
 +Lh9x5zJrhNssBRfG8WDQM5Urfc6ohNMZJbwYpX+Z1uKPnMfjww7p7v2cMkKjTJ+10J6
 nsNgQYJWHeGgl5/pl0OcVUCg2rhzj92vwbfPdR6G1Xzrz4fra1o4W5ytPI1ECqaNFj6i
 Yycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xV/zcZZmjMB2lMxY7tGt9DtNWfH1pvDZsCFKmDpfnOc=;
 b=DP+1zUcCshPb78GZbjMvrVoXpDZa7J/vVGYK5jED2ulXrGYyuPCvMq8g/6hL82F+Cp
 ozYF+QzWmrAOg4O8qzYbtP/EU6U6SJK5OJLn0knINUfgV+rE3qBhBWLT5C3gC1uK9AOL
 AqFDSmd38jum+0R7ALBaYuyJP4gJK/aukbuj9f+5Hi95890erzRgo1YCrUr0O4wmWGWu
 bBSAQqUEJVG3VsUdXL6ExLwlxeGIopwLQ2RAsOxHoWfobOvO/hI4tWx6+2PY+G/1rTdI
 ClVgkySuyopvnfP2iyDSD6qZokVftT/xr9zflQFTaleV5AXAU75N/E3OZCK3xm3lWTly
 R07w==
X-Gm-Message-State: AOAM531Fq+omK0/Q0D7N9v+kpFr2AHVhooILPvugIDspDF0S5lAALTyo
 1Saxcjnxu7BdYHCz99QQdj3f8+QDG1fn6k3zffnCUg==
X-Google-Smtp-Source: ABdhPJzSKTF9N4rFGkkbLa6MruOk7Rzrek6hSegUVpJ6ifSaLKAZ+WHBeQv0qHZgaPFztEgwHjz29RLeg83spwEL0UA=
X-Received: by 2002:a2e:889a:: with SMTP id k26mr8483381lji.438.1621641363241; 
 Fri, 21 May 2021 16:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210519203547.837237-1-clabbe@baylibre.com>
 <20210519203547.837237-3-clabbe@baylibre.com>
In-Reply-To: <20210519203547.837237-3-clabbe@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 May 2021 01:55:52 +0200
Message-ID: <CACRpkdZ9L2xH0vWm5bY_8i4cvdxsBihEf_y-6xY4M6ePumqSvQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: gemini: remove xxx-cells from display
To: Corentin Labbe <clabbe@baylibre.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 10:35 PM Corentin Labbe <clabbe@baylibre.com> wrote:

> dtb_check complains about #address-cells and #size-cells, so lets
> remove them.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Patch applied to the Gemini tree.

Yours,
Linus Walleij
