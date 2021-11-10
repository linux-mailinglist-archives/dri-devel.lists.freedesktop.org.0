Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E61BB44BEA3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 11:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACD76EB16;
	Wed, 10 Nov 2021 10:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0786EB16
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 10:30:06 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id n23so1855878pgh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 02:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rtnO7Bm6moxapJOpDmqW3UadGBsmBZSmf1oZQVTs5BY=;
 b=P3Zjx0Hyq+32RzMf/e+0TH7R6bZPDc1VQVGRm6mJklPXjJ3E2y7zll3a/h5hwzInd2
 d63C9cHfkm618jGYGz2nEbxTURHcRncu7AQy7kda908zmtTJmYdpod2M+GxzBQkOgAaW
 3pyJW9FPadAoWPwK/fx0Dc1zYve3/+A99znjsQy0RNF26CBDA/mW1FQOyXjer+8hdQVg
 KHPaswheEtKBH09v60AmcUAH3/2TMbbowGDQYdmswgZ4HnwD6jwN7jpBmhO36SZb2VhP
 uAzn+IF5SvZbDi5vO8caloxssl1Sqt0FspfoohNqFJyd62Cg6vs5JINLSu6arcJ/cviJ
 L0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rtnO7Bm6moxapJOpDmqW3UadGBsmBZSmf1oZQVTs5BY=;
 b=sATxEipVv+QwdHWUpOmxn1eKcBMVbF1x1HfWKBsHdorzbRsKJBJ+sIeBqo4+xGteZz
 25zZkFrD4pr7LZJdnAgHtGnkFHfaUEZJRWeH9HTj+kl9sXjVxpTRzPVwIYUu16VcGcjF
 A4TXLZdthwPPLudEZ+7ualElcnjPZnuFkJYZR2/Ds7WNDuvhPQaltmt7lkXtRHbiosxj
 byFejLp/WP4YeMzlD9a6p6J80HMWvCNcbDw86/8s/o6325ly7ZhnhK4bbfxoJoW9e5ES
 0pXRAdF23+lNBrOH+4NAUoWPkgCP6nKRSkUFy9Zz81TTrOHl53PRTitW4pFij8SZdi9r
 y5Pg==
X-Gm-Message-State: AOAM531apnp69WZ4ImDBK1hgHjHQKWAsF18JX7+7w+zHvO3YxiGOu/nv
 DM1ohTRLLPtnwmnbXRwGHkbgBGM5pvj8Q27zUnzk4A==
X-Google-Smtp-Source: ABdhPJybXxLo5OYv4x3FX2EtYjPECd+qMB38G5dsYqeB2wevijTEozvPGP7GKTPKRoWDFUr1d6wpqdx/mT+1NE8lE1U=
X-Received: by 2002:a63:9518:: with SMTP id p24mr11113932pgd.80.1636540205425; 
 Wed, 10 Nov 2021 02:30:05 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com>
 <20211109125030.26299-4-yunfei.dong@mediatek.com>
In-Reply-To: <20211109125030.26299-4-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 10 Nov 2021 18:29:54 +0800
Message-ID: <CA+Px+wXw96jDAbtuJ-Mt5MnY9D4xPX-6wGZq5U_hwhrg+5UNPA@mail.gmail.com>
Subject: Re: [PATCH v9, 03/19] media: mtk-vcodec: Refactor vcodec pm interface
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

On Tue, Nov 09, 2021 at 08:50:14PM +0800, Yunfei Dong wrote:
> Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

s/B/b/, the suggested tag name is "Reviewed-by"[1].

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
