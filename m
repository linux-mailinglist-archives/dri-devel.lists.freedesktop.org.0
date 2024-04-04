Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A036898243
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 09:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FEC112CDC;
	Thu,  4 Apr 2024 07:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c/6vmGb2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605CC112CDC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 07:32:13 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-56e22574eb3so42519a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 00:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712215931; x=1712820731; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=//sAcOVGiFM67Mc+7u0Jl/+UyvrH+ecyO1z9cymLgoc=;
 b=c/6vmGb2YK22Kcb3iIbSRnmS1UG3PCjQpLAebalbrVnuzF3l8DVeqAXZurYkDzX43g
 iZt1YNRh0GNKIdfFNjnL4AbZX7qKjf12pE9BkrykBfx2SYtB6YLODkisevy5M5iovvgp
 qOaTdsQjrT9l9JTLMTliEUCZDCLxpSyhS4rPpEhMQwyDrqYjnVMj72W8DPCMNppGkUnu
 YkelUfY/1ydyownQCg9aIv1z47wYfC7PoG1VYH5WDw/CTt2xjTq00MAhhFErZSjN04QY
 Lr+wBNDNbN1TsK9QKQ3xDtSLfY4Ii3j0uK9LAo3bri7Zk1smFA7ejETwfq+Roo+Xk6ne
 BhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712215931; x=1712820731;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=//sAcOVGiFM67Mc+7u0Jl/+UyvrH+ecyO1z9cymLgoc=;
 b=woIhs/pwXkLJO81kZI3cJ2VIP+n6WxzqvC8okgPk0yz0XZV0b1gRqa6J76mBfRgONb
 DIyAeFZ106OLHQmiRwfa0xYiLqxwzDwNJc+orPDbYOnLyXt0eITa+ft0flpO1cqEMksc
 rPHUsE4wQxL1+NuPuAL+Phj/7sKbkgCtWf4mcMi+/4SZKNUE2OOW8UobrPB/r6S9ymbn
 XYOk5PLX1qGkBw/U9jUlbfQPt9zZ6kWnCYvSJmoS6NXSaOkiBqxSIMfVd4Ph7A5VPEDY
 0jcw4BPnakjIF7VTCrjM6Zy1ODJuqYAybZEMnd8TSSveLdvnVj+mZ/63s8yn0W+ceXBI
 cFkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkQeF8RP6sjiTQxF8NB+GUlzhTNOWJypWgaJfzEFGXEcXZuSNqW7y+h26wJg9H7vcWiCcCg4oqOntiePrHTcKDn/2m1xHOdJ2Av9cUodrY
X-Gm-Message-State: AOJu0YyDy4sNMH9cW4rvjQSstB5u77iDmJzj1TVYbc0KKAusoMsP0g8m
 /cpZzTbTD5BcTr1Z7ujoo58FmNiOUpyz1H/k6GhHtIJ7hwWCrjmFYUZFDBGhxmw=
X-Google-Smtp-Source: AGHT+IHGoMQHATjr9mp/W1xlbFnASpGskQs04R+ZSL+kTmOQTHyHF5yua8U3fbJLoFFE5vCnaPng5A==
X-Received: by 2002:a50:8add:0:b0:56d:ee61:6874 with SMTP id
 k29-20020a508add000000b0056dee616874mr1078667edk.20.1712215931473; 
 Thu, 04 Apr 2024 00:32:11 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 s2-20020aa7cb02000000b0056c0d96e099sm8845373edt.89.2024.04.04.00.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 00:32:11 -0700 (PDT)
Date: Thu, 4 Apr 2024 10:32:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rohit Visavalia <rohit.visavalia@amd.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, Vishal Sagar <vishal.sagar@amd.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm: xlnx: db: fix a memory leak in probe
Message-ID: <86def134-9537-4939-912e-3a424e3a75b6@moroto.mountain>
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

Free "dp" before returning.

Fixes: be318d01a903 ("drm: xlnx: dp: Reset DisplayPort IP")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 5a40aa1d4283..8a15d18a65a6 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1716,7 +1716,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 
 	ret = zynqmp_dp_reset(dp, true);
 	if (ret < 0)
-		return ret;
+		goto err_free;
 
 	ret = zynqmp_dp_reset(dp, false);
 	if (ret < 0)
-- 
2.43.0

