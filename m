Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C93A78D37
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 13:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F42910E755;
	Wed,  2 Apr 2025 11:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB3610E755
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 11:37:09 +0000 (UTC)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZSNBH2CBpz51SWC;
 Wed,  2 Apr 2025 19:36:55 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
 by mse-fl1.zte.com.cn with SMTP id 532Baqs5065074;
 Wed, 2 Apr 2025 19:36:52 +0800 (+08)
 (envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid32;
 Wed, 2 Apr 2025 19:36:56 +0800 (CST)
Date: Wed, 2 Apr 2025 19:36:56 +0800 (CST)
X-Zmail-TransId: 2af967ed215810b-249fc
X-Mailer: Zmail v1.0
Message-ID: <20250402193656279azy9TKahAE5TQ5-i4XCQT@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <thierry.reding@gmail.com>, <laurent.pinchart@ideasonboard.com>
Cc: <mperttunen@nvidia.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <jonathanh@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <laurent.pinchart@ideasonboard.com>, <tomi.valkeinen@ideasonboard.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <michal.simek@amd.com>,
 <linux-arm-kernel@lists.infradead.org>, <yang.yang29@zte.com.cn>,
 <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>, <zhang.enpei@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHQgMC8yXSBVc2UgZGV2X2Vycl9wcm9iZSgpIGluIGdwdQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 532Baqs5065074
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67ED2157.004/4ZSNBH2CBpz51SWC
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

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Use dev_err_probe() to simplify the following code
sequence:
  if (err != -EPROBE_DEFER)
      dev_err(dev, ...);
  else
      dev_dbg(dev, ...);
  return err;

Zhang Enpei (2):
  gpu: drm: tegra: dpaux: Use dev_err_probe()
  gpu: drm: xlnx: zynqmp_dp: Use dev_err_probe()

 drivers/gpu/drm/tegra/dpaux.c    | 11 +++--------
 drivers/gpu/drm/xlnx/zynqmp_dp.c |  6 ++----
 2 files changed, 5 insertions(+), 12 deletions(-)

-- 
2.25.1
