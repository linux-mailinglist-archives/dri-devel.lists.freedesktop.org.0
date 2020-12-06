Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 095032D0C52
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682E56E7D9;
	Mon,  7 Dec 2020 08:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E0089FA5
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 21:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=jqZowNSxZx03e2+zHSXuNqp8jokTpKVo8DZ3QyeqECU=; b=SH0G9oTMFItgli83OxaB5dHaGg
 wZGuHDUT7CWXOWN9+0zBUwilZPwg60ASMlG8GBl+p/cyCnrzC8zd3kEVMS4hfjh+j/FvNQ6gDydTS
 7uOJGHEtcHFWNb82cuyFT5RrINZ2AKXrFOKrUIhF2Iz1BeliOtOBbq0tWTloQuC5DY5Lt7N6LcVZZ
 w/xS4uGFzgRnV7z6o3Iwf/MOnJYKkC0+WsQWm1yx3S1Lx3kT/LjnQUNpevAoqzwZ/Lm0hQL2dT5Bh
 0nJKGmLx+YXAsNg7dvgyBoWbgHRi5tZAnuNWj1dlKRvMCgxs1N666ddQnBq+7KcRxlDrrU1dHgkJo
 TPCh9bdA==;
Received: from [2601:1c0:6280:3f0::1494]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1km1ZJ-0006Na-8B; Sun, 06 Dec 2020 21:27:45 +0000
Subject: Re: [PATCH v3 02/13] video: fbdev: core: Fix kernel-doc warnings in
 fbmon + fb_notify
To: Sam Ravnborg <sam@ravnborg.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-3-sam@ravnborg.org>
 <0fb6ff8b-bea3-c5bc-0d37-8a5fdab41abc@infradead.org>
 <20201206205132.GA1869030@ravnborg.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <22e4482a-11f7-170f-0981-cf9f4069f00f@infradead.org>
Date: Sun, 6 Dec 2020 13:27:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201206205132.GA1869030@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Gustavo A R Silva <gustavoars@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Peter Jones <pjones@redhat.com>,
 Lee Jones <lee.jones@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/6/20 12:52 PM, Sam Ravnborg wrote:
> Hi Randy.
> 
> On Sun, Dec 06, 2020 at 11:37:17AM -0800, Randy Dunlap wrote:
>> On 12/6/20 11:02 AM, Sam Ravnborg wrote:
>>> Fix kernel-doc warnings reported when using W=1
>>>
>>> v2:
>>>   - Improve subject (Lee)
>>>
>>> v3:
>>>   - Add RETURNS documentation (Thomas)
>>
>> Hi Sam,
>>
>> Yes, RETURNS: will work. It just looks like any kernel-doc section name,
>> such as Context: or Note:.
>> However, the documented format for return info is "Return:".
>> (see Documentation/doc-guide/kernel-doc.rst)
> OK, like this?

Yes. LGTM.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> I did not fix any existing uses of RETURNS, thats for another patch.
> 
> 	Sam
> 
> commit 03b7c3ecf7cb51b5429ca0ef58a32bb4dc486610
> Author: Sam Ravnborg <sam@ravnborg.org>
> Date:   Sat Nov 28 23:40:49 2020 +0100
> 
>     video: fbdev: core: Fix kernel-doc warnings in fbmon + fb_notify
>     
>     Fix kernel-doc warnings reported when using W=1
>     
>     v2:
>       - Improve subject (Lee)
>     
>     v3:
>       - Add RETURNS documentation (Thomas)
>     
>     v4:
>       - Use Return: not RETURNS (Randy)
>     
>     Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>     Cc: Lee Jones <lee.jones@linaro.org>
>     Cc: Sam Ravnborg <sam@ravnborg.org>
>     Cc: Randy Dunlap <rdunlap@infradead.org>
>     Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>     Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>     Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>


-- 
~Randy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
