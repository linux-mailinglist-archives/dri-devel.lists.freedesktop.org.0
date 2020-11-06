Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15FB2AA15A
	for <lists+dri-devel@lfdr.de>; Sat,  7 Nov 2020 00:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F056EB52;
	Fri,  6 Nov 2020 23:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC50F6EB52
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 23:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604705426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RqQN/DwASLSwBaj/2yQjpp86Hx5P0sidKJCWI09z4eM=;
 b=RiEGwzgT3bcQXRQ9OM9C/Qu5YxzCjqfL/MUfwHmhAPEAj9AosXrMuIn0YJM+gomABP2Iue
 z0P84jDUHgIvcTMrfrEnTWH+7p61T79Gk5tYwF+uhqvZJXSsgpFfV415EfdUIeCK8cKR4R
 cNWpvVPh3Ko07zSpFsSCXe6WUW6VPY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-cF6Dcnd5Py-fvcnLLCC4_g-1; Fri, 06 Nov 2020 18:30:23 -0500
X-MC-Unique: cF6Dcnd5Py-fvcnLLCC4_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 338391868421;
 Fri,  6 Nov 2020 23:30:22 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-115-78.rdu2.redhat.com [10.10.115.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8876162A15;
 Fri,  6 Nov 2020 23:30:21 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: gregkh@linuxfoundation.org, stable@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/nouveau: Stable backport of DP clock fixes for v5.9
Date: Fri,  6 Nov 2020 18:30:13 -0500
Message-Id: <20201106233016.2481179-1-lyude@redhat.com>
In-Reply-To: <160459060724988@kroah.com>
References: <160459060724988@kroah.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a backport of the two patches for v5.9 that you'll want to apply.
The first one was Cc'd to stable, but I forgot to Cc the second one as
well.

Lyude Paul (2):
  drm/nouveau/kms/nv50-: Get rid of bogus nouveau_conn_mode_valid()
  drm/nouveau/kms/nv50-: Fix clock checking algorithm in
    nv50_dp_mode_valid()

 drivers/gpu/drm/nouveau/nouveau_connector.c | 36 ++++++---------------
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 21 ++++++++----
 2 files changed, 24 insertions(+), 33 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
