Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBF66AF880
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 23:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A9010E14B;
	Tue,  7 Mar 2023 22:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B5810E14B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 22:22:47 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id t39so12947165ybi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 14:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678227766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5YjSGVFL23aGYtOKm1Ftz/b64+tciORVkVlETDnLgUk=;
 b=D2t4vF6DzPY+77yDIu1t4LFweWOShObHecQg5NqGy/oZK9AjKf5QnwOAFUwW2JwrY+
 vo2Ko3K76Hufbxsgketu/Kq7FNcZwnlOIgaF8CahifqfRieoDIA68MGTO/Nqua8tBp9o
 sa8B540PwXujUNNmfJ2jXarBM0DGPOOEQ3M24Opk+JJCqaza+atah7OXtgMVIFD49esI
 ARhh+ixJG6ViSTC+YegTevzvt35O5lZj9CVx5b3JLS3NMLsZxahY5NZmThxCFv53KokQ
 vWK+kPd40Cg7PJ//fEwHLYiMVoo5EUvsbysXQnchoSHa+i8LrZHgIIU6pe26OiY5IWio
 W/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678227766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5YjSGVFL23aGYtOKm1Ftz/b64+tciORVkVlETDnLgUk=;
 b=Vta9soR4dDEzJGIlFb1OGclvli2UBmwXZ98qHwV906nzPuguWwVsrb+KkELVK4/mYp
 hzrnEAaDo1P3+VNzEfj60xsmmwXWxOP0ycCtkExtwkzbNMCy8DOcD0GfCcBcCyvoZXP1
 uFPIiyJB8aivo+K0P3x6ia6gvgyRg6TiHbB24fK4M0APMcYKpmgpaLppgwykk/woWJ9+
 +KEAxSHrPLtLDqlHe7NpWTjx3rua6nPfYMnKj4D/68GAbKESAu+D5uJakDoc2cotewxl
 GSaWDyDdkHjIUWYx/enZPTAfm+dBe1KaSA6HNhsWJQZSaSbFIxMLojZ6ZXLLVOgH1WtS
 AIJg==
X-Gm-Message-State: AO0yUKVr18Gv7NFkSA2HxLNvjKj0Q3H62jFtDTwhpMiNc1MnObURc+08
 JuPSdZjv0ZMeDMt2HJCQmJrJzIA1cRbvcxEFYJtUAA==
X-Google-Smtp-Source: AK7set9r2P3aZtqkFd8o65fo0pR9pujvbwTr8Q0ckC+reGxZ6RbMx9OnXFP41k7NDPtIp8qWJODCk28Yw6NompBM0ek=
X-Received: by 2002:a05:6902:c3:b0:9f1:6c48:f95f with SMTP id
 i3-20020a05690200c300b009f16c48f95fmr7759792ybs.5.1678227766488; Tue, 07 Mar
 2023 14:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20230220121258.10727-1-lujianhua000@gmail.com>
In-Reply-To: <20230220121258.10727-1-lujianhua000@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Mar 2023 23:22:35 +0100
Message-ID: <CACRpkdZ=6bU2gPv4zVzMBFaCgEY+fkRbrnLAB6NGOhWus1gwaA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT36523
 bindings
To: Jianhua Lu <lujianhua000@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 20, 2023 at 1:13=E2=80=AFPM Jianhua Lu <lujianhua000@gmail.com>=
 wrote:

> Novatek NT36523 is a display driver IC used to drive DSI panels.
>
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v2:
>   - Drop unnecessary description
>   - dsi0 -> dsi
>   - Correct indentation

I'd like Konrad and Neil to look at this before we merge it.

> +required:
> +  - compatible
> +  - reg
> +  - vddio-supply
> +  - vddpos-supply
> +  - vddneg-supply

It appears vddpos and vddneg are not necessary on
all variants, can they be made non-required?

It is also possible to do some - if -construction of course
based on the compatible, if we want to be fancy.

Yours,
Linus Walleij
