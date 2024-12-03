Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1379E2928
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 18:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5D110EAD6;
	Tue,  3 Dec 2024 17:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="1BU2TDUp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A597D10EAD5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 17:26:49 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-434a9f9a225so56015e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 09:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733246808; x=1733851608;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9A/J5jkgomsMiHFvcuDoSxKD5NJW5y7f08S/zY5zTv8=;
 b=1BU2TDUp4qDFr6xE9piGIkYdMK+NhjbVKBnqFG7pSsOEozmuOnS6jzCHzPsnjItkoy
 dybPMcpJ30eIY/eAWAYRSyUhwg42Cjegjy2hM6JztK4mnnxd0evGFF64YayrB2HRDfZI
 rdBYuj7jXnZ7E6rKEH20meiBYq53rQCMHbq/0YURe68oXQYJHQZmZbhfmlav0Fop8uHy
 Uk6v1xdL5Uz7ibZ5c7DOTRi8x/MEbmm+gZRi6AIAPORXcfF8mJO3w2sIZtOW/thazswq
 XLn2zUcmvkMergZMIE8ixSPJr87kaSzbaAS1P/eJPTn93jHctwCwGDVQ5tuXl9C5puKY
 T9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733246808; x=1733851608;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9A/J5jkgomsMiHFvcuDoSxKD5NJW5y7f08S/zY5zTv8=;
 b=i1s5rq0RELvJ4ABLzMwBQKZHSwwCUtHY1qz0fflVLIENcwzToYIw5YiXyyvI32aeWy
 RDpRMq8ZurREHuhuwBWrdoetfuKEgiuCDptSv90qV8wT43nm6gIYLDqrbV01OsEXXz0z
 lXRpawZC5LKhCHfd8ZGQyaZbDiJL0ZxurMN/4Q6g3iIQMIiUW0nSfjSPl6dzaRtfJD62
 CEOvANMfJ0v0jEn1v3Imji7hDkkVfb7jLsvtWdUnqU8mweSeHJeNieRyKLeNjkraVlId
 JPqKPQQfeHrDuFJ4zDXByI/yNTUWvaLvuWcSYK7vfSfAQdLxFeHOuwFSnLULqi/3S55u
 IiCQ==
X-Gm-Message-State: AOJu0YzctK3R0LsCVhahG3EFiZ69hUPxGsqqNJ1z3kmko8/TrVhYwcmY
 td6ZaRoXRcD4S+U87B8cg3VqtgTHN8JTaKDHCEfWjjRJGDhin2+cJf+646bDig==
X-Gm-Gg: ASbGncspW6qKg82fq5xiRyY+zHkU3INkU6ybW2pGkIJpI5BTf4isowD3UTPftF2cDk+
 FB0vXKZk6f1wXnm+h0TDpC/WGLO8RKsAVlVQAInznLXQN9cT4W/o2FhPPlu8J8H9BkK8z1QV5Ww
 rn0byS4A9tqSIXTGxM+MhFnSsZyAfwJ8HZgHlpjrwRFmwmYtKFABMFvrj6x6Fo5/0/niv/Swi7z
 kgG5KTRmC5024oIx5l+NeqRG87OouZ9wH8F8g==
X-Google-Smtp-Source: AGHT+IFZqTIc4JHhlvLFIIqiUiNlQB9koDtYePpOB1Asac3qhzzJf/qabHheeO4gqnlhnImPyoFMHQ==
X-Received: by 2002:a05:600c:1f93:b0:42b:a961:e51 with SMTP id
 5b1f17b1804b1-434d04fbed7mr1401935e9.0.1733246807548; 
 Tue, 03 Dec 2024 09:26:47 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:92ba:3294:39ee:2d61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0f70d9csm201336315e9.38.2024.12.03.09.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 09:26:47 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Tue, 03 Dec 2024 18:25:35 +0100
Subject: [PATCH 1/3] udmabuf: fix racy memfd sealing check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-udmabuf-fixes-v1-1-f99281c345aa@google.com>
References: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
In-Reply-To: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
To: Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 John Stultz <john.stultz@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>, Julian Orth <ju.orth@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733246802; l=1642;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=Aq2zO2su/gJQZo1LKHbVMD9Hcz8GmXaQFYJOvJIHJUg=;
 b=nHri5mQURsQCt6qUqaiD5aSYbBqGWvkkFAyFFqtmxx/10lRP3oWxueAag4of6Gz9UdJJ7j6rF
 fH9tuFCVgXJDnU7/j0wwtosFko/X7UkQaHlRmJaTrIACgXmedoy/Ws4
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=
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

The current check_memfd_seals() is racy: Since we first do
check_memfd_seals() and then udmabuf_pin_folios() without holding any
relevant lock across both, F_SEAL_WRITE can be set in between.
This is problematic because we can end up holding pins to pages in a
write-sealed memfd.

Fix it using the inode lock, that's probably the easiest way.
In the future, we might want to consider moving this logic into memfd,
especially if anyone else wants to use memfd_pin_folios().

Reported-by: Julian Orth <ju.orth@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219106
Closes: https://lore.kernel.org/r/CAG48ez0w8HrFEZtJkfmkVKFDhE5aP7nz=obrimeTgpD+StkV9w@mail.gmail.com
Fixes: fbb0de795078 ("Add udmabuf misc device")
Cc: stable@vger.kernel.org
Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/dma-buf/udmabuf.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 8ce1f074c2d32a0a9f59ff7184359e37d56548c6..662b9a26e06668bf59ab36d07c0648c7b02ee5ae 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -436,14 +436,15 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 		}
 
+		inode_lock_shared(memfd->f_inode);
 		ret = check_memfd_seals(memfd);
-		if (ret < 0) {
-			fput(memfd);
-			goto err;
-		}
+		if (ret)
+			goto out_unlock;
 
 		ret = udmabuf_pin_folios(ubuf, memfd, list[i].offset,
 					 list[i].size, folios);
+out_unlock:
+		inode_unlock_shared(memfd->f_inode);
 		fput(memfd);
 		if (ret)
 			goto err;

-- 
2.47.0.338.g60cca15819-goog

