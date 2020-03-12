Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955AD183DA9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 00:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE71F6EB5D;
	Thu, 12 Mar 2020 23:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814206EB5D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 23:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584057576;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type: content-transfer-encoding:content-transfer-encoding;
 bh=ejeFisR7chWYmT+9iXfyCXL3BgA70UKw+IBoJisNP24=;
 b=bs5Ej9y2ERh/i1iPqguIV5LdQ1DFI/unaK2rxsXc0rNzqF9VKOWxblGVj8XMP7L+vkodcd
 qBHPvjwAwY43VvEU6VfLHI5MYqFD0VGxwk/H4/MoIbllFvkzEibYT26mG7PDXqadlU6lK4
 /psY2HIbhSO0dzK5vL5QvaJKyXMmMaQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-iazcJ3Y-M2K--UKmXxiD-A-1; Thu, 12 Mar 2020 19:59:34 -0400
X-MC-Unique: iazcJ3Y-M2K--UKmXxiD-A-1
Received: by mail-qt1-f199.google.com with SMTP id n4so5670814qtv.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 16:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=ejeFisR7chWYmT+9iXfyCXL3BgA70UKw+IBoJisNP24=;
 b=et96v3NlMb4mRApJVzN1Z/FLkvTcF0auF4rJE7pJpVmLqwBwRad7Q66aBa9eeGnUYx
 JqgU0qelYo2kHrGPwnN434YlbtQzyfJc5+IaxGWVNW42ePUuKPTrcNbngRhpmuzs08iU
 z5Q/Bq8gwsJ9Oe/Ab6RAMxjNN52KD4kODsvl6DaGbfCOq5tngpmQZm9mcXMgtHdedReN
 GEgYF495bbUgZpqCfTojXc1859QOkK1l5L2bnhUYChwRxx7LD9m9Spfmxghw7+lGZ327
 RTh+BsIyz0rpE3P1d2NEELZIQL38J/4usRrZ0vVYHCjI92VGjHozl7tImr7LXj5NJ2W7
 H3Lw==
X-Gm-Message-State: ANhLgQ0cmP4wBDAJO/zWhSJMBO5HL/89KJ9jTvEhrKGkc+OYgA1iYdrt
 EU+Wwo6OgowNHw9MW0g4hPS9V0PJKMOcynhxqgKrQnC02ZG/vQ+SGKjeHSQcXAQOFoSgFrbqWkb
 6CWujniolGfkKevrE0X1cH1l2qzNv
X-Received: by 2002:ad4:49d1:: with SMTP id j17mr10108153qvy.124.1584057574023; 
 Thu, 12 Mar 2020 16:59:34 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsbEySjCF04zmVi6rEqp5pAohB4kdNC47Q7cgD2gNRUUA8bSLgyHujzrUKBe4Vh7MnlnoClNQ==
X-Received: by 2002:ad4:49d1:: with SMTP id j17mr10108140qvy.124.1584057573768; 
 Thu, 12 Mar 2020 16:59:33 -0700 (PDT)
Received: from whitewolf.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id b10sm7315685qto.60.2020.03.12.16.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 16:59:32 -0700 (PDT)
Message-ID: <bf16ee577567beed91c86b7d9cda3ec2e8c50a71.camel@redhat.com>
Subject: [PULL] topic/mst-bw-check-fixes-for-airlied
From: Lyude Paul <lyude@redhat.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 12 Mar 2020 19:59:31 -0400
Organization: Red Hat
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: "DRM maintainer tools
 announcements, discussion, and development" <dim-tools@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

topic/mst-bw-check-fixes-for-airlied-2020-03-12-2:
UAPI Changes: None

Cross-subsystem Changes: None

Core Changes: Fixed regressions introduced by commit cd82d82cbc04
("drm/dp_mst: Add branch bandwidth validation to MST atomic check"),
which would cause us to:

* Calculate the available bandwidth on an MST topology incorrectly, and
  as a result reject most display configurations that would try to enable
  more then one sink on a topology
* Occasionally expose MST connectors to userspace before finishing
  probing their PBN capabilities, resulting in us rejecting display
  configurations because we assumed briefly that no bandwidth was
  available

Driver Changes: None
The following changes since commit e3c3b6e66da1caeb39a504b03ddcdd3693e45254:

  Merge tag 'exynos-drm-fixes-for-v5.6-rc5-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-fixes (2020-03-12 11:02:52 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/topic/mst-bw-check-fixes-for-airlied-2020-03-12-2

for you to fetch changes up to 047d4cd2067b028e7bca906c5ce20f4c89b65386:

  drm/dp_mst: Rewrite and fix bandwidth limit checks (2020-03-12 19:07:49 -0400)

----------------------------------------------------------------
UAPI Changes: None

Cross-subsystem Changes: None

Core Changes: Fixed regressions introduced by commit cd82d82cbc04
("drm/dp_mst: Add branch bandwidth validation to MST atomic check"),
which would cause us to:

* Calculate the available bandwidth on an MST topology incorrectly, and
  as a result reject most display configurations that would try to enable
  more then one sink on a topology
* Occasionally expose MST connectors to userspace before finishing
  probing their PBN capabilities, resulting in us rejecting display
  configurations because we assumed briefly that no bandwidth was
  available

Driver Changes: None

----------------------------------------------------------------
Lyude Paul (4):
      drm/dp_mst: Rename drm_dp_mst_is_dp_mst_end_device() to be less redundant
      drm/dp_mst: Use full_pbn instead of available_pbn for bandwidth checks
      drm/dp_mst: Reprobe path resources in CSN handler
      drm/dp_mst: Rewrite and fix bandwidth limit checks

 drivers/gpu/drm/drm_dp_mst_topology.c | 184 +++++++++++++++++++++++-----------
 include/drm/drm_dp_mst_helper.h       |   4 +-
 2 files changed, 128 insertions(+), 60 deletions(-)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
