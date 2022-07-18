Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F1A578132
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 13:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFF799648;
	Mon, 18 Jul 2022 11:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0509964F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 11:47:49 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ez10so20650916ejc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 04:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FbiX+RFIAMeCqfDvuYNCSYIszG13Fk6KIejZi/pE9NM=;
 b=b9NB1aRGK1xMpEy0wYmuiYYeDHdN+OrzTAk3RkL13uzqg2ffPsIzplJiO43jzX3mxy
 aijDR9ab4xqx0jDQYYY3bG1/+S8m/zij3eFWfeLmTaj8aD3Aj7FzaksIHBJYKAXgFfxU
 L24GIh6F4PuHyy8R5ZXFqARNKhTSoTShS9+iwq4YX9E1QILuvGrPjDEUyVbsdIYw6JVj
 v2ROt5wP2qNmqQHUpcBOBqWr+q1guyee19liECetTmesReyn6Xf3ySsuGaIhGYR7M+o6
 KZ+8EkcngIHqXGnDtAEa1q/fn7tAbUZ8dFs2SqmbQK4ROKabsc7znlD0u95KcAlBbCQy
 k2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FbiX+RFIAMeCqfDvuYNCSYIszG13Fk6KIejZi/pE9NM=;
 b=8P0w32qEKDYGSUHioUkixMEbtXcUT3gVvlWGSzb+jNmFvjlqS55PubnFjiObQpS1h2
 ZTkAAa5F6DXAQ03UEM34ZDP8ZW3oQW/u9I5H0oU5sUl4zl8EUcqSe5lXACRHHLf3kP5A
 V/qMqd+ceya/o9DSHrGinRkD40+b9cLuX+4GecD71RfW4qVP5NEkLkEDwbO8YNEa+all
 XbFiLQzNQHYSgGkeYN2at94hQs6c/yTiRFA8KwTrVN144OmUI5V+wpQrM0xukxCsjB7M
 k90h/IrTs4Dwf+d7F/gNhetvnF61JmCf5hT9tDEdTnvaXnsBEQf9N0drAOi0v22HZ+f1
 P89Q==
X-Gm-Message-State: AJIora+g/7qm9ZUKyeCjR8cljlO4j8bMSkITXwQShctJgVRlKcROvP8+
 RjhoCDemwn2ewhU0qC5JC+CEVEudJ6OgnNhgsPVunw==
X-Google-Smtp-Source: AGRyM1sP3A16042BETbhyG23Pn8nBJ5zxFTLn76/uqVR71z4ePBJthKuWPXTwJngHsH5tiyWhlfMpwNlyHMcWNn5A8k=
X-Received: by 2002:a17:907:7f9e:b0:72e:d375:431 with SMTP id
 qk30-20020a1709077f9e00b0072ed3750431mr21578887ejc.580.1658144867776; Mon, 18
 Jul 2022 04:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220715024910.12578-1-allen.chen@ite.com.tw>
 <20220715024910.12578-2-allen.chen@ite.com.tw>
In-Reply-To: <20220715024910.12578-2-allen.chen@ite.com.tw>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 18 Jul 2022 13:47:36 +0200
Message-ID: <CAG3jFyv6_2OcLp2JyKkiEB0MddOS5Tk5Jm5=r7S5EqVyxGK3gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/bridge: it6505: Modified power sequence
To: allen <allen.chen@ite.com.tw>
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Pin-yen Lin <treapking@google.com>, open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Pin-Yen Lin <treapking@chromium.org>,
 Hermes Wu <Hermes.Wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied series to drm-misc-next.
