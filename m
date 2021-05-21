Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C5538D225
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 01:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4943D6E0D9;
	Fri, 21 May 2021 23:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5636E0D9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 23:55:28 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id c10so11069755lfm.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 16:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v4JwRZa9StUOWu+uyIm0h+xDZPb2Vrykvc6o8gtd0B4=;
 b=rHb3lfBJCE9Mx9n/BYp/yEvxrIMlWaV76KfBsLya5hGpYMabhQMZjasOO8SBTpTWbB
 37GqY4Is7No6tTOFPfP1lGdL0I59ID7eYDDyLdxdxFAQyOJ4glisq8UR+7usNrLwFRZk
 doPUwXGMspXb1+iofsgvrbbPaHND9OZqFq+R3sIynxXjQecSXX1Y+DFRE5qv07/PUpck
 86hCcuNrTcc2d1hiUPF2Nkv4TcwhmE+ZOi6oJjf/5lapvPTDA4xq05aMe7RGEC3PmsgG
 uiLEqDZmRCdu2UJ/sc7jjCnr63b2LUapGlRqh/qrg4mPNJOacp+WR0xNbhYX964Yjk0b
 /gsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v4JwRZa9StUOWu+uyIm0h+xDZPb2Vrykvc6o8gtd0B4=;
 b=E+KCZ1jcNHmNvd/NCXwuGFYRiBuUEqyNawXUsdNAdErv/SfNwqN2atQkpoW3JHCVgG
 Wpd7NBNnFyPFAsR/eI+7l8JD6Prt+gFOmoJ4M+NSRpL0ch1nGtX8w4bG9hvyfI78Kd9e
 yA/osXaBcFCjRR3cdSTARcK/Q8Ll3TleK5DiKppNpom1gBq22FamH9TDf2z7YxhsXb/1
 YUjetEvFxyf9GnZ9oPps1r0E300ZIuw8gE7p7jU+XuTlVcYg1JiKss2vFKOqtF+lGnAD
 uYxVis5uSJ/hzE2PKZV+arx4QM14Um7E98Pc9GuAoG1trAraAaEndg79PJg6vRMrI7ew
 QQcQ==
X-Gm-Message-State: AOAM531BFi6DXtjvTx3jD67uILM6BsmJnFR1Xgb9IUVsWBo/OmlruWay
 NS/V3ND9DkhAB1tqkruLyD0mzF1xEHb54rIej4yRhw==
X-Google-Smtp-Source: ABdhPJzBChhkZ2/JZvtrSi2TQkgxeb22PAkXYeeuXJXqQtZsukhS8dZ2Ju4vf2tQzzIuCuUgHNvltdsgfT9slARBr7I=
X-Received: by 2002:a05:6512:1185:: with SMTP id
 g5mr3779084lfr.586.1621641326966; 
 Fri, 21 May 2021 16:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210519203547.837237-1-clabbe@baylibre.com>
 <20210519203547.837237-2-clabbe@baylibre.com>
In-Reply-To: <20210519203547.837237-2-clabbe@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 May 2021 01:55:16 +0200
Message-ID: <CACRpkdYACsLcJMD96vxrmOrJFjb675y5t3SXQF6YEOyfeoGekA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: gemini-dlink-dir-685: Remove address
 from display port
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

> The address and reg adds no value to the port node, remove them.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Patch applied to the Gemini tree.

Yours,
Linus Walleij
