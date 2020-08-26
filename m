Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C630A2528DD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B616EA37;
	Wed, 26 Aug 2020 08:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03356E9D2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:04:25 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 591FAC58BF69EA375866;
 Wed, 26 Aug 2020 09:04:21 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.103) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 26 Aug 2020 09:04:07 +0800
Subject: Re: [PATCH] drm/sun4i: add missing put_device() call in
 sun8i_r40_tcon_tv_set_mux()
To: Maxime Ripard <maxime@cerno.tech>
References: <20200825114403.1392369-1-yukuai3@huawei.com>
 <20200825133851.scnipngfpm6jyje5@gilmour.lan>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <3eec5382-0aed-ee9a-1ac4-5a56bdeeef09@huawei.com>
Date: Wed, 26 Aug 2020 09:04:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200825133851.scnipngfpm6jyje5@gilmour.lan>
X-Originating-IP: [10.174.179.103]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 26 Aug 2020 08:04:49 +0000
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
Cc: jernej.skrabec@siol.net, yi.zhang@huawei.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/08/25 21:38, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Aug 25, 2020 at 07:44:03PM +0800, Yu Kuai wrote:
>> If sun8i_r40_tcon_tv_set_mux() succeed, at_dma_xlate() doesn't have a
>> corresponding put_device(). Thus add put_device() to fix the exception
>> handling for this function implementation.
>>
>> Fixes: 0305189afb32 ("drm/sun4i: tcon: Add support for R40 TCON")
>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> 
> That doesn't sound right, we're not using at_dma_xlate at all in that
> driver?
> 

Hi!

sry about that, should be sun8i_r40_tcon_tv_set_mux(), same as the
title said.

Best regards,
Yu Kuai

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
