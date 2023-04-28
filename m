Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971B96F18AC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 15:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9E810ED39;
	Fri, 28 Apr 2023 13:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [46.30.211.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280A810ED39
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 13:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Hja6mt7zd/g4QdMBdU1sqO6/W7qq91iso0TdUVxgpZQ=;
 b=FxfRtv4FrRk4Em92uXUdUOu+IzM4DLCaYbYTGf0HmoGt55Bw+sEDY7TE7lz25gy/jeDTUEKsXBIZ/
 6+/zEuHGM6MqT00hmyBIg4svWcWHFrXwM8Ddrqtbaonvw9PdH+q0F8N7NYRpiffg+snlE1k52haCEP
 Q5CLkzLprcKd2tpvL5TwuLWb8MO1adRNdXCSqIA1/a3O5zHg7QtYD1c+FIlAyfLETigqdlU+VTKWGI
 FixF6eXVaBb1j4cTQTrA12WO3TjCdZOGf/zxTjk9tA4KClER8AvaYJP1R9DtG68UpLgbxbewXtHQEG
 jrGTR/pTMVQQqT50i1/ZzQ9wb/svLNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Hja6mt7zd/g4QdMBdU1sqO6/W7qq91iso0TdUVxgpZQ=;
 b=xAKiE2HHYG+XEwajJ/cdBLZ5+XTobzra1m18RoIFmhS7CdvnYyld6dy+28/utM3Xy/8iXqxSekCsh
 CbQ0bBPDw==
X-HalOne-ID: baf7db08-e5c4-11ed-b748-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id baf7db08-e5c4-11ed-b748-b90637070a9d;
 Fri, 28 Apr 2023 13:01:06 +0000 (UTC)
Date: Fri, 28 Apr 2023 15:01:04 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/5] ipu-v3: Include <linux/io.h>
Message-ID: <20230428130104.GB3995435@ravnborg.org>
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428092711.406-3-tzimmermann@suse.de>
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

On Fri, Apr 28, 2023 at 11:27:08AM +0200, Thomas Zimmermann wrote:
> The code uses readl() and writel(). Include the header file to
> get the declarations.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/ipu-v3/ipu-prv.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/ipu-v3/ipu-prv.h b/drivers/gpu/ipu-v3/ipu-prv.h
> index 291ac1bab66d..d4621b1ea7f1 100644
> --- a/drivers/gpu/ipu-v3/ipu-prv.h
> +++ b/drivers/gpu/ipu-v3/ipu-prv.h
> @@ -8,6 +8,7 @@
>  
>  struct ipu_soc;
>  
> +#include <linux/io.h>
>  #include <linux/types.h>
>  #include <linux/device.h>
>  #include <linux/clk.h>
> -- 
> 2.40.0
