Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF65A77B94
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 15:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C27A10E098;
	Tue,  1 Apr 2025 13:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Zg+4L99x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7636710E098
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 13:03:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743512581; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UoHxfQUKAaXSemGjOESKYUCkgP7sqKeJKV+23Lxo4hD3Llsw1U5BBcXO4/+yaqEtaN5mLmB8pXSmrusrRg31MLDAf9a3p8S6C1lhtzxbVoISKpcEuv4RVrJZhrv1lfeepv98feOwpGHvFoaQpzdRhC6nwXgHJv/qs4DwK5K1/3k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743512581;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=relEiKc13eENm52bRCs3RiJ+RXj5koRdZHU3Otk5FDQ=; 
 b=IYFROvcScw/GcjlksmR2gRvKpBzIy0fg/wwrLMUuSUXuywaVAV1cuZc4Z4FKx8Ue6bMmqBAFCxwM4jbRizo5uwbZu1W89BARMCnAv9zN+0k5iIlQkPPSUObzs/MOYaHZnntCdzix5YLh657CAoBRCb14YDmjDMCjl4r4A3TEevk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743512581; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=relEiKc13eENm52bRCs3RiJ+RXj5koRdZHU3Otk5FDQ=;
 b=Zg+4L99xL+98wtsN/9QbnB2mYv7we1ANT7IZeJtxCi8myVoqLpJS4LqXRRjJy864
 mH5qttZrKMr+LTd4HlozjbXtuZ2WjkcObIBDc5z2EJ4Eu/t/N+YMJZtb9/3fSF+74rb
 BkssLS+aBVxP7uj1P8f86zAsIuJ4XVejWpcbnPRo=
Received: by mx.zohomail.com with SMTPS id 1743512580399914.8049633205814;
 Tue, 1 Apr 2025 06:03:00 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: [PATCH v1] MAINTAINERS: Add Dmitry Osipenko as drm/virtio
 co-maintainer
Date: Tue,  1 Apr 2025 16:01:51 +0300
Message-ID: <20250401130151.2238772-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

I was helping to co-maintain VirtIO-GPU driver in drm-misc with
permission from Gerd Hoffmann for past 2 years and would like to
receive new patches directly into my inbox. Add myself as co-maintainer.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 24e4d90a38d1..048dcf2a3675 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25153,6 +25153,7 @@ F:	include/uapi/linux/virtio_gpio.h
 VIRTIO GPU DRIVER
 M:	David Airlie <airlied@redhat.com>
 M:	Gerd Hoffmann <kraxel@redhat.com>
+M:	Dmitry Osipenko <dmitry.osipenko@collabora.com>
 R:	Gurchetan Singh <gurchetansingh@chromium.org>
 R:	Chia-I Wu <olvaffe@gmail.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.49.0

