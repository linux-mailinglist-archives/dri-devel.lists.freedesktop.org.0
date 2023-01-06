Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE6A660607
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 18:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB0210E031;
	Fri,  6 Jan 2023 17:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E983D10E031
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 17:56:12 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id t15so2670007ybq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 09:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vItQQ+zMnDwfsgMtdm3lD3jSvFhQW7H/nT05vLZBQiw=;
 b=iI5AG1vyOStZrKfFxQwHmDCqxNrU7VJNf5NYNk8XqSUhrkCd1e4FDj57XzBBz6ndp0
 jiBj4TjR7/ZNhl0IN5kpXmVU2xlrS7897Vn//buTZH45QG8/NwHSbXVFmkFMJyob86/c
 E/5K/F4NBgU+9a1raDLW85y7dU5vrpTcGu7uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vItQQ+zMnDwfsgMtdm3lD3jSvFhQW7H/nT05vLZBQiw=;
 b=7VzR8KNKE6STmB89fAQXT803E4dO6wpHYzAkGdWbOkhkRG0POrhLyIJLrLzMbx09l9
 8Uq/0yZLWo68Ri7S3XQhVvEXp7bJ1+gbLwzc3OFBlAJ5MFFDs+P8gzXJSO40mEbrhAhL
 3ct7oqam5zErUbaS7U3E81bfAagbGs2WgPbJApqyG12CLdbd2u5wastwEtlMdm3AZ5yc
 WnJAHtayLTc4407S/sLaRhby7L48/1OUfUHC0z30bZOGQYyP10AY8Zz5laQ4OjKCprvx
 s8YBe/WkZg4VYjyCSdCTYnJNp3+WBEV5yV6fiI+k6cGP60AcpUqSYPgIvYJgrYbeWh3C
 YzSg==
X-Gm-Message-State: AFqh2kq98J62V2v8/hPlnImzbsT0sAOaDBt9ScYCu2G9fHGtlyukqRZB
 lKZJe0CgmyVigHCvKG/UU4Qit9pN1WDhSwd9njwWmA==
X-Google-Smtp-Source: AMrXdXtbxQ5Qnd+6GL9kE3w6RgWRGntC645ZmfKD8igXwb6TlzMS9itSg1rb2khU9FsUgQ/BuUX72VSfm3IVcT0i9d4=
X-Received: by 2002:a25:bc4b:0:b0:6fc:c36a:1d06 with SMTP id
 d11-20020a25bc4b000000b006fcc36a1d06mr4080020ybk.462.1673027772089; Fri, 06
 Jan 2023 09:56:12 -0800 (PST)
MIME-Version: 1.0
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
In-Reply-To: <20221212182923.29155-1-jagan@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 6 Jan 2023 23:26:00 +0530
Message-ID: <CAMty3ZDGu-acuZ9Bhp_=JcTYn5YWKVZnEUf3nC28Spm8v4+KQg@mail.gmail.com>
Subject: Re: [PATCH v11 0/3] drm: exynos: dsi: Restore the bridge chain
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Neil Armstrong <narmstrong@linaro.org>, Robert Foss <robert.foss@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 12, 2022 at 11:59 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Split the Exynos DSI bridge chain update patches from Samsung DSIM
> bridge driver for easy to apply.
>
> Changes for v11:
> - enable bridge.pre_enable_prev_first
> Changes for v10:
> - collect Marek.V Review tag

Any update on this?

Jagan.
