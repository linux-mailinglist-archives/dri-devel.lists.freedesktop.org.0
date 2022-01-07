Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C15F487423
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 09:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F90D11AC6F;
	Fri,  7 Jan 2022 08:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7A210E8BE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 01:40:50 +0000 (UTC)
X-UUID: 8a7ed46a2971447993db1053b65d8e16-20220107
X-UUID: 8a7ed46a2971447993db1053b65d8e16-20220107
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1649835202; Fri, 07 Jan 2022 09:40:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Jan 2022 09:40:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 Jan 2022 09:40:46 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: Fix unused-but-set variable warning
Date: Fri, 7 Jan 2022 09:40:46 +0800
Message-ID: <20220107014046.30492-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220102234633.31709-1-miles.chen@mediatek.com>
References: <20220102234633.31709-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Fri, 07 Jan 2022 08:33:30 +0000
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
Cc: chunkuang.hu@kernel.org, junzhi.zhao@mediatek.com, jie.qiu@mediatek.com,
 airlied@linux.ie, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias,

>> I'm still not happy with the commit subject, I think it is misleading. Clang 
>> only helped to find the bug, but the we are fixing something else, that's not 
>> just a clang warning. But I don't want to nit-pick too much so:
>> 
>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> thanks. I think you are right.
> I will change the subject to "drm/mediatek: Fix mtk_cec_mask()", remove the 
> clang part and submit patch v4.

I posted patch v4 https://lore.kernel.org/linux-mediatek/20220103054706.8072-1-miles.chen@mediatek.com/
without your reviewed-by tag.

Would you mind taking a look at the patch?

Miles
