Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A78C774EA39
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 11:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F315C10E345;
	Tue, 11 Jul 2023 09:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E723610E345
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 09:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689067353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VNeUtHToHX9TSwSUZuEWmuSdt/ULGx70Fv5eiNxlnsI=;
 b=MmSUCdYEXGnvD23ugOr05vNvwgRIlGoJjG/BqX62Xqb91IhwnXIz2fQsCzShhMwIaojVwC
 cO3xbEFYZAwEsXGhuBJLJluCOOZgWJ9xuy9ANMGExGqJluZDUkrVf6rK6Ev1LECJ6mYEcu
 nqw0Uv+8S7KozHrSUSCjhXQcY5Lx3KE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-CZI_vkbqNs-P-il1YYj-oA-1; Tue, 11 Jul 2023 05:22:32 -0400
X-MC-Unique: CZI_vkbqNs-P-il1YYj-oA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF6C12808E63;
 Tue, 11 Jul 2023 09:22:31 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A72A2C09A09;
 Tue, 11 Jul 2023 09:22:30 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: tzimmermann@suse.de, airlied@redhat.com, javierm@redhat.com,
 yizhan@redhat.com
Subject: [PATCH 0/2] Two memory leak fixes in drm_client_modeset.c
Date: Tue, 11 Jul 2023 11:20:42 +0200
Message-ID: <20230711092203.68157-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jocelyn Falempe (2):
  drm/client: Fix memory leak in drm_client_target_cloned
  drm/client: Fix memory leak in drm_client_modeset_probe

 drivers/gpu/drm/drm_client_modeset.c | 8 ++++++++
 1 file changed, 8 insertions(+)


base-commit: 2f98e686ef59b5d19af5847d755798e2031bee3a
-- 
2.41.0

