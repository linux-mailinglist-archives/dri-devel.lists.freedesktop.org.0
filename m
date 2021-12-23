Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3285A47ED31
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 09:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFC510E423;
	Fri, 24 Dec 2021 08:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050::465:102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404B210E147
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 12:34:45 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:4:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4JKTsZ714bzQjf1;
 Thu, 23 Dec 2021 13:24:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1640262288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=aKcMJ+j2oyWpNwagklOb+qQvqMvdN8cr0o6AoVgyaHc=;
 b=MuD5cR/m8AYNiIEcP9IXw2JpBwT+zbjuYta36LHUX0URRpgUQ5RCil8wWakye1peNQmbMq
 MXijqQEF1vdSOE087O6S0m70mX2q5mXewA9SRziyMTBEmKxlZD2Rs9xZeWLeeFLeepAr6B
 1jiRlatxkFDkgfFH7rH1rUWiO0cuv3ANVoZtONocGzAQWArchRPmFpaUUNEXy77yuq4Vt8
 mmpYvCZIOaVgpNegNlY5sQGvCU3IJndlKDyU0G/QiyAfs/RYU/tOjf8ZSgCRXbBLoYV+8S
 ovhYqnkR81t2YlBipaW1/I0DRAgDkbtbLXcP+1QOgLggwaNwtjow2kQPBQcr1w==
From: Alexander Stein <alexander.stein@mailbox.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/3] More amlogic sound-name-prefix DT fixes
Date: Thu, 23 Dec 2021 13:24:31 +0100
Message-Id: <20211223122434.39378-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Dec 2021 08:28:15 +0000
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
Cc: Alexander Stein <alexander.stein@mailbox.org>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following up [1] here are more fix for missing sound-name-prefix properties in
the arch/arm64/boot/dts/amlogic/ subtree.

[1] https://www.spinics.net/lists/devicetree/msg466125.html

Alexander Stein (3):
  dt-bindings: display: meson-dw-hdmi: add missing sound-name-prefix
    property
  ASoC: dt-bindings: spdif-dit: add missing sound-name-prefix property
  ASoC: dt-bindings: aiu: spdif-dit: add missing sound-name-prefix
    property

 .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml   | 5 +++++
 Documentation/devicetree/bindings/sound/amlogic,aiu.yaml     | 5 +++++
 Documentation/devicetree/bindings/sound/linux,spdif-dit.yaml | 5 +++++
 3 files changed, 15 insertions(+)

-- 
2.34.1

