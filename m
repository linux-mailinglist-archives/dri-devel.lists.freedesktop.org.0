Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D02AC1E90A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 07:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B1A10E031;
	Thu, 30 Oct 2025 06:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cXRJAvWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494AF10E031
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 06:31:52 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-77f5d497692so970824b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 23:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761805912; x=1762410712; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IteJbnpQxtDfi0VoQZa3f0/zEOSuD+t4NwFKFFHXmzw=;
 b=cXRJAvWTJIQ9kxsFSHM41atDpr48MBRne1r4MuhwI7QTgfhXAdAxZ+EuvQmGyxEn6l
 SeDe99fWC+rPpBzuchl8DnFVKYwq4fzykKAK3UfuhZ8B3h+48sHFvxmtTNen+h2ie1MJ
 MLALfIdKh+wj8dZn19ZiQKh+BG/ddZiRWIsOhNWEFBWp7iOm5WJta4zsXZxWAiq/+0ph
 iCVcvpURdFi/KDy1VfAVy0RV1HvD268O7sVdDKErCMz8vCwYUgO7xvyQvO1JBLUufNVZ
 bKCcVp7iNsQIj+XTwaqWk/9OhKSD+yiSrH7lfHvulFFzgDFfJvpCkldYiopzkNXnSHZP
 EoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761805912; x=1762410712;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IteJbnpQxtDfi0VoQZa3f0/zEOSuD+t4NwFKFFHXmzw=;
 b=V2udQ4ImaVSebAIdvstL8IHhVqvJlBZI9+vLq9p7sksPyNOqKNHpzs+MSM0IPkvJRj
 U3hKn0282QICv2mA5q3i4Ki4863vjGq6MeFddPftXMv8t8OPB4KqRyUO6bzzfKP5qv/8
 vAMVbmPFSGZMwMk12GdSmeRw3aTjjVNkwqmUNKFCdC33NdA67G5fTXosc8+8o12ttNgT
 fsJikiCJ8O3tisqj95UZdjPEr3c2I8BwlLkHMHmAK9HJXtPKkn5X/iQ4rzRLDNd4r5BS
 e9Bet1+NSMm2tAtAfJJOzh1KNx7Wo372tzIxKh6wOqXxcC0KvwQpN3NtEnIEkrO+5mfa
 zoBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsSD5bVUk9KyAscKkBB+zbBdy8ra4PB6NdYG4n4nPpQmXcjbRLypxYz8G7DaAKwgm3PMSepPQ0OkE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxubP42iPLJVX+pbnRqnZVd7V2iGd+48xlggnu1MLjRrMO2sVbz
 cXyXl56m9I+Od3SfLk5JwgurrmncvVdDjA7+M9Zu+Lkjuc5K06GnEb+m
X-Gm-Gg: ASbGnctSzJhhngoGlXF2SLRlFRR89zjDeEVC3cUw063KsthYmF3zi1XI9SrxbN5vRnn
 emoNaweVxWyLKGtISJvwzw9xEMkYox9vk6iK0fZ2Hc+iPg5It29E69BEti5kF3fShDcLEinAGro
 kkN4B2eauRhhaTI2TicltVX+uXGXvGYkTw4hUiV4Zni838mbNfRHiWJwZNcwegtRr1kpz7H9RWO
 VzmC5I7XjhwTwjB8SWzMay8K7T/B2QCiQMABvYNk2yP3zMX8ZaKo9QSby3EP2v25IarULwPztZl
 13gE31XdVeYzMlMoWtVmxKX9JDrxJm/8og8P3vAVO9qyUvHKXWed4rxYYax3VLVItwA86mneZkC
 fF7SeD3hcy2k94l4alyeAX3peGfPl89TuO2F4tFg/C7a3NvsKQjOEe7wacoxzsF41A//J7bkpvI
 qFX/aa1tkS9NEfsOU2Zzv4O9JVKU9StTbgwOlMitb3lQuXqG2jlAewXpw=
