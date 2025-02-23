Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE16A42130
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4EC10E430;
	Mon, 24 Feb 2025 13:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ivbPEHxO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC43210E05A
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:44:09 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2fa8ada6662so7403513a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740329049; x=1740933849; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1hjFHt0d5k578dEe7TlBSwZUIRnR5xMHf3Vffd2Ioq0=;
 b=ivbPEHxOq0xuqgLEUhkVjcaOsL2Ai5HgVgaiHumoyx2BZmsMJrEuboTtz79IFQd9rr
 UDfpfXdN26gR21wmUtK+oV3thxIrnmdEYoEYzESvoAw8lltC1zv53HYv4YEd0URtZgZe
 GI1cFuuC5ihBL2VX5oyqeiCdmKgL1I/xdm8Go0s+qL979k477N+SatWOxu3gphuuwegc
 Rle8Em7wn/exYwS2cgXt3ZU73kZJqkuonEXGXvVFuf5Cj/5seal1ORghkLoQh6geQ9+4
 AxfdBTU+9gcPC5kl8IQSkJtD8UxT9ogF+RLUDyZ3Bj2hyTCo/B3mv+SMf89MfYQzyby1
 XXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740329049; x=1740933849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1hjFHt0d5k578dEe7TlBSwZUIRnR5xMHf3Vffd2Ioq0=;
 b=badDPy9d3HhAlJHoEn7knoTwK3YrGlgniXf+caM7tVwepTpdPLv3BChlXbolqRYeyC
 RfOqP5tUS1pmCyroz8HJlsHMY5rXvLMMFRV/Fyd4oNyX2600MwU5u/BpuuhYjepTD21u
 QApqjTWmL+CguHZPIp3/BnuhTA75TuUJhMskyiJXZ+WPfqu1XNAFfeFkVwVkDOdvOTMG
 IlZT6kYS6A8lqmt4XsArOCt9QBuIDI3Jr9BjiRgTOVDm2IQY1yfOIdHc/Jhy2X99KQvG
 S+fZc0DWySRvpf5O1SKlbZBmhL/8kUlBMYuJVDI03dEqQkUzlUX67/mGsrm98xQ/Qfai
 r5Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXln0lfU/kKlR9nf0si7Oyu+2HDXteta7oLL+3Ce0zKG5nGhsPbZUesfh55IlTdk0BkmEP1owCHfN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzguKqMfZqdz/OX+V3axjonpBai2DRhGvq5BEBggjxKsri+N8ai
 DMATRMdxCtLXYMzahNtgTrmYoiGkHdwO4ThhfD11KyylMdXWixXa
X-Gm-Gg: ASbGncvjzHqahwONt3Qf+NCDqZBB/MQrdRrQWozJwzsyUccOU6t+3ziDad8yRB5WJP+
 5hWBrrYFc01KXXEpXT3fDbJxRserZcIrsvYT2QmJ6/+E/Qymm4rZkOkgDfkauEc1tiGuPAQT9iz
 cwTae6VrB4CX+MCDbgQ004M8KokBRZ3f2ldU4mYEHTRFWPhPepZbHd+cDbDPzoCa9S5KNaTfGTd
 zqNxYUg3kvgg+KCJBlzX15UDYOxX+yqCEec6bOwaAfoKs7P3dYjq8GncKfNtbVky5yOSqYuaEa8
 R9+WF3cNozCStjBerLbGrAgEDPBL2Nk452oAEoWYguECZc7BGIUxrnld
X-Google-Smtp-Source: AGHT+IGfwHShsfiPT7dt9SjKmid9dTaP6+iTVws9nn060cC+xpKYlrmp1TQEmd1LFjVUXo+AvslnXQ==
X-Received: by 2002:a17:90b:4f4e:b0:2f9:c56b:6ec8 with SMTP id
 98e67ed59e1d1-2fce86adf4emr17900240a91.10.1740329049260; 
 Sun, 23 Feb 2025 08:44:09 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:44:08 -0800 (PST)
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
Subject: [PATCH 07/17] serial: max3100: Replace open-coded parity calculation
 with parity8()
Date: Mon, 24 Feb 2025 00:42:07 +0800
Message-Id: <20250223164217.2139331-8-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity8() helper. This
change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/tty/serial/max3100.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index cde5f1c86353..f5c487bdc56a 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -16,6 +16,7 @@
 /* 4 MAX3100s should be enough for everyone */
 #define MAX_MAX3100 4
 
+#include <linux/bitops.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -133,7 +134,7 @@ static int max3100_do_parity(struct max3100_port *s, u16 c)
 	else
 		c &= 0xff;
 
-	parity = parity ^ (hweight8(c) & 1);
+	parity = parity ^ (parity8(c));
 	return parity;
 }
 
-- 
2.34.1

