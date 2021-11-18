Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E39445522D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 02:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8FA6E053;
	Thu, 18 Nov 2021 01:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905FF6E053
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 01:26:07 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id r23so3781219pgu.13
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 17:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=rj7CqfSY1HHzOxn23/DqCx0bhUcFEMZAPK0AwBGlags=;
 b=5qlMw/lKuHB2pgh2rtzVfjnEo1TLWEVqUQAauNVUIQH+0bAz77E1t8/q1wLUPKpGeg
 7pWzjdklRRlunu3AcNjfNxe4U9vcwye3oY9cxLJvUDnx0+uL6QQyr7WYLI9nVrXA2dEA
 u3mj1msfHUXZm1R1iOqEzJ6POqlXddnPVBlacS3MuXTroLRi4kbd13z7xOamy1wLZxiB
 fn3OImQ0NOU2pJuDHl6kyQJrNQ/Ccu9TGCPi5Q/NlO7a+zWW0tp6dLijxnccRWe2dxqR
 MA+CqdRHx95m3VvxhD7TW/Uhtc9L3HDVmpOBpu9c7IkiAKCPJNt42l+iiyIF21BG6sQu
 VAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=rj7CqfSY1HHzOxn23/DqCx0bhUcFEMZAPK0AwBGlags=;
 b=MXC410p0HKEm4fgqij9b9Ch1zCF/WVpVPczN11yFDfbRbb2ik8Fvsa5c3jIzi4fd/k
 Xe5kNhw0sYnL426uKbFdfm2sz79hM6ABXtO16KkEJEjUYa6ui8WXXHNizwJ5T8CaRcGl
 c2ByQ8c8uyYFpCbBuhc7d0I+1IEGjehtMpw+Cn1I+XD/NR65M9qdtNqCFtJXSN3jP/cE
 Fz0LkdukT9YfdCZi3MVkz8XD2tO6F5owsblfqWfktMFydky2swI+LFIJ+osrOuNT+3/r
 v6ugM2BxERD/rqcVDLgrIN1Li9q8z98GWhkEyyCdJRwsmgNtBAacp82OKpRgp47xZ5DQ
 KQxg==
X-Gm-Message-State: AOAM5327C8VWmBLialByw4bNzFMqrXFrD1/Zw4UR+3Mv/2PkIyWcPK2j
 74yfMbpqoCHb75edvWkHkodGYwscmjRIfeZKSOHUn2xMINOiFReH
X-Google-Smtp-Source: ABdhPJz6t6CTX7DXP2DxzKPQgNRxnt2ras3Hb3nxVXmfib09OEGU+8QLC3jsivU+I7R5CZtL0B14zSRrxreDS0zG9yM=
X-Received: by 2002:aa7:8149:0:b0:44c:916c:1fdb with SMTP id
 d9-20020aa78149000000b0044c916c1fdbmr11564545pfn.34.1637198767073; Wed, 17
 Nov 2021 17:26:07 -0800 (PST)
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 17 Nov 2021 17:25:56 -0800
Message-ID: <CAJ+vNU2A8J_72UgdoBw0Z0T0p1GzwWs-OK3UP14Y7KcoDjFOaQ@mail.gmail.com>
Subject: RPI 7" display touch controller
To: Eric Anholt <eric@anholt.net>, Marek Vasut <marex@denx.de>
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Greetings,

I'm trying to get a RPI 7" touchscreen display working on an IMX8MM
board and while I've been able to get the MIPI DSI display and
backlight working I still can't seem to figure out the touch
controller.

It's supposed to have an FT5406 controller on it without an interrupt
so I added polling support drivers/input/touchscreen/edt-ft5x06.c
which I was able to verify using another touchscreen with that
controller but when reading data from the FT5406 on the RPI controller
the data does not make sense.

These panels appear to route the I2C from the FT5406 to a STM32F103
MPU that then provides a different I2C slave interface to the 15pin
connector that I'm connected to. On that I2C interface I see an i2c
slave at 0x45 which is managed by the regulator driver Marek wrote
(drivers/regulator/rpi-panel-attiny-regulator.c) and there is also an
i2c slave at 0x38 which I assumed was the FT5406 but I believe the MPU
is perhaps obfuscating that touch data.

Anyone have any ideas on how to make that touch controller useful?

Best regards,

Tim
