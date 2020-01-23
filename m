Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E4B1479B9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 09:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E296FF8E;
	Fri, 24 Jan 2020 08:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc61.google.com (mail-yw1-xc61.google.com
 [IPv6:2607:f8b0:4864:20::c61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CE36E18F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 23:59:35 +0000 (UTC)
Received: by mail-yw1-xc61.google.com with SMTP id n184so74657ywc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 15:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brkho-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xrSo2+pGduAw292a0r+TdBhJS9mLgXGxwVlVbyCbpLg=;
 b=D7OYHpFLgk97teU0zZSRPPccfqMZUapF8TpobPPhIx/gWfpISr+LuVI6MDdnJDhbs4
 apMzxOnEd3+jzgIMs070Vk+xjc6o+5gb0ZBitQOL2ahu20wsHITfv4+aW8aRmiJmh1wc
 X8RIjb4s+cPG5CghTJHdXKgkuR5GSh1hrb9/twhckyMLrxupMtCJ0/9IkEIn6l0I3xXc
 LSx1unKEneXQbbOETIQOHpnbCvX+y5yyKBvVoAvwQbe/AxUJ/cnuLNMKDF1FklNC3hsf
 zYj6M9WePrwvnY+mhcncUZYDXnAXRSxHgb7XVYlLn3kGv7uWwXRruiT8Y0GO4JFyzjUv
 1QVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xrSo2+pGduAw292a0r+TdBhJS9mLgXGxwVlVbyCbpLg=;
 b=hi0g15xOWN+G2wguTbnrJ4nKcYTll+nETQDNodafRwT5EFloTjNiBqvVg1DGnxC4p2
 4bb5klT+xoVhCxc4Vw8HMLfD9lckSCYRnNKXY3tM8S7K7S4Q4S80wH/HQCuK+VHkOLoz
 yEALlscnp8GlHsLgWGYd/lzMYotvDpLSw2xiyaw4jAybYqohmFaFbGmNPcpPMphjRn2I
 OQooUU2IFgkfXe5t5xce2yQ7bbjfc/+1bSfvtFNed57GZXcD0oUfI+8FfRPplORbzYos
 XKJdMOFoSFUW+SmfJIglxdd7yb2B4cfchw7CVSZXWpbJfaTel+1JYHx2mnPtA06xkjs9
 ZoNA==
X-Gm-Message-State: APjAAAWsmKhmiCJB/mrMwEEl+mplt6oG3PI0mQJHbKb1cLD+BtQOHvRh
 Dti4iXC2ylqAR6wb9+r5PqiF5MRgdYjmpDwif2uKi3Ri5X5Vqg==
X-Google-Smtp-Source: APXvYqyitskCyEXAQcqS53IPFPyVLU9xyT5Uc39138IvOAogcA8kZveFb67zLpleAblvQ8kXm3+zAJJzhtKV
X-Received: by 2002:a81:9c14:: with SMTP id m20mr163298ywa.143.1579823974817; 
 Thu, 23 Jan 2020 15:59:34 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
 by smtp-relay.gmail.com with ESMTPS id i82sm591239ywg.11.2020.01.23.15.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 15:59:34 -0800 (PST)
X-Relaying-Domain: brkho.com
From: Brian Ho <brian@brkho.com>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm/msm: Add the MSM_WAIT_IOVA ioctl
Date: Thu, 23 Jan 2020 18:57:36 -0500
Message-Id: <20200123235738.48182-1-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Jan 2020 08:52:34 +0000
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
Cc: robdclark@chromium.org, Brian Ho <brian@brkho.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 hoegsberg@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch set implements the MSM_WAIT_IOVA ioctl which lets
userspace sleep until the value at a given iova reaches a certain
condition. This is needed in turnip to implement the
VK_QUERY_RESULT_WAIT_BIT flag for vkGetQueryPoolResults.

First, we add a GPU-wide wait queue that is signaled on all IRQs.
We can then wait on this wait queue inside MSM_WAIT_IOVA until the
condition is met.

The corresponding merge request in mesa can be found at:
https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3279

Changes in v2:
    * Updated cleanup logic on error
    * Added a mask
    * 32 bit values by default

Changes in v3:
    * Fixed a bug where the mask was being applied incorrectly

Brian Ho (2):
  drm/msm: Add a GPU-wide wait queue
  drm/msm: Add MSM_WAIT_IOVA ioctl

 drivers/gpu/drm/msm/msm_drv.c | 61 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c |  4 +++
 drivers/gpu/drm/msm/msm_gpu.h |  3 ++
 include/uapi/drm/msm_drm.h    | 14 ++++++++
 4 files changed, 80 insertions(+), 2 deletions(-)

-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
