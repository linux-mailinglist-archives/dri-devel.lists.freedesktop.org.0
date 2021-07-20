Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850A33CF7DF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 12:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6590B6E0B9;
	Tue, 20 Jul 2021 10:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCF26E0B9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 10:29:44 +0000 (UTC)
X-UUID: a2fa50a6c4404291b4e25540da31ebec-20210720
X-UUID: a2fa50a6c4404291b4e25540da31ebec-20210720
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 55608880; Tue, 20 Jul 2021 18:29:39 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Jul 2021 18:29:37 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 MTKCAS06.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 20 Jul 2021 18:29:37 +0800
From: <guangming.cao@mediatek.com>
To: <christian.koenig@amd.com>
Subject: Re: [PATCH] dma_buf: remove dmabuf sysfs teardown before
 release/detach
Date: Tue, 20 Jul 2021 18:29:35 +0800
Message-ID: <20210720102935.83187-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <8d7dfc78-aa85-48b5-2828-21ec6b463ac3@amd.com>
References: <8d7dfc78-aa85-48b5-2828-21ec6b463ac3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Guangming Cao <Guangming.Cao@mediatek.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guangming Cao <Guangming.Cao@mediatek.com>

On Tue, 2021-07-20 at 11:31 +0200, Christian König wrote:
> Am 19.07.21 um 07:19 schrieb guangming.cao@mediatek.com:
> > From: Guangming Cao <Guangming.Cao@mediatek.com>
> > 
> > Dmabuf sysfs stat is used for dmabuf info track.
> > but these file maybe still use after buffer release/detach,
> > should clear it before buffer release/detach.
> 
> Please rebase on current drm-misc-next. The attachment sysfs files
> have 
> been removed in the meantime.
> 
> Thanks,
> Christian.
> 
updated, thanks for your reminding.
