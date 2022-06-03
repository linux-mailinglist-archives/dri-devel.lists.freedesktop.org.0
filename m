Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1385653D36F
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jun 2022 00:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6F2113D18;
	Fri,  3 Jun 2022 22:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C74113D18
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 22:01:11 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-30c1b401711so95641027b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 15:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eTD0MDLxzeNH/wZaowzR2+0RiK3EJbyXvBxqEdkLvtM=;
 b=xhJzcH7d5QTXkQNOqXLSstuJfS4pLxYPzVq2duSk1AJq1r+TfbcyB/GAypgPpOtA7r
 /ddKS4Qxdxi7jQbGQOE4x/Gn7UCLAaGsT6ec6lvEwBpY7WMGcsLjQp7T/vT/ELWlD44w
 k93B+XASZcopMTvx14Q0F0mqGkCO2m/Wq0pgvaKjPDaJ0vGi++QMQqPx+gl1Aj15z0D2
 5FUafMzPdam2A9cyN9zshFuvGqVZG7E4wKVxZqRZNBiqVe3a91N6F3lKYwxt3mOw+PbO
 WHELqcOA7kZquMmnjYuil/8EhCFa6BURLXfjAPMx+AKqhYkMVxhM0p4btk8wO6qvyny/
 b2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eTD0MDLxzeNH/wZaowzR2+0RiK3EJbyXvBxqEdkLvtM=;
 b=5IIn8VqL6OeP48VuRY3ZN7hlpgIEM7dARmn8QkAymb+FiGZuQ854ZN1oTD2Ca7YD+O
 LqZB8GH54Ddt+B6nMhak1C4xudBtWpntPjFqXQzQtwo6zI5P6r59O4MHkhQyCdZwpO4C
 m7L2UGAMbZvkZ91/ZQfD7axId2cPQEu13cVG1GnGlmp/crrKf7kzvOaDaVNOXVK6WZkQ
 znXge5bSipAS5Lmt8b3FGubpWAmXTPrYV0+DOwQ9R1TYekpvWWuNLvSBHoqFDIo+aasf
 EDCF0U0hTZGAdxDjHpksG5KTAiu4JrET/Hmc86MbTnZrA3DHgL5Q1W4U6oFw/Ltc5bq7
 h1fA==
X-Gm-Message-State: AOAM533/xxPO0hmLSdJkJmhlYLvFNQN8XGXHsJU+j0rNn0hbtBWxBcZB
 01o9MTsaxoS0+FnwGUThDGUx8n95gF7K0JJF/BvKOQ==
X-Google-Smtp-Source: ABdhPJygLfhw11c+DqIQfw/OzDPBUuIPK8OMfv1NYvSDNKAjndYL5Vk5Dxk796+DH0WSeJFvMkT3GUqpyQVumTKeTYo=
X-Received: by 2002:a81:fe0b:0:b0:30c:7e9c:701 with SMTP id
 j11-20020a81fe0b000000b0030c7e9c0701mr13607442ywn.118.1654293670642; Fri, 03
 Jun 2022 15:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220601082410.55266-1-jo@jsfamily.in>
 <BY5PR02MB700952493EEB6F0E77DC8416D9DF9@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB700952493EEB6F0E77DC8416D9DF9@BY5PR02MB7009.namprd02.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 4 Jun 2022 00:00:59 +0200
Message-ID: <CACRpkdbZwYCT1joo+EdQm8OXkmKHdPPDZicsp_SmH7DYkFMVYw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] drm/mipi-dsi: Introduce mipi_dsi_dcs_write_seq
 macro
To: Joel Selvaraj <jo@jsfamily.in>
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
Cc: devicetree@vger.kernel.org, Hao Fang <fanghao11@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Stanislav Jakubek <stano.jakubek@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 1, 2022 at 10:24 AM Joel Selvaraj <jo@jsfamily.in> wrote:

> A helper macro that can be used to simplify sending DCS commands.
> It is useful in scenarios like panel initialization which can sometimes
> involve sending lot of DCS commands.
>
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
