Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF4C80DFA2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 00:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9039B10E529;
	Mon, 11 Dec 2023 23:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D35C10E529
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 23:44:41 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5e19bfb258cso6182367b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 15:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702338280; x=1702943080; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6RVJBGyb7KDt+DWNM94FQxNyr6g3td0PQu8dB0bx2xU=;
 b=B2dnDMvjMnnK0l0k1r2qN2U45PHLGy+FzgkpEzq0yvNw6f7Jc7ieQqtd7a6kHrQZS+
 9DbBoToU4WPD35xcWvtdO5IsO7yIjlO5RKW+rZq81S3DRFMu6KPCHdEgUzc/V/rLZqr8
 gh1WL6m6V1bQZbQd8/3MUdlKMnNPlKd65z6VJmdd/kaZxs5RJ4cmHWFT+t2OQeJN4x/+
 7EQfpBMatCpN6F5JUH/fHpJ2MB1RNByWzBGM1EpTlsJM2OkDrlChu1NLboglTNaNLVch
 WAwHvZ2MQpE7suDVvdxCU4ebnl0oufL/ymUd7YZZruw0HQ220Ri/U5q/28opieRoKMJ6
 mb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702338280; x=1702943080;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6RVJBGyb7KDt+DWNM94FQxNyr6g3td0PQu8dB0bx2xU=;
 b=Ii7CKaTLImwoqUAWXuPc5cj45AMDxpfr0FZjBgHUuNEwmUvQr6lHJFxYbmWmpEeQpZ
 u7XGHk0Ysj/jBlBPLohbPCvEQDi8uIm5icKNlWofeLCAGAg4rUDShj6N+YtrEXQnTdaQ
 xVjf9t8ySRUztTDgbMBcne5XUukZoLcF753zh3W8on2k8XRux0Oz114wv5zXJvh9ZtZr
 +L/XcI/KHCyS3/TwYfbjsw4v3lId97poqoJm3PI9TyAEev4yHSyB1EU/btb/cnu8MdmE
 333aPD84L/rebcyixWbTQatTwZrd0BVKwwB1oJ3Ldvy5NVTmLSr19+jIunKWxQlUANwD
 VRTQ==
X-Gm-Message-State: AOJu0YwxiXCbwXGoQogG+Tsm5rt2lRzpgp+9NlR+RPqTveJxpe8Owtvd
 JrOO9eMYfhsTGSGUZJHAYb2RT6FEKb5Fvcl+rXl1AA==
X-Google-Smtp-Source: AGHT+IEyKJfPen2idBJyGlQRrYCffdjX45gEK7aScGJl7Sg68pLPELr3kqR/22x39HE5L6tPCk6Sgz9u/32o2Qy+Eso=
X-Received: by 2002:a81:4fc1:0:b0:5d7:3748:9a1e with SMTP id
 d184-20020a814fc1000000b005d737489a1emr4109098ywb.4.1702338280615; Mon, 11
 Dec 2023 15:44:40 -0800 (PST)
MIME-Version: 1.0
References: <20231208154847.130615-1-macroalpha82@gmail.com>
 <20231208154847.130615-4-macroalpha82@gmail.com>
In-Reply-To: <20231208154847.130615-4-macroalpha82@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Dec 2023 00:44:29 +0100
Message-ID: <CACRpkdYLDDDR_0XrCmTnOXbKt73u3-AVweD92fBiybukna-q8g@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel: st7701: Add Anbernic RG-ARC Panel Support
To: Chris Morgan <macroalpha82@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jagan@amarulasolutions.com,
 krzysztof.kozlowski+dt@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 8, 2023 at 4:48=E2=80=AFPM Chris Morgan <macroalpha82@gmail.com=
> wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
>
> The Powkiddy RG-ARC is a series of 2 handheld devices, each with a 4
> inch 480x640 display. Add support for the display.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
