Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C80B35F684
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 16:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0CC6E4A7;
	Wed, 14 Apr 2021 14:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C08D6E4A7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 14:53:29 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id h20so10252749plr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 07:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3YMvYEtHewROZOpFAlE+YVnTRwtmI4sbne6ZZ7QNqKw=;
 b=gk1viNQDK7ATXpkM7+FeLIsLNRfFMGyp0/r07qHCpZQpPF0CpIQj0R5blR/OdQwqB2
 qpYJWOLGJa9ewSlnMr7wdEuxSxp1AfJ0Hjlpj1S1XFdpI/G2togUKr+loeuKgbgn4xFE
 8Rr+gnWPuVitTPdq41lvXakBF6WbVHCpY+lhCb3AElHcbMRVoE1KfmagE6u06IuQdFB3
 A9gK+4mFF66bDX416YCsn4iJ2j1XzECIGaECKtv7xaOkHwEkcCpxqocCfZK+BTgXmAnt
 G2CFuNYv2k/qwJeLyXFeuPlTxHZtUEX3jj0lqdCDjc6u/eNvjcxcGqubjgwI9DFU8uDn
 7SDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3YMvYEtHewROZOpFAlE+YVnTRwtmI4sbne6ZZ7QNqKw=;
 b=ln3XCYvQ2G8h8uFyol0MMR2SC1odj0DiH3x9xhYIEG0ls6TNRkOImo22MXDpmsI+zk
 p5KIOQU32qUnyVKxC0ONLg/khqdRThqlS5Q6GueVVCm2RtcxMkt3RR1ShQ16Vw3fIAmh
 1LUDmmpah62RBTH8SnrOBA7e5AH47gC8khUDJ9ZoJILH02iV+mMmZJgv2v7mCcrbLDDX
 7lrJeW4XNypi3+DenEloFU2gT/FFB/9Yof8N05/tm650U92aFaEhSbAHt39siC4tuSJG
 UytEvuLqGP8RcKPj/t21O9q+SKUUMLefWz1OG0syy0AFIaQnq02hxDjMAN4LFufHC5gb
 VRzg==
X-Gm-Message-State: AOAM532STjAc1VmCq62bde0Yo5qtPxGuQKH67GvrLxAbbOY7+Y4cRnoD
 en0i0sRpmtfFhfmqqAyaOLjcDZkGbowbxhE+XlU=
X-Google-Smtp-Source: ABdhPJxoTj72BoWiQQAL0hug/P6L4J7UqtuVV3Zj6//58oTaD2XEZzKaiijbRgpI7vJRshL+1CdfH5CNLg1PCWSM5ac=
X-Received: by 2002:a17:902:ed14:b029:eb:8e3:bfc9 with SMTP id
 b20-20020a170902ed14b02900eb08e3bfc9mr14876376pld.54.1618412008841; Wed, 14
 Apr 2021 07:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
 <CABb+yY1b9wD0hoBx=aYzpLcF-=EEG4QTrV68sZj8+rtf5J1aJQ@mail.gmail.com>
 <1d946d1c-1626-33ed-26ba-f840729d63e7@gmail.com>
In-Reply-To: <1d946d1c-1626-33ed-26ba-f840729d63e7@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 14 Apr 2021 09:53:18 -0500
Message-ID: <CABb+yY2ar8LcYMUrOTP8gH+DhNdV3aL7nuod4Uc_fuQq2A8K+A@mail.gmail.com>
Subject: Re: [PATCH v2, 0/5] Revert "mailbox: mediatek: remove implementation
 related to atomic_exec"
To: Matthias Brugger <matthias.bgg@gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 3:51 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 12/04/2021 17:29, Jassi Brar wrote:
> > On Mon, Apr 12, 2021 at 6:18 AM Yongqiang Niu
> > <yongqiang.niu@mediatek.com> wrote:
> >>
> >> This series base linux 5.12-rc2
> >> these patches will cause home ui flick when cursor moved,
> >> there is no fix solution yet, revert these patches first.
> >>
> >> change since v1:
> >> add mtk-gce.txt and dts modification
> >>
> >> Yongqiang Niu (5):
> >>   Revert "drm/mediatek: Make sure previous message done or be aborted
> >>     before send"
> >>   Revert "mailbox: mediatek: remove implementation related to
> >>     atomic_exec"
> >>   Revert "dt-bindings: mailbox: mtk-gce: fix incorrect mbox-cells value"
> >>   Revert "arm64: dts: mediatek: mt8183: fix gce incorrect mbox-cells
> >>     value"
> >>   arm64: dts: mediatek: mt8183: add gce information for mmsys
> >>
> >>  .../devicetree/bindings/mailbox/mtk-gce.txt        |  2 +-
> >>  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  5 +-
> >>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  1 -
> >>  drivers/mailbox/mtk-cmdq-mailbox.c                 | 80 +++++++++++++++++++---
> >>  4 files changed, 76 insertions(+), 12 deletions(-)
> >>
> > Please break the patchsets (this and the other 3) into mailbox only
> > and platform specific ones.
> > Also, it would help if there are some acked/reviewed by some mtk folks
> > especially when reverting patches.
> >
>
> I'd prefer to have DT and mailbox patches together as otherwise the burden on me
> to find out which patches in the driver are needed, and to check if these got
> accepted, gets higher.
>
I meant the patches that need to go via mailbox tree (controller) and the rest.

thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
