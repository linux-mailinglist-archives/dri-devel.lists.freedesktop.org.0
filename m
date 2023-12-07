Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC368808CDB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 17:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5DB10E8DD;
	Thu,  7 Dec 2023 16:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E459E10E8DD
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 16:04:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 662A161EA1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 16:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1611AC433CC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 16:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701965045;
 bh=2FpbQI5Mt0gSqQq/XXJLLf+1SovVdA+maQYMnRTJ0m4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=K1poRaLOvXp7vPNZy1zTsvpIEeSRBjZnrNr1knbGToNVPOkTEZeVMv3dLcA9/wUAt
 f/GaW2gY4cuyGpYx/hvja35r+6rddX/MDh2l8j5PS8IiniikINpA6Uw4qcpFwC0NO+
 Qd+MguwDTW8PLznyqXlZKjUO3wTXFaZjWXqHThLNOC+1h2kg7KyKA76KWfgHpa1vZa
 AAHyWxy1mLsVob6lMPjInBaIarOditi64w63T0yENhrTRmxjW0qZgvj/YHcGBexZ0n
 IabUplIYdGOZPkUY7RM0j4klzy91ov/RSobm2wRqcvq5cDqzfETvf+XlknuhT60rp6
 I74mVI0oK+IWw==
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2c9efa1ab7fso11763311fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 08:04:04 -0800 (PST)
X-Gm-Message-State: AOJu0YxX16TuxyifXxOka5I2PdEx6LGZl1QYjxZwXHWiTbZbuvqFTfxw
 6Eokj2LVbQ4eDBtxkHhroc2YQFGyhIiO0aP3fg==
X-Google-Smtp-Source: AGHT+IF1cG0pFemXauUHVxHSNj9qWubes+vp4DakrHk/R1risj9jDhlo+9GulMhEdM2kdfcyW16MHWWxKi/zTK9166I=
X-Received: by 2002:a05:651c:1030:b0:2ca:bcb:e798 with SMTP id
 w16-20020a05651c103000b002ca0bcbe798mr849220ljm.157.1701965043173; Thu, 07
 Dec 2023 08:04:03 -0800 (PST)
MIME-Version: 1.0
References: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
 <20230412064635.41315-3-yang.lee@linux.alibaba.com>
 <de13cb5f-abf2-86b3-d2e0-2b1131cd8dfa@baylibre.com>
In-Reply-To: <de13cb5f-abf2-86b3-d2e0-2b1131cd8dfa@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 8 Dec 2023 00:03:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-cO3P2GnMPK68GSRJKe8jguCK-cWENiu-3mXaRaHwmMA@mail.gmail.com>
Message-ID: <CAAOTY_-cO3P2GnMPK68GSRJKe8jguCK-cWENiu-3mXaRaHwmMA@mail.gmail.com>
Subject: Re: [PATCH -next 3/3] drm/mediatek: Use
 devm_platform_ioremap_resource()
To: Alexandre Mergnat <amergnat@baylibre.com>
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
 dri-devel@lists.freedesktop.org, Yang Li <yang.lee@linux.alibaba.com>,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yang:

Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2023=E5=B9=B44=E6=9C=88=
12=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:49=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On 12/04/2023 08:46, Yang Li wrote:
> > Remove variable 'res' and convert platform_get_resource(),
> > devm_ioremap_resource() to a single call to
> > devm_platform_ioremap_resource(), as this is exactly what this function
> > does.
> >
> > Signed-off-by: Yang Li<yang.lee@linux.alibaba.com>
>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

> --
> Regards,
> Alexandre
>
