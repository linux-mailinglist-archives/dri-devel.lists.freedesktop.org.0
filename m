Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64CF2165FE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 07:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9856E1E8;
	Tue,  7 Jul 2020 05:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FE76E1E8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 05:50:17 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f18so35722072wrs.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 22:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=tWwPNUXAhZkGALSmCM6I62dir2ac7KtA6PfPQYUz4tM=;
 b=JjYvUZBaLJxTV/BcuvHN0yhsBodhFnLNMtn6S42f4eG11n/5e/oCblJoIIBUpfysyf
 Vgw3xlD1GHvhj9g1ql1pmPUfwN4tqKoAj4Pvpq1pZ2urqQ5fkXpiqvs54MSWagyQKwiA
 n6No1KSVjXYrja6mPtGqEkYkUS2sD4sKfSn3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=tWwPNUXAhZkGALSmCM6I62dir2ac7KtA6PfPQYUz4tM=;
 b=jyhZauekw1E3kaq5jW6bplltQNMPRD4Rgdlu1r2vH+oQVLVfUe8Fq7zLBMiN6dPdqt
 eLQ19PUNR23P38y5igNQm8gfIdBEmfHuLahNVG/Y0guyA+3T98nVua1BqCONyPO4enyF
 7U1qL8ube8L0xRFxgyPekohhshbyiNzFXR7QiG6ohRDwCh3vBoVfM5+iBFjzBpLye9Ea
 /Xnzjkbx9P1A8dBc42dmagk+yFwlKdQe5BQir81ToBHXWw+EKej8BBZv7EbZOlxiH+u2
 BkL6RAeHwMDlpty8yq5u44FfvaeyDbSDsOGbJ5q1IuFNomQLK7dyz/Q5KrF+kzW39ozK
 6Fwg==
X-Gm-Message-State: AOAM530putspqou7Rmb/dnXrfeDtcZFvtH3Ou+Els/KfRiH/LeyvKdEt
 s+/1ZLnYufLJccsNhxJO0HCqOQ==
X-Google-Smtp-Source: ABdhPJxzb1aGKqJ4jxtL9PIFyXbRUO2dBkb0GWe1iZ9+xLYdWRBle+zVIIjxFlCnANQHnCq+1iMaNw==
X-Received: by 2002:a5d:40cf:: with SMTP id b15mr51255032wrq.319.1594101016305; 
 Mon, 06 Jul 2020 22:50:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k185sm1883352wmk.47.2020.07.06.22.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 22:50:15 -0700 (PDT)
Date: Tue, 7 Jul 2020 07:50:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Suraj Upadhyay <usuraj35@gmail.com>
Subject: Re: [Proposal] drm: amd: Convert logging to drm_* functions with
 drm_device parameter
Message-ID: <20200707055013.GG3278063@phenom.ffwll.local>
Mail-Followup-To: Suraj Upadhyay <usuraj35@gmail.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20200706105138.GA10722@blackclown>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200706105138.GA10722@blackclown>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 06, 2020 at 04:21:38PM +0530, Suraj Upadhyay wrote:
> Hii Maintainers,
> 	I recently came across this list of janatorial tasks
> for starters on DRM subsystem [1]. One of the tasks is replacing
> conventional dmesg macros (like dev_info(), dev_warn() and dev_err())
> with DRM dmesg macros [2]. And I need your input whether the
> conversions to DRM dmesg macros are worth it or not.
> I would like to start working on this task if this needs the change.

For any core code I'm happy to merge such patches. If you're changing a
specific driver (all the subdirectories under drivers/gpu/drm/*) then
please ping the specific driver maintainer first. They should be all
listed in the MAINTAINERS file.

Cheers, Daniel

> 
> Thank you,
> Suraj Upadhyay.
> 
> [1] https://dri.freedesktop.org/docs/drm/gpu/todo.html.
> [2] https://dri.freedesktop.org/docs/drm/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-paramater
> 



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
