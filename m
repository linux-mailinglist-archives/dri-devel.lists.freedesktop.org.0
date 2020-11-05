Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DD52A8169
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA436ED84;
	Thu,  5 Nov 2020 14:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B0D6ED84
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h2so1874450wmm.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7qK4vXzf9k749HbSw+NxCxzFALmYv20LEPAyeYzlRJg=;
 b=DvX+YFq0boewLykq+SRnhh+o0RblVNOCxqwRFP2HW2CfK8Pmx+3clePTBNvWOqiAlo
 6iifsKbFhESVU9JX1Qr5PP3j4dk/WVzjt2wT3rOzCJxtGSfqG4Eydl0yANYEeFhEgO6X
 h8na7H0n4q2V40frBQtsO3lUoXDLl2yfMTqiTyiX7pzXyTwkHKZkku74oLaqgrThJGFI
 ledlIjIxUT9uBm0nugUaAnD4Lpvzr7y5LnZsQUsg+h/5H3vPdpeq59M69qrP+c8tT58U
 62w8Eo6U3pbROKNyR3Mk6PqEF6d3dXVYNVkzALqqNEz84J82wk3bz83cXzHDm8kHLD1f
 qtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7qK4vXzf9k749HbSw+NxCxzFALmYv20LEPAyeYzlRJg=;
 b=UTqU1p18UoiRNcmAfqjgGcJnIsEkscIkBw4IyGF4Y/pY1/cB8Xu0IswtBtMolN2vlg
 2SH8vbV4b4DWX8bwfVLtsTSlrl8rIe8laJgb/miO/PZh4gZmuIAHYBw4zZoh85vsgLEm
 0D6oTKgNwgnJobOBYc+Ga8Oj+9pR/0Dzq2FJ7rfUZ6KENNLhwS7VJghvEa9uLSOhkxy1
 Igmpl1K+S8mE9ZrbBjnlefxbP8mCx8StjRqVpIPmYkGI8g71eNVxKQWz5qjoCXt/XDwC
 Qg51P57zAkg6wQvqq6VqnIVj52b2VyAXGaX7v33Omx6VQmZBbLNO46ZbuT5iz94gkGSd
 Oy6A==
X-Gm-Message-State: AOAM5303kaxIASBQ42vhTv+c4eehvaMw1wPDqa6Otnu3Rccz/XqydG2Q
 vqegqvSSJSG/+SAbKkQTBpq8bg==
X-Google-Smtp-Source: ABdhPJxI3Hz+xthd1AooFfZRJiYYpYQ7WvLLajU3VZosa9/ukoyhZuoZL8CZ36qLvtZ38khO9VAoCA==
X-Received: by 2002:a1c:4c05:: with SMTP id z5mr3136449wmf.122.1604587935853; 
 Thu, 05 Nov 2020 06:52:15 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:15 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 01/19] gpu: host1x: bus: Add missing description for 'driver'
Date: Thu,  5 Nov 2020 14:44:59 +0000
Message-Id: <20201105144517.1826692-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/host1x/bus.c:40: warning: Function parameter or member 'driver' not described in 'host1x_subdev_add'

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/host1x/bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index e201f62d62c0c..347fb962b6c93 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -32,6 +32,7 @@ struct host1x_subdev {
 /**
  * host1x_subdev_add() - add a new subdevice with an associated device node
  * @device: host1x device to add the subdevice to
+ * @driver: host1x driver containing the subdevices
  * @np: device node
  */
 static int host1x_subdev_add(struct host1x_device *device,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
