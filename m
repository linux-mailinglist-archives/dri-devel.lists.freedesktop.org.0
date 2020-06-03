Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9861ECA1A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 09:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135CC6E0AF;
	Wed,  3 Jun 2020 07:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zju.edu.cn (spam.zju.edu.cn [61.164.42.155])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3605E6E4AE;
 Wed,  3 Jun 2020 02:21:53 +0000 (UTC)
Received: by ajax-webmail-mail-app2 (Coremail) ; Wed, 3 Jun 2020 10:21:47
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.72.4]
Date: Wed, 3 Jun 2020 10:21:47 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: dinghao.liu@zju.edu.cn
To: "Dan Carpenter" <dan.carpenter@oracle.com>
Subject: Re: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in
 gm20b_clk_new()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <20200602153900.GW22511@kadam>
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <20200602102955.GZ30374@kadam>
 <65e3d2b7-b0ad-f387-b8fe-d83ea816a0f6@web.de>
 <20200602153900.GW22511@kadam>
MIME-Version: 1.0
Message-ID: <5d580094.f274c.17277fc124e.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: by_KCgDnX5c8Cddeg0ppAA--.16819W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgkABlZdtOb8QgABsr
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbGvS07vEb7Iv0x
 C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
 bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
 CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wCS07vE84ACjcxK6I8E87Iv67AKxVW0oV
 Cq3wCS07vE84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DMIAIbVAS0I0E0xvYzxvE52x0
 82IY62kv0487MIAIbVAqx4xG64xvF2IEw4CE5I8CrVC2j2WlV2xY6cIj6xIIjxv20xvE14
 v26r1j6r18MIAIbVAv7VC2z280aVAFwI0_Jr0_Gr1lV2xY6cvjeVCFs4IE7xkEbVWUJVW8
 JwCS07vE7I0Y64k_MIAIbVCY02Avz4vE14v_Gr1lV2xY6xkI7II2jI8vz4vEwIxGrwCS07
 vE42xK82IY6x8ErcxFaVAv8VW8uw4UJr1UMIAIbVCF72vE77IF4wCS07vE4I8I3I0E4IkC
 6x0Yz7v_Jr0_Gr1lV2xY6I8I3I0E5I8CrVAFwI0_Jr0_Jr4lV2xY6I8I3I0E7480Y4vE14
 v26r106r1rMIAIbVC2zVAF1VAY17CE14v26r1q6r43MIAIbVCI42IY6xIIjxv20xvE14v2
 6r1j6r1xMIAIbVCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lV2xY6IIF0xvE42xK8V
 AvwI8IcIk0rVWrZr1j6s0DMIAIbVCI42IY6I8E87Iv67AKxVWUJVW8JwCS07vEIxAIcVC2
 z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73U
X-Mailman-Approved-At: Wed, 03 Jun 2020 07:04:29 +0000
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Elfring <Markus.Elfring@web.de>,
 Ben Skeggs <bskeggs@redhat.com>, Kangjie Lu <kjlu@umn.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> On Tue, Jun 02, 2020 at 01:10:34PM +0200, Markus Elfring wrote:
> > > The original patch was basically fine.
> > 
> > I propose to reconsider the interpretation of the software situation once more.
> > 
> > * Should the allocated clock object be kept usable even after
> >   a successful return from this function?
> 
> Heh.  You're right.  The patch is freeing "clk" on the success path so
> that doesn't work.
> 

Ben has explained this problem:
https://lore.kernel.org/patchwork/patch/1249592/
Since the caller will check "pclk" on failure, we don't need to free
"clk" in gm20b_clk_new() and I think this patch is no longer needed.

Regards,
Dinghao
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
