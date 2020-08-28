Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4314B25664B
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D1D6EC01;
	Sat, 29 Aug 2020 09:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2646E48C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 12:04:48 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id z17so189377lfi.12
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgZN5k4zgCgVIKk9yzQ3Co85che7corukCzN/Lkq+a8=;
 b=QXvXzMXdEnokKqwevSzu0gEWkjTHW4COEm6UC6Wq5YMkNWJXwCsv+lznN2OevmqBcH
 5Fa1LOf1jqZt1yiQoqTbxlgfoLsAZ0sXvWOUSggAed0lb+pAyNXLjr8EszRMvZ32Ncxz
 mtw6Po7OKOeOnl8DXF7jEwDSAhremD6Pjk4OMXl/lVkiXqQu6Hn2moGWAyxPkEDd/OFy
 iydvHn/a2dZU4ckQenX3PsNhtRpwFwmAuOIjyRzHG/CTb7HrfB66bGfT3JwFnGhSiaSD
 XWyForvhEtbK55/PL9W8FN5q6YyX7nQYxMC+Ggt17K2Yus82iOqyIQphdxgU2vXIGYE0
 K9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgZN5k4zgCgVIKk9yzQ3Co85che7corukCzN/Lkq+a8=;
 b=r2sHEJcWuyw7mVaGVzd5ixuOicDgh7E1gZN03hrFJjq+NRH+PV6lOjKOvcPvkpfNaA
 PX+E2pA+pfQK1VlNKhEsi8Hw05IndxciXLRNcgOzFlUcMMdW9CJrMR9P1erTJ4IWBJSR
 4ub7I2/TzGXQdpryciWNJQwqZb2S011Wu13BQovXmXQ3ESuBU83gkPp3KufiEmPQn5NK
 63HpB6G343smMjQ3fuLdJ6BzPI51hoaDK2gpdrj09B2loUdHP3W8DQHgtXY1ZVt8NMEf
 K6aZGC4fJ0ND4PuQBRxcbE686XStMSyHaM02OeEdsrZXF7YkOfVOMg4fxGz9TvaNjlAL
 ZPjg==
X-Gm-Message-State: AOAM5301c7YDfgoVCKVnKHqDQWuTjNbIjhn0aTbyuSi1Rq9oCfZX5Bae
 Zgy6duan6EirllGDjn6CorIKRQ==
X-Google-Smtp-Source: ABdhPJxpXVy+9SjKXDpyOHrVUBisCH9EcV0N2jryHo7PSZZb2KX3/RzOYc9U0FIn/icoWkBP/2uIvg==
X-Received: by 2002:a05:6512:370e:: with SMTP id
 z14mr660573lfr.80.1598616286521; 
 Fri, 28 Aug 2020 05:04:46 -0700 (PDT)
Received: from eriador.lan ([188.162.64.62])
 by smtp.gmail.com with ESMTPSA id c4sm163340ljk.70.2020.08.28.05.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 05:04:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/2] Add LT9611UXC DSI to HDMI bridge support
Date: Fri, 28 Aug 2020 15:04:29 +0300
Message-Id: <20200828120431.1636402-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
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


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
