Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7540335CA51
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 17:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE9389DED;
	Mon, 12 Apr 2021 15:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD5389DED
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:46:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so6482581wmg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 08:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BOJW+FDoOnJcstvVO7WkKNL0wTgkh61II7x1/rgVxjk=;
 b=ToYcqOtOsOscRGdjk/vUJEPI5jKmLL+/shdHIebP8/T8HBiHtSnZEUo6OHy0iLlgAQ
 xaLL9WndRNepKkrlGnt3EIpLbH/w6Jbeh24ZtLLp2jWGLg++SGuL5EChJB+ClOeeSnr9
 yZEOofQEdlqt8sg9Pib2FQ9fCcIMi57FyqOtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BOJW+FDoOnJcstvVO7WkKNL0wTgkh61II7x1/rgVxjk=;
 b=s1vd2UbQIUw3svwsBpq87qKgxx1vdFxoTlfIMamIopHjguVq7JNItpmUG2TLWVmovW
 +DG70mMNLFJ78xWCZ46aYY8QuOxT53nLEKXNEP43ifCwgBvq0txbLIP23hLGOxeV0fMI
 m/Vr2RgzmB7ChHJPSuqPlT/jE3UWOwmXqMhWdPtEWTCEhXEzfzXhfOVWBfw+XyoJ2/au
 3OPCoi5nv8NlUTzciwTD/zDAUxW2PfnVBsgZ1A0amdOlu1QgYMOtHkmZ/0MnnF/LZnV1
 Ya3HyIrvbHw9V3T+8v7G/YjqiSWpj95CRNPKDkpRdOKSUVC3YF63icK5LnBJFoCIdjsQ
 5WGQ==
X-Gm-Message-State: AOAM531YIS4aac6GyQfPGufoHGW6E3+5IIdXGnT3/wBi7WbnWYNWAQWN
 Q9z81m+7BftOYckdHmrqIVB/cA==
X-Google-Smtp-Source: ABdhPJzq6HbhHBlTgtSNPnJ0ScxIIMfG8Ik+FkuLcidNveRySdWot0Afw76wsXOXxQLaOmZIrpt2MA==
X-Received: by 2002:a1c:4d0e:: with SMTP id o14mr4836641wmh.141.1618242375993; 
 Mon, 12 Apr 2021 08:46:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c1sm2131444wrx.89.2021.04.12.08.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 08:46:15 -0700 (PDT)
Date: Mon, 12 Apr 2021 17:46:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH v2 0/2] drm: drm_atomic_helper.c: Change types and format
 comments
Message-ID: <YHRrRS7xLs/FRDUT@phenom.ffwll.local>
References: <20210412124213.4628-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412124213.4628-1-fmdefrancesco@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>, outreachy-kernel@googlegroups.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 02:42:12PM +0200, Fabio M. De Francesco wrote:
> Replaced "unsigned" with "unsigned int" and formatted comments according
> to the Linux style guidelines. Issues detected by checkpatch.pl.
> 
> Changes from v1: Rewrote the "Subject" of the patches in the series.

Also applied to drm-misc-next.
-Daniel

> 
> Fabio M. De Francesco (2):
>   gpu: drm: Replace "unsigned" with "unsigned int"
>   gpu: drm: Correct comments format
> 
>  drivers/gpu/drm/drm_atomic_helper.c | 40 ++++++++++++++++++-----------
>  1 file changed, 25 insertions(+), 15 deletions(-)
> 
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
