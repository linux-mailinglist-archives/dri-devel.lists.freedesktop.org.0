Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1BA56C9C0
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 15:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30869113D52;
	Sat,  9 Jul 2022 13:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF44113D52
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 13:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=qmSXrQqQPnUeVixSZnTwQsHAv2zMlHF8R2fXz2Y+WvY=;
 b=VZjAkbqiqT97vm4Mjs1Jtdo6B4pu9X3K4Iex3icvx8Kwb0NXpurwO6wYzlj2Ij8DpBaD/9s8lRZSH
 xaO95rTMAeNknAi4zH5sflAdAhrL9LK24LcfXX/SvcymMYIwBrdup+NKw2+2ydcsU27P+/rV0khH4R
 kNLGXh1UgHIdOM8/W2EFA8lq6RexLK+GUw+zTalZzEaWhsgJci2ocYDbGsYn1IiHAJ8oSdYxTY6Eag
 XtQTDm7JyIWQcFSsvljHIodTdEchRrPtChvfFbjbNAZqC3bvMKkV0w0iAGN/el2JJSURAS6WjMOcV+
 sWCav05b99IO8pw8FLCcMPhCb3CVW+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=qmSXrQqQPnUeVixSZnTwQsHAv2zMlHF8R2fXz2Y+WvY=;
 b=MaA0fkVFc3cjNqi60JC5wVUEJ0E0/EWST7AdiwaxdpUysrELN2WElO1VWCznd9Q7lLRs142GioXmo
 Dw95vlWAA==
X-HalOne-Cookie: 2d696c14001945be91871b78f5f38f0aa678b7d9
X-HalOne-ID: 61abb408-ff8f-11ec-a6c6-d0431ea8a283
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 61abb408-ff8f-11ec-a6c6-d0431ea8a283;
 Sat, 09 Jul 2022 13:59:42 +0000 (UTC)
Date: Sat, 9 Jul 2022 15:59:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] drm/fb: Improve drm_framebuffer.offsets documentation
Message-ID: <YsmJzeCfv/rXESwT@ravnborg.org>
References: <33fda13b500b39645e7363806c6e458e915b581e.1657113304.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33fda13b500b39645e7363806c6e458e915b581e.1657113304.git.geert@linux-m68k.org>
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

On Wed, Jul 06, 2022 at 03:16:18PM +0200, Geert Uytterhoeven wrote:
> Fix various spelling and grammar mistakes in the kerneldoc comments
> documenting the offsets member in the drm_framebuffer structure:
>   - s/laytou/layout/,
>   - Add missing "is",
>   - s/it/its/.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Simon Ser <contact@emersion.fr>
More doc improvements - good!
Applied to drm-misc (drm-misc-next).

	Sam
