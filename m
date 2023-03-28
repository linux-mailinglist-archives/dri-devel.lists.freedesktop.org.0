Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1966CC9D6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 19:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2AED10E96C;
	Tue, 28 Mar 2023 17:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BE510E96C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 17:58:26 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id cf7so16203836ybb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 10:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680026305;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfZn72mHdpGHn/5tkQZH0YGYSOz2tOScf6YCxBUYQ0Q=;
 b=RaMYP06uIY3kYzM/ESIWeEyOkeoNXiLitIfvAYO5QczB2OqBIfhD6OCkLKLbU/1t+r
 MtBrE1HCpaF5v+ljbNyxrkAZEe8HHmoZ8yd3vtUy02pQ06gHHzQPJ/obCO30bASDL0e+
 6Jhk6WrRuc/yywCrMmhiLAgh2YpUzDodHDIpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680026305;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VfZn72mHdpGHn/5tkQZH0YGYSOz2tOScf6YCxBUYQ0Q=;
 b=GchgC1Ur2Vd/7TEaQqjvVmr15c0RrZh4YyFv+czYUMcRfdqamZjaUk14BW8SubmEmk
 gF2+jZ1NkTEpYtJZRzpF47kUpp11dK6uL3B7npYPloiO8qNMrVoBuTeuAvL5QBJJC395
 JmHZvQQoi3BIEqNK796hFohJiW/DbubMJwCnaMTFRKtNgWKKlHrUTrZuQj7PawOMBAC7
 vBK1RF657dKEeMsu7QPid7OMq4htDSHysBxFoQ4ixy0Nz9LdSQgFOrrBrAvLetVWojBP
 mIju0YcjE9ylLZjnBwT/lWVODpE9zdvVCUhPfYsn9aGKQGhyOXfrt89yNUyMwoQ/gUJx
 UIhQ==
X-Gm-Message-State: AAQBX9eZZDZeS859gzZMUZiTugi8LaVzCXcN569yrYAousmpkYZxXLY/
 cPAr/TKt5io7izrSjahThDFl7+MfS3vnqMrOH+gtKg==
X-Google-Smtp-Source: AKy350bgVPG6io9JT47uYAvPLrhwFbLdfgwRhCDZXvop6+TTXGiPnx0ASefaxBFQLyTxgs/qcQtxhZ52zLayyuNGkSE=
X-Received: by 2002:a05:6902:920:b0:b76:ae61:b68b with SMTP id
 bu32-20020a056902092000b00b76ae61b68bmr8179053ybb.5.1680026305274; Tue, 28
 Mar 2023 10:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230326204224.80181-1-krzysztof.kozlowski@linaro.org>
 <20230326204224.80181-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230326204224.80181-3-krzysztof.kozlowski@linaro.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 28 Mar 2023 23:28:13 +0530
Message-ID: <CAMty3ZC_zJXFESh325736LHJHCtENjmU8twhU8Jy5GwW-bOz1Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: display: elida,kd35t133: document port
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
>   rk3326-odroid-go2.dtb: panel@0: 'port', 'rotation' do not match any of =
the regexes: 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
