Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5FF4C1B1C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 19:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4ED10EA8B;
	Wed, 23 Feb 2022 18:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 475 seconds by postgrey-1.36 at gabe;
 Wed, 23 Feb 2022 18:46:24 UTC
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7357410EA87
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 18:46:24 +0000 (UTC)
Received: from zn.tnic (dslb-088-067-221-104.088.067.pools.vodafone-ip.de
 [88.67.221.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C28F51EC0494;
 Wed, 23 Feb 2022 19:38:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1645641499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=Ig+HgNxWjJgXASHFx0Eo0Cv/xBwjLhIfqzkOKH8oZL8=;
 b=aoa6o+GB573FOU1Yz2rwNgdk0B5PctOgEt+lND/OrCeZGM0bc2h87e4u0VbtYxby21P+G2
 mPGCDoGgpSUdOWg9IjT/QwPlvF8BcvdxjYN8UwNPlm7gdG9APhG23w4ApzoxGvEAZ8wEO3
 5gEdFVswsXkZzbMKgiYvsBy4NwHfQ3s=
Date: Wed, 23 Feb 2022 19:38:23 +0100
From: Borislav Petkov <bp@alien8.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3] simplefb: Enable boot time VESA graphic mode selection.
Message-ID: <YhZ/H9Ra+w7JC32g@zn.tnic>
References: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
 <20220218160436.23211-1-msuchanek@suse.de>
 <49f0642d-7078-8fba-c851-6e33658180ff@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <49f0642d-7078-8fba-c851-6e33658180ff@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, David Herrmann <dh.herrmann@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Michal Suchanek <msuchanek@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Martin Mares <mj@ucw.cz>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-video@atrey.karlin.mff.cuni.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 10:51:35AM +0100, Thomas Zimmermann wrote:
> Thanks for the patch. I'll wait a bit for additional reviews before merging
> it.

for the x86 bits:

Acked-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
