Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDDA508205
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76AC10F1B7;
	Wed, 20 Apr 2022 07:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9693010F1B7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 07:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650439461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=70+NNt2xtRmHQqLOMHsElopnyuSB4rdpz+fN4EuTmaU=;
 b=hC7KtBwqKEusVwUJWnZwYZJDR2nt/cdp1YQf2DLXWlCpjZMqud57HfrUxy8aHospkWAQpa
 7DBhxHwb7s3B+hDu54kTTD3yaqLxr+1OeVLfD5AGvNivLV+txTLg8sayBX+XMQxRjKySiq
 HWni8nGz3hDRWp5lkLxnrojl277q37E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-m7d-QFm2MQq82wCg_VziqQ-1; Wed, 20 Apr 2022 03:24:20 -0400
X-MC-Unique: m7d-QFm2MQq82wCg_VziqQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 b10-20020adfc74a000000b0020ab029d5edso107176wrh.18
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 00:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=70+NNt2xtRmHQqLOMHsElopnyuSB4rdpz+fN4EuTmaU=;
 b=tLUdbZQjIDf0ilZeU+WQIJIw7zIyrHJoUbK2CJOTBdqzGGCinFZErjvAWbvmSBGl/i
 xTa4bDg+lRptFzspgP8jaLFXPVcYIGK5wSa7On80g5/a33FhRBn8FrrkGe0YXk1XLs7L
 BXlEE1MI/lrUhjbZ0uhQVnJMkBsQL7yBKH5AXwYnAJQebbxMQkCjDwu8kZ1eumFDPnk1
 4vXvUX60G7mg7CWJDYPBI50FAUwBs2iEtImgDagHQ3O3XzQbISN1P7u+69XkoTVeSp6N
 4PM1B+ZlG94Sh7KTTqwISOLr7vmw7jV1qEH9lZ52g62PKKzQIgLsnoFBgy4MbMhGg90V
 ZTFQ==
X-Gm-Message-State: AOAM532nS0O46JXOvWsKbUhpWImQsAYuiJIb6C5/P2wYedgc5oX/6tak
 Xhgp9XMHC0XNTw5GLQRRr3PTSS/SxDLcBh3U/GZkxZ0QoIi4f+To4YozedSkRBR90DBrKQ//XMa
 ooWVuO3pZCwWl6uCQLtMjrsfdXJUa
X-Received: by 2002:adf:e5d2:0:b0:207:9be3:c080 with SMTP id
 a18-20020adfe5d2000000b002079be3c080mr14296717wrn.519.1650439458939; 
 Wed, 20 Apr 2022 00:24:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnCOhTmNd8q/c576iu7dDGltRjR3ltNWqTw2/47SyRKDaivg8p55/9kL/BCNiJ6SF0CgqILw==
X-Received: by 2002:adf:e5d2:0:b0:207:9be3:c080 with SMTP id
 a18-20020adfe5d2000000b002079be3c080mr14296698wrn.519.1650439458646; 
 Wed, 20 Apr 2022 00:24:18 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adfe0c7000000b002060e7bbe49sm17026889wri.45.2022.04.20.00.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 00:24:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/doc: Add sections about tiny drivers and external refs
 to intro page
Date: Wed, 20 Apr 2022 09:24:11 +0200
Message-Id: <20220420072411.15104-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Learning about the DRM subsystem could be quite overwhelming for newcomers
but there are lots of useful talks, slides and articles available that can
help to understand the needed concepts and ease the learning curve.

There are also simple DRM drivers that can be used as example about how a
DRM driver should look like.

Add sections to the introduction page, that contains references to these.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---

Changes in v3:
- Fix typos and grammar errors that found when re-reading the changes.

Changes in v2:
- Remove paragraph that gave wrong impression that DRM is complex (Pekka Paalanen).
- Add Thomas Zimmermann's and Pekka Paalanen's Acked-by tags.
- Replace "Learning material" title with "External References" (Thomas Zimmermann).
- Add a section about tiny DRM drivers being a good first example (Daniel Vetter).
- Add some more external references that I found interesting since v1 was posted.

 Documentation/gpu/introduction.rst | 60 ++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 25a56e9c0cfd..f05eccd2c07c 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -112,3 +112,63 @@ Please conduct yourself in a respectful and civilised manner when
 interacting with community members on mailing lists, IRC, or bug
 trackers. The community represents the project as a whole, and abusive
 or bullying behaviour is not tolerated by the project.
