Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5F33FDE70
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 17:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696C06E1EC;
	Wed,  1 Sep 2021 15:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9196E06D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 06:40:36 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id q21so3059360ljj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 23:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=epJdN4f3MfJWPEsQ1/2NvR+leSyxvmf6Ol/q7Sv91t8=;
 b=mRVlvuMlRKfisqKuC3luRtD+7lHZt9EoAXjdWbTWH6cNuQQC6mg1w29lzT09vielVb
 I2Obog5PZudIXYal36CZLEgxg9Fw4Ix5JiTMy8r1Hwukl5bZ6CPXUGdD7YGLZoaLdSu/
 8Iki5swJ0F1Lhp74MeQCyy+v58G/u1o7jLxgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=epJdN4f3MfJWPEsQ1/2NvR+leSyxvmf6Ol/q7Sv91t8=;
 b=TBhHVzxzxCUZK2AAC4zMrE5R4bQ/V8NCmYbrn58uggOqowb4noPJEfbaot3nDebX4i
 VdQF8IHTxaxhzR4pGZQ++7eohJyoCUzbfzjhxKe89N+smJbWxfYcTo4GgHUuRuMxGnt+
 0SB9CoLxWfh8FtbWAgR/XKkDQRIuGEusYYLAM++R4cckC2YHbmkrye9tQigd6wHdpwuB
 j5x6pZJj0Y1sHd33RUn5sC0zI+dOO2zAUPUISovOZrPUZdvJkt2CIAIHPG9UJhIZaHPB
 Hmx3i6SpVwGbuqxHglMWZq9BO3ylWV5UNsdk5wnlWthYun6v5P00ptw8VhQvEfy+9977
 KoWw==
X-Gm-Message-State: AOAM532TtNOWMIGdQ386nZ5woMYoX4zzOgoR9P2p4C4LwfpXPp8ge2wv
 aKfo6wnH6tC1R3MJnsUbTjWkZuEqmUhxCQml25xHbA==
X-Google-Smtp-Source: ABdhPJxj9wv3Q6Dl3qKpne3tkDBgA3ZLpglT9zE4jEZ+fPT/uXAvjzBpHCDwCs+0syRRHL3naD7W0r8tTExh0x6HsH0=
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr27468860ljl.23.1630478434422; 
 Tue, 31 Aug 2021 23:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <1627890365-22992-1-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1627890365-22992-1-git-send-email-yongqiang.niu@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Sep 2021 14:40:23 +0800
Message-ID: <CAGXv+5GNbx6jJ2MuCtmMF=ABuoqtS84OvhYoGr_nOrwqCs392A@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] support gce on mt8192 platform
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 01 Sep 2021 15:18:00 +0000
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

On Mon, Aug 2, 2021 at 3:47 PM Yongqiang Niu <yongqiang.niu@mediatek.com> wrote:
>
> Change since v5:
> -rebase on linux 5.14-rc1
>
> Yongqiang Niu (3):
>   dt-binding: gce: add gce header file for mt8192
>   arm64: dts: mt8192: add gce node
>   mailbox: cmdq: add mt8192 support

Looks like all the driver parts are in -next, but the dts patch is not.
Can you resend that patch after the merge window?

Thanks
ChenYu
