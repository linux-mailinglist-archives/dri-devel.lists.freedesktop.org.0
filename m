Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 783B467DF6B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 09:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB89C10E429;
	Fri, 27 Jan 2023 08:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D7510E429
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 08:44:15 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id e15so5105763ybn.10
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 00:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V/H55PEXyjXZT4GZWOk+Oen726TtAu6SBCILQ5VC314=;
 b=OygUJsxPXXb1A7zKawby3jULVZLlc1E/B+T3dd6sTjk9qnIZGXqRQ5QiaAUgC8Rxec
 vX650NyVuSjnEnLv4UwmoWZ0gGH9OKcQSjohgypVW/+I/rp/bzThU8sNE5J2HSnq7Ynn
 kqjIzWJoHCLGblSRkb95JV9b3lsEPj7QIhb7BPHf1aAApRPaWaYwc8ETkOOcjJmxpTM+
 THDew74cA7oGcdBBXmW5maoHNWiVC+Pz7zJHbzYHtu+QALJIw1JXAMS61Qh+qlXa+EnD
 p+m0PWed6sTbB0+Vsu80mmlPEXvmsfAtwqhZ5pfL1YxidX2QUW75rcvIwUZGqKrHiHV+
 z4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V/H55PEXyjXZT4GZWOk+Oen726TtAu6SBCILQ5VC314=;
 b=SUzn/h1CfXcokPVkbfhzbaNGdQubNqqc/EnUX6mp32iGMQGtmpCjuhMseNEiAk5dOa
 O96a9cPsvi7X6QmmABMmuuCjAkUON6wrBKy0DUsvio+IHWPbtUhQJyqnHhf1WHcKB5mq
 M9VhFNSoqXxHPwKnpmjhjUJUSRuPf0jy0NjiPqXEDv/drMP/kJjFVsWyX8YfolhAWgki
 fWEq+zbQpgPtXCqCypWfGWnMbrnqrHBTJh0miSN97C5EKQR2JvKvQI0mTRb9+rVBoUQk
 LEIgF5+lfNBm7ljU1aIwtrjR0cRyLHcA4EkR6GIfqZReIryeT78VJ62SKsZWdgzqXWKt
 8Vvw==
X-Gm-Message-State: AO0yUKXkLMt080hO9uAZiB0t15/rm591vfZ3YZiV0h4R08CYSwF3rGC6
 4Ds3veIIxmWAY6t/mog5LpJcGcDZe0vHYWLzlJZbYA==
X-Google-Smtp-Source: AK7set8wMrWFYAXUWahy33AbglefgDSZCeEIUwyW+7cMkzPKxVYUPC/q7srh0/Zo1YXxBa66QwQHiC2sd7EnEFYL2+c=
X-Received: by 2002:a25:d1d1:0:b0:80b:4d84:b25 with SMTP id
 i200-20020a25d1d1000000b0080b4d840b25mr1265372ybg.584.1674809054262; Fri, 27
 Jan 2023 00:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20230123154603.1315112-1-macroalpha82@gmail.com>
In-Reply-To: <20230123154603.1315112-1-macroalpha82@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Jan 2023 09:44:03 +0100
Message-ID: <CACRpkdZs2ZCt=K8Q89XhpA_hKOZHUk6+KdJtsOKr3rBM2Rm1Ww@mail.gmail.com>
Subject: Re: [PATCH V12 0/4] drm/panel: Add Magnachip D53E6EA8966 Panel
 Controller
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

patches look good to me, Maxime is happy, so:

On Mon, Jan 23, 2023 at 4:46 PM Chris Morgan <macroalpha82@gmail.com> wrote:

> Chris Morgan (4):
>   drm: of: Add drm_of_get_dsi_bus helper function
>   dt-bindings: display: panel: Add Samsung AMS495QA01
>   drm/panel: Add Magnachip D53E6EA8966 Panel Driver

These three patches applied to drm-misc-next

>   arm64: dts: rockchip: add display to RG503

Please funnel this into the Rockchip tree!

Yours,
Linus Walleij
