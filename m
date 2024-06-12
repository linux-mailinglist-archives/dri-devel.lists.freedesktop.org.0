Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1D7904C54
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 09:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0AC10E29A;
	Wed, 12 Jun 2024 07:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="jv00Z7rX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 494 seconds by postgrey-1.36 at gabe;
 Wed, 12 Jun 2024 00:19:07 UTC
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA80F10E186
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 00:19:07 +0000 (UTC)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 83D8F3F274
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 00:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1718151050;
 bh=yA3GemOLta7ptddMW/7rnk7IdpnukaO6SkrLIQz3nbM=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=jv00Z7rXmMaB0IN49bfULAKzmdiXfaoKIcZwFbY2xWZDGy7PEaunOsHeXr4ZsNb9F
 uHBHXbvYAuBLvuNbVPIgoTqpNNjDbI0VRS1YF86XHyCr5xaQoF1/kw64tfXDmZrW+J
 Sf0x54oQb/hdKoGyHc98GAQgPWaFDgaF7Qy3Mdjv62+9Z2GHeAfInS+mCWqzKbpJoz
 lPGgqFajaggWlmFQcBy//hpuPdWs94iTTES7nIQ6WoQC/PfTKhzSeutxqemj8smgag
 HK37T1j3i+RdIskEwy5tMMaAAqu+uHRF0i8Cx76v0kG4RPzWzBajxKx0a7U6l3D9+1
 wliTdKOFN1nRA==
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1f837db4e1aso3253585ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 17:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718151049; x=1718755849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yA3GemOLta7ptddMW/7rnk7IdpnukaO6SkrLIQz3nbM=;
 b=p7cnlND4676b35jS/mQE170TS4bMVJQRu66BHnq1WN5j8vfGBrgbLGEI0HkQzq0r2m
 8uVWGwxzOYyBachSxndN69YXRMcDf4NOQ4BEYPFfcKHc6c8EyMMrIoSEBRtSxT6GHH1m
 ST3hJrGBf93hEcgOhOIeAmfjP+7NchKXnMgRCPZ59NJESO2sW3FBumnVMRtYKCufAz9l
 bBUiHFez6h4k9DDMb3sobShn6xKMdShP7pt0Y5U+pHI4LmwLjm8rz2USkhHNKylM5a9v
 Ir0ILZLOwp+IkOQ+Fl4oiwy3i5MR09Vg+u/nd/QbXGORkJCFnl14YiGw7GcOHHQTOs5t
 TSVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV73SDdLiuPVMDSEpMvD+MiYYNdEtsyuTT6GbYKm5ZKVwEz0Nf/8mI5piBiXffOYSV7sfrd9C/cTKqveADdUgSKTCDOf2wEjshxnMlgYLhh
X-Gm-Message-State: AOJu0Yy5FfOXTY/zmljYf7JiljVtRckzzjqaOU0HBDHjOPmKYDsGz9Ui
 uI1+R6NrM2StMAw4ZXE/BE290900d6ahawm43S9bBJJlWLO3UDW6+MYg/XlMutToGMDIWyP2uus
 NUL6l9ULmLYH26mApMsq51bzkU8OxHBVv/4mppj4u5YMPB0iMBTAXugCBmUg7jz828w05X8OCV8
 V5AaksIQ==
X-Received: by 2002:a17:902:db11:b0:1f7:e32f:f067 with SMTP id
 d9443c01a7336-1f83b6eacfemr5651225ad.50.1718151049195; 
 Tue, 11 Jun 2024 17:10:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtrQz+Z+est4OL6JMDV7Qe9u9duB8be/MwTdrnQYsCLYsrV7LoeCf5ZBBuNVwo06AB7Snq9g==
X-Received: by 2002:a17:902:db11:b0:1f7:e32f:f067 with SMTP id
 d9443c01a7336-1f83b6eacfemr5650975ad.50.1718151048830; 
 Tue, 11 Jun 2024 17:10:48 -0700 (PDT)
Received: from ThinkPad-X1.. (222-154-76-179-fibre.sparkbb.co.nz.
 [222.154.76.179]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f71ad56202sm38921265ad.276.2024.06.11.17.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 17:10:48 -0700 (PDT)
From: Matthew Ruffell <matthew.ruffell@canonical.com>
To: w_armin@gmx.de
Cc: Alexander.Deucher@amd.com, Christian.Koenig@amd.com,
 Felix.Kuehling@amd.com, Prike.Liang@amd.com, Xinhui.Pan@amd.com,
 Yifan1.Zhang@amd.com, amd-gfx@lists.freedesktop.org, bkauler@gmail.com,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 sashal@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] Revert "drm/amdgpu: init iommu after amdkfd device init"
Date: Wed, 12 Jun 2024 12:10:37 +1200
Message-Id: <20240612001037.10409-1-matthew.ruffell@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <fe03d95a-a8dd-4f4c-8588-02a544e638e7@gmx.de>
References: <fe03d95a-a8dd-4f4c-8588-02a544e638e7@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Jun 2024 07:07:57 +0000
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

Hi Greg KH, Sasha,

Please pick up this patch for 5.15 stable tree. I have built a test kernel and
can confirm that it fixes affected users.

Downstream bug:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2068738

Thanks,
Matthew
