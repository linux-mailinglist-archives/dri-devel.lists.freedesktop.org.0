Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3068C0523
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 21:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E95112942;
	Wed,  8 May 2024 19:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="OYwM5J3E";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Rl6UJmHi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com
 [103.168.172.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C1511319E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 19:36:00 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 4BA3A13803A7;
 Wed,  8 May 2024 15:35:59 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Wed, 08 May 2024 15:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1715196959; x=1715283359; bh=AevYpQYMyj
 fculEN7d2NxE46rgJdGyUNF04I9cx6jJU=; b=OYwM5J3E85P/baYNl5kaaW9gYy
 W2cF6VebnaYT5UpwedMHWEN0hIfvDvJRfxadvKuDRrhVpp2aBbDPjh5kZwxtV1xB
 V01PtLcN+lfUoXQcJwku04UyIpjZtd9v7+FMpPE86qxuW0sgvZwo5OVTNmbqOqaj
 r9VfZ49kDlyfDvl8nztctA/GcKHfx8oselfW4heWExkcR9RG+32rQIMJNtZE3ozF
 maO75RTV1IpmLtdW678rWqnWlpmpVMJGTLrND0heBUVs1NF0VH+dtvDN3CFGNB11
 PO98nLD9QZcNPstuZxhGza2ohowwxKWz+8N/tN6Z4nJt+KAgcw4IhAqhd3Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1715196959; x=1715283359; bh=AevYpQYMyjfculEN7d2NxE46rgJd
 GyUNF04I9cx6jJU=; b=Rl6UJmHiYwZWSuTBSiLwXwJxQoYtxfdhatsPv9WHvm29
 Xq1UaYnuehGwlpSDfrQwu7i/96vcJ2Dyzk+VAgcd8Ycv2kxWxQYm3MW89nyijclv
 9c0hARfFaY03G5KEVcbWnNy4ygVcunRnqlfQiY29YK2VnFM4Rp3QLUbHikE7Koeg
 TQycPYk4N5sam2krKY6xQChYInqdBF67CoHat9cIegs9d0SYEGJm8iu0GFpAyxb3
 FCSmEwqtSPGhQEVMvauxZ9j7tqx/UWv7ICfvbmF8IG6s+EhH08FXwcKZW/iBahKm
 7mYFNoSUOvbpQSW9hMTaF3HsMt2KUNGtT6d3//eDYQ==
X-ME-Sender: <xms:HtQ7ZvSzZ9wnzf1_g7XO1vXPvtTKq37joYuWF1qGJBM6H9_6Y0KWsQ>
 <xme:HtQ7Zgzzusjn64QaiUyfFxaajp30cDIP8rVJu_EhkWNC0PlGyJ8UycxGh_lnJ6CQv
 qKeEnU2TVOKiCQJ1qU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeftddgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
 keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:H9Q7Zk2cZtyrQKmauGESNaal5pD3ELj8AN1ZEd_kMD0hROFpu6uwqA>
 <xmx:H9Q7ZvAm_SmMBYJPrTqFhd-1C4HFCIDhmxtBHblUmFmiS2kuDcEKyA>
 <xmx:H9Q7Zoj4SJPO6vIfGZsQ6RH5KNtWo5gSfExYppJmWzNfbvlDhE7Thg>
 <xmx:H9Q7ZjqeotPMvGxhcBi2nLmnuRC75DvvbJ9J83np3sz7BNnm0ZAXiA>
 <xmx:H9Q7ZhUy2a2bGjuW9c9wvY3rYmLKVGQ7n4NzzuuMZUVnKfFbZiWyR1zc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E1B40B6008D; Wed,  8 May 2024 15:35:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-443-g0dc955c2a-fm-20240507.001-g0dc955c2
MIME-Version: 1.0
Message-Id: <41639d6b-a429-43f4-8568-12fcd1671cff@app.fastmail.com>
In-Reply-To: <fe156e32-8ce7-4ce5-99cb-6291ad4b83b0@broadcom.com>
References: <20240503192858.103640-1-florian.fainelli@broadcom.com>
 <8e1867fc-34da-457c-b95a-2d51ea97336a@app.fastmail.com>
 <05a5e893-12f7-49fd-9a9a-abd387571f9b@broadcom.com>
 <ZjjXtEwWWZX43c6l@phenom.ffwll.local>
 <47c63c4c-c657-4210-b476-c91c4f192483@app.fastmail.com>
 <ZjoMI5bJSlqhtOy1@phenom.ffwll.local>
 <41191296-0aa0-4010-b70f-efa80b9200d4@app.fastmail.com>
 <fe156e32-8ce7-4ce5-99cb-6291ad4b83b0@broadcom.com>
Date: Wed, 08 May 2024 21:35:38 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Daniel Vetter" <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, "Helge Deller" <deller@gmx.de>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Sam Ravnborg" <sam@ravnborg.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] fbdev: Have CONFIG_FB_NOTIFY be tristate
Content-Type: text/plain
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

