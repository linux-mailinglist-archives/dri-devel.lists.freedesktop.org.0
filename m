Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41070241DCD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 18:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2186E5B6;
	Tue, 11 Aug 2020 16:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pp2024.ppsmtp.net (pp2024.ppsmtp.net [132.145.227.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9846E5B6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 16:06:08 +0000 (UTC)
Received: from pps.filterd (pp2024.ppsmtp.internal [127.0.0.1])
 by pp2024.ppsmtp.internal (8.16.0.42/8.16.0.42) with SMTP id 07BG4HSM032190;
 Tue, 11 Aug 2020 18:06:07 +0200
Received: from exchange.systecgmbh.local ([81.173.215.30])
 by pp2024.ppsmtp.internal with ESMTP id 32shx5st11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Aug 2020 18:06:07 +0200
Received: from exchange.systecgmbh.local (10.0.1.54) by exchange (10.0.1.54)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1713.5; Tue, 11 Aug
 2020 18:06:06 +0200
Received: from exchange.systecgmbh.local ([fe80::5086:b331:10c9:2db1]) by
 exchange.systecgmbh.local ([fe80::d829:29c0:9f1d:4a8e%7]) with mapi id
 15.01.1713.009; Tue, 11 Aug 2020 18:06:06 +0200
From: Stefan Birkholz <Birkholz@systecnet.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: AW: imx-drm: master bind failed: -517 with parallel_display (on
 i.MX6DL)
Thread-Topic: imx-drm: master bind failed: -517 with parallel_display (on
 i.MX6DL)
Thread-Index: AdZv7KKvurew1forSlCr+ylhpmkNJf//8vGA///a6mA=
Date: Tue, 11 Aug 2020 16:06:06 +0000
Message-ID: <3455f5795042454680dd54875e8524d4@systecnet.com>
References: <f25a430a491c46a9bacef9f62c3c2129@systecnet.com>
 <6b8c0ccaec3b890faef85ecb8b694badf6bc1dde.camel@pengutronix.de>
In-Reply-To: <6b8c0ccaec3b890faef85ecb8b694badf6bc1dde.camel@pengutronix.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.3.109]
MIME-Version: 1.0
X-Proofpoint-ID: SID=32shx5st11 QID=32shx5st11-1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-11_15:2020-08-11,
 2020-08-11 signatures=0
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the working system I get:
[    3.359749] pwm-backlight backlight: Linked as a consumer to regulator.7
[    8.789867] panel-lvds panel: Linked as a consumer to regulator.8

Non-working:
[    3.362822] pwm-backlight backlight: Linked as a consumer to regulator.7
[    3.362907] pwm-backlight backlight: Dropping the link to regulator.7
[    5.441029] pwm-backlight backlight: Linked as a consumer to regulator.7
[    5.447941] pwm-backlight backlight: Dropping the link to regulator.7
...
[    8.810651] panel-lvds panel: Linked as a consumer to regulator.8
[    8.816878] panel-lvds panel: Dropping the link to regulator.8
[    8.976370] panel-lvds panel: Linked as a consumer to regulator.8
[    9.063164] panel-lvds panel: Dropping the link to regulator.8
[    9.208480] panel-lvds panel: Linked as a consumer to regulator.8
[    9.214729] panel-lvds panel: Dropping the link to regulator.8

You are right, I didn't notice that before! Thank you for having a look!

Regards,
 Stefan



On Tue, 2020-08-11 at 14:50 +0000, Stefan Birkholz wrote:
> Hello,
> 
> we are using the mainline kernel (currently on 4.19.128) successfully on an i.MX6DL-based system, but when we try to upgrade to any more recent kernel (>5.1) the display output stops working (screen is blank, backlight works). 
> 
> The relevant entries from the kernel log seem to be:
> [    8.954942] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops imx_drm_exit [imxdrm])
> [    9.028406] imx-drm display-subsystem: failed to bind disp0 (ops imx_pd_ops [parallel_display]): -517
> [    9.037873] imx-drm display-subsystem: master bind failed: -517

The only call in imx_pd_bind() I would expect to return -EPROBE_DEFER is drm_of_find_panel_or_bridge(), maybe parallel-display node's port@1 is connected to a panel that is not registered. Are the drivers for the panel and all its dependencies (power supply regulator, backlight) enabled and probed?

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
