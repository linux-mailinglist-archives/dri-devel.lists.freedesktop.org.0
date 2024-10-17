Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FDD9A1963
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 05:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD9B10E78F;
	Thu, 17 Oct 2024 03:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="THMJr+QN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.155.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EC010E78F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 03:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1729136449;
 bh=mFG/UR1tgaWQrb1thPhLyTJOgLJUtlqmvJbRhUqKawE=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=THMJr+QNLcfdeBZFPqjYnFHAYJLXMSqDGUrs/UjMqX0KvGtNmqxIkDn+C8N3oklnP
 fvOx2uyYDxxmG+0AzKtSG+9jy7dFxqwPYL6pG9kWAq9tlFkCp+8AgyXe5a9Nj9mEWI
 PiZG5FphiG9zfjtkA4hhF4N399aDCLNaAriSRkD8=
X-QQ-mid: bizesmtpsz5t1729136409t8wnne6
X-QQ-Originating-IP: m+Yvnw1KaVX3h/G3pdOcoBdNO24x5FsuOsQNe7lHfR8=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 17 Oct 2024 11:40:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3436797304957476087
From: WangYuli <wangyuli@uniontech.com>
To: helen.koike@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, wangyuli@uniontech.com, david.heidelberg@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 guanwentao@uniontech.com, zhanjun@uniontech.com
Subject: [RESEND. PATCH 1/5] drm/ci: Upgrade requirements because of bothering
 by GitHub Dependabot
Date: Thu, 17 Oct 2024 11:39:48 +0800
Message-ID: <11312D359DDCA3CF+20241017034004.113456-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Mr/o/c6gDciS7Q71RM2V/GAWLofVA4RJ2ao5OVAfiTvg5nlMNmNSp0DC
 8PG1Lt3a3pYHPX9eskT5/YRURKx+Vnu+MvgqvSHzMJoAjtZnsCyyudaNrsmj5p7UaAn9Ata
 L+Rh6uAfXmMZ92GSRwE2p2VyWTEpD/uROL8tpi7S0EGLooIKzq5bgEIZx5SLA4K1HS/119G
 L9GhsVi+qlMpSry67swIRGmTcJrfD6Z0ig5X8Q9BOEwD6YlLmqS1j68PtNbHuenM3ZcVQTG
 JOjs8LyCOp/Dw93LN/o8Ee98vUV/b5hI/8HqPB/1HO55SdnDHXVyI0Xen0lwc8VE4ANCzvg
 cIvPoW2xnCWGjS/nbes+ZCIc3ffpMla9X1OqJWYXFmsSih2M/Xz5PNWt/MgoHLnmhuE7wkj
 NXZV4t8lvfD5ufQt4rbTWiQ8boaVTX7ypLj7grD3qxY6ZHK8/+C6RqTGfm88lUxcrDKFEBN
 hUVfGqFu4m6op+Q0kHv8JsVlVajEG7tT4UmNsQD9ERyQvyV5G8iitHzVUaFXle/OSMbUl+x
 thV2hIehrbfnlevU54yXs4uoOjUvmd8wQ3xMCoI0rhwTt05JmgTYRSH5siS9a/kK26PVBnC
 SV290wJNn76hNH15oHjKtAcNf2ZAAyO+xmfbW0P4gKKdmjPq2T0AakDy0mJPAtn05hHz14m
 Xf5qwDLXzHVHtCNuST0Ii2BsztnO9hdFlCfJnFg7IDlJb8CcdS5VbNuP9W8X2DmzEI8nhSr
 mD6yLVEl5r/9FlB0/aQBcaKCp6fodiJEhRUaYWc6ENKZLAusjXjgmH/1gI4cQBjaKiXSrS+
 fzFaRbZSoEOuCSTiNPvUJB3cevkcgp7TepMxcO9kTK7L3BpaFg9Csun+WDXhV8OLexzJQMs
 +1Vi+bZIZXU70601PQ63d3lT4232oqzT6xMZBP/DB9hnKQ1FmEFFBS7glufYr2k46ioMwbU
 +QHx+QFo6p7/EQq69Wo64l5s6TN4+UpZE6lZqfqdHIVLkt3aIsRgZznRPmQt0PMpdhMgJC9
 KfitvvxQ==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
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

