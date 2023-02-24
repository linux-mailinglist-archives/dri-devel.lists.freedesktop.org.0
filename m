Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714BA6A196A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 11:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBED10E763;
	Fri, 24 Feb 2023 10:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF6010E763
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 10:04:02 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id a3so7687659vsi.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0u8VmJumLQNtV9/ARtd+o+9mpGq0aOZ8ZCgtdjL5v+w=;
 b=EgsPh7aSD/co6nKbOhDHsb3KMpAIMysgVMJfaHHYHNPA073DiSs2ERsYTUzdL3kVko
 eMmyJKRblWg9LZ+22ANmwLaKQWEaYMv1WoM8T9j/5/70vpsyoiD+5RfSO0QIGFAO/1wB
 JeO5cdxPNefTYF9xqcMpZPLRc8jy9sDK34+l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0u8VmJumLQNtV9/ARtd+o+9mpGq0aOZ8ZCgtdjL5v+w=;
 b=YevQ/QhmbZK/paJ5AfM+7gZ1BmDtSWmuldl2NkqjZNe7oHi9APWPXQjQz86kmqNSHc
 2u3QqTb3XS0ximNs0vNZ/nkd40CNBu2Ch3d0xnZohE+Ij/YLl1XdYW4OQ3P+25O/nsAb
 5DaDZGGyREZR37HbgEmpBhe++gMzcmnPj+tlYzbomlRvXoX7vdnh8FZ2BOSvA4IOKF6q
 xxiTPkXtTfY5gj2dOTidS3Wp0I3bFiF9DV+PWzS4GyH/FeBRIbMGYnuBmnLU5CTaqhxk
 K2lL5EjfBofKfDpmSN9HwFq8LfBpig2Mridom09yuf0S/GGvJujES/hOnen/EAEWAn2D
 ASWA==
X-Gm-Message-State: AO0yUKV1jbd1mFA5xhbrBNfl/g3DLm/KazC0xYfLphL/AjRqkdTWFIy2
 89QHbz9IcwWYCsptsrAqaNKqc7lSRgNnQYlFpkPqrg==
X-Google-Smtp-Source: AK7set/EfMTEye/Wi0OVyrpkCCmfX4ds+u4ezKh/3ZXapSRgu/h6EFpnsSXhr2sXtUcVxibs89nG9mgSVoo2QY9u5Bo=
X-Received: by 2002:a67:d21c:0:b0:402:999f:51dd with SMTP id
 y28-20020a67d21c000000b00402999f51ddmr2209797vsi.3.1677233041527; Fri, 24 Feb
 2023 02:04:01 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-11-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-11-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:03:50 +0800
Message-ID: <CAGXv+5Ekx0NNf349qYsJXXXpNSFnT6Qq1zved9peBpn1ybVfKA@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] drm/panfrost: Add new compatible for Mali on the
 MT8183 SoC
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
> The "mediatek,mt8183-mali" compatible uses platform data that calls for
> getting (and managing) two regulators ("mali" and "sram") but devfreq
> does not support this usecase, resulting in DVFS not working.
>
> Since a lot of MediaTek SoCs need to set the voltages for the GPU SRAM
> regulator in a specific relation to the GPU VCORE regulator, a MediaTek
> SoC specific driver was introduced to automatically satisfy, through
> coupling, these constraints: this means that there is at all no need to
> manage both regulators in panfrost but to otherwise just manage the main
> "mali" (-> gpu vcore) regulator instead.
>
> Keeping in mind that we cannot break the ABI, the most sensible route
> (avoiding hacks and uselessly overcomplicated code) to get a MT8183
> node with one power supply was to add a new "mediatek,mt8183b-mali"
> compatible, which effectively deprecates the former.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
