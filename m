Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269D296772E
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 17:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BF289D8D;
	Sun,  1 Sep 2024 15:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CtwVuYsR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A37D89D8D
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 15:18:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C785F51B;
 Sun,  1 Sep 2024 17:17:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1725203826;
 bh=wwddOlMawN+jDA0/PzDOzw41cjOxFeVpe04rgDXwZHE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CtwVuYsR8BPW47fJK6FPqZdzCOxeaPxEBRybyBx6M0y96lqy5vx6LWGTCCOnj01vo
 LE6rTCqqVihUnMltd9NbRRtKuEcB+qZvuCayJmB/F1RYRaGHXRLqqUjG3XjV4PyeCl
 dILkIx0guL5MBZ6Nfhh2i39oUAzDM3nN4qrnGmGI=
Date: Sun, 1 Sep 2024 18:17:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yu-Chun Lin <eleanor15x@gmail.com>
Cc: thierry.reding@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 visitorckw@gmail.com
Subject: Re: [PATCH] docs: devicetree: Fix typo in lvds.yaml
Message-ID: <20240901151745.GB6713@pendragon.ideasonboard.com>
References: <20240901133046.962263-1-eleanor15x@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240901133046.962263-1-eleanor15x@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yu-Chun,

Thank you for the patch.

On Sun, Sep 01, 2024 at 09:30:46PM +0800, Yu-Chun Lin wrote:
> Corrected the spelling in the description of LVDS Display Common
> Properties.
> 
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/lvds.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/lvds.yaml b/Documentation/devicetree/bindings/display/lvds.yaml
> index 224db4932011..b74efbea3be2 100644
> --- a/Documentation/devicetree/bindings/display/lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/lvds.yaml
> @@ -16,7 +16,7 @@ maintainers:
>  description:
>    This binding extends the data mapping defined in lvds-data-mapping.yaml.
>    It supports reversing the bit order on the formats defined there in order
> -  to accomodate for even more specialized data formats, since a variety of
> +  to accommodate for even more specialized data formats, since a variety of
>    data formats and layouts is used to drive LVDS displays.
>  
>  properties:

-- 
Regards,

Laurent Pinchart
