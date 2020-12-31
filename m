Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B5D2E7D96
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 02:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355D58989C;
	Thu, 31 Dec 2020 01:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25298989C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Dec 2020 01:21:56 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id u67so4009018vkb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Dec 2020 17:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mlkXVdHyhNYiM3/2KIoSx+pXpWswuzzhreZMYSFz1hg=;
 b=aSw3CQT470ayL+TnbFzQRX0vGsaH4OBvdT0aCNT/hv0Q0LYzrJAEp/0i0h4rq6QHCm
 dzxlpQgg5DpEIAjBM0GXaSkeYlsN/M4mJ+QpEfXKp78FlGQi9yUqYQUvfCmTCPWh3Ii1
 tkGilqkmBxvJr7CHDSTuYCXfdQq01lh+4XvVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mlkXVdHyhNYiM3/2KIoSx+pXpWswuzzhreZMYSFz1hg=;
 b=FgNiPWw0aDgxWq8aWcoLI9L/FOWKMkQE7NZvry6RJn7VFJI4aVukPtcO9q0eW3s5BG
 Qs8u9m03pnrkX539TVTArgW4wTyZ2evEZwX4VD+Zt+GFBhcLCUxzpf6DYzx4GzYFx+eO
 RZffQ8xAGENYvs18gTpnoPWpxpe4d4HNIFvwi6NX04WL+yLpl7sVkhrvupw7Sy5Y25DH
 KXHQ+WhqrrD2iUf5Xcg5q+biTr2xdc+KGb62J0joR3qLMkvtXEAjEk7mjk3ndSOoHFKs
 YS9DHE7AmHcvHw6Cr7WxhwWYYyXcXwQr37DVEL5qPhFD8pccGReGIf3MujxqB2BPoctG
 ZoiQ==
X-Gm-Message-State: AOAM530P6jqhSMQVuDT+AZMPO7EaEy1EyLlddxQ9Gnvl+asqG/zKbZYZ
 uQLrg3L7MRs42Qr4rNGcnqqcV7JNZF1Dtlo8LCVXGg==
X-Google-Smtp-Source: ABdhPJzsqmjkBTHv/QEJaRsP982zznC3i91xEDQ66j6o4sJOhmDOVgkibqYEzzhJFkf9EQK3O0f9MLJhli4TwA0xbb8=
X-Received: by 2002:a1f:9e83:: with SMTP id h125mr18571561vke.18.1609377715869; 
 Wed, 30 Dec 2020 17:21:55 -0800 (PST)
MIME-Version: 1.0
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609144630-14721-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609144630-14721-2-git-send-email-yongqiang.niu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 31 Dec 2020 09:21:45 +0800
Message-ID: <CANMq1KCRBz-rY6y3nHp8yh_QSohkmaYS=DqNDSPzvwmq-a09DQ@mail.gmail.com>
Subject: Re: [PATCH v3, 1/8] soc: mediatek: mmsys: create mmsys folder
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 28, 2020 at 4:38 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> the mmsys will more and more complicated after support
> more and more SoCs, add an independent folder will be
> more clear
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/Makefile          |   2 +-
>  drivers/soc/mediatek/mmsys/Makefile    |   2 +
>  drivers/soc/mediatek/mmsys/mtk-mmsys.c | 380 +++++++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       | 380 ---------------------------------

I wonder why this doesn't get detected as a rename?

>  4 files changed, 383 insertions(+), 381 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mmsys/Makefile
>  create mode 100644 drivers/soc/mediatek/mmsys/mtk-mmsys.c
>  delete mode 100644 drivers/soc/mediatek/mtk-mmsys.c
>
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index 01f9f87..b5987ca 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -3,4 +3,4 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
>  obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
>  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
>  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> -obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> +obj-$(CONFIG_MTK_MMSYS) += mmsys/
> diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
> new file mode 100644
> index 0000000..5d976d7
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmsys/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> \ No newline at end of file

Nit: newline at end of file please.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
