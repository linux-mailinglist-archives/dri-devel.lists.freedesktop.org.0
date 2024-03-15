Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F40287CA6D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 10:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0A411204F;
	Fri, 15 Mar 2024 09:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KY1alzzU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D07F11204E;
 Fri, 15 Mar 2024 09:09:33 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-414025406d7so1204635e9.2; 
 Fri, 15 Mar 2024 02:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710493771; x=1711098571; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rGxpqeVYITmqsu8ISYbdggA8wEernvQ3qM2whpST9xA=;
 b=KY1alzzU9Sxpef7sbq38DwdJVWUsuQeUuBLBpATLeGn5Zb3JkHNkQqmtM2yOohlXti
 NvUZQx02u/mI84HP492KJIKHFzc5K4JTMyLNkQMyTgBcOFgvlMNGdrP5wA/XdlQffVN+
 G1LnYfG4BG1xz/rYcJnSSwDHSRJhn7uUMW7ImoQde56J3rzpomT/hNhmsBudZ7rkW+cV
 Z2JkdpDxm+kWSDQ54GWwVjQYNial72+1KRxLMn5vLD9C4Xmx6lPhbdp8/r6FAOhM8zvU
 PdYpjomoVkUk4KGJp6XXAAZYDtclZ/53DcgARwIlaJFVJGADdlJZTmeTESvJifWgbqxa
 1fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710493771; x=1711098571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rGxpqeVYITmqsu8ISYbdggA8wEernvQ3qM2whpST9xA=;
 b=ZVSUsVudnPsxPoLiIEBqdwWPOEKVVz1jS703K4EvrxfXuuNALcPrywk+g9ijt4kXZE
 VWRBFe/lBBe2OFvNoIU41YeDBFUno4kn8Hvk1jvfX5bHX/wpQ8gCvZhx5xoM8YTke4UP
 Fc3ZYHRJFrXZHvqKBKxOmlcrDUiQbqC6o0BcE9ruofbCiXi1+t9czIByjB2qsdCYeem8
 xu6XCXRzk6EaFKwXN99iY/JyllQMlaAMrTJAopUdbzbsHYvpzHYfjFVL+YeNRHaeB3hp
 JVYl9mw8PUl+T9shmlFhAsyWSTyX7pv8MYXBflU1r1Ttey9iTwaazQiMjShcjNA52cE/
 ZFiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLw49EyK0EoD81Cp8WReCNmi1AS1wZJUD9yZniFkfaHyi5b0pkiA3GaUf/tDDzPOeH6m01mqhIK9kqIeRPuA2wmWkrj4Hzt9FmN4fuijkjDRDnmEEl74v1jbuLDBjkSr+rMAt0iVQF/vK863Ww6Q==
X-Gm-Message-State: AOJu0Yxq7z5EaOxl5ZMPWgSpSJJzJgftJZesBcX9F2X8Ao+WI0W313I5
 F6rtFuvMI3bqBA/hV879AZ7b4XtYW4XURzY5mpZ7uJdSe21xUaxt
X-Google-Smtp-Source: AGHT+IH4hfq7wKhnrhc38RUmnv/6x309HrRcxXSHxhQRObiDiRWGWskNZ5S1CEfcYDXBUw1fO9QhWA==
X-Received: by 2002:a05:600c:4f07:b0:413:1139:3bec with SMTP id
 l7-20020a05600c4f0700b0041311393becmr2890485wmq.35.1710493771112; 
 Fri, 15 Mar 2024 02:09:31 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 bi10-20020a05600c3d8a00b00414009768b0sm1499649wmb.33.2024.03.15.02.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 02:09:30 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/nouveau/gr/gf100: Remove second semicolon
Date: Fri, 15 Mar 2024 09:09:30 +0000
Message-Id: <20240315090930.2429958-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

There is a statement with two semicolons. Remove the second one, it
is redundant.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 986e8d547c94..060c74a80eb1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -420,7 +420,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
 			return ret;
 	} else {
 		ret = nvkm_memory_map(gr->attrib_cb, 0, chan->vmm, chan->attrib_cb,
-				      &args, sizeof(args));;
+				      &args, sizeof(args));
 		if (ret)
 			return ret;
 	}
-- 
2.39.2

