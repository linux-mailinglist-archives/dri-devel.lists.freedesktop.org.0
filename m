Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5CF4C1021
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 11:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34EA10EDDB;
	Wed, 23 Feb 2022 10:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5E66710EDDB
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 10:18:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE96C1042;
 Wed, 23 Feb 2022 02:18:56 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62EF63F70D;
 Wed, 23 Feb 2022 02:18:55 -0800 (PST)
Date: Wed, 23 Feb 2022 10:18:51 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Liviu Dudau <liviu.dudau@arm.com>, carsten.haitzler@foss.arm.com
Subject: Re: [PATCH] drm/arm: arm hdlcd select DRM_GEM_CMA_HELPER
Message-ID: <20220223101851.46423dcf@donnerap.cambridge.arm.com>
In-Reply-To: <Ye/vEilz6j8gX3wu@e110455-lin.cambridge.arm.com>
References: <20220124162437.2470344-1-carsten.haitzler@foss.arm.com>
 <Ye/vEilz6j8gX3wu@e110455-lin.cambridge.arm.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Arnd Bergmann <arnd@arndb.de>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Jan 2022 12:37:38 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

Hi,

> On Mon, Jan 24, 2022 at 04:24:37PM +0000, carsten.haitzler@foss.arm.com wrote:
> > From: Carsten Haitzler <carsten.haitzler@arm.com>
> > 
> > Without DRM_GEM_CMA_HELPER HDLCD won't build. This needs to be there too.
> > 
> > Fixes: 09717af7d13d ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option")
> > 
> > Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>  
> 
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> 
> I will add Steven's reviewed-by as well when pushing it.

Did this go anywhere? I see my .config just selecting HDLCD still failing
with -rc5. Any chance this can be taken now, as this is a regression
introduced with -rc1?

Cheers,
Andre

> > ---
> >  drivers/gpu/drm/arm/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
> > index 58a242871b28..6e3f1d600541 100644
> > --- a/drivers/gpu/drm/arm/Kconfig
> > +++ b/drivers/gpu/drm/arm/Kconfig
> > @@ -6,6 +6,7 @@ config DRM_HDLCD
> >  	depends on DRM && OF && (ARM || ARM64 || COMPILE_TEST)
> >  	depends on COMMON_CLK
> >  	select DRM_KMS_HELPER
> > +	select DRM_GEM_CMA_HELPER
> >  	help
> >  	  Choose this option if you have an ARM High Definition Colour LCD
> >  	  controller.
> > -- 
> > 2.30.1
> >   
> 

