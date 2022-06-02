Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6692753BF86
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 22:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDD711315B;
	Thu,  2 Jun 2022 20:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D0B11315B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 20:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654201103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TnS4+yN79bqCT6DPECtmSXvee2nqSqVMp98E9aCZC38=;
 b=E6tbzNVoZs9DmfH3mXQKATufbPHUqVI2BSJG64HnMDISZI9SOBStEJMxKx5xlcbJIsveC2
 oxz1Ug+1qyHZSYKDn2bxNNcjClhV7SHYIqq993cHRGlBD4wfvnna6ADW+lIVlfn09vWZgS
 Ogw9yC7bIAgPvMfzwkhY8EwJG1DO2hs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-k8aD-IKIOjKpSHO4Cy5_ag-1; Thu, 02 Jun 2022 16:18:14 -0400
X-MC-Unique: k8aD-IKIOjKpSHO4Cy5_ag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9DEE185A794
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 20:18:06 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.34.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89246414A7E7;
 Thu,  2 Jun 2022 20:18:06 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] Misc drive-by fixes for MST helpers
Date: Thu,  2 Jun 2022 16:17:54 -0400
Message-Id: <20220602201757.30431-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm now (finally!) finishing up my work with getting rid of the legacy
MST code and makng everything atomic only, and while doing that I ended
up coming up with a few unrelated patches along the way. These are those
patches.

Lyude Paul (3):
  drm/display/dp_mst: Don't validate port refs in
    drm_dp_check_and_send_link_address()
  drm/display/dp_mst: Fix drm_atomic_get_mst_topology_state()
  drm/dp_mst: Get rid of old comment in
    drm_atomic_get_mst_topology_state docs

 drivers/gpu/drm/display/drm_dp_mst_topology.c | 27 ++++++-------------
 include/drm/display/drm_dp_mst_helper.h       |  2 ++
 2 files changed, 10 insertions(+), 19 deletions(-)

-- 
2.35.3