On Wed, May 8, 2024, at 20:37, Florian Fainelli wrote:
> On 5/7/24 04:44, Arnd Bergmann wrote:
>> On Tue, May 7, 2024, at 13:10, Daniel Vetter wrote:
>>> On Mon, May 06, 2024 at 04:53:47PM +0200, Arnd Bergmann wrote:

>> Right, let's wait for Florian to reply. From what he said earlier
>> though, the only reason that the notifiers are getting in the
>> way is the link error you get from trying to load a separately
>> built fb.ko module on a kernel that was built with FB=n / FB_CORE=n,
>> so I don't think he even cares about notifiers, only about
>> allowing the recovery application to mmap() the framebuffer.
>
> Right, we do not really care about notifiers AFAICT. Based upon this 
> discussion there has been an action on our side to stop making use of 
> the FB subsystem for recovery and use the full blow DRM driver instead.

Ok, sounds good.

> While we get there, though I still see some value into this patch (or a 
> v2, that is). I have a v2 ready if you think there is some value in 
> pursuing that route, if not, we can stop there.

I think if you want to do a new version, that is likely to run
into new problems, given that this part of fbdev is particularly
fragile and partly wrong. On the other hand, it would be nice to
have a patch to limit the use of the notifiers to the smallest
set of kernel configs that actually need it, and leave it turned
off for everything else.

These are the ones I could find:

- CONFIG_GUMSTIX_AM200EPD (FB_EVENT_FB_REGISTERED)
- CONFIG_LCD_CORGI, CONFIG_LCD_TDO24M (FB_EVENT_MODE_CHANGE)
- CONFIG_LEDS_TRIGGER_BACKLIGHT (FB_EVENT_BLANK)
- CONFIG_FB_OLPC_DCON (FB_EVENT_BLANK/BL_CORE_FBBLANK)
- CONFIG_FB_SH_MOBILE_LCDC, CONFIG_BACKLIGHT_PCF50633,
  CONFIG_BACKLIGHT_PANDORA, CONFIG_BACKLIGHT_LP855X (BL_CORE_FBBLANK)
- CONFIG_FB_CLPS711X, CONFIG_FB_IMX, CONFIG_MACH_AMS_DELTA
  (lcd BL_CORE_FBBLANK)
- CONFIG_LCD_AMS369FG06, CONFIG_LCD_CORGI, CONFIG_LCD_HX8357,
  CONFIG_LCD_ILI922X, CONFIG_LCD_ILI9320, CONFIG_LCD_HP700,
  CONFIG_LCD_L4F00242T03, CONFIG_LCD_LMS283GF05, CONFIG_LCD_LMS501KF03
  CONFIG_LCD_LTV350QV, CONFIG_LCD_OTM3225A, CONFIG_LCD_PLATFORM,
  CONFIG_LCD_TDO24M (lcd BL_CORE_FBBLANK)

Almost all of these are exclusive to ancient ARMv5 boards or
similar, so if we make the notifiers depend on the whole list,
this would leave it disabled even for most configurations
that enable CONFIG_FB=y.

This could be done with a 'select', but I'd prefer the
'default y; depends on LCD_FOO || LCD_BAR || ...'
variant because that makes it easier to spot if someone
tries to add another one.

      Arnd
