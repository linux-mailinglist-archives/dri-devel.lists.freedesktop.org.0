Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 427C524E689
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111306E442;
	Sat, 22 Aug 2020 09:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52BDC6E22C
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 06:00:35 +0000 (UTC)
Received: by ajax-webmail-mail-app4 (Coremail) ; Sat, 22 Aug 2020 14:00:12
 +0800 (GMT+08:00)
X-Originating-IP: [10.192.85.18]
Date: Sat, 22 Aug 2020 14:00:12 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: dinghao.liu@zju.edu.cn
To: "Tomi Valkeinen" <tomi.valkeinen@ti.com>
Subject: Re: Re: [PATCH] drm/omap: Fix runtime PM imbalance in dsi_runtime_get
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.12 build 20200616(0f5d8152)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <5123d7ae-f491-d2d2-788d-b5250ae9e31d@ti.com>
References: <20200821074506.32359-1-dinghao.liu@zju.edu.cn>
 <5123d7ae-f491-d2d2-788d-b5250ae9e31d@ti.com>
MIME-Version: 1.0
Message-ID: <41f64836.7f.17414c0c8e5.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgBn6PxstEBfuXMzAQ--.39573W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgoSBlZdtPnBhAAtsy
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbA0S07vEb7Iv0x
 C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
 bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
 CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIAIbVA2z4x0Y4vEx4A2jsIE14v26r
 xl6s0DMIAIbVA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lV2xY62AIxVAIcxkEcVAq
 07x20xvEncxIr21lV2xY6c02F40EFcxC0VAKzVAqx4xG6I80ewCS07vEYx0E2Ix0cI8IcV
 AFwI0_JrI_JrylV2xY6cIj6I8E87Iv67AKxVWUJVW8JwCS07vEOx8S6xCaFVCjc4AY6r1j
 6r4UMIAIbVACI402YVCY1x02628vn2kIc2xKxwCS07vE7I0Y64k_MIAIbVCY0x0Ix7I2Y4
 AK64vIr41lV2xY6xAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCS07vE4x8a6x804xWlV2xY
 6xC20s026xCaFVCjc4AY6r1j6r4UMIAIbVC20s026c02F40E14v26r1j6r18MIAIbVC20s
 026x8GjcxK67AKxVWUGVWUWwCS07vEx4CE17CEb7AF67AKxVWUtVW8ZwCS07vEIxAIcVC0
 I7IYx2IY67AKxVWUJVWUCwCS07vEIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIAIbV
 CI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIAIbVCI42IY6I8E87Iv67AKxVWUJVW8JwCS
 07vEIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Sat, 22 Aug 2020 09:02:00 +0000
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Tony Lindgren <tony@atomide.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Hi,
> 
> On 21/08/2020 10:45, Dinghao Liu wrote:
> > pm_runtime_get_sync() increments the runtime PM usage counter
> > even when it returns an error code. However, users of
> > dsi_runtime_get(), a direct wrapper of pm_runtime_get_sync(),
> > assume that PM usage counter will not change on error. Thus a
> > pairing decrement is needed on the error handling path to keep
> > the counter balanced.
> > 
> > Fixes: 4fbafaf371be7 ("OMAP: DSS2: Use PM runtime & HWMOD support")
> > Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> > ---
> >  drivers/gpu/drm/omapdrm/dss/dsi.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> > index eeccf40bae41..973bfa14a104 100644
> > --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> > +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> > @@ -1112,8 +1112,11 @@ static int dsi_runtime_get(struct dsi_data *dsi)
> >  	DSSDBG("dsi_runtime_get\n");
> >  
> >  	r = pm_runtime_get_sync(dsi->dev);
> > -	WARN_ON(r < 0);
> > -	return r < 0 ? r : 0;
> > +	if (WARN_ON(r < 0)) {
> > +		pm_runtime_put_noidle(dsi->dev);
> > +		return r;
> > +	}
> > +	return 0;
> >  }
> 
> Thanks! Good catch. I think this is broken in all the other modules in omapdrm too (e.g. dispc.c,
> venc.c, etc).
> 
> Would you like to update the patch to cover the whole omapdrm?
> 

Sure. I will fix this soon.

Regards,
Dinghao
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
