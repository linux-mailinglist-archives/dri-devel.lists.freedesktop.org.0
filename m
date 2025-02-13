Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C637A340E8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 14:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC44F10EAAB;
	Thu, 13 Feb 2025 13:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fi3PP4N3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8409410E3EA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 13:56:39 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-545039b6a67so818130e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 05:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739454998; x=1740059798; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F1KTfs4zph4boLY7TuCFGSOcu6RxZyj8ziUa/3XCpMM=;
 b=fi3PP4N39mw9Ud3ttpkEtNjdZfC4n3GyFdI8SMIpLWFOAOoh+vDT039Cx+wcfUf+gl
 MKhi5HAX/BZKhQ3INF3QkCOUxf3gj3cOUkzLCQ3HDe3Nd8e+yONgWvd/tOQzOOLhVRNT
 S5A0Y4Fsb7bAKzah/Hcvnu0QsTRp7IbZ2m2ZzTszwhUZ/X8RnJP65Q+i16XxwiWQMy7U
 ljDEH58nJsOMOUbvMPh51iNXL1FMEWZ28DJWI4VfCsU1ZpcMbt05NMrhpHssjIR7uVa9
 TNULeuxzu1bmahx4w234kFTtoDWYyO9YBpPpDiFo+bFJ2EjZEcW4TWBa4AyQY26Db6tV
 RdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739454998; x=1740059798;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F1KTfs4zph4boLY7TuCFGSOcu6RxZyj8ziUa/3XCpMM=;
 b=GEgeFuvHuyT0l8YdjVk9XOVws/2hxyCI/lTnlGAT2Yl93YJenS7IuxnbKCSCz7frNy
 lpWU9YaufMyO1IXso9BMKIPCjOzaMQfajFp9eOYkSTXlXu6Y/797+NPcsrITqBISz4SM
 8X4HYbKygFqgTgkyAaLvxOSqP9LIyMzY7ztgYSsKZvjYO71WzSos5usWbbQXQhKSZVpm
 JSbPn0yy+s8t1mnxdkYFTH+UfeTLCEj0+JVZaNFWiljiK3ycR68b+KOHfoNYwo3uJepk
 qPIsY0dErkzyqax/yRJkY8jYt0NDVQsMWVTQAKfzayEeEku4p0g5Ykw84BKEfwqq4N8+
 RmGA==
X-Gm-Message-State: AOJu0YyC4biSer8a6egbuwyJ4I4f6TK+Cr7VL8ranNktJeZge70wPsM/
 ne9kL6zrLSVhIEnNEpSeSTqNwB0SGaZA70SZyHDCK05f3abZyVs5+LT3cw==
X-Gm-Gg: ASbGnctHJ0ghFA+T4NKhIPxtphMuqrejImTQnBBG5EfMFlaqyUnoVpgWcTtRJHy5ifX
 71IcPtwYWisW3GATNNEiF3JZ5KRnFqK7h44YE0tG26qmK25dhWpbFk7QB/G9adAxQikrvjsgaRU
 O3IP4ZV904281U41TFsuZwrU56BBcVR31ikhtzebS/Go6p8Q9C0BENzNO1uUiJAi4ZCoCuF5Nl5
 3fks3uMhmAoDSeJdSjgVAsXA6jkcsKr4Wlhj1mEcP0feNjklGVsOaGa5MbHzijlBG/yRjqTaSoi
 zM56zQ==
X-Google-Smtp-Source: AGHT+IFzn93+hkoIo0080/fkr4FMQnCQ6x8hN8CmqeZ02jdczjAd+3TQlbCPIkNbBfAC00Fw+FGzJQ==
X-Received: by 2002:a05:6512:b97:b0:545:2300:9256 with SMTP id
 2adb3069b0e04-54523009450mr123450e87.12.1739454997305; 
 Thu, 13 Feb 2025 05:56:37 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f105cdcsm177789e87.116.2025.02.13.05.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 05:56:36 -0800 (PST)
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
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
Date: Thu, 13 Feb 2025 15:56:03 +0200
Message-ID: <20250213135605.157650-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Solomon SSD2825 is a RGB to MIPI DSI bridge used in LG Optimus 4D P880
and LG Optimus Vu P895

Svyatoslav Ryhel (2):
  dt-bindings: display: bridge: Document Solomon SSD2825
  drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge

 .../display/bridge/solomon,ssd2825.yaml       | 140 ++++
 drivers/gpu/drm/bridge/Kconfig                |  13 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ssd2825.c              | 741 ++++++++++++++++++
 4 files changed, 895 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
 create mode 100644 drivers/gpu/drm/bridge/ssd2825.c

-- 
2.43.0

