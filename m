Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB762253E6A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357106EB3E;
	Thu, 27 Aug 2020 06:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EBD6E364
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 18:47:37 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c19so2139332wmd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 11:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D57dolGTFX8v+JSJMimsZsPo892At7jmlTSKaIouZRc=;
 b=WJKXUCKu7ELeDjPAWaUvA7KJ8xKQvMDlENGdkbYjPxuoV7aNFdf/3m0u8DIsj8CVcK
 TXxuqIS1lQiQ6NBKt6MYSbv9FLUtL3PRg4UYZamlgpNBp4wvqurPMHfy7fQTFBKwG1Wr
 PYWX0mMWb2lGy//v4OHgIHwiz3N/7FbsBz6UBqKPBixjpJN2OyIlK9AAT37WqkcMH0bH
 qOa9phXnTQ0UhUTr04shNijrGcKSpzWI775t7JM80P4SP09kesYqcx/uvZAXOUVasFXY
 tDsxy64RmwUewlfbFSk+Sr0eePRstqj8/C/BwUtECATgFs2GnM8FF/iJtFlLVsHmQ9Le
 otFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D57dolGTFX8v+JSJMimsZsPo892At7jmlTSKaIouZRc=;
 b=A/RVSLgoCQnrrohdXuAOrJoAJYcILQ3qNrHXqubVhmZL7GLwcY9+63FJNBNKv4X0Q+
 1+yNIbjESGXf7GKNFYoAxSLm6vY6UyTHmedag4wJwp+LfQSOFPAzh30a/uGUMzSISJpX
 +JjCZuopnQPqJ5vENp+orgkNIkd7b7cBu/bKIrGNP8K6zf/IrKyKRQ8a9v8IdfjJRxXY
 2hzgmpOOdhyw8+FA+1G6Zv1K2TiLs12QQ4H/BBVkinVirNQABiyESBddpkn5bizKk4he
 zL0EN+h2SWqyv7DcKeYJK1YwcD8gEzzXxdOmnYi7GpgEQwAsqrpTsRUiRtiJkPMeJM6b
 fJ+Q==
X-Gm-Message-State: AOAM5314M4Sk+WL/6/vsS4rGrKetc1PygqjK4sejQhne3oS6v3II7q0p
 RP/pBm+poxClNQhGDJrIB10=
X-Google-Smtp-Source: ABdhPJw69AzzA9zfGvv9pxDBZurdq/t6BT1gbGPFx5KNuGtVDs59OvggbzjBc1e0qQkEU8q87VoV8A==
X-Received: by 2002:a7b:c197:: with SMTP id y23mr8182119wmi.48.1598467656114; 
 Wed, 26 Aug 2020 11:47:36 -0700 (PDT)
Received: from a-VirtualBox ([103.120.71.253])
 by smtp.gmail.com with ESMTPSA id b131sm7796870wmc.8.2020.08.26.11.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 11:47:35 -0700 (PDT)
Date: Wed, 26 Aug 2020 23:47:31 +0500
From: Bilal Wasim <bilalwasim676@gmail.com>
To: b.zolnierkie@samsung.com, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: fb: Correcting the location of
 FRAMEBUFFER_CONSOLE option.
Message-ID: <20200826234731.3a9d0da8@a-VirtualBox>
In-Reply-To: <20200824145155.42502-1-bilalwasim676@gmail.com>
References: <20200824145155.42502-1-bilalwasim676@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:36 +0000
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All, 

On Mon, 24 Aug 2020 19:51:55 +0500
Bilal Wasim <bilalwasim676@gmail.com> wrote:

> fbcon doc mentions FRAMEBUFFER_CONSOLE option to be under
> Device Drivers->Graphics Support->Frame buffer Devices->
> Console display driver support->Framebuffer Console Support,
> while its under Device Drivers->Graphics Support->
> Console display driver support->Framebuffer Console Support.
> 
> Correcting it in the docs.
> 
> Signed-off-by: Bilal Wasim <bilalwasim676@gmail.com>
> ---
>  Documentation/fb/fbcon.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/fb/fbcon.rst b/Documentation/fb/fbcon.rst
> index e57a3d1d085a..a7b487cba307 100644
> --- a/Documentation/fb/fbcon.rst
> +++ b/Documentation/fb/fbcon.rst
> @@ -20,8 +20,8 @@ A. Configuration
>  ================
>  
>  The framebuffer console can be enabled by using your favorite kernel
> -configuration tool.  It is under Device Drivers->Graphics
> Support->Frame -buffer Devices->Console display driver
> support->Framebuffer Console Support. +configuration tool.  It is
> under Device Drivers->Graphics Support-> +Console display driver
> support->Framebuffer Console Support. Select 'y' to compile support
> statically or 'm' for module support.  The module will be fbcon.
>  

Can this simple patch be merged? 

-Bilal
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
