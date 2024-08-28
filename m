Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3872961C8E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 05:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBD610E48D;
	Wed, 28 Aug 2024 03:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Clu3aEuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CACF10E48D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 03:04:33 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2d3d662631aso4815059a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 20:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724814272; x=1725419072; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVdwfZoyZWde9aSN6zhMbNNaJxIyi5X3Dr8kaez296Q=;
 b=Clu3aEuRhnzMdUMy8wOj/duRMoZ/1e3LMsb7fx7HZno1QK1kPCAdggQpLgNLbt63oA
 KIZxnMzKI3uZYjkUbJcP4Ynet3nBCPYBThOJBIhVAaKjbBB5KkfhvYpqRcxGy18zTr+8
 3HoEjaZZuHDPGr11jvGO5sdmaVLwRrUpwhzfohix5k3dQKs2l0vKbzbqxGp/XZw66Ir2
 yUlBqD8inTk71l+c+fmF+0ZdofKmR6wHYhWiRNlDQPihEJFs6AiPhoRiL3RtAzBNwaFE
 oTYp2GFO9bRfjXtvX4Vk8TteNnb/Cx5BgS1Yg2OwMucRnc7RAsaUZWI8GnAxiPy+2en5
 Q2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724814272; x=1725419072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XVdwfZoyZWde9aSN6zhMbNNaJxIyi5X3Dr8kaez296Q=;
 b=Wi9PZn7AT6k2FCnhUvVdo7GmwayM+pZpvp4ohneYJuGG0/MXkCXyfNHv2FV8vyH733
 7AKQ0Ss+vEJZS9vdy+zAO6Oj5SrmdSZJ7OLJRn5TF1wWrNDijvttBvSVxPmUB4kWR/fE
 NyJp8RHO4AupFowRsyUSBwNwVNqbKoNq0Sbm/EC6UwO41kN/i6M/PrUibOB3xCvyMoWW
 b8Y6HttMSDFqg2w6rBlZmCF0Y4VGLiLB92kIwbhc0RYTz4Sq43Lo3pT5IUzIGIb1HXMT
 jtD+zrKxarSd+9/Fk/Ubu9xyYPcvxywezETvp5EiXE3GAhM9x86E7LBPMg/2LSX29931
 0AJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHujmJDbnh6dI0nrbT5c77wsIaZIBSVQupzvF3XXkfpc22cnIWDKtWia7lQqQGEN3+bCOv4Q2Z0Wc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3wKDAgFrjrr793Y7VMLaDCn3UJsSLMiZH1aqw4m+TueOhD2H+
 1X1Cp2gu+fVBZb/2n0aC/qjHTHmNiTTjhakyBfUf56Tr0eyiTb6X
X-Google-Smtp-Source: AGHT+IFb9q9yq9VVSwLC6AkI1/p1bhkyyRxy6O/7jYlaHznbpdfEJAgSG3Tzmhmlf5xXUEBbcGAPmA==
X-Received: by 2002:a17:90b:356:b0:2c9:61f9:a141 with SMTP id
 98e67ed59e1d1-2d646bf605amr17374556a91.16.1724814272564; 
 Tue, 27 Aug 2024 20:04:32 -0700 (PDT)
Received: from localhost.localdomain ([39.144.104.43])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d8445db8f6sm317977a91.1.2024.08.27.20.04.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2024 20:04:32 -0700 (PDT)
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
Subject: [PATCH v8 7/8] net: Replace strcpy() with strscpy()
Date: Wed, 28 Aug 2024 11:03:20 +0800
Message-Id: <20240828030321.20688-8-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240828030321.20688-1-laoar.shao@gmail.com>
References: <20240828030321.20688-1-laoar.shao@gmail.com>
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
index b8eec1b6cc2c..cf7c36463b33 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -1944,7 +1944,7 @@ static void ndisc_warn_deprecated_sysctl(const struct ctl_table *ctl,
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

