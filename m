Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3A59C17F7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 09:31:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8254710E35F;
	Fri,  8 Nov 2024 08:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aZPXvhAw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B32310E35F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 08:31:36 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539f8490856so2176538e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 00:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731054694; x=1731659494; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eomDoovwmPoe3D4ex+kqfalwjw8M76GdHrO0gwpAifY=;
 b=aZPXvhAw5Q5xBAIwcLoiNtBmHcJts3jijFlE4Mn3JdmYKCc7t3x6h5K/Q76eD5IZ4N
 ZrEcJxsHiFHOQEuC/3InQRY+RubKLAPevbEZEB8OEpX3+8PYYSW0bOM1QgdTW/4s38K7
 n38cYKMUWeQupCAuYThzZjhXBrH2A5E1qWBgGcW2kQdm4cWp7G1KWB/MoYWJARseRjQm
 VgMr7j8WOnlq6iK2OzBQCeGN+WifjFFMhpyhQthMbWCvM61uU9LW4m7B1V4YhQbBcQIU
 1kFhXKA4/BvBdYcwmazpI5HKVc9Rq42VN54adEn0nJz2o/A7icaeX8fXuUmkg6XyEhdq
 Tmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731054694; x=1731659494;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eomDoovwmPoe3D4ex+kqfalwjw8M76GdHrO0gwpAifY=;
 b=R79tnpuDdILitFSNHsBEWN4cjJ244Gw2MWIhWVnZIXeNMmCciILtKBPNuaef43Bd66
 1mP3psLtJtQHiNYVALEDbY31PhGKkjuK9myljkUvq47CBE8j4xRVD3QOxNvP1zHg0//s
 aRk4I3z5bwF8uiYbe/t8+s1ZPhR39YqpMAyDiq28Mtc5Ah7gg6r00KLheEd1fIkJkH8A
 ragrvXL+wf8V0KK5NFy+12haEpx9Rvh/MavdtLHmqulYKm8+SdDXvsZDrUrLaGEN5KRL
 cZ694e8Ip1zBMBpy76/waXLvFvd/4kTPeUhje7YDGfoiI0stqYlZiqnz7/N0veWchlN9
 ANUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNKxQ3CUz9ITteb0NsFRwrb0k76qnP5+oLkeANALnq3s02gMtyHVE5tM3Gn/5D+mosd7UOXWluFUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfDZI5RoH56ID8kkTlk3p8e8bzbv/20YymoH4U1TvzfvvrSbBL
 6X2I2QGTWlXaIYTp418knDMj5g5C923Dn8d5yth44zvNtEY6OmC/bdYVsd/2Y/k=
X-Google-Smtp-Source: AGHT+IHHJY+9cAH5llReO38ypapsMnCYY1F1ljLHtnGaUqjvCgc24E6ZfcX/bL0Vg9ze7adUU8pTuw==
X-Received: by 2002:ac2:4c41:0:b0:539:8e77:9129 with SMTP id
 2adb3069b0e04-53d862be3b0mr1011744e87.44.1731054693893; 
 Fri, 08 Nov 2024 00:31:33 -0800 (PST)
Received: from aspen.lan ([154.14.63.34]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda04ad0sm3876370f8f.100.2024.11.08.00.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 00:31:33 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH 0/2] MAINTAINERS: Update with Daniel Thompson's korg
 address
Date: Fri, 08 Nov 2024 08:30:43 +0000
Message-Id: <20241108-new-maintainer-address-2-v1-0-47c9d71aac11@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADTMLWcC/x2MwQoCMQwFf6XkvIGmiBR/ZdlD2bzVHKySiArL/
 rvFwxzmMLNTwA1Bl7ST421hjz5EpkTrrfUr2HQ4lVxOIrlyx4fvzfprAOem6ojgwgqVlnEW3Sq
 N/OnY7Ptfz8tx/ADHucxGagAAAA==
X-Change-ID: 20241108-new-maintainer-address-2-ded1a0e61df8
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
 Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel.thompson@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=566;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=LfuXZV5ft4NyetZM+Ia2hzJO3hj04SYKybK95hZjwW4=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBnLcw8ZO3DFRnzO3TsLta1DOEJHXYLUWPOhwwrV
 flZaWazj9mJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZy3MPAAKCRB84yVdOfeI
 oeSUD/0RmeeQTzyONBemD5YD0uKvILwDE5tqA+PYWK3h1rz5yk6n9CK8e48AN03FCicxVDRkWcp
 nriAW3c62Pe8h5Maz7TDnMqIofcYtwuYyNUCFGFUCGzb8bo4MiRISe+OicZTA0W5acjPj+BTt4c
 pK4Yr0sfavL8rHovt4r8aSA9bggxB6LmhUo0Slu3V57FCRdDqSGg56YF/nUfdD1+0NpqMiJl0Jk
 KhfYzQJGKFDWtBQnt4zrdLZ5I/+rw7JomJeUx+MVLd++SMau/Rts0Ap7S7W9G4OHaPAQqJsXe2D
 DqEwKLN+rbq8A220mxxQEKBaeWSOJbFkg3GejuIdAIPD5K+TqRNLksCYJ6Ojmez2mieFUhwNZff
 h7EBE7aOlGsRAlPL3z92LmGoqDg1hyZlIBvLf1b4WGGvM15vIQbENsSy8BupQer87LyaC+5OV2b
 Mve795O6wEIyJsk/u4tjh/E4XxxUgZYjwpitfmuZvu3mf5AvEVSaUtdyM7NqQCqvjjTLQAvvsEi
 XbgIehLK9JREU8EcX4ztuQWe7f6tGMJrK1zAMjPnnWq/Yv5EJb4n/kfwFkgW49aSJeMtCfTKxyx
 qRHrtWxji/qLVZ7t8zoXSHluJOTXF53wxNxam0xLAxBBo5Q/xliOYF4ivSSjDI1g46l5zdiEc8W
 DGMFARpJGLMd7Dw==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
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

Going forward, I'll be using my kernel.org address for upstream work.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
Daniel Thompson (2):
      MAINTAINERS: Use Daniel Thompson's korg address for backlight work
      MAINTAINERS: Use Daniel Thompson's korg address for kgdb work

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
change-id: 20241108-new-maintainer-address-2-ded1a0e61df8

Best regards,
-- 
Daniel Thompson <daniel.thompson@linaro.org>

