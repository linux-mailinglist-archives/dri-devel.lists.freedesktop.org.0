Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9165D16850A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 18:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA8B6E219;
	Fri, 21 Feb 2020 17:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782FC6E219
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 17:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582306401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PrT92zHaWgTBJ1Kuw41BmpBEjKpc8THi+iu6uHyj8E0=;
 b=gnUQMcsVNfJuhcEBOq0QN8aPVe3BxSCf401eajaF7LfdB+gX6a1qb8LfUA3JJGQ1bTAbaz
 kwGniELdtSciNdO6StjTbjgFazYSKKRhC5xGyGr+WaqPVSuC/wc643GXSV1hO+Z4e5IPb5
 tEFaP1trqabNfQg0uov1OFreutofxag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-tp7W62eSOyGRfQF1iruNRg-1; Fri, 21 Feb 2020 12:33:17 -0500
X-MC-Unique: tp7W62eSOyGRfQF1iruNRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 925558017DF;
 Fri, 21 Feb 2020 17:33:16 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-191.ams2.redhat.com
 [10.36.116.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DF4F87B08;
 Fri, 21 Feb 2020 17:33:15 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH resend 0/1] drm: Add DRM_MODE_TYPE_USERDEF flag to probed modes
Date: Fri, 21 Feb 2020 18:33:12 +0100
Message-Id: <20200221173313.510235-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

I'm resending this patch since the discussion on it has fallen
silent for a while now.

Last time I posted it, the discussion seemed to be heading towards
agreement that this is the right thing to do, but I never got an
ack or some such.

See here for the discussion from last time:
https://patchwork.freedesktop.org/patch/340140/

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
