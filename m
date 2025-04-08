Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2CFA81090
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 17:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAA110E6E7;
	Tue,  8 Apr 2025 15:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m/+X4Let";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638F510E6F6;
 Tue,  8 Apr 2025 15:48:23 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43d16a01deaso4796855e9.2; 
 Tue, 08 Apr 2025 08:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744127302; x=1744732102; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QaaXIgNJLKIxXw7YwzQeOHsKq9Pk6Yi0MGZAiqMRFcs=;
 b=m/+X4LetnMF3KT+b4bGUzHs2hu+Gxmseb7fsdP/eZna0yaPp6FJBAHvbBkDmSfeJCS
 IouuzKi3uurYJhIJdTYz3MjpdwyqnA8leK6N3iQ1G6OCcYUKg6bXgHV/Cpw98MmTwKpV
 oNKBGXn03Z9V8aIgJa4ijoX/k1xIUJyA2XyhSNBZIOfOPeimHaODNxzCCfgV/AO3BsrY
 yB+YoGbC8y8bdxVia6yBqZCue/1nkEWkyhwgm47tCKo1Ji156y+x8jz87Nh5OiScgoNb
 Na3dMQZ6vtpT2LNXJ2UWDXiOUnVUUZ1DMbToYLj/HFVZGXTDIs5V8JJmzXfRaIMa6tOm
 c01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744127302; x=1744732102;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QaaXIgNJLKIxXw7YwzQeOHsKq9Pk6Yi0MGZAiqMRFcs=;
 b=fMxWWBP3D1sbeCAdl4HGQzsaFKIuUp3hCmLmQn7MmJ51CgzdGbsOlrZaey8QQRTiny
 1AxAxnYDTjYW1NlPYoymvMejZpWOZl/glOEuQ5qxlHqOsTS5twhhiXUj2C0GHZzA5vPX
 sFzMM7nPMHGcESqgRMtaoBdXnSH88xybTAhkoQJm5XJRHKRpeYlYm+2s2G+CJF63KJTw
 aWKjhdB3b5HKTG7tKggLGByHGPq6TmWuIi2mbY4OmnLqP3M1uUUgFZNNm9v6J3dPbhkD
 elkGg1WyIMfjBhaQCF7E/QPdSo+IjZsdR107tawSxwDCyQFNjpx4AXKhIwkli9wBGcvX
 c0tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzpji9IbTV2lG5/969cF4UjtTh7/NCREMflMH06Mtk5vIeMvr+NRj7TA9MwOQO95TST9x5buKTRHM=@lists.freedesktop.org,
 AJvYcCWYR16pu4uo3kzjImOX/VsYmvWwKs5asXkBI1YX5/VgWDHvHcsqerrl6ubQxufeHCw3zdm6gA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxM4r7SF0kvudIibrXh1H7U65yNsOQvm2cAUeReT37BP5AIEPB6
 I7H632WXzb6ucIEL/HteuBduxljFJ2SDG+v1sl3bZUniDSOdmyJW
X-Gm-Gg: ASbGncv9FpP6P0A8Idph8b315tILkEDhbKDwWX5Jj4WcMpWuYvy2l9VbCE1OaHbc9gt
 NiB3Zx8P0dtMr89ml9KqJJXQhhI52/7V7c+4JMUu9ccSf9QKGxqa9qtSHwfa7aByUxk4jNarjkh
 +v3vKlkWU5hPcEGHCu/bwvh/DqZqz4tSEwM79IvI0cFVonIrdHNPG3YsMTdTDEC+QkHnNkyjOuy
 UyEYrYvn1Cmn8EUls/urJMRyXBSJmvTh4EBbFM8jMeCGcpmtHWYbiQlJBUvM7PEwmxz6Otp9k/8
 81uj2tV/F0LYcxvBFWHNz3si5m0rcVtmflN/KVVuvQMI718IkALP55iW
X-Google-Smtp-Source: AGHT+IF5OWquYgZ+SqsV3ILAxabDl9QL1OXepjXtseXsxMMluVO2opI4lBuuPbsE4nzLYXiKTparIQ==
X-Received: by 2002:a05:600c:3b9f:b0:43b:ca39:a9b8 with SMTP id
 5b1f17b1804b1-43ecf83ec83mr56894605e9.2.1744127301550; 
 Tue, 08 Apr 2025 08:48:21 -0700 (PDT)
Received: from mosaic.enunes.eu.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec366b571sm166903995e9.40.2025.04.08.08.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:48:21 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>
Cc: christian.koenig@amd.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Erico Nunes <nunes.erico@gmail.com>
Subject: [PATCH 0/1] drm/lima: implement the file flush callback
Date: Tue,  8 Apr 2025 17:46:36 +0200
Message-ID: <20250408154637.1637082-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.49.0
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

This prevents a user bug in lima reported in [1].
I'm not sure this is the entire bug fix, but Christian had also
suggested we implement this callback in a previous review [2].
I took the amdgpu implementation as a base for this.

I noticed that most other drivers don't implement this though, in
particular the other ones for embedded GPUs. Should they, or does
this indicate that we have a different bug to be fixed in lima?

[1] https://gitlab.freedesktop.org/mesa/mesa/-/issues/12007
[2] https://lore.kernel.org/all/20230606143247.433018-1-nunes.erico@gmail.com/T/#mf5c7a2492201c8ec82bee47eb5615714d5c5aac2

Erico Nunes (1):
  drm/lima: implement the file flush callback

 drivers/gpu/drm/lima/lima_ctx.c | 18 ++++++++++++++++++
 drivers/gpu/drm/lima/lima_ctx.h |  1 +
 drivers/gpu/drm/lima/lima_drv.c | 17 ++++++++++++++++-
 3 files changed, 35 insertions(+), 1 deletion(-)

-- 
2.49.0

