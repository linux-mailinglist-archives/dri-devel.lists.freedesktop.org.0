Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8504AB0BB
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 17:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8161E10E16D;
	Sun,  6 Feb 2022 16:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF09A10E16D
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 16:51:38 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BD5433F1F0
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 16:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644166296;
 bh=vDkDi7ORKLCJHUi4o/FHJpx5nP2VVbFUW40QeGRguEs=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=GZ8f2ENj2d3aaCTfBDOYNYtS1aSy/p9uVoKpXqzNmdvqzgGy6BBNwROxzNCV6C2Id
 Dc4v6s2arrWUESXJVPLIWaSJmH4rpp5jP3YYVpyI8abgPsMPq6nSj6CqG+tUXAL/O+
 /TlbllGO+dwzTTl+b6Owy5+gmFoZbhgpIRlFU3N/1OeG6axZWqM4dcyk+swituy5N7
 9DBNH7YmEi5MBHRvMz9WpuIYQ/k6VkcTNPDU1UtBv+XSJisYTZHJpdAFHemZFOFcLL
 cFlKipcht0NlMPFPSj5XwFMfVJobyLlJcEJ5BkIvnFxoFgW7OV1QEWUnGB0JM1R5hl
 zh3uRgHJIpGhQ==
Received: by mail-ed1-f72.google.com with SMTP id
 g5-20020a056402090500b0040f28e1da47so2603444edz.8
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Feb 2022 08:51:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vDkDi7ORKLCJHUi4o/FHJpx5nP2VVbFUW40QeGRguEs=;
 b=sScZy8w7K5YoJ/FbRBAhROC/bxHrFDWuVB7OCyjpkWKM3P5mBiTy2V/whr9QB+H4sU
 z2but2Pn6v5BqzMgC3XSADAuByTwR34rerZ50+eWfaSPAWx3YSwLg6CrD4z87fQggRQq
 ByV13d8XBanTHEiLlSci0cz4Zlh2QPCie7fl8sHmghpgMjQMheoVmo6k8Ag2kp4oV2od
 EcwhGAB/X9NM767xAXqUXxu/eiRe3vATruM1hcCT8U04T+Fnpp3bexwqPXtxVHBnFzxa
 34gN4gqVPgffuo+X+8nuR2BpnpSODgilaGgUsP1aWs4kCVJUfjd1YxDyMdGYrywc98Qb
 43Sg==
X-Gm-Message-State: AOAM5332GLaDoEjygorhO8yA+msTwRdMqD6BypzgN4eers6MAodeEEbS
 vgESudn73lnx/3XMgT1eB9zf/XT1pPkLLPL8s7GgaqVJlmrF7xBfXIMH3HMx4BXoPCxKLwLHWMm
 0uhN7nWzsJIBcQ3RpJt7tBkMpHmT9ZsWpWeSFEHGYAblq2A==
X-Received: by 2002:a17:907:90c8:: with SMTP id
 gk8mr4901385ejb.630.1644166296169; 
 Sun, 06 Feb 2022 08:51:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztpeykM8mWuYU/AuQpbl+BXMDbStsCr1iU3wN9CBEBPBivhqpcB3izYNCJDGuPTy/NTaa2bw==
X-Received: by 2002:a17:907:90c8:: with SMTP id
 gk8mr4901371ejb.630.1644166295940; 
 Sun, 06 Feb 2022 08:51:35 -0800 (PST)
Received: from [192.168.0.86] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id s14sm3878804edx.37.2022.02.06.08.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 08:51:35 -0800 (PST)
Message-ID: <b3c98aa3-751b-acc4-8e57-5566af27f922@canonical.com>
Date: Sun, 6 Feb 2022 17:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 RESEND 21/24] drm/exynos/decon5433: add local path
 support
Content-Language: en-US
To: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>
References: <20190325071349.22600-1-a.hajda@samsung.com>
 <CGME20190325071401eucas1p10df709b256570f1aba9cbc4e875da1b3@eucas1p1.samsung.com>
 <20190325071349.22600-22-a.hajda@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20190325071349.22600-22-a.hajda@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/03/2019 08:13, Andrzej Hajda wrote:
> GSCALERs in Exynos5433 have local path to DECON and DECON_TV.
> They can be used as extra planes with support for non-RGB formats and scaling.
> To enable it on DECON update_plane and disable_plane callback should
> be modified. Moreover DSD mux should be set accordingly, and finally
> atomic_check callback should be used to limit the number of active planes.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 80 +++++++++++++++----
>  drivers/gpu/drm/exynos/regs-decon5433.h       |  6 ++
>  2 files changed, 72 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ex
Hi guys!

I am working on DRM bindings conversion to DT schema format and I found
this set only partially applied. I merged the DTS patches ("dsd" clock),
but I think the driver and bindings were not picked up.

Nevertheless I am going to include the "dsd" clock in the new bindings,
so the DTS passes DT schema checks. Let me know if other approach
(revert of DTS change) should be taken.

Best regards,
Krzysztof
