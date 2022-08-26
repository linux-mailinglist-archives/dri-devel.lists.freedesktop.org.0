Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D3F5A2A58
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 17:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68DE10E91E;
	Fri, 26 Aug 2022 15:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8680E10E91E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=DlyS9VMnUfX9bNLQ5BpOs4s+ujcLmR2TQssftpfhc8Q=;
 b=PPWRpBYAqKk7cjGkCUc7S3bDcq78KGoC+3koxw2vkvwSXsJ0l5TXvGyF/icyJyias9/MTinTl8aXX
 f11S06pFUNBmPrmkcIgO0DGqokrrgXnrNe60FPuIaTbuwh+SGxL752dAD+ISJhGSp+w6YWGTTPGrJ3
 RMLDOMQRGz4ZzwVgSBQSyav+pXspoy5d62/Qk+rPAmQfUEQx/wx1AU920esIYa7tgpPvqJGz0lQbiC
 oto3yF0KKxZ2AeFRp3qu/V3pYaJ79yMi/yi/XQUloA7ayS41xtx0RF0bVBaLNwDfz4crfe2NgdNVzw
 sQVyhIet/J7eizBS0dBfMFwxJJTL/ew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=DlyS9VMnUfX9bNLQ5BpOs4s+ujcLmR2TQssftpfhc8Q=;
 b=BDs7DWpeHdXfb/0cXVwc2hSsWJ2xlt8VHvUo92SSMGZ2RWAS+qwl97sMfKASg93BCBhpv9jOZl+eB
 mffmrImBw==
X-HalOne-Cookie: 79518cc8cf24dc933d0f452f0011c6eec0732090
X-HalOne-ID: da399367-2550-11ed-a920-d0431ea8a290
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id da399367-2550-11ed-a920-d0431ea8a290;
 Fri, 26 Aug 2022 15:07:50 +0000 (UTC)
Date: Fri, 26 Aug 2022 17:07:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] MAINTAINERS: Add myself as a reviewer for panel-edp.c
Message-ID: <YwjhxQjiJeQ0u5rh@ravnborg.org>
References: <20220822105340.1.I66a9a5577f9b0af66492ef13c47bc78ed85e5d6b@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220822105340.1.I66a9a5577f9b0af66492ef13c47bc78ed85e5d6b@changeid>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 22, 2022 at 10:53:59AM -0700, Douglas Anderson wrote:
> panel-edp changes go through the drm-misc tree (as per the "DRM PANEL
> DRIVERS" entry in MAINTAINERS), but ever since splitting panel-edp out
> of panel-simple I've been trying to keep a close eye on it. Make that
> official by listing me as a reviewer.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> 
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0f9366144d31..fc62434f693f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6343,6 +6343,11 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
>  F:	drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
>  
> +DRM DRIVER FOR GENERIC EDP PANELS
> +R:	Douglas Anderson <dianders@chromium.org>
> +F:	Documentation/devicetree/bindings/display/panel/panel-edp.yaml
> +F:	drivers/gpu/drm/panel/panel-edp.c
> +
>  DRM DRIVER FOR GENERIC USB DISPLAY
>  M:	Noralf Trønnes <noralf@tronnes.org>
>  S:	Maintained
> -- 
> 2.37.2.609.g9ff673ca1a-goog
