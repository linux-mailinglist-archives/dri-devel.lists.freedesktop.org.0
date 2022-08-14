Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C0D591EF9
	for <lists+dri-devel@lfdr.de>; Sun, 14 Aug 2022 09:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D3ECAC6D;
	Sun, 14 Aug 2022 07:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF45BAB6A
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 07:47:11 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b16so6129058edd.4
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 00:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=hPc+aF2VAi/VbtY/nNmAuTS5AG9h1lW1aTIOSa9Z7t8=;
 b=TcrPgJ4ohViDciruhNDRuGYu8uFAQ7ywdU0cgSCp6gfiZ9WMtHxZGnHTWpXtzyJFww
 Pg90Kl2fWc/reoStkjEFcj8YZHJUHgvqsoaCwnOWScJMxfY9Lpu5lcOtwXD0/b3rsy+q
 XLbNEtxtZ9L4JYQxWpHo+hBBlOlDzOlRUGP+1iPQNp5vAHXhC/q0M2LXWfXT/SepsYCJ
 MJu0Ga3dQGkUi09svuD8eTus6cQJ282lmm82NP0KnCyfcNJso0p/fhuQShnqOlFxYyOd
 7u7Y2pTLQE+++IL5972uDenQ5Q2XG7Bp10K46srntrOJ9ChWAHpCkS3z+kvs3pC3+Avg
 QvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=hPc+aF2VAi/VbtY/nNmAuTS5AG9h1lW1aTIOSa9Z7t8=;
 b=goWRlf9Z2snjZIHvgCso+o2k0sXzUWupsyom+00WyBiJfn02V7JxsJvuzanyuOYLtb
 Y9F1q9u3+ePDHm5Ut2qv/LOc7/fSKKb19OpIGDtdfCGQkkRGzXc0uDeW8tBtgDj5JCW4
 EjM/uYXevxXtaWaC6BOpABD4zapjsIK/As79I5HkifS+xDaO69ZC1tTVjpNVLmeJyOsx
 RXZQIGDKf0vx40gUdUd/mD6tg3S2aLYTO/u2sDf8gyv9Ge052ngpK8AbRl196Lj1Slg8
 U/8TI28A1DIVMh+Fe6PFFxydOGIW0xZu8LWYzZzYs2xpEHrsMPSDsDTiTQkO4BJUmEVX
 gZHw==
X-Gm-Message-State: ACgBeo1yUDJ0Rm2Dqpku/d6Kmxqakcp9qD4Bc/iKbnt82Nn8RROP5eJG
 qLAk/1yR8ZBGgaAgJgtWTNc=
X-Google-Smtp-Source: AA6agR4xesSbq0h+Z50jLzI3hDE4cPZAkKUdasYL/U5BfidpRRo0/xGAgREkUb2XLYIBaHbs5IHMRA==
X-Received: by 2002:a05:6402:5190:b0:43d:da02:566a with SMTP id
 q16-20020a056402519000b0043dda02566amr10055382edd.187.1660463230217; 
 Sun, 14 Aug 2022 00:47:10 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 23-20020a170906309700b0072b342ad997sm2651373ejv.199.2022.08.14.00.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 00:47:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 4/4] drm/sun4i: dsi: Add the A100 variant
Date: Sun, 14 Aug 2022 09:47:08 +0200
Message-ID: <2110674.irdbgypaU6@jernej-laptop>
In-Reply-To: <20220812074257.58254-5-samuel@sholland.org>
References: <20220812074257.58254-1-samuel@sholland.org>
 <20220812074257.58254-5-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 12. avgust 2022 ob 09:42:56 CEST je Samuel Holland napisal(a):
> The A100 variant of the MIPI DSI controller now gets its module clock
> from the TCON via the TCON TOP, so the clock rate cannot be set to a
> fixed value. Otherwise, it appears to be the same as the A31 variant.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


