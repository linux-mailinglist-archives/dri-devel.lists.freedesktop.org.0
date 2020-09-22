Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2021E2740AA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 13:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1418A6E84C;
	Tue, 22 Sep 2020 11:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03F36E852
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 11:22:58 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5bc.dynamic.kabel-deutschland.de
 [95.90.213.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E4162399A;
 Tue, 22 Sep 2020 11:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600773778;
 bh=BXOV2/wMUecYDuk+Af/OccQnwb4IQj2Pi9tGe6aNU2k=;
 h=From:To:Cc:Subject:Date:From;
 b=vFvk7ZwMV6SNdK/3/D+GYOTYKMsfFwsEDIpY1YZWRtuwIjGgoM01CI+twtVBrkE1o
 ImTeDXXYTEEAdCBHATt7CH8ZrUNKFR7nR+ipw45ihTn14l6sTrLZNtKds8OZBLMzxD
 SuWdjRDzeBW3XbNWO76zax0qQH/EZxjmRrWby0nc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kKgNr-0010Ke-Kx; Tue, 22 Sep 2020 13:22:55 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 0/3] Fix Kernel-doc warnings introduced on next-20200921
Date: Tue, 22 Sep 2020 13:22:51 +0200
Message-Id: <cover.1600773619.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Jiri Pirko <jiri@mellanox.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Francesco Ruggeri <fruggeri@arista.com>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Eric Dumazet <edumazet@google.com>,
 Taehee Yoo <ap420073@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Cong Wang <xiyou.wangcong@gmail.com>, Andrii Nakryiko <andriin@fb.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A few new warnings were added at linux-next. Address them, in order for us
to keep zero warnings at the docs.

The entire patchset fixing all kernel-doc warnings is at:
	https://git.linuxtv.org/mchehab/experimental.git/log/?h=doc-fixes

Mauro Carvalho Chehab (3):
  net: fix a new kernel-doc warning at dev.c
  drm/dp: fix kernel-doc warnings at drm_dp_helper.c
  drm/dp: fix a kernel-doc issue at drm_edid.c

 drivers/gpu/drm/drm_dp_helper.c | 5 +++++
 drivers/gpu/drm/drm_edid.c      | 2 +-
 net/core/dev.c                  | 4 ++--
 3 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.26.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
