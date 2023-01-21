Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6CC676730
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 16:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E169A10E2B4;
	Sat, 21 Jan 2023 15:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC62910E2B4
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 15:36:24 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
 t=1674315380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/TK50vANIeT0VcQuhI0R9JP1NtC98hHehgAPETS4Aik=;
 b=d48CK7Gsqlk9f29ouxtCo7pGt6AhCFUrJtA+xsJUBwULn6foz7n3xEMGka43KJZbYtRD+g
 RhHqONZJ7iV8V0j+SnzZzZelkFE+v2+9XEd6qQDPw/e7V+MHp7v+199CTyIWlfOSzIrwgU
 0iyX8vYaZczdM2cTPA8c43qWA9xpo2M=
From: Rayyan Ansari <rayyan@ansari.sh>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] SimpleDRM: allow configuring physical width and height
Date: Sat, 21 Jan 2023 15:35:42 +0000
Message-Id: <20230121153544.467126-1-rayyan@ansari.sh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, janne@jannau.net,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rayyan Ansari <rayyan@ansari.sh>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

The following patches:
- Add support for configuring the width-mm and height-mm DRM mode
  properties in the SimpleDRM driver via Device Tree
- Document these two new Device Tree properties

This is useful for allowing interfaces such as Phosh to calculate       
proper scaling values.

Changes since RFC:
- Switch to using 32-bit DT property
- Report errors for return values of of_property_read_u32 except -EINVAL
- Calculate default value during probe
- Add documentation

Rayyan Ansari (2):
  drm/simpledrm: Allow physical width and height configuration via DT
  dt-bindings: display: simple-framebuffer: Document physical width and
    height properties

 .../bindings/display/simple-framebuffer.yaml  |  8 +++
 drivers/gpu/drm/tiny/simpledrm.c              | 60 ++++++++++++++++---
 2 files changed, 59 insertions(+), 9 deletions(-)

-- 
2.39.0

