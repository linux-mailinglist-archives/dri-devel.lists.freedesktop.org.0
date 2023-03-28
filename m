Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADE66CC9C6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 19:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF3610E95E;
	Tue, 28 Mar 2023 17:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DDD10E95E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 17:57:07 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id cf7so16198539ybb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 10:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680026226;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VVMjvkUiQpIYhxok9nUkY/T7s0aJ2xwVUiGCBB2sdwo=;
 b=EFPZM1Py1Dnl1l6LPwbu9pqTYrzH8qNSmgr221CZCa4FklAzrki+HClymGX5wIWR2q
 8/+lFyXnpI1tF/G65VL6zkCcw8Fqwocikg2eqACXDUa3TRWeOpb/0tt+R43UgqrcILEK
 YSb57HSDYgG2pNs/pC+MJXsiZlklna94FHeaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680026226;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VVMjvkUiQpIYhxok9nUkY/T7s0aJ2xwVUiGCBB2sdwo=;
 b=bjWiGqQ4jjSOiBPOTJqVkLKK2BcsuQfVYDR4klUayTHiwWCCSwcNZoHjzZd+DjVj3U
 dlbzxf07+zG6HNsaz4UyRi9OvLVReotgolHfvNMQ4zNvE7jqOGf41c/drlAxNzyZ0TNu
 XhdOylzGQfO4Otm2LfiSOCPkGyPuAqlmFlrJdW+/aCX7J+hkEH6XgE8y6LA8OrhEPyVT
 fHwzE8WRszd9EFzYCkqOOQYj8GZNC+91wKPTfBhRuifwh6RGN0lUwSr88+b7xWQp2Wwt
 1cS7cZGOKlekzwyz654siGhVoyPMp0Wp8A//N9O2zD0pQ0ExXkKjkNsNyZXIr8QBjbUU
 Lf8w==
X-Gm-Message-State: AAQBX9f8zEQ+G78eVy9CDaZL+3zNtxbqniv/6La0vprsBYxKrcEHnqrn
 Ryu/g+a9wnNJYn1qallC82+vZYeO+76t3/144W1ZjA==
X-Google-Smtp-Source: AKy350ZW2rVwU9TY3Aic68rt7ThnXakit0m4ZvpacupHoz8LSjOf507tB8hwNX+1n2ZAbLJbWHkZa/sHYDfi7IuecIk=
X-Received: by 2002:a25:d954:0:b0:b7d:9e72:d792 with SMTP id
 q81-20020a25d954000000b00b7d9e72d792mr1556367ybg.5.1680026226171; Tue, 28 Mar
 2023 10:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230326204224.80181-1-krzysztof.kozlowski@linaro.org>
 <20230326204224.80181-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230326204224.80181-4-krzysztof.kozlowski@linaro.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 28 Mar 2023 23:26:54 +0530
Message-ID: <CAMty3ZBznkToP9_zq_LdaoxXcPps9c6tMD4fRH0=YpS98C=swQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: display: sitronix, st7701: document port
 and rotation
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 27, 2023 at 2:12=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Panels are supposed to have one port (defined in panel-common.yaml
> binding) and can have also rotation:
>
>   rk3326-odroid-go3.dtb: panel@0: 'port', 'rotation' do not match any of =
the regexes: 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
