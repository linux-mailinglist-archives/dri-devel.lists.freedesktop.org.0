Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A5835C63C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 14:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF22899EA;
	Mon, 12 Apr 2021 12:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000CB899EA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 12:28:43 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id w23so4130849ejb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 05:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oXOFzLZjvk0LyNOjmi5s2GiY2P2vUSqf5iSqo2K7jHE=;
 b=mTH11GKHf/4UYU1YHUwQ+zG9Wnuuk06YYbVfv9ix18rl/RhS6+HdsDZ5vbTAiWcXCR
 GFU95Ss07dMBftcwhGseeyLn6qZPeArRBuZWWx5ar04KVmg/KSsrIUcO+uNvxAVWG4lz
 d36A5Xj2cUSCmDQt9KRPndk0ejErn8JnI/aEhJxeRBsHXEYXXF4eOjEOMBQ3/hwNNC7D
 y9YveGlJpaRgEj9l6ra2b3Efu7I0xB1whiemL+VjOb/KOsa++xXZs7vQESpv36ig8Roq
 3Mow0wnWS0QVso4SrZ9rS3TFfTja952x/Jrx5xNzan1df80HfueuQMk86w9V+KdLHwQd
 k5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oXOFzLZjvk0LyNOjmi5s2GiY2P2vUSqf5iSqo2K7jHE=;
 b=aIDgDD43pKzhf/8thJIay/hVy+ok7wGcc77RRfMtGMhZL2GVmwj2FKAGCZGcl4/nBc
 hf+Bv6qJHs62Hbx08yeS7Hflb7p2h9MTudhOneUBcgkxvDqVQltt6zscXHT5X8aShVh6
 MgZE7nAtp3c8EPBgH1TuNs5VCHAg4md4Hf4gzf69YuqucIg1zWtXtPzGp+og2NFrlH3m
 AVzfNH/2/0epd2xMnd+HkQ7xaRZusyzpAx5sEi3rOErbEV3oaMCylbrmuZphBhWKzwps
 aguUuUpuWtXqDL5BdXzVAbENfnvFaRhEf1SPD1fS3mFnazKB6U0nT526cDr031NeRm3W
 LEWg==
X-Gm-Message-State: AOAM5312Xudbp2KGlj5DViLVwJNIQUtmyT24g3E4nT1V+EKbKQt/4715
 tt/G6lv32v576VM7CO5aITc=
X-Google-Smtp-Source: ABdhPJwmjr7fcwq3BcOpoZ6nnzFOF2nE2oWwF1OJxDvK+VMZXatQkAhjLO6Tiqz3jJUPYGd1pP9NDw==
X-Received: by 2002:a17:906:5e15:: with SMTP id
 n21mr1499484eju.57.1618230522478; 
 Mon, 12 Apr 2021 05:28:42 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it.
 [95.237.55.30])
 by smtp.gmail.com with ESMTPSA id m14sm6494871edd.63.2021.04.12.05.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 05:28:41 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] gpu: drm: Replace bare "unsigned" with "unsigned int"
Date: Mon, 12 Apr 2021 14:28:40 +0200
Message-ID: <6109116.xc2Yry14yg@linux.local>
In-Reply-To: <YHQ5D25KQ+3uADNo@phenom.ffwll.local>
References: <20210412105309.27156-1-fmdefrancesco@gmail.com>
 <YHQ5D25KQ+3uADNo@phenom.ffwll.local>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>, outreachy-kernel@googlegroups.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, April 12, 2021 2:11:59 PM CEST Daniel Vetter wrote:
> On Mon, Apr 12, 2021 at 12:53:09PM +0200, Fabio M. De Francesco wrote:
> > Replaced the type "unsigned" with "unsigned int" because it is
> > preferred. Issue detected by checkpatch.pl.
> 
> Huh, I didn't know that, TIL.
> 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> 
> Thanks for your patche, merged to drm-misc-next for 5.14.
> -Daniel
>
I am happy that my first dri-devel patch has been accepted.

Thanks,

Fabio 
> 
> > ---
> > 
> >  drivers/gpu/drm/drm_atomic.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic.c
> > b/drivers/gpu/drm/drm_atomic.c
> > index 5b4547e0f775..46dceb51c90f 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -1302,8 +1302,8 @@ int drm_atomic_check_only(struct drm_atomic_state
> > *state)> 
> >  	struct drm_crtc_state *new_crtc_state;
> >  	struct drm_connector *conn;
> >  	struct drm_connector_state *conn_state;
> > 
> > -	unsigned requested_crtc = 0;
> > -	unsigned affected_crtc = 0;
> > +	unsigned int requested_crtc = 0;
> > +	unsigned int affected_crtc = 0;
> > 
> >  	int i, ret = 0;
> >  	
> >  	DRM_DEBUG_ATOMIC("checking %p\n", state);




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
