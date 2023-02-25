Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6B56A28C2
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 11:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D2F10E122;
	Sat, 25 Feb 2023 10:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from h5.fbrelay.privateemail.com (h5.fbrelay.privateemail.com
 [162.0.218.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364B010E0F6
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 07:29:02 +0000 (UTC)
Received: from MTA-08-3.privateemail.com (unknown [198.54.122.141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by h5.fbrelay.privateemail.com (Postfix) with ESMTPS id 345D460149
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 07:29:00 +0000 (UTC)
Received: from mta-08.privateemail.com (localhost [127.0.0.1])
 by mta-08.privateemail.com (Postfix) with ESMTP id 1477518000A2;
 Sat, 25 Feb 2023 02:28:58 -0500 (EST)
Received: from localhost.localdomain (cpe-66-66-66-125.rochester.res.rr.com
 [66.66.66.125])
 by mta-08.privateemail.com (Postfix) with ESMTPA id B8BE418000A0;
 Sat, 25 Feb 2023 02:28:46 -0500 (EST)
From: Dylan Le <self@dylanle.dev>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 0/1] Documentation: gpu: add acceleration node section
Date: Sat, 25 Feb 2023 07:28:33 +0000
Message-Id: <cover.1677308797.git.self@dylanle.dev>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sat, 25 Feb 2023 10:10:08 +0000
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
Cc: Dylan Le <self@dylanle.dev>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

There is a missing section of GPU documentation on Acceleration Nodes.
This patch adds a stubbed section to be filled in. I was able to render
the new section as a PDF.

make SPHINXDIRS="gpu/" pdfdocs

Changes since v1:
- Comments from Bagas. Change from note admonition to generic admonition

Dylan Le (1):
  Documentation: gpu: add acceleration node section

 Documentation/gpu/drm-uapi.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

Thanks.
-- 
2.30.2

