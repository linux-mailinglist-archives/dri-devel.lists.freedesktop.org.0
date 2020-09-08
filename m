Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A4F261359
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 17:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C8C6E85F;
	Tue,  8 Sep 2020 15:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F87D6E867
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 15:18:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z1so19590240wrt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3a/pKfNTcctsi5NMPeYXrn0Dqu/AbgV0+iD767DAkfk=;
 b=NJ62SxAYUNxu4wcmx23rzjC0yurPxVJ86uAMywAwLtKYtunOkXMT5kgoHOR/25NA2R
 vYdYurAJ1EX+InbHWiXPsmj6g8LHhZdY7XCo0ZHf00lyrl1axgUFNprhhjXOkQVwCp1f
 zXXOL8kxE/98FJDIfQqSuGGU0QFzRNrogY7xjpAQ3fzwnjP11rJwvTEBeU6GtDCZ2Zf+
 6GuYjQlqpzeRgOGSZ0RTUuzPde+Dgpfon7qdQFhPz7KpzO5ayMlKTLNyK9JmLeCF0RmS
 KrFS7MfiUwxJF0wm0vyb4kkKCVg0KEIPGStgaWElGD8vwcnf8tKdcBPFPNSg0DrTlyHR
 bmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3a/pKfNTcctsi5NMPeYXrn0Dqu/AbgV0+iD767DAkfk=;
 b=rjCTRXFQ5xoNkuoBnuvjBskcb25BH3/1yxKek9S/vmiLeg8wB+z+ZbhOu2M63wJUoN
 n+nrJPSl/30ogCGbrMA7rIHIETCuO5//K7HtAqJW76fCeY7Vret+iD1tkCufDzXBmC49
 2IKWuqfJBtixBxJXwcKl2XfwMBjdnRH5Ir59V38cUrDge/87MSGn4ESB/hiLnViaESDg
 n3uiv3rfo1ZegIR79Wir8YPPGNTnQ+YcXdimiPzxAXmjB1nDiqRZHGvVngz3GomA4Ulf
 VxAXVtc3NuyKp1MRWEQHpkNJsEVSKAqoj6eY8ZRKda7ok6P3uUyQiVi8f/XndI72aCqk
 tA3w==
X-Gm-Message-State: AOAM530EwwHFd9TRv53423jqbZ7oTdg3llqRNPeu9+F09zagbLAXL8w9
 X2L1WZfcww2d/YRt7tt402dNyRavcCPAl4PW
X-Google-Smtp-Source: ABdhPJxoedfun5a5jObY/rI/dRKE9z7QNbsGMa2l9zbVlFHBZ6rsBniEq+5NHWlHqnC9szuSHALYXg==
X-Received: by 2002:a5d:684b:: with SMTP id o11mr137401wrw.101.1599578337783; 
 Tue, 08 Sep 2020 08:18:57 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d25sm10004886wra.25.2020.09.08.08.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:18:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH 0/5] drm/panfrost: add Amlogic integration quirks
Date: Tue,  8 Sep 2020 17:18:48 +0200
Message-Id: <20200908151853.4837-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The T820, G31 & G52 GPUs integrated by Amlogic in the respective GXM, G12A/SM1 & G12B
SoCs needs a quirk in the PWR registers at the GPU reset time.

The coherency integration of the IOMMU in the Mali-G52 found in the Amlogic G12B SoCs
is broken and leads to constant and random faults from the IOMMU.

This serie adds the necessary quirks for the Amlogic integrated GPUs only.

Neil Armstrong (5):
  iommu/io-pgtable-arm: Add BROKEN_NS quirk to disable shareability on
    ARM LPAE
  drm/panfrost: add support specifying pgtbl quirks
  drm/panfrost: add support for reset quirk
  drm/panfrost: add amlogic reset quirk callback
  drm/panfrost: add Amlogic GPU integration quirks

 drivers/gpu/drm/panfrost/panfrost_device.h |  6 ++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 18 ++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 17 +++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h    |  2 ++
 drivers/gpu/drm/panfrost/panfrost_mmu.c    |  1 +
 drivers/gpu/drm/panfrost/panfrost_regs.h   |  3 +++
 drivers/iommu/io-pgtable-arm.c             |  7 ++++---
 include/linux/io-pgtable.h                 |  4 ++++
 8 files changed, 55 insertions(+), 3 deletions(-)

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
