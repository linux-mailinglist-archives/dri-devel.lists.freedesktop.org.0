Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8A21BA4D2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 15:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CB16E2CF;
	Mon, 27 Apr 2020 13:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 618 seconds by postgrey-1.36 at gabe;
 Mon, 27 Apr 2020 13:35:01 UTC
Received: from mail.mleia.com (mleia.com [178.79.152.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342626E2CF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 13:35:01 +0000 (UTC)
Received: from mail.mleia.com (localhost [127.0.0.1])
 by mail.mleia.com (Postfix) with ESMTP id E6E983DC9E9;
 Mon, 27 Apr 2020 13:24:41 +0000 (UTC)
Subject: Re: [PATCH net-next] net: lpc-enet: fix error return code in
 lpc_mii_init()
To: Wei Yongjun <weiyongjun1@huawei.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "stigge @ antcom . de" <stigge@antcom.de>
References: <20200427121507.23249-1-weiyongjun1@huawei.com>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <936fc5fb-25a1-8974-71e2-80c2c4bdd0f4@mleia.com>
Date: Mon, 27 Apr 2020 16:24:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200427121507.23249-1-weiyongjun1@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20200427_132441_970355_2770457E 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message. 
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
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/27/20 3:15 PM, Wei Yongjun wrote:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: b7370112f519 ("lpc32xx: Added ethernet driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
