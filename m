Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACA8807551
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 17:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D224E10E760;
	Wed,  6 Dec 2023 16:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F195410E760
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 16:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=3cq9uVBBQoMhBc6XCuXixVk8zZ9aaLq+WupbYXg8tJg=; b=nYqRKlq2R6C9KBQQPlB/IZEacn
 LbaIZxsSJGB5n7RzzbNTZicpeqcpWHhE6n6oZGSW6OF5CKGJ68h9y/xGRUl3mo3nZWNOAexvDsDRC
 +eh4Tm/Y/H2nmFpxPfkkmG8Vi4cp7bRi1MgclcrFOpNoF2Solq6MTSIQPGTQQraMwQ24nn9N8KqKC
 heBs7ElvTlQ7hLE+oevXbLio3jv1oMh/XCL+iNxSjcInPQByasKMVrmlAWadBqQlu/CX+Vt8oCsPn
 o3GvYVcPXMk9+oicgj/eXyZ6QAoIkxw114iBSRqolutGFR7Y/44Dn2rJpxmJ98gxOIbrEdn9v4bpb
 IyhTq5kw==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rAuvR-00Amj8-1C; Wed, 06 Dec 2023 16:39:05 +0000
Message-ID: <2c676d1f-5e1d-44a5-814a-e8ccac78743a@infradead.org>
Date: Wed, 6 Dec 2023 08:39:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] backlight: ili922x: fix W=1 kernel-doc warnings
Content-Language: en-US
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>
References: <20231205225638.32563-1-rdunlap@infradead.org>
 <20231206112645.GA81045@aspen.lan> <20231206132516.GB3375667@google.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231206132516.GB3375667@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/6/23 05:25, Lee Jones wrote:
> On Wed, 06 Dec 2023, Daniel Thompson wrote:
> 
>> On Tue, Dec 05, 2023 at 02:56:38PM -0800, Randy Dunlap wrote:
>>> Fix kernel-doc warnings found when using "W=1".
>>>
>>> ili922x.c:85: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>>> ili922x.c:85: warning: missing initial short description on line:
>>>  * START_BYTE(id, rs, rw)
>>> ili922x.c:91: warning: contents before sections
>>> ili922x.c:118: warning: expecting prototype for CHECK_FREQ_REG(spi_device s, spi_transfer x)(). Prototype was for CHECK_FREQ_REG() instead
>>>
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Lee Jones <lee@kernel.org>
>>> Cc: Daniel Thompson <daniel.thompson@linaro.org>
>>> Cc: Jingoo Han <jingoohan1@gmail.com>
>>> Cc: Helge Deller <deller@gmx.de>
>>> Cc: linux-fbdev@vger.kernel.org
>>> ---
>>>  drivers/video/backlight/ili922x.c |    9 ++++-----
>>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>>
>>> diff -- a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
>>> --- a/drivers/video/backlight/ili922x.c
>>> +++ b/drivers/video/backlight/ili922x.c
>>> @@ -82,13 +82,12 @@
>>>  #define START_RW_READ		1
>>>
>>>  /**
>>> - * START_BYTE(id, rs, rw)
>>> - *
>>> - * Set the start byte according to the required operation.
>>> + * START_BYTE() - Set the start byte according to the required operation.
>>>   * The start byte is defined as:
>>>   *   ----------------------------------
>>>   *  | 0 | 1 | 1 | 1 | 0 | ID | RS | RW |
>>>   *   ----------------------------------
>>
>> I'm not sure we want "The start byte is defined as" in the brief
>> description. Needs a blank line between the brief and full description
>> (or hoist the argument descriptions up to match the idiomatic
>> form for a kernel-doc comment in the docs if you prefer).
> 
> I'd consider dropping the kernel-docness of this header entirely.
> Kerneldoc is designed for documenting exported (or at least externally
> available) functions and data structures, with allowances for static
> functions in the name of consistency or in cases of excessive
> complication.  I've fixed A LOT of kernel-doc headers in my time and I
> can't say I remember coming across MACROs being documented this way
> before now.
> 

I've seen several macros that are documented, but I am happy to just drop
the kernel-doc for these local macros.  I'll send a patch for that.

Thanks.
-- 
~Randy
