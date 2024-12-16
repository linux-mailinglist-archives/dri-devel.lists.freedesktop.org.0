Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F639F3356
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 15:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FAB10E6AC;
	Mon, 16 Dec 2024 14:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="UGwLdgEV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E158010E6AA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 14:37:41 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so3413368f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 06:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1734359860; x=1734964660; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yrESZw/En081PSbiXgevMbDjSYkok7om/KLb20cYOfA=;
 b=UGwLdgEVdw44bNlDcQ/d0ma5mcfOyoLKj3MAnQ3hfMtJHk/rYnw+DNA/hofPXH1CXM
 vlaKfFigrTwWzNDZa5W0829P1Hd+gvq51vbO8O9cnmy1QxCe/mn6E1dRhuKS940YgO2P
 BNoj67wU2+ymVZxm/UFjK8sYOft5ngN54kcmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734359860; x=1734964660;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yrESZw/En081PSbiXgevMbDjSYkok7om/KLb20cYOfA=;
 b=aeVKNuW0BjcnVEUfIxO7s6xxblQpVuRqGsukRqbDn0UFgZt2+lADKULhZPDG7haifO
 +00gWaQzC1bLOGoRkTvMLfv8zDf1LOkzD/sKEaIyMU29QBWdwsYqFA8HZP7MB0GyHO3p
 e6Oc6kd8Y6RHkH5NOW1Ixu4c5DJiOJIK2uUDqS5xJMmYlbaspz0ZmjCs86D+6l6aSwDY
 D2S0q6cOA04m4B6ILLE9hmjDHL5g4wpO3Rbx381i/1oYq5uDgln3mPPI7LetZDiWiNO1
 Zs5ljWSJi6yd67M4+XOHQCilYhMhoeawodQGG+Ba7dKsLwMzvf/TQPCG3lUQjeBSipKI
 qVrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBeMKyqdm6QQ6kD0DMnnwGI7sm7aNCG0hTWFKpUc+6i/iOXixAUeGwZ4Ql/61f139dOCFKfjdHeJc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc8yElNFon/kraqaG1Hqo/3Cai6ptxMpsM85dJCKc1B08n4JpU
 NG+x1wDVKlbF/nN+YbZk2Lu5FdE5W/r3rK7CkxQ+lfnpWJkiZ+I+GF0mcqYNn/i0tNSJkUWkxkP
 IueA=
X-Gm-Gg: ASbGncso0h7eFnEPI/hoFh+wKVGhGV6eW55l3frCNGOhrFmJ8xAdMwUnU67U9RL8zJJ
 fmFzDnfREPSVvMfbAj77BJxVFL0lp/wCLK3SKs7KaA8wPmOF09WduXv63SZZUWx5jDa2wM88Mg3
 hLPmitS2dDTBT9MhuWBV3bB0FnTsHWda2c9QVfDuAumfuLlZj/oPkWDkU9baIkO4vrMSeIzgHSF
 dtPEbuvHOYQPAaJgBrCQIMB1b50Yf25GfTUWuE60pdXPTY+W1Db0M80pjSvlblCLVch
X-Google-Smtp-Source: AGHT+IHQAE1+ZiBY7NHVgVWlllGKn5NQ+5AWIWZQinPR5u/hZAOXW5icb//z2r0MiIJQq3hTfx3aUA==
X-Received: by 2002:a05:6000:2ae:b0:386:3c93:70ff with SMTP id
 ffacd0b85a97d-387887df1a0mr14788552f8f.8.1734359860319; 
 Mon, 16 Dec 2024 06:37:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801626asm8345461f8f.29.2024.12.16.06.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 06:37:39 -0800 (PST)
Date: Mon, 16 Dec 2024 15:37:38 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Imre Deak <imre.deak@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 03/11] drm/connector: Add deprication notes for
 drm_connector_register/unregister
Message-ID: <Z2A7Mgo5nE1saCVR@phenom.ffwll.local>
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-4-imre.deak@intel.com>
 <87ed2dxlcd.fsf@intel.com>
 <Z1rQ8pvfFWlj5yLl@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1rQ8pvfFWlj5yLl@ideak-desk.fi.intel.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Thu, Dec 12, 2024 at 02:02:58PM +0200, Imre Deak wrote:
> On Thu, Dec 12, 2024 at 12:10:58PM +0200, Jani Nikula wrote:
> > [...]
> > On Thu, 12 Dec 2024, Imre Deak <imre.deak@intel.com> wrote:
> > > @@ -863,9 +866,14 @@ EXPORT_SYMBOL(drm_connector_dynamic_register);
> > >   * drm_connector_unregister - unregister a connector
> > >   * @connector: the connector to unregister
> > >   *
> > > - * Unregister userspace interfaces for a connector. Only call this for
> > > - * connectors which have been registered explicitly by calling
> > > - * drm_connector_register().
> > > + * Unregister userspace interfaces for a connector. Drivers should call this
> > > + * for dynamic connectors (MST) only, which were registered explicitly by
> > > + * calling drm_connector_dynamic_register(). All other - static - connectors
> > > + * will be unregistered automatically by DRM core and drivers shouldn't call
> > > + * this function for those.
> > 
> > This kind of supports my point about a single
> > drm_connector_register(). There's no
> > drm_connector_dynamic_unregister(). After all the
> > drm_connector_register() calls have been removed, we're left with the
> > asymmetric pair:
> > 
> > - drm_connector_dynamic_register()
> > - drm_connector_unregister()
> > 
> > Then again, all of these should become internal and not for drivers?
> 
> Yes, drm_connector_register() - after this patchset - could be removed
> from drivers. The use of drm_connector_unregister() in drivers for
> static connectors should be also removed, left it for DRM core internal
> use only and exporting drm_connector_dynamic_unregister() for driver
> use (atm only MST).

Yup that's been the plan for a while for static connectors, unfortunately
there's some fun around dp connectors and dp aux specifically that make
the cleanup not entirely a cocci job :-/
-Sima

> 
> > > + *
> > > + * Note: Existing uses of this function in drivers for static connectors
> > > + * should be a nop already and are scheduled to be removed.
> > >   */
> > >  void drm_connector_unregister(struct drm_connector *connector)
> > >  {
> > 
> > -- 
> > Jani Nikula, Intel

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
