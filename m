Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 003E6388279
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 23:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FE66E04E;
	Tue, 18 May 2021 21:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B316E04E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 21:55:18 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id x19so16069484lfa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 14:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pkrHwFXuonxLm5iDdJ3GtAunCIVS4uNey/s/gmA9qII=;
 b=AU1FYN+YPLrrcpqdk93hUps142FI9u50Upipl/5vJqomzUF0z2WNfqfHR37Zp7iebh
 feqtivkL/u2Wafb4kQ/YzUqSKgGNdrKaIZJBN3en5R+jCNfro1DuQby8XvHgMbMXhQF6
 OhqnhYqxohXqln7+PRuUMZY4V+QHiSL30NCZojyMjkT/eJCfGmqImDQg8SgpShUmKMsf
 bTXsHFuZFsGhWo8QGdRryEVMuuGTMhrAIQYobnp6UQyx9CgrebwdEp02k2qoHre477KG
 0rmJrsggg4sirK3RhtOdRNPnbhSW6I2Rpua/JBUnFz5gIwraJHX3N4m/HSnojveMLYea
 uPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pkrHwFXuonxLm5iDdJ3GtAunCIVS4uNey/s/gmA9qII=;
 b=YidoUUylx6QP5pkXCf/UdPlWQpIWSwQtA8vs7N4ATEE+3TKALQ5yWy/Wedh7pqVUH9
 qvqLzGn+2fkv3/VQuj3jd9JriFeePm7yIqdpZE78YryTD9w3EBm03I2roRK+Gdf9JXA2
 5Ar9wXria23xoycN2otkNC12T93V3BvyY74NZrc6m3TpCjRYf0zhxWbFMD/SQsICDIEd
 sgToXxPs6nGVOibCqPfUpY6GpGOJVsbep9BE/BzPA81FWhKQEQ2JIATFkbD0k1HHldZ/
 dX3lyqSrdHRhPpzxfv8JJimsfHG99Sjox3wCR/g2jpscKt8cRe8PYh3ALifYLAih74r+
 Sa1w==
X-Gm-Message-State: AOAM530lMrQqP2IllIdnC4/ESwei+Xv2C+MY7bxQfBby2tYJrJQTqHxQ
 G+jkp0l0dwcMVRkmZ4Zo882y3E2nmtTMQYuHYe9+9w==
X-Google-Smtp-Source: ABdhPJz9MA53JA954IbUUfEyxfpo4uPR8Ul7Uig4rJHfmQ7MaPqfNQ6SM8JW041MR4qdzpgyVUbRq0S/NwMESjwAGs0=
X-Received: by 2002:a05:6512:1050:: with SMTP id
 c16mr5611408lfb.586.1621374916871; 
 Tue, 18 May 2021 14:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210511165448.422987-1-clabbe@baylibre.com>
 <20210518002624.GA3346846@robh.at.kernel.org>
 <YKQJjrlTB0RZYNOK@Red>
In-Reply-To: <YKQJjrlTB0RZYNOK@Red>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 May 2021 23:55:05 +0200
Message-ID: <CACRpkdYncNhe=iuqk7tAu=XeBSOcbbG=ArvxYYRmOGbHY7gyJg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: convert faraday,tve200 to YAML
To: LABBE Corentin <clabbe@baylibre.com>
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 18, 2021 at 8:38 PM LABBE Corentin <clabbe@baylibre.com> wrote:

> The only solution is to remove "reg = <0>;" and calling the node "port".
> Does it is acceptable ?

It's what I've done in the past at least so looks like the right thing to me.
It is only used in this device tree:
arch/arm/boot/dts/gemini-dlink-dir-685.dts
if you send me a patch to change port@0
to just port then I'll merge it pronto. (I can apply this patch to the DRM
misc tree as well when Rob thing it's fine.)

Yours,
Linus Walleij
