Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E7474031A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 20:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8631D10E2F8;
	Tue, 27 Jun 2023 18:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0519110E2F8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 18:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kcOM4/Wbu+ytgUTsuXGCBTLUq9C4K7TLK3Sk/wcjAaA=;
 b=q/BW6qwUmG/DBoBAJH9ZLHEWeOHY+VrN7laFR4Vrd9HPwW1zykNYORqnfyd44r3Q+ncDrbE7icGEI
 d1uWAUaw7t6bisk8FY8eLYbrWOHCMGZwOeSwvsMt+djmSeKXHRNJ+N46bzWTix0KUsHg2prPs0HmqZ
 2d7Dj6pxKVAY3fMXvUqVGL22pGb5Kbr1ZLrqvamwyHnAxA0wXid3D/i8RtUUsAHwwT96+30anx4a8a
 jz6hnQe04klv35aU215cRM5Xq7WhjUuNzBbK/QKJ6AIpQ1OVvrQgU/PnB7zHPFflHRzG3JLRPHcCRu
 osRLDwr8BOrwNIOW/DMk5G4dnIXn4pQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kcOM4/Wbu+ytgUTsuXGCBTLUq9C4K7TLK3Sk/wcjAaA=;
 b=70X7t5hJxYRaTpiZRm6uZhYE0omt4ewkVRUZ+hLcIxuNWRDPj+glykMqi6lkFgWD/z+G5DAF5UTAV
 jNAWiGiDg==
X-HalOne-ID: 5babceb7-1517-11ee-92ec-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 5babceb7-1517-11ee-92ec-b90637070a9d;
 Tue, 27 Jun 2023 18:20:57 +0000 (UTC)
Date: Tue, 27 Jun 2023 20:20:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] arch/sparc: Add module license and description for fbdev
 helpers
Message-ID: <20230627182056.GA110138@ravnborg.org>
References: <20230627145843.31794-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627145843.31794-1-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, arnd@arndb.de,
 deller@gmx.de, dri-devel@lists.freedesktop.org, sparclinux@vger.kernel.org,
 davem@davemloft.net, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 27, 2023 at 04:58:20PM +0200, Thomas Zimmermann wrote:
> Add MODULE_LICENSE() and MODULE_DESCRIPTION() for fbdev helpers
> on sparc. Fixes the following error:
> 
> ERROR: modpost: missing MODULE_LICENSE() in arch/sparc/video/fbdev.o
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/dri-devel/c525adc9-6623-4660-8718-e0c9311563b8@roeck-us.net/
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 4eec0b3048fc ("arch/sparc: Implement fb_is_primary_device() in source file")
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: sparclinux@vger.kernel.org
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
