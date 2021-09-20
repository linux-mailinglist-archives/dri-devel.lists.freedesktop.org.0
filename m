Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE99411A05
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 18:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58B16E5A3;
	Mon, 20 Sep 2021 16:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C00B6E58A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 16:43:21 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id x27so70250051lfu.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 09:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ktbwkhy3rbgHFFQkdiJBYVtvpT8HovLT4b4l+npAGPY=;
 b=Nh50tnKdv84V3ZH13m/5EugbkPkw6ob9DNK0VYQ9JoZZRC4H3Z1k7esuLHEUCxo1f4
 MGm3VlUyGuDU2UFrH1iOSGN4VSFnKfsJYns6KzACGeXOs9KFYqzcx5Zwxppxzlyrnh5e
 gVEEj+5b8uwMlyzCZdWnS8iLn/AtygQgpffak1fnqiUEBXB3pR5ir7BeDlMCnvltaBqF
 PuMznbFCRdkoAjf+VgFWVRZXZxnMVc04IOwtiFmYUmcXRbjSKrepK6M6z5Iw9TQLgL7X
 Tprvje23cnnutuONA9fezjv8IRkFlEJ04sGZwbQ8wzENWeOySK97IkAeIgEw+AjtYlIp
 UNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ktbwkhy3rbgHFFQkdiJBYVtvpT8HovLT4b4l+npAGPY=;
 b=tZDg7qb6KJ0THvgZM1AkmINFdIGCkNAEWkvg9+G2idIZY9XFr70MMAjIKb9SLP79yj
 j5WEk1qWKwQTIKs2gLOgLe+dH+tEVXMBY4llCCykCDOU1ZjN3zD+8wggaJGaGOjzd4Ok
 pWCzaNY5i0uZKxKOQ9QIf+EghOzsxNwqGf0AFHmJNhH7kYbtZxN25x7su/ne5ZwXkq/e
 Brf5Ql8HUhMVf0D3L8fG0ZM6/3p8NyylmfuFFNPeRNlqgpJufygtbMEGGpr+pWl0eSdr
 MdPpiWwJ4k52C58VW6xZ8HZ3zfJ975tCjQ6/7Ezl33myngfnjOyapDvThdnjohaBpe40
 nPDg==
X-Gm-Message-State: AOAM532BxAf6eY9Vo3QlUgaz15OV3trbqy8jzxIUEnd7cVtBtDYJPxHQ
 snmlAxGLIvMHstozwn1mFnI=
X-Google-Smtp-Source: ABdhPJxxi3zhkrKnK0e6UqV9MLL71sHdRrsqPl2nOa2d6w6pzbMEX4j1pwOONAP1ppUtqCAgKN0wmQ==
X-Received: by 2002:a2e:2a06:: with SMTP id q6mr22809575ljq.424.1632156199788; 
 Mon, 20 Sep 2021 09:43:19 -0700 (PDT)
Received: from [192.168.2.145] (46-138-151-206.dynamic.spd-mgts.ru.
 [46.138.151.206])
 by smtp.googlemail.com with ESMTPSA id e17sm1817583ljk.133.2021.09.20.09.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:43:19 -0700 (PDT)
Subject: Re: [PATCH libdrm 00/25] Update Tegra support
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <cyndis@kapsi.fi>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c0d43222-2d45-fee7-f96b-2ab511b94d88@gmail.com>
Date: Mon, 20 Sep 2021 19:43:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

27.08.2021 16:22, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi all,
> 
> this is the userspace part of the kernel patches that were recently
> merged into drm-next:
> 
>   https://patchwork.freedesktop.org/series/92378/
> 
> The goal is to provide a userspace implementation of the UAPI exposed by
> the kernel and show its usage in some test programs that can also be
> used for basic sanity testing. More complete userspace implementations
> are available here:
> 
>   * https://github.com/cyndis/vaapi-tegra-driver
>   * https://github.com/grate-driver/xf86-video-opentegra
>   * https://github.com/grate-driver/grate
> 
> Thierry
> 
> Thierry Reding (25):
>   tegra: Indent according to .editorconfig
>   tegra: Remove unused IOCTL implementations
>   tegra: Extract common buffer object allocation code
>   tegra: Fix mmap() of GEM buffer objects
>   tegra: Add flink helpers
>   tegra: Add PRIME support helpers
>   tegra: Make API more consistent
>   tegra: Install tegra-openclose test
>   tegra: Update for new UABI
>   tegra: Include private.h in list of source files
>   tegra: Add channel APIs
>   tegra: Add job and push buffer APIs
>   tegra: Add syncpoint APIs
>   tests: tegra: Add helper library for tests
>   tests: tegra: Add gr2d-fill test
>   tests: tegra: Add syncpt-wait test
>   tests: tegra: Add syncpoint timeout test
>   tests: tegra: Add VIC support
>   tests: tegra: Add VIC 3.0 support
>   tests: tegra: Add VIC 4.0 support
>   tests: tegra: Add VIC 4.1 support
>   tests: tegra: Add VIC 4.2 support
>   tests: tegra: Add VIC clear test
>   tests: tegra: Add VIC blit test
>   tests: tegra: Add VIC flip test

Have you thought about moving tests into IGT? Wouldn't it be a more
appropriate place for the tests?

Perhaps we can add/move Mikko's UAPI tests there too, for complicity.
Although, I'd prefer it all to be written in a plain C or C++.
