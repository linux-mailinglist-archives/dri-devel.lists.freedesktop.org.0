Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F716A199F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 11:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E7A10E866;
	Fri, 24 Feb 2023 10:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812D210E866
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 10:10:07 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id o32so3184659vsv.12
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=958ik2d8h0rqs5xPiVi4wdegUDuAm3bJLnk3HJrVN6g=;
 b=geYtILrMhZyPN1m76Js6L2I06THILfyxZELzigrOgZaamrjIq5P20GG4Ltklb2cWIg
 ig+jb6hjYB8q0YWsHTDssLJRDLTdvCzPHF/u+MclpxDKZyNcOM+02n3x1rXwNNfPb2uO
 X4G85Wv5amgQr2H37ch3HJgI3bv3/FHEnRRJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=958ik2d8h0rqs5xPiVi4wdegUDuAm3bJLnk3HJrVN6g=;
 b=edLoOfknxeDnW+kkJhQC5WQ5fXf/jgmhlr9+Ht4eFdoTQlIzfO5XkL0hdpV8RhJHHU
 IxTxy0s+8I8HQOFFWtPlrpzJCMPHLaA7R9UhI7QQfb9bR1ZkSwvPvghKiaTBdyOIdjDE
 NvrEYsVUyYvQVBHPNPyqT8296Ijbns2MhTsFZyJV5P0jaVaD/7IZFL9EuFcnzHJ0UB68
 Yk+fcafWU29ZAb+Ke/aZV6rzuhiL9ISK1uEbqoNSfgTW1pmvsqmQMGI63Ok9IO4pY8vQ
 b8/hsaWy3MEXY2FWp+rA7sEnqGpP3uahrbuDjouh900gRi6pTt62/gj6c/qmtKZsfUxb
 pHiQ==
X-Gm-Message-State: AO0yUKWZhdPFyTfrUUVlaMVSo+UYmc79FEigJSZVX/XI/KFi6uq1+tKO
 kL4IrAS7k9uVjMOvYjpK5Za6nmvLntmNvMVBOuj1PA==
X-Google-Smtp-Source: AK7set9+NfQuPrNJdufHu//12XKpnplgNgl5zZ8Ksiq0QrfjzgZUfHBB+nf4MHufeDSr6TAoH6tCu4h1r7GapdETZYw=
X-Received: by 2002:a67:ec11:0:b0:411:c62b:6bf0 with SMTP id
 d17-20020a67ec11000000b00411c62b6bf0mr2077517vso.3.1677233406576; Fri, 24 Feb
 2023 02:10:06 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-3-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FK8BjSgwS5276FJj4zG_3STMbQwQWdyn3LjOvQ=108RQ@mail.gmail.com>
In-Reply-To: <CAGXv+5FK8BjSgwS5276FJj4zG_3STMbQwQWdyn3LjOvQ=108RQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:09:55 +0800
Message-ID: <CAGXv+5Gv19nijoW5i8=Ouh4H24X3pknM3ZBSo9Tgv8XkLt+XbQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] dt-bindings: gpu: mali-bifrost: Split out
 MediaTek power-domains variation
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 6:08 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Thu, Feb 23, 2023 at 9:34 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > In preparation for adding new bindings for new MediaTek SoCs, split out
> > the power-domain-names and power-domainsvariation from the `else` in

                                            ^ missing space

Once fixed,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> > the current mediatek,mt8183-mali conditional.
> >
> > The sram-supply part is left in place to be disallowed for anything
> > that is not compatible with "mediatek,mt8183-mali" as this regulator
> > is MediaTek-specific and it is, and will ever be, used only for this
> > specific string due to the addition of the mediatek-regulator-coupler
> > driver.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
