Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA07AEE2F8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9820E10E49B;
	Mon, 30 Jun 2025 15:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ge1rLjx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8520C10E49B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:44:54 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so15491235e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751298293; x=1751903093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KVCH2kt0v6xCHof8XjdoacFaxm9PvIMlt/I0pFMFj34=;
 b=Ge1rLjx4L+zMVhXDx36hnIkCQxV5e3G2WKBTgBR7APY+orUHEhBSsk/J79PHtCKrFB
 o26EVan1Xk0EDw8ZtZN7+ayUAie7NoQDdKo5fS6ofW4RBUdTTotbVgKUIDYsoe3kDWBo
 5KzBzAGXUsuh7m7Mw/nIgdJ4Pzdwb9AfpfS+7XtBCGl0FREpeKdpxaPXqnyLA4Imbo1W
 SUWNbVOzRMKhcaCqWjJgQaVjMkLmq9/f59ALpIqiLmTwaDXpD4oVIGnSLHSAxUUSYVHr
 g8mfYFeB8X0hO0rOcMLX6p3IDA5qBaNdhqkUeIjabTBdgqxZCTQqTX9VhI/hJUsnHagB
 TNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751298293; x=1751903093;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KVCH2kt0v6xCHof8XjdoacFaxm9PvIMlt/I0pFMFj34=;
 b=H356SN83saT0cCHEHU/QMG/iWVEVptSiUm60rKvGnFO93s4mxpQdC+p8y9T+RGM3Pg
 ryuCybxOk8DtfSnoqIK3Qt+TLo127j8KRDlcKPpfP2cc5kC3LzbecakZiCtC8cUsTJSn
 En7+0yOWIGW1lFhFyTO5cgZH3vNocttxFWSvlBw6rxx2geHcLtMwRXqGEbi/SrLCkyDP
 M1xd9fHgGDMaChx7l+o24f2NmR8KFjY7p9zn6dSBNPOOSXt8e482bYAs+4+LhKhHQpRb
 rgcUeIjuhl9r/2DzDh3tnQEeFjET1GBQfdAS4kmdcWHKQ2zf9OIdo6fvOPnF8EhLmMYf
 MjHQ==
X-Gm-Message-State: AOJu0YzIm567BwtUXBE+/td/QkwxKGrUesi106VJZ+ZgGkN1BJuCjmEZ
 x+6VWIs8HJbwqA0toDiC7tVfjhz2toV/Ec5FWljknPjJMg2rGvQcY8ebcvD3tw1QEd0=
X-Gm-Gg: ASbGncv4IjK1RDgL7CyHti0qcB2RUSRLHXQKg+vKK3Y1aEM7uMswrZonzu5TH5ESIJp
 TX6jF/xNHeq/aQ4OPFpph+CIY0EpSJjpI1bHrEL3ChB4s4abKc0r/uFp8FE5AVR75pqK6phmi/J
 gMXyPJK+9MRDHsbuNKOk4jpxAmoXgVT2VpU5kMO4Ei4Y/ijfdx0P1ogbkTk6z5CbeSCgM70KemG
 x2H0dVYuJ2rLlIPsmVo8WbTo3vFLWmVAKZMgYcKnMq0EX16oI/gxn76Td4seHN/+Fp/O4WGOsBX
 0z1N8X7H/SGshKSRJwrnFYnQi+McRy1JL2DeOf9qNnOkBWz9hFvkGiXVP3xEmdr80muIGs4rAET
 D3coSFec=
X-Google-Smtp-Source: AGHT+IEA+TkFS/ZHvVhFMPYel2yYQlHnVZL0fDsZXO6GvDRs+ebjwQjd6yPvqRN0VHQci/TgccoeYA==
X-Received: by 2002:a05:6000:2103:b0:3a4:f70d:8673 with SMTP id
 ffacd0b85a97d-3a8fdff4360mr8919019f8f.25.1751298293085; 
 Mon, 30 Jun 2025 08:44:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e7524sm10834062f8f.12.2025.06.30.08.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 08:44:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20250220-panel_prev_first-v1-1-b9e787825a1a@linaro.org>
References: <20250220-panel_prev_first-v1-1-b9e787825a1a@linaro.org>
Subject: Re: [PATCH] drm/bridge: panel: move prepare_prev_first handling to
 drm_panel_bridge_add_typed
Message-Id: <175129829220.2307732.2489809206567748662.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 17:44:52 +0200
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

On Thu, 20 Feb 2025 17:07:26 +0200, Dmitry Baryshkov wrote:
> The commit 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to
> drm_panel") and commit 0974687a19c3 ("drm/bridge: panel: Set
> pre_enable_prev_first from drmm_panel_bridge_add") added handling of
> panel's prepare_prev_first to devm_panel_bridge_add() and
> drmm_panel_bridge_add(). However if the driver calls
> drm_panel_bridge_add_typed() directly, then the flag won't be handled
> and thus the drm_bridge.pre_enable_prev_first will not be set.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/bridge: panel: move prepare_prev_first handling to drm_panel_bridge_add_typed
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/eb028cd884e1b0976ff8c5944ee6650fe3ed0a6c

-- 
Neil

