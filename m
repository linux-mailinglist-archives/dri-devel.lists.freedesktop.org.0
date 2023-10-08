Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127A57BCFD1
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 21:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A637710E034;
	Sun,  8 Oct 2023 19:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D5110E034
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 19:33:42 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5a22f9e2f40so44816337b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Oct 2023 12:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696793621; x=1697398421; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXRzHYXF1ovI5v0uOrxk9RS+XWxmoS5QhrpYqiMEbm4=;
 b=n8Vm1p+GJd+z1QxoMcbsr2HSe8YOE838Xhu/Eej+4NsPTRLsq77a3YJde1Zy1fwnBX
 t6JEKFr0LJ4qgXIuiPbCwCk2JTO9yzi7WQNXMrRqspr+zxFbWAzGp9zmovnfjlxbwIZ1
 lNnUS6WWeN/zb6PcU8u4V2OTlpUekwFbSAyNEGewwEzB3tLq/wX+IPgkrX18jilaaLdP
 S7ZPAIPN3KKAnm0Ix8MSHTS5twwJskuvYMz8SHxziOaB92w4JtAF2z0ZzIwIHzE5U8YB
 YCCC6L+xL9xMy5a1bS1JK+py3WKRmE6J6yp+EuiII7Cg21w/ridaN071iCNbbzAvkdsV
 fMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696793621; x=1697398421;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXRzHYXF1ovI5v0uOrxk9RS+XWxmoS5QhrpYqiMEbm4=;
 b=lVilyQ6JsceE7WK5N46odV4Wv2OW0wwQubfTHqcHHxRRMfrPw/T1tYelqraEHxSstu
 mdw9Mo4C7CQt+YSFCHZaunWVZQgOJO4CTtlrVfwSTfczfUdTjwHcCTAIX1KyUUqEWkRt
 DpEosUXGBQHADQQUwaL3rSOB8agUpCQr0+WCFhI0ZV3bModa4G6G/qutRZ+3aYbjvY39
 hO6H7TzfMK15pza4WtdD6zOYINkFl/ijLipec4P16q+S/tghtIULQ4GpZZSCsy8vHEK7
 iNdNdPIBwN9fdzQszmSLeX+4CQTJqaABlnnTAeNYW4N+LzrS6rwm06K+KpIxZprbYRyX
 NZiQ==
X-Gm-Message-State: AOJu0YzcQF74rm+RmPsDrIfTg2qTreYV38cb+se0tuXsYIyhp9cJoUdK
 WI2YRLl0w4xUTYsgT76RS+f1Z6ZjsdhpZqLJqVW3pw==
X-Google-Smtp-Source: AGHT+IHOqqme+I2o7pnkrO/NMwYTV0OkUbgJ6TEHW4l7Ztd3XLvE/HYW5b4ga2KyjrAdRgrcxO08nr9fo9VA/7Dbnl0=
X-Received: by 2002:a25:bbcd:0:b0:d89:4d9b:c492 with SMTP id
 c13-20020a25bbcd000000b00d894d9bc492mr10786483ybk.22.1696793621571; Sun, 08
 Oct 2023 12:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231007060639.725350-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20231007060639.725350-1-yangcong5@huaqin.corp-partner.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 8 Oct 2023 21:33:29 +0200
Message-ID: <CACRpkdbek0-Vhk4_34qY+0=EGrQxJS_CfLuF_5fRozMMyc+=Kw@mail.gmail.com>
Subject: Re: [v1 0/2] Break out as separate driver from boe-tv101wum-nl6 panel
 driver
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, hsinyi@google.com, dianders@google.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 7, 2023 at 8:06=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:

> Linus series proposed to break out ili9882t as separate driver,
> but he didn't have time for that extensive rework of the driver.
> As discussed by Linus and Doug [1], keep macro using the "struct panel_in=
it_cmd"
> until we get some resolution about the binary size issue.

OK works for me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Dough, if it looks OK to you too, can you apply the patches?

Yours,
Linus Walleij
