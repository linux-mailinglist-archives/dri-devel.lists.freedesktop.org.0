Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 117E471282E
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 16:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E9510E0A0;
	Fri, 26 May 2023 14:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6FB10E0A0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 14:24:32 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-775ebe161c5so76082439f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 07:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685111070; x=1687703070;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2LUpd1ShEDkP8CxxjKODFmXxczpxGXQR/flSSmLeAU=;
 b=RUNnPXW1kCTIpEs2CB3cMSdXrxLwRIg6VWW4uCczXrg4OCNvR6jhroogy78nusjL2X
 lrQI4DMCE4D4G7KkXyC30uoROdZ2ow8gnNcz4ds5WhfE5ZupKiQLZB+orIyQcoXO3F5K
 r8ZBB+Rs0GCAuG6psAbCzvJ34cHNq/zQ0P2mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685111070; x=1687703070;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M2LUpd1ShEDkP8CxxjKODFmXxczpxGXQR/flSSmLeAU=;
 b=U3uc9KBvs7s4Zi6XO24Y8i6ZfXQrF8WyYcbsUrR+0/gozTrnHH8OZMo3VoWaw8ss25
 ky2wz9NtCUpCZ377IrFmW00HpQ2I9/vfpY/FlAo4yS52hcWvirvVbn3rSdcszIhR8qoO
 MSLJ9iLYmKU5WV/YMox0edNQF/xnQPNqWvL+5h269pvO6PtAqQItIBHKNm7yo1Y9RijS
 HT4ndZK/zHwzyTrz088/7VloHzcw+MVd4SB+1gQrIqcXFkIPPLzxSb92gzhHEYKqj36H
 AoEkb4kSuX4uFGS9trNEIk0+bGsMv9dDHgetxUEmnY1+TLrRZcFUvwGzWHZ4kHN3dj6l
 VI9A==
X-Gm-Message-State: AC+VfDzfw96qS0XscI2ezja7AWDwHdV2ZtOEEp8+/9PSFwYAU9nKWlm4
 Kk7zeLStr9y9eUQXD6UeAZ8PQY7JPsm+eFF51XY=
X-Google-Smtp-Source: ACHHUZ6gp46xyF0cREauSXu7f1aV8n4o6LnuyNwXcII12+nfiKdcPqKtvJHJrizDMGOnXblkU64nsg==
X-Received: by 2002:a5e:a618:0:b0:73a:6c7f:c476 with SMTP id
 q24-20020a5ea618000000b0073a6c7fc476mr1387779ioi.16.1685111070179; 
 Fri, 26 May 2023 07:24:30 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com.
 [209.85.166.180]) by smtp.gmail.com with ESMTPSA id
 c16-20020a02c9d0000000b0041658c1838asm1171025jap.81.2023.05.26.07.24.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 07:24:28 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-33164ec77ccso152945ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 07:24:27 -0700 (PDT)
X-Received: by 2002:a92:cdaa:0:b0:320:9759:bf6b with SMTP id
 g10-20020a92cdaa000000b003209759bf6bmr79542ild.3.1685111067417; Fri, 26 May
 2023 07:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230526100801.16310-1-uwu@icenowy.me>
In-Reply-To: <20230526100801.16310-1-uwu@icenowy.me>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 May 2023 07:24:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UxrFVZXn+dtgamttTVopWMSVbxYsHCGG_tS+3OTXbHiw@mail.gmail.com>
Message-ID: <CAD=FV=UxrFVZXn+dtgamttTVopWMSVbxYsHCGG_tS+3OTXbHiw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-elm: remove panel model
 number in DT
To: Icenowy Zheng <uwu@icenowy.me>, Pin-yen Lin <treapking@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 26, 2023 at 3:09=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> Currently a specific panel number is used in the Elm DTSI, which is
> corresponded to a 12" panel. However, according to the official Chrome
> OS devices document, Elm refers to Acer Chromebook R13, which, as the
> name specifies, uses a 13.3" panel, which comes with EDID information.
>
> As the kernel currently prioritizes the hardcoded timing parameters
> matched with the panel number compatible, a wrong timing will be applied
> to the 13.3" panel on Acer Chromebook R13, which leads to blank display.
>
> Because the Elm DTSI is shared with Hana board, and Hana corresponds to
> multiple devices from 11" to 14", a certain panel model number shouldn't
> be present, and driving the panel according to its EDID information is
> necessary.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

We went through a bunch of back-and-forth here but in the end in the
ChromeOS tree we have "edp-panel" as the "compatible" here in the
ChromeOS 5.15 tree and this makes sense.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...in theory one would wish for a "Fixes" tag, but I think in previous
discussions it was decided that it was too complicated. Hardcoding the
other compatible string has always been technically wrong, but I guess
it worked at some point in time. The more correct way (as you're doing
here) needs the DP AUX bus support and the generic eDP panels, both of
which are significantly newer than the elm dts. So I guess leaving no
"Fixes" tag is OK, or perhaps you could do the somewhat weak:

Fixes: c2d94f72140a ("arm64: dts: mediatek: mt8173-elm: Move display
to ps8640 auxiliary bus")
