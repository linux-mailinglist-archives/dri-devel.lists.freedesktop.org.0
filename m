Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0629D36310B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 18:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518C289E98;
	Sat, 17 Apr 2021 16:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC7889E98
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 16:03:09 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id r12so46492554ejr.5
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 09:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0iBdoO43ZxcfL4vvnLAtWWoYN89D9RquHZJTfNAF3AQ=;
 b=ID515q7jPCgyI7bf6VWHsi7Reb43NTwTDqByKOW4UTPHUk0oSc8K+YCG1I6ulbIzP8
 +mDjKnjkwHfGUwTseZtGjVcwoSfPqBo+rZC75sb3ajfEVVeNUeb/bnzBTWv79LM2sJAU
 xRAYw3W2CKG5n87erTP3o6kCITRSp0/P32J37K2HId1jBk52mx27qS42jb3dDxmY/W2Y
 gwHrA90MNus3caO7E9sP6MX+Ozo6nPLE9ufVwNxMx85r6zI1BDLEUUCoFHMR/NSfO8v+
 wUm121Fpy55ST5FFDRQ9zm0faTPE6poRyyPNolxKaNFkqZ8MF6/rlhjPp7n01SKvA4Oq
 oeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0iBdoO43ZxcfL4vvnLAtWWoYN89D9RquHZJTfNAF3AQ=;
 b=UqUABtRTCJOm6pSGpNZUjUcFu0QpFMo5yxAZX/zga/CwZXe4Nu/Yh5+wRPQOIWWH6c
 2/wauLCveOLgecut+COX17G/a+yqtK2lXZ8mkERVMbQsJY0T3gMZae3RQGPP77hidT15
 oL/usCM3ZWVhkxh5HN5jItMd8e5Q/DL8BpP1E7om6UDMa1Qwm1X5CI9CwS7zfVyrhR4l
 1uIth6UHZKvAu7kYbAGOEH1D0OhQCnWUy8xmYy9x1Ke43gts3+QlcQ8yMxG9x3nmSjG5
 8FfIJvNUmhTSKsmQ6y1BPwqD9fif4l6lpON67RXef8BYg4zVRVEgY73+MdOR/NJ1uSRc
 5QYQ==
X-Gm-Message-State: AOAM533bC3ii5H89gcG0AdIOHV+F8RfQxePI/ZBSp4Wps3mf6TPLC444
 kxtJo/tk4a0GAJUpqdnyu40+C0BzwIivG1fc
X-Google-Smtp-Source: ABdhPJy29R0j+rZtww4a0cIJrhyWsRcqPAA5W5lf/hn/qq1ZIWlO742qw5mayM0pkuQxFGo7C7xiSg==
X-Received: by 2002:a17:906:b1d4:: with SMTP id
 bv20mr13765227ejb.46.1618675388156; 
 Sat, 17 Apr 2021 09:03:08 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it.
 [95.237.55.30])
 by smtp.gmail.com with ESMTPSA id d14sm1479764edc.11.2021.04.17.09.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 09:03:07 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [Outreachy kernel] [PATCH Resend] drm/drm_bufs.c: In switch,
 add break in default case
Date: Sat, 17 Apr 2021 18:03:06 +0200
Message-ID: <3022803.ysd8NKUkcf@linux.local>
In-Reply-To: <alpine.DEB.2.22.394.2104171745391.2982@hadrien>
References: <20210417153540.22017-1-fmdefrancesco@gmail.com>
 <alpine.DEB.2.22.394.2104171745391.2982@hadrien>
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
Cc: David Airlie <airlied@linux.ie>, outreachy-kernel@googlegroups.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, April 17, 2021 5:45:46 PM CEST Julia Lawall wrote:
> On Sat, 17 Apr 2021, Fabio M. De Francesco wrote:
> > Added a 'break' in the default case of a switch selection statement.
> 
> Why?
>
GCC issues a warning, even if it is not strictly necessary for the code to 
work properly. Do you think that I have to explain in the patch log the reason 
why I made that change?

Thanks,

Fabio
>
> julia
> 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> >  drivers/gpu/drm/drm_bufs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> > index e3d77dfefb0a..fc40aa0adf73 100644
> > --- a/drivers/gpu/drm/drm_bufs.c
> > +++ b/drivers/gpu/drm/drm_bufs.c
> > @@ -79,7 +79,7 @@ static struct drm_map_list *drm_find_matching_map(struct
> > drm_device *dev,> 
> >  				return entry;
> >  			
> >  			break;
> >  		
> >  		default: /* Make gcc happy */
> > 
> > -			;
> > +			break;
> > 
> >  		}
> >  		if (entry->map->offset == map->offset)
> >  		
> >  			return entry;
> > 
> > --
> > 2.31.1
> > 
> > --
> > You received this message because you are subscribed to the Google Groups
> > "outreachy-kernel" group. To unsubscribe from this group and stop 
receiving
> > emails from it, send an email to
> > outreachy-kernel+unsubscribe@googlegroups.com. To view this discussion on
> > the web visit
> > https://groups.google.com/d/msgid/outreachy-kernel/20210417153540.22017-1-f
> > mdefrancesco%40gmail.com.




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
