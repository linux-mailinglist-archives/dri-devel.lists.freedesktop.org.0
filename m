Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE42BA8F14
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 13:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C294A10E121;
	Mon, 29 Sep 2025 11:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8CF10E121
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 11:01:12 +0000 (UTC)
Received: from jtjnmail201611.home.langchao.com
 by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202509291901072427;
 Mon, 29 Sep 2025 19:01:07 +0800
Received: from localhost.localdomain.com (10.94.6.25) by
 jtjnmail201611.home.langchao.com (10.100.2.11) with Microsoft SMTP Server id
 15.1.2507.58; Mon, 29 Sep 2025 19:01:01 +0800
From: Chu Guangqing <chuguangqing@inspur.com>
To: <tzimmermann@suse.de>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, Chu
 Guangqing <chuguangqing@inspur.com>
Subject: Re: Re: [PATCH v7 1/1] [DRIVER] gpu: drm: add support for Yhgc ZX1000
 soc chipset
Date: Mon, 29 Sep 2025 19:00:57 +0800
Message-ID: <20250929110057.8583-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <piavbxkdtlmlfhfphyvhsr7nixbt2o2aomkfuotm5fnkq6dmoz@injbfc224w2c>
References: <piavbxkdtlmlfhfphyvhsr7nixbt2o2aomkfuotm5fnkq6dmoz@injbfc224w2c>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.6.25]
tUid: 2025929190107fb5c8f3b9b7e753efb803cb2087b1a22
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

Hi Dmitry,

> On Mon, Sep 29, 2025 at 02:31:03PM +0800, Chu Guangqing wrote:
> > add support for Yhgc BMC soc chipset
> 
> So... Again, what is Yhgc? Please expand your commit message, MAINTAINERS
> and Kconfig entries. (this is a usual thing: if you get a review question, it
> usually means that you need to provide more information _in_ the patch
> rather than just reporting on the mailing list). I'd suggest adding full company
> name and maybe a website as a comment inside the driver code. Otherwise it
> would be very hard to assess in few years whether it's something that is still in
> use, whether it needs improvements, etc.
>
This is a spelling error, it should be YHGCH. which has been corrected and is 
now in uppercase. The chip introduction has been added to the commit message, 
and the company's website has been included in the MAINTAINERS file and the 
source code.

The v8 patch:
 https://lore.kernel.org/all/20250929104831.8548-1-chuguangqing@inspur.com/
 
> >
> > Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
> > ---
> >  MAINTAINERS                            |   5 +
> >  drivers/gpu/drm/Kconfig                |   2 +
> >  drivers/gpu/drm/Makefile               |   1 +
> >  drivers/gpu/drm/yhgch/Kconfig          |  11 +
> >  drivers/gpu/drm/yhgch/Makefile         |   4 +
> >  drivers/gpu/drm/yhgch/yhgch_drm_de.c   | 398

Best Regards,
Chu Guangqing
