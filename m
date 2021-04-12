Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB0A35D794
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 07:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DDA6E174;
	Tue, 13 Apr 2021 05:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CDA89DDF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:29:36 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id m18so4344500plc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AC9X+1/OhI3zv50JSM+L1kZ63zcScSi3KwtHVFoeDOw=;
 b=Tz5vMcW2J8n8llIRRxrQEz1Uz4jGuraPfFMjgZhJWfIuHZeZjdN5wwsXeIKHeei3HN
 jl7dgwnU90QfctY/oLsUfelxm7ZQVd4lmn5Ky3n+eAa9YrsaFOeo7mASNKc7KaNoBK0O
 CEL3i+WunqLR+KfhQhlmZv6sBfn94Kj+xj4+96sSKInzAHw1SyLRwu4bpukdQ9V9NKmJ
 XRgy27ylt+yK5lDRJCTP1Tfs1wrLFGZtuQ/pdYmDZXqAgZ4EsJfPQ6r32cCEeUu6os7t
 KWAwMWr4A0DNPqjsacjKXQgQ/vbqSw3HQtrWloZH5hO6sKd7i4QMUuKeFb6p/wrQuYIL
 +2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AC9X+1/OhI3zv50JSM+L1kZ63zcScSi3KwtHVFoeDOw=;
 b=XggXqfEs7B2iFrDFx9AHDCQrCyjdtuq8sw7s/L9HiGRPqm5VoxzBWxrnc9uc3hhi2c
 rXTMRUaAK2rPT07q4i6M282cc7uiBRjyfnUiejoCO6n7yeTdUIGIJhaAIPppa33N/H9B
 Xhi1suUS/UpazBw7M6i61Xw/M5EKksPlANQnHRuPeEypCoDWvu5uSgFRIrxELzZapyZn
 b+pfaCv5+gt8yEpuUSu0u6Q5EanOitlBc5wipL93KL6iLnu29Ol+c7sGWwwWktE2+h2M
 fmXu5GDyypJCF/cTQXnyYqyVSD+XezvFm/wr4JmaCiRLbEApHjLbIIpMWFNY2ZGyG0w7
 RURQ==
X-Gm-Message-State: AOAM533Fhr83vN7W5f4FALESUy0AmPgfRbcXx0Qln4A+9eXo9VZZQ+ry
 v1k33lUFcv7Ek5TCQGHG5cKetdasWN3a+wXm3gg=
X-Google-Smtp-Source: ABdhPJyhWxFPHubJiQzEWlBZGAcD5U+iSEhomsoE4VkHQdHlcHgEjMjOuHIPkqW6eOaFi+abQ8fizEazhnbBJm7PSIg=
X-Received: by 2002:a17:902:bf92:b029:e6:bc0:25ac with SMTP id
 v18-20020a170902bf92b02900e60bc025acmr27750319pls.49.1618241376112; Mon, 12
 Apr 2021 08:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 12 Apr 2021 10:29:25 -0500
Message-ID: <CABb+yY1b9wD0hoBx=aYzpLcF-=EEG4QTrV68sZj8+rtf5J1aJQ@mail.gmail.com>
Subject: Re: [PATCH v2, 0/5] Revert "mailbox: mediatek: remove implementation
 related to atomic_exec"
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-Mailman-Approved-At: Tue, 13 Apr 2021 05:59:00 +0000
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
 dri-devel@lists.freedesktop.org,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 6:18 AM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> This series base linux 5.12-rc2
> these patches will cause home ui flick when cursor moved,
> there is no fix solution yet, revert these patches first.
>
> change since v1:
> add mtk-gce.txt and dts modification
>
> Yongqiang Niu (5):
>   Revert "drm/mediatek: Make sure previous message done or be aborted
>     before send"
>   Revert "mailbox: mediatek: remove implementation related to
>     atomic_exec"
>   Revert "dt-bindings: mailbox: mtk-gce: fix incorrect mbox-cells value"
>   Revert "arm64: dts: mediatek: mt8183: fix gce incorrect mbox-cells
>     value"
>   arm64: dts: mediatek: mt8183: add gce information for mmsys
>
>  .../devicetree/bindings/mailbox/mtk-gce.txt        |  2 +-
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  5 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  1 -
>  drivers/mailbox/mtk-cmdq-mailbox.c                 | 80 +++++++++++++++++++---
>  4 files changed, 76 insertions(+), 12 deletions(-)
>
Please break the patchsets (this and the other 3) into mailbox only
and platform specific ones.
Also, it would help if there are some acked/reviewed by some mtk folks
especially when reverting patches.

thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
