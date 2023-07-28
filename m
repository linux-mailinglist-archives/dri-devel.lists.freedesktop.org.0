Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1807767586
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 20:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE69210E060;
	Fri, 28 Jul 2023 18:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5725910E76E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 18:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=yhlqzaoSJHj1oBhyHOJO58FgrwVTmfOzCSyUIFeQhEY=;
 b=PEcPzlAsab2q5HAQN/yHKrzMYVZOsRy7MUZatuyZWA7uM3kwzi/V0IIXBTqrf8Z4FmZHFIt/HybiZ
 sbbJEqg+zqaWndIpRGziGwRAdnvYp2UskSeh4js0iHCY3oRw+McgFfjI0y7oLnQ5gzU+wULcIwUrBF
 R1R+aeb9KCgPKAuaXafOc0IO4JfNWyvnuuBhLD0J0hshqdj5Vvu+c4ldj/WYrartBW4EK2ktP2/lhf
 bp7IzcQFvT5d79Ly00On30yNXDukjQ+qvpzZLJdP2QU4xD5mCpGPPhj9JCV78AQSNl0UQedmdnBIp0
 WYJ6GjaRnQ7Fz9qCJEPWPwQ3KqH2t6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=yhlqzaoSJHj1oBhyHOJO58FgrwVTmfOzCSyUIFeQhEY=;
 b=y6kAh7BLK3FDXVvFJRPS8aaGvGwNkidIQo6yrUNTCXy1VTEvdvSmyPm1YcWkjEAF+PS7eF5bA8xDF
 FKUq6KgBA==
X-HalOne-ID: 8dec9b7e-2d75-11ee-9837-c5367ef0e45e
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 8dec9b7e-2d75-11ee-9837-c5367ef0e45e;
 Fri, 28 Jul 2023 18:35:43 +0000 (UTC)
Date: Fri, 28 Jul 2023 20:35:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/47] fbdev: Use I/O helpers
Message-ID: <20230728183541.GA1144760@ravnborg.org>
References: <20230728182234.10680-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728182234.10680-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, Jul 28, 2023 at 06:39:43PM +0200, Thomas Zimmermann wrote:
> Most fbdev drivers operate on I/O memory. And most of those use the
> default implementations for file I/O and console drawing. Convert all
> these low-hanging fruits to the fb_ops initializer macro and Kconfig
> token for fbdev I/O helpers.
> 
> The fbdev I/O helpers are easily grep-able. In a later patch, they can
> be left to empty values if the rsp. funtionality, such as file I/O or
> console, has been disabled.
> 
> There are no functional changes. The helpers set the defaults that
> the drivers already use.

I have browsed all patches - they all looks good.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

