Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8227326F6A3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 09:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4251B6ECB3;
	Fri, 18 Sep 2020 07:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2787A6E0B8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 00:50:32 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A79DC255FB1C7A8DD48E;
 Fri, 18 Sep 2020 08:50:28 +0800 (CST)
Received: from [10.174.178.248] (10.174.178.248) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 18 Sep
 2020 08:50:26 +0800
Subject: Re: [PATCH] fbcon: Remove the superfluous break
To: Nick Desaulniers <ndesaulniers@google.com>
References: <20200917131515.147029-1-jingxiangfeng@huawei.com>
 <CAKwvOdnm-PkEt6T3HqB-NYNYADth0MJkXCvFsc-_gyqRE-nmcg@mail.gmail.com>
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Message-ID: <5F640451.7020704@huawei.com>
Date: Fri, 18 Sep 2020 08:50:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdnm-PkEt6T3HqB-NYNYADth0MJkXCvFsc-_gyqRE-nmcg@mail.gmail.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, daniel.vetter@ffwll.ch,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, george.kennedy@oracle.com,
 Greg KH <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 Nathan Chancellor <natechancellor@gmail.com>, jirislaby@kernel.org,
 peda@axentia.se
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2020/9/18 1:36, Nick Desaulniers wrote:
> On Thu, Sep 17, 2020 at 6:15 AM Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:
>>
>> Remove the superfuous break, as there is a 'return' before it.
>
> superfluous (missed "l")

Thanks for correcting!
>
>>
>> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Thanks for the patch; I audited the rest of the switch statements in
> this translation unit; LGTM.
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
>>                                      vc->vc_video_erase_char,
>>                                      vc->vc_size_row * count);
>>                          return true;
>> -                       break;
>>
>>                  case SCROLL_WRAP_MOVE:
>>                          if (b - t - count > 3 * vc->vc_rows >> 2) {
>> @@ -1818,7 +1817,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>>                                      vc->vc_video_erase_char,
>>                                      vc->vc_size_row * count);
>>                          return true;
>> -                       break;
>>
>>                  case SCROLL_WRAP_MOVE:
>>                          if (b - t - count > 3 * vc->vc_rows >> 2) {
>> --
>> 2.17.1
>>
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
