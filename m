Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D735A37A767
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 15:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE536E183;
	Tue, 11 May 2021 13:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074F76E183
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 13:18:40 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FfdjQ55Pfzkljf;
 Tue, 11 May 2021 21:16:26 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.72) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Tue, 11 May 2021
 21:18:32 +0800
Subject: Re: [PATCH 1/1] drm/mediatek: Remove redundant error printing in
 mtk_cec_probe()
To: Baruch Siach <baruch@tkos.co.il>
References: <20210511113200.5439-1-thunder.leizhen@huawei.com>
 <87r1idwh01.fsf@tarshish>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <2997093d-16ef-6cd1-b920-39b76143a3ca@huawei.com>
Date: Tue, 11 May 2021 21:18:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <87r1idwh01.fsf@tarshish>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021/5/11 21:13, Baruch Siach wrote:
> Hi Zhen Lei,
> 
> On Tue, May 11 2021, Zhen Lei wrote:
>> When devm_ioremap_resource() fails, a clear enough error message will be
>> printed by its subfunction __devm_ioremap_resource(). The error
>> information contains the device name, failure cause, and possibly resource
>> information.
>>
>> Therefore, remove the error printing here to simplify code and reduce the
>> binary size.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>  drivers/gpu/drm/mediatek/mtk_cec.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
>> index e9cef5c0c8f7eff..fd593ff99bfd447 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
>> @@ -197,7 +197,6 @@ static int mtk_cec_probe(struct platform_device *pdev)
>>  	cec->regs = devm_ioremap_resource(dev, res);
>>  	if (IS_ERR(cec->regs)) {
>>  		ret = PTR_ERR(cec->regs);
>> -		dev_err(dev, "Failed to ioremap cec: %d\n", ret);
>>  		return ret;
> 
> You can just return PTR_ERR() directly. No need to set 'ret'.

Right, I will fix it tomorrow.

> 
> baruch
> 
>>  	}
> 
> 

