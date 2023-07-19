Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E04DE7592E4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 12:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EF010E45C;
	Wed, 19 Jul 2023 10:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA07F10E45C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 10:26:30 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-345ff33d286so35213395ab.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 03:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689762389; x=1692354389;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MDKpzyl715FXpvBs//brcAoLgtj+1UL6KkC6I4T68sU=;
 b=jNCRPPktz3IdQ1OLcli8U25+1pBR7ixDXGDQpMuaeJ5DdbY5nVkHqIxbxChaZ+3cEm
 dZrBwU2FCtLPUI/LNFq8tA95EEhLZ8azisIL1r+vNkT2+GsP9aQARZG+p7e4iBOoGj02
 cUnUSXb1VtstfPBKVpUKr9Qk7QjoZq2jj3+NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689762389; x=1692354389;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MDKpzyl715FXpvBs//brcAoLgtj+1UL6KkC6I4T68sU=;
 b=GlX7nCzCVg+ZvXkmiGYTHbgNPmHtOKuHRdcNx+IIRKXTZJEJ46Wa0MinvsvYgmYmDV
 SDDS7ncakIw6N+pZLCfguV5ZmGmvMpa5dtaFSkZpDSWdIPMIyll6kBya6qGupmHrQbqI
 Q2gd1UgQBre6ILdq/48eAqDRrNl2ttlLijnjM22RH4zF/3KdDNtqZ0f6R7GM41LVgcnx
 x+BarSYy3P7mTfptZYWZHaMrmVMpRK9QTWVbWTZUw4RxHrzJFAVhmVoClA9GRFv+hnqM
 XLGY6J5bNu5PJ87boVM8vs20oLUwEiaKoblJDpJKcO3pvsqNDRGZkv4Np3LUZt9f0Bdl
 /zZg==
X-Gm-Message-State: ABy/qLbpsT9Z2iVZTZ6/PcoaIp5vTXI934UikdwP1SkMrga2yWrQNrZf
 1pMAbcRJbbpgEoLbN7O+cw4tQ6k7vzxyN0D+fns=
X-Google-Smtp-Source: APBJJlE6r/phDDSn06Xyydti6gFP4AfUklw2AwPcwxbarRvw9KkXBAfT9GGJJ1tW0/dzXhSOhx/yjg==
X-Received: by 2002:a92:cf43:0:b0:348:8050:5268 with SMTP id
 c3-20020a92cf43000000b0034880505268mr4520307ilr.12.1689762389271; 
 Wed, 19 Jul 2023 03:26:29 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42]) by smtp.gmail.com with ESMTPSA id
 y2-20020a92c742000000b00345da2c4776sm1318796ilp.81.2023.07.19.03.26.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jul 2023 03:26:28 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-785ccf19489so330833439f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 03:26:28 -0700 (PDT)
X-Received: by 2002:a6b:f10c:0:b0:780:c787:637d with SMTP id
 e12-20020a6bf10c000000b00780c787637dmr5094711iog.17.1689762388259; Wed, 19
 Jul 2023 03:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
 <20230719075056.72178-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230719075056.72178-6-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 19 Jul 2023 18:25:52 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhHKCZoh2Q4Fou-WmEB=Kn+kNzj344UaJEXhoG56k3-hw@mail.gmail.com>
Message-ID: <CAC=S1nhHKCZoh2Q4Fou-WmEB=Kn+kNzj344UaJEXhoG56k3-hw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] drm/mediatek: mtk_dpi: Use
 devm_platform_ioremap_resource()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 3:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Instead of the open-coded platform_get_resource, devm_ioremap_resource
> switch to devm_platform_ioremap_resource(), also dropping the useless
> struct resource pointer, which becomes unused.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
