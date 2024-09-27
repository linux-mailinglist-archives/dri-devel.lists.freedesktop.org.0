Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EB598871F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 16:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300D210EC53;
	Fri, 27 Sep 2024 14:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BQIR5ByZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8788310EC53
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 14:28:00 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42cb806623eso18470395e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 07:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727447279; x=1728052079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=B47B8vLqY3XFadZcVp2JDSD1+BVVrvrYssyhwl9uTJM=;
 b=BQIR5ByZ9VaBqzw5H3qECEf892u/RQgMcEKV2RoYu5zHGjVYRZnL7vFMnK99+9wmtn
 0GRESq7qhAWQkC6h1pbGnvZrvStJShxo/7Ewuy5ABUWUg7LN7kB4WOlRIi6sVm2de+G5
 N3n/du3nrBFGDuDmxO3O8o03tPmrKu4tjRayjTbqYXFrM4+7ziJIxX4LC0mz8JsgxOpu
 paAUmAa9X530M08Y2WKg9/wvFoF2s7/Vs6JktHzfqLwVX8dwqodI0CCuqikXj8y93Wcr
 PJ77hzCbzfZYnvsmkgYJViqQCrw8BItolj202BxVDFoxh5N4gHLS0tCeV6PyjYM/4j+2
 GwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727447279; x=1728052079;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B47B8vLqY3XFadZcVp2JDSD1+BVVrvrYssyhwl9uTJM=;
 b=B+fyG8DXkpgzkxzA2wGmZLsY4sTdcwifb53EWwIo/WmdLmtVG7nkYK5uuKQfL0BGSA
 y8Guj3JHfKZzYwGcWwAST+k3vvaanp8FW1fYvI1KKlDY1hKzkahBDk4fNVh6T0k9vitP
 9nYyGNwJZTBnP+C8tyNBcjdFmA5SpUfLjZKwp6uT/zTesTRzVhwLO7rMw7ILrC3KVulO
 gkpUz/p9tMnKpN1Gaep1gVCPdT+CQVx0PJoBKJsF5H4dBqsNLs4kKyL3WfSzcGX0VCoh
 aYJlFI4+FPEa2rH/+og6hWMH3AOb5OPcdMLaq6HB+COGnjKq7FMygWrQlELo+t9WVtW3
 f+Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYn+2Z2OAnJNEDyyudxJwUfZ/4FeukeFDRkrNLY4x6orGN41uddq0FSjbwMVmwHsLxjVuiZFTnMEE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxjWG3cuW56/O2TV9ujicqkrgHXlh1L+FW1lhObR4vHYQeQiTS
 h9xf85d5trI9NAeAa9mQj3O1fCQJjKkWR+15hw99sZoHHkFlJ1Ao
X-Google-Smtp-Source: AGHT+IGzif0k+dZSy97hZWV+lXcdgUux0iZ7d+LJsLAQ7qzjOPk0oniiMweeL3e8ffdYgzvl3ZgkcA==
X-Received: by 2002:a05:600c:4515:b0:42b:a9b4:3f59 with SMTP id
 5b1f17b1804b1-42f5841590cmr24630045e9.14.1727447278509; 
 Fri, 27 Sep 2024 07:27:58 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1515:2900:6181:3f3e:a0cc:be1a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a36705sm76944445e9.33.2024.09.27.07.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 07:27:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: pstanner@redhat.com, dakr@kernel.org, ltuikov89@gmail.com,
 simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Document drm_sched_fini and add some warnings and a BUG_ON()
Date: Fri, 27 Sep 2024 16:27:53 +0200
Message-Id: <20240927142755.103076-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Sorry for sending incomplete patches earlier today, I've messed up my
branch and had to re-create it.

Let's try this again,
Christian.


