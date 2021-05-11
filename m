Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F345737A4DB
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 12:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4618916C;
	Tue, 11 May 2021 10:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203BE8916C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 10:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620729930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MGZwP6CEdY3XVE2Tj7A/0bHCNLgwPvuEWx/bhEsLCQc=;
 b=cdbe9PxOwLBPl7NI7AY8MLXpS5r8mREM98HuHU+U109zvZ0Eqlf2yNJCMR6Y7oAU3tSeWN
 BqMh8pJCHl4VaLrqqQ8spg+iIUngSvtBLn5o0eSxg1BGtTuKyUp6pz1r50KW6jOhMkuR2O
 FBG6vJ3Xyc9+ArjQ9UrkXs21p58tYqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-AY6YgtLZPnm7VMTKQxD6eA-1; Tue, 11 May 2021 06:45:28 -0400
X-MC-Unique: AY6YgtLZPnm7VMTKQxD6eA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7065B801B12
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 10:45:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE3B260CC9;
 Tue, 11 May 2021 10:45:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 205B51800876; Tue, 11 May 2021 12:45:22 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/qxl: two one-liner fixes.
Date: Tue, 11 May 2021 12:45:20 +0200
Message-Id: <20210511104522.2694803-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=0D
=0D
Gerd Hoffmann (2):=0D
  drm/qxl: drop redundant code=0D
  drm/qxl: balance dumb_shadow_bo pin=0D
=0D
 drivers/gpu/drm/qxl/qxl_display.c | 5 ++---=0D
 1 file changed, 2 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D

