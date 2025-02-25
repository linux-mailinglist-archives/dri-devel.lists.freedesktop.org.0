Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5845A4336E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 04:14:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB6210E52C;
	Tue, 25 Feb 2025 03:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kFSb9BV4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF8610E52C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 03:14:34 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-220d27d490dso12116575ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 19:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740453274; x=1741058074; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MTiii+zQqPJopvoIqRNCl49x8lpdFSLa6UIMeGztj1o=;
 b=kFSb9BV4UZokiqCVjKncdcGNKgrIPQD1nYQKGm4+f76z1ro5SijwBudtLTLXcyfYSo
 fFSaXbj2XOFl9C+R/tXbxnsIwdlUPwWN41dscjxfIbQ5br2D27gtICWYnogqgsexNobH
 Frb0MyR+UrYaSGMIcJ0HMe7IiPqoE8x+zCjPeB6/ylNAzSkAbrbXKYu2/c4wpkQEq/fP
 YroLK3B2k9XQ1+ag/WmBqpBv+m+hyT6xaQ2sSPmT2tSl4d2WW2hI60bswjAf2Wb3GPrG
 3T7+etySE13mXNGV04m7BDhHqqOK7E4d7334JuYiIzllzyWN51KwpwX1bKNsf6jlZqen
 bPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740453274; x=1741058074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MTiii+zQqPJopvoIqRNCl49x8lpdFSLa6UIMeGztj1o=;
 b=A7/RiATsd10MTIVzEdx3ehNUCtWp5N5WhPOZleB0cb1fn6bWSz7MH6dxaip2PjulsG
 2taDMKQyUvWP8N6qQ3WV0gY2AH0uqjLBLIxeaurS/1kP8KDHGCwSdLNvlTzTco61cUsk
 XJUAWqCVyVZr97GM5u+3CUyzOSspIht6QPm4aeEvFV2oBkK39JOuPqy2VNmgW4Wi1vTb
 a0S3npkv0TNuwkJvr/xQ6IeiSakJDwT4ICxrioYNPGbwG27e60W3ineBYLgy0Pe59q/n
 SaF2NiEs98yCIZs6VVr0OglalfMNb4T5k2XxzV2NnqqgN48UFDCuIkTeiH16AiuFxbpR
 naZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoAYofR4zMP44xsltLyAn5Bnjt4N+zWfVqFng6l5GP7LadbcczlCoNkhT7HtJarXBZvxfTL94jon4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVJiDueHchza0e3/dx0OtD3rJWD+QmCRQSNDIgawJuh/WmUigx
 3I634DgcyPFh8/nTUcoizD/6AmPwXmTSjJeAZoqbijh0si7THhUK
X-Gm-Gg: ASbGncvqp2e1KqvklVCq0Qd/ArXUH6J64aPjFqYONn6x8CiXalbat5YcryCgXBSgcpT
 i9DXHXErYOCqej3XxzipSE3TM3Pbw+QCldl+HMX42Hzu1I4RjHzkEkH563lbP04l52cNR/h58A6
 84Z4De4QkysP98QrzzgWMQSL+QjO53Jp/k65ID/6CHLXXiyzBa1OBiXAgVWUMl5kWHXfz7tWN3t
 uywYbvfKa5HSXzqHJkqWgfpv/OUxFOUjtyXddxUhHle7ct5wUPhZFpbPpv6uQYMxSuU+oCvPH5M
 3Lfj96PdL6pszqX9qlma/PxkX9usNouuR967t5GQspICOOdfPUJfmgYno1j/vxGrsHK4h9dn1iF
 DjOc=
X-Google-Smtp-Source: AGHT+IENisR31wnapQP5UILjmjga6+1j4+iRyv5pEpuKq0rZqZjB5Dc4GFMjy8dLP7W44x5xyZLSqw==
X-Received: by 2002:a17:902:da90:b0:212:48f0:5b6f with SMTP id
 d9443c01a7336-2219ffbdf18mr96244445ad.9.1740453273602; 
 Mon, 24 Feb 2025 19:14:33 -0800 (PST)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net.
 [210.61.187.174]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2230a0ae9acsm3491085ad.225.2025.02.24.19.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 19:14:33 -0800 (PST)
From: Qianyi Liu <liuqianyi125@gmail.com>
To: phasta@mailbox.org
Cc: airlied@gmail.com, ckoenig.leichtzumerken@gmail.com, dakr@kernel.org,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, liuqianyi125@gmail.com,
 maarten.lankhorst@linux.intel.com, matthew.brost@intel.com,
 mripard@kernel.org, phasta@kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH] drm/scheduler: Fix mem leak when last_scheduled signaled
Date: Tue, 25 Feb 2025 11:12:25 +0800
Message-Id: <20250225031225.44102-1-liuqianyi125@gmail.com>
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

Hello Philipp,

Thank you for your patient reply. Let's first clarify the issue and send a new
patch if necessary.

As soon as it enters the drm_sched_entity_kill function, the entity
->last_scheduled reference count is incremented by 1. If there are still jobs in
the current entity, it will enter the while loop, assuming there is only one job
left. If entity->last_scheduled has already been signaled, it will enter
drm_sched_entity_kill_jobs_cb, but because null is passed in, the
last_scheduled reference count will not be correctly reduced by 1.

Because the prev pointer has been updated to &s_fence->finished, the
dma_fence_put in the last line only reduces the reference count of s_fence->finished.
The reference count of entity->last_scheduled was not reduced by
1, causing a memory leak.

We should subtract 1 from the reference count of the prev when dma_fence_add_callback
fails, which is called balance.

Best Regards.
QianYi.
