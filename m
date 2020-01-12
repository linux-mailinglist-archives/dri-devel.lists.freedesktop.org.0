Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA687138874
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 23:43:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F5189FD9;
	Sun, 12 Jan 2020 22:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4CC89FD9
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2020 22:43:36 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id z16so3953831pfk.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2020 14:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+ShsEjNhpOzPOvXgPh9E0OrWn1BweWqy02bpDa5vEPM=;
 b=SjC/0IH9J0r3xXXN27JRYLGa2ug+ywUFhtcLIi5rbf1ym/mrKNUDRdqjp8eBe+bUu/
 Iq/Fy3naihP7QpdenrWV1hRqFlXEHeErCexkeKAhqGpbFC04/m661z/ZOl9L/UwbzTQ4
 ifymvoQW7Ge+le3sHMhHGP4G/a/jgr67JXEqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+ShsEjNhpOzPOvXgPh9E0OrWn1BweWqy02bpDa5vEPM=;
 b=PhdtaTKWcf4TdIIRxYBF4GRaf/zXGB7T8qaGpmNERo798mXktq6cyuSfRp957uXNmv
 lcfmfemRSH0Wl20cWGY0tZcz2LTvV7Og7mcC9ZhpLB4ZOjSKRATp7Hf/rBMyOkCFktzA
 KwbXmqze01WxMR8H6wFVoVmuIDlGfLBqReB2YcGswz3zv3nP/qC1GO02fM95nfprb+L+
 Vu9+T63Sq9bIMS/ttTfryIpt3sGBFufPQCqEhe2oR0WHyIyucK/nqNVkAI3ETPVbY9bd
 UgyQOLqaya94kBC5fDOFItDSG4EzM9ErgOWtQjLN69A88yKth6F2xU0dcIL8/i45/6wz
 NZpQ==
X-Gm-Message-State: APjAAAVB2NHlIqFRhVy7yUfXtvqt8YrY+5BvjbAiLmb6sRK/jMvVL2By
 3LNG34habbORFac5fflkysM/RA==
X-Google-Smtp-Source: APXvYqyv2IeFysbjNVlQn+TlwieQWIr7YHfIEe6RktGt9ZCJtvHpb4tppM3O/dW6K/TTA/I5KZyS4g==
X-Received: by 2002:a63:3e03:: with SMTP id l3mr17916506pga.118.1578869016123; 
 Sun, 12 Jan 2020 14:43:36 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([138.44.248.126])
 by smtp.gmail.com with ESMTPSA id w20sm11285607pfi.86.2020.01.12.14.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2020 14:43:35 -0800 (PST)
Date: Sun, 12 Jan 2020 23:43:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] drm/Kconfig: add missing 'depends on DRM' for DRM_DP_CEC
Message-ID: <20200112224315.GA5340@dvetter-linux.ger.corp.intel.com>
References: <489bdaae-9b05-2d70-12e1-4fda7899dfc1@xs4all.nl>
 <bbbef09d-6c90-75ba-e480-28365474b1a5@xs4all.nl>
 <20200108174236.GH43062@phenom.ffwll.local>
 <008645fc-29e0-6cf1-5871-dc01898449f0@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <008645fc-29e0-6cf1-5871-dc01898449f0@xs4all.nl>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 09, 2020 at 10:11:48AM +0100, Hans Verkuil wrote:
> On 1/8/20 6:42 PM, Daniel Vetter wrote:
> > On Wed, Jan 08, 2020 at 01:08:47PM +0100, Hans Verkuil wrote:
> >> On 12/6/19 12:26 PM, Hans Verkuil wrote:
> >>> Add a missing 'depends on DRM' for the DRM_DP_CEC config
> >>> option. Without that enabling DRM_DP_CEC will force CEC_CORE
> >>> to =y instead of =m if DRM=m as well.
> >>>
> >>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>
> >> Daniel, can you review this? It's annoying that the cec core is
> >> compiled as part of the kernel when it can just be a module.
> > 
> > Why did we even make this optional? Really worth it to compile out 4
> > functions and some change?
> 
> It's not about those few functions, it's because this enables the CEC
> framework as well (drivers/media/cec).
> 
> If CEC is not needed, then disabling this saves a lot more code than the
> few functions in drm_dp_cec.c.
> 
> CEC is an optional HDMI feature, so CEC support for HDMI input/output
> drivers is optional as well in the kernel config.

The trouble is that once you have multiple layers of such automatically
optional pieces of code, Kconfig keels over: select isn't recursive. So if
you want to make CEC stuff optional, just compile the DRM stuff only if
both CEC and DRM are enabled, and drivers can then select the overall CEC
stuff. Or alternatively have dummy functions at the CEC library, and just
always compile the DRM CEC stuff in.

You could also fix Kconfig, if you have a life or two to spare :-)

Cheers, Daniel

> 
> Regards,
> 
> 	Hans
> 
> > 
> > Anyway the one you really want here is CONFIG_DRM_KMS_HELPER, but that is
> > a selected variable, and you can't mix select and depends on because that
> > breaks Kconfig in hilarious ways. Or so I thought, but other public
> > symbols like this (e.g. DRM_FBDEV_EMULATION) do the same trick. So I guess
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > But really, is all this complexity?
> > -Daniel
> > 
> >>
> >> Regards,
> >>
> >> 	Hans
> >>
> >>> ---
> >>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> >>> index 1168351267fd..e8e478d6da9c 100644
> >>> --- a/drivers/gpu/drm/Kconfig
> >>> +++ b/drivers/gpu/drm/Kconfig
> >>> @@ -163,6 +163,7 @@ config DRM_LOAD_EDID_FIRMWARE
> >>>
> >>>  config DRM_DP_CEC
> >>>  	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
> >>> +	depends on DRM
> >>>  	select CEC_CORE
> >>>  	help
> >>>  	  Choose this option if you want to enable HDMI CEC support for
> >>>
> >>
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
