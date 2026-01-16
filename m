Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3139DD38678
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 21:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1A110E91F;
	Fri, 16 Jan 2026 20:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eSS9xI9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B220F10E1D4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 20:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768593995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RvRBiNn3PA4K2OZWbkrvyWY2CSIU7KWGY6L6xdZjPVQ=;
 b=eSS9xI9cvTfGtbsMoCAMaUkNxVTNtzY09ZqTXSRG7s2pRWgaARMVRgUiG1YQFwaBqQCuSf
 dkSno2kG+eut38xDHuje641vY6Kcndk2Cu0PQOmiqEabgorFguRRpAkgmYtZhakbDKOE/H
 Iw4lpsmX7aZhveCIAYOvvmEiqfLHAp0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-5AUQxd9RPQKwjA9WsrmA4A-1; Fri, 16 Jan 2026 15:06:34 -0500
X-MC-Unique: 5AUQxd9RPQKwjA9WsrmA4A-1
X-Mimecast-MFC-AGG-ID: 5AUQxd9RPQKwjA9WsrmA4A_1768593994
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-50145d24ffcso67773471cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 12:06:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768593994; x=1769198794;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RvRBiNn3PA4K2OZWbkrvyWY2CSIU7KWGY6L6xdZjPVQ=;
 b=d5RSQsWl63EccTcdynoMB+R7LcSdsXL7RnE6zNd52zaIh9Tvtmfcrshopo7ub+5EeC
 7uQXPt4hn4KAYdoqIDfWgPfBmzTl08C8XmWLkbsqtH3p7MHYK5bkbZXuxuXVcdbMD0/h
 cf5fbi0zJ1yp4IfmwUyD0P6CdlV+yFxUVhTt5aMr2OlShZB1eD9Jahdr9tttstoUu9JL
 JZbo05QpAymBS79yTGmpy9tO1OjJU7ecMP/0fFMz1K2notb+K524CcjhTNhCgqqZ6nCm
 GWQ0Mj2883RvefaqIFrhNV8vFLcVgP52FiUpDG0feMLMwOmr6coAP5/DYFx2Unjam9iX
 61lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdKNNuupMedCO8464itLKiOHweyoXYQQtY7iHvBoJQX/LeCwrVvktp4nRj5DBpkpJLECGBfkVQhvA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnqkWS2pZ0E7wQmIalT+6YHf9b5RYINb/NKjGEtwZReruoWU8D
 C+jdsggzGglcGkiMq6l+CR2bjS9vIWrnx99MsLDr1Pl84zKgtACWILMZQPT0XGZoZE500Tox7I9
 CM3/pDLAPYaVeB0EcV/QQUJaM24wC7JB4CVmgtXV6Am2bN0KYrlvVh4OAdhVOMhDNETyHEQ==
X-Gm-Gg: AY/fxX5Ef21C/PttQe8T+LTUn964xbk3umTpms4HP/7clanhBsAGVZ8h9jaxRwKOZjx
 0Z1ptmxBvQVDJuJZGMPbrjnysc0CwNsDv4zF2y+sWtWOvm8HU4G5Jl1Yk4nQHOQwA/L0UcuXtwp
 SA8F7WnFRzE98fuIYDw8322PvuXh9uhLP7wBGVrRKs8BizcXBbZurNWu4h1Q99Al7mdCDXludfr
 T+s0ngc6iYfc4w+z/l4obzLDJQYihJF80AH9UXx6gj9NTqhMOBHFbz5RN0tYj+ZpaRVCCqZQXMY
 LCrg4TiOfJ8FhucUOflTPQzfHiCRPEnzi0+TTM7myConfhV49KTQKo2b5go8DmgyGRU6BXLPt0P
 iwsnbWNSXNKlkIplF2tlZylyZsox9sdVryz010kibv7+2CqKMVpI=
X-Received: by 2002:a05:622a:283:b0:501:3aed:fa5f with SMTP id
 d75a77b69052e-5019f84ac6amr105057961cf.12.1768593993411; 
 Fri, 16 Jan 2026 12:06:33 -0800 (PST)
X-Received: by 2002:a05:622a:283:b0:501:3aed:fa5f with SMTP id
 d75a77b69052e-5019f84ac6amr105057461cf.12.1768593992901; 
 Fri, 16 Jan 2026 12:06:32 -0800 (PST)
Received: from localhost (pool-100-17-20-16.bstnma.fios.verizon.net.
 [100.17.20.16]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-502a1d6dfaesm32711711cf.2.2026.01.16.12.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 12:06:32 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Subject: [PATCH v3 0/2] dma-buf: system_heap: account for system heap
 allocation in memcg
Date: Fri, 16 Jan 2026 15:05:37 -0500
Message-Id: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOsQ6CMBRFf4V09pH21RZ08j+MQ20ftEOBtEA0h
 n8XiCYujme4554Xy5QCZXYuXizRHHLouxXkoWDWm64lCG5lhhw1FxzBRXOfGvBkBsjPPFKESNG
 2YGttZC2c1tKwdT4kasJjV19vKzepjzD6ROYrVAKFECcpuC4rpY61AgTabidHl0TOm7G0fdxsP
 uSxT8+9c8bN+UkS8n/SjMCBalUhWosNHn+lt2VZ3idtdsb/AAAA
X-Change-ID: 20260102-dmabuf-heap-system-memcg-c86a381d663a
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@redhat.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WRDZKLlRkdpihgDRYKAR3rBGYZ2Phniqu7_3oeI-Kn0_1768593994
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

Capture dmabuf system heap allocations in memcg following prior
conversations[1][2]. Disable this behavior by default unless configured
by "dma_heap.mem_accounting" module parameter.

[1] https://lore.kernel.org/dri-devel/Z-5GZ3kJDbhgVBPG@phenom.ffwll.local/
[2] https://lore.kernel.org/all/CABdmKX2_UOENujpW0dXe0Z0x+4V3onfGDmHf1DMOXfDha6ddOA@mail.gmail.com/

Changes in v3:
- Declare mem_accounting in include/linux/dma-heap.h, since it's
  intended for heap implementations. Make it __read_mostly while at it.
- Link to v2: https://lore.kernel.org/r/20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com

Changes in v2:
- Add a module parameter to enable dma-buf cgroup accounting, disabled
  by default.
- Split system_heap logic in its own commit.
- Link to v1: https://lore.kernel.org/lkml/20251211193106.755485-2-echanude@redhat.com/

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
Eric Chanudet (2):
      dma-buf: heaps: add parameter to account allocations using cgroup
      dma-buf: system_heap: account for system heap allocation in memcg

 drivers/dma-buf/dma-heap.c          | 5 +++++
 drivers/dma-buf/heaps/system_heap.c | 7 +++++--
 include/linux/dma-heap.h            | 2 ++
 3 files changed, 12 insertions(+), 2 deletions(-)
---
base-commit: 983d014aafb14ee5e4915465bf8948e8f3a723b5
change-id: 20260102-dmabuf-heap-system-memcg-c86a381d663a

Best regards,
-- 
Eric Chanudet <echanude@redhat.com>

