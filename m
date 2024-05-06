Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2D08BDC79
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 09:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3FF11245D;
	Tue,  7 May 2024 07:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="EXx4/WGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1810 seconds by postgrey-1.36 at gabe;
 Mon, 06 May 2024 15:16:27 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id A90B11120CB;
 Mon,  6 May 2024 15:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=74avi
 dpj6lHrcnz5DWt9tVaHKTbGh3voPFwrs+2HjNg=; b=EXx4/WGxoek2QHnlkBoTc
 jRTT0OXc0BvIlIVVgO4dT8CHDkcMpwiNeUaEzYExIs9yWALPn7/aDuzvWZ9Y6hRX
 HDS/r3IY8rE8LFipmebk2F6XSCDnHIVRI1EC0jT7tkmEtYmi8SpI+gNRCAxHLuHh
 Q9yvqf/kUyr/KaAeMjbyu4=
Received: from localhost.localdomain (unknown [111.35.187.227])
 by gzga-smtp-mta-g2-4 (Coremail) with SMTP id _____wDXL_Fr6ThmQiFiBA--.17029S4;
 Mon, 06 May 2024 22:30:09 +0800 (CST)
From: David Wang <00107082@163.com>
To: 00107082@163.com
Cc: airlied@gmail.com, airlied@redhat.com, daniel@ffwll.ch,
 dreaming.about.electric.sheep@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 regressions@lists.linux.dev, spice-devel@lists.freedesktop.org,
 tzimmermann@suse.de, virtualization@lists.linux.dev
Subject: Re: [Regression] 6.9.0: WARNING: workqueue: WQ_MEM_RECLAIM
 ttm:ttm_bo_delayed_delete [ttm] is flushing !WQ_MEM_RECLAIM
 events:qxl_gc_work [qxl]
Date: Mon,  6 May 2024 22:30:03 +0800
Message-Id: <20240506143003.4855-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240430061337.764633-1-00107082@163.com>
References: <20240430061337.764633-1-00107082@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXL_Fr6ThmQiFiBA--.17029S4
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUngAwUUUUU
X-Originating-IP: [111.35.187.227]
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBEBPWqmVODy8hSgAAsf
X-Mailman-Approved-At: Tue, 07 May 2024 07:31:32 +0000
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

The kernel warning still shows up in 6.9.0-rc7.

(I think 4 high load processes on a 2-Core VM could easily trigger the kernel warning.)

Thanks
David

