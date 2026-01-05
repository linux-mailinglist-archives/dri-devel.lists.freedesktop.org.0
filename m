Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C63BCF18C5
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 02:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F8410E070;
	Mon,  5 Jan 2026 01:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="AKRq+C0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D02A10E070
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 01:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=pZJXqr1shDOJNTqRYSFVIu1Zdtd7/8R285rGmkkRm1E=; b=AKRq+C0RidbJ2ebH1AwJJaiFtO
 8KWAnzMMb5j2/RD+jEWnlyhtwoMIEpAqesaCl2mj+Bgr79rcXC2iLY4X8UoUZ1J6ZcERcRLZf/1Mr
 Qj9AvTYMuYYMDIchA/83TyX753gWfZ5EHQHWWsZhznwSoZHN6XQ9mSMXkqJBZRxUOF8JjK7kxTjy8
 YRYm5cRRxcqihc4WnIbQJI4hdpLFCyLFM5d6xhV3rSlhTjcSnziwDYdjnr6V0QQi5WmSmqCxg8qg0
 JaNWJvB4I8S7f1CbEKaO5cHJ++lZok1J0rNm2fPDugTXr2azRdsHFhVo21Rw9ChmdPDMCgZBM4Cj0
 TJFOwEpA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vcZDf-0000000AbSy-3tej; Mon, 05 Jan 2026 01:17:16 +0000
Message-ID: <eb7c246a-6c5f-4d8d-bc96-2a71ece2e042@infradead.org>
Date: Sun, 4 Jan 2026 17:17:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [Linux-stm32] Kconfig dangling references (BZ 216748)
To: Antonio Borneo <antonio.borneo@foss.st.com>, Arnd Bergmann
 <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: linux-sh@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 andrew.jones@linux.dev, Paul Cercueil <paul@crapouillou.net>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, openbmc@lists.ozlabs.org, x86@kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Kocialkowski
 <paulk@sys-base.io>, linux-sound@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 Srinivas Kandagatla <srini@kernel.org>, Jonathan Cameron <jic23@kernel.org>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <5e335232-89b4-4c35-93bd-efad7e4d8995@app.fastmail.com>
 <0220ec0592b6ef8936c25cffbc6cbfa0539fb71a.camel@foss.st.com>
Content-Language: en-US
In-Reply-To: <0220ec0592b6ef8936c25cffbc6cbfa0539fb71a.camel@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 12/8/25 1:48 AM, Antonio Borneo wrote:
> On Mon, 2025-12-08 at 09:55 +0100, Arnd Bergmann wrote:
>> On Mon, Dec 8, 2025, at 03:04, Randy Dunlap wrote:
>>> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
>>>
>>> The bugzilla entry includes a Perl script and a shell script.
>>> This is the edited result of running them (I removed some entries that 
>>> were noise).
>>>
>>> I'll try to Cc: all of the relevant mailing lists or individuals.
>>>
>>> ...
>>>
>>> MACH_STM32MP25 ---
>>> drivers/pinctrl/stm32/Kconfig:58:       default MACH_STM32MP25 || (ARCH_STM32 
>>> && ARM64)
>>
>> This was likely intended for 32-bit kernels on 64-bit STM32MP25
>> chips, which we don't support. I think this can go.
> 
> Yes, I fully agree!
> 
> I have a series pinctrl stm32 to be rebased on v6.19-rc1 and I can include the
> drop of MACH_STM32MP25 inside it.

and what about this dangling symbol?
arch/arm64/Kconfig.platforms:375:	select ARM_SMC_MBOX

It was merged with ARCH_STM32 in
9e4e24414cc6 ("arm64: introduce STM32 family on Armv8 architecture")

Same answer as for MACH_STM32MP25?
If so, Antonio, can you take care of that one also, please?

thanks.
-- 
~Randy

