Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A27C52A2B50
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78746E516;
	Mon,  2 Nov 2020 13:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D976E516
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 13:18:01 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k10so13215312wrw.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 05:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZIqlXIfq5xntoWvtlW/vms8/Ik9yB8yy1Md20jy3FIk=;
 b=Y+lbD3NHv9Q1Lrb7kALnmHYZdWbOYJQB/m92V7HhsnJ6fNbnXexP0ImpltLcUHlvfB
 aU1f+LpfFv0KvE+Dsz1YWjx157GNjrNPqw4E3IeQjluM1zvHNoiSMQ82LXCYBq735EQ3
 YcCNyOr4U98q+sQmG+QUY6ngTjl6FIcgBW4Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ZIqlXIfq5xntoWvtlW/vms8/Ik9yB8yy1Md20jy3FIk=;
 b=bhC5iMH6eB8gFKjgrlhPbS5SZltzpaIOEeUQM6q/JGhGspipvHEx+MpwsEuFzyTCfr
 sh0r8PGMESgEjQCj8S/KGM3gYNGt7PF6eLqQ9V+kCQNt4BFe1C6GzZC7pCkfVk0JLuzd
 S7IyHXWEfqJMRMxkHbXxzazUaFkgS+DlSJTYVlvEKLB5U5FxuojQHgTmzSCuS/pBdHBl
 AZlSKWfa5hIvSAzbR872dJ7TB4o08pDy31n+ybzm4OaDj4D/apxGQqDSzBaSFInLhsB5
 woZth2f4W7QT8E8ucsfq15bvTmG02wElXLtW1YrPj4zfnAb72HfiXX/M89odEr/+O9kT
 AUUw==
X-Gm-Message-State: AOAM531cc7XapXs2jH1JPD7gk2GB9upKLjrQF4LM70goXorjsFHKf76f
 BY3T38Ey7qcpfCipucWOWv6TjA==
X-Google-Smtp-Source: ABdhPJyF8C0k5C9m1IBd3mC8j+J2oYVicusKVxv/pcvu+M/KQmTyp1FmZoIuTyrXSE77eDAz5OhP9w==
X-Received: by 2002:adf:e9cc:: with SMTP id l12mr14613849wrn.248.1604323080359; 
 Mon, 02 Nov 2020 05:18:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z14sm16017863wmc.15.2020.11.02.05.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 05:17:59 -0800 (PST)
Date: Mon, 2 Nov 2020 14:17:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Bernard <bernard@vivo.com>
Subject: Re: Re: [PATCH] gpu/drm: make crtc check before new_connector circle
Message-ID: <20201102131757.GP401619@phenom.ffwll.local>
Mail-Followup-To: Bernard <bernard@vivo.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20201102101724.GO401619@phenom.ffwll.local>
 <APsA*wDGDQPaL*xHM6wdLqpj.3.1604322810049.Hmail.bernard@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <APsA*wDGDQPaL*xHM6wdLqpj.3.1604322810049.Hmail.bernard@vivo.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 09:13:30PM +0800, Bernard wrote:
> 
> 
> From: Daniel Vetter <daniel@ffwll.ch>
> Date: 2020-11-02 18:17:24
> To:  Bernard Zhao <bernard@vivo.com>
> Cc:  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,Maxime Ripard <mripard@kernel.org>,Thomas Zimmermann <tzimmermann@suse.de>,David Airlie <airlied@linux.ie>,Daniel Vetter <daniel@ffwll.ch>,dri-devel@lists.freedesktop.org,linux-kernel@vger.kernel.org,opensource.kernel@vivo.com
> Subject: Re: [PATCH] gpu/drm: make crtc check before new_connector circle>On Sun, Nov 01, 2020 at 06:58:51PM -0800, Bernard Zhao wrote:
> >> In function prepare_signaling, crtc check (c==0) is not related
> >> with the next new_connector circle, maybe we can put the crtc
> >> check just after the crtc circle and before new_connector circle.
> >> This change is to make the code to run a bit first.
> >
> >I'm a bit confused here with your explanation, I'm not understanding why
> >you do this change ... Can you pls elaborate? Maybe give an example or
> >something of the problem this patch solves, that often helps.
> >
> >Thanks, Daniel
> 
> Hi:
> 
> This change is to make the function return error earlier when run into the error branch:
> if (c == 0 && (arg->flags & DRM_MODE_PAGE_FLIP_EVENT))
>     return -EINVAL;
> There two main FOR circles in this function, and the second FOR circle
> never changes the if condition("(c == 0 && (arg->flags &
> DRM_MODE_PAGE_FLIP_EVENT))") variable`s value, like c & arg->flags.  So
> I think maybe we can check this condition before the second for circle,
> and return the error earlier when run into this error branch.

Ah ok. Makes sense, but this case is only ever hit for bad userspace that
got something wrong, so I'm not sure we should optimize for this. And with
this we kinda bury this fairly important check in the middle, so I don't
think it improves code readability.
-Daniel

> 
> BR//Bernard
> 
> >> 
> >> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> >> ---
> >>  drivers/gpu/drm/drm_atomic_uapi.c | 13 ++++++-------
> >>  1 file changed, 6 insertions(+), 7 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> >> index 25c269bc4681..566110996474 100644
> >> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> >> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> >> @@ -1182,6 +1182,12 @@ static int prepare_signaling(struct drm_device *dev,
> >>  
> >>  		c++;
> >>  	}
> >> +	/*
> >> +	 * Having this flag means user mode pends on event which will never
> >> +	 * reach due to lack of at least one CRTC for signaling
> >> +	 */
> >> +	if (c == 0 && (arg->flags & DRM_MODE_PAGE_FLIP_EVENT))
> >> +		return -EINVAL;
> >>  
> >>  	for_each_new_connector_in_state(state, conn, conn_state, i) {
> >>  		struct drm_writeback_connector *wb_conn;
> >> @@ -1220,13 +1226,6 @@ static int prepare_signaling(struct drm_device *dev,
> >>  		conn_state->writeback_job->out_fence = fence;
> >>  	}
> >>  
> >> -	/*
> >> -	 * Having this flag means user mode pends on event which will never
> >> -	 * reach due to lack of at least one CRTC for signaling
> >> -	 */
> >> -	if (c == 0 && (arg->flags & DRM_MODE_PAGE_FLIP_EVENT))
> >> -		return -EINVAL;
> >> -
> >>  	return 0;
> >>  }
> >>  
> >> -- 
> >> 2.29.0
> >> 
> >
> >-- 
> >Daniel Vetter
> >Software Engineer, Intel Corporation
> >http://blog.ffwll.ch
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
