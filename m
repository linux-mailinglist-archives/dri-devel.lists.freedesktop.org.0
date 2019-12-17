Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290FD1228E1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687CC6E9B7;
	Tue, 17 Dec 2019 10:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668F76E945;
 Tue, 17 Dec 2019 06:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C4prl5hgq8EyxMDzUKjiRjIgpSu8ZtR82zxGAFc4PYg=; b=tkxGlDIGnZdsoAldXhYWgXCMO
 0+xpZfW5WDybgWcngKS+cgdvSj70cQI+WfNeYS+nbNbcAgwOmEvWNXpZLJz45VCLKFlqOtrt4oGf2
 LnD5ZOeYg0yGEcgnz1a8iJOENVz/3QAqtI4bDjulzUIl/9EoJt296ph/GhWSxsu5qPsnUtALWhmam
 iGYvSyeAaP8pgSJdE16QjC5LUo2V0v4+a6MoyXFqXjO9604CeBH05JRjeaMMg8txZfO0M7USGOPcU
 xmfez8M1M31DOnbtK8LE5eDxgwPtVtN74+/gW3jgZUN9MtoU0h8Usvyx9C6YQ3k4tiQMfHg3oQ40a
 x4pZ8Hqsw==;
Received: from [2601:1c0:6280:3f0::fee9]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih6UI-0002pz-LT; Tue, 17 Dec 2019 06:37:42 +0000
Subject: Re: linux-next: Tree for Dec 16 (drm_panel & intel_panel)
To: Sam Ravnborg <sam@ravnborg.org>
References: <20191216162209.5b5256dd@canb.auug.org.au>
 <d92bec2a-62cb-004e-7f8c-01fc12a53a74@infradead.org>
 <20191217054255.GA26868@ravnborg.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <65c9dc7b-3c61-8204-07da-212632732791@infradead.org>
Date: Mon, 16 Dec 2019 22:37:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191217054255.GA26868@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/16/19 9:42 PM, Sam Ravnborg wrote:
> Hi Randy.
> 
> On Mon, Dec 16, 2019 at 08:25:11AM -0800, Randy Dunlap wrote:
>> On 12/15/19 9:22 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20191213:
>>>
>>
>> on x86_64:
>>
>> ld: drivers/gpu/drm/drm_panel.o: in function `drm_panel_of_backlight':
>> (.text+0x2ee): undefined reference to `devm_of_find_backlight'
>>
>> ld: drivers/gpu/drm/i915/display/intel_panel.o: in function `intel_backlight_device_register':
>> intel_panel.c:(.text+0x593e): undefined reference to `backlight_device_register'
>> ld: drivers/gpu/drm/i915/display/intel_panel.o: in function `intel_backlight_device_unregister':
>> intel_panel.c:(.text+0x5a04): undefined reference to `backlight_device_unregister'
>>
>> CONFIG_DRM_PANEL=y
>> CONFIG_BACKLIGHT_CLASS_DEVICE=m
>> CONFIG_DRM_I915=y
>>
>> Full randconfig file is attached.
> 
> Can you please verify if you have:
> 907aa265fde6589b8059dc51649c6d1f49ade2f3
> ("drm/drm_panel: fix EXPORT of drm_panel_of_backlight")
> 
> This commit is supposed to fix it.
> 
> 	Sam
> 

Hi Sam,
I don't have the linux-next.git tree so I can't check that.
I just built whatever is in linux-next of 20191216.

-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
