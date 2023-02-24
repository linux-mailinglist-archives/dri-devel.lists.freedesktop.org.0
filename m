Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5656A1994
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 11:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD61A10E839;
	Fri, 24 Feb 2023 10:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536ED10E839
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 10:08:40 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id o6so21050015vsq.10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=erxkKaNmgReQjjCE5Nun08H4QtCCa/ZqQiqJBxoU1Ok=;
 b=X8+SA9pfi1u8C/Wv6YyefYb/yeJjqHbKIaAaHzXq4HKxYUUHaNYaVsO9Vq3GWF2tMG
 30+rCnyWewJtcmlDac+TEe742tubnvXwDpwXdgRGEgAw10FYMe6HKyIg+TGOK7rLHBJf
 6x0CvO35P9Ej3Q+x2erGFEjEPgDOiIYwiFkdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=erxkKaNmgReQjjCE5Nun08H4QtCCa/ZqQiqJBxoU1Ok=;
 b=0zb/zsF9TtfOmVhjM5fpwrVNvLDw6kDDyba+fCgtpPxgOVh+8YNnCD+AgWWzYQ8uc+
 YzuiZdN91eFYbNGGOjaJrV27KilcTRg0mlQO/62xRYvLVyEmmI66Am6YU882Z9fEvVIp
 qxBh+lb19qJLu3EVg8uSDJKCntRAJ9tCLYnSM0UKdHWTwo2FX+a4krQ+s5MJQ/akS8+S
 nBtwG5iszfpRAHV9QDP9Gila7KIXE3nxpv/WBABeN+2Vi8PgGR3muOBE61ANWm8z+eDf
 PstTVO35pY2c6/NJSG9CWfDZxfZamjYP/Z+ZZU1EuFx3YDUAmboQNcNcOXzXNl8URVAM
 wk7Q==
X-Gm-Message-State: AO0yUKW599RGPkfRWKGzCEHl6gurPNgsXmdri7IqXVTVqJRlICcYmwaT
 4YTwfCS2GcUlQTV1/NgSmC3tRXJh+8sAgxCub9lptVm4kSXPGnRu
X-Google-Smtp-Source: AK7set/1xvdm5pq0EgFdZuGlRUZGFwjjdxewTbrvfcb4P2N6x5bfqAjJm08NFJELbq4Kj0E1OC3BOpwdByH/f1V0aw4=
X-Received: by 2002:a1f:4343:0:b0:400:ea69:7082 with SMTP id
 q64-20020a1f4343000000b00400ea697082mr2084061vka.0.1677233319375; Fri, 24 Feb
 2023 02:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:08:28 +0800
Message-ID: <CAGXv+5Gk-G=TTSu8E7v8EHMfrp4j0mwFR32hi3_urPJ3sDxpDg@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: gpu: mali-bifrost: Allow up to 5
 power domains for MT8192
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
> MediaTek MT8192 (and similar) needs five power domains for the
> Mali GPU and no sram-supply: change the binding to allow so.
>
> Fixes: 5d82e74a97c2 ("dt-bindings: Add compatible for Mali Valhall (JM)")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
