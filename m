Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA01795550E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 04:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA7F10E873;
	Sat, 17 Aug 2024 02:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cj4/4Wme";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12F110E872
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 02:57:51 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-20208830de8so10214715ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 19:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723863471; x=1724468271; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=by1YCv/9fNhFKuS7v7AkJGwNY9Y/YBFp3hXhZ5CbnE4=;
 b=cj4/4WmeV3a+2pOojcJLa727FWDjWjKNNb4rFrx4sdebeu48Mif6WvpETswwn1AtW7
 9s9rVTKjjysFHDDErYXc12A7jHBP9B5n+EefrTRUdsmgZs4sJqd7VpkdaVI5g0YkGPLC
 i6qk+J4DZ32KEBVskMWtSGjz5Hyan5SE8omhgpA+Scl2Lw+BZ1TIzE6WsNat7/Aysxpx
 eIED6Atfi81EjAQtvbFvdydCalLaqBmZ8z1Ad2hwo0jNG2tCkXnaFngz9jVYUNbBuRcK
 nXCPiVumuMtQBGZTkr5L+fN3BNzh1MTItbUkN+CLrDZUjSQcUeMSEqMZCER1ZL2hfgQI
 aMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723863471; x=1724468271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=by1YCv/9fNhFKuS7v7AkJGwNY9Y/YBFp3hXhZ5CbnE4=;
 b=hx2O0csVIbH8GgeFjdS3zZSsegBNyciRtU3vbOPcwEQddLrOcrfYbyyWpiNOYYXj0C
 peb+PyYdJeokGnG1MYIeUgsA7OZ7IwLPe92JpPG50IOyiHOjj/yDgJtl+013tLYRmkFk
 J7GAI4PVxNeXicPueLzkw+GEyYJ5VPln5uyzdTpGEgcSPXb6HkohmQS3NZBQtw9RVIuY
 PQQMI+fCpytIjt/91UfUN0QGA5ccnDy4sZN3XVpZSFtDKvBhOZwf0+jJOQFdXwfsDpSk
 PG9MpLyICHjLVX+1I2x+K2WRFe0HG7EVRlGJYf+i9Mv7zKX9iGcaC3DHJJdi/Gfe8Fj/
 pIVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+9lVeIXqT7OQnXM67xozuvmXW4rwm1hshVoMntfYdX6hPXFSaEy3p9EuwPqqIbSYtro3Wg8suPUQ3MuD1lQxmWAXlK0FafjpKL5wfwGAK
X-Gm-Message-State: AOJu0Yztld2T1vF8XC1PSuno42Y0uVd1/1Ob0rzLaKUv3A0TS7jcF3hv
 QPHcUCJxDSSPKh9HlvhbSXQySGTLR5dHaWQQn5Cz3M1Eqg3l/rxT
X-Google-Smtp-Source: AGHT+IGmy8Jt8i1r5v72uMgbTh9QfFBoOAd1ReOek6MsKKuMaUCDeTlIuXQ+GXacq0NZtUUeDKoREg==
X-Received: by 2002:a17:902:e542:b0:202:162c:1f36 with SMTP id
 d9443c01a7336-202195ff1e3mr12511865ad.36.1723863471180; 
 Fri, 16 Aug 2024 19:57:51 -0700 (PDT)
Received: from localhost.localdomain ([183.193.177.10])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f031c5e1sm31801785ad.94.2024.08.16.19.57.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2024 19:57:50 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, alx@kernel.org, justinstitt@google.com,
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v7 7/8] net: Replace strcpy() with strscpy()
Date: Sat, 17 Aug 2024 10:56:23 +0800
Message-Id: <20240817025624.13157-8-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240817025624.13157-1-laoar.shao@gmail.com>
References: <20240817025624.13157-1-laoar.shao@gmail.com>
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

To prevent errors from occurring when the src string is longer than the dst
string in strcpy(), we should use strscpy() instead. This approach
also facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: David Ahern <dsahern@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 net/ipv6/ndisc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
index 254b192c5705..17f2e787e6f8 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -1942,7 +1942,7 @@ static void ndisc_warn_deprecated_sysctl(const struct ctl_table *ctl,
 	static char warncomm[TASK_COMM_LEN];
 	static int warned;
 	if (strcmp(warncomm, current->comm) && warned < 5) {
-		strcpy(warncomm, current->comm);
+		strscpy(warncomm, current->comm);
 		pr_warn("process `%s' is using deprecated sysctl (%s) net.ipv6.neigh.%s.%s - use net.ipv6.neigh.%s.%s_ms instead\n",
 			warncomm, func,
 			dev_name, ctl->procname,
-- 
2.43.5

