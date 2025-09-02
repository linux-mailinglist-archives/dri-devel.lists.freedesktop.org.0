Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75390B3F58F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 08:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47BB10E037;
	Tue,  2 Sep 2025 06:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bV3aDQ0c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38AD10E037
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:33:49 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3cef6debedcso2150732f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 23:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756794828; x=1757399628; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=amLWctIAuH5+/Kdk4fBpM4tmLqupAEviAibXHUsY0lc=;
 b=bV3aDQ0cAvrxRbiEGt1pPKKCX5nTPnOKR/XL7Xd3CQ1NQvjCj5IfCtxtEgSIJinrJ5
 Pg/kPmcrueW4C2bctEk64A4q13dOknoR9rxTCeUWqjQQ2liwnZ6JqPCEvU86i8HFPTd1
 /22KCkwk2y0BDaKnK8Nj50eDu3lwGsDNCbqY7y0yhqRfshWe8tBUiL0mp9VEIqgWYKKR
 zbZtyK/RiBsWe7njja1ahcaSTDQLI9N3pYEmxMJr2JX9Qu5e7fwp/jCW9dLHlLXqv4Dn
 y9TSpReKee/lxfsc19dJpe451PoURDNs2mcGXw8mPLDRurFyYl+YM9pHilalqRSDEum7
 1eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756794828; x=1757399628;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=amLWctIAuH5+/Kdk4fBpM4tmLqupAEviAibXHUsY0lc=;
 b=OPZ/suppk4qcqVYrmXvVoZe21gSNkxvK4nK3oisOviuq5WypmDo97I6EkEbP+M1HZU
 9ELWJlLjUMt15Uh0ZDAhtsrQzzWbOeh+jubGuafVdpIx8VnmvD2jy7M5NCPek9ScEtsZ
 FZmbJrwtXQRdeF48YUVjTLoBfHkKeg7Oumg4DicivgYVfUp3ViewoYlaU8+aQs5r2DLP
 IWF73jaVsjDEt2zkfDVS6jWMXhgBS4HlUz+xJ252+TGl1byLoBcsmrOrTrUHogXAUgLg
 ZV7nzGJJx+wcbg08qdJQplzDNsKTt0cq8vLJpNIoEYtglj+47VutOsLjZDB73HBg2ONU
 mP+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjlj7+q0iCgmMQPFLiKCaOecmZ5KebIuy7x5DI/gdYISkIR5pxuTY5XQnS1xxdaTfoU4fAfY+5CM8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzczkUyUnOvtVnVsgHU0PR2aKU7A7CgrBL43CCMVPsi9HWzBmdS
 ywyI2iMviBi/7d3l9x/jSH+ujuLVRg4wo7+3cacc0Ji2AA3GpP88rsRGYjczwuaBvZg=
X-Gm-Gg: ASbGncu8AGVfHWZDASbk8WPZmo0Q6zA9qDl4jP/cKR8tvK8FFVZ1k92VtHaZTy90N6b
 RFadYMvcSxD2rT4sjvIriQU1K5ESnjOyqA48Tvfh7dJWXFevNdn4chr4usSa2VZ9usFzr5icp+u
 eBD05TK48et1h8s2GdC31P50OeZpM5bsbtA7cA1jbd0KK7gWgxVt/gblStZEN5Iky4mVNrZcEQO
 1sY5zCyYDqOJUmEzOr9ZWuK3QxZUpMh0CA1RFGmyDf6nOXBrDKLJxPCvKbukkLp01ArovDV6vpB
 jdpVLJX6ZS20mcrpXn9Lh4nqGwpDbWigYr8h/9HtPan1HnVb1CGlOpjQNk898Qtxgi7Dad+T8f5
 wtDPToyn1CfME7B/RPMza6HV+QUQ=
X-Google-Smtp-Source: AGHT+IHTaBzwQXFABXTkZLj+3H8VXua+1cr4mYcGe2aPMJa4T/6ZSD/WOz5v96oWEJ77tcsJ6WdpaQ==
X-Received: by 2002:a05:6000:18a3:b0:3ce:ea71:29bc with SMTP id
 ffacd0b85a97d-3d1de4bb61amr8138742f8f.33.1756794828243; 
 Mon, 01 Sep 2025 23:33:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b7e7d23b7sm183255365e9.1.2025.09.01.23.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 23:33:47 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:33:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/bridge: synopsys: Fix an error return in
 dw_dp_video_need_vsc_sdp()
Message-ID: <aLaPyJrFsSFuqC1R@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

This dw_dp_video_need_vsc_sdp() function is type bool so returning
-EINVAL means returning true.  Return false instead.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 9bbfe8da3de0..33be4eae2b20 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1149,7 +1149,7 @@ static bool dw_dp_video_need_vsc_sdp(struct dw_dp *dp)
 
 	state = dw_dp_get_bridge_state(dp);
 	if (!state)
-		return -EINVAL;
+		return false;
 
 	if (!link->vsc_sdp_supported)
 		return false;
-- 
2.47.2

