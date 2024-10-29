Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2159B577B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 00:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3110310E3CE;
	Tue, 29 Oct 2024 23:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="kGhLa/it";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0823210E3CE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 23:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=dVXmpPydpCBDKRSRi23AjHI0LcnEE/ZcNFXMhp9UcJY=; b=kGhLa/itrt4XfnPp
 fpe8Y96xjiq0Ekymx3ldS0oLhGbJ2ruuIZQu5OIydCOOr3iUY1eue6M3zzQODSswoyRSAJJllijYI
 4vqa6O8dK20s58G8NfHYY+rEicKrotxU1HHSw69u0ac8CNB3Lw2iEecuhQNkzy9yGfnle+QcxigzJ
 IcKQXVia41wKmCtSO9TeurX41fXe4NqdbRKRROnlzqBkOt50naaS75uWNpYynJ8rwEd2xdOs4a+W6
 Iba+uJqPMpprGnF0h5pPj0doom8QlRVunoLtrVLaVgkBnI/Q67FRI+Y33cjxwxwQO6vljwvOtid/b
 CnbLf1NAaE2wMl2n9Q==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1t5vwV-00EMRW-3D;
 Tue, 29 Oct 2024 23:48:08 +0000
Date: Tue, 29 Oct 2024 23:48:07 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/client: Remove unused drm_client_modeset_check
Message-ID: <ZyF0Nz89DpjdaQw9@gallifrey>
References: <20241022232934.238124-1-linux@treblig.org>
 <20241022232934.238124-6-linux@treblig.org>
 <zvhtltfbu6dpwri7yuwwrpnno6g2hu7tv2q7ua73epfj6gi5e6@x2snh7otbalb>
 <Zx-XK7XTJLOpzpvT@gallifrey>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <Zx-XK7XTJLOpzpvT@gallifrey>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 23:47:40 up 174 days, 11:01,  1 user,  load average: 0.16, 0.05, 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* Dr. David Alan Gilbert (linux@treblig.org) wrote:
> * Dmitry Baryshkov (dmitry.baryshkov@linaro.org) wrote:
> > On Wed, Oct 23, 2024 at 12:29:34AM +0100, linux@treblig.org wrote:
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > > drm_client_modeset_check() was explicitly added in 2020 by
> > > commit 64593f2a6fc9 ("drm/client: Add drm_client_modeset_check()")
> > > but has never been used.
> > > 
> > > Remove it.
> > 
> > If you are removing it, it makes more sense to revert the mentioned
> > commit completely, dropping the third argument of
> > drm_client_modeset_commit_atomic().
> 
> Sure, I can look at that; and resend this series also without 4/5 which
> people still wanted.
> What about 3/5 - that's the only one that's not reviewed either way?

I've just sent the v2 with this as a revert and the contentious pair dropped.

Dave

> Dave
> 
> > > 
> > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > ---
> > >  drivers/gpu/drm/drm_client_modeset.c | 24 ------------------------
> > >  include/drm/drm_client.h             |  1 -
> > >  2 files changed, 25 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> > > index cee5eafbfb81..69e1ce4d18cd 100644
> > > --- a/drivers/gpu/drm/drm_client_modeset.c
> > > +++ b/drivers/gpu/drm/drm_client_modeset.c
> > > @@ -1126,30 +1126,6 @@ static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
> > >  	return ret;
> > >  }
> > >  
> > > -/**
> > > - * drm_client_modeset_check() - Check modeset configuration
> > > - * @client: DRM client
> > > - *
> > > - * Check modeset configuration.
> > > - *
> > > - * Returns:
> > > - * Zero on success or negative error code on failure.
> > > - */
> > > -int drm_client_modeset_check(struct drm_client_dev *client)
> > > -{
> > > -	int ret;
> > > -
> > > -	if (!drm_drv_uses_atomic_modeset(client->dev))
> > > -		return 0;
> > > -
> > > -	mutex_lock(&client->modeset_mutex);
> > > -	ret = drm_client_modeset_commit_atomic(client, true, true);
> > > -	mutex_unlock(&client->modeset_mutex);
> > > -
> > > -	return ret;
> > > -}
> > > -EXPORT_SYMBOL(drm_client_modeset_check);
> > > -
> > >  /**
> > >   * drm_client_modeset_commit_locked() - Force commit CRTC configuration
> > >   * @client: DRM client
> > > diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> > > index 560aae47e06d..e1fd32adb3e9 100644
> > > --- a/include/drm/drm_client.h
> > > +++ b/include/drm/drm_client.h
> > > @@ -176,7 +176,6 @@ int drm_client_modeset_create(struct drm_client_dev *client);
> > >  void drm_client_modeset_free(struct drm_client_dev *client);
> > >  int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width, unsigned int height);
> > >  bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation);
> > > -int drm_client_modeset_check(struct drm_client_dev *client);
> > >  int drm_client_modeset_commit_locked(struct drm_client_dev *client);
> > >  int drm_client_modeset_commit(struct drm_client_dev *client);
> > >  int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
> > > -- 
> > > 2.47.0
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> > 
> -- 
>  -----Open up your eyes, open up your mind, open up your code -------   
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
