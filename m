Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5A24EC2E7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 14:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6111710E995;
	Wed, 30 Mar 2022 12:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB59710E995
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 12:03:09 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id t5so18514181pfg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 05:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=RTflF79o5OP29Yqh4bp0dgbknlfdt+57gJKaSZ3FARI=;
 b=VL0bzsmtcSUPzVyWP7mi0xQ+4ls81NJ7RtCQgXi2DxlyIwGPzKC06587rD0lq+YntF
 J85c0GMPkJOvT91ylfX/r1/DkdKq7NGD2dP9Zv6Mqa7ptY9zk4PB9nSJUZ0a6ZPFtot8
 Hla7FGOpLSQuDnHq41TpQjuLilt47tTDdeu/zQwgQH+7Sc5jUHVmr5C3D03yfbAFww1p
 PAnMBhUhd5AH5PPQstg/rnla/t9CJm4C5KH+DRU6sfALCPn2UvqctWysc2paQnH1tnqK
 M+9MFUXjLGRsywHbqZYXorXp6EQ2va7Y/8AfCYtTaFxAQa8o4oSlDEKniIc8LNkv9es+
 b4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RTflF79o5OP29Yqh4bp0dgbknlfdt+57gJKaSZ3FARI=;
 b=YZwLHSG8aFOKhaN55oI4VIGId13U1G/ALbSmwCXxySqKfxTfyvHeeNJ6HFI5nLVhEX
 xRwvdxitH6j/dWj6jE5ZEWPjcKHmuJdlGzkx53GcNItn54v8jk7GaYcq9p45+382uIYX
 n3TYVH8xUUzFmOzYxovWQUJr8khKLN43Layj5ZG+5br+jbN2zQDhnogenhw/JbppqqUT
 W+c7mhiGZKy4AnFWFm+SCDwUMTRz0FxuhHG4DmW1AvIvw/NjutzUDr0WXt7oPfxI+7ES
 lhSJPUNBo5Fg1RBjDkuZqFCW5oKZY8+o9UxmqjWv9f7tT2d3b21YOF+CXJzIQz+7ul5T
 NYgg==
X-Gm-Message-State: AOAM531XtunOSMS8gvi/Z+avx6fNzwXaVRYgGMseIwpj4MLaaN7WVp8/
 8w+BO895HJtyqygYJx2es73KtTmlTrE=
X-Google-Smtp-Source: ABdhPJy/PTS8tLtmbm8he2KZ/1O5Av4iSQIycqWogq9rw09/AWC/lro3H8I7WnDkdQ9eq5Y4Svij+A==
X-Received: by 2002:a63:4e:0:b0:37f:f3f0:2d24 with SMTP id
 75-20020a63004e000000b0037ff3f02d24mr5812726pga.526.1648641789354; 
 Wed, 30 Mar 2022 05:03:09 -0700 (PDT)
Received: from localhost ([119.3.119.18]) by smtp.gmail.com with ESMTPSA id
 d80-20020a621d53000000b004fae1119955sm23364301pfd.213.2022.03.30.05.03.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Mar 2022 05:03:08 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 0/5] fix missing break in list_or_each_entry
Date: Wed, 30 Mar 2022 20:02:41 +0800
Message-Id: <20220330120246.25580-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yakui.zhao@intel.com, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 airlied@redhat.com, rob@ti.com, alan@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of exiting the loop as expected when an entry is found, the
list_for_each_entry() continues until the traversal is complete. It
could lead to invalid reference or set 'is_*' flags mistakely.

To fix this, when an entry is found, add a break to exit the loop.

Xiaomeng Tong (5):
  gma500: fix a missing break in oaktrail_crtc_mode_set
  gma500: fix a missing break in cdv_intel_crtc_mode_set
  gma500: fix a missing break in psb_intel_crtc_mode_set
  gma500: fix a missing break in cdv_intel_dp_set_m_n
  gma500: fix a missing break in psb_driver_load

 drivers/gpu/drm/gma500/cdv_intel_display.c | 2 ++
 drivers/gpu/drm/gma500/cdv_intel_dp.c      | 2 ++
 drivers/gpu/drm/gma500/oaktrail_crtc.c     | 2 ++
 drivers/gpu/drm/gma500/psb_drv.c           | 2 ++
 drivers/gpu/drm/gma500/psb_intel_display.c | 2 ++
 5 files changed, 10 insertions(+)

-- 
2.17.1

