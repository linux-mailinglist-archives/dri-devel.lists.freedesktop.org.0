Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A306C184B1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 06:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092EB10E6F3;
	Wed, 29 Oct 2025 05:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="So5VUbJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DFD10E14E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 05:30:16 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so3462806f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 22:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761715815; x=1762320615; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uYokdTDrhX36UcN1b58PWjPF3nJOxVfqj7lGD2QXmPw=;
 b=So5VUbJJv6Oc4bh6XWPJBKnTwthZ4ew4hxbO4vkrFgwdRX4f+ZTWs/vGyIgZCQ26qu
 YVFhenR8bRVDaJPiZaiGo/Fsvxk60XeSv6IuzpgSSaQhB9lJYkpLxjSJTsdj802UPeIg
 Ubqh9eJiM2YV22i9L/khm3IszMXWQnLWHsvQZVs5w4IxLfaN1S995qAOXvyhXVIiYg6I
 FxYtE/MQWrPWS68u2dNzKoo3C++Z0ssHgepvYvBp6g8gfV87rjU+BlN59vIBIsETPTdg
 1430f+gOlm2PigxwxfYxdkR75TfIqFHCXVZ3usG3w/KV5Y4gOYOk5tuC9HyiAfcf/MY3
 tQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761715815; x=1762320615;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uYokdTDrhX36UcN1b58PWjPF3nJOxVfqj7lGD2QXmPw=;
 b=I64rF4cAR0fsv5j/ZfDCowAtXo8SOVD+elx6hPdQXd3nfw4SKLTp/EhVQtfWPrf0ec
 HbLeu6KxsqFNG12rDuDUQeWW3xd9dHEViQJb3sQoF56vTf5nUk/uxRmvFRTdhnqppE22
 2adRiZwxi1XE+MZcNpWxnYwz6RyeNC4eCSOm2XEOqXfSXbxZ57qx08OwGGfHxv+z25sQ
 RizwWL3N6o9xEcMolgPfPNydV+DbmzTE/akWwCzEz7xjUMW0t2qodNSjqFh9+9mb6jt1
 U1uFAcPxyTOromr/m3ZB/c0nhYgoH75pJcH90fvIvd7yvOa1ru0RIHsMKcHnJkfM290n
 N8Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpo0DB0ESXJfhmGoI0fZySg2HAi7eLF2mJwoPmLXkfMLgjYW405gw04jPYki0ZfxO8jXoS6pcsvQI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxf76KrR4UimhW2i4ER1d2YU6mK73A1woGLYTwLLsuJ17z9RhOo
 V1tCYK5ekPrKWxtixLXFR3lXPSw1J/9rpZ0qKXsVOh1nUMZ6Idd1gfsBtTZ+dR8y9iM=
X-Gm-Gg: ASbGncvfsKjacegAQMPhflPlfAFxjZSz3eARdHx+QfQaGA2ekJLFAy7qCHqk8rP1BVc
 ZZxqpvNWmnX9J/gECmeUA8TO/I3O97wZS0K7ceDiey7k8hNwuK4qw0n3SKwp8XLBB5BHIxNjQwZ
 JVFXTBDPoaggho/yzpQZUMFmkLUWK+ZRWYwSI0QvA/mRtr6TIexvXHfVqY4duzmvlLaIwSfVzgO
 fuvAQuJCQeMooI90fZ1BFQGoKjtE6l6nbYMQTPjTTfaHqPD/Co2O9dixP+tpVx31AaaYVvyUSIo
 BOBeuY4VYU2K72hhwvdjiNcRKFvAbFwXxIsB76z0z3eJndC6472EUJIqTn8JzGMBu2WsMjBSJcW
 VPX+NJvW55Jc3JUdFRvf2S0fuXrX+GNFSuT8+ulLTACUunxdvPxdYE43uTEkiicm5rqGWDQyV4b
 CO81BJGQ==
X-Google-Smtp-Source: AGHT+IHfC6E3lLu6ybmmfp1SQT7iGC+X39jKfB/plKPnN7tDBkq5CsrdtgMBZl4VfAAcWqEotczZdg==
X-Received: by 2002:a05:6000:2403:b0:429:978f:16ef with SMTP id
 ffacd0b85a97d-429aefb9b5amr853947f8f.30.1761715814562; 
 Tue, 28 Oct 2025 22:30:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-429952df5c9sm24207547f8f.41.2025.10.28.22.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 22:30:14 -0700 (PDT)
Date: Wed, 29 Oct 2025 08:30:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Frank Li <Frank.Li@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] accel: ethosu: Fix shift overflow in cmd_to_addr()
Message-ID: <aQGmY64tWcwOGFP4@stanley.mountain>
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

The "((cmd[0] & 0xff0000) << 16)" shift is zero.  This was intended
to be (((u64)cmd[0] & 0xff0000) << 16).  Move the cast to the correct
location.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Not tested.

 drivers/accel/ethosu/ethosu_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 473b5f5d7514..7b073116314b 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -154,7 +154,7 @@ static void cmd_state_init(struct cmd_state *st)
 
 static u64 cmd_to_addr(u32 *cmd)
 {
-	return ((u64)((cmd[0] & 0xff0000) << 16)) | cmd[1];
+	return (((u64)cmd[0] & 0xff0000) << 16) | cmd[1];
 }
 
 static u64 dma_length(struct ethosu_validated_cmdstream_info *info,
-- 
2.51.0

