Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FF6A503DE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 16:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEB410E2A5;
	Wed,  5 Mar 2025 15:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H9IjSbwI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173D010E2A5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 15:53:31 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43bbb440520so40522725e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 07:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741190009; x=1741794809; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=95chebkxx5uPpuk8Hf/uN1bb/WBC6Ds7j8DqJcXx7/c=;
 b=H9IjSbwIs2PInbw83GDA3HZFSm3GJfsMa6JKuimHO6aMRPXrEhotMfrWjD0fZeTFCV
 fJPASKdMsggPXin8fTN7n7RyRX1xbWHvldLZHiTxJptpoTrmnW2PkOmuq+Jl10GFNkKh
 V3L3akZMpWcpojLW97xdc3acAdT9PEJ8X8p2Lby6zukuGDlQn1+4k4h0Sz5W7RGwivcT
 tTNWUscX7m65kWwNAmOfT99R+LSsAvveBcq8zwcQPZGYjU7rzZKYbdvwz5I4gkvDpxVB
 sLKr/r5fmmd4g/a3h2yBNyt/w2LgTvD5s1Ykqons3o52nQ1eWrj6fbOv0JQ8sQfKNkoz
 g8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741190009; x=1741794809;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=95chebkxx5uPpuk8Hf/uN1bb/WBC6Ds7j8DqJcXx7/c=;
 b=Z4S3LvuWDT4WtNN/nCUES3eqGIpYmDXrc9sAT9iaABU/rFfHJdXooGCTtCiAwUeACO
 87bL6gv8DNV+PG0TmB9/PtDyEe7qFNaE639l9tNxU/ENNN37wg5KzFSn0IB1IYdLhivS
 OTOHF2HViD6oa+nK0ywexKOfweTg0c1BnjhXhSEXsURAVvapYQ8SFY9Pd5zX0FyGJgr2
 5TfIMzcz9f7KJHnSeMRbffrSHzRyJvriS4+/Dwm9X+mEbwmaBC9piHEwDL1nSe7S4nc6
 SsvPFjGSo2eGCG8T3gtK4NHCjbqcV+h2Y7Hksy+t2vR7pfkCDGnZ0/h8bWiRcSGXKwZC
 mXVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcL63+7XMsNlcaQKwaRinr+w04QKZBwNiKXhbM0LzDNf5UQ+1f2b+mJ0FLnCbOP39KzYn/y4SrK6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSMfZketSJvsxmICavhCCAjLutmdBJSUXtmx0iR4anH7bKY6/A
 F9mGmnHruXsF3jukYgzvbhYuW5Od+SF2aSmr646N22GHqgjc9vFy6xdSVWvzE0c=
X-Gm-Gg: ASbGncsWmjp69AtqjbCymjxZK67mKfNcOaMMvNs0Pu2kzx0njonifRbJ9sqcpztxr3s
 4xyzOcoIRvh3hX8D4x9vltGJCEFXmrnfLDSsrgM46IeUrW0gYnnP2dYDe20s4t1ml8mw4J+maI9
 jNjHNRE2cc2hSCtS7YDMaYbZVBE01LnJTCRPAi01Jt1nbeJ5FDo5MMbAdgpakLxmeWZH88e+XqX
 JsT5bLN2IjJlvg92yRTQd3/KLB468/9vrm/hu/d52p1kVqNdn0RCXd+626q0twoPIlq9UC6Z6jU
 mBoaleRoYx7YdNBx9wCSJSfDib50i7VZRx6c7EuNLlavnHF11w==
X-Google-Smtp-Source: AGHT+IG46qG9NZg5asWLlzpx5UNbKVYGM9zYolGfR5W2sKaY9Lf5cmP+PeNKMAFOBaBivIz2363Meg==
X-Received: by 2002:a05:600c:198f:b0:439:9ee1:86bf with SMTP id
 5b1f17b1804b1-43bd294309bmr36486625e9.7.1741190009583; 
 Wed, 05 Mar 2025 07:53:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43bd4291ffbsm21180345e9.15.2025.03.05.07.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 07:53:29 -0800 (PST)
Date: Wed, 5 Mar 2025 18:53:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] accel/qaic: Fix integer overflow in qaic_validate_req()
Message-ID: <820aed99-4417-4e4b-bf80-fd23c7a09dbb@stanley.mountain>
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

These are u64 variables that come from the user via
qaic_attach_slice_bo_ioctl().  Ensure that the math doesn't have an
integer wrapping bug.

Cc: stable@vger.kernel.org
Fixes: ff13be830333 ("accel/qaic: Add datapath")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/accel/qaic/qaic_data.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index c20eb63750f5..cd5a31edba66 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -563,7 +563,8 @@ static int qaic_validate_req(struct qaic_device *qdev, struct qaic_attach_slice_
 		      invalid_sem(&slice_ent[i].sem2) || invalid_sem(&slice_ent[i].sem3))
 			return -EINVAL;
 
-		if (slice_ent[i].offset + slice_ent[i].size > total_size)
+		if (slice_ent[i].offset > U64_MAX - slice_ent[i].size ||
+		    slice_ent[i].offset + slice_ent[i].size > total_size)
 			return -EINVAL;
 	}
 
-- 
2.47.2

