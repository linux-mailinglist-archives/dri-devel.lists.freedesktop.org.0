Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF48CA43356
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 03:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC9810E060;
	Tue, 25 Feb 2025 02:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XoUu2BKe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A24210E060
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 02:59:05 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2fc317ea4b3so1416394a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 18:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740452345; x=1741057145; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uxLwz9pAWPv4wliE2pWI7MwI3tykU6R8KAu78IrFtBQ=;
 b=XoUu2BKe9mv4VlicMhBlHryD+m1+gYlLyy3KgX/a/YEYNEBEPD46ae+pJ6YnA56t7i
 3LA83XaHWybW+XwyoiKA7zyZoo7TWSpharCVbVFGLT0HxfkZJGpSNFrg9NkBX37jFQdx
 OOoD0UUHGOIA5YlmHAYAi+KlGVGqveHmzbwqPCVYhfsys+8zKYQJzlzeaB2boYXFHcP0
 ZJ6aacwIcxKobMJSgsv5x/A6Tk5PGDmi7IJP68PKTePLwnED9qF0CpowKHJSGycdytvv
 fiwz6mgwHka95gaZUO9Yzi7S4rtcrtOodIncMs7OAzKuTzQIPNkp6llx+m17thNJb0YV
 J0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740452345; x=1741057145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uxLwz9pAWPv4wliE2pWI7MwI3tykU6R8KAu78IrFtBQ=;
 b=FqxCpc2+zNzc7F2GMOvX/ZEzJZ5lDPt7njIBcEl5RE/i68SZevqLzMhWe/3joz3CTM
 7ZaenRr+GgybwnyvhwjJFuifmJCCoLlFBr5qDsgP6n4Wcrr5AactWBXdEzKDz3D3x3sM
 R5Iz7nRnzkuqOro59XL2R/ZQdhxjHGY3SMOediqbYbdgVAfqpQXY5QINnbOBJcp08e6U
 xBndITW2xTHEy4Ig0tFSro9nAC/9oX1ZEV1N61+a157l1citNURUpFAAWoYGyBEyHluQ
 85P//elGWJSb9rG5G1sd9wETBKEaHOMNVgEAVQ7HoIfXi+QnDb4jk/pyFkhKTw1IW228
 3bSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVei/HN9WJ3JiU97DHMau9/bVjP3YKySiXLOrd892AQfGpcFX+UC3aaitVp9vTlsKd9MRsYaCyY1AE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDSJe6UpKyfNK7M75j1FVrY1waGDXHjy/pgPIBs7gWL4CH0TBe
 jJ24yKOgGGE8aN0n965gjrISVte/QVsMaHAyvDAe8KylP8KdSjNu
X-Gm-Gg: ASbGnctRjuNdcHmeZFniEt7g9rZvqLMy7BdV0hkFwEnLrQEfjyG0qhxEDHQylUwvv8S
 r9CGLoqSs9xAvWdSLtFiZxq/xGAelxMLzH/uyvqDI1EfFjSC+W7oRfW2iwIFjQsKOXLQD6wkJaK
 zen7vaZCKZ3lL008YzEuGUYh1y5aqN0b7fKuKyuJATSYeIkHXJfUHYxTwJQsc57T+AICEb66KKt
 4OjcePaX6WTqilJFczhRT/66N/u7lkuiBQjvnW2zrgImVs3CFrBW9zMeJjrkWxsyYmNYrCyEsTZ
 K5sXj17Cl05HeNrJiwblw+Xl0A0o3QeSo1WE4yGUOw==
X-Google-Smtp-Source: AGHT+IEEHHuebk6f0XqdbdzxFm+LbP1RDneTW/XWyiaxf+6sAHyMqfxlMXYlNk6VtOFPABpWireG+Q==
X-Received: by 2002:a17:90b:4a07:b0:2f4:447b:f095 with SMTP id
 98e67ed59e1d1-2fce7b14cc8mr9920933a91.4.1740452345260; 
 Mon, 24 Feb 2025 18:59:05 -0800 (PST)
Received: from localhost.localdomain ([182.148.13.61])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe6a43cddbsm388655a91.31.2025.02.24.18.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 18:59:04 -0800 (PST)
From: Qianyi Liu <liuqianyi125@gmail.com>
To: phasta@mailbox.org
Cc: airlied@gmail.com, ckoenig.leichtzumerken@gmail.com, dakr@kernel.org,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, liuqianyi125@gmail.com,
 maarten.lankhorst@linux.intel.com, matthew.brost@intel.com,
 mripard@kernel.org, phasta@kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH] drm/scheduler: Fix mem leak when last_scheduled signaled
Date: Tue, 25 Feb 2025 10:58:57 +0800
Message-Id: <20250225025857.36391-1-liuqianyi125@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <3b369e1a49b354852f361b103999673e4f7906a9.camel@mailbox.org>
References: <3b369e1a49b354852f361b103999673e4f7906a9.camel@mailbox.org>
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

Thank you for your patient reply. Let's first clarify the issue and send a new
patch if necessary.

As soon as it enters the drm_sched_entity_kill function, the entity
->last_stchedled reference count is incremented by 1. If there are still jobs in
the current entity, it will enter the while loop, assuming there is only one job
left. If entity ->last_stcheduled has already been signaled, it will enter
drm_sched_detity_kill_jobs_cb, but because null is passed in, the
last_stcheduled reference count will not be correctly reduced by 1.

Because the prev pointer has been updated to &s_sense ->defined, the
dma_ffence_put in the last line only reduces the reference count of s_fence
->finished. The reference count of entity ->last_stcheduled was not reduced by
1, causing a memory leak.

We should subtract 1 from the reference count of the prev when dma_ fence_ add_
callback fails, which is called balance.

Best Regards.
QianYi.
