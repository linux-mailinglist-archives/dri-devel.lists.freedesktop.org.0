Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4561C60AF61
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA3610E888;
	Mon, 24 Oct 2022 15:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAC210E888
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 15:47:42 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id sc25so5927406ejc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k8cUhyF+iRbpVm7ZibvpxWN910TkG4qCMbi/DBVKQRg=;
 b=QCCxpZW74bpelD0cNFpuKewanqSBjPB7XKJWDhBUTh84B2UhnfiEX7GS+upegiuLBN
 GnCLEiGyh2+g1Kl3P0dDR8QNa8afxCSggYk5rMFobYArvjr6oqrzFOf9gS3aSWB4ZFda
 Xp17BhKgvbvZPef2NqX9p2f5t6HDGFD00BTLbhbHBUEGa05KY6EZmP42uKlWCESxSQDU
 2Kg9+7nk8CAJQD0XlnwOFeQBBR0e0NvmzklW0Yz6WsNRJ+5/iRgp2e+8v/YGH2Opus7Q
 DrQdCkgbinCnYan3+pBpZfZw1E5RRsY1RLLRy1yybVUMPQ1b+5k/ni9Kr73H8v8XF5nd
 2tYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k8cUhyF+iRbpVm7ZibvpxWN910TkG4qCMbi/DBVKQRg=;
 b=1NrHKfcHIWosqL9PxIsrfgGvZc5ka8KvPJQB9N6UR3xOgN1nKKW1IjzOAm2xQBzrvV
 C4AGHOo6E4yIW4jObApSMHNG7VrArR2uK+Wn0s0i2d86BOEVX4lhXQm0Wvin7QtItDKi
 MhuQiu0e8tojXr+xMHNUX9dCwNfqyyE9j4s/uhiIOHWTZWfpw69BsQCaifBV1idxRa/D
 Y9ZqjWQORkimcVCMXeEOxdYk4OzbNdvLFGjdgeVvbC/WWW4QvcKeS45PVaNh0Jgq8/tx
 wNTLRxVtBNu/EzinlH2BA5TmFcPtAR6+dysJlYHCeDcX/rBxHN2O8rQzi5GimiuZknLl
 sGCg==
X-Gm-Message-State: ACrzQf0XQQsD/4P4VdeyrcDZGDUkG5cfrQbIumwhJXKj6evyDH0heUyH
 b4rlqznvvbs+QVfCO78hlh87czzeiUXzDDIifpABpg==
X-Google-Smtp-Source: AMsMyM6eSCRZlQsr3x3MX2LJ8U7dR/Lcp1uuiIC6p0cWOh1wq3htWWGbxETJTk6iSILIXgvjOp4IhCLlxGinAjrVdY0=
X-Received: by 2002:a17:907:5c2:b0:77e:def7:65d8 with SMTP id
 wg2-20020a17090705c200b0077edef765d8mr28634968ejb.487.1666626461004; Mon, 24
 Oct 2022 08:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <1ed8351c2cb4911fcda21b97f7a7b089e955c301.1666357434.git.mazziesaccount@gmail.com>
 <d1ed9ab7-6d67-fd93-6a77-86ea029eedc5@gmail.com>
In-Reply-To: <d1ed9ab7-6d67-fd93-6a77-86ea029eedc5@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 24 Oct 2022 17:47:29 +0200
Message-ID: <CAG3jFyvveGsO6VW1q8-aK1psabze5gAN=wCn16+Q4A_KH=WuvA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] gpu: drm: sii902x: Use
 devm_regulator_bulk_get_enable()
To: Matti Vaittinen <mazziesaccount@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-amlogic@lists.infradead.org,
 linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Oct 2022 at 15:24, Matti Vaittinen <mazziesaccount@gmail.com> wrote:
>
> On 10/21/22 16:18, Matti Vaittinen wrote:
> > Simplify using devm_regulator_bulk_get_enable()
> >
> > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
>
> Robert, I did slightly modify the return from probe when using the
> dev_err_probe(). I still decided to keep your RBT - please let me know
> if you disagree.

Not a problem. In fact, feel free to upgrade it to an acked-by, to
simplify merging this series.

Acked-by: Robert Foss <robert.foss@linaro.org>

>
> Eg, this:
> > -     if (ret < 0) {
> > -             dev_err_probe(dev, ret, "Failed to enable supplies");
> > -             return ret;
> > -     }
>
> was converted to:
>  >      if (ret < 0)
> > +             return dev_err_probe(dev, ret, "Failed to enable supplies");
>
> Yours
>         -- Matti
>
> --
> Matti Vaittinen
> Linux kernel developer at ROHM Semiconductors
> Oulu Finland
>
> ~~ When things go utterly wrong vim users can always type :help! ~~
>
