Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FB34101A4
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 01:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326E16EE9C;
	Fri, 17 Sep 2021 23:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77216EE98;
 Fri, 17 Sep 2021 23:17:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id AAB5C2B00381;
 Fri, 17 Sep 2021 19:17:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 17 Sep 2021 19:17:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=date
 :from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=IGsVP4ZteAEr9xLEQV5uB/tVbZV
 zzsq4OBU4Z1IsijE=; b=ahuPRI2ir8VYkdt2zhvFA698iOyahHGujH1qVcfUL79
 NfbOKL4dS3mx19SjNEDdjbo2klBfT3hayxZNi1JK6LpronosHIzeJa8qmLHk35co
 gE4my/8oWVUINa0e0/ThD6Y5zNLvXHPQnfzRWk4vvJinnDVgIbqE2FdAS+fbz38e
 mad5TXe9hsJ7oiL9kwbC5CBGRML2QEtuM0kzZP33J/RW5RScmGkwjfuonLBAAwj7
 hSplQ7ssXbbLd2QXqnHG3PKRF28u6wuE0tSxc2/F39Aa8JuaBWNclD8qG2o6kVgf
 Rxbf09V9lVAa4kPzfQrgoMakMNhvCPDy43M2hWoadDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=IGsVP4
 ZteAEr9xLEQV5uB/tVbZVzzsq4OBU4Z1IsijE=; b=GvkSHwukXjsuSoWvpmRGh5
 vEMdeV+XKA+/JTADNOsG07QqGwzCaP3aEQI9zrjtQT4WWbRnDmGgxT1KK7WOievF
 DtXA6UHX/fq7cUcCNcCRcug1T/U0qYYbZ1iWVpiTJv5d1WTJlrhyAOTWCYO3Ag+z
 oj9i9+h/piPoDlLkaWyNQF9uki6E154WhbWLA/f7omyi/mQ7tDOwvhTB4dfzl09j
 uLXiEbJIcoDPcrYgPiDW2EirkOkaHsv+ss/yjxmObqOED3uLvUla+zfsNWKbb/gB
 8ENC3a7sp7zbf09GA+0v7ebG9QRTcuUC+TqYS40serjzoUtTgxY2y6eNFLpWbVkw
 ==
X-ME-Sender: <xms:8iFFYXMO_zQQgD16oxbjbtShEjJAcDBAsKp_RAAWasAWT8nh6LvD0Q>
 <xme:8iFFYR-VjguZB1XsDUXhLpDDFmzLrelFL2k7aTsB-OGNSO7JqnNvrq8QriO1E65kD
 4XTEPR_XlUbHgw-BQ>
X-ME-Received: <xmr:8iFFYWSwo1d-jxo902FJTfyoVe0MLl-AzQ_P0KIOgMplSv-Q3VQF0EmLw2VBYnaJMu2OQ2JX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehjedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpefhvghrnhgr
 nhguohcutfgrmhhoshcuoehgrhgvvghnfhhoohesuhelvddrvghuqeenucggtffrrghtth
 gvrhhnpedvjeeifeelhfetiefhhfdthfefkefhhfeutdetvdfgvefgveefheffgfekjeef
 heenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrh
 gvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:8iFFYbteP_ogjih9hbd_SFpKp1y7PfGdW8xJuqpq1y4G9RNC6lmz8w>
 <xmx:8iFFYfcbvzZqNZNeh73V4LyzP5tP0A_hIJF4U_SIA9_9eX9lAPpx6w>
 <xmx:8iFFYX1uGX3jPoazsk8MtZMVTOO38tw4vuVepVmBdO0jj3BqRm_0Yg>
 <xmx:8yFFYT6kpTIoEOo-IjQepYYNKWCqeFUVXaG9JDmibIlwyMxMnDMo76cB6Zs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Sep 2021 19:17:03 -0400 (EDT)
Date: Sat, 18 Sep 2021 01:17:01 +0200
From: Fernando Ramos <greenfoo@u92.eu>
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 14/15] drm/amd: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <YUUh7X+Ft7vKHlcT@zacax395.localdomain>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-15-greenfoo@u92.eu>
 <20210917155548.GO2515@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210917155548.GO2515@art_vandelay>
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

> > +	struct drm_modeset_acquire_ctx ctx;
> >  	int r;
> > +	int ret;
> 
> Relocate ret with r please

Done!

> > -	drm_modeset_unlock_all(dev);
> > +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> 
> You should check ret here

Done!


> >  	int r;
> > +	int ret;
> 
> Relocate ret with r

Done!


> > -	drm_modeset_unlock_all(dev);
> > +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> >  
> >  	return 0;
> 
> Return ret

Done!


> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 9b1fc54555ee..5196c1d26f87 100644
> > @@ -2661,13 +2657,18 @@ static void handle_hpd_irq(void *param)
> >  
> >  		amdgpu_dm_update_connector_after_detect(aconnector);
> >  
> > -		drm_modeset_lock_all(dev);
> > -		dm_restore_drm_connector_state(dev, connector);
> > -		drm_modeset_unlock_all(dev);
> > -
> > -		if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
> > -			drm_kms_helper_hotplug_event(dev);
> > +	} else {
> > +		goto out;
> >  	}
> > +
> > +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> > +	dm_restore_drm_connector_state(dev, connector);
> > +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> 
> Check ret here please

This function ("handle_hpd_irq") returns void. What would the appropriate way of
checking the error be?


> > @@ -2841,14 +2838,17 @@ static void handle_hpd_rx_irq(void *param)
> >  
> >  			amdgpu_dm_update_connector_after_detect(aconnector);
> >  
> > +		} else {
> > +			goto finish;
> 
> You used 'out' above and 'finish' here. It would be nice to be consistent with
> naming, I see 'out' a lot more than 'finish', so my vote would be to change this
> label to 'out'.

I originally used "out", but turns out there is already an "out" label in this
function :)

I then searched for other "go to end" labels and found "finish" being used in 
this same file.

But I can rename it to somehitng else ("out2" maybe?) to make it less confusing.

 
> > +		}
> >  
> > -			drm_modeset_lock_all(dev);
> > -			dm_restore_drm_connector_state(dev, connector);
> > -			drm_modeset_unlock_all(dev);
> > +		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> > +		dm_restore_drm_connector_state(dev, connector);
> > +		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> 
> Check ret here?

This is another irq-like function returning void.

What can we do here after having checked the error?


> > +#include <drm/drm_drv.h>
> 
> Top-level headers generally come above the driver headers. Also, now that I think
> about this a bit more, all of the new includes in this set should probably be
> for 'drm_modeset_lock.h' instead of 'drm_drv.h'.

Ok. Let me try that.


> > @@ -1259,13 +1257,16 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
> > +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> > +	dm_restore_drm_connector_state(dev, connector);
> > +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> 
> Check ret here?

This is a .write file_operations function expected to return a "size". Is it ok
for it to return an error? I guess so, right?

