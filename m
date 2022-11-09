Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D1E622754
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 10:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5263710E064;
	Wed,  9 Nov 2022 09:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1C210E064
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 09:42:21 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id m22so7947912eji.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 01:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kpat3oIww6mvasqFsGKc3erLtYdIA8Myxby80VshSDc=;
 b=Z3vzpzdwRJtcEtnsAnnBlXDZ+OmYMtlSkTAPFnI9B3ULkEOFx+5lllovKGKU1554oK
 ybjSvuYI4KxT/9wZJyieePHzvAMf7eypU6I8aT+TEDuDJ+oydTRD+PgksLaXBNKDoldo
 qw2FrMunB8EcnWXyTxLW1Or9TjxcHVYCtqHlkNJIqZH2lXYg7yGDQCcTA/UDgqpS8RfY
 waNLiemf9Su3+0xxZAfXgr/+8p2HhrP8iiUY/5HEFp02SOmLiS9lWJGScCdEIGrwsdQE
 E8w0oP9TUc9NpYc+NKMhJIzyO6f4gCar1SWWx5pjW5l0GaaknRHba7ScM2a5kw5wOStA
 swqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kpat3oIww6mvasqFsGKc3erLtYdIA8Myxby80VshSDc=;
 b=eTZIZ37rvrfMJ3OKW0kjJ17FfIrAJbL331eq9L52eY8CXW2nErMJPBWgWw6ey9boMM
 n2C/kHwU2xuywJxkFPPUH/5aK7p+E98X6CZhJQJXKS6SgBbTEB43H43wLRFExAGRebaf
 zrhUNzM4xBvt2Ck6W8f4NxvOWb9UFpEcwCeIk6RdWUHdmRq7xTlT18XC1HlGedpIIriw
 En0ZYIyE6w6oHyg8KE/57PiLwxlJ9eBWTMZE1MtNdMHoaaSbIbsr8Xfr+LPlYmt8AAXn
 YAkVJaYo8951sRHOOzPV25Zy4Lq8F2RO2VMCV2LPGE7RKPwLkhBbJ6kFIHZcGB+9b+ll
 L8RQ==
X-Gm-Message-State: ACrzQf0c6Pb0WQGdyUDaPNOX4r1lRRQUyKTTKv1zHP3448Hm6YydtZCN
 03PiR38S94/xVW56++ISXqqzRRy01zGg0ZasSijswg==
X-Google-Smtp-Source: AMsMyM4RPx0SajJLvZm8nBbEtLdENd0zhL7riz9dqXWKXlkN9kH7F7qlvwHO/GyvajSzDSceln1gt7uj+vjvlNtUWxY=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr57475332ejw.203.1667986940359; Wed, 09
 Nov 2022 01:42:20 -0800 (PST)
MIME-Version: 1.0
References: <20221108173120.618312-1-jagan@edgeble.ai>
 <20221108173120.618312-4-jagan@edgeble.ai>
In-Reply-To: <20221108173120.618312-4-jagan@edgeble.ai>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Nov 2022 10:42:09 +0100
Message-ID: <CACRpkda7sWoy8jgaWq+xtbYwDXZx2P19h-BF8GVKpKN7ZxFUFg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] drm: panel: Add Jadard JD9365DA-H3 DSI panel
To: Jagan Teki <jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 8, 2022 at 6:31 PM Jagan Teki <jagan@edgeble.ai> wrote:

> Jadard JD9365DA-H3 is WXGA MIPI DSI panel and it support TFT
> dot matrix LCD with 800RGBx1280 dots at maximum.
>
> Add support for it.
>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> ---
> Changes for v4:
> - add delay explictly
> - update init sequence

Thanks I really like this version!

Patches applied and pushed to drm-misc-next.

Yours,
Linus Walleij
