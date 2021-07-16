Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E0C3CB2D1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 08:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D916E913;
	Fri, 16 Jul 2021 06:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416F76E912
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 06:43:22 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id p186so9426304iod.13
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 23:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IiX28Q2sDYwMuIX/qzaioGu6+VV6GkUw/FQvwDmGtLg=;
 b=YWtD9DoKqHC9Huy4wB+6rfBztqBEV5WfZtLL4wnWQ0wbzaarziMh767CGS3uSPdUtS
 x5f1oBk5WYB67qYDTTH7Ge3qLw5mhhemCAZiPSWw6+XswrNZLtl3EdSJpS1kSD4CTOPk
 pkrhsF4KkSjRigKWWgM/r2wSYZ/3lva+Di1/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IiX28Q2sDYwMuIX/qzaioGu6+VV6GkUw/FQvwDmGtLg=;
 b=aIJTRUgSynlkoUqAPAV4dL81wBpRq32RTQnxAYluZv5NjCfMUBS5hn5kuwdundxXW6
 MUPvpBQD9r2pQgNxmNajdfRhiEXVCe4M+NOII2X9oN3/75fxjevUOpaEe9Yfk/QuYQS4
 vkaSwLGlcf4pxE5LVw5TjYbOmIauQl8busqJXCuwcsVxXotzRtMBYZU7jUDFjnVquzeN
 OuKMwvVitIDaoMrGUlGbhlc5C4ihIED9FpU1/5NwvdxQQois/PINg/EcUrf3jSGaw7GN
 amn68QOBf1tqi7PBps5INf0L331DoWb26EAmG/PDIKSG65hxN5C+sZnTgvb2Gk4jTK1+
 9JVg==
X-Gm-Message-State: AOAM531GAEANz+gxazFFHo1FOngR2iqryDP5LfQOblClL+luv8PVdefD
 k17pE9enOvsfA7LxKZ0qDaLrLcmwH+gpD1Jaro/ZyQ==
X-Google-Smtp-Source: ABdhPJz5OJ30eGOyvpHpAbWoYXfnr8j0aLyXqTm8PncdRizb0DIL4m7tk7hB8pX2ypGLzNA+i1p5hmQ3mUcggVeWZ/c=
X-Received: by 2002:a05:6602:2d10:: with SMTP id
 c16mr6219649iow.40.1626417801637; 
 Thu, 15 Jul 2021 23:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <1626417143-8015-1-git-send-email-yongqiang.niu@mediatek.com>
 <1626417143-8015-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1626417143-8015-2-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 16 Jul 2021 14:42:55 +0800
Message-ID: <CAJMQK-hDH9QGz_FL+gSBhq-+xrzbWn7wgSOqv4QRLY8RfiSHSg@mail.gmail.com>
Subject: Re: [PATCH v3, 1/3] drm/mediatek: Separate aal module
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Jassi Brar <jassisinghbrar@gmail.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 2:32 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> mt8183 aal has no gamma function
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>

Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

This version fixes the issue in v2.

<snip>
