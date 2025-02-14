Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC69A35DAB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 13:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E531410E312;
	Fri, 14 Feb 2025 12:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fireburn-co-uk.20230601.gappssmtp.com header.i=@fireburn-co-uk.20230601.gappssmtp.com header.b="EqEGkPcs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD8B10E312
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 12:30:27 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4396a24118dso4180995e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 04:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20230601.gappssmtp.com; s=20230601; t=1739536225; x=1740141025;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z2dI+7x4cPYMDMuQzFVTVbgprvZXCQoq2S3VN/z2cAM=;
 b=EqEGkPcs5LuWeT8J36Zm/TyraZRx8k0AJNjLlLwbMRJV1lRN7MZMGUKWn8oZvDr0Et
 1YVLFfr0K1iynRvxMhiOIiYsqwjrT69HuRLKcx16hCMpqbe3fV1bjgtLPjoVY390DxNl
 uKimc24emJ+QokJ2GJ3hphkfor4XO58cJFp/X5m6TsGaucOtgHjxC3uUikDBGlCnFC0X
 HiC5W/P8t79p6wHtiCt/s0oxhnmvjtKXb5PAGL0GN2nHr5pAkBOffJmBP9E/Q2zHksnJ
 x3zkOgPcvhGQrg1NClalmUaL1GflHvFNAa7xhhEubx1Ui6T7c60ccyWW1GyA0WUlja4x
 eVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739536225; x=1740141025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z2dI+7x4cPYMDMuQzFVTVbgprvZXCQoq2S3VN/z2cAM=;
 b=bPOMElQ0U9TY2JtRJdRfZWB5oNQ6A1hFo2JJtaGaLKlv9IZPdPXonWc0/pq4uTNpCc
 S/xXdAASuiKi/F83oryZ8YKD6kxDkr/qxltxZkVSn8ffw4lF1dYDSYryATQJ+SQZ9VUy
 +4MjD1q3XBJ5agavC9Niw+/YB2Tp0994X8iD3YCz4r239KZnfFLIeXa7Y0m7iZjLobWN
 DoZJn9hTiC7J5hyIrhPFjTRtB/gS+qvMmkLrqN6sEl/d+Y5F0uHcLFYn9VwCER/9To5a
 28CDdy9KoQGebT64OnMtfuBbPtCrbqArcvA5bjgvG2qeuy9yc5zywe0z+9XKHkwgUIsX
 +Nog==
X-Gm-Message-State: AOJu0YxDtdxDwou2QBNMoAvwJMv2en5vYjmdEEc1d5AcAuxDJnYA/dme
 mGc/8UY02jSiVRFE9gYPO1nRg7spgNalSAse6rYWcCk2WQSe5gWlglgl/lVWzxI7ULRJdWewLX4
 degX3
X-Gm-Gg: ASbGncvBFWKFc/hHoh0jJXYiBhUg3GkH/hxfwyvbbiEeDc45tONylClwqskO+omFIVd
 t5cQopMckDpNLyGQ4KGCsgjMJ99sofB2+h0JhWMCgzKNwXKwtzHZr7Ti93FUVu0Aseq+3HV1v66
 8ImklRgEVkIp6v4xPKBioaz+X00vh6bjIdjpJbJHXZu8f+ew1TfXCnMIVpax2BiyHeraw/+117y
 fQ+4VPho2HYiuW1bA/7YxFXwvV+TjUL42StUX8OSsaABnvE8MGhA2SpTcTl/f63oGL9Qhpscd3H
 +5Q0NO/XXDjibzO08mZkLUzpcX8dkoo=
X-Google-Smtp-Source: AGHT+IGCQD77xku+meOzyrI1bcUCnZgHXnIz38TFV3FtoQW1Y7REKBbrlYtu4VB3khtjgBNZ2tNWgg==
X-Received: by 2002:a05:600c:5597:b0:439:59cf:8e16 with SMTP id
 5b1f17b1804b1-43959cf9023mr117883055e9.23.1739536225188; 
 Fri, 14 Feb 2025 04:30:25 -0800 (PST)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:8363:ff71:698c:eb67])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258f5efdsm4445049f8f.43.2025.02.14.04.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 04:30:24 -0800 (PST)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org,
 Elizabeth Figura <zfigura@codeweavers.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: Mike Lothian <mike@fireburn.co.uk>, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org, wine-devel@winehq.org,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 "Wolfram Sang" <wsa@kernel.org>,
 "Arkadiusz Hiler" <ahiler@codeweavers.com>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Randy Dunlap" <rdunlap@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Waiman Long" <longman@redhat.com>,
 "Boqun Feng" <boqun.feng@gmail.com>
Subject: [PATCH] ntsync: Set the permissions to be 0666
Date: Fri, 14 Feb 2025 12:28:00 +0000
Message-ID: <20250214122759.2629-2-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.48.1
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

This allows ntsync to be usuable by non-root processes out of the box

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 drivers/misc/ntsync.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/ntsync.c b/drivers/misc/ntsync.c
index 055395cde42b..586b86243e1d 100644
--- a/drivers/misc/ntsync.c
+++ b/drivers/misc/ntsync.c
@@ -1208,6 +1208,7 @@ static struct miscdevice ntsync_misc = {
 	.minor		= MISC_DYNAMIC_MINOR,
 	.name		= NTSYNC_NAME,
 	.fops		= &ntsync_fops,
+	.mode		= 0666, // Setting file permissions to 0666
 };
 
 module_misc_device(ntsync_misc);
-- 
2.48.1

