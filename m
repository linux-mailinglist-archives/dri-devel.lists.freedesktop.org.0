Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E33FF2DCDC9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 09:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C076E1CE;
	Thu, 17 Dec 2020 08:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE86892D2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 18:35:41 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id w1so29538502ejf.11
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 10:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d2bDH/Hol0H2oHf/Yy3g6/HrXyqHXNmIJk03IBlf6dA=;
 b=ruJ7UmwDaf1pgP+nog1BinyUL0Id2q9FFmQZAYWRO0BzfsP6yBb4jRLW23HrDtURw6
 XRqwa9mvxETQIfCFrmJ6ZDL4F/lwQf9eaQagjGmOhiF9iG7V3vFoP6LqSC6Mg8zXK2fW
 OgPNaORyQGTFj+qTHC/FDy+wQ+MrrDiDtCnu13UuxPmnr1bmSXODmOWDlJY+0guEnkSm
 yBEKFUeqLf2TTEgBSqroN2/i3nVf2HHw4uD6p7lKRvAYKPrV+3y2blyc9EsGf7l6zdEz
 cnHhLNg05rpedHAgP0dWTRhm3GbLDmqGmaukknDr3JeV6mnf56WcojRV7EyLDxIVQ0f3
 tlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d2bDH/Hol0H2oHf/Yy3g6/HrXyqHXNmIJk03IBlf6dA=;
 b=NxtihJdzrJudCPSFcXWY1m4WbJOWar1R9hg1Kx80J/jBD2jdN3+FiC395Mw+nbs1B9
 L5+n9Zu5XmkqoGYHZQ1dZvTXWMCXEMdI2aaDmJsJhrYeI31+CHxkGGFkQ6TqZhYNTWVY
 zRVrqcEM3TEunMxyXIJC8EKdKWa6S5X7/vr9ofqj0ZXohcDQBQsFnt8JUuPs0AL5DY0c
 gUe/Mr6ZAe84h3wRfrE6h7OmvdSqlDLZnzWd0xwTaJdtWnLQPArnBsUFePmT7LltY5LP
 fqNvi7N3kemv9lhiussPV6Jm4x6F4tucBu9RgvNYA3vigNPKqve5B3ahnHew1TvivoCu
 pWIw==
X-Gm-Message-State: AOAM533LdMNb1mGUp+I+QJ21Ys+Yep/+ZkgNEgFJrRT45Rptw9baqJNK
 sgvjNfLVM6mmryz5VowznGI5HgICG4tzcHVJC8c=
X-Google-Smtp-Source: ABdhPJwJorgowRP1Ej+Yh/emGfpY3PCwFgLOuCERmNcG8RW/aPrBJ/ZsgMiAwxwMp8IbhO1yk7JtRd/oNlBt7/s2Kkw=
X-Received: by 2002:a17:906:ce2b:: with SMTP id
 sd11mr32928366ejb.334.1608143739911; 
 Wed, 16 Dec 2020 10:35:39 -0800 (PST)
MIME-Version: 1.0
References: <3F164009-1941-4980-A704-A35EAE3EDAB1@hxcore.ol>
In-Reply-To: <3F164009-1941-4980-A704-A35EAE3EDAB1@hxcore.ol>
From: Mathieu Tournier <mathieutournier@gmail.com>
Date: Wed, 16 Dec 2020 19:47:19 +0100
Message-ID: <CABWh7Q-j57g_vcTx29Po_L8t_nnOMNjUvYdzbuGsFz-xsmV7AQ@mail.gmail.com>
Subject: Re: [PATCH v6] drm/bridge: add it6505 driver
To: "allen.chen@ite.com.tw" <allen.chen@ite.com.tw>
X-Mailman-Approved-At: Thu, 17 Dec 2020 08:43:32 +0000
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
Cc: "Kenneth.Hung@ite.com.tw" <Kenneth.Hung@ite.com.tw>,
 "jitao.shi@mediatek.com" <jitao.shi@mediatek.com>,
 "Jau-Chih.Tseng@ite.com.tw" <Jau-Chih.Tseng@ite.com.tw>,
 "airlied@linux.ie" <airlied@linux.ie>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "hermes.wu@ite.com.tw" <hermes.wu@ite.com.tw>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "pihsun@chromium.org" <pihsun@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "yllin@google.com" <yllin@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Allen.

As it6505 is compatible with DisplayPort 1.1a,
Should DPI_PIXEL_CLK_MAX be 165 000 instead of 95 000 khz ?
This would permit 1080p support, as it may be supported.

Mathieu
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
