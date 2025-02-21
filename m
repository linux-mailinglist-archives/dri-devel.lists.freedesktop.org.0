Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 954DBA3F783
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 15:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A869A10EA75;
	Fri, 21 Feb 2025 14:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="a0eKMQHj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940B710EA77
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 14:42:36 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-38f5fc33602so1223149f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 06:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1740148955; x=1740753755; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cii6B2kYJ1Esw3VsNNHNQ7CPnrt69Fft9i1NupxAeWU=;
 b=a0eKMQHjtsWVkU7TG2u+aQ7FPggPocaKre+SMaEyhMqbEky2CajDTZivPngxfxi4dc
 qmVYKS1v3EnORWfobwcc2I+L/ZpXwzJHtUQXeOZGmbrYSDbykVxso7CF7m+CQAaCKS6G
 2rIBOwlo/J3limvcJPtK99r8WuBI6zXPmtBBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740148955; x=1740753755;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cii6B2kYJ1Esw3VsNNHNQ7CPnrt69Fft9i1NupxAeWU=;
 b=C9jWaslDUNN4t7KvxH3qD8AZU5QrX3/f0z/YqnZlgZnFkhZGwgELwjWahehaPCFWIM
 9G9VcV/QXHXYckmWTVSrdOZo5aYDEnOacvvp715eEApQPxO0SRBZMSf0iyCAbQZ7I73B
 25sHOxYiteNTHN6FYiEOqo32WH8Jbt+dEp+CnDMCQoJzUZpv/amhjRkI+c6NXpg6aT+o
 7G2UY31Tr3HDxvZIBe8aDvWwvwd4KqTfV/+5zSosA7xY441jH7tfuB54+LYUfXO06Z0f
 je9f9OU3Jq3iOvRzpDksIRycUi+NVDf7JQhFqaVaR5L4gC1CHGsCydsIYeLjf7OjQKpH
 F9uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp+xz59gUGe2r2Qxo3MoEr6GsmNhN+YSMIRHQ4Q7Nw3ZVtF0kn5MVshO7yBSg+kkPCWSy/di9K+k0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNVF+6mGw74Opbwu1B7s1xVO3Ji7EXO1auqdG6ldaeYnnHdN8g
 sTxV6XdVHgVw7b+Fy0FIv/s7X6BIO8/zjmMBmS/mc0LkgWdRrcKJCHk646MVV3A=
X-Gm-Gg: ASbGnctsP1+WkrVkz6yPtA8LWl/ckq2VgANlYn9qOySRDRJjnNFrs1Y+6jE2Vho/OA1
 x5SnmVp7pO77LuRGH7/8j86+zjfBkgHMQS48WYIkNKNiabx54bsOgeQr+nMqwy4tvmITayna2/Y
 JSiC87zAtIt8scKUnVq6WWG3A97885QJHdHVl+RpSgtgB/ldaRN9ZXY5+VsWN1nn9Fhvh3tk8ea
 7Cy1Jc5a5+CbWx/EeNbqeWssNhjX1KuKuLc/+shgaXiKDqTLBe0CaCUN1afb7AuHr8mbcjkeQ3y
 Paq7oPkBhYMxnP3XNAbP3puE+Pid44QRShAKDA==
X-Google-Smtp-Source: AGHT+IGstpwMeCkIJjK6OD2yc/O94cERBrqAFOFOu+sdsaqEB8xa11WsWy1+vfV8Vmhai0o4dVKkZQ==
X-Received: by 2002:a5d:47c3:0:b0:38d:d59c:c9d6 with SMTP id
 ffacd0b85a97d-38f61611400mr6882075f8f.21.1740148954691; 
 Fri, 21 Feb 2025 06:42:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d8dd6sm23870760f8f.62.2025.02.21.06.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 06:42:34 -0800 (PST)
Date: Fri, 21 Feb 2025 15:42:32 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/atomic: Filter out redundant DPMS calls
Message-ID: <Z7iQ2B23pfoxxzRM@phenom.ffwll.local>
References: <20250219160239.17502-1-ville.syrjala@linux.intel.com>
 <Z7b7tSabXeLe1ovT@phenom.ffwll.local>
 <Z7b9PD2o6XhfdjWf@phenom.ffwll.local> <Z7dJzkupHUSXPtDT@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7dJzkupHUSXPtDT@intel.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Thu, Feb 20, 2025 at 05:27:10PM +0200, Ville Syrjälä wrote:
> On Thu, Feb 20, 2025 at 11:00:28AM +0100, Simona Vetter wrote:
> > On Thu, Feb 20, 2025 at 10:53:57AM +0100, Simona Vetter wrote:
> > > On Wed, Feb 19, 2025 at 06:02:39PM +0200, Ville Syrjala wrote:
> > > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > 
> > > > Video players (eg. mpv) do periodic XResetScreenSaver() calls to
> > > > keep the screen on while the video playing. The modesetting ddx
> > > > plumbs these straight through into the kernel as DPMS setproperty
> > > > ioctls, without any filtering whatsoever. When implemented via
> > > > atomic these end up as full commits on the crtc, which leads to a
> > > > dropped frame every time XResetScreenSaver() is called.
> > > 
> > > I think you should add here that it's just an empty commit, because we do
> > > filter out redundant commits where crtc->active_changed does nothing.
> > > Except we still run the entire machinery with timestamps and drm_event and
> > > everything.
> 
> Yeah, it'll take at least one frame. And it's a blocking ioctl as well.
> 
> > > 
> > > And I don't think it's worth to filter that out at the atomic level,
> > > because it's really only legacy ioctl that had this "complete noop"
> > > behaviour.
> 
> Yep, I think we can expect atomic userspace to do better.
> Oh, and you can't even set the DPMS property via the atomic uapi
> directly.
> 
> > > 
> > > With the commit message augmented:
> > > 
> > > Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
> > 
> > Ok, one more thing: Please also augment the dpms property uapi doc text
> > with a note that we make this guarantee. Otherwise this feels a bit too
> > much opaque magic. Maybe even a one-liner comment in the code that this is
> > uapi?
> 
> Something like this perhaps?
> + *     On atomic drivers any DPMS setproperty ioctl where the value does not
> + *     change is completely skipped, otherwise an atomic commit will occur.
> + *     On legacy drivers the exact behavior is driver specific.

Perfect!
-Sima

> 
> > -Sima
> > 
> > > 
> > > Might also be nice to have a igt for this? Plus also wondering whether we
> > > should cc: stable it.
> > > 
> > > Cheers, Sima
> > > 
> > > > Let's just filter out redundant DPMS property changes in the
> > > > kernel to avoid this issue.
> > > > 
> > > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_atomic_uapi.c | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> > > > index 2765ba90ad8f..c2726af6698e 100644
> > > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > > @@ -957,6 +957,10 @@ int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
> > > >  
> > > >  	if (mode != DRM_MODE_DPMS_ON)
> > > >  		mode = DRM_MODE_DPMS_OFF;
> > > > +
> > > > +	if (connector->dpms == mode)
> > > > +		goto out;
> > > > +
> > > >  	connector->dpms = mode;
> > > >  
> > > >  	crtc = connector->state->crtc;
> > > > -- 
> > > > 2.45.3
> > > > 
> > > 
> > > -- 
> > > Simona Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > 
> > -- 
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
