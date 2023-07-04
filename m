Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0E7747823
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 20:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6906310E310;
	Tue,  4 Jul 2023 18:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E48E10E139;
 Tue,  4 Jul 2023 14:42:43 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-440b9d60606so1920732137.1; 
 Tue, 04 Jul 2023 07:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688481762; x=1691073762;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cxhjD7KY5JD674i+41mIILyrwvbeMopv+PbB7rT3+IE=;
 b=qXoDuKf7tijC6nBenqA4HmNXCVz12f5ddVrWo/iBC08Xy5X/GCcU43sZ0mtpwstHzz
 GGG4rED1L0Z3jHx0ObuuPnqTWgOV3lvgb0UgCTp0CeJLzQJEGAmTwNjVcNLWi2mplii/
 gTzcErjfLOJvdkMr/rbh3rwy+y80EnZd7ymGi3sD7e4+hc0QpRfU1gEicpQvVZGtzAVf
 6EUu76BBqp0jaLUX1ZJLF1j0K7hxvYq5PwkFk8Ccvmvlcutquq7I+RgTWyWu/YG1H3fa
 w3VIu5zXhiZjEGvEfADAqF0uBRfL7T9poR368enlmGkLswEIk/idT17/IjIAC8boz7sh
 McZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688481762; x=1691073762;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cxhjD7KY5JD674i+41mIILyrwvbeMopv+PbB7rT3+IE=;
 b=Nsz5hztDt6EuetV0OqdO+t81sWo/yHYE9ALSwu/cl56ewpHRTfLnJ6X/NlcJLUjq0L
 rkBKEG+sa1wigLR5PQ8Ipr319qDdgAR4VDy82Bbvr9qMN51AHKtkg6/FcVVg+HqJIswN
 tyXDG9Ed4IgLBCBmQlR+3aoXneZ9QASs4tHLDFxOWSavcfNzXZz9XUWoMu0xNhvgHa/k
 wWq4Zv2YcsafrtHXoKmSeLr1Iqv66OJoBoZnFdGxG1J9Nm5Lhb6ijyphxODt09nmp89i
 PFfotsmDS5r0x97E8mDIkEgYw4UaerOgu99ciujlxGvIeop7OjHeaqMKMfA/khgxNf/u
 C0Qw==
X-Gm-Message-State: ABy/qLZzFlPRrfZSav+WjG56I71wn0eQ8Iyj3L4pkFRtOuhz7iH70rhr
 tydAlTo7225704Pu7ITYfv1cqanw+f7YtGBcrmc=
X-Google-Smtp-Source: APBJJlEzBfrRFFxw3waM7f1ipL7WWKBgZ8jQmyUjVtnbM0TCNsn4+zGfKdFXtaZmMtcuMEXY1XjZXuAM/dQift4uNtI=
X-Received: by 2002:a67:f3d5:0:b0:443:7170:b048 with SMTP id
 j21-20020a67f3d5000000b004437170b048mr6639880vsn.27.1688481761915; Tue, 04
 Jul 2023 07:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 4 Jul 2023 16:42:30 +0200
Message-ID: <CAOiHx=kreUEnqssO7y_+UqAxsnXaLPbwBz8h3JRkdEq+pkdW2A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: cleanup DTS example whitespaces
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 04 Jul 2023 18:05:31 +0000
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2 Jul 2023 at 20:24, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The DTS code coding style expects spaces around '=' sign.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Rob,
>
> Maybe this could go via your tree? Rebased on your for-next:
> v6.4-rc2-45-gf0ac35049606
> ---
>  .../bindings/arm/arm,coresight-cti.yaml        | 18 +++++++++---------
>  .../bindings/arm/keystone/ti,sci.yaml          |  8 ++++----
>  .../devicetree/bindings/display/msm/gmu.yaml   |  2 +-
>  .../display/panel/samsung,s6e8aa0.yaml         |  2 +-
>  .../display/rockchip/rockchip-vop.yaml         |  4 ++--
>  .../bindings/iio/adc/ti,adc108s102.yaml        |  2 +-
>  .../bindings/media/renesas,rzg2l-cru.yaml      |  4 ++--
>  .../devicetree/bindings/media/renesas,vin.yaml |  4 ++--
>  .../devicetree/bindings/mtd/mtd-physmap.yaml   |  2 +-
>  .../bindings/net/mediatek-dwmac.yaml           |  2 +-
>  .../bindings/perf/amlogic,g12-ddr-pmu.yaml     |  4 ++--
>  .../bindings/phy/mediatek,dsi-phy.yaml         |  2 +-
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml    |  2 +-
>  .../devicetree/bindings/usb/mediatek,mtu3.yaml |  2 +-
>  .../devicetree/bindings/usb/ti,am62-usb.yaml   |  2 +-
>  15 files changed, 30 insertions(+), 30 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> index 0c5b875cb654..d6c84b6e7fe6 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> @@ -287,7 +287,7 @@ examples:
>              arm,trig-in-sigs = <0 1>;
>              arm,trig-in-types = <PE_DBGTRIGGER
>                                   PE_PMUIRQ>;
> -            arm,trig-out-sigs=<0 1 2 >;
> +            arm,trig-out-sigs = <0 1 2 >;

There's a space before the closing > you could drop as well.

Best Regards,
Jonas
