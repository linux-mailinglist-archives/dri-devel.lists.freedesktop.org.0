Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6C76E1EB0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA9410EC9C;
	Fri, 14 Apr 2023 08:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E3810EC9C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:46:25 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id dm2so43952009ejc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 01:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681461984; x=1684053984;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wl3Btv+PwNxWwtewM+dP8afRzoBywyqwx59JWQAoqUA=;
 b=xp9uWY+38EX8iXKhDxwuf/8P6/uzkYqJiZSNi9vbejNbCSdunJ1Q9htZtm13dmHSwZ
 eB2ixQjldDhVwyuix6HrldPkLC68my3bBZD1+VnwEJYIEqao34hsl9FKzJhaqbncEL3k
 /KmdhyM5haVIHZSXu9JatbD4YRave9CEPpq90sLNHZvf9sW6wBpDPzjaSX+WnuQwT6Us
 silZOQPudvwxoBZsEswx2cagU4lJtHv+hGWoQ6PsUugjiC08giCkVUTO/lm19lCPilgW
 E1f808oQegKlCwXB4Qm2/bYW5g5Cs/6JKEFvAraCZ2Qt5rX7g9UAPhvFrP8zZfj27pql
 c0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681461984; x=1684053984;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wl3Btv+PwNxWwtewM+dP8afRzoBywyqwx59JWQAoqUA=;
 b=LKqRxsW5NTNIwRYZYd3ta7V9B+gqnYXXo0VspFzoc6ho3/jXvicnDzjx4uWWz+3Ia2
 ZjfREc9Gf8clkhUMnuW8xiEbC5oa/B1LlWHWULT8/jgkVszqEY88SOSMDpJVZDXUIfA+
 f1DrNQw4JLAcwHQ3IcY9L/teeo3l/qqGu4I/FXt40ydm3I5SfUNXUSx+IuhZ1MDSRr9N
 t8o5NmyEdO+UrIW0oNt4zoqV+TuCD24LOmZTE+gFsZngk7jLcWmlMN0Oe4IFfAV18siY
 0SYHoWjtMhbtcsjbi2F93+fzvnhR/4Q6GOKGlXyP6e1JpVlT/qP0GmY3MIy1RtfkehFE
 NIjg==
X-Gm-Message-State: AAQBX9cRKISSg/TyhRdkXzixH/Vnxw2TiiHiSjteN98jYm0QP0Knv/3E
 byM5P0XUMvvB2wLPdnB0JtzIXw==
X-Google-Smtp-Source: AKy350Zv7NbHUiKpmnlHoLbQyKG9G9zKPHkXSd3wH7bVQzjdvDDsKYYR9UPKlRsG7vTDe9V2aEOkog==
X-Received: by 2002:a17:907:25c9:b0:94e:ef09:544c with SMTP id
 ae9-20020a17090725c900b0094eef09544cmr659459ejc.10.1681461984189; 
 Fri, 14 Apr 2023 01:46:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb?
 ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170906584700b0094e597f0e4dsm2087436ejs.121.2023.04.14.01.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 01:46:23 -0700 (PDT)
Message-ID: <6fc26e38-ac45-b4a3-32f0-2bae686371db@linaro.org>
Date: Fri, 14 Apr 2023 10:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 22/27] arm64: dts: mediatek: mt6795: Copyright header
 additions
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-23-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-23-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> I have added more than 800 lines to this devicetree: adding myself to
> the copyright header.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 29ca9a7bf0b3..a4c950b65006 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -2,6 +2,9 @@
>  /*
>   * Copyright (c) 2015 MediaTek Inc.
>   * Author: Mars.C <mars.cheng@mediatek.com>
> + *
> + * Copyright (C) 2023 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Copyright is a result of significant changes, thus it is a part of
commit(s) making these changes. Adding copyrights in separate commits
looks like you are spreading them unjustified. Squash it.

Best regards,
Krzysztof

