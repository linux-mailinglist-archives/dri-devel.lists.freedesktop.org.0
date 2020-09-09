Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 242ED263E9D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876A76E25C;
	Thu, 10 Sep 2020 07:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5189C6EDA3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 09:28:31 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id x77so1243259lfa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 02:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MunoKbh/mt3H7lKJf79ktTfGntL6Z6LhfrQgiCHvIt0=;
 b=xYrRG15tBl3EKH48BODgSIXjSHK9GvhyCOHe98qe0iEPpBdwOu0PETaA4pgHWzJBBz
 mg3y5T3/xWTmCJ7Nona7QJzkKZys+nNojYOdussbzaEf3He8duDodk6+W82MeWu52xBH
 eeWoAn8la8U7AbWQArldO9G5zW91jXUJazs7jAaU7vFmtWrf2TPixkJeZz+uOrGDknpY
 ssw6O+bHoEjdDlUc1yCDsKW4SOmT/KdyXExA1e+cSRsf5sjUV/n80irrIfWUtMgnJZPv
 MJcunv4r9FjXYIc1ri1T63cGJfzyF3vBdsHZgR6O/poWKwiKTJSck35f2s+zedKfqmBL
 WU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MunoKbh/mt3H7lKJf79ktTfGntL6Z6LhfrQgiCHvIt0=;
 b=NdXNdOM0QbpZl9lr7StdJkFindxyY9wMYiUanZ/Y2/us/O0Vb3+tipnPngfZA1xS7M
 fKg6Lt6LEOt2/Rd24SPXeGGnOXxdYbm6C02K0jn7vW9rkIw+ljww5U1LfCJNKZAdADjw
 vTvMLGZKdOZtbaf+x9VmSM+iL90UspurXJ+Mkhs4zKs+Dcrjgeqb5BriEj7wl9OWdY8r
 xeJxFJT3X7WJYNwTdKdrGV1vhzsnQ8NMoTHyzQMLyEK2LIgUUGggbERX5C6ZkKEyQlBm
 Ix+HusiLOlJkz93xZOcL6cy06utCjxaspqxq2lY50ETs9VMA/kJsBO4JJf+Agnrn7eLo
 mRVA==
X-Gm-Message-State: AOAM533ocKELGvons/zpazsvTSFfP7obZ/I3vjQlqbgeIsuqlD4b5iZV
 tOyFytHEtsrT8ypey3LeDcgYnQ==
X-Google-Smtp-Source: ABdhPJyicE9PL6knTzn66V6urc6P++oQ12ZB7nsNSQ4c6++ZUi7LuVSJu+yJNh+4T8Ela5lSm+wg2w==
X-Received: by 2002:a19:8386:: with SMTP id f128mr1552340lfd.78.1599643709402; 
 Wed, 09 Sep 2020 02:28:29 -0700 (PDT)
Received: from eriador.lan ([188.162.64.180])
 by smtp.gmail.com with ESMTPSA id s8sm595870ljo.11.2020.09.09.02.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 02:28:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/2] Add LT9611UXC DSI to HDMI bridge support
Date: Wed,  9 Sep 2020 12:28:21 +0300
Message-Id: <20200909092823.64810-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:22:25 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <a.hajda@samsung.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series adds support for Lontium LT9611UXC bridge chip which takes
MIPI DSI as input and provides HDMI signal as output.

The chip can be found in Qualcomm RB5 platform [1], [2].

[1] https://www.qualcomm.com/products/qualcomm-robotics-rb5-platform
[2] https://www.thundercomm.com/app_en/product/1590131656070623

Changes since v2:
 - Squashed connector support into main patch
 - Added comment on modes table
 - Dropped display timings support, covered by EDID
 - Dropped sleep mode support
 - Dropped hpd_status reading from ISR handler
 - Added "sentinel" comments to empty table entries

Changes since v1:
 - Fix whitespaces/indentation
 - Support working without DRM_BRIDGE_ATTACH_NO_CONNECTOR


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
