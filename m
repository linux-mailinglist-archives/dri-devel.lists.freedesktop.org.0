Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C2A1479B6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 09:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90C36FF87;
	Fri, 24 Jan 2020 08:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608996FEA4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 23:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U+yXTvHHU03TXloUdyqgFfYwZHk55Ef51wCsDSsmGsI=; b=ehnX8wn1rWvYakIpMftcLUwVf
 EQ5CZGze3s398yhpeex6weLpOykg1lpVjuC0aRpMIXO/gAf3LTycguXj10WnZpK0UJ2cJeYfXHutx
 QDU+QVBJKtqeRAx3YCBl9aDqU0GMGZd6bflmPHNv2TYb+ewgI86HG9oFFDCmn6ZD+TeBqlyHIXSRn
 m1nkW7c6tEZshwfnXaTtLBynZ9LZkrXupkDa326tgMBks78cibrU9XujQALHKPOeZEO4c8JsYotV8
 2J9jqMKPgTXxOYo+OEXrawSmrf3GceG939igGP/SZAroxFT2xbhT6gdt1dRXyvIAOhVoKzRGAiky4
 pWu1DT9tA==;
Received: from [2601:1c0:6280:3f0::ed68]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iumBg-0001QU-QQ; Thu, 23 Jan 2020 23:47:00 +0000
Subject: Re: linux-next: Tree for Jan 23 (gpu/drm/panel/)
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200123172101.2f31947c@canb.auug.org.au>
 <098616df-a696-9544-5ca2-c84ce9980999@infradead.org>
 <20200123194959.GA25073@ravnborg.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6a610bdf-3227-fcad-6208-e1e7e085c940@infradead.org>
Date: Thu, 23 Jan 2020 15:46:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200123194959.GA25073@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 24 Jan 2020 08:52:34 +0000
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
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/23/20 11:49 AM, Sam Ravnborg wrote:
> Hi Randy.
> 
> Thanks - I think (kidding, this has bugged of for a long time).
> 
> On Thu, Jan 23, 2020 at 12:44:25AM -0800, Randy Dunlap wrote:
>> On 1/22/20 10:21 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20200122:
>>>
>>
>>
>> on i386:
>>
>> ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.ko] undefined!
>> ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-rocktech-jh057n00900.ko] undefined!
>> ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-raydium-rm68200.ko] undefined!
>> ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.ko] undefined!
>> ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.ko] undefined!
>> ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.ko] undefined!
>> ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.ko] undefined!
>> ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.ko] undefined!
>> ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-innolux-p079zca.ko] undefined!
>> ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-ilitek-ili9881c.ko] undefined!
>> ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-lvds.ko] undefined!
>> ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-boe-himax8279d.ko]
>>
>>
>> Full randconfig file is attached.
> 
> I tried reproducing with latest drm-misc-next - no luck.
> 
> Can you check if you have:
> 
> 8d6cb2f7fb90018d9e3efdc9bc95e6da213a352f
>     drm/drm_panel: fix export of drm_panel_of_backlight, try #3
> 
> 
> As we expect this to fix it for good.
> Maybe the patch has not hit the right tree
> and is thus not in -next.

Hi Sam,

Sorry, I don't have the linux-next git tree so I can't check that commit.

-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
