Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F20265FE05
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 10:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FC310E849;
	Fri,  6 Jan 2023 09:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9EB10E848
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 09:35:20 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so3601584wml.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 01:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=m1QIhJKu38LzdK64CHGlFS5C2Xgrmyff588FHbiI2Rw=;
 b=AZMDIoN6ye60oTAHbfOXVoSGpch9AASipzbuERM6Nu1T4zx9jXvawwYVLGvId3ZcJX
 8ZQOMOi2gH5h6R4aUtWQ+Acrc2OiihH/PJqkLwCAJySffeUWtJhqab4C7elqXlzKEeTn
 xxHMvlp/thvMSpLILHd98mYOQzQz/me6Bmp7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m1QIhJKu38LzdK64CHGlFS5C2Xgrmyff588FHbiI2Rw=;
 b=4a7pPM1vo8CnwLFpOyG/T0qEP+m08B2m5YbJhWsvWNd5qaNUJgsruMJ6ucHHmXTTsH
 gSufWm7K9vw0tVWfMEHyUlXiolOFbLzSZMTbWK9LkCFfCJtUcRBF5fzyirgUyg9oX5yU
 mzPIXKbc0b3OTiiVCDUyEbTMLzGjURxrRZ7U7EvjY0LoQ6xtD8qECbZ05xCyQprz2d8C
 ndoEmEPxIAAE3TSOvzX2nT+sjCKvjfSQvo7CKRdmCD1yIOq1kjvjCQ1dR623ptcgrpaW
 bbjIHgkxI3/MtSnuU3gBHnVQN6dFzZt5FRn0L6mgRUZb4ZFBsHfaHpZfzKEaDA9wqddT
 CqPA==
X-Gm-Message-State: AFqh2kryisgReryG7IYMwyUN6y2nHfpDmpXDCDHTc3mZlE/VPln6dimA
 ySQ6CKtDQRHqt3hEbJWczjVrEw==
X-Google-Smtp-Source: AMrXdXto9yDWgPChJ3HsTfRMMEKSP/rCqp8BIRZ6QXdHF2R+bXEVGqDTxdMzWJdus2XxgEl1Sn1txg==
X-Received: by 2002:a7b:cb89:0:b0:3d2:2101:1f54 with SMTP id
 m9-20020a7bcb89000000b003d221011f54mr38640992wmi.4.1672997718712; 
 Fri, 06 Jan 2023 01:35:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c71358a42dsm7341248wmq.18.2023.01.06.01.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 01:35:17 -0800 (PST)
Date: Fri, 6 Jan 2023 10:35:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v1 2/2] drm/virtio: Add the hotplug_mode_update property
 for rescanning of modes
Message-ID: <Y7frUw39xU70WQkD@phenom.ffwll.local>
References: <20221118013054.182304-1-vivek.kasireddy@intel.com>
 <20221118013054.182304-3-vivek.kasireddy@intel.com>
 <20230106085640.54hvmhblmh4o2jxb@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106085640.54hvmhblmh4o2jxb@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, Dongwon Kim <dongwon.kim@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 09:56:40AM +0100, Gerd Hoffmann wrote:
> On Thu, Nov 17, 2022 at 05:30:54PM -0800, Vivek Kasireddy wrote:
> > Setting this property will allow the userspace to look for new modes or
> > position info when a hotplug event occurs.
> 
> This works just fine for modes today.
> 
> I assume this is this need to have userspace also check for position
> info updates added by patch #1)?

What does this thing even do? Quick grep says qxl and vmwgfx also use
this, but it's not documented anywhere, and it's also not done with any
piece of common code. Which all looks really fishy.

I think we need to do a bit of refactoring/documenting here first.

Also in principle, userspace needs to look at everything in the connector
again when it gets a hotplug event. We do have hotplug events for specific
properties nowadays, but those are fairly new.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
