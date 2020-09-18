Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2334426F6A4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 09:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0F86ECB5;
	Fri, 18 Sep 2020 07:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8AE6E0C6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 00:52:08 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 200A8D066FEC6FE9326E;
 Fri, 18 Sep 2020 08:52:04 +0800 (CST)
Received: from [10.174.178.248] (10.174.178.248) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 18 Sep
 2020 08:52:03 +0800
Subject: Re: [PATCH] fbcon: Remove the superfluous break
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 <b.zolnierkie@samsung.com>, <gregkh@linuxfoundation.org>,
 <daniel.vetter@ffwll.ch>, <jirislaby@kernel.org>, <ndesaulniers@google.com>,
 <natechancellor@gmail.com>, <george.kennedy@oracle.com>, <peda@axentia.se>
References: <20200917131515.147029-1-jingxiangfeng@huawei.com>
 <86015b42-1f87-9f0c-cb34-9d30e8da98a4@embeddedor.com>
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Message-ID: <5F6404B2.3080602@huawei.com>
Date: Fri, 18 Sep 2020 08:52:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <86015b42-1f87-9f0c-cb34-9d30e8da98a4@embeddedor.com>
X-Originating-IP: [10.174.178.248]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 18 Sep 2020 07:21:19 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2020/9/18 2:52, Gustavo A. R. Silva wrote:
>
>
> On 9/17/20 08:15, Jing Xiangfeng wrote:
>> Remove the superfuous break, as there is a 'return' before it.
>>
>> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>
> Also, the following Fixes tag should be included in the changelog text:
>
> Fixes: bad07ff74c32 ("fbcon: smart blitter usage for scrolling")

OK, I'll send a v2 with this tag.

>
> Thanks
> --
> Gustavo
>
>> ---
>>   drivers/video/fbdev/core/fbcon.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
>> index 0b49b0f44edf..623359aadd1e 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -1727,7 +1727,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>>   				    vc->vc_video_erase_char,
>>   				    vc->vc_size_row * count);
>>   			return true;
>> -			break;
>>
>>   		case SCROLL_WRAP_MOVE:
>>   			if (b - t - count > 3 * vc->vc_rows >> 2) {
>> @@ -1818,7 +1817,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>>   				    vc->vc_video_erase_char,
>>   				    vc->vc_size_row * count);
>>   			return true;
>> -			break;
>>
>>   		case SCROLL_WRAP_MOVE:
>>   			if (b - t - count > 3 * vc->vc_rows >> 2) {
>>
> .
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
