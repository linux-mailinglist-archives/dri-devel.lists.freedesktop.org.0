Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC55120464
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 12:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CF26E4D2;
	Mon, 16 Dec 2019 11:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9A06E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 11:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576497135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ffgl08sX/dM+wb3Mk8pwBwl00v1Dd5jdDAm0C95MrpE=;
 b=K1Xh+7V0UWrIKbpAkW6vYvN1a+2fUe5EfYVGhx3upnm0zkr26za1c1nIWMCyqkWDDWYPth
 kyq442LFySK2es4yuTgdVkiTM187TKHc9FwmitTOzW4rYG5CUnU+zwPLtcXOF5dMMb5LdT
 d3cenauYSFoBXZMiKOAHPXTQNCKP2rs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-Of1Jtvn-N7m2ko2KcXW3-A-1; Mon, 16 Dec 2019 06:52:14 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF5CC800D4C;
 Mon, 16 Dec 2019 11:52:12 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15D9B10002A2;
 Mon, 16 Dec 2019 11:52:10 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH resend 0/2] drm/connector: Add support for specifying
 panel_orientation on the kernel cmdline
Date: Mon, 16 Dec 2019 12:51:56 +0100
Message-Id: <20191216115158.862404-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Of1Jtvn-N7m2ko2KcXW3-A-1
X-Mimecast-Spam-Score: 0
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

This is a resend of the last 2 remaining patches of my series for adding
support for specifying panel_orientation on the kernel cmdline.

I've already pushed the other 11 patches which were mostly cleanups /
bug-fixes to the cmdline-parsing code and where all acked by Maxime
to drm-misc-next.

The first patch of these 2 still needs to be reviewed, if someone can
review it that would be great.

Once this is reviewed the question becomes how to merge this, both
patches are mostly drm-misc material and the second patch depends on
the changes I just pushed to drm-misc-next, so this series should
probably be pushed to drm-misc-next, but it also makes some changes
to i915 code. I've checked and there is no conflict with these patches
as they apply to drm-misc-next vs drm-intel-next-queued (atm). So it
should be fine to push these 2 patches to drm-misc-next and then do a
back-merge to drm-intel-next-queued.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
