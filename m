Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4103450CAD6
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 15:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCDF10FFD8;
	Sat, 23 Apr 2022 13:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6522F10FFD5
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 13:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=DiK8nxAmT5CjsuqAm40aEBUJBBmqvVVGEPk3NssYP10=;
 b=YOIntkTZj1R//lKe47NzRJJXg89UyUGK1bpz517IXiiYqXzBJuDgZCS1rSQKA2hYxMzDC2ySesW67
 M4Tf3LQw8GaUWYZoZUgh8zhqM7ODmCicDYhWczQi1E77WJM86eak06HKCb3Ar1x8GG/q1XFGGF6LH5
 +4+UhmACuEObDb+4U4Fgz7v7X1ohT49GmZDj6HrOShAJTKMZX3dyGrS6nXafaAo1+TY+UuIFJWKPtR
 5EsybSbsEU3MlX2s7wcpFpOQwBlh8Jv4SN0DcaL0XMchI+L9b3+aQ4CuV77d9TMSNv2A/DmfpPa5qo
 vgbqaDnnU3fWXrbYjMPg2er3OTyqYwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=DiK8nxAmT5CjsuqAm40aEBUJBBmqvVVGEPk3NssYP10=;
 b=3FxP/bRo0OofayGaYqrhv1GXum/iei6Z5bGl9JZOETuUd36XHKGVJtTbpKQZ6yocRu6LsB6bt1ler
 vgcNxLEDw==
X-HalOne-Cookie: af45df9e17cb05a2750f22d339417b5f127d72f1
X-HalOne-ID: a1ddb960-c30c-11ec-be69-d0431ea8bb03
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a1ddb960-c30c-11ec-be69-d0431ea8bb03;
 Sat, 23 Apr 2022 13:52:36 +0000 (UTC)
Date: Sat, 23 Apr 2022 15:52:35 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Tom Rix <trix@redhat.com>
Subject: Re: [PATCH] fbcon: change fbcon_*registered_fb variables to static
Message-ID: <YmQEo6FWXOsdhiz5@ravnborg.org>
References: <20220423125618.1916005-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220423125618.1916005-1-trix@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, cssk@net-c.es,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 23, 2022 at 08:56:18AM -0400, Tom Rix wrote:
> Sparse reports these issues
> fbcon.c:106:16: warning: symbol 'fbcon_registered_fb' was not declared. Should it be static?
> fbcon.c:107:5: warning: symbol 'fbcon_num_registered_fb' was not declared. Should it be static?
> 
> These variables are only used in fbcon.c. Single file use variables should
> be static, so change their storage-class specifiers to static.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/video/fbdev/core/fbcon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index c4e91715ef00..225ac0fe0143 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -103,8 +103,8 @@ enum {
>  
>  static struct fbcon_display fb_display[MAX_NR_CONSOLES];
>  
> -struct fb_info *fbcon_registered_fb[FB_MAX];
> -int fbcon_num_registered_fb;
> +static struct fb_info *fbcon_registered_fb[FB_MAX];
> +static int fbcon_num_registered_fb;
>  
>  #define fbcon_for_each_registered_fb(i)		\
>  	for (i = 0; WARN_CONSOLE_UNLOCKED(), i < FB_MAX; i++)		\
> -- 
> 2.27.0
