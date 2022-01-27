Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F44849DC6D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 09:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5ED210E49B;
	Thu, 27 Jan 2022 08:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EC310E49B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 08:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643271689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aqucoy4XGsTZkTOddjEsvTdomJ0r/Uc6V8VLwfxZoJ8=;
 b=BMfAGEs1ZTNGA4pleNrzUF2OWNZaYsNL2+UnOJS2bny6MXEt3s6qQG1gqpq8Z+W3h7QBeo
 PBjc40wyw2d3Ni5P0uKV49SeuggUksIU+PhwObtIde5XxH04flHYqvYCXu6Bd/sUz3qWyW
 F1q5qXQMm09JYkAgvogViAS6p4+6O+Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-eXj4EmU0P0u9ia3HoJ5Dkw-1; Thu, 27 Jan 2022 03:21:21 -0500
X-MC-Unique: eXj4EmU0P0u9ia3HoJ5Dkw-1
Received: by mail-wm1-f71.google.com with SMTP id
 z2-20020a05600c220200b0034d2eb95f27so1152625wml.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 00:21:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aqucoy4XGsTZkTOddjEsvTdomJ0r/Uc6V8VLwfxZoJ8=;
 b=wu8Lxl5FuPOsAq8iko8h8ZZXGFbDMDokHB45l8Ne+NDefj7mfEjF7RcN04FiYe1eKn
 oLD2BAoOmCcIgsGOL4bykQbKSGGmNbmS8XMAFImyhwsgMJud4TNwisSStcDSxDTUqpH+
 2Egm/+AvLQljOC7woB3//n1dML93q82jOm+kUZXClnMbunl0mssMsco0dG8Fz5YlLTQZ
 Ayb0/5Xngz4IZLyKsbiWvXsHMwDQ70ygl95Ny6OpJlLPsXpKASZrvW+Qk5+4Kk0njfPv
 Zhi7cqtPiiMygeNCHVDNgSK5brFkahbbZAtz1lx14vNybmL05VnNiIuRDpZIEyhEWYNt
 /XXg==
X-Gm-Message-State: AOAM530hxSQUXQAOJwKta8LRMDSU8tWVm1SDYoIEtwWzGoXCFVpIfbj2
 Ka29gBq9mk3sleM644aG+HHmBctvgLcoBjD9i/SkoVawFTPIACE2gAqDiE0ggMvMCTe2zfJA8hN
 IyLfkCOsL9JoIlbp7UrD1pRH6/2g2
X-Received: by 2002:a05:6000:15c5:: with SMTP id
 y5mr2159688wry.656.1643271679939; 
 Thu, 27 Jan 2022 00:21:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJ/ZlKYqVE0iVqFH4AaZjGEnemdYNWmvhTud3sB/CSRe+UTC4Mv6f2ZPwV9RWl4nRIixdB4w==
X-Received: by 2002:a05:6000:15c5:: with SMTP id
 y5mr2159669wry.656.1643271679638; 
 Thu, 27 Jan 2022 00:21:19 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id h20sm7466wmq.8.2022.01.27.00.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 00:21:19 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/doc: Add section in the introduction page about learning
 material
Date: Thu, 27 Jan 2022 09:20:58 +0100
Message-Id: <20220127082058.434421-1-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Linux DRM subsystem supports complex graphics devices and it could be
quite overwhelming for newcomers to learn about the subsystem's internals.

There are lots of useful talks, slides and articles available that can be
used to get familiar with the needed concepts and ease the learning curve.

Add a section to the intro that contains these DRM introductory materials.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 Documentation/gpu/introduction.rst | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 25a56e9c0cfd..35986784f916 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -112,3 +112,39 @@ Please conduct yourself in a respectful and civilised manner when
 interacting with community members on mailing lists, IRC, or bug
 trackers. The community represents the project as a whole, and abusive
 or bullying behaviour is not tolerated by the project.
+
+Learning material
+=================
+
+Since the Linux DRM layer supports complex graphics devices, it can be quite
+overwhelming for newcomers to get familiar with all the needed concepts and
+learn the subsystem's internals.
+
+To shallow the learning curve, this section contains a list of presentations
+and documents that can be used to learn about DRM/KMS and graphics in general.
+
+The list is sorted in reverse chronological order, to keep the most up-to-date
+material at the top. But all of them contain useful information, and it can be
+valuable to go through older material to understand the rationale and context
+in which the recent changes to the DRM subsystem were made.
+
+Talks
+-----
+
+* `An Overview of the Linux and Userspace Graphics Stack <https://www.youtube.com/watch?v=wjAJmqwg47k>`_ - Paul Kocialkowski (2020)
+* `Getting pixels on screen on Linux: introduction to Kernel Mode Setting <https://www.youtube.com/watch?v=haes4_Xnc5Q>`_ - Simon Ser (2020)
+* `An introduction to the Linux DRM subsystem <https://www.youtube.com/watch?v=LbDOCJcDRoo>`_ - Maxime Ripard (2017)
+* `Embrace the Atomic (Display) Age <https://www.youtube.com/watch?v=LjiB_JeDn2M>`_ - Daniel Vetter (2016)
+* `Anatomy of an Atomic KMS Driver <https://www.youtube.com/watch?v=lihqR9sENpc>`_ - Laurent Pinchart (2015)
+* `Atomic Modesetting for Drivers <https://www.youtube.com/watch?v=kl9suFgbTc8>`_ - Daniel Vetter (2015)
+* `Anatomy of an Embedded KMS Driver <https://www.youtube.com/watch?v=Ja8fM7rTae4>`_ - Laurent Pinchart (2013
+
+Slides and articles
+-------------------
+
+* `Understanding the Linux Graphics Stack <https://bootlin.com/doc/training/graphics/graphics-slides.pdf>`_ - Bootlin (2022)
+* `DRM KMS overview <https://wiki.st.com/stm32mpu/wiki/DRM_KMS_overview>`_ - STMicroelectronics (2021)
+* `Linux graphic stack <https://studiopixl.com/2017-05-13/linux-graphic-stack-an-overview>`_ - Nathan Gauër (2017)
+* `The DRM/KMS subsystem from a newbie’s point of view <https://bootlin.com/pub/conferences/2014/elce/brezillon-drm-kms/brezillon-drm-kms.pdf>`_ - Boris Brezillon (2014)
+* `A brief introduction to the Linux graphics stack <https://blogs.igalia.com/itoral/2014/07/29/a-brief-introduction-to-the-linux-graphics-stack/>`_ - Iago Toral (2014)
+* `The Linux Graphics Stack <https://blog.mecheye.net/2012/06/the-linux-graphics-stack/>`_ - Jasper St. Pierre (2012)
-- 
2.34.1

