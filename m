Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0065A1EB65A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 09:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A626E156;
	Tue,  2 Jun 2020 07:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zju.edu.cn (spam.zju.edu.cn [61.164.42.155])
 by gabe.freedesktop.org (Postfix) with ESMTP id C86A66E038;
 Mon,  1 Jun 2020 05:21:31 +0000 (UTC)
Received: by ajax-webmail-mail-app4 (Coremail) ; Mon, 1 Jun 2020 13:21:27
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.72.4]
Date: Mon, 1 Jun 2020 13:21:27 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: dinghao.liu@zju.edu.cn
To: "Ben Skeggs" <skeggsb@gmail.com>
Subject: Re: Re: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in
 gm20b_clk_new
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <CACAvsv5t2gWDae_8b0-fH9e8fzgmxfiUtZTPeFuhmKXDFAmvGw@mail.gmail.com>
References: <20200529080042.6082-1-dinghao.liu@zju.edu.cn>
 <CACAvsv73wZK_pKk4TDHaTeBUqxYHvK0KhLQBgPC8Be_VviY2jg@mail.gmail.com>
 <6a65a5b1.dd4b7.1726deaea0a.Coremail.dinghao.liu@zju.edu.cn>
 <CACAvsv5kcUC_kOfMPxqY-irSAexmhm=WKO8Vk=wTZWdsbaartw@mail.gmail.com>
 <CACAvsv5t2gWDae_8b0-fH9e8fzgmxfiUtZTPeFuhmKXDFAmvGw@mail.gmail.com>
MIME-Version: 1.0
Message-ID: <b3db4d2.ddd1e.1726e53d54b.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgCHIARXkNRe+6VsAA--.10702W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgUSBlZdtOZozQABsu
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbX0S07vEb7Iv0x
 C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
 bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
 CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWlV2xY628EF7xvwVC2z280aVAFwI0_Gc
 CE3s1lV2xY628EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wCS07vEe2I262IYc4CY6c8I
 j28IcVAaY2xG8wCS07vE5I8CrVACY4xI64kE6c02F40Ex7xfMIAIbVAv7VC0I7IYx2IY67
 AKxVWUJVWUGwCS07vEYx0Ex4A2jsIE14v26r1j6r4UMIAIbVAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lV2xY6x02cVAKzwCS07vEc2xSY4AK67AK6r4rMIAIbVCY0x0Ix7I2Y4AK64vIr41lV2
 xY6xAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCS07vE4x8a6x804xWlV2xY6xC20s026xCa
 FVCjc4AY6r1j6r4UMIAIbVC20s026c02F40E14v26r1j6r18MIAIbVC20s026x8GjcxK67
 AKxVWUGVWUWwCS07vEx4CE17CEb7AF67AKxVWUtVW8ZwCS07vEIxAIcVC0I7IYx2IY67AK
 xVWUJVWUCwCS07vEIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIAIbVCI42IY6xAIw2
 0EY4v20xvaj40_WFyUJVCq3wCS07vEIxAIcVC2z280aVAFwI0_Jr0_Gr1lV2xY6IIF0xvE
 x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU=
X-Mailman-Approved-At: Tue, 02 Jun 2020 07:16:26 +0000
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 kjlu@umn.edu, LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Markus.Elfring@web.de,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > If there's *any* error, it'll check the pointer, if it's non-NULL,
> > it'll call the destructor.  If kzalloc() fails, the pointer will be
> > NULL, there's no double-free bug.  *every* subdev is written this way
> > to avoid duplicating cleanup logic.
> Actually, gm20b_clk_new_speedo0() may have a bug here if kzalloc()
> fails as it doesn't overwrite the previous pointer from
> gm20b_clk_new().  That whole ctor() sequence is written a little
> strangely.
> 

It's clear to me, thank your for your explanation! As for 
gm20b_clk_new_speedo0(), I think its bug pattern is not very 
clear. Maybe we should keep it until we find an use chain that
could lead to a bug.

Regards,
Dinghao
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
