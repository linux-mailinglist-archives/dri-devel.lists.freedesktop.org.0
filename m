Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF71526B48
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 22:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88D410E1F9;
	Fri, 13 May 2022 20:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A209510E1F9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 20:28:48 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id i11so17158210ybq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 13:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J2l+7pycfnV5tL/FeqC4BRRTmDMvEO1d4ShvU8Pi4JY=;
 b=Z8HRsEVnERpdmjZslZsddk0NgJt8PEAh8MLOqTqCEajMguIFpTBGJVNEC721C/Z7PM
 +/Sit+OyXmXiBrLslU5E+sr2R6BWDwkSRBIGVRonJqwM4SASdDDcdcSAbDxwglEOOfOk
 xDXSkH+WKLARytcpIm6K8R7RbOwnLmQNuJ49g97xOc+HKI2SqLQT/OA3xTH5YzZga8AF
 tkdZqb2wMTsdoXNwz3OKQDe6n1SbT8104I2jd7mY1gh4p0AnmhmoK/nyrETO2rDTRZne
 G3p6f3NXN3BNYnx8ckYsKss5J5EYCea2C7tt6x/DUfZehN/XxeU8ljG/iEmJ4dxc46St
 Itqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J2l+7pycfnV5tL/FeqC4BRRTmDMvEO1d4ShvU8Pi4JY=;
 b=qp3RbcGL2k+vmsPEiv/c9BwtnqeDtaN1tWc7ECsVC/ZGTVtYBLPRWgP9VMdr1mAgze
 Hqnid76WHkZxMV4DqudSh119Uqxdz9ZO3DE8fG78lfdqji9Uy0m8uEjfUecoxfcgJYe3
 ZzuRNQkqwAcXQ715WuO4usyLeUgmtp+61LVkmNcml0bjlwO0wqY2hk9C2GcdpyfTkAlW
 MaLurvvzs8y8Dvzl9+tPXbbWoc5o77dY9jETdP1qFPZwRfE9NSpDz0/udK4/FvU1lltQ
 A07Hpjh7wOA9pG+/S9+krnzvZrIuKuTKJavVxwhbkWU1/s7frp4uDMURa4GF/1NKPv7c
 /2qQ==
X-Gm-Message-State: AOAM532FwEqtK8TgV7nqUils2BO/T4qmHXh7/4brLojya9Cj96a8ljGV
 S5j9V5ufUBb1/Znhd5UdXXfVfZ/uQsUrITmy3DcAWA==
X-Google-Smtp-Source: ABdhPJzpsIprE1mVevIiKrqLa1rexOsJwYJXY46LUj9YMdYjW6XP8MscpQDLdK6N5tP7dIpU5bfhNO1Vc+OXpXCWczg=
X-Received: by 2002:a25:e684:0:b0:645:d429:78e9 with SMTP id
 d126-20020a25e684000000b00645d42978e9mr6876546ybh.369.1652473727879; Fri, 13
 May 2022 13:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652245767.git.jo@jsfamily.in>
 <BY5PR02MB7009F6D4CC6CA1C433912C56D9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB7009F6D4CC6CA1C433912C56D9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 May 2022 22:28:36 +0200
Message-ID: <CACRpkdb=Ub7sEQQAhjvhOq7xYdd0yZBnT8W6xi7QrD+j7T8j1A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: Add bindings for EBBG FT8719
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
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Stanislav Jakubek <stano.jakubek@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 7:28 AM Joel Selvaraj <jo@jsfamily.in> wrote:

> Add bindings for the EBBG FT8719 6.18" 2246x1080 DSI video mode panel,
> which can be found on some Xiaomi Poco F1 phones. The backlight is
> managed through the QCOM WLED driver.
>
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
> ---
> Changes in v2: (Krzysztof Kozlowski's Suggestions)
>  - Specify maxItems for reg
>  - Cleanup and simplify the panel properties
>  - In example change "|+" to "|' and "dsi0" to "dsi"

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
