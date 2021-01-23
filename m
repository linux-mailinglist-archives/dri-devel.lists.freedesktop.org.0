Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C711B3014E4
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jan 2021 12:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDEF6E183;
	Sat, 23 Jan 2021 11:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD266E183
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Jan 2021 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T/0Ps94j/KOyyJDEnwNvRezFOZxbIe2qLXUjzKYzS9g=; b=MklBPW6H42sGNQ6ekwD6GL1UGY
 jOvcf1/w1j8fTRECSqEs1b8YlJbOl1CoS6OrM5RM+zRut4w/08Icx5zIwObwrjlXGz7E/AKY3Y6Yo
 COtEaePEoUF4hMTbUgTvOEW2ar313nFKc2Cd4Cok4+lUas+x/OEHk9+Iyqbz3kS+a1vukl+hVnS8A
 kTGrJcnKLwLz0J5y8LgN5zpvFP4ny9O3r8z2gBe4JSz7OEKAlyR9rMhVPFM7IP32lJ9U38v7GYklW
 fjhpOIAyQPp53xB9lMINjL6ZSC/wFEJUifhBjC6lYqwSrbJYvBWpgpQFD+77WIEPoIYjeSOjOUeYe
 G/7L3Ykg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:64417
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1l3HMo-0007F5-Vt; Sat, 23 Jan 2021 12:46:10 +0100
Subject: Re: [PATCH v4 0/3] Generic USB Display driver
To: Simon Ser <contact@emersion.fr>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20210120170033.38468-1-noralf@tronnes.org>
 <ebda4ea3-3352-f35f-883e-6db751d6ca8b@suse.de>
 <-aBHMpNW0jmn4TF7fGiParPvZuVdzM0H0UGlmc0KGpZYJlBGkL-xq0ooPGErY0gl9iF9C7Il5jfFApcYHfypL06iv-6knlp7B6D7HfBhANc=@emersion.fr>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <02d5cdbd-44e4-645e-5c91-b2687c91c194@tronnes.org>
Date: Sat, 23 Jan 2021 12:46:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <-aBHMpNW0jmn4TF7fGiParPvZuVdzM0H0UGlmc0KGpZYJlBGkL-xq0ooPGErY0gl9iF9C7Il5jfFApcYHfypL06iv-6knlp7B6D7HfBhANc=@emersion.fr>
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
Cc: hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org, th020394@gmail.com,
 lkundrak@v3.sk, pontus.fuchs@gmail.com, peter@stuge.se
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 21.01.2021 11.20, skrev Simon Ser:
> On Thursday, January 21st, 2021 at 10:59 AM, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> 
>> Well, I'd strongly ask to not call it "generic", because it isn't. We
>> have other USB drivers and anyone can make a USB display with these
>> protocols as well. That doesn't make them generic. A USB-standardized
>> protocol would be generic. Maybe call it custom, or home-made.

I agree that Generic probably isn't the best term to use here. Naming
stuff is hard. Maybe: Open USB Display Protocol - oudp?

> 
> Maybe rename it to "GUD USB Display driver"? :P
> 

Oh that's a recursive acronym :-) That would save me all the work of
renaming. I think I'll go with that, thanks.

Noralf.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
