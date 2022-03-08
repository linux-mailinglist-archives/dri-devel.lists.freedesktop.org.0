Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD964D19AA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 14:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B041910E30E;
	Tue,  8 Mar 2022 13:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E3010E30E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 13:53:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DE837B81894
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 13:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E45C340F7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646747613;
 bh=kKuMXY/kWFSEwzOQtBmx7VatX+a2ZHwU2N6wSzEqcP8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Oa5hkzpmXwNAti5EpS06CldZNsUwpV8quKSv/Xq4a/0cBSgHioYKjsh2dqRvjpywB
 yxperyflVotiv7FEAewxEIEIMSEmKLl9oYdwZwNPCgUncPJVUHNl1FO0u4vLlg7pPo
 wJGIPRvZcNFHyef6P4tOq0cLs0mqSLp+93CoJKLAWdt5ajCqwTVgkQpzeQqNX7EHUe
 QIP9E8ncohi/UAVgTMXuDvr21shroLq+XfAguy7TURInnnntNPOAh3SOhnQ6aJ237e
 MYn4G1gWUTTtkR9AUS9l+rwaiVZVSi+BL1GiFRcNdQ55GtDFkEW6bx5Rjz7AgObkEv
 eKzEOqhWJsgdg==
Received: by mail-ej1-f44.google.com with SMTP id dr20so39318655ejc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 05:53:33 -0800 (PST)
X-Gm-Message-State: AOAM533P/ChndtHU/H9Yrh7AYNycflmmMLamWrWlcU/IPaxwyEqRI/kb
 LhrErCQuXWpzIv56dnfMLMsEFE2CelEGgrxUKw==
X-Google-Smtp-Source: ABdhPJzboOw2MvvOqexJGjBvi3QJGsITzv7M/nIKxqkOwm4WPxLh9N4kBnOgz8nMdZEHDlkXjaC9jzahExCVprRjbfM=
X-Received: by 2002:a17:906:9913:b0:6d6:dc48:5d49 with SMTP id
 zl19-20020a170906991300b006d6dc485d49mr13522321ejb.325.1646747611776; Tue, 08
 Mar 2022 05:53:31 -0800 (PST)
MIME-Version: 1.0
References: <20220308094911.2680291-1-robert.foss@linaro.org>
 <20220308094911.2680291-2-robert.foss@linaro.org>
In-Reply-To: <20220308094911.2680291-2-robert.foss@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 8 Mar 2022 07:53:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLL9j77ym0ZTsBwsW==9E8x2jf7A-R-VaSE_yYR5Y=QJg@mail.gmail.com>
Message-ID: <CAL_JsqLL9j77ym0ZTsBwsW==9E8x2jf7A-R-VaSE_yYR5Y=QJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: Revert DPI
 support
To: Robert Foss <robert.foss@linaro.org>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wenst@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Xin Ji <xji@analogixsemi.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 3:49 AM Robert Foss <robert.foss@linaro.org> wrote:
>
> Revert DPI support from binding.
>
> DPI support relies on the bus-type enum which does not yet support
> Mipi DPI, since no v4l2_fwnode_bus_type has been defined for this
> bus type.
>
> When DPI for anx7625 was initially added, it assumed that
> V4L2_FWNODE_BUS_TYPE_PARALLEL was the correct bus type for
> representing DPI, which it is not.
>
> In order to prevent adding this mis-usage to the ABI, let's revert
> the support.
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>
> Changes since v1:
> - Rob: Instead of reverting the entire commit introducing this,
>        do a partial revert of only the relevant parts.
>
>  .../display/bridge/analogix,anx7625.yaml      | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
