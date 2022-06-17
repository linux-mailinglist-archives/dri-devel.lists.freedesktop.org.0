Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C6854F920
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 16:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7086010FF22;
	Fri, 17 Jun 2022 14:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9791911A872
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 14:25:38 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id o7so9131929eja.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=83FZWiL0crF525APjinz8Kw//Gs5G6caFf4d0M9B9Ak=;
 b=GHJIHuMigTU+g9hI8iabwpQIuDSL7XyuMpSYvmlYhgfC1CIFWEIm1BQ+hSd4bjDOG5
 Rskzt+EOb8aIo94mQFzPQAjullV8lRQ1JR2nEa9GsHHd/BrpeGa8jCWJ9d2l0VXwLBgm
 ZSXjCJoEKsrynHrhheJbBED0jjesuT6+bcpTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=83FZWiL0crF525APjinz8Kw//Gs5G6caFf4d0M9B9Ak=;
 b=d6v1Uug787Tqokh3kx3DHYrMHgfiR3OiyF1XwJx/YltjA/ORR4KdNVMlzy0uKgTpft
 MFLtCYLD0ESpFJF6isMDvIvhD0ggstdarT7ktpUfeyjGrdmuY6xlW8VHcV4oRyQKyegs
 R+/wUSOQU/8T3W7o9whI9e6r3aUjzl4ZF2afOkTaiWnghAaeg4J19vevj5Em/NecVW3/
 QoG0yY68XTYgND8OxB7rmoklEyQWE4qDQwL6DysaWn/7/IZn6mC4D+io6+GguMVLGDOg
 sHjfsa8e+JZKLbowYU0i/0+17BFJMZG66Ip/ITF1yzrVWwqgkWv9fCksnEVgh1Ow10FO
 kzuw==
X-Gm-Message-State: AJIora+mBPL6xQiL4MicTNRpVGFKwvqdkaRxjYEV0JepZ67Vi/gL/gU8
 y5aj710IavrA+HLIJcjsOoltAtwFso54iXQgbcWwzw==
X-Google-Smtp-Source: AGRyM1sHQWP15zLPj2yCwvO447y117lYiVJu4mAWBp6EFASZb6mVwG/jc+KGYlyL13Wi6k2yq/6HTYn7xjYL2VjVjco=
X-Received: by 2002:a17:906:ced1:b0:710:f654:87ef with SMTP id
 si17-20020a170906ced100b00710f65487efmr9824783ejb.194.1655475937079; Fri, 17
 Jun 2022 07:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220530113033.124072-1-hsinyi@chromium.org>
 <20220530113033.124072-2-hsinyi@chromium.org>
 <CAJMQK-jw+sgunEwgEQAw-V8DAbybZ7WVnZJ6vwOdzQ+-SX_bQg@mail.gmail.com>
 <c3286fc9-06ed-d1e1-a731-94cdefdf7fab@gmail.com>
In-Reply-To: <c3286fc9-06ed-d1e1-a731-94cdefdf7fab@gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 17 Jun 2022 22:25:11 +0800
Message-ID: <CAJMQK-gJ4AoNQtLeKoOO=GLLtjDRhCdVnYuPJSBD4ZnFWJ5qrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mt8183: Add panel rotation
To: Matthias Brugger <matthias.bgg@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Hans de Goede <hdegoede@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 17, 2022 at 10:10 PM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
> Hi Hsin-Yi Wang,
>
> On 06/06/2022 17:29, Hsin-Yi Wang wrote:
> > On Mon, May 30, 2022 at 7:30 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >>
> >> krane, kakadu, and kodama boards have a default panel rotation.
> >>
> >> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> >> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >> ---
> >
> > Hi Matthias,
> >
> > The series ("Add a panel API to return panel orientation") might land
> > in drm-misc. With this series applied, we can add this patch to give
> > the correct default orientation for mt8183 kukui devices.
> > I didn't send this patch again with the series, since they might land
> > in different trees.
> >
>
> I had a look on Linux next (next-20220617) and wasn't able to find the mtk_dsi.c
> changes. What is the status of this?
>
The mtk_dsi change got dropped. The latest is this series:
https://lore.kernel.org/lkml/20220609072722.3488207-1-hsinyi@chromium.org/,
still waiting to be picked or others' comments.

If the dts patch is picked without the drm series, there will be a
WARN, but won't affect boot or display up.


> Regards,
> Matthias
>
> > Thanks.
> >
> >>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> >> index 8d5bf73a9099..f0dd5a06629d 100644
> >> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> >> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> >> @@ -276,6 +276,7 @@ panel: panel@0 {
> >>                  avee-supply = <&ppvarp_lcd>;
> >>                  pp1800-supply = <&pp1800_lcd>;
> >>                  backlight = <&backlight_lcd0>;
> >> +               rotation = <270>;
> >>                  port {
> >>                          panel_in: endpoint {
> >>                                  remote-endpoint = <&dsi_out>;
> >> --
> >> 2.36.1.124.g0e6072fb45-goog
> >>
