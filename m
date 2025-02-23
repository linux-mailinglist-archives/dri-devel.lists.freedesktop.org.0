Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E829A42127
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1739A10E3FA;
	Mon, 24 Feb 2025 13:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TcbjY5F9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2F010E055
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:43:13 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-21c2f1b610dso104706585ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740328993; x=1740933793; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BwB7nlCWtszUSdGoti59nJGyNKtl99nOClvJi35M3DI=;
 b=TcbjY5F9llG5KpGis4CiAGSoAGzD1jGkAzzhZz+cFamsKjDpsnUjUOObWxgT36NDB+
 M6iwJgcnt1NgE+ZX2AJCODZW0O7/KVz6yGytMmr5v6Z521VSsin7kqpxse0NMBo6w+oO
 4qafoiGYIo19pBImGhQ1kj6IumYlDRxi1Sdjz/48WoA6sTUmRo6iv6EKmGmQMZUTTVSJ
 xB3KLURIVh+gq+g0w8mFDIYYsUGqTfCcAJ00Q8C0fj7pnKdzUaT34v7yAeGA/DFS9ajj
 LwmU7/8mxAzZqoH63h8quJmd0gej3hpH9JhFRlnZ1q1x4ZN8udTiZeg/deXZkXJeRDN6
 iDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740328993; x=1740933793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BwB7nlCWtszUSdGoti59nJGyNKtl99nOClvJi35M3DI=;
 b=EmKyKcQbh9QO/vsrPwygm3eJGYNBISKNV5wfNpZPQVhaF+YkIOpa4eLJceCBjfxiWi
 KTBgOeFakCij6/Rdw0saixR+6WJO29QREu/H49wuooAGjK1moRWwfynLLmOWVxIhPjfU
 DYkqH0i3Do3SEBLBlvXkGFtDKtnnfWzAjE+1mieWvK70BuYEg/FK5z64Lal/sKgKfQ+c
 3XY5O/WV+8cO/RDfeRMmZ9riPShWZPNXqaWw5ZB9dTOj/9WXzYb/sDXv6WKrIM3OhgDe
 DJSPOqgpRCgJdFYHm09cQcSMzy/MPhW4ELzP1VKbPNhoSDg2ZpV+aoPY0C49K9o948vP
 e9lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVLMhFbMTp+3Nx0kuTtphQvkwCfKM/upsjOF4w/ni4YDQJBR0/DpgmxrNbxn/DOe1QSjSvq+1r/TA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcCV32BlcRITxyEAlyztDu9WC7Un5KR0K0uIP5Dxk23/sUggOA
 lvNctXtXAK5dfEjJ+G7osAoNekJ2slRu+DmVU/4ZvkdD4LCfiJtF
X-Gm-Gg: ASbGncu32Ales59gWbJqIJkLLEf0rirtXDd/QxtvD+AG+Gp+oIcpepFKHWWwIUwA12e
 i51hPawy3CqFKkiOy1YotxsAszb3Btj1tx/V4/tcGKwcYt31h990Lcn350pKDPnOcPwFpbWn+RM
 aMETNBI7rL/XsbK4cRx3sY2myfu8EwIRzXz7RjAgtcgJF1lfog3tEWeAbyjtqO1KbErTB/bfsJr
 agAXoKNn0eFc4wM07BfAZWac94vCF5COH8xUDrKTQimP8r/5mwXp2NT0iaZCHzwISx0AqjlmWdg
 RIQ/B0Xv5mAOZYyZT+DyoywMIA/60fj9KtdjwZWLDc3/aM+KT/Wl+DMq
X-Google-Smtp-Source: AGHT+IE58QWfaLQcoNHwIYpospn75AI8MBIDPjCyLRCCZKoYKvgXR3FRMWiJgPdm5hfaVo9o7EyRAQ==
X-Received: by 2002:a17:902:ce05:b0:21f:baa:80c1 with SMTP id
 d9443c01a7336-2219fff2c88mr180524175ad.53.1740328992776; 
 Sun, 23 Feb 2025 08:43:12 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:43:12 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH 02/17] bitops: Add generic parity calculation for u64
Date: Mon, 24 Feb 2025 00:42:02 +0800
Message-Id: <20250223164217.2139331-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
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

Several parts of the kernel open-code parity calculations using
different methods. Add a generic parity64() helper implemented with the
same efficient approach as parity8().

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index fb13dedad7aa..67677057f5e2 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -281,6 +281,28 @@ static inline int parity32(u32 val)
 	return (0x6996 >> (val & 0xf)) & 1;
 }
 
+/**
+ * parity64 - get the parity of an u64 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u64 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ */
+static inline int parity64(u64 val)
+{
+	/*
+	 * One explanation of this algorithm:
+	 * https://funloop.org/codex/problem/parity/README.html
+	 */
+	val ^= val >> 32;
+	val ^= val >> 16;
+	val ^= val >> 8;
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
+}
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word
-- 
2.34.1

