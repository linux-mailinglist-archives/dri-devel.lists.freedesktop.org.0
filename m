Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A681B716DA8
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 21:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8467D10E417;
	Tue, 30 May 2023 19:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E8110E417
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 19:36:22 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f4b80bf93aso5523067e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 12:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20221208; t=1685475380; x=1688067380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QEE5HR8KnTXDzE7qIjWjCheMHM5HqAaaQn2y8Q+rxV8=;
 b=IVNYUCmhiNFu0EgZ0lRI69pOYybAw0Roa8Zps1B2zd6CwZ7FdSroL2EOxDfml0hl2k
 qo04Uq1vSu9zxk3gbbRpCUq+kbB4EYsM4sMt9kIpzRVLpuenwvbcptbkDrlFjz12s+jq
 Scm6s+4dseL2zUnMkuF3CYBxGsMySIe2Fb7A5mFYMwNE68P9YxV/Fl9CbWB02Ef8mvKK
 ZitD/QzB1WKggCor0rhynySgN8NAXQQ+YISaEfdcnHBcfTYnBfKh+elXdbA0muZjv4WC
 WhNKhfsMy0lBtIqF9wiFwHe13B4CIBjJ2815jAkuozg8QmHhGJJdZtGzvf2u7K6N7b3l
 /Etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685475380; x=1688067380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QEE5HR8KnTXDzE7qIjWjCheMHM5HqAaaQn2y8Q+rxV8=;
 b=hAeYO//jQ/ir7phv1tsv6jjMtkaB5W8b4ttwcQdh6pyQb83rsJg66uY1omGl0af96n
 mGimWdIuFPM3pEorOg0ChbXdRPYZwRPJVDE/c99yzzEHGEjJcr5AaXo5vBMBYVnQNaEc
 rT05wio1LVOGRsFPItIAnL0FhcHJNd/2AVawX/9IzJQPKkhwQTGBLB6cJholiDSvPGwm
 EgBkLcqtvhtrzuWTtvLRyWJYEx9hTeQeqg4rKDr07iNd28ZZVMbWUolNVxRJJ40rgaXb
 HOJ1UVtztvWCASTUTz48c6xsxWWvhcugjQ5I27OmM63F0WDd7J+Zrinjj3S5liBLT1yn
 /UtA==
X-Gm-Message-State: AC+VfDy5Y638egW03zFUoU4SucqK9IdzJfeIMIbbwnEz3N69//W4ZtiI
 6t0WtDmKHe05hyzls/Sp9uwbYwxOlihhYkuzH2g=
X-Google-Smtp-Source: ACHHUZ5gc/hxHeYex2Y8Okc8JH1HtS8SizLAVO7CtDJbdkVMJw6syU7DTQmP8/PMv1wx+1QnYFOncA22xyJ5j/x0vzw=
X-Received: by 2002:ac2:4c13:0:b0:4f3:8258:5894 with SMTP id
 t19-20020ac24c13000000b004f382585894mr1358968lfq.27.1685475380186; Tue, 30
 May 2023 12:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-5-56eb7a4d5b8e@linaro.org>
 <1jv8ga445j.fsf@starbuckisacylon.baylibre.com>
 <c24502f9-f717-6ff9-211c-1d129ef02f24@linaro.org>
In-Reply-To: <c24502f9-f717-6ff9-211c-1d129ef02f24@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 30 May 2023 21:36:09 +0200
Message-ID: <CAFBinCD4nZPp4JKpGARBkWL5pKVHJ0GSLTvy3S_q9mF=1d37Kg@mail.gmail.com>
Subject: Re: [PATCH v5 05/17] clk: meson: g12a: make VCLK2 and ENCL clock path
 configurable by CCF
To: neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Nicolas Belin <nbelin@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, "Lukas F. Hartmann" <lukas@mntre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Tue, May 30, 2023 at 5:57=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
[...]
> >> The mipi_dsi_pxclk_div is set as RO in order to use the same GP0
> >> for mipi_dsi_pxclk and vclk2_input.
> >
> > I don't think notifiers is the appropriate approach here.
> > Whenever there is clock change the motifiers would trigger an off/on of
> > the clock, regardless of the clock usage or state.
> > If you have several consummers on this vclk2, this would
> > cause glitches and maybe this is not desirable.
> >
> > I think it would be better to handle the enable and reset with a
> > specific gate driver, in prepare() or enable(), and the give the clock
> > CLK_SET_RATE_GATE flag.
> >
> > This would require the clock to be properly turn off before changing th=
e
> > rate.
>
> Sure, will see how to switch to that, seem Martin did than on Meson8.
You can start here: [0]
It may not be the nicest logic but so far it works (for me).

Please note that I don't mix between CCF and direct register IO clock handl=
ing:
For the old SoCs I'm relying only on CCF to manage the clocks.


Best regards,
Martin


[0] https://github.com/xdarklight/linux/blob/meson-mx-integration-6.3-20230=
410/drivers/gpu/drm/meson/meson_vclk.c#L1177-L1179
