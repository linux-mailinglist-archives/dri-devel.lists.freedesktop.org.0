Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA6A1C0CBA
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 05:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D827C6E05D;
	Fri,  1 May 2020 03:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380036E05D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 03:40:50 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 5F5C112774471;
 Thu, 30 Apr 2020 20:40:49 -0700 (PDT)
Date: Thu, 30 Apr 2020 20:40:48 -0700 (PDT)
Message-Id: <20200430.204048.2100348364642739809.davem@davemloft.net>
To: weiyongjun1@huawei.com
Subject: Re: [PATCH net-next] dpaa2-eth: fix error return code in setup_dpni()
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200427104322.11214-1-weiyongjun1@huawei.com>
References: <20200427104322.11214-1-weiyongjun1@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 30 Apr 2020 20:40:49 -0700 (PDT)
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
Cc: ruxandra.radulescu@nxp.com, daniel@iogearbox.net, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, ast@kernel.org,
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk,
 linaro-mm-sig@lists.linaro.org, ioana.ciornei@nxp.com, kuba@kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 27 Apr 2020 10:43:22 +0000

> Fix to return negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
