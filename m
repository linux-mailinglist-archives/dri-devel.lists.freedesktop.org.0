Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1A742342E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 01:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F946E483;
	Tue,  5 Oct 2021 23:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 421 seconds by postgrey-1.36 at gabe;
 Tue, 05 Oct 2021 23:11:10 UTC
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC80B6E483
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 23:11:10 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XtTim298JJzjeXtTimbttD; Wed, 06 Oct 2021 01:04:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633475047; bh=lu27si1wf7RXbW6LuOXnn9leoefA4/keMW0urX8XJCg=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=Cfy5uFCAINlfsK3xSSVmOx/G62cRVBFZ4Qyt1W95qUbv7NCW5/ZJQ7P9W6OXV92r+
 ly/DbQyoT27KPMD8RO/sCAUofyqClqSYtIDnN95jRPEgEYFv3LUTYpTu8ImYeCJQVR
 CQcMyJTD4CKGW6rERO/Tgt7XdXHw+LyjXQ9d4YiA5SOyit6rfiNv2ol2bdEwybiTO6
 PV6L6E5YgnthVCA6wW1EfncEwCKz5qCpEySdt4MVVV0RGC/IMvcYGzvJLJuHrxmiOZ
 eANUOtLvU7yz0mpBis9JiwMRsRtc8RhCLNc56f8jjwEcwBayGi32VnHJXcfPHkDQ++
 ZPY4OrxtrYf+A==
Subject: Re: [PATCH v3 0/9] Add 4 Jenson simple panels
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
 <20210401231720.2470869-1-giulio.benetti@benettiengineering.com>
 <b5685187-15f8-14da-386f-507ae518d22b@benettiengineering.com>
Message-ID: <d04ab2af-b157-d903-593b-67b7c21edf7c@benettiengineering.com>
Date: Wed, 6 Oct 2021 01:04:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b5685187-15f8-14da-386f-507ae518d22b@benettiengineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFQCMnMYvMQ+a+pw1gzE8iJRzL8VJAbI5LN9aFhY7CBxB2y2hJX/9OOJrIxj3+LJmb+B5OlOE/WmFQIhbQIDG4bR6F2tgUnOyZ4DzDOWZDcjIDclC2s6
 LnHbPxALq5QyEjsJ0sBxuc0Q0wAaM3JWKIuJZso0rNjxbIXbjEEc4IbpxNLHQp4+6UzCpNxFGeYeRr6bZlGPMoBbASbsvNd6jH0hhVr6w99U4NVCj6700Pi7
 mxd2FyPaJilfJ7A6HB0FZM9n1uMncV8gAPVJClJHKzJ3BMCz8+ZXZrfAdOlK031ncE5Vlq/0EUC9G9CbGeMgp0a3Ns4pYONCpG0Oam43wP6P1BqJ0ElP0SxX
 yN/e9yUTU5QqlP99H7OyLZ1nKtJXXSMi7SLTrnk6uaYKHonaTj8=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello All,

kindly pinging this patchset, I've forgotten to set it Unarchived, now 
it is:
https://patchwork.kernel.org/project/dri-devel/list/?series=459931

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 5/2/21 10:50 PM, Giulio Benetti wrote:
> Hello Thierry,
> 
> I've seen that this patchset [1] in DRI Patchwork has been archived, but
> it's not been applied and all patches result as "New", so I've set them
> as un-archived. Hope it's correct.
> 
> [1]:https://patchwork.kernel.org/project/dri-devel/list/?series=459931
> [2]:https://patchwork.kernel.org/project/dri-devel/list/
> 
> Best regards
> -- Giulio Benetti Benetti Engineering sas On 4/2/21 1:17 AM, Giulio 
> Benetti wrote:
>> This patchset introduce Jenson vendor and add 4 of its panels to
>> panel-simple driver.
>>
>> ---
>> V2-V3:
>> * changed my SoB and authorship
>> * added some forgotten acked-by
>> * fixed alpha-numeric order on adding bindings
>> ---
>>
>> Giulio Benetti (9):
>>     dt-bindings: Add Jenson Display vendor prefix
>>     dt-bindings: display/panel: add Jenson JT60245-01
>>     dt-bindings: display/panel: add Jenson JT60248-01
>>     dt-bindings: display/panel: add Jenson JT60249-01
>>     dt-bindings: display/panel: add Jenson JT60250-02
>>     drm/panel: simple: add Jenson JT60245-01
>>     drm/panel: simple: add Jenson JT60248-01
>>     drm/panel: simple: add Jenson JT60249-01
>>     drm/panel: simple: add Jenson JT60250-02
>>
>>    .../bindings/display/panel/panel-simple.yaml  |   8 ++
>>    .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>>    drivers/gpu/drm/panel/panel-simple.c          | 108 ++++++++++++++++++
>>    3 files changed, 118 insertions(+)
>>

