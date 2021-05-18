Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E39387053
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 05:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D816E042;
	Tue, 18 May 2021 03:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABE66E04A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 03:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621309524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nrX1ScQi78zH03USBJLsZL8/0NCV/8hU9AdcwYbNGE4=;
 b=drKx5ZszGa0WTOnIrPJJ1ThCVEXn36AuK59KxOBVDEpbX8DaPtkubAC3vwu5dyBUVYvQdL
 c8Q5D2PovVntereXlFGmluey4nZZBDQHbHpkrC/qFmAF0VOJCS5UUKkA1Bym/xdJxi7Wzu
 SDKRyIHM0DIuY6SyLFHWotTADI1smNY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-nTP3tS85NpGHnAhnnJQVSA-1; Mon, 17 May 2021 23:45:21 -0400
X-MC-Unique: nTP3tS85NpGHnAhnnJQVSA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BB911005D47;
 Tue, 18 May 2021 03:45:20 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC1A55D6D7;
 Tue, 18 May 2021 03:45:19 +0000 (UTC)
From: Dave Airlie <airlied@redhat.com>
To: dri-devel@lists.freedesktop.org,
	xorg-announce@lists.x.org
Subject: [ANNOUNCE] libdrm 2.4.106
Date: Tue, 18 May 2021 13:45:11 +1000
Message-Id: <20210518034511.5644-1-airlied@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256


Some nouveau debug, amdgpu tests, and a regression fix from 105.
Releasing so 105 doesn't end up being used a lot with a regression.

Bas Nieuwenhuizen (1):
      Revert "xf86drmMode: set FB_MODIFIERS flag when modifiers are supplied"

Dave Airlie (1):
      Bump version to 2.4.106

Eric Engestrom (2):
      ci: use archlinux/archlinux docker image instead of deprecated and now removed archlinux/base
      ci: use `base-devel` tag of archlinux image instead of `base` and then installing `base-devel` after

Feifei Xu (2):
      tests/amdgpu: update gfx9 BufferCopy/BufferClear
      tests/amdgpu:retire asic_id check on unsupported cases

Huang Rui (1):
      test/amdgpu: use tmz ids to check whether enable security tests

James Zhu (1):
      tests/amdgpu/vcn: update to support aldebaran

Jinzhou Su (1):
      test/amdgpu: Add emit mem sync flag for test IB

Karol Herbst (6):
      nouveau: fix crash in pushbuf_dump with an unmapped bo
      nouveau: mask push buffer length pushbuf_dump
      nouveau: make debug features accessible in normal builds
      nouveau: rework debugging so we can also dump into a file
      novueau: document debug flags
      nouveau: add debug option to sync pushbuffer submissions

git tag: libdrm-2.4.106

https://dri.freedesktop.org/libdrm/libdrm-2.4.106.tar.xz
SHA256: 92d8ac54429b171e087e61c2894dc5399fe6a549b1fbba09fa6a3cb9d4e57bd4  libdrm-2.4.106.tar.xz
SHA512: 33140e579906ab54b716149056af500c628ce41cd9ae3b0c33496693d2f5903fbcfccee8a942dd1560e1591111ed240da42612d5af5e75558db6f6a85d14617d  libdrm-2.4.106.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.106.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEKbZHaGwW9KfbeusDHTzWXnEhr4FAmCjOB0ACgkQDHTzWXnE
hr7Gjw//WPSK/f0t/hw2dTHhAA+rJ0A61RnhrWtvAK923usK2IxgeKD9mgDrXXX4
T6eXoUIvOUNB1EYfaiXMhS/G7gbL+C4/BDF+Hqu55luZklgLxALy86rDH2nMw+4c
vgd7AyYVF78oiYKsI5ULiexFWl85ZnBjJHlyvyk7axOMQx6P26ioI05wjP9SSs5N
mwPZ218jZy29dk2h82lp6SBHIvMZSnRW9EE0G2jmZZMJGIP4f//owa8Ugxu/PsjX
VkTZ8tF47YRwzGINRzLkSmOgXR8ACLNrIs+n6SoMXPNpMwQAgKcqjDd3iHhM30PJ
7wHbk6xfiywpRsZBymkDvtPl4vYLZFcskfd1fb72X5YRM6LSHY4GBHz1/i8ye2hc
JX786aajPU0MNq5i14VmCE36pHHARMbSV7WqQXwQsxv8AjpRiwf07qJaRYbZFZZw
kdQPMPKZqh+Tn/4aCv4yL0rVfIQk7cpQ/wrsEiKyNlt+iotWSnb6oHTMq/uGZgou
kpClMEwOeDTieU8V9ET0JAQAdKGK5CVCcVAffTbzGx0pT2lhKub0CBRvUiB5Q5ZW
sFq2UNjFZ2BwPDoZKhOD87EkdtQJyPRf9DmTwVBatFfmX/bSG8ikricgC6lF7LNL
EBeVV5eqCPIMFiUBwEhLwSbu5CCy/X6JIIv30JzcMzNb1QZWOj8=
=Ybbd
-----END PGP SIGNATURE-----

