Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 882A4157391
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 12:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28C66EC0D;
	Mon, 10 Feb 2020 11:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724346E22E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 11:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581334680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=04KKF79G4kP+GUTx7+KjcaOJc25btHCiNti1IR9A4iY=;
 b=as7EJGk+6siMrVyK8TTz1Lqx+2orvcMROweB/BIBjVnkMCmYEGGrevAlgVFpU9lbAFI0z8
 WZ5/T+us0/ASx8RUxfZQEkFictvF/rwUIpQmjBlLLQSpF/KVecmQ49Vm++xdDyKPmhA3X6
 L1VrWz+FPZWh8A2wxEKLu7TyD4EHO8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-3uJvv1RTNdyeNow6Pe58cQ-1; Mon, 10 Feb 2020 06:37:58 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 939B51005502
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 11:37:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B10AD26FCF;
 Mon, 10 Feb 2020 11:37:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0F681A1E0; Mon, 10 Feb 2020 12:37:53 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/qxl: driver release fixes.
Date: Mon, 10 Feb 2020 12:37:50 +0100
Message-Id: <20200210113753.5614-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 3uJvv1RTNdyeNow6Pe58cQ-1
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Gerd Hoffmann (2):
  drm/qxl: reorder calls in qxl_device_fini().
  drm/qxl: add drm_driver.release callback.

 drivers/gpu/drm/qxl/qxl_drv.c | 26 +++++++++++++++++++-------
 drivers/gpu/drm/qxl/qxl_kms.c |  8 ++++----
 2 files changed, 23 insertions(+), 11 deletions(-)

-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
