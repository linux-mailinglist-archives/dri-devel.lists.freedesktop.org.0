Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 490566A198A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 11:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9207310E7BB;
	Fri, 24 Feb 2023 10:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E05F10E7BB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 10:07:09 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id o2so7256272vss.8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fWSr1WF+X5T1bZtRLI9WjKETwvN5uS3RGWAESXIiZkc=;
 b=UUU7+bf1J/3YQBp6q6nn/9f8+qO3i7FcyCZ5pfWBkKha/NZXBKkX73onQyAu04YtLv
 sNveM4/KjxWln/WNJVDs3rarZm6abxHAKAXtxRLpDdvd6rLuwaIvm8XDp16rkL0/juCO
 hSwu8oY8/mAEtzYe5GoLALOvh3yqoCNBgp0eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fWSr1WF+X5T1bZtRLI9WjKETwvN5uS3RGWAESXIiZkc=;
 b=by/d9MjkDa5sY7xT74Rkj1qjzbVKYmQG5LMpQft2skmKmUXk4lx6CJb5Z9Uc6QqpgE
 K7MO1DHEFSI+ejCnyntD941OCg+dLpKACA2o1Ueeuh8lZqA1pcDYJS/JpxSgvslbBIIW
 8Z2uhhaDJvocmfIMmEL22TAsjmHN7I4k1uzeOSSGctoeGHlLHm+qkkUrqIQFAdLzin3u
 NhKhWgECeqBVPE/w7I1tDl0ZAuGu+WtkdWsuqa+Zj9rQPCp37icLFGnKjE2J4dQHZdWW
 GNRXXHHJqkKzOxbHitepD7kI48V3euxftwLRI3IAMFOnSLnmLarAuqqx62O5ox6nfbGx
 Wobw==
X-Gm-Message-State: AO0yUKUvwHpv8yjUSyQQhkLPIqgP0RZMQTaTduxsJM5Jw0yF7pS4YzWC
 uLdGlwHLwGyfIAIHETGJLdNYL5dmCZO1RyuUZ9xo9w==
X-Google-Smtp-Source: AK7set9aFwqpGWSWGfjbGo94cuHgKCgr2GvFvM/OzPybEBs7N6ZOfs/1hkngTYdnrZMb9EHV3N7v5C4YswmKg6wznE8=
X-Received: by 2002:a67:d21c:0:b0:402:999f:51dd with SMTP id
 y28-20020a67d21c000000b00402999f51ddmr2215538vsi.3.1677233228403; Fri, 24 Feb
 2023 02:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-7-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:06:57 +0800
Message-ID: <CAGXv+5H6xUZEg-rtL4Q4BvJXtOD598MHyotG4CGz3_yEy9oX-A@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] dt-bindings: gpu: mali-bifrost: Add support for
 MediaTek MT8186
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
> MT8186 has a Mali-G52 MC2 2EE GPU (two cores): add a binding with
> two power domains (one per core) for it.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
