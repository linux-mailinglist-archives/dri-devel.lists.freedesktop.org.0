Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBD9D0BA4D
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 18:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426A310E797;
	Fri,  9 Jan 2026 17:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="FBvJ9irX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8BB10E797
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 17:30:21 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b7a02592efaso739718566b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 09:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mary.zone; s=google; t=1767979820; x=1768584620; darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jBa3BfzXRQYdF1iMoYKyfeZdw52+KwchtSwkEBOxNPQ=;
 b=FBvJ9irX4fNv/AchbglvgIkquvHxlKBAdnUBTRMKx7a4Kl/JvtbjgfDIaE6TQhqb9S
 Og+ipjuwZnmZD0gHeJvBRdN/QHlbIkxOIEKtO5V0c6xU7kyfPblfJgL4l1ToxCBqfJlD
 2J7u9FtXC1VLIV/V0A3f60mIVyBn1LgeukigSoloHmhVqsZmRUYpZTjsP2Z/Q0oLw+Js
 QnVDTQQPqKZwEdvnfj6mdeVRJvXQWmMKLKdZpWMdRMNvqIVruTLFavr5Fy4JiwSZOoyl
 zqIubgsincwkO9bxXZowmCH9Hl+toSCWlYJC334uPbfpwEgQZ2KQJUH+DBBesmGiJ1vb
 WOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767979820; x=1768584620;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jBa3BfzXRQYdF1iMoYKyfeZdw52+KwchtSwkEBOxNPQ=;
 b=mMmXf4d1XLR/Z1DZjznjR/DMXM2B9cqY9smafqO6KEvLi2A3OPHxHN9Oztkif5T8Jt
 Tpzvkj1miotpWb2oRmuzPpRcb4CzVfk/kZMbL6Bdh6XJpR2zJK8rhW8DCW1aMny/IOTH
 iFXThk9KXhRep3EvZ13+0fVSjeZZlG6DRCyxzwUyKjLBCBwPZYvyCM/cxzNX/cCWBdHp
 QvBod744yS12SIev2Ff2vrfkZ0dOLzlC7AjpG56jbLsO8PIsFjGgyfPtGBGntbvBVC+K
 QpzfanrAhQ2ROOjaYph97DyAVlypahUOFtCj+uz1/SE5wQvn+BKDgiyo8IVb/fHonGmL
 CLvA==
X-Gm-Message-State: AOJu0YzmaCR+w/C7fhq5t69Kk8R0fd+NHIGhMGLAgXwM0fibDm5gtvg2
 P24DX7wu2oebEyxJwKEUrB8eV+KCNOS0tGTclqnx37oxAA/277qn0c+tudbZN3u4+3g=
X-Gm-Gg: AY/fxX6bqzVnPn+2zf28kh75qmj7nBhykREgUK5q4qiUBmz8QZ2xQvJmbfw3mq79Z7w
 v0Gx2U/x9apqmHjs+GplTIpgbjJp1c2H4w8gFVqX6mSkt8TX8RIicpUlYTmukICV6Qm1buYs2Jj
 w/Ow34TlwlQpIzurwBlVbuJdXKJuTyCbtZd2ebKZFMlZdCxfZb63N781zBKBJsrsYbp+OKCC36L
 1LObYQc+pvhhhlgAydwBtJH4+7SihlxJtRdJ5K6Q8undPLJ5LKHG7K2+IzBDGsBL/usgOQY55bs
 n7jvMOVcMdfrbh1IGaJ8CmaLpmsFY1pkouUMGL6s1Qt9/Ty34fxUBqPUgkNKOYOsS1KIJByQd4q
 bvxALjVa6WkOKonv5ReHN7p1aGG70L8pWXFsAaAs7NxLoIDc1KN1gXA6U/xwK1sLK/x6Ldum4eS
 eccE89afcNuPxqZ/KlHvneBmZw2cedZBFemljynCPYZcLYVHeBKRnIBeUpCgFITQlHB9bCwhE=
X-Google-Smtp-Source: AGHT+IFBrCHXiIOeuOq9ikzCa/ORwREKVLnQrUPDKwsb6wIjhSdXMJ8CCX/1lBqXnevVQ51tP7rXDQ==
X-Received: by 2002:a17:907:3fa4:b0:b71:1420:334b with SMTP id
 a640c23a62f3a-b8444c40046mr957355566b.8.1767979819429; 
 Fri, 09 Jan 2026 09:30:19 -0800 (PST)
Received: from [192.168.1.42]
 (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a230db0sm1195426266b.2.2026.01.09.09.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 09:30:19 -0800 (PST)
From: Mary Guillemard <mary@mary.zone>
Subject: [PATCH 0/3] drm/nouveau: Support larger GPFIFO ring buffer size on
 Maxwell+
Date: Fri, 09 Jan 2026 18:30:09 +0100
Message-Id: <20260109-nouveau-gpfifo-increase-v1-0-ed0be9822878@mary.zone>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMBAF0avI1i5ERVGvIhaL+dFtEklQBMndD
 ZavmHkpISoSzdVLEbcmDb6gqSvaDvE7WG0xtaYdTGMm9uG6IRfvp1MXWP0WIQlspcMkYw9nLZX
 6jHD6/OdlzfkDpMND62kAAAA=
X-Change-ID: 20260109-nouveau-gpfifo-increase-da3e9a85efdd
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mary Guillemard <mary@mary.zone>
X-Mailer: b4 0.14.3
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

This series increases the limit of the GPFIFO ring buffer to 32768
entries on Maxwell and later.

This allows up to 16382 entries to be used by userspace instead of
the previously 510 entries and should help having more pushbuffers in
flight.

Signed-off-by: Mary Guillemard <mary@mary.zone>
---
Mary Guillemard (3):
      drm/nouveau/chan: Store channel allocation details in nouveau_channel
      drm/nouveau: Unify GPFIFO ring buffer max count query
      drm/nouveau: Increase GPFIFO ring buffer size on Maxwell+

 drivers/gpu/drm/nouveau/nouveau_abi16.c | 37 +++++++++++++++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_chan.c  | 23 ++++++++++++--------
 drivers/gpu/drm/nouveau/nouveau_chan.h  | 19 +++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_dma.h   |  3 ---
 4 files changed, 64 insertions(+), 18 deletions(-)
---
base-commit: 0244539f9a4f3b564604dfe4d639f61cecec381a
change-id: 20260109-nouveau-gpfifo-increase-da3e9a85efdd

Best regards,
-- 
Mary Guillemard <mary@mary.zone>

