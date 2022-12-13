Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70DE64B385
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 11:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5221410E304;
	Tue, 13 Dec 2022 10:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EDE10E302
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 10:47:24 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id f9so10136496pgf.7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 02:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cQfPd3sY76+GriFagt69g8yO/fYsmZo2htleo/DTyXg=;
 b=HcWEQ4/YYKY1L87gmHEPsAB51nHM3kcVs7WyXj1rhYN7iPela+nbm5/qM8OrKfWOGL
 p/h2/ZqMcsj+zeIWoFLKbasp32WJ9/OsGijr+WYpltoplozpAU2HUXe8MC8RD/pXz0X4
 x7QM8ePU+VQtGMBOrkdg/Sn36E4Td2BdscIBX0zIcmq655+JXfjb4+K/S1PtYYzrupJP
 gUzQy2utlw6vF/gIAcYYI3Lm0ccIYwmy3xkmRHhoW1d0/outdkPt8TcUMhAeFK7lkSSX
 SJOu8RWDR5YXAzA6SmfJD4QemxotzTpu1oOPN7KZdblHo+J7VZHQ+Ff2dG7eUVBxpMmb
 qwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cQfPd3sY76+GriFagt69g8yO/fYsmZo2htleo/DTyXg=;
 b=SbyX0JLSIspKEXLt3ldKSWczwR89d0aXannAEh8JYIDyNEz0t6fB0p4Xvj+VjScn/C
 C8/UH58+ljyQ1T8Mfk3ItUbAcsIrH7eNsxM/g+wKDQKBKxPluX4Z550/sSQuE9zgXk6A
 3M7db2H/YvertSTpOIPN1tjJx/iRW0dFAwO5CjIy5xbrCVoMrKiWeGHctEjpgvWftQwM
 1tG5Q8BXUPmLBTw1JnBwzT1+M/XmMXRouXKVpdjENF/oovVTdrF/lZngEHZ00JTRTjPW
 fsZJFlYS3nlDJZQpdzMpDrWdAekNv9QLqsFq1FzdrFp/vxTfzEsJobjrMQu0VvKGmolG
 hQVg==
X-Gm-Message-State: ANoB5pkJayQI6QyhF4fN5c/XtpoDuHr5o+43n/9AgtkLBWejMrV/EH4C
 f1b6JlTX+wZd/shcp9ViWiVrkqwkox8iceWf8Gw=
X-Google-Smtp-Source: AA0mqf5cjSYSfwCgGpiHT0EHWEdsMc+qO8x3mBFfeQBHED0YSfMKYuFexqgJyGH8RLfMPb+79yo9c8Us5Y8He0t/7g4=
X-Received: by 2002:a65:55cd:0:b0:479:3911:ef0a with SMTP id
 k13-20020a6555cd000000b004793911ef0amr512582pgs.603.1670928443865; Tue, 13
 Dec 2022 02:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com>
 <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
 <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
 <b1e38212-985c-21c9-58a5-7504719c3af8@samsung.com>
 <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
 <CAMty3ZBzpmwAV7e7wdBu+GOmg6M7xqqc46QtGzuLsnv2kT0Zdw@mail.gmail.com>
 <395a4762-70fe-1caf-579f-2b5952232470@samsung.com>
 <CAMty3ZABHUjSHRBR6RCnyE19HOWknw67s__0WBKgMnX5nQBy9w@mail.gmail.com>
In-Reply-To: <CAMty3ZABHUjSHRBR6RCnyE19HOWknw67s__0WBKgMnX5nQBy9w@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 13 Dec 2022 07:47:06 -0300
Message-ID: <CAOMZO5CPfgYUhXO_JZJvVBoFpddw+LHbd58a2TzPd2nWjzx_rg@mail.gmail.com>
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host for
 first DSI transfer
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Matteo Lisi <matteo.lisi@engicam.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On Tue, Dec 13, 2022 at 7:40 AM Jagan Teki <jagan@amarulasolutions.com> wrote:

> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10

Please preserve the authorship of the patches.

This one is from Marek Vasut:
https://gitlab.com/openedev/kernel/-/commit/e244fa552402caebcf48cd6710fd387429f7f680

but in your tree, it appears as if you were the original author.

Please double-check globally.
