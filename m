Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FBC53E57A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 17:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03E2112713;
	Mon,  6 Jun 2022 15:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014EC112713
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 15:30:26 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id n10so29693398ejk.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 08:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MEyaqWM6nauSyOE/o6cR6HwD4AGRKj1DKlampNeNe54=;
 b=ebBCl9ALvXs/hDq13HqiEeAtprViCGphd4r907eKS91OqO6wlFsCghYVoFTcBaiLxR
 +BraHJEoPdruKUUlpI1zrcpfQ+slS0OKAYhZShj4ETcGG/dGncD/kvQaDZcLqKtIRpT3
 tEro5Seb389aioq7xC4RNTHYmASlM/jXz40R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MEyaqWM6nauSyOE/o6cR6HwD4AGRKj1DKlampNeNe54=;
 b=gT95xV3dgs4aNyy48dTIh1LLHiHEQQ6XPcZGISYzK/Iq3KqE/mbpvY16vj0pbfDBic
 A1uMa3fJCwsVmFqRdfKElMmetiax8viifSoHRkglJ8IsU1j1z2ulD9CJkHuarlEqKJTa
 7II7KmW/Naf2ZIzSVpsBdn0oD+vraAkbrJuVuyXZjWT16pCve75uFCw5Ju/YEr8l9ers
 iocJj3kIy+Lj9f0Nm4nU9tX8nxBtsrg6MPpZHL4udxcusXOp6yJWsvjJEMSWwjAWktCu
 nPDhYgcsggVqESQYhaA+7omukW3HnqawhnXyDW6ggS1U/Dj4x+wrERLQINoxhNCZ5tuc
 /H9w==
X-Gm-Message-State: AOAM53322VER9cEkzoe13DP+mRqXeEZU3JPx9trBrwGw68/q//fMVMWL
 BOJKc9TyIKxTRJnMwDtuSlmvvge3E64cy8beIjgqYg==
X-Google-Smtp-Source: ABdhPJw3lFG2FHh8YBss/swu6q2uufYMGgGFis+oLM6PD4uIZua7oPEouaSwOJQ0zYOIYT0kfRfPo744IaHyEHggWNk=
X-Received: by 2002:a17:906:eb54:b0:708:99d6:83e with SMTP id
 mc20-20020a170906eb5400b0070899d6083emr21650908ejb.745.1654529425433; Mon, 06
 Jun 2022 08:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220530113033.124072-1-hsinyi@chromium.org>
 <20220530113033.124072-2-hsinyi@chromium.org>
In-Reply-To: <20220530113033.124072-2-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 6 Jun 2022 23:29:59 +0800
Message-ID: <CAJMQK-jw+sgunEwgEQAw-V8DAbybZ7WVnZJ6vwOdzQ+-SX_bQg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mt8183: Add panel rotation
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 30, 2022 at 7:30 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> krane, kakadu, and kodama boards have a default panel rotation.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---

Hi Matthias,

The series ("Add a panel API to return panel orientation") might land
in drm-misc. With this series applied, we can add this patch to give
the correct default orientation for mt8183 kukui devices.
I didn't send this patch again with the series, since they might land
in different trees.

Thanks.

>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 8d5bf73a9099..f0dd5a06629d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -276,6 +276,7 @@ panel: panel@0 {
>                 avee-supply = <&ppvarp_lcd>;
>                 pp1800-supply = <&pp1800_lcd>;
>                 backlight = <&backlight_lcd0>;
> +               rotation = <270>;
>                 port {
>                         panel_in: endpoint {
>                                 remote-endpoint = <&dsi_out>;
> --
> 2.36.1.124.g0e6072fb45-goog
>
