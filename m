Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6423B1C604E
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 20:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8DD896B5;
	Tue,  5 May 2020 18:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE918896B5
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 18:41:19 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 7D7AE127F93E1;
 Tue,  5 May 2020 11:41:16 -0700 (PDT)
Date: Tue, 05 May 2020 11:41:15 -0700 (PDT)
Message-Id: <20200505.114115.1085654130355306976.davem@davemloft.net>
To: yanaijie@huawei.com
Subject: Re: [PATCH net-next] net: bnxt: Remove Comparison to bool in
 bnxt_ethtool.c
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200505074608.22432-1-yanaijie@huawei.com>
References: <20200505074608.22432-1-yanaijie@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 05 May 2020 11:41:17 -0700 (PDT)
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
Cc: hawk@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org, john.fastabend@gmail.com, ast@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, kuba@kernel.org, michael.chan@broadcom.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jason Yan <yanaijie@huawei.com>
Date: Tue, 5 May 2020 15:46:08 +0800

> Fix the following coccicheck warning:
> 
> drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:1991:5-46: WARNING:
> Comparison to bool
> drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:1993:10-54: WARNING:
> Comparison to bool
> drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:2380:5-38: WARNING:
> Comparison to bool
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Applied.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
