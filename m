Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 884C04A77EF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 19:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8302310E318;
	Wed,  2 Feb 2022 18:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7E510E422
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 18:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643826563;
 bh=2IdI1RHS3u/emx2pDEg/QOEg9hVudfhqAtuvwsuqAvA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=CVdOVNz6PENYpqva50O8zsrHraxxFRMr3t1Edeav11ki/xEIawnJkGD6BMEAuYs6P
 7N//uFbi+wnOnuIsJrVQzGYNy0lAT+QgHLII8Gp23TdqBGkkzoKTCyknabwXpbgkfe
 ssI3lfNnJJ0dZvVmV6v4AYt+Sr/14rLdPOqcfO2k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.163.171]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGN2-1myCyD1QSU-00JMe8; Wed, 02
 Feb 2022 19:29:23 +0100
Message-ID: <76ed4203-1ddc-1bbf-39c8-7cb62de7f4e9@gmx.de>
Date: Wed, 2 Feb 2022 19:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: fbdev git tree update
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <e1e5b7d1-ea09-6e28-9c39-45b983734a85@gmx.de>
 <YfrFvfZuZM1N9frh@ravnborg.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <YfrFvfZuZM1N9frh@ravnborg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LnWdKf8vSjQxPtwaH4S3XPwJbXCinbROTaGQqvzIDzS6NKtj/PZ
 w6Nb3Dpg5DZmJKV7ZyImf2Gx/BBSlJHma5aDMfr7PQUpfXEz7kG6990qCjy+RFmRihvtpVe
 nyftA17pDgJfHTcCb9Wt/hCIM6hjExXm+acPxD8+gwUAM44kT7ZvwJ/nNS/n5HWDTUbQ9kI
 fjpPToZqMzUA6F3Tobyaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8LXCXCcIGfI=:C70FzneTEw1oVK3a6I8n5z
 YiPiS5ywi87cvGbGowawWYeCMUJLuwMFdNC8ZzM3MaMNlp/btAjUjkTsiawyd3GUYc/IUd+n4
 pVKa07iN8DOTjY11Ra4nIw9HL2+KGBdzpWcbdkd6a52J1DjWkfHLPeD+kvKvC4499l/YrhTlR
 Dh8btNTI5PhvRUKuasHhNn62BvgMRQScddPP39XOf4HM9jBt8XI1N8DCVM0bavGxmDkr4s0qn
 bWJoLlPAyenLmKyhvLpFm6n8831nTWvPVrYZYMSTJ5flOkccBVp4oV4C+iz+XkdRkOT8dxaHc
 VXivLVcmD0SNmjVRRBqK/d3FZl50ud2UU7NhnNO8dlVO9bibb4p3aijUeaVzVNFU3LxPDG6aE
 RcBdgKzx7VTcuB+JKnW4/SrmtzJHbA9tS0saCSOffkqmULzg6czE7KyUhyXli2e0unHn8KvO7
 4WeARI+gWORXlktOv9Z0t7KmrR+g8U0eo/eY4hQsyfaKkJ75i9piKs14HfTKBQrZMc3c3oVjy
 7dv+nJ5oJbXZHZvXdePQbksqZKWzHnWxp1eIvAxgHrF5l+hTfNV2jAClRwRbeorQR7YNndb3+
 XnYbUnnELAngU2M2kAGX4btpfqy3J4WQHmrwd37eJzjvffwywoJn7+rRr5fBhuZdfXL1aR/Mi
 Tx3l4x+2+oDOJwYxNrzPwuX5HRXpW8tgqkLmsOHNYgLCCqpuTqes5l6LG5D22vECtdBqIgaXU
 /oTLDCAgtgP6+Aehnrq1OJPRvEKVjwArc5lST8wxhRQBrp4L8HAstudMgZqpvxv3NKub20s9s
 3eyMvQVd6Pg//+sr3038g50TJVOHUIQbao1PcrEcNmX4c/XtlQMVvpvBK6S+jMRc7rVwA+mea
 Q5vBX6BH72r/sFjj9hTATHTqtkoBBZAepqO8R23lazJIlCy+Jo5Wth5wNJmGpw7N8cVxO82nR
 BZU3yX7QO9cVa6O1R3nGoeLHjBPQI7YcYh5Uu4agCq0fcnlaekseZnSf/XwWVT6fKD6fZmLoc
 6P2/xTG05OOKjAXlepITgQTrUiuGs1OMP+glgF660iP85oZzJbjaiLxfmrLKwfuGWhBrbNlZO
 LI/rGRdv4ccDKg=
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
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

On 2/2/22 18:56, Sam Ravnborg wrote:
> Hi Helge,
>
> On Sun, Jan 30, 2022 at 10:05:39PM +0100, Helge Deller wrote:
>> Hello DRI and fbdev developers,
>>
>> I've now mostly checked all queued-up patches on the fbdev mailing list=
:
>> https://patchwork.kernel.org/project/linux-fbdev/list/
>
> Nice to see all the pending fbdev patches processed.

Thanks!

> I do not see why most of them are applied - why bother with
> dev_err_probe or spelling fixes in old drivers that does not see any
> active development. But that's your call.

Doesn't for every driver at some point the development ceases?
Reasons might be that it's not used anymore, or simply because it
does what it should do.

> How come there are backlight, dt-bindings

I didn't know, and I picked up those at the beginning.
I did agreed with the backlight maintainers that I should
keep those which are already in my tree, and that I will ignore
any upcoming new ones.

> and agp in between the fbdev patches?

It wasn't picked up yet, agp somehow belongs to fbdev and as
maintainer for parisc I was somehow involved as well.
I'm happy to drop it if you think it belongs somewhere else...

> It would be nice to be able to trust that if the fbdev tree has patches
> then it is mentioned when the tree touches files outside the fbdev
> dir.

Sure. Usually I also send out the diffstat.


Helge

>
>
> These are the patches that caught my eye:
>
>> Arnd Bergmann (1):
>>       agp: define proper stubs for empty helpers
>>
>> Luca Weiss (2):
>>       backlight: qcom-wled: Add PM6150L compatible
>>       dt-bindings: simple-framebuffer: allow standalone compatible
>>
>> Xu Wang (2):
>>       backlight: lm3630a_bl: Remove redundant 'flush_workqueue()' calls
>
> If this was mentioned then fine - but now it looks like patches that do
> not belong here.
>
> 	Sam
>

