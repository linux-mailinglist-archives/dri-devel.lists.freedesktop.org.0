Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBDDA4E657
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 17:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0E510E7A5;
	Tue,  4 Mar 2025 16:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HvPcDH3O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EDB10E7A5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 16:41:06 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (unknown [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 3ACBA40CF122
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:41:05 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6hFt4FQgzG3s5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:38:42 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id D605642742; Tue,  4 Mar 2025 19:38:25 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=gmail.com header.i=@gmail.com header.b=HvPcDH3O
X-Envelope-From: <linux-kernel+bounces-541666-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=gmail.com header.i=@gmail.com header.b=HvPcDH3O
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
 by le2 (Postfix) with ESMTP id E43FD42161
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 15:09:41 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
 by fgw2.itu.edu.tr (Postfix) with SMTP id 77D962DCDE
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 15:09:41 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEF093AD8D0
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE1120E308;
 Mon,  3 Mar 2025 12:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HvPcDH3O"
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBF720E6E3;
 Mon,  3 Mar 2025 12:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=209.85.167.48
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1741003516; cv=none;
 b=twetprlRBFWPaGuuAipOsP/oS2jxk/MKw4yjJ2BrbSJ0p43m4dlPQPgZ2zHThoORRaIiznJETH8Twn1uTH31xoJvewxlPtMPMAOcaJ63ubqF2ptjJgA1h4fKoQKvLCBsQLLiQ1P4fPBQZDucKujPmzGUVfcq+SaJPYUbzOLIWxQ=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1741003516; c=relaxed/simple;
 bh=rZikCDv8fD+Rzkk4RfVp7aDtd/aBZpILIsTNbD23F+c=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version;
 b=N3X9uQA09soplQ2FNaaQ2cIUDFN7LH1hKd5qjED4SxUzWbXycL0ztyrnBVcW02NKQYfElyZrVU70bUQFC5iavrIbf1zGGdMHZM9eCHmrVtBFqNoSI5U/0dnWA+qpU9sQiUd9Uh+uqu19YIph6sivGAJXb2Cyf0scaeBPlA8dcus=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com;
 spf=pass smtp.mailfrom=gmail.com;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b=HvPcDH3O; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-549681574e0so942120e87.2; 
 Mon, 03 Mar 2025 04:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741003513; x=1741608313; darn=vger.kernel.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q34w3RqR0dtKEGKyYXofcB2jlNCM2LrnhrF1NCKpgfo=;
 b=HvPcDH3OFQLIiIC/DYfgIeLrzobEl2Gfi/Kdzk+aaRL1u6hLhZAGKIjjI9DQ1tYANb
 lqQKDdqtViyg6Zrl74/trRYTS8Y4debt8xSCLr7OT+WTfwtC39H1O3XYy+a0GM+GWJk7
 r3PZ7KXodN9aWcY+4S97zOoJJRWQgiElK4sT619Zxq4ZvI6y7p8hxsZIHuVZzis11l0t
 2wtSbTWcpfPsuTTgVIJhNz9fqSmpyFQ8/HAO6V0kIED3TLjs9b/UzaNj6qrHzQFA+Q2F
 Iuuv3XMp+ozHDIOktJm1cMre7Ov1gXwq8JaPD+PUuYLeEDvR4LZWYIx60a1yZ736+i2q
 /yUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741003513; x=1741608313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q34w3RqR0dtKEGKyYXofcB2jlNCM2LrnhrF1NCKpgfo=;
 b=ne8KSlStG3+EYrQvApZViH57fs5r1V5RJNynC/0Qop9D2KorBerj9VMOE09IknCkK6
 /U9OQaeaAE6zgzjsINvIm2OJHFhxsORh7XcOhKXwJv3rS4u+wR2l5Jhime79j6iSa3I2
 0CNZeyC/f+WZXHHqnkGLn2JDFtjZLd0s/F9XUJ8pqyeoZ1nix2snmWLdghoHwqzbuIon
 L+wQmCqlzQxrmxEQH7upIfLphBn/nEeLuoZIwFcxnf6NpFmEZXTXyoyjCcnopvvfEfZ6
 +SOEj5ht4DXxkAkKU6uOvqZ3bCDE+L0ETgGIO76S/fRZ0PKxfHn5qekhS4vwMnttgCpD
 u7zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6u7GNiDw8rasbrpjh2wQznUusm2xQJpSFzVxi+BOG4/MwP04qLST9XeJVGBASzNSd097zyD3ae8dwTQD9@vger.kernel.org,
 AJvYcCX0N3O1WGvoYD/wWwCEi/ojAE/JzOrW+nmotDYk8hQptHVLesq9LHt93GZ/Ta+7v24Ps+/ZwkhNuc4T@vger.kernel.org
X-Gm-Message-State: AOJu0YxGJ0i16bTox1/1TEOJJ9zWvSl8upF/814OPBx5ZAbj30vHyfI3
 td+oG+tN2C0UJs72ddVaLBzg6cHzvpoAgwKc8gue0d6ZfuQwXCeO
X-Gm-Gg: ASbGnctmB67srvEPskvoNtlLncXGgzHMOj5VJWm3YZDWhyChionGyOhPquiGkx4uAfP
 4jV8gf+25OYRxZ0iBpG1qKfYgWlfz+DFIZGUo6fhQKr2YmsEc6wcquvSo0pu+xwIWT+fqMeeo27
 PBzIHycrCFEc015Mq3LyUmXP2kjTfaL7Di5dlZ5OZAJiAO5o9j4ZlCzf0hRQ6V6FjITAsmSvEf0
 74uIjNGAHbmOnfHdL8uqH/wljfjEC7qyIhQq86rQCeS3MqYpVR+0AYidPj5DXwe5CsMs72cKHrF
 2uHFhxrNOVDzExgoYYBFp9z6JsuqjCBV1w0/
X-Google-Smtp-Source: AGHT+IEhfdZku8NOEKgVtX1J/L1drONSMhC8CpobtnAojuGdq2AZu/OuExshcU+3+lZ+0K5xE2WVow==
X-Received: by 2002:a05:6512:1292:b0:545:c5f:8551 with SMTP id
 2adb3069b0e04-5494c3517b6mr5624203e87.35.1741003512681; 
 Mon, 03 Mar 2025 04:05:12 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549576b88d9sm869095e87.12.2025.03.03.04.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 04:05:12 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: display: extend the simple bridge with
 MStar TSUMU88ADT3-LF-1
Date: Mon,  3 Mar 2025 14:04:54 +0200
Message-ID: <20250303120455.90156-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303120455.90156-1-clamor95@gmail.com>
References: <20250303120455.90156-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6hFt4FQgzG3s5
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741711167.48222@8ERxyTGN3ujWe+aIoQMqmg
X-ITU-MailScanner-SpamCheck: not spam
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

A simple bridge used in ASUS Transformer AiO P1801-T.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
---
 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-brid=
ge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.=
yaml
index 43cf4df9811a..441e5e5b27c8 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - adi,adv7123
           - dumb-vga-dac
+          - mstar,tsumu88adt3-lf-1
           - ti,opa362
           - ti,ths8134
           - ti,ths8135
--=20
2.43.0


