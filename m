Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F3519280F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 13:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3E26E846;
	Wed, 25 Mar 2020 12:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5276E7D9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 10:40:57 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id ng8so867453pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 03:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DvKg2IHi3Qj70iBHg+WUL8Lkjl5cn54XoVnrEhL3Mm8=;
 b=jjB2X695zwinTyCqhhpHsSpEM1BFt/EQHCZAQkZrno2Ypr109M5Xwhg20kV0IpfCqs
 y0terG7TofI2Q9YoV1N7NVeZ74FBif6BvbIVxdnIdXBHZWnUtMGkRPfdtsBSW1RAFlnx
 CTblKpJvHFL+XYXDBQHhLGUh3VBAfgLTAF4+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DvKg2IHi3Qj70iBHg+WUL8Lkjl5cn54XoVnrEhL3Mm8=;
 b=SQ/FpOD72GB+zajuIlyu3jdKy8+r38tAzcn5dXq3xtPeISILEtkIQ6izK/H92xWfER
 1+XOKHPwkG50XBKPeUekas2n3Z4vlU4pekGGxyhBlrTL5S/6kj1C53I+Uxa9Ewv1vf8/
 r1WqGixL/0Z/DW1YW4hvZkrRWlwQPRbS7deTpkYlWdHK99LMCGLuuDptUYg9S6RbIuOE
 TixNyg+rHaodpMza0Aa+BCx2yQNmgKLBzJ3LYL0Kf4DPEIhJMOFJXuNykEZyke7ihQBf
 0f07p0bwwgl6EYh811tNDE0tpkroYwX0nmxaAQ16knEoQD6IbIhLPKP6xYdp7R/lRTMZ
 TsAg==
X-Gm-Message-State: ANhLgQ0miLFwrQH7t7q2qf8jzaja2+DHXU4d6OTrzOiRnhBctu78MFer
 kOr/JlPKuCipJFPdNFVFqrOf4w==
X-Google-Smtp-Source: ADFU+vvXebHRwUAL4QYgPA/E5Nymgdnz5gpZduRO6NtNGffciBeXDeNZkR6KYzkdrkpatyvnsfHqjQ==
X-Received: by 2002:a17:90a:6501:: with SMTP id
 i1mr3013827pjj.32.1585132856562; 
 Wed, 25 Mar 2020 03:40:56 -0700 (PDT)
Received: from keiichiw1.tok.corp.google.com
 ([2401:fa00:8f:203:863a:e217:a16c:53f2])
 by smtp.gmail.com with ESMTPSA id v26sm5150320pfn.51.2020.03.25.03.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 03:40:55 -0700 (PDT)
From: Keiichi Watanabe <keiichiw@chromium.org>
To: virtio-dev@lists.oasis-open.org,
	linux-media@vger.kernel.org
Subject: [PATCH RFC 0/1] Support virtio objects in virtio-video driver
Date: Wed, 25 Mar 2020 19:40:38 +0900
Message-Id: <20200325104039.196058-1-keiichiw@chromium.org>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Mar 2020 12:19:30 +0000
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
Cc: Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
 linaro-mm-sig@lists.linaro.org, alexlau@chromium.org, tfiga@chromium.org,
 Kiran Pawar <Kiran.Pawar@opensynergy.com>, acourbot@chromium.org,
 "Michael S . Tsirkin" <mst@redhat.com>, egranata@google.com,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nikolay Martyanov <Nikolay.Martyanov@opensynergy.com>,
 Keiichi Watanabe <keiichiw@chromium.org>, kraxel@redhat.com,
 hverkuil@xs4all.nl, Dmitry Sepp <dmitry.sepp@opensynergy.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 virtualization@lists.linux-foundation.org, posciak@chromium.org,
 stevensd@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This implements a feature in virtio-video driver to use exported virtio
objects as video buffers. So, the users will be able to use resources
allocated by other virtio devices such as virtio-gpu.

The virtio protocol for this feature is proposed by [1].

This commit depends on the following unmerged patches:
* Virtio-video driver patch [2]
* Patch series for virtio cross-device resources [3]
* ChromeOS's local patch to use data_offset for offset of multiplanar
  format [4]

[1]: https://markmail.org/message/wxdne5re7aaugbjg
[2]: https://patchwork.linuxtv.org/patch/61717/
[3]: https://patchwork.kernel.org/project/linux-media/list/?series=254707
[4]: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/1057eb620ccd3da4632c14df269d545cb9a1ccb2

Keiichi Watanabe (1):
  drivers: media: virtio: Support virtio objects in virtio-video driver

 drivers/media/virtio/virtio_video.h        |  26 +++-
 drivers/media/virtio/virtio_video_dec.c    |   1 +
 drivers/media/virtio/virtio_video_device.c | 131 ++++++++++++++++++++-
 drivers/media/virtio/virtio_video_driver.c |  25 +++-
 drivers/media/virtio/virtio_video_vq.c     |  81 ++++++++++---
 include/uapi/linux/virtio_video.h          |  15 ++-
 6 files changed, 243 insertions(+), 36 deletions(-)

--
2.25.1.696.g5e7596f4ac-goog
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
