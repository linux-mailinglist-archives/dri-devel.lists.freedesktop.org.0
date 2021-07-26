Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F443D53A9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 09:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF17B6E5D5;
	Mon, 26 Jul 2021 07:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E036E5D5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 07:15:10 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id h11so10101466ljo.12
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 00:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cOfpNk8cBwygjzCjyHz8QRiXxo98sz2BqAuXNRnjjWg=;
 b=lEFUh/WH6uiITinRF/Iqnt5mx0rDbjrYjOAX+EqORbulhwCdiFCiM14vzgxuTeXiC4
 U+EmK0jTo5sdIvsyHjZA1IYkt3ySBDTyc5497lw0rHm4iBT4Hsp2JUGlUblQcD/rRVCc
 vjTLrw7tTOB22lnDgqVA3cgwhX5qOFXWku54RtGwwhfWA4zNCmq0ObobAB8J6IuE/Euj
 bw7GRhZPw4K+O83v4hHeCZNltTeKX8KimIWvHSpXglmT8oFVayW9ZMwSYWOAcSFjrmIM
 W6z4HnsYn48XBImAeDcOHqZdfp1d0E1Hu9UwP1NbHvyREsmKlQThD4Dgo5njIWEvrmE5
 zczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cOfpNk8cBwygjzCjyHz8QRiXxo98sz2BqAuXNRnjjWg=;
 b=JOn/mVw4/5/KPtQSFaeri4O6HWVvLTJUOwJWiPN6Pqr72D/6xXyBQX4XXVpxAQqQ+a
 dHNJltnWWgcuG2Eam5Bri8QTGxhhYVMJnmVlbGrZZ8NllKeQv1brYEqxqGkpZIQuYova
 +Va9apqFcqr5TvDURgzHROtZ33bmg8f9n15YKytZipyStGXj0lnYGNktewG5Az47nUfQ
 RmmO68cDLcZ8/R67umMxt0kkI0ntkbPZ8MCtr2NxTxEjrRK4cO+b3yJ4H0ttpP91Q+li
 G03aUnA6jCjIsqSvI2STfVMuWdXv14AV7o2yJIWSxXYs420848QBO0WkIVEFirhEvYUr
 r+uA==
X-Gm-Message-State: AOAM532FXDbi4INENjCpUXZfl7zLIc3khBe0xw9I3QNsyuJNUgPKxF0x
 x22qFCF492wmxyw4zwukLOWVvq4jCH3xCpQPrMR95A==
X-Google-Smtp-Source: ABdhPJyUe92qyD4ubvU/cbw2RdqOOoO//w6eh4gn88UzLyuYn5bk8b3ggPXevchReZQ2PP7O1b8K+LWJqxxjari5FZU=
X-Received: by 2002:a2e:950:: with SMTP id 77mr11173508ljj.438.1627283708901; 
 Mon, 26 Jul 2021 00:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210201165307.51443-1-iskren.chernev@gmail.com>
In-Reply-To: <20210201165307.51443-1-iskren.chernev@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Jul 2021 09:14:57 +0200
Message-ID: <CACRpkdanNPaBOAo80wSvNU=ynkS5AVc6gV02jTfq-AePye+fGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: panel: Add Samsung S6E3FA2 panel
To: Iskren Chernev <iskren.chernev@gmail.com>
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
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 " <~postmarketos/upstreaming@lists.sr.ht>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Iskren,

thanks for your patch!

On Mon, Feb 1, 2021 at 5:56 PM Iskren Chernev <iskren.chernev@gmail.com> wrote:

> +required:
> +  - compatible
> +  - reset-gpios
> +  - iovdd-supply
> +  - vddr-supply
> +  - port

I do not think port should be required because the DSI
framework allows panels to be put as children right inside
the DSI controller node without any port linking the two.

Other than that it looks good!

Yours,
Linus Walleij
