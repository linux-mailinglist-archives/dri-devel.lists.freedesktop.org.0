Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 344006B6777
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 16:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087A610E06D;
	Sun, 12 Mar 2023 15:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AF010E06D
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 15:17:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4FCA760F55
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 15:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BFAC4339B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 15:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678634254;
 bh=tru9IYsAeEZs7842zmcwYj45aS79A6X70s7CoPhRUS4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l3MqaJjWlPq6mnTP9FFQRgrKxLJSbnd3e/0j95wRnw1EcG2TDHvsvUWcbkYGcs6mZ
 EuwlYj72RxWqCLDx4evZyvDsVjdQYC9/2pBJmdBw28UiAsLnfxWbyhT/O1tstMz4/l
 5G410X0yOwk0P/BhZiRWW1sQNZBdRxzew2IkNJ1Hn1mFzs8JMRYuID9PyD09OQuq4D
 zkHiN0DeXliRyUh6X79P9NcDgNegsFWFmy5Xg7tCMsC5gnJmC8hZoGEBCfqnFg2NE4
 ndbLs98USqQz+2J6HODfORCi0fyE57/0T5GHNKN4Y5CmpB94oXl5DNrWjVNWCaWs5y
 VqnyenHA8XPzA==
Received: by mail-lf1-f51.google.com with SMTP id d36so12654330lfv.8
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 08:17:34 -0700 (PDT)
X-Gm-Message-State: AO0yUKXF3e6jYgHqEOhALQAjye+BnuPPM3yXBWfD9bUq+fyPsxDBzHFj
 oJWAgJtNI227W9DYdLTUbPT8Ozz3NQuszxbmMg==
X-Google-Smtp-Source: AK7set8/I9MPGwlCzSSF7k8LkXr9Fx2O+jLzHm+erabCx2bDfUoxf2kd9EGkdr3s+tml8ANOCBpwUGzBEAFf8iBYLHM=
X-Received: by 2002:ac2:509a:0:b0:4e8:44ee:e2d with SMTP id
 f26-20020ac2509a000000b004e844ee0e2dmr159592lfm.5.1678634252782; Sun, 12 Mar
 2023 08:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230309210416.1167020-1-greenjustin@chromium.org>
In-Reply-To: <20230309210416.1167020-1-greenjustin@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 12 Mar 2023 23:17:20 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Bobq8nfbBjabbXjxK_xw6uPZa2nBLv_ePJuKfCwpQwA@mail.gmail.com>
Message-ID: <CAAOTY_-Bobq8nfbBjabbXjxK_xw6uPZa2nBLv_ePJuKfCwpQwA@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] drm/mediatek: Add support for 10-bit overlays
To: Justin Green <greenjustin@chromium.org>
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
Cc: chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Justin:

Justin Green <greenjustin@chromium.org> =E6=96=BC 2023=E5=B9=B43=E6=9C=8810=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:05=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> This patch series adds support for 10-bit overlays to the Mediatek DRM dr=
iver.
> Specifically, we add support for AR30 and BA30 overlays on MT8195 devices=
 and
> lay the groundwork for supporting more 10-bit formats on more devices.

I've applied this series to mediatek-drm-next [1] with fix up for
checkpatch warning. Remember to fix checkpatch warning and error
before sending patches.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> 1. Refactor plane initialization logic to allow individual DDP components=
 to
> provide their supported pixel formats.
>
> 2. Add AR30 and BA30 support to overlay driver.
>
> 3. Enable AR30 and BA30 overlays on MT8195.
>
>
> Version history:
> v2:
>  * Rebase and resolve merge conflicts with the AFBC patch.
> v3:
>  * Moved 10-bit support detection to mtk_disk_ovl.c
> v4:
>  * Moved formats to mtk_disp_ovl.c and mtk_disp_rdma.c
> v5:
>  * Minor style adjustments per checkpatch.pl
> v6:
>  * Refactor patch into patch series.
>  * Add formats directly to private data.
> v7:
>  * Gate setting OVL_CLRFMT_EXT register on compatibility.
>  * Split patches for adding 10-bit support and enabling 10-bit support on
>    MT8195.
> v8:
>  * Updated descriptions for patches 2 and 3 in the series.
>
>
> Justin Green (3):
>   drm/mediatek: Refactor pixel format logic
>   drm/mediatek: Add support for AR30 and BA30 overlays
>   drm/mediatek: Enable AR30 and BA30 overlays on MT8195
>
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 +
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 94 +++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 38 +++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 20 +++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 24 ++----
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  3 +-
>  8 files changed, 173 insertions(+), 18 deletions(-)
>
> --
> 2.39.1.456.gfc5497dd1b-goog
>
