Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9156F97BCCB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 15:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1853110E590;
	Wed, 18 Sep 2024 13:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="QQsplZVq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCE088FAE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 13:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1726664859;
 bh=mFG/UR1tgaWQrb1thPhLyTJOgLJUtlqmvJbRhUqKawE=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=QQsplZVqwgSoYRazAV41dnOqNb42xq6bjg3T/db9NlNjm8Gdy2fxxwxAbvBDjhYaT
 oSS5pID71Fx09R4PINBSbw5t1tnR50SqdwLoF/voAX12Uj8NOvW1MG8iz4ObdS1Jo9
 bZpWuGUEDLpJkwkslnJlvQZd+WPRAoMgeMc9Q5sM=
X-QQ-mid: bizesmtp89t1726664852tyi90m4h
X-QQ-Originating-IP: vyMhhsyf8qEGQcqP1YFb323COmReC+Tv/RxMZYxa3o8=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 18 Sep 2024 21:07:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4378141738218118256
From: WangYuli <wangyuli@uniontech.com>
To: helen.koike@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, wangyuli@uniontech.com, david.heidelberg@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 guanwentao@uniontech.com, zhanjun@uniontech.com
Subject: [PATCH 0/4] drm/ci: Upgrade requirements because of bothering by
 GitHub Dependabot
Date: Wed, 18 Sep 2024 21:06:39 +0800
Message-ID: <DDC5A709DAEC7F21+20240918130725.448656-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
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

GitHub Dependabot keeps bugging us about old, vulnerable Python packages.

Until we figure out a way to make it calm, we're stuck updating our
dependencies whenever it complains.

I guess it's a good thing in the long run, though, right?
Makes our CI a bit "more secure"...

Signed-off-by: WangYuli <wangyuli@uniontech.com>
-- 
2.45.2

