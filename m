Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AC6739239
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 00:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46E810E35C;
	Wed, 21 Jun 2023 22:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D3D10E35C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 22:06:31 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6b5f362f4beso5979a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 15:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687385190; x=1689977190;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JK0VrOChNls2gnXAPFXNlAkcfaLHX3qumvUvMuZb8fQ=;
 b=HBT7aNvQ9/0lOZBGTU/aMMtPfSpX+gUV4x1qNSU/y1cNhwhauphSbs0iFmIfoJZE0T
 6sbuM1r9v5WAemGBX2UyyEAavocyO0wdp2G0bRBtzXp3X3stQzvqGUHydBmiVBP5ZBRQ
 EFXcpSWNo30kWz2nwG8H++kcRJgqTZd3bkaYiJ6d802ovuXEKhJ8g1Jk5DIg4ZO7GwYV
 xBDn/BYWSfDAwZnUfM4mS07iQdqnNScE/vcpiqYuM3UltJfGUYP3Zao84EYgXTV0wiH0
 0MGyp58MfUtTVdz3iAGkwoHHT2q5lX0utM/ycEV5IHgI5nC3614rZh3TDctMyxAGrXjA
 odNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687385190; x=1689977190;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JK0VrOChNls2gnXAPFXNlAkcfaLHX3qumvUvMuZb8fQ=;
 b=VysrzwvjnwciZ0nx8/6uhKt5BTIQVDaN6cbNyl0Opr7pA3H95EF5Te9D625RPtqyq0
 mX+Gsd2OjYNTTi4/Si5Yvkx8q7/shLKgEwKuRqyrm44bYykKffZgpuYSS986oxvyV0AX
 B9fSgaL8fyPIcZkMUm6zX2hfor7Kdrk72ci8qX+C2jY4X4rVHTPFqVpn5yyn0EU3xOiW
 EidXY66F9uycCVF40n/47xYXC8G9V/MlyvCZuINMWKh+tKQJI5Nu5j57dy6333xnH/GW
 ABzg/mHkeb1RqXAJnFPVT+AYv1UP+aQ6cIa5YjH/eOileTGRDi/+1v0cj1nI92EBC6eQ
 7vfg==
X-Gm-Message-State: AC+VfDyWkG2oUG2Rq5HY27UL8QmYWSJyKMCdDFQKq3gKjTGC8qQ5xjZz
 gRUSoC48QesElzIQxKhzECo=
X-Google-Smtp-Source: ACHHUZ6h3GpYT62+BblCthS6pKiZlBs3ZJNxN8ROaGRwulVHq+v+K7zceKJauT9/jXHC1ihF4HUPEw==
X-Received: by 2002:a9d:6a54:0:b0:6b5:e151:baec with SMTP id
 h20-20020a9d6a54000000b006b5e151baecmr1423495otn.14.1687385190363; 
 Wed, 21 Jun 2023 15:06:30 -0700 (PDT)
Received: from smeagol.fibertel.com.ar ([201.235.4.68])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a9d7d07000000b006af8b60e2c3sm2288987otn.74.2023.06.21.15.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 15:06:29 -0700 (PDT)
From: =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH 0/3] drm: panel-orientation-quirks: Add some quirks for 
Date: Wed, 21 Jun 2023 19:06:12 -0300
Message-ID: <20230621220615.1253571-1-samsagax@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mripard@kernel.org,
 =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add quirks for AYA NEO devices:
- 2
- GEEK
- Founder

The quirks have been tested by the JELOS team that has been patching their
own kernel for a while now and confirmed by users in the AYA NEO and
ChimeraOS discord servers.

Joaquín Ignacio Aramendía (3):
  drm: panel-orientation-quirks: Add quirk for AYA NEO 2 model
  drm: panel-orientation-quirks: Add quirk for AYA NEO Founder edition
  drm: panel-orientation-quirks: Add quirk for AYA NEO GEEK

 drivers/gpu/drm/drm_panel_orientation_quirks.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

-- 
2.41.0