+
+Simple DRM drivers to use as examples
+=====================================
+
+The DRM subsystem contains a lot of helper functions to ease writing drivers for
+simple graphic devices. For example, the `drivers/gpu/drm/tiny/` directory has a
+set of drivers that are simple enough to be implemented in a single source file.
+
+These drivers make use of the `struct drm_simple_display_pipe_funcs`, that hides
+any complexity of the DRM subsystem and just requires drivers to implement a few
+functions needed to operate the device. This could be used for devices that just
+need a display pipeline with one full-screen scanout buffer feeding one output.
+
+The tiny DRM drivers are good examples to understand how DRM drivers should look
+like. Since are just a few hundreds lines of code, they are quite easy to read.
+
+External References
+===================
+
+Delving into a Linux kernel subsystem for the first time can be an overwhelming
+experience, one needs to get familiar with all the concepts and learn about the
+subsystem's internals, among other details.
+
+To shallow the learning curve, this section contains a list of presentations
+and documents that can be used to learn about DRM/KMS and graphics in general.
+
+There are different reasons why someone might want to get into DRM: porting an
+existing fbdev driver, write a DRM driver for a new hardware, fixing bugs that
+could face when working on the graphics user-space stack, etc. For this reason,
+the learning material covers many aspects of the Linux graphics stack. From an
+overview of the kernel and user-space stacks to very specific topics.
+
+The list is sorted in reverse chronological order, to keep the most up-to-date
+material at the top. But all of them contain useful information, and it can be
+valuable to go through older material to understand the rationale and context
+in which the changes to the DRM subsystem were made.
+
+Conference talks
+----------------
+
+* `An Overview of the Linux and Userspace Graphics Stack <https://www.youtube.com/watch?v=wjAJmqwg47k>`_ - Paul Kocialkowski (2020)
+* `Getting pixels on screen on Linux: introduction to Kernel Mode Setting <https://www.youtube.com/watch?v=haes4_Xnc5Q>`_ - Simon Ser (2020)
+* `Everything Great about Upstream Graphics <https://www.youtube.com/watch?v=kVzHOgt6WGE>`_ - Daniel Vetter (2019)
+* `An introduction to the Linux DRM subsystem <https://www.youtube.com/watch?v=LbDOCJcDRoo>`_ - Maxime Ripard (2017)
+* `Embrace the Atomic (Display) Age <https://www.youtube.com/watch?v=LjiB_JeDn2M>`_ - Daniel Vetter (2016)
+* `Anatomy of an Atomic KMS Driver <https://www.youtube.com/watch?v=lihqR9sENpc>`_ - Laurent Pinchart (2015)
+* `Atomic Modesetting for Drivers <https://www.youtube.com/watch?v=kl9suFgbTc8>`_ - Daniel Vetter (2015)
+* `Anatomy of an Embedded KMS Driver <https://www.youtube.com/watch?v=Ja8fM7rTae4>`_ - Laurent Pinchart (2013)
+
+Slides and articles
+-------------------
+
+* `Understanding the Linux Graphics Stack <https://bootlin.com/doc/training/graphics/graphics-slides.pdf>`_ - Bootlin (2022)
+* `DRM KMS overview <https://wiki.st.com/stm32mpu/wiki/DRM_KMS_overview>`_ - STMicroelectronics (2021)
+* `Linux graphic stack <https://studiopixl.com/2017-05-13/linux-graphic-stack-an-overview>`_ - Nathan Gauër (2017)
+* `Atomic mode setting design overview, part 1 <https://lwn.net/Articles/653071/>`_ - Daniel Vetter (2015)
+* `Atomic mode setting design overview, part 2 <https://lwn.net/Articles/653466/>`_ - Daniel Vetter (2015)
+* `The DRM/KMS subsystem from a newbie’s point of view <https://bootlin.com/pub/conferences/2014/elce/brezillon-drm-kms/brezillon-drm-kms.pdf>`_ - Boris Brezillon (2014)
+* `A brief introduction to the Linux graphics stack <https://blogs.igalia.com/itoral/2014/07/29/a-brief-introduction-to-the-linux-graphics-stack/>`_ - Iago Toral (2014)
+* `The Linux Graphics Stack <https://blog.mecheye.net/2012/06/the-linux-graphics-stack/>`_ - Jasper St. Pierre (2012)
-- 
2.35.1