X-Google-Smtp-Source: AGHT+IHNvKCn04TUtBKiitaic4J2q30Yzc+qOqNpAkIf4/fyYDmwz0RWuqOmy8D+jYX31HnPUWKBbQ==
X-Received: by 2002:a05:6a00:2e23:b0:780:f6db:b1bd with SMTP id
 d2e1a72fcca58-7a62a361761mr2569135b3a.4.1761805911695; 
 Wed, 29 Oct 2025 23:31:51 -0700 (PDT)
Received: from stravinsky.localdomain (ip72-203-100-4.oc.oc.cox.net.
 [72.203.100.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a414049a44sm17200296b3a.35.2025.10.29.23.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 23:31:51 -0700 (PDT)
From: Jessica Zhang <jesszhan0024@gmail.com>
Date: Wed, 29 Oct 2025 23:31:45 -0700
Subject: [PATCH] mailmap: Update Jessica Zhang's email address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-mailmap-fix-v1-1-8534ffa12ed3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFAGA2kC/x2MQQqAIBAAvyJ7TlDTkL4SHcS2WkgThQjEvycdZ
 2CmQsFMWGBmFTI+VOiOHeTAwJ8uHshp6wxKKCOFsjw4uoJLfKeXG6FH7Y22Vk7Qi5Sx6/+2rK1
 9ezZC/V0AAAA=
X-Change-ID: 20251028-mailmap-fix-50434c548816
To: neil.armstrong@linaro.org, lumag@kernel.org, robin.clark@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15-dev-509f5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761805910; l=1226;
 i=jesszhan0024@gmail.com; s=20251028; h=from:subject:message-id;
 bh=EvEXTz0KOxz6r+4dee3gAhObDEZ9RzGv4u6rNYbYStE=;
 b=4AiNnU52GcTLFxFVrVFNRtBIYgDMcsTe1X5gNVFGem6rW0dpFbRAMuLF/g8ZuCZZ4pAV7ZETd
 /Cm12ZhzY7PD6ExKeMtG+CG5/e/RDBmWXFODJU9FyALDeZ1gLr62emS
X-Developer-Key: i=jesszhan0024@gmail.com; a=ed25519;
 pk=Qjsztzh+H8Xz0uqVst7N2PHX5Vnd3JXONpkaTHqk/Pk=
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

Update mailmap to point to my current address

Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jessica Zhang <jesszhan0024@gmail.com>
---
 .mailmap | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index b77cd34cf852..1c57bd649f04 100644
--- a/.mailmap
+++ b/.mailmap
@@ -352,7 +352,9 @@ Jesper Dangaard Brouer <hawk@kernel.org> <hawk@comx.dk>
 Jesper Dangaard Brouer <hawk@kernel.org> <jbrouer@redhat.com>
 Jesper Dangaard Brouer <hawk@kernel.org> <jdb@comx.dk>
 Jesper Dangaard Brouer <hawk@kernel.org> <netoptimizer@brouer.com>
-Jessica Zhang <quic_jesszhan@quicinc.com> <jesszhan@codeaurora.org>
+Jessica Zhang <jesszhan0024@gmail.com> <jesszhan@codeaurora.org>
+Jessica Zhang <jesszhan0024@gmail.com> <quic_jesszhan@quicinc.com>
+Jessica Zhang <jesszhan0024@gmail.com> <jessica.zhang@oss.qualcomm.com>
 Jilai Wang <quic_jilaiw@quicinc.com> <jilaiw@codeaurora.org>
 Jiri Kosina <jikos@kernel.org> <jikos@jikos.cz>
 Jiri Kosina <jikos@kernel.org> <jkosina@suse.cz>

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20251028-mailmap-fix-50434c548816

Best regards,
--  
Jessica Zhang <jesszhan0024@gmail.com>

