Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4647B5AB667
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 18:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7316D10E894;
	Fri,  2 Sep 2022 16:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C814210E894
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 16:22:04 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id m1so3358176edb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Sep 2022 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=6aMVqT308JGoGt8/EoshLNpEGQWB5yDIzvg4AD+yElE=;
 b=IkXBWNeo/1AMsOgTsj5wcMRhfqhTIAsGdBBPNGz7DnhvREhN4t6Oqw5eONJX5ie2KF
 Nr8xkmXpWQNgUq7Et6wddmIs6mMn1grMgLg8+rWJHYtFWJS7MQRhCGkPBPuouOaSLs1S
 DZunb2m+LQmFrpnAFdbj5wU05dhoMsQKAwtoAdJeeyLmk0ATcgyN93j/crszD1Moc5H/
 EuXJPXNVOzr/p2QDWe4Q5yy3lhHXogZDNFcPFjQ3UI/px1le8r5NGKUa8dLHVTM0kgLH
 Q0iIONMOkoJogJOoa18Qn4DVJVLJ+GJ24lGUoYZadaezd54F1+2H7Kjm65ZyEYatd058
 P70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6aMVqT308JGoGt8/EoshLNpEGQWB5yDIzvg4AD+yElE=;
 b=P/xjr0hcKxm7MyG87RcsC4NgiZ/0WbWSRy0L3NuuipgHNyqiLYfZ9uv856EhSH2/vW
 CtLf1OOfQy2Q3Nj5MtLfBhp/7a5jBYgjGBH3dxMlkFBMVEMU2JeRPuAcssYKtUqDlV/S
 rqi+fKFo+PQB8WVvTspByqHFq6rWB1OGjBannM33o2TS4e3HQIsVcZNxtl8I5ixsR0Se
 uZSD0jevDgVb2iUuyLDrZPef3ngTJq1jzieAlxkk1+IbvFbap9EtezSSYE+7+fMI50MW
 GTGx6vg4UCrDOuh3SSzQI8CUnFbTuB5b5P7r43oHAOpTqDohOUvZzZwsiYQKOeq9indM
 v2+g==
X-Gm-Message-State: ACgBeo2mA8oh8+Xb7ONgp/Qt5URaIr6Vt1vUrDTty0Qq8VUR5CuS5i95
 ZswidiRzY9giiL0mpfEr7gBWtppCNQp3QUE1a1+jDw==
X-Google-Smtp-Source: AA6agR76kw5swyXQDES0UCVqWj1FB34OiY42QqTnK8VC/mKgLfU7aZkniobnxis0Wn1dWIYAFNNUz/vM3IS60oU330g=
X-Received: by 2002:aa7:ccc8:0:b0:448:b0ce:3b65 with SMTP id
 y8-20020aa7ccc8000000b00448b0ce3b65mr17362822edt.56.1662135723180; Fri, 02
 Sep 2022 09:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220902153906.31000-1-macroalpha82@gmail.com>
In-Reply-To: <20220902153906.31000-1-macroalpha82@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 2 Sep 2022 18:21:50 +0200
Message-ID: <CAG3jFytU6J34J5cEfLR+S=Q_dMB5x5ti_xfLMtLwThLYuJAeZw@mail.gmail.com>
Subject: Re: [PATCH V2 0/2] chrontel-ch7033: Add byteswap order option
To: Chris Morgan <macroalpha82@gmail.com>
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, Chris Morgan <macromorgan@hotmail.com>,
 dri-devel@lists.freedesktop.org, lkundrak@v3.sk, andrzej.hajda@intel.com,
 robh+dt@kernel.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2 Sept 2022 at 17:39, Chris Morgan <macroalpha82@gmail.com> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> This series adds the ability to set the byteswap order in the chrontel
> ch7033 driver via an optional devicetree node. This is necessary
> because the HDMI DIP of the NTC CHIP requires a byteswap order that
> differs from the default value of the driver.
>
> Changes from V1:
>
>  - Updated devicetree documentation to be easier to understand.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>
> Chris Morgan (2):
>   dt-bindings: Add byteswap order to chrontel ch7033
>   drm/bridge: chrontel-ch7033: Add byteswap order setting
>
>  .../bindings/display/bridge/chrontel,ch7033.yaml  | 13 +++++++++++++
>  drivers/gpu/drm/bridge/chrontel-ch7033.c          | 15 +++++++++++++--
>  2 files changed, 26 insertions(+), 2 deletions(-)
>
> --
> 2.25.1
>

Applied to drm-misc-next.
