Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12264753A76
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 14:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B6910E81E;
	Fri, 14 Jul 2023 12:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD1310E81E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 12:14:47 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so3074184e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 05:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689336885; x=1691928885;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1wNzU1jOzNUiKRxU7gqcIT9SB28krhRHjHYXdxzclRE=;
 b=jPQt3zLyyTcTqT5ijbQq3e0L9rHwwr8SOxE3IeG2tAOaiJJYQugwzDdhW/P/UgpC8s
 VeN0uZO7SlelJM8gpuq1TT4rTe9/ssJBM3shpliPbBHLa9almmevLoIsJS6nWP6ByD/q
 jfYpnLOZx5ltlsj+KkU88i8OnjsleS0ci5lb9DXbiyz2Romth0Vl/r7TVaQrAvocZJA+
 eiq4HdeXvZW+xSAOTf+tA9MhMRJKRxClm1zliGFGWUqo/Pqc8GjV/HvqDjryIGZbZXQk
 GeReLVLjnVLRUL6g7u3gvpxZiHO6mhMHTPH/Y4hsglAmDUGcS+4THgeTfusT+tlaO1yw
 HSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689336885; x=1691928885;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1wNzU1jOzNUiKRxU7gqcIT9SB28krhRHjHYXdxzclRE=;
 b=A6QE6dpf2TDZ+DtbyH22rW5Wd6pjyS9j7zVWHM4B4mhbAth/U69QDNOv/lug+YIHfg
 FQ83ggConCUKZ/EZ83v+E6TFFCUHnZ2Dc5g5elVlS6bwpuVr2J+mJekrJVg8aO2r+9ES
 JeFzmFkcS/RlXkMxDYgRK+4xlSL4hd5wrAbNPNCE143Zav4Oaf5M50gGWmFS/Jmi1Kbk
 DjXqb/lbtCs6x/vrM2JAihrxyvqzi1BefGlIHrzFeCzqtucoXQIerlu6ZvNDpQtvwiQl
 dURPkrViNPS6FZWVvgpCIXUI2tTmQHSdtZTbBRPIHHQlzTeN0FuJhSKVviibU1TQ4ucK
 Idgw==
X-Gm-Message-State: ABy/qLZ/bPS+LANQrQkTTlygYn4DSecWtnBQPJFsNFhGegtljmD6EmKE
 3BTNQfFWbWpK0e6LqJJUIqY=
X-Google-Smtp-Source: APBJJlEou3hBquZ72I9tXaAkxSKmu6ns5tLytwoP8Lson4Z4VFO/VawIygYHQlL/4B4CxJGRZ0r2Wg==
X-Received: by 2002:a05:6512:32cc:b0:4f8:62a6:8b2 with SMTP id
 f12-20020a05651232cc00b004f862a608b2mr4270397lfg.46.1689336884909; 
 Fri, 14 Jul 2023 05:14:44 -0700 (PDT)
Received: from tablet.my.domain
 (ip-37-248-157-105.multi.internet.cyfrowypolsat.pl. [37.248.157.105])
 by smtp.gmail.com with ESMTPSA id
 r16-20020aa7d150000000b0051e19bf66a4sm5680666edo.83.2023.07.14.05.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 05:14:44 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Lee Jones <lee@kernel.org>
Subject: [PATCH 0/2] backlight: lp855x: Fixes after c1ff7da03e16
Date: Fri, 14 Jul 2023 14:14:38 +0200
Message-ID: <20230714121440.7717-1-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two small fixes after commit c1ff7da03e16 ("video: backlight: lp855x:
Get PWM for PWM mode during probe"), stemming from a review[1] by
Uwe Kleine-König.

[1] https://lore.kernel.org/all/20230614083953.e4kkweddjz7wztby@pengutronix.de/

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Artur Weber (2):
  backlight: lp855x: Initialize PWM state on first brightness change
  backlight: lp855x: Catch errors when changing brightness

 drivers/video/backlight/lp855x_bl.c | 33 +++++++++++++++++------------
 1 file changed, 20 insertions(+), 13 deletions(-)


base-commit: 7fcd473a6455450428795d20db7afd2691c92336
-- 
2.41.0

