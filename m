Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8606EB1C0AC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 08:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD76710E3A8;
	Wed,  6 Aug 2025 06:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W1mA9WlP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179D910E3AC
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 06:51:19 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3b7886bee77so5261164f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 23:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754463077; x=1755067877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i3ZtOO3KoPZ/I7NSmve3I6N3iSKvHF5Yby7yuHTTKwU=;
 b=W1mA9WlPiB35596PZBuSUEa2BDkV3t/oeMW1Wc/zsKxsYM8B+XYVQozpRCQavvMaaJ
 SreIu/At4vqvOptYbvUnyA/HFZWdGNDVQUpo2Kw9r44du7DWolul3QlkhO0Gru+kArt/
 TuJ1Y4MxQP3k5WVBapUS8poGK+aw+rzsO/6lHVInjVwNau88ou6NVUFRk58Ilj7uSR5+
 T3KS1oe+l7UWYMB903mQGhcB8ywM1O9kRWoBvdUGWLzvBNlZbgtQ94zgN/60yImNaMGY
 358KEpWiqMzEOrmZHrHcBqxZFfj435g1LxKnQboESD4d/XDfKECoWoThaq492JacC/YW
 39mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754463077; x=1755067877;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i3ZtOO3KoPZ/I7NSmve3I6N3iSKvHF5Yby7yuHTTKwU=;
 b=QhMEjleMxt0XSgUJh6Z7IAe4INZpoF3nu+pDVrCIcYDvy62qvzsJCjPzbrNPKnG5tP
 u+6poLiVcnl+lDxgmCeNNsMg3tF7wO7/h9XpqG/YCD6xAcPyZIxoaObCV9313q7zhqrr
 kp3kSRGXMSbzUXsDGwqz0F7NkOmnkITprppRrWlbfvFtuT5leXrF+UAAftWRo6He/q2m
 Epl37U0E2y0mYwqx1ZlJAlxASsjjbJsWE32kPW9gLEZeCCuMsjXqFzG6Njv+A4mETmgg
 vYjf5yZNH+wJTTRNCrcAKcsWHFlKZNQ5KE6FWYEaWTgjUjf5AbfwkRASeqRjGu5JLFWM
 wFkA==
X-Gm-Message-State: AOJu0YyDmy4AMky4IsOsAl7DFJc13uES4linypSVXIYygTskQ5FpOwVw
 ozxLryfFbxX12Fx8i1A/twQ+4yB1vOCqqK7hjkP2BPB1iW4Sy85TBSzLCBTvP1F0hps=
X-Gm-Gg: ASbGncuRi+Fji69Z0njiFxVv/j34FhbdHOxHLJNmkMJ/r+zVzJr1pm8jK4QkyUbDGUZ
 6t+ctpFv+JcpwE3WeD7d79MJOmtISVeJAn8qGu+tuLt5ZfLeNHVxg6vToIsvHcv30ZgXm0riKzo
 5Uw/SG4WVcdGwzZl0iiPpPIKVpWdo6CNqk7MTyr7Ybi0nrqVdaRK5lU6BHU1OHxNnjAwMYT9m6Z
 X/ZqcTp40H17qjQfNAksupS9XvBxxCuzs5bZrwfMmcl1FL+fWSFlG3CrieLof1RLXOCsp1+boY/
 WgGQDq6sfLJ0qLdKxdYtdvY3rATxhp9xahriZFtpYylVRNTEz7PD0fS5HxWKLhUQApgIf8mKeay
 yqQAvkgcoCcb/8RzEjuo96eWSY/HT0XlRMcq33021XzI=
X-Google-Smtp-Source: AGHT+IG5UAFATkP0zvIQx/j+Nr2FUYN6xi4uYKLlr2fwfvsMlDwmnESJC6grlroi3YZEydZFk1FwVQ==
X-Received: by 2002:a5d:5d10:0:b0:3b7:83c0:a9ab with SMTP id
 ffacd0b85a97d-3b8f41bf22cmr1375079f8f.55.1754463077196; 
 Tue, 05 Aug 2025 23:51:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abf33sm21932550f8f.7.2025.08.05.23.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 23:51:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Joseph Guo <qijian.guo@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, victor.liu@nxp.com
In-Reply-To: <20250806-waveshare-v3-0-fd28e01f064f@nxp.com>
References: <20250806-waveshare-v3-0-fd28e01f064f@nxp.com>
Subject: Re: [PATCH v3 0/3] Add support for Waveshare DSI2DPI unit
Message-Id: <175446307628.1715407.12942298107316209335.b4-ty@linaro.org>
Date: Wed, 06 Aug 2025 08:51:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

Hi,

On Wed, 06 Aug 2025 10:33:31 +0900, Joseph Guo wrote:
> This patchset add support for waveshare DSI2DPI unit.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: display: bridge: Add waveshare DSI2DPI unit support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/01048738d6b618fc1dba564b38b3df06b0937eb0
[2/3] dt-bindings: display: panel: Add waveshare DPI panel support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/80b0eb11f8e0a504078c3b405b54cddaf535ff97
[3/3] drm: bridge: Add waveshare DSI2DPI unit driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dbdea37add132a0f5d96006ea01fa73280984b88

-- 
Neil

