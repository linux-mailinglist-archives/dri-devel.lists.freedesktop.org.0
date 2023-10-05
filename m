Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770257BAB31
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 22:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2765510E49B;
	Thu,  5 Oct 2023 20:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52CD10E485
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 18:57:12 +0000 (UTC)
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
 by mx.skole.hr (mx.skole.hr) with ESMTP id 121AC86354;
 Thu,  5 Oct 2023 20:49:46 +0200 (CEST)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: [PATCH 0/2] Kinetic KTD2801 backlight driver
Date: Thu, 05 Oct 2023 20:49:07 +0200
Message-Id: <20231005-ktd2801-v1-0-43cd85b0629a@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACMFH2UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDAwMT3eySFCMLA0NdgzRjCwvj5CRTyxQDJaDqgqLUtMwKsEnRsbW1AHR
 27kBZAAAA
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=908;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=LpqkI5bhRo1txPdHT0ys9cg1IVCsrmxUIZS243Z8ILA=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlHwVCUJYh2VLQSO5Myp+m5fNJqD4PTQbvVothi
 AmGkBmTWv6JAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZR8FQgAKCRCaEZ6wQi2W
 4dueEACZDRdxUaWWYlZY+Rknw1XSu+yCgB7Tfox6yLRPoqgYweLCuPvAOpOY0yYTa9PMV/MOn4d
 MsMRRWJH++O7Oo66K5074t/VyEKwM7G1+ffjoX5v3HB78PCgTYAbU/9GpTRFECoSwvnsRcozR4j
 lz+h9GlxIx1Mw7UDtKlATTSU0sd5aLGNSARTGp9LScuMRb448I32WvD3OsktEx8QbqhEK4B70uA
 WReSl2pkSpAqb9YE+QShlivJqbNSCAVBuHrvg9AkzDe9bBMz9qPvZ+ttJED2lge4FJqlleaX3S4
 EY9I39kknu2DTEa8qx1bPNezGzp3h6Tz4PWwbJUkSQZEo1iPKJ3OssOtVeJpITpZxmxfYHDKZnu
 yYdqtZO9cZHnybdMZnIfIfv645z8ShFZb2icufDQNYSU7v1ov0IAgHknjPmow8ulgEPyka9hNmx
 ScmSsrCTeo4sgdrsin88nbdGBaHmcUUCOaqtyKzLp9FnH/HQTosQZ+oELdF5RvQKOAZ+M72HiDt
 EuLpQlBTdAbxry/51omAooMsVLQYWoBt6h1sMhnOYSCZCUXRFne9k6B0NjSBQQ3gYaD3Tmlc/4v
 dzHIam48fHomZrUb61VQaOCJjZ+vLHdxvq/2pyg+mLXHi9bkSU248JcHoQ5TUzaFgvOpNbrOyu5
 K7B4+oZXOoN8f5A==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Mailman-Approved-At: Thu, 05 Oct 2023 20:01:19 +0000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Karel Balej <balejk@matfyz.cz>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This small series adds a driver for the Kinetic KTD2801 backlight IC.
The driver has been tested on the samsung,coreprimevelte for which
support is still out-of-tree.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
Duje Mihanović (2):
      dt-bindings: backlight: add Kinetic KTD2801 binding
      backlight: Add Kinetic KTD2801 driver

 .../bindings/leds/backlight/kinetic,ktd2801.yaml   |  46 +++++++
 MAINTAINERS                                        |   6 +
 drivers/video/backlight/Kconfig                    |   7 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/ktd2801-backlight.c        | 151 +++++++++++++++++++++
 5 files changed, 211 insertions(+)
---
base-commit: 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
change-id: 20231004-ktd2801-0f3883cb59d0

Best regards,
-- 
Duje Mihanović <duje.mihanovic@skole.hr>


