Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D6F6D593C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 09:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DC810E13B;
	Tue,  4 Apr 2023 07:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.214])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18D8A10E10E;
 Tue,  4 Apr 2023 00:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ANyDg
 UlFZw2AcrRV0IxQJ2iSMTL1341z+Q8L+rwAzTE=; b=bnFrPf4g/1eGQ5GM+txOl
 L9v3oao7JSDyNHhLfO9muKJKnaZOpyGlLXZrwXDSOqj5fWD90oOXEgoFGOKoYcgf
 C/mDvGe8NL/2xOGRSt9faROU+oenyWvM68q2mdAIBASosAEN+IwlyLB/ZfToePIe
 F1Xml34YNvIlQ0JEsItgnk=
Received: from yuq-Aspire-4738G.lan (unknown [116.225.76.16])
 by zwqz-smtp-mta-g3-0 (Coremail) with SMTP id _____wBHK4Tkbitk8woAAg--.8076S2; 
 Tue, 04 Apr 2023 08:27:24 +0800 (CST)
From: yq882255@163.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] Revert lima fdinfo patchset
Date: Tue,  4 Apr 2023 08:25:58 +0800
Message-Id: <20230404002601.24136-1-yq882255@163.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHK4Tkbitk8woAAg--.8076S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1xJrW5GF43Gw4xury5XFb_yoWfGFX_Ga
 y7JFy7WF1UAF1qyw17XwsrWryYka42vFZ5Jw1Uta9akry3Zr1DZr1DGrW5XryUXF42yF1k
 Ja10vF1fXanagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8lApUUUUUU==
X-Originating-IP: [116.225.76.16]
X-CM-SenderInfo: d1tymjqsvvqiywtou0bp/1tbiVg1HGlqzxIGuIAAAsk
X-Mailman-Approved-At: Tue, 04 Apr 2023 07:13:48 +0000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Qiang Yu <yuq825@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Qiang Yu <yuq825@gmail.com>

Upstream has reverted the dependant commit
df622729ddbf ("drm/scheduler: track GPU active time per entity""),
but this patchset has been pushed to drm-misc-next which still
has that commit. To avoid other branch build fail after merge
drm-misc-next, just revert the lima patchset on drm-misc-next too.

Qiang Yu (3):
  Revert "drm/lima: add show_fdinfo for drm usage stats"
  Revert "drm/lima: allocate unique id per drm_file"
  Revert "drm/lima: add usage counting method to ctx_mgr"

 drivers/gpu/drm/lima/lima_ctx.c    | 30 +--------------------
 drivers/gpu/drm/lima/lima_ctx.h    |  3 ---
 drivers/gpu/drm/lima/lima_device.h |  3 ---
 drivers/gpu/drm/lima/lima_drv.c    | 43 +-----------------------------
 drivers/gpu/drm/lima/lima_drv.h    |  1 -
 5 files changed, 2 insertions(+), 78 deletions(-)

-- 
2.25.1

