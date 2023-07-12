Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331437510C0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 20:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC64210E5CA;
	Wed, 12 Jul 2023 18:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7114C10E5CA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 18:53:03 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-98e39784a85so241688666b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 11:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20221208.gappssmtp.com; s=20221208; t=1689187979; x=1691779979;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JQ4ydL/WGq8kYFRmJKHUY2EYeXfrXX7mjUaMu4wiNic=;
 b=uGY13AYxal5eQro1yxRTHogilGc67RfdqXTzZUlekyl/EvPac41TBk7tyizxhoROxZ
 hcMpIPGSuPkQLbCknDFaqFAK7efBS7cmG18g6lIRtSOTMrs6Hd/22ChmJE6lr/rOxAj4
 //VHbatb0hkmHeVR1jx3Dt3SbbHXoujB2Zx3voHche5fDmEKlut0j/74rCDUYq5IwGYv
 yvb1RDLqRHyJ9IC97Nku1wsz+u755B8vw2AagN/fKQ3xukNku3KTFPZgYB834dt1YQ1E
 Ed9Ek1e71IGzggXoEH9FLlB8Sqqa3hZdfs2krgtVQlGaBWq0GQtqhv8jblK838sUQAFa
 x/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689187979; x=1691779979;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JQ4ydL/WGq8kYFRmJKHUY2EYeXfrXX7mjUaMu4wiNic=;
 b=QzaCNr8N9DSeeJCKCCL3EwlOQoR/GN5sCbtY240D4rYInPjFgCmz4keVgP3+aghaUF
 Kc7rd0EBK65bxn0/9/tNyYqE+88/lA24c9+SCvJv/JNkzPeGrqryKK7AbvuRWofdzviz
 DYfi9ppY7QGgZdSDnsZFzBJuiLUxmQOHSZgPDB4nHhpEGn1iNuljMyd1pHQ2kNRnPZJD
 bFrQRt255ZIsuQU5Pq4BuTrL5mTOiNQPx1DvDcyTfOxi86cG4wwGX/TtjeGnhb9sVByp
 6cOwCcDnuXXfg4LB/z2U7/XCQMP8x78z0dUau4gk1mphnOYYG9MAKJPrWeKARcH3/Bqv
 6mnQ==
X-Gm-Message-State: ABy/qLY8yfKXv6lK1gpaMdtkYkzQAgfFku+hx3j6v7Gp5okUwEoeRn55
 4pbTEpHxgwVaYprYIxN84F5C5VLTH/eYiCBruiLZO57E2N/AJv7M7vg=
X-Google-Smtp-Source: APBJJlFoU9UoOT9HLQDBGwe+QuuqV/2O310xi99HOJORyW9JgBVRHl83InyQRVS5VMmPdrOkWHVA9GP/9MUyh7PGEpQ=
X-Received: by 2002:a17:906:74db:b0:98e:2413:952f with SMTP id
 z27-20020a17090674db00b0098e2413952fmr4278637ejl.18.1689187979275; Wed, 12
 Jul 2023 11:52:59 -0700 (PDT)
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 12 Jul 2023 11:52:47 -0700
Message-ID: <CAJ+vNU2Nb58wOdm9yROzSceSJgwR0pqfVFDiJWGUG6YN87ZdaQ@mail.gmail.com>
Subject: 6.5-rc1 breakage in samsung-dsim
To: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Marek Vasut <marex@denx.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Adam Ford <aford173@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Greetings,

I've noticed a regression in 6.5-rc1 that I'm having trouble bisecting
between 6.4 with regards to imx8mm MIPI DSI.

I'm testing on an imx8mm-venice-gw72xx-0x with the following display:
 - Powertip PH800480T013-IDF02 compatible panel
 - Toshiba TC358762 compatible DSI to DBI bridge
 - ATTINY based regulator used for backlight controller and panel enable

I'm using a dt overlay to support this [1] which works on 6.4 but on
6.5-rc1 I get the following error:
[    6.110585] samsung-dsim 32e60000.dsi: xfer timed out: 29 06 00 00
64 01 05 00 00 00
[    6.326588] tc358762 32e60000.dsi.0: error initializing bridge (-110)

I'm trying to bisect this for some reason. Does anyone have any idea
what may be causing this or how I can debug it?

Best regards,

Tim
[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20230711221124.2127186-1-tharvey@gateworks.com/
