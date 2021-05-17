Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7525383B37
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 19:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36AEB6EA18;
	Mon, 17 May 2021 17:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F476E372
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 17:25:07 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id z17so7248865wrq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 10:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WT4MO0jfb54/WwmN/o06DVse7nmY0vnuEJqC7jhWbgY=;
 b=kDh0i0RSjJCdC2vB0N6+pzaZSM3eQ/hdWObxn+4ecg+lePXViZDds78Ea+UZ7VPN2V
 REfn5lW+8YmVNrVbUTA0aKljo6D0v/aP1IkDMRRXkzfHyIxUy6gw173TAkFBPczBhqG1
 9+kUNQbnloMpyVAIIY0sC42uuKfuJGQTMtH3lUzh3OPpt9pthbKXIddzEMnl3yXlIsNZ
 /reI3tAP1D8ir2DDSw0yakWAr8TT/I8nzXyaxGymwV7RoIudW/rQRIgCblR2vK9JQq87
 C/oscRH828FMbZCWdUtMg6uyA3i8VjK+pa3e7l4QV2Vq0VKann4/HeY50Y8xIuAEwcHe
 QsRQ==
X-Gm-Message-State: AOAM5327eksUgzOq5+wLA0bdt4XG98s6vw0npcVhdZzPCeVARhLYgdJH
 iTGDwwq6WlF2D5klBZsReL8=
X-Google-Smtp-Source: ABdhPJzYSsHmPrZIBMT2msycq5e5zD+9oKEFqKX3aOgJHZ/eY6DIPzBHqZSfoHPEj4NKpI1A/MLQYQ==
X-Received: by 2002:adf:e384:: with SMTP id e4mr869351wrm.347.1621272305940;
 Mon, 17 May 2021 10:25:05 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z18sm17398946wrh.16.2021.05.17.10.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:25:05 -0700 (PDT)
Date: Mon, 17 May 2021 17:25:03 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Deepak Rawat <drawat.floss@gmail.com>
Subject: Re: [PATCH v4 3/3] MAINTAINERS: Add maintainer for hyperv video device
Message-ID: <20210517172503.ytpuucwphtwhcgsi@liuwe-devbox-debian-v2>
References: <20210517115922.8033-1-drawat.floss@gmail.com>
 <20210517115922.8033-3-drawat.floss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517115922.8033-3-drawat.floss@gmail.com>
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
Cc: linux-hyperv@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 04:59:22AM -0700, Deepak Rawat wrote:
> Maintainer for hyperv synthetic video device.
> 
> Signed-off-by: Deepak Rawat <drawat.floss@gmail.com>
> ---
>  MAINTAINERS | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd7aff0c120f..261342551406 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6077,6 +6077,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/hisilicon/
>  F:	drivers/gpu/drm/hisilicon/
>  
> +DRM DRIVER FOR HYPERV SYNTHETIC VIDEO DEVICE
> +M:	Deepak Rawat <drawat.floss@gmail.com>
> +L:	linux-hyperv@vger.kernel.org
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	drivers/gpu/drm/hyperv
> +
>  DRM DRIVERS FOR LIMA
>  M:	Qiang Yu <yuq825@gmail.com>
>  L:	dri-devel@lists.freedesktop.org
> @@ -6223,6 +6231,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/xlnx/
>  F:	drivers/gpu/drm/xlnx/
>  
> +DRM DRIVERS FOR ZTE ZX
> +M:	Shawn Guo <shawnguo@kernel.org>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/zte,vou.txt
> +F:	drivers/gpu/drm/zte/
> +

What is the section about? Is this a mistake?

Wei.
