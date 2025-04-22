Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C634FA972EC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 18:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A55810E1D2;
	Tue, 22 Apr 2025 16:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="C/nSrhum";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D3310E1D2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745340128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KK4TWsLp0PtMCarQy+1TyJOWeXbWvyau46qeTqoxrRM=;
 b=C/nSrhummkD4K59jj/rZIPnLgHY7tpuiuGin2D5tywU9sHxDGuS+Dpp3qRodEIzQYzDGQf
 +J2tPO7VFa65t1ZHffeeY5BYd8epgyVPWFEeULZozbPM4a1Fm5e6ReM/el5PiPOfWKn1RR
 A/zVMSctaaogMzUgrTxzKDY3e46y4vs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-PBZ-6V8LN1en_td6yQWA7A-1; Tue, 22 Apr 2025 12:42:05 -0400
X-MC-Unique: PBZ-6V8LN1en_td6yQWA7A-1
X-Mimecast-MFC-AGG-ID: PBZ-6V8LN1en_td6yQWA7A_1745340125
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6eb2480028cso92305826d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 09:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745340124; x=1745944924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KK4TWsLp0PtMCarQy+1TyJOWeXbWvyau46qeTqoxrRM=;
 b=A/rkKbKp+3jfdgLRTs5+Lcn7JgaruMm4R7gV+OltkNkCe4/97NiiVGjukpQy2d4rmv
 lDRsa0gixhBDCpgHEOVBg0LWOfAOvaLlhWxkTaGdssk3Xr271kNqnkbMAuwyuDudDvi1
 9qCUW7r6QlygH1uuCysiz5o0JjCU/lj+J/9d6lAHy93u1tM07g9ggY5DxXOIMN3UFGl5
 eHLPPf5dmKnWJlu3c8hTfjucpGIlKuvvzMX7oGO57T5utsOUED1HeTXpZ+I366rFFr7J
 ssDA5pJHOsY2u6qutR0bwXVJ4rTlvPUKMxtNTzIwGVPcFbmHgpwR/o22jQ3G8ADXY4R1
 I3IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWww7DrdIsV+3y6JC0xCs5Rl493inmnwexvPuGv4eGQ6ktodXkM2dig++4+zbzU52RDlTbpTbvC0FY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3iw+g2O/VJAkzwKXhLOkaIPgiPL2xF9/H6LiEbqkx6Buk6Kxu
 klJNeKnNrrBPoOL4bXGZBenKHWc81r6zlv16ohIuL4XlCRcYTd/pSy/qhSRC/vsYo3//7QdU5dl
 wNd4pdiDDv7HTd1Fe8EHnMZL3xS0FoG3Diw9cWicfuj9WRI/0vizRUPdUYLfdu5Guyw==
X-Gm-Gg: ASbGncv9gnGRQWKdZXLb65IVDeDAKtdbDexjtEE3f+sqznYxLFy2lZjmWNtgmYf4VAW
 W1uIbO0P93P8GqJOmedSM3teQx/G8zSSixESsYaTfrI0r8fpPyJm9TF78rt2W4bxS+fehIT2C1Y
 gzTMbJrProUiHZxjh2AWbC9JXgm7ExGgoePUdfieHKyYo545J2M42KJlaPLBehp60AmGQByoemv
 /hqV0W0e2v2bmpIEhI+hkkROXi2Ph1DASfsoGtGOLyIG6Iu/4w4SxCagAmVroDECYUeErgYQWXi
 CXYNuduPYjvSusHJ4aKh9tofGWZeBTYrToVtY5KYOgA=
X-Received: by 2002:a05:6214:c64:b0:6f2:c10b:db13 with SMTP id
 6a1803df08f44-6f2c44ea415mr295054736d6.5.1745340124694; 
 Tue, 22 Apr 2025 09:42:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHDj03Kvoy5X2geaEJFNrce1J9/+WUYtjeTgPtoN7cjkmOT88E1rMHseJK37Trf6aqqKx0kw==
X-Received: by 2002:a05:6214:c64:b0:6f2:c10b:db13 with SMTP id
 6a1803df08f44-6f2c44ea415mr295054326d6.5.1745340124403; 
 Tue, 22 Apr 2025 09:42:04 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2bfd182sm59451376d6.80.2025.04.22.09.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 09:42:04 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com
Cc: mripard@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
Subject: [PATCH 0/2] dma-buf: heaps: Use constant name for CMA heap
Date: Tue, 22 Apr 2025 09:41:46 -0700
Message-ID: <20250422164148.547798-1-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BBg5l8mrD0NkrcNIy2YocoGYSYrrZ0D0c9tpFyyHfU0_1745340125
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Hi all,

This patch series is based on a previous discussion around CMA heap
naming. [1] The heap's name depends on the device name, which is
generally "reserved", "linux,cma", or "default-pool", but could be any
arbitrary name given to the default CMA area in the devicetree. For a
consistent userspace interface, the series introduces a constant name
for the CMA heap, and for backwards compatibility, an additional Kconfig
that controls the creation of a legacy-named heap with the same CMA
backing.

The ideas to handle backwards compatibility in [1] are to either use a
symlink or add a heap node with a duplicate minor. However, I assume
that we don't want to create symlinks in /dev from module initcalls, and
attempting to duplicate minors would cause device_create() to fail.
Because of these drawbacks, after brainstorming with Maxime Ripard, I
went with creating a new node in devtmpfs with its own minor. This
admittedly makes it a little unclear that the old and new nodes are
backed by the same heap when both are present. The only approach that I
think would provide total clarity on this in userspace is symlinking,
which seemed like a fairly involved solution for devtmpfs, but if I'm
wrong on this, please let me know.

Thanks,
Jared

Jared Kangas (2):
  dma-buf: heaps: Parameterize heap name in __add_cma_heap()
  dma-buf: heaps: Give default CMA heap a fixed name

 Documentation/userspace-api/dma-buf-heaps.rst | 11 ++++---
 drivers/dma-buf/heaps/Kconfig                 | 10 +++++++
 drivers/dma-buf/heaps/cma_heap.c              | 30 ++++++++++++++-----
 3 files changed, 40 insertions(+), 11 deletions(-)

-- 
2.49.0

