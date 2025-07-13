Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A2AB02E87
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 05:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB90110E0F7;
	Sun, 13 Jul 2025 03:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eDBVybyp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3C810E0F7
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 03:08:44 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-747fba9f962so2745004b3a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 20:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752376124; x=1752980924; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=A/PhcnKDeXDlK41TAaCBlrpWKfmPmHBfg52otSkZP+Q=;
 b=eDBVybypp5Eoe6M6So3Ge2Nnzi5/xvAsyw4x6e+xXCoTxTqHCqnkI+sH3DrtgesBVV
 HSwGq6bVeW0rxzP8sW1FMkCMxff/hv6OZsuMrte6cJgEGi2DOZMNDYjk9WnVsX9wXwS5
 8cic+NSjzCZ1y+oGJZ8Q9+oB/ovXkSZXfja3rVgPcA7lBdpSCzEMR8KTwZYSDQi+IhSy
 cl621Q9vZaTdaNisN9nHUSxyioAAhq7VMC6zulDs2B0ocNMYIx+AcLX+gN/yHKB10O2p
 C1pXTeJEFsFdPeI1ztY8L+q1465crtIO1IKMRP/YDFZmJq3m4ioD2yI6StfZCz+TbRjW
 VXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752376124; x=1752980924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A/PhcnKDeXDlK41TAaCBlrpWKfmPmHBfg52otSkZP+Q=;
 b=NzXc04SSkKzFR/5NhsRdPNXPa12nqaKS/VmHH5gbh0xloA+OAlSWtzn1F1s5CfUHao
 k0ILI3WkR+5mgie0iA0Jau2d7Oi2I7OMuqLjhSuIHwsERUbgswM+5ga75dDb5pMmgP7X
 eifZ3nd8siZE7YM524khbxw8N8DcXibEkMwPo8yDVcFmxWgwJYaZSnU+2fPPUjMqXX+n
 Oyixs3B5FmJijHBQACDmtVHqAOOJvEi4IUfC4f12yu3bP3gvIBfcjLMnOXwev0PzUDLP
 4zgOhNCWDtisYb0nMznopiw8kw2t6ezWJUpRkTdx0A4zqV6/ihGbIUkD4c/4uKLyr5OQ
 XMZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0ADiLaeHY0g9I0vy5dt9OZV5w9mSQFz19Gxpx+Gweo+oRdgM+OpX9BFF7YJGtY/ALlCgnzqtsP6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxRJA+FqW8G1fTD5VF+BGQ8GpvpKpNxJKovLvBFh7yuCvFT3zZ
 MVB9VljvrCsypQ7zpJN5fwaVlSI+r9pA4Wfkt6dubJ20bSjh9nE/AcKq
X-Gm-Gg: ASbGncuk4uq3fpYoKLBaoTBgZxbDzIMBf5kzgvEZcBjU9T/gGfb5cq7u2idCYsuadUV
 D0B00Ylg8BerTYvYqW1JO7itgYJQR8lOCr0sNlmJBpTZY7iKx/nI5Xj8Xe0RQx7OpvyWVynNUEo
 o30rD2K+rvpUc6Z/+V0tgH/A3QPHD6pTHlhlG818F72e2rHgis42Rr7di8d5Ow1WAHnqp+aophj
 o/ET5ZNw6dbjnmUN1v+coMkavp8Nxes4QUc6YAAWz3VbfEsAVdmmjQZ6z6G0CsqlKZwHiBj1Vi2
 RLUcB0EftIUaH5iI8sbkW5cEl0ORIUNRsC/eaDDiOaIGHQVf0IsJwFi3QyFw3+NQP8EB+JEATqC
 xLol3+YkYUiHqcB1oE0BF/2EGhwC4k3dRy7W57WZq653+SLut2HuvpT4L
X-Google-Smtp-Source: AGHT+IGzyclkK5eywpOjPfviPQDuwjyLNw5/+70ZTikNMITeGItxELZn/civ3Y1/NtcKfUArmZxAqg==
X-Received: by 2002:a05:6a00:6d58:10b0:746:1d29:5892 with SMTP id
 d2e1a72fcca58-74eb593d0bemr12706772b3a.4.1752376123869; 
 Sat, 12 Jul 2025 20:08:43 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com.
 [34.125.18.212]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-74eb9dd605dsm8108739b3a.18.2025.07.12.20.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jul 2025 20:08:43 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] panthor: print task pid and comm on gpu errors
Date: Sat, 12 Jul 2025 20:08:28 -0700
Message-ID: <20250713030831.3227607-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
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

This series saves task pid and comm in panthor_group and prints task pid and
comm on gpu errors.

v2: save the task info in panthor_group on panthor_group_create, rather than
    in panthor_file on panthor_open, because, when the two differ, we are more
    interested in the task that created the group.

Chia-I Wu (3):
  panthor: set owner field for driver fops
  panthor: save task pid and comm in panthor_group
  panthor: dump task pid and comm on gpu errors

 drivers/gpu/drm/panthor/panthor_drv.c   | 14 ++------
 drivers/gpu/drm/panthor/panthor_sched.c | 43 ++++++++++++++++++++++---
 2 files changed, 41 insertions(+), 16 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog

