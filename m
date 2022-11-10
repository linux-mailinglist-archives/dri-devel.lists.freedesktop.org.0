Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B199D623DFF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 09:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F8410E69D;
	Thu, 10 Nov 2022 08:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0B510E6A2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 08:52:51 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id v27so2060845eda.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 00:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fBb6YdEA9gaUEUkJZWWTg0hcwQWGE5txA4y6SKN3vPw=;
 b=njSZLr4Gc6ieZhi/fEo0saxFEA99ICpi6izrgmkB+bwp36Kle2fXZCYtgwHD6jJfui
 9cbJ6ffidygDSIzZfnreObgFFin4syG2Lp4PJvUuaeC17PiYMPZwZlQ7gZ07K3uosa1B
 MYaqpCEJl1zX2q/jAnhl+VKctTknZDO6my5LLgvdvwEFBuDGlD8+a1QRZKsW/97x39ve
 4pIvdG7yUrxhsewJvLKLPI/t66RTD4vHdFJ9uQdRRIkIkNXiEqD6RIkH+rpdB+Vshymg
 pEK4hd9oAXib7dyztcVRawyYnOzHWiHt3bidbz48LDr76e0S7QS8UsqUVjtJsHhjFXfO
 Vcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fBb6YdEA9gaUEUkJZWWTg0hcwQWGE5txA4y6SKN3vPw=;
 b=eLy9vxYK8dzkMEwKxlmMeFR9z2lGDS1TNcXEpPW8ZQW6KuZOWs+IIVdvEUmZu57G41
 K0sn+8FVQ/ZjF5P43dTHKhMpYIBTIEuFDY9wsfRV52K6fuD8prtfmI5oh3pvZ4nhf1AV
 C9Ly7bivcnxVpUETBwJuOAE1PBfv82XQk795bhXoDjFjNveZxvvf4Ii/BP0k0H0Bv4+I
 iGO8YsVq7Eh5lJxlg854Kv4IWgKOK/bmbsQ5tsKYI/MvMU+8CR/3AgV2GDfmdIlXWfoM
 bmHXRtUWro5S8L/3+P7aH0z/RSB2gSAaJn9ZBipl8H+6RgPpsoI+KCYUfP7J1Gld8Tt/
 gOqg==
X-Gm-Message-State: ACrzQf1wvBh4eoNFjTP5suJWe5yxoNCmKYSQ2O2+rlbS/oQBSlr/0gJm
 offXZAX5mvZALTW/o9SmgdReKOmKH3R1uEQaRdzNqw==
X-Google-Smtp-Source: AMsMyM5y1/mXEWPO6i8CMdvsA/B92FRKLcP2+Myo557FjafHWoqyog/Q/wROXXdKpRuoiZ0KrgWBakxNsIGvLb6Ii2Q=
X-Received: by 2002:aa7:c718:0:b0:462:ff35:95dc with SMTP id
 i24-20020aa7c718000000b00462ff3595dcmr61060027edq.32.1668070369950; Thu, 10
 Nov 2022 00:52:49 -0800 (PST)
MIME-Version: 1.0
References: <20221028205009.15105-1-macroalpha82@gmail.com>
 <20221028205009.15105-3-macroalpha82@gmail.com>
In-Reply-To: <20221028205009.15105-3-macroalpha82@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Nov 2022 09:52:38 +0100
Message-ID: <CACRpkdYPfkviGFwnWoyLZz-gPebRZqcU6d8E-sOzZjb4NwX16w@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] dt-bindings: display: panel: Add NewVision NV3051D
 bindings
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 Chris Morgan <macromorgan@hotmail.com>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

thanks for your patch! The following is just nitpicks so take it or
leave it.

On Fri, Oct 28, 2022 at 10:50 PM Chris Morgan <macroalpha82@gmail.com> wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add documentation for the NewVision NV3051D panel bindings.
> Note that for the two expected consumers of this panel binding
> the underlying LCD model is unknown. Name "anbernic,rg353p-panel"
> is used because the hardware itself is known as "anbernic,rg353p".
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
(...)

> +  reset-gpios: true

I would add description: and say that this needs to be flagged
GPIO_ACTIVE_LOW since the reset signal is active low.

> +  vdd-supply: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - backlight
> +  - vdd-supply

If someone happen to just wire vdd-supply to some fixed regulator
then they don't need vdd-supply so this is a bit of a tough requirement.

Yours,
Linus Walleij
