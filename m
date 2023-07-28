Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF2B7675A8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 20:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D412E10E76E;
	Fri, 28 Jul 2023 18:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC58210E775
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 18:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=VUh0aFlPbE0R5Fq1OrHOqUL95X24rHdCYRyu0H18kZs=;
 b=nCioZWrNeey8vxCpdX1PS6JYetosi8C9O01ss/HH2HJyQXZSYif+EEXq9NgAX5lnt9PA5zaB1X84Z
 k3xM6obOVGislRz2M/Gu2JcHM+1Q0C2O3AV5w9puCJmFcVLRrxADec0YlHAi45Q8VpsSY7CdLKY+cN
 OaB+/IUMss5pZ3YeVozbedZ0vdXKwm+VudzaZhSSeBAwuxaCvEgACUFad4qD7EoFj/Cyfjm951Xcj/
 cOnDJ+TbfS8IrJiw/cYE+i+eagFKsWC0gPGKxp/Eiedcsg7qzVn4IoYMAFosU21ToLsp5YWa6YQfcd
 VSyuvwb7cX/TTAjNGmbaT5AveVet4hQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=VUh0aFlPbE0R5Fq1OrHOqUL95X24rHdCYRyu0H18kZs=;
 b=kxR6wyzaXh0paaidtMnBto7pO+DGTJZUEWWvVTg8x1oYY2WafA14eiAr3Hh13dnzpbSCA4Lkqj0Oh
 e0DOECCAw==
X-HalOne-ID: 082225de-2d76-11ee-8c15-592bb1efe9dc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id 082225de-2d76-11ee-8c15-592bb1efe9dc;
 Fri, 28 Jul 2023 18:39:08 +0000 (UTC)
Date: Fri, 28 Jul 2023 20:39:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/47] fbdev: Use I/O helpers
Message-ID: <20230728183906.GB1144760@ravnborg.org>
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

Did you miss sm750 or was it left out on purpose?
As it hide in staging it is easy to miss.

	Sam
