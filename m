Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3420B689E98
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 16:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2991F10E805;
	Fri,  3 Feb 2023 15:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D3110E805
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=RABYZKQEnf0QK23SEeW3xVSQhJGlQ3o0a9xB2pxXdFg=; b=mxbhKN8eDLHf3sRbpUD1Pm5ad9
 DUxn/adCxDe6jPyxHF/gdCrJDf3lsIsIixEOuV8CpNuzkiX752ZBaf0wsnY0b2i3cM9FUEcN20eX2
 rIR05AXVLD17i/oQNhbkjja3UIifH2qUWnxDkJqAUC7NG8o6c1/1J2q0zeQmeJMRLojURzkVBUv7W
 j9O4rmt4LMN1wjI6tRgPyBaBqiFphCrvwmB0uTJBDK4DzjkMj6rO8E5wNKaysJXqmttqL9r4yHFrh
 f47+XS3tx6LOOWc7AZ91W6sFA96KtfzRuvr3oItFzuKm5u8MGjDHAAIf0SDJC5iX+lV71N215QhEo
 +ggV+adQ==;
Received: from [2601:1c2:d00:6a60::9526]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pNyR8-002pf0-3m; Fri, 03 Feb 2023 15:57:14 +0000
Message-ID: <f6a60193-a5d1-c42c-158a-4b0bfe9c7538@infradead.org>
Date: Fri, 3 Feb 2023 07:57:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: remove arch/sh
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
 <20230203083037.GA30738@lst.de>
 <d10fe31b2af6cf4e03618f38ca9d3ca5c72601ed.camel@physik.fu-berlin.de>
 <CAMuHMdUitVfW088YOmqYm4kwbKwkwb22fAakHcu6boxv7dXDfQ@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAMuHMdUitVfW088YOmqYm4kwbKwkwb22fAakHcu6boxv7dXDfQ@mail.gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi--

On 2/3/23 02:33, Geert Uytterhoeven wrote:
> Hi Adrian,
> 
> On Fri, Feb 3, 2023 at 11:29 AM John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
>> On Fri, 2023-02-03 at 09:30 +0100, Christoph Hellwig wrote:
>>> On Fri, Feb 03, 2023 at 09:24:46AM +0100, John Paul Adrian Glaubitz wrote:
>>>> Since this is my very first time stepping up as a kernel maintainer, I was hoping
>>>> to get some pointers on what to do to make this happen.
>>>>
>>>> So far, we have set up a new kernel tree and I have set up a local development and
>>>> test environment for SH kernels using my SH7785LCR board as the target platform.
>>>>
>>>> Do I just need to send a patch asking to change the corresponding entry in the
>>>> MAINTAINERS file?
>>>
>>> I'm not sure a there is a document, but:
>>>
>>>  - add the MAINTAINERS change to your tree
>>>  - ask Stephen to get your tree included in linux-next
>>>
>>> then eventually send a pull request to Linus with all of that.  Make
>>> sure it's been in linux-next for a while.
>>
>> OK, thanks for the pointers! Will try to get this done by next week.
>>
>> We're still discussing among SuperH developer community whether there will be a second
>> maintainer, so please bear with us a few more days. I will collect patches in the
>> meantime.
> 
> Thanks a lot!
> 
> If you need any help with process, setup, ... don't hesitate to ask
> (on e.g. #renesas-soc on Libera).

While Adrian and Geert are reading this, I have a question:

Is this "sh64" still accurate and applicable? from Documentation/kbuild/kbuild.rst:

But some architectures such as x86 and sparc have aliases.

- x86: i386 for 32 bit, x86_64 for 64 bit
- sh: sh for 32 bit, sh64 for 64 bit <<<<<<<<<<<<<<<
- sparc: sparc32 for 32 bit, sparc64 for 64 bit



Thanks.
-- 
~Randy
