Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BFF294B1C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 12:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610A66EAB3;
	Wed, 21 Oct 2020 10:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8FB6EAB3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 10:11:15 +0000 (UTC)
Received: from coco.lan (ip5f5ad5a8.dynamic.kabel-deutschland.de
 [95.90.213.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9994F221FC;
 Wed, 21 Oct 2020 10:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603275074;
 bh=0YoH9Rt5LN3yhFZ9E/sW8Awr/TJIiPrp0Hndf57OxeQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GxvzkVb88rfqI6o5XMTbs8V7sRLU3+68wpcIkJuaPnmiDp+R5CF6Lp3rb2D3pKdyU
 0eirdfRB/lnaXQVLI6DlL3a/CG+XkF7+qeJRcuo1uyssC6wCJLduWTWRduWHe/YYHz
 XUruXt0Uq1AXCPQdaRxJQri1Q3AJ+Sm/lsEybh3s=
Date: Wed, 21 Oct 2020 12:11:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 12/24] drm/dp: fix a kernel-doc issue at drm_edid.c
Message-ID: <20201021121108.51972144@coco.lan>
In-Reply-To: <b7c9b5ddc2bdd5d1a0bb5a000d88681ad0b6fabe.camel@redhat.com>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
 <96d648f86024535e5f7d5b0caf8ebf93c7f8eaab.1602590106.git.mchehab+huawei@kernel.org>
 <b7c9b5ddc2bdd5d1a0bb5a000d88681ad0b6fabe.camel@redhat.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lyude,

Em Tue, 13 Oct 2020 15:49:11 -0400
Lyude Paul <lyude@redhat.com> escreveu:

> wait, I think there's some confusion here. these patches have already been
> pushed

As the patch adding the warning was merged upstream at the 5.10 merge
window, the fixup one should also be added there, instead of waiting
until 5.11 ;-)

So, if OK for you, I'll send this upstream via my tree by the end of
the merge window, as our goal is that 5.10 won't have doc warnings.

Regards,
Mauro
> 
> 
> On Tue, 2020-10-13 at 14:14 +0200, Mauro Carvalho Chehab wrote:
> > The name of the argument is different, causing those warnings:
> > 
> > 	./drivers/gpu/drm/drm_edid.c:3754: warning: Function parameter or member
> > 'video_code' not described in 'drm_display_mode_from_cea_vic'
> > 	./drivers/gpu/drm/drm_edid.c:3754: warning: Excess function parameter
> > 'vic' description in 'drm_display_mode_from_cea_vic'
> > 
> > Fixes: 7af655bce275 ("drm/dp: Add drm_dp_downstream_mode()")
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index a82f37d44258..631125b46e04 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -3741,7 +3741,7 @@ drm_add_cmdb_modes(struct drm_connector *connector, u8
> > svd)
> >  /**
> >   * drm_display_mode_from_cea_vic() - return a mode for CEA VIC
> >   * @dev: DRM device
> > - * @vic: CEA VIC of the mode
> > + * @video_code: CEA VIC of the mode
> >   *
> >   * Creates a new mode matching the specified CEA VIC.
> >   *  



Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
