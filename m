Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD44552487
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 21:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D10910E4DD;
	Mon, 20 Jun 2022 19:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D030D10E4EE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 19:22:15 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id k7so10574231plg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 12:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oOBgCs1oKhLX6l+6YjA7JxDMiSGGwf3k7mwAD0yAsos=;
 b=kc/aTUcgZD/czsu+1K0bcaLwII+rWCUf5wZ5/rEMKMmca0T4gM3SJEVMJHr5JSQdFX
 Ijfxe/NxNEu2UriAJr1D9GOV9XK+qBoLoE0A/saDgeUUUlvO8IKPDZY6weONcSbnLwK4
 mpGke3ZjLN8UW8P/TeUcsz5wLMjUTdkdfP8A5lpsapBKS1aZnVq0wARbZ9uNLnHs87cr
 0i9Mh6ZCfd6MbSqZ/uBJbizAon1HvZzr7ESR6ai4OqWb9sj190jG/S5d7EnNmw/ZOJP6
 qliUdPvmmYT2CvTiv/XppHmxd4eLenZsJeMyM/o27VgWBwUw84RmcG1VvHHX6oLCfhCP
 TNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oOBgCs1oKhLX6l+6YjA7JxDMiSGGwf3k7mwAD0yAsos=;
 b=XmyGgCqYVMxPhgasAnBIchRc2aF2VMtBDHHLC+lIPtrZuP3aJKDfWOyEU0CxUsuYFy
 emyqRGE2uyIHX5vHpAevK7StWa/gLbegep0LrWpTfJ4pX1GEuF5FhT+i6WjQUOFsgvw8
 kC4y1DOGOqWg/jse7B4DRn/vt/ERF0uTPaKfgWARMnrrff9yqJVs9pfqMerVbgVnq77E
 U889tztQMafDvLSl7593p8WeIOeT9MNkBoyUl3EFvgnb8Zmwz/EjoSZZDW6AscjSPKW/
 3Tq6VHJ7rcNpB/7FgI1rh9h2KEdbfod3oW0gbWV6vGDCuCCWEvGuDUN8rHs+SG6JGkUQ
 2XZw==
X-Gm-Message-State: AJIora/DkLoAqn29mc+BgtvRXIGZRm0VTG4qTGCv/CZ2I9AE91h3Alrt
 wCcA1NEmj43U2iBcbhXU/tw1eRuQ1VtmHMVIEHOygg==
X-Google-Smtp-Source: AGRyM1sy1C9FMV0zpCSDUtmmHsqLSolD8o7U+F/Leb9Gs2gN2IUQE3JC9/w2aYnz7jxPghxjLhdaHpZNmUzG61SfAi0=
X-Received: by 2002:a17:90a:cc7:b0:1ea:3993:78f9 with SMTP id
 7-20020a17090a0cc700b001ea399378f9mr39409700pjt.179.1655752935449; Mon, 20
 Jun 2022 12:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220611141421.718743-1-victor.liu@nxp.com>
 <YqsRcUsdZzcwqplJ@valkosipuli.retiisi.eu>
In-Reply-To: <YqsRcUsdZzcwqplJ@valkosipuli.retiisi.eu>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 20 Jun 2022 21:22:04 +0200
Message-ID: <CAG3jFyv-AQU4M1JBPtcZ1gNsrDs8MSBuaOX5_VB29BtC1jmscA@mail.gmail.com>
Subject: Re: [PATCH v9 00/14] Add some DRM bridge drivers support for
 i.MX8qm/qxp SoCs
To: Sakari Ailus <sakari.ailus@iki.fi>
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
Cc: andrzej.hajda@intel.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, linux-imx@nxp.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de,
 jonas@kwiboo.se, Liu Ying <victor.liu@nxp.com>, s.hauer@pengutronix.de,
 robh+dt@kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jun 2022 at 13:18, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> On Sat, Jun 11, 2022 at 10:14:07PM +0800, Liu Ying wrote:
> > Patch 1/14 and 2/14 add bus formats used by pixel combiner.
>
> Thanks!
>
> For these:
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Applied to drm-misc-next.
