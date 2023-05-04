Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E38F56F6F29
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 17:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7E910E16D;
	Thu,  4 May 2023 15:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05AF310E4DA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 15:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=9OJXCjk1pQ5JPAczTbrYybaJ9yabhk+psqf49vWpZU0=;
 b=qvdNlqsBf3EoYvHRBBEpiAYN3JzfiOdN6jSoMib4fSHXY6tHmBqjeEye3YBBnQuOKlWgJbulyd9UO
 jXb4IaCN8kX7dVnV05joCTZniXryC4lrp6RnU2s7jkJl8wdsPp6Q9OZJRYK7vfSOzXS4rmS40/eTZk
 Oj8wFMqUI5Uf91JBzDLM6lwl/AI9nYaZL5MM0+ScxSnZS/IO/f0jfqapazU7a2UnCPXICl2bDXeIun
 cpFA4+5zlWP+xxx7duxSDE9p2dLtJQt9zPGpmx+m59A/DqeQkbQKqGGVNVvHnMEXAS+E65XGv8vXxP
 Xw2bDTTmGVCCvcUOan+7GsoDw8Ub2IQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=9OJXCjk1pQ5JPAczTbrYybaJ9yabhk+psqf49vWpZU0=;
 b=A41ejzmStbYNhncUAuSBS4onolrQNPxZTtME0No712Sqv3KLgK2LD8qZyKm6pcZPa7vmoiglPmcsF
 +lL4ka5AQ==
X-HalOne-ID: 87f70a6c-ea91-11ed-bbbe-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 87f70a6c-ea91-11ed-bbbe-99461c6a3fe8;
 Thu, 04 May 2023 15:37:12 +0000 (UTC)
Date: Thu, 4 May 2023 17:37:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 4/6] fbdev: Include <linux/fb.h> instead of <asm/fb.h>
Message-ID: <20230504153710.GA518522@ravnborg.org>
References: <20230504074539.8181-1-tzimmermann@suse.de>
 <20230504074539.8181-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504074539.8181-5-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, arnd@arndb.de,
 deller@gmx.de, chenhuacai@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James.Bottomley@hansenpartnership.com, linux-m68k@lists.linux-m68k.org,
 geert@linux-m68k.org, linux-parisc@vger.kernel.org, vgupta@kernel.org,
 sparclinux@vger.kernel.org, kernel@xen0n.name,
 linux-snps-arc@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, May 04, 2023 at 09:45:37AM +0200, Thomas Zimmermann wrote:
> Replace include statements for <asm/fb.h> with <linux/fb.h>. Fixes
> the coding style: if a header is available in asm/ and linux/, it
> is preferable to include the header from linux/. This only affects
> a few source files, most of which already include <linux/fb.h>.
> 
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks,
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
