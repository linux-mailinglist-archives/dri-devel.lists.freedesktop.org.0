Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8B86A1989
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 11:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED5D10E7B8;
	Fri, 24 Feb 2023 10:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8496710E7B8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 10:06:49 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id d20so13193681vsf.11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NP+TQ3vF7pcinlUFi6f+VP0D/VnVl3SCasWI8iXNvq0=;
 b=KzZ5FxXVT0djdApbCtHaE9KS4cMeCjftQ8c/GWwrWv1pIJR9tM3qJz2xBCtpWaN+Bs
 sE3RYtSLvumAu27LZfjCtQaAUeim8VIqQpug9Ya/Lu1xm3WLaAW/4FkZ84BZlUGVpaRk
 Gjaj3AONrbUsaowofBD5mee67ynkPkRsuKKBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NP+TQ3vF7pcinlUFi6f+VP0D/VnVl3SCasWI8iXNvq0=;
 b=DKQP77SSXsZAPk7fCdP4lSs2jWZo4uQVvrAbF2Sb36aa30uPvJUZt4p34PBzfei1Y2
 O6aF+dykMXYmlo1w4fB6w/Z/7y5BgfaEGZdK4Akt3SuEefftlUz78ePJSsaIkx7MBbit
 IG6kak0OkSA4TURoYdOJGX28hcsMN0f6C/vtzdAKZProFHYOZeThwdRMCXYMszw9P1Vp
 rseV2wh6HcoN7fgapJCLpykLWWGEEtROjpZlpKe9yACENspp/EBDPy2xLKKCOpxH+G25
 xTALpNTgNOcwY77ZFXNUmUgTQYj2ivIQEynKX5ks0/u44HnDSAJ5JaQDR5LKpDS/qMek
 8uCQ==
X-Gm-Message-State: AO0yUKVhDC0sBnl8PNhg0JnKNR30gdqcshAQh+A/fidCkwuR9Yc9xYL8
 hsdRK1iIhQw/gG/+o79HQvC1Jw6vYGOGp0+6TTd4IA==
X-Google-Smtp-Source: AK7set81B6fbTOsk9gsG+fgNxGLa95H8zl0o1rhuh9Qq74RmfTqPLTa8b5jt7B5yFcT3UXrYEcLMEONRH8yre0k6t6E=
X-Received: by 2002:a67:c584:0:b0:41f:641c:f775 with SMTP id
 h4-20020a67c584000000b0041f641cf775mr331464vsk.3.1677233208519; Fri, 24 Feb
 2023 02:06:48 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-8-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:06:37 +0800
Message-ID: <CAGXv+5Fds=fxBff8T+scj+GHZEF3YAHwNturkr1nJfWoWDOmyA@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] drm/panfrost: Increase MAX_PM_DOMAINS to 5
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

On Thu, Feb 23, 2023 at 9:35 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> Increase the MAX_PM_DOMAINS constant from 3 to 5, to support the
> extra power domains required by the Mali-G57 on the MT8192.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
