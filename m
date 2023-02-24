Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E94136A199A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 11:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B4F10E833;
	Fri, 24 Feb 2023 10:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0055410E833
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 10:09:03 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id o2so7265116vss.8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K/7IE3JWHJRTNTnzdoavFidJ6LPEaM9q4fZmYFGLA1Q=;
 b=DuSvUG9OycXrW6z26E5ntJAC8P8Z21ffrQQ0zKldE29yAbLukcTLMCOsd6/Y26MnPR
 3GYz1sfaAjSIQLylvfFxGJHQNWEV4LgX5DU6LGkI+rtH3I3Z8d6jtb/ap6AWzM4viiWv
 8WEUFbO14adJhjvJF/ctsGWNloY4St5A5SwoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K/7IE3JWHJRTNTnzdoavFidJ6LPEaM9q4fZmYFGLA1Q=;
 b=2R5gj9uG5Mo9iVjdhdtjg8/ghJ2sOoQojtVFtwTk/gwVCxvVsC6k7yhNjBOC5KHzjt
 zJ2iwwavThaQ3g0XUZjTV0dAqHrBv73h2pNHb5cskyR0iwg1gt7KXCxkIinkk6q+eXNa
 UUK9+/lp7OHRQOml9m+y7cuAj3wILzZ4u+U990+U/1S5MwdH+J5LGgVG4vGsZ1SaRlys
 /HgjPdOkVFT0tgVPwVg6ZUpxF5YUWibtW8N2PWtyMZdUF5Ie1UZ14OFCgvFmBM8bHhkS
 UWHLwJG10VsT0/qMIqNXKN4kIQR+ofonRjbjcxpw3KhrsdOKc964jwrAh/R3k2SNgRLY
 Ebbg==
X-Gm-Message-State: AO0yUKXvLDREFAt2gAUl524w21vhM0N/Kwkl4WH7i8sTWMrHpoPfEj9x
 8kaieCcNz+2QldtQORn1QCH6X3KENZUzBQlbZNehFw==
X-Google-Smtp-Source: AK7set/RvpYiZdz2LIP4LHIvV09xgbjakyZphGlBWRIs/ctqNr1a9OJ7MquZUocfHsTdE0KvpE3jj3Ssiny0LCbsUw4=
X-Received: by 2002:a67:ec11:0:b0:411:c62b:6bf0 with SMTP id
 d17-20020a67ec11000000b00411c62b6bf0mr2076104vso.3.1677233343067; Fri, 24 Feb
 2023 02:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:08:52 +0800
Message-ID: <CAGXv+5FK8BjSgwS5276FJj4zG_3STMbQwQWdyn3LjOvQ=108RQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] dt-bindings: gpu: mali-bifrost: Split out
 MediaTek power-domains variation
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 23, 2023 at 9:34 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for adding new bindings for new MediaTek SoCs, split out
> the power-domain-names and power-domainsvariation from the `else` in
> the current mediatek,mt8183-mali conditional.
>
> The sram-supply part is left in place to be disallowed for anything
> that is not compatible with "mediatek,mt8183-mali" as this regulator
> is MediaTek-specific and it is, and will ever be, used only for this
> specific string due to the addition of the mediatek-regulator-coupler
> driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
