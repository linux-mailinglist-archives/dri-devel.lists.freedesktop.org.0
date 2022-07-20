Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB5957B92F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1757C8AE6C;
	Wed, 20 Jul 2022 15:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5ED8AE6C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=EFA/JkuWOB1qS4kM55LEROfxdMp2a+AIgtyJYibfELM=;
 b=YTfBQ73zahuPoZtkfki4lVnoSxk7mrNLvOrHxYaGySzUgIuHEEdBk/jNfId23CuV7vHZbtFhSW0ZH
 FrU36wpSMv5G6YdZepKJP9BwK8jDR7wHmtnwZOLvBSAL1Iy03C4OsxuxQJ1K434JTOjpcWghPBwsGZ
 AFCdlPaFbhNKIaVlE38iYVoFci0WFgAIHJ5jZyotHQ1rnBMIET6pzUjIvbwRirt5GFV0ERdmZ+d4VF
 kvLYCZBspo4MST1DjlPmpIdkw7KuCx2g8RZgLtxyUUZ+bYW0HD7RuoGAQLt7LMydKD78qL88dVIdWK
 aghsZowdPnSDmMLwr2bUkMtprnuAcGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=EFA/JkuWOB1qS4kM55LEROfxdMp2a+AIgtyJYibfELM=;
 b=uTQiksKBDcwGeYLBTmNQlT0DMmBHRrO4I3buB4rpb4ldienglsUuaRzxNXmkLCK0KbLbtfAE+dGjq
 60i6gSNBg==
X-HalOne-Cookie: 461ceae8f5fbed8298ff35f9ec94319932da099f
X-HalOne-ID: c7216ffa-083d-11ed-a918-d0431ea8a290
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id c7216ffa-083d-11ed-a918-d0431ea8a290;
 Wed, 20 Jul 2022 15:08:14 +0000 (UTC)
Date: Wed, 20 Jul 2022 17:08:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/7] drm: Clean up plane helpers
Message-ID: <YtgaXaN9cc/9Q98z@ravnborg.org>
References: <20220720083058.15371-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720083058.15371-1-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, alison.wang@nxp.com, linux@armlinux.org.uk,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, Jul 20, 2022 at 10:30:51AM +0200, Thomas Zimmermann wrote:
> The plane helpers are included by dozens of files without any need. Only
> a hand full of source files need anything from drm_plane_helper.h.
> 
> Untangle everything and tidy up the code a bit. The patches were built
> on x64-64, aarch64 and arm without issues.

Build tested the final result here on a few more archs without any issues.
I like the removal of the include statements and the simpler header
file.

I did not really get what is gained by pushing out drm_plane_funcs
to the drivers but trust this is in the end a better solution.

Series is:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
