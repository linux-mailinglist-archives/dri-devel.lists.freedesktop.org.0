Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5756C9B0
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 15:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B8D10E5DC;
	Sat,  9 Jul 2022 13:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806B410F740
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 13:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=NQ+Zwi2Q9/fCClfU3sukRpl2ejgpU77vzKaL4tBUEjw=;
 b=ME3WDeR29M6SMHqQOM+ikF5SvR2BBDrlmBZceQIb9nqXOTaBIKuo/N9txDvC1fFJVczTVHErFsFlf
 DQrHq3cHKLyTD1tJbdi/ziIVhqIXIlACJSNaV2j9Hqc6tNN00IP2ITGFBsWpm+4GRAEByln+2kMCzI
 0wDcySZ5JiyhRblWlVch4zqwNFkNUYbXMdbsKGneEPryB9UB7oydzyHUiF/waCCdOFHz4Lsr/VViAu
 DjS5U9qMftQ2dRU+dRQgMupbCr+oSoGbhkUKq+5iouDaTR7ZhmQhZFcM8ERw7X0Slgega+vgkOPQ3S
 Hwolkfq3FnonWooY9XzaSkGhpDWYJCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=NQ+Zwi2Q9/fCClfU3sukRpl2ejgpU77vzKaL4tBUEjw=;
 b=k3r4EraXV5lgTmKhrPZJGhkFQY+ryKHT591eXbjuSaONqK8U+EomVBs4dxYD3vXyrRfUR6n3FF5yW
 O0fXJkkAA==
X-HalOne-Cookie: 94693e2b6d199659f5373a004bd3d3b9dbebd666
X-HalOne-ID: 7082032f-ff8e-11ec-823c-d0431ea8bb10
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 7082032f-ff8e-11ec-823c-d0431ea8bb10;
 Sat, 09 Jul 2022 13:52:58 +0000 (UTC)
Date: Sat, 9 Jul 2022 15:52:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] drm/mode: Improve drm_mode_fb_cmd2 documentation
Message-ID: <YsmIOG7o5lgyJptW@ravnborg.org>
References: <536de72eab09242e1faf22fa58d91c9005d6ea51.1657113597.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <536de72eab09242e1faf22fa58d91c9005d6ea51.1657113597.git.geert@linux-m68k.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Wed, Jul 06, 2022 at 03:20:18PM +0200, Geert Uytterhoeven wrote:
> Fix various grammar mistakes in the kerneldoc comments documenting the
> drm_mode_fb_cmd2 structure:
>   - s/is/are/,
>   - s/8 bit/8-bit/.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Simon Ser <contact@emersion.fr>

Thanks, documentation updates are always good.
Applied to drm-misc (drm-misc-next).


	Sam
