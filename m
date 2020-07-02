Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EAD212EC6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 23:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920EB6E260;
	Thu,  2 Jul 2020 21:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9249E6E260
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 21:24:31 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 1A05D12841C5A;
 Thu,  2 Jul 2020 14:24:29 -0700 (PDT)
Date: Thu, 02 Jul 2020 14:24:28 -0700 (PDT)
Message-Id: <20200702.142428.1638019124425781765.davem@davemloft.net>
To: weiyongjun1@huawei.com
Subject: Re: [PATCH net-next] ksz884x: mark pcidev_suspend() as __maybe_unused
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200702091810.4999-1-weiyongjun1@huawei.com>
References: <20200702091810.4999-1-weiyongjun1@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 02 Jul 2020 14:24:29 -0700 (PDT)
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
Cc: vaibhavgupta40@gmail.com, nikolay@cumulusnetworks.com,
 netdev@vger.kernel.org, mst@redhat.com, jwi@linux.ibm.com,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 hulkci@huawei.com, kuba@kernel.org, snelson@pensando.io, zhongjiang@huawei.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 2 Jul 2020 17:18:10 +0800

> In certain configurations without power management support, gcc report
> the following warning:
> 
> drivers/net/ethernet/micrel/ksz884x.c:7182:12: warning:
>  'pcidev_suspend' defined but not used [-Wunused-function]
>  7182 | static int pcidev_suspend(struct device *dev_d)
>       |            ^~~~~~~~~~~~~~
> 
> Mark pcidev_suspend() as __maybe_unused to make it clear.
> 
> Fixes: 64120615d140 ("ksz884x: use generic power management")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
