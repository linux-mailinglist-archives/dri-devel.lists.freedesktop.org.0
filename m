Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DB8CAE025
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 19:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77E210E480;
	Mon,  8 Dec 2025 18:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="CLnNfxgB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7202510E480
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 18:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=yLzKuVB9SRbRu6KABlxK9U/BOBG3oxrbOo+OTMvlotw=; b=CLnNfxgBY0q5YgCfYzG3Dlh34b
 EEtmJtTusDTKsZbTYzaXhcu0062Ml+ROgkjDjvTdVCGOyI1WiqRal51qFDhJku9JOUdVEgOoDzDvZ
 FmxiWs9IpvtAnwnVt9QhEaz94qttqk9HtlYcwgT9XnjH/nZJaOPdL+/weryaY/RvWkRN6m6m+LWVL
 vOlh2ZpvnEm5cjAi8QGFaorWBMCjGSiewTGrxtA6zy3SM4XDLPQSA6e7KPHYOjKG/wQ1R9pDzaszP
 fkakMEtmCiLYQBRpi+HMs3PVPUdX8nQCYgcBRU3ydDbye0g0QWoyOcsIQCvVqF5ATGtmMIDIZQH0A
 ZaaML9ww==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vSg9Q-0000000DR7O-2RyS; Mon, 08 Dec 2025 18:40:01 +0000
Message-ID: <873236c8-4dab-4f1e-a2bf-d233ec74bd49@infradead.org>
Date: Mon, 8 Dec 2025 10:39:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig dangling references (BZ 216748)
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 andrew.jones@linux.dev, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-sound@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 chrome-platform@lists.linux.dev, Paul Cercueil <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
 x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <aTcVXrUXVsyjaT22@shepard>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aTcVXrUXVsyjaT22@shepard>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/8/25 10:13 AM, Paul Kocialkowski wrote:
> Hi Randy,
> 
> On Sun 07 Dec 25, 18:04, Randy Dunlap wrote:
>> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
>>
>> The bugzilla entry includes a Perl script and a shell script.
>> This is the edited result of running them (I removed some entries that were noise).
> 
> [...]
> 
>> DRM_KMS_DMA_HELPER ---
>> drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
>> drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER
> 
> For these two, the symbol was removed in commit
> 09717af7d13d63df141ae6e71686289989d17efd but these two drivers either were
> missed by the batch rename or were introduced a bit later.
> 
> Since the symbol selected DRM_GEM_CMA_HELPER (which is still needed by the
> drivers), it should be replaced with DRM_GEM_CMA_HELPER.
> 
> Are you expecting to craft a patch for fixing this or should I do it myself?

Hi Paul,
Please take care of it yourself.

Thanks.
-- 
~Randy

