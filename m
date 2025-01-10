Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4B6A0895B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 08:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F18910EFF5;
	Fri, 10 Jan 2025 07:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VpMdIEYG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B7910EFF5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 07:46:05 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so20540415e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 23:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736495104; x=1737099904; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZEI1xXEiy3eHX7ZLavdCZHjpLbi/8PV+p3rxj/veojY=;
 b=VpMdIEYGzJYcLfWEyOjPCYFp37bbDb//FNWltlQsvyOSBMwz4Z367xOKKUudA7TF4A
 eDjB3Qp9/hEEUNXO+BCfX8zcltOA64q4YJr8mbj//gTZneK4gpcDi+riIncTTGb/BfB+
 IC5SAra6aHtKslVX8p8TaaCSIYX0m5KIcf8d/dwdLt5HLXYHEv9VVst0IRFAWq1CLzoA
 3ZRfn05jO6rqO5+eUIWQXWGiztfuPVxNUNY5j+uSTnScnCedgrJjkketzUl5gaGiOa4v
 zSEoYU5k+dgt/EfnMe62XRkpEDG68vOOpg4dWksC+FbS0G/rdc/0y53v3sIwazKzViNR
 Kpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736495104; x=1737099904;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZEI1xXEiy3eHX7ZLavdCZHjpLbi/8PV+p3rxj/veojY=;
 b=rBokOCsGlr/0FrSm7dNzePBNHpH2ONk+VCQmFURFlOgJ3YnTK26i4nTEJvD3dSevQ9
 jxZnfOy/ga5KlISWsNn1lm9yJkLTf5qYVLQ8TMSkR9AEl8pqB8k7/I4FF2AyqaDnASq0
 RXQz52qIzv20uYHpDmcOo6SBTe/x7xMLmwuzUzGCn08mu3g/dyP0exzwsGldGMUzVzVC
 6/lvhWec8EODS2ioNLmNPCMLzN6wqEUrwSrXbzA01qhrHue9d4B7DCsCq5AgX29vpMzg
 8vKmohZPKzAP2dimjYnrR+0lmHMuXd/EKTlcf3LZKC10+/EI05/3xSjZyV+7GMdOrgvY
 jMEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX73qG0Puksd6BYsgGa0I12m5hfqJp8j1rvaExZr4Er4RwTO6lMBUA+5sP0R0TP/45Dw/jCbsp0wB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoNOohc6shu/BtzqQUYwAmf8tQyIB62aBNwMs4jyqfydrhD2yr
 5s4kj6r8n7M3kGB2/9cZLfT9L7aO6UiwYdrHB7pDR1B83X+3N7Jf
X-Gm-Gg: ASbGnctlOH5ewIan3UdxK/7I6+2eU7DLe0djMQJdWytYBJ2HkNsTTs7zhOMvZ/+UX4Y
 TRUfrvyRczHRyA5cCylIJg2898zZfATuHFx/JjoB7AoREyx/7TvQABLg3etr0fq6KS0GryS8+H2
 Y/Xpyx+xkxzsHPb6ZVXw+MVCZX/1Tzc68RnXxDrCPAqgdGh7dsJvGnWpoLd5l/J22b/ACKravOE
 GT6j+B7XpccNIch2BS3nqe47Mmclv8tQAWxiEWsz7PBquktkj3pkUjwdslTfg==
X-Google-Smtp-Source: AGHT+IGGDp1CS4LIVQFO1s7kZIcIY03EtBwCuCHImR+v3eVBXdZXO+UFRjBaqrAUDU0Yd3vhoReXcQ==
X-Received: by 2002:a05:6000:4612:b0:385:dedb:a148 with SMTP id
 ffacd0b85a97d-38a8732c728mr8125988f8f.46.1736495103960; 
 Thu, 09 Jan 2025 23:45:03 -0800 (PST)
Received: from toolbox.. ([87.200.95.144]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e8a326sm78547995e9.35.2025.01.09.23.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 23:45:03 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/meson: vclk: revert and re-fix vclk calculations
Date: Fri, 10 Jan 2025 07:44:56 +0000
Message-Id: <20250110074458.3624094-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Patch 1 reverts a previous fix for loss of HDMI sync when playing YUV420
@ 59.94 media. The patch does resolve a calculation issue. It also makes
all fractional rates invalid which is a bigger problem.

Patch 2 provides a proper fix after I figured out the actual root cause
of the original problem. This time the maths checks out.

Apologies to the stable team as the original patch has been applied to
a wide range of older and LTS kernels (as far as 5.10). Please let me
know if combining the two patches into a single 'fix the previous fix'
patch would be preferred?

Christian

Christian Hewitt (2):
  Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
  drm/meson: vclk: fix precision in vclk calculations

 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 42 +++++++++++-----------
 drivers/gpu/drm/meson/meson_vclk.c         |  7 ++--
 2 files changed, 25 insertions(+), 24 deletions(-)

-- 
2.34.1

