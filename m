Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EEC589E37
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 17:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28598112D2A;
	Thu,  4 Aug 2022 15:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A79914A5AC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=CjqqfUDtTEDfLxHjiOJHQxNSFK3p9uEUwyce5c5CjE0=;
 b=CKUC6EE2HwjA8qgbnmkSfEc1cQzf+3Oi/+i5xMVZPuCArkppoeXCFVi74YeoQ6uRrXGP9r/XgcNf/
 3S86IAl8Yzs/dO/uAudIp2TUt0lFbImTKBOcpjRucQ9EgUDYoqvFLPLR/UsVJHtgRlADdLQc7R0xQL
 8G3y7wQxkB3dJus/bAqc1gYyPii7AMsLiqZAuwCdUwwS/vuc/oh/U4l1J2ymrPN6L+ibqdmjL6NmPA
 WRiQ9Bm+7pj/W7bBBY8IBlGVouB1dCBKI55amEnw2hoDX0k/0o5NfaGZfsNpp30BX880i/s4kvI65u
 UsnRApVZh07qShHVfyVTDcwHnLGvORw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=CjqqfUDtTEDfLxHjiOJHQxNSFK3p9uEUwyce5c5CjE0=;
 b=eTCfykPUvZvvTf0GSt3q0DvfJCyt8koBmZQc3yne+cImNpSzvPcHLqE2njiMWbrQqep8smwW6J4Ar
 2DyBBQ4BQ==
X-HalOne-Cookie: 859cbcbd99a20f6c40af0da7b86d4c94216a00f3
X-HalOne-ID: 65595e50-1407-11ed-a6ca-d0431ea8a283
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 65595e50-1407-11ed-a6ca-d0431ea8a283;
 Thu, 04 Aug 2022 15:09:11 +0000 (UTC)
Date: Thu, 4 Aug 2022 17:09:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
Message-ID: <YuvhFtd+gHXD4U9x@ravnborg.org>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com>
 <f7a47d59-d4d2-61fb-4e42-1decff2e7d62@suse.de>
 <trinity-e1f9136b-24dd-44ed-861b-a0735c91422e-1659221316349@3c-app-mailcom-bs07>
 <43fd433c-f108-d75a-b141-f4ff985455b9@suse.de>
 <trinity-8c70d1f1-fd67-46a1-a84b-7cc771cca62d-1659411946174@3c-app-mailcom-bs03>
 <fdcca10e-1d63-4d00-af03-94ba1b9dab57@suse.de>
 <trinity-0dcadb0d-103a-403a-a915-02d19e8ba823-1659491389263@3c-app-mailcom-bs14>
 <72b40bf1-5252-1f10-e5a7-c0ccc8c9d98b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72b40bf1-5252-1f10-e5a7-c0ccc8c9d98b@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin,

>  1) Get an un-accelerated driver merged without new uapi, ioctls, etc. All
> you need is there already. We already agreed to take the code mostly as-is
> and do the cleanups later on.
> 
>  2a) Stay around on dri-devel, send improvements and fixes for the merged
> code.
> 
>  2b) In parallel, you can work on video, 3d, etc in both kernel and
> userspace.

And on top of this the driver will see all the refactoring going on in
drm drivers all the time, and we may find cases where the driver can use
more of the drm helpers.

I really hope to see next revision where there is focus on the general
un-accelerated case and without the extras as Thomas mentions.

	Sam
