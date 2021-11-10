Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A824544BEA0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 11:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DF36EAD5;
	Wed, 10 Nov 2021 10:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFB26EB08
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 10:29:57 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so1535720pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 02:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gSFvUJLaZR+mAVPFBcPx1oudAViqkL4IwyGNB8LdK80=;
 b=eZ9Whpt501+2K7l26U4wtjldeo6V0MKg+IPh8nJFxzg+klzAvlhvUlX5uL9FGT/dEK
 ojkFp0NnQHczMBoADFUXVAU/qQyUOXo+5+KLWMv8gABEsMPWVDyurFkliVDOH9YEvoc9
 4QebnxuMUulAfKSS2P7FsdGLV2EGOTowxGCKkcDVKp76t0Hu0boOwos3GlvDg48jOxzC
 cbtKSl55U8seclKFJsrrZiKepcOuv2XvwmCmExMnFSekL4Ejhh0VN6fddzdRVLdxzJJC
 zEScDfB9Uwz7QGYIXR5l60zIehXlOZNSan/aU1SZpgLVK3zo/GK1e31s8jAjTxx449DX
 1XTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gSFvUJLaZR+mAVPFBcPx1oudAViqkL4IwyGNB8LdK80=;
 b=Bg33/GGYaKi4sqyGxw77qH2QH5U38l1s/3gF2wTv4tdZcuanJQyROV1Hh1ejLB8d91
 ZBuN3B9pf0N9SZ8Cucu/lf68fEL48+qP3iasSzCtJGxTAuQ02iQIBnZA9Gv9kTd9K9mJ
 gNx4NLSmhVfiH/qWS/oL55wY7lP8PuwRdcDlGBX+l9xP2nwVJz8mxizn/Jb8c48VatcU
 +unFIDycOEIf7LNeHyJUT3FDW2LCgYElm/UaiN843xU1Z+7U/V+Jth0oyLhkXYtC/FeY
 TCNePMW9yBf6kYvi2tt46v0aJCtqeeYAvVBpz7VrH3KY/6NzOrtnvFofkP8lnvxR2rIH
 y9aA==
X-Gm-Message-State: AOAM530lfhm8cJAJHu4kefwPn7+576H5d3NQDpfzSYl792p3Yj9Dpj1E
 Flr/kUouBzcs3CesNiFP1IYd0fi/4KQBYvBQc+Z2qA==
X-Google-Smtp-Source: ABdhPJx+7Gq0bm/h5nRmAWFRad83G/chU5WO/BoJHnti7WjK4AP/ZWkCcRzV6CRZ8T8FumyHzs27HMxGy7nk1YEJlzM=
X-Received: by 2002:a17:902:7289:b0:142:805f:e2c with SMTP id
 d9-20020a170902728900b00142805f0e2cmr14239605pll.42.1636540196956; Wed, 10
 Nov 2021 02:29:56 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com>
 <20211109125030.26299-3-yunfei.dong@mediatek.com>
In-Reply-To: <20211109125030.26299-3-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 10 Nov 2021 18:29:45 +0800
Message-ID: <CA+Px+wWNg060xNcBSnu696OHPcp5Mqy=ovbAW_dtBTnoVXLMmg@mail.gmail.com>
Subject: Re: [PATCH v9, 02/19] media: mtk-vcodec: Align vcodec wake up
 interrupt interface
To: Yunfei Dong <Yunfei.Dong@mediatek.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 09, 2021 at 08:50:13PM +0800, Yunfei Dong wrote:
> Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

s/B/b/, the suggested tag name is "Reviewed-by"[1].

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
