Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F63B47818
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7546B10E413;
	Sat,  6 Sep 2025 22:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Iyu7Xa06";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3789410E096
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 00:22:36 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5608bfae95eso418278e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 17:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756945354; x=1757550154; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cRvY1i3eeK8uU5EXQ8tuV00NMUEY0gXTuGA41ZnQTAo=;
 b=Iyu7Xa06SbbqABRWVZNNhciw/2uel1dDdSdjH2SADyUxxm/G94ewTSed26aC9XouUc
 ToIEAsrgyauGgbKPszfdC3bG0SG3BOFB0s3B0jGm0utMXL3IeDYtYCnIwH6Q3DILf/xk
 oQ7te5v4KLCoRItG/msB9T9Xu1uXKPNjWxwFiQibRyyd7dWZsOltFYltdNKurErVN4Kx
 hkh2EfrL0SOHj87Mmz3dNmWXuQnWQAm3ehi2i9o/+u5aOKj62co9KFP6eRsAs5dMsb7p
 9uCfSUjLmabtphGbIeTRDpLHW2/gWIMSRz11ACzsMS6l8yZiqkZ9x27LdQuXt2Wzbssm
 hi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756945354; x=1757550154;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cRvY1i3eeK8uU5EXQ8tuV00NMUEY0gXTuGA41ZnQTAo=;
 b=fT1LmZS4smMEjhToE5VbuSxV54GhvrRi1oEvmRL4xWOBmJrS3oIb3dnbrexlm52dWz
 md+/8HbcNeM7unFqnMbLoJm9ry4kItDrXMP2pgGikJfTTNPH0INX3aRh9UR69oTMfAE1
 Jh6GIwbgQPytzwH+EbD0RKhtLJrpVdmz8WuS4BDkHNS+3q9tBgdoGmB3gIPrTdLvfP9w
 ODgBUgD+ZCzX9LlysRoMSI8lkym9X2a7wLPRjixz2lO+vUClGp8bwHYlgqEGyS0GlC2D
 L08QppRYuvgr1CWVvHYhmgxekm/ixLTV5bCcPfxp14fBFS/E+MWsDfvwI2x/zbqAtWVx
 f7pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtY3GFPURxsFe4uptkEjZ672dn7nCsGmNkAKbZ6VP8V2bLuSKeagQyXC8Rx2VI0EiIjmo9Ebgjyig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXfa/SAtQ0euQmbk40i6Ns91vOpy6c5rRYd9unHxDTINropN18
 I+nOrniRfwP4sCZIKAdNX7JJj+/Yi3HmF0YTKtpn10N4qrgXTdXLdjBK
X-Gm-Gg: ASbGnctoMPC6Ndh8JqvuUj8mgCpbG3Y7hiBPYPYx2q1LjhRMKjg1cALRFr69pubKWeL
 hlC7JMBAtHlD2yr7yzcbsmSkbn4iorBrOpryCkSBrhZySKHyAGpMl5sAS9HA1NqbM2c7iTR4GdD
 YrKgoF6b6qdsBPUdZqJYmgZQhWcpfKvZDjymwoUJWSeuJoqmnEcd+r9BMdEW+La44xbOE14V15S
 pd2vvkJkFneCkjFyVCm6XNWAOXnDXrQNjyVCqDnoAN7vvEM5hi/jfFOUs9ZR9i3itXGC25/cOah
 iSqO0M9JWlinr31Bqng0HO4xOT32+zwmtdvj3TyPepXyqe1PYq/yqG7jsUHLxvmxn4Cz4hnZ6WD
 WcAdkCNB4TCyO40F2HrsA087A04mXoD0hBlO8Whxs+Pu8WGwYHE0Q9Q==
X-Google-Smtp-Source: AGHT+IGQYJrReh76jTMJs2xkORkCKN7mTZ3yHyfY6cgCRALHPcO7cHaChEQ2cH2SUktxRValZPoV5Q==
X-Received: by 2002:a05:6512:2313:b0:55f:46cd:2c88 with SMTP id
 2adb3069b0e04-55f708a2c31mr5338174e87.9.1756945354277; 
 Wed, 03 Sep 2025 17:22:34 -0700 (PDT)
Received: from vovchkir.localdomain ([95.161.221.106])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-5608ab8e95bsm821613e87.34.2025.09.03.17.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 17:22:33 -0700 (PDT)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: vovchkir@gmail.com
Subject: [PATCH 0/2] support for xr109ai2t panel
Date: Thu,  4 Sep 2025 03:22:30 +0300
Message-Id: <20250904002232.322218-1-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

Hello!

This adds support for the STARRY XR109IA2T panel based on the hx83102 chip

Thanks

Vladimir Yakovlev (2):
  dt-bindings: display: panel: Add compatible for STARRY xr109ai2t
  drm/panel: himax-hx83102: add panel starry xr109ia2t

 .../bindings/display/panel/himax,hx83102.yaml |   2 +
 drivers/gpu/drm/panel/panel-himax-hx83102.c   | 193 ++++++++++++++++++
 2 files changed, 195 insertions(+)

-- 
2.34.1

