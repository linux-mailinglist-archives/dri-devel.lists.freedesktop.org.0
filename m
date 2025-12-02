Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44671C99EC9
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 03:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7915C10E512;
	Tue,  2 Dec 2025 02:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vip.corpemail.net (mail-vip.corpemail.net
 [162.243.126.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9411C10E512
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 02:54:37 +0000 (UTC)
Received: from inspur.com
 by ssh248.corpemail.net ((D)) with ESMTP id 202512021033430846
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 10:33:43 +0800
Received: from localhost.localdomain.com (unknown [10.94.15.65])
 by app6 (Coremail) with SMTP id bgJkCsDw5zIHUC5pIiEGAA--.305S4;
 Tue, 02 Dec 2025 10:33:43 +0800 (CST)
From: Chu Guangqing <chuguangqing@inspur.com>
To: tzimmermann@suse.de
Cc: airlied@gmail.com, chuguangqing@inspur.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch
Subject: [PATCH v11 0/1] [DRIVER] gpu: drm: add support for YHGCH ZX1000 soc
 chipset
Date: Tue,  2 Dec 2025 10:32:55 +0800
Message-ID: <20251202023255.2674-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <59c5a8a5-6d6e-4394-a3a3-9fa640ba849c@suse.de>
References: <59c5a8a5-6d6e-4394-a3a3-9fa640ba849c@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: bgJkCsDw5zIHUC5pIiEGAA--.305S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WFyxAF17Xw48Xr4UZrWkWFg_yoW8uw1xpa
 4a9ayIkry0qa1rAwn0y3W2vFn0y3yrtF4UKw1Uuw1UCF1Ygr9rZrs3Xr1DuFyUGrWDJF4Y
 vanFgFsxAFyUA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl
 6s0DM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
 6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU18sqtUUUU
 U==
X-CM-SenderInfo: 5fkxw35dqj1xlqj6x0hvsx2hhfrp/
tUid: 202512021033438e45b1b302bee460eaf4005e20392e3d
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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

Hi Thomas,

The link to the new PR is here.

https://lore.kernel.org/all/20251202022452.2636-1-chuguangqing@inspur.com/

> diff --git a/drivers/gpu/drm/yhgch/yhgch_drm_vdac.c b/drivers/gpu/drm/yhgch/yhgch_drm_vdac.c
> new file mode 100644
> index 000000000000..2de95c887b62
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch_drm_vdac.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/io.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "yhgch_drm_drv.h"
> +#include "yhgch_drm_regs.h"
> +
> +static int yhgch_connector_get_modes(struct drm_connector *connector)
> +{
> +	int count;
> +	const struct drm_edid *drm_edid;
> +
> +	drm_edid = drm_edid_read(connector);
> +	if (drm_edid) {
> +		drm_edid_connector_update(connector, drm_edid);
> +		count =  drm_edid_connector_add_modes(connector);
> +		drm_edid_free(drm_edid);
> +		if (count)
> +			goto out;

Don't do the goto here. Simple call drm_edid_free().

> +	} else {
> +		drm_edid_connector_update(connector, NULL);
> +	}
> +
> +	count = drm_add_modes_noedid(connector,
> +				     connector->dev->mode_config.max_width,
> +				     connector->dev->mode_config.max_height);
> +	drm_set_preferred_mode(connector, 1024, 768);

These two calls belong into the else branch. If you have an EDID, please 
don't try to make up your own defaults.

Answer: This is to avoid encountering the situation where the display cannot be
read (some special displays do not have EDID).

> +
> +out:
> +	drm_edid_free(drm_edid);

This only belongs into the if branch. You also have a double free on 
drm_edid in that case. I wonder how you did not notice.

Answer: Revisions have been made in accordance with your requirements. We
apologize for not noticing the double free issue and thank you for pointing it out.

> +	return count;

Returning 0 here is not a problem. DRM will try several steps to figure 
out the display modes, and eventually fallback to defaults.

Best regards

Chu Guangqing

