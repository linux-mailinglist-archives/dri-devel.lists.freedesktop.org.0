Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669C2131DC5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 03:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA6A6E7D1;
	Tue,  7 Jan 2020 02:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id B89926E7D1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 02:56:35 +0000 (UTC)
X-UUID: f863a1236a9d4e5aaf75f5b8c2ee7b52-20200107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:To:From:Subject:Message-ID;
 bh=WvLYzmY4ueg2Fb5nUQMyGzQBFOIPCUF9ozekNaAJI0w=; 
 b=sF1kFZXt2IYCWEg2gsZH0wChmxMBqEYOiPXtxsYHfvIRYRFmITBjArmOj2GU5/uJDRvct4b+6AV54lgzEueZZgez9Iwgo/KpCEMWhRY3iZU7Wsvjbuh3Tk3q0n3+uDEbeldTLhR9I/85M1oyXY69y2CYTCAzoQ9S8a1gQlsC/oo=;
X-UUID: f863a1236a9d4e5aaf75f5b8c2ee7b52-20200107
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1459403321; Tue, 07 Jan 2020 10:56:32 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 Jan 2020 10:56:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 7 Jan 2020 10:54:59 +0800
Message-ID: <1578365790.28495.13.camel@mtksdaap41>
Subject: Process identical patches in different tree
From: CK Hu <ck.hu@mediatek.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, 
 MatthiasBrugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>
Date: Tue, 7 Jan 2020 10:56:30 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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

Hi, Dave, Daniel, Matthias:

In mediatek-drm-next-5.6 [1], I've cherry-pick 3 patches from
v5.5-next/soc [2] because some drm patches depend on these cmdq patches.
So these cmdq patches exist in both tree now. I want to know how to
process this case. I think we could choose one of below way:

1. Because these cmdq patches are identical in both tree, so each tree
could do its own upstream and the there would be nothing happen when
merge.
2. Let soc upstream first, and mediatek drm rebase on the latest
mainline then upstream.

Which one do you prefer?

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.5-next/soc

Regards,
CK
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
