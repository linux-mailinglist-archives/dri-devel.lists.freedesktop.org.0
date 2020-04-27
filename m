Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C941BB099
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 23:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6595D6E0D9;
	Mon, 27 Apr 2020 21:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8F16E0D9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 21:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588023287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=kzHVQ1RNrTy6GimaONMy+YWogsizAFU4Ww/1ICCw9Wc=;
 b=UXw13Wafn3kKiZPIS7YVgjeS4efUb2CqXZbRzRmRujHighgp8raqdROroP/2FGAJnUu9p1
 ewWmq4djsKW83HPZE8Oj8vVS13+AqeCpB/d9wh/ta1AVp/lNNOAUmslTbocZ/IKqLB1HZO
 n/jDFngugOA2uTGX5To6iAElEXg/8Fo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-6E4XqAfANYKuBZBtLrzL_Q-1; Mon, 27 Apr 2020 17:34:32 -0400
X-MC-Unique: 6E4XqAfANYKuBZBtLrzL_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F26DA835B40;
 Mon, 27 Apr 2020 21:34:30 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-113-110.rdu2.redhat.com [10.10.113.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 043845D9DD;
 Mon, 27 Apr 2020 21:34:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/1] Backport "drm/dp_mst: Kill the second sideband tx slot,
 save the world" for drm-fixes
Date: Mon, 27 Apr 2020 17:34:21 -0400
Message-Id: <20200427213422.1414614-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Todd Previte <tprevite@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because this patch will likely end up fixing a lot of MST issues we
either don't know about, or weren't able to figure out a fix for before,
I definitely want to make sure this patch gets cc'd to stable as well.
It doesn't apply cleanly to drm-misc-fixes, so here's a backported
version that does.

Lyude Paul (1):
  drm/dp_mst: Kill the second sideband tx slot, save the world

 drivers/gpu/drm/drm_dp_mst_topology.c | 122 +++++++-------------------
 include/drm/drm_dp_mst_helper.h       |  18 +---
 2 files changed, 33 insertions(+), 107 deletions(-)

-- 
2.25.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
