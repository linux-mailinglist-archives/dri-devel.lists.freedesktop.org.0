Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D53F0453659
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 16:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171896E53E;
	Tue, 16 Nov 2021 15:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDF26E53E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 15:49:28 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id p18so8055779wmq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 07:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xrOg/41yJr2qjga3/gdMtmeLoRp8xmb53l7MOrVyGKk=;
 b=jM7/DjQegOQ5ulSxb7CBBG0/KDYU6pQr04Za7m8EV9zCDIl/5F/xvcnlUe3emEn5Yv
 LGX9bFJsu/GxT6FhK0VbsNVNQ2q34MLhQmFzX1IpXJLClenJI7nzP1BIHuzXCovxTIO/
 KgOizAs+y/gwSMd8uxLetZiDlAdWofS55y4bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xrOg/41yJr2qjga3/gdMtmeLoRp8xmb53l7MOrVyGKk=;
 b=LE3h3lgiI9KBZygGgJisA0+PirAgcpEWC9K2yPmncO5eV5/pSajX/s4CAwvfHTKgis
 gmRgQ/wZxEBvKy445K3Sw/5goliNtmFDq5Hp8DtZrao1ju7uC3kqJUf2wu210pDGdpoy
 t/ooBhx3Gawx9ha918xBGtAElwmpv+Ex3TDiRva6ttiYHZdk3LlRyn0nbuVGO2k8m21K
 gpH6A5yQhD7mbRaFUzkh9d7Wxcxl/W/Ejcofv0H2YEs0xo23/ayg/JpWafQMiqApV/AX
 22Bu1Eo+lcbRIUOPhD6LC6/E+pbfUEPuurf4l8vtVH+3w6jdDcdsTec6XbDMzL4zFoU9
 s0CA==
X-Gm-Message-State: AOAM533l7xLjR6n7PZyhnYI0yYbkwIhNlbVuALvtNokr6NBieJ/lkvII
 YwzNQDJqt0VeBJbSbEdywFv72Q==
X-Google-Smtp-Source: ABdhPJyEgEdwpK2J2r+tjYwczcHvDCciX+hBla2fqaLrecreC7IAYp/7RKNO5pyMliNy0zGEPpPyoQ==
X-Received: by 2002:a05:600c:3ba5:: with SMTP id
 n37mr69950738wms.168.1637077766363; 
 Tue, 16 Nov 2021 07:49:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r8sm22513313wrz.43.2021.11.16.07.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:49:25 -0800 (PST)
Date: Tue, 16 Nov 2021 16:49:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v4] drm/ttm: Clarify that the TTM_PL_SYSTEM is under TTMs
 control
Message-ID: <YZPTAzxeREjYAY7Z@phenom.ffwll.local>
References: <20211110145034.487512-1-zackr@vmware.com>
 <61aa563096a20dca80b4cc48037998b932c2e4fc.camel@vmware.com>
 <48dbcca4-a47b-28c5-9163-5a1e8960639e@linux.intel.com>
 <a5a987cd-493f-a089-d3d6-5c4e2fb171e8@amd.com>
 <52b8c310-ebab-a68e-a2f2-62a56b5216e3@linux.intel.com>
 <112af1da-87ff-ee03-9461-e23173e84e86@amd.com>
 <ddc99a8c-0887-9fc3-718e-98963723415c@linux.intel.com>
 <5609a30f-2625-9b27-6ad6-4c6d73fb10f6@amd.com>
 <7196ce91-5897-3088-e7f4-f9c5b04152d9@linux.intel.com>
 <3cd2f3e4-5e56-dcf5-0bf6-462f19269c88@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3cd2f3e4-5e56-dcf5-0bf6-462f19269c88@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 10:09:44AM +0100, Christian König wrote:
> Am 16.11.21 um 10:00 schrieb Thomas Hellström:
> > On 11/16/21 09:54, Christian König wrote:
> > > Am 16.11.21 um 09:33 schrieb Thomas Hellström:
> > > > On 11/16/21 09:20, Christian König wrote:
> > > > > Am 16.11.21 um 08:43 schrieb Thomas Hellström:
> > > > > > On 11/16/21 08:19, Christian König wrote:
> > > > > > > [SNIP]
> > > > > 
> > > > > Well my long term plan is to audit the code base once more
> > > > > and remove the limbo state from the SYSTEM domain.
> > > > > 
> > > > > E.g. instead of a SYSTEM BO without pages you allocate a BO
> > > > > without a resource in general which is now possible since
> > > > > bo->resource is a pointer.
> > > > > 
> > > > > This would still allow us to allocate "empty shell" BOs. But
> > > > > a validation of those BOs doesn't cause a move, but rather
> > > > > just allocates the resource for the first time.
> > > > > 
> > > > > The problem so far was just that we access bo->resource way
> > > > > to often without checking it.
> > > > 
> > > > So the driver would then at least need to be aware of these
> > > > empty shell bos without resource for their move callbacks?
> > > > (Again thinking of the move from empty shell -> VRAM).
> > > 
> > > My thinking goes more into the direction that this looks like a BO
> > > directly allocated in VRAM to the driver.
> > > 
> > > We could of course also make it a move, but of hand I don't see a
> > > reason for it.
> > 
> > As long as there is a way to provide accelerated VRAM clearing if
> > necessary the directly allocated view sounds fine with me. (Looking at
> > amdgpu it looks like you clear on resource destroy? I'm not fully sure
> > that would work with all i915 use cases)
> 
> In amdgpu we have both. The AMDGPU_GEM_CREATE_VRAM_CLEARED flag clears the
> memory on allocation and AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE flag makes
> sure it is wiped on release.

btw how does this work when there was random previous stuff in that memory
region previously?

Like the more we do hmm style integration the more you cannot assume that
critical memory is cleared on free/release, because that's just not how
core mm/ works, where pages are all cleared on alloc before userspace sees
them.

Entirely sidetrack discussion :-)
-Daniel

> Wiping on release is sometimes faster because you don't need to wait for the
> clear to finish before you can first use it.
> 
> But thinking about it once more it might be a good idea to have move
> callbacks for empty shells and freshly allocated BOs as well, so that the
> driver is informed about the state change of the BO.
> 
> Regards,
> Christian.
> 
> > 
> > /Thomas
> > 
> > 
> > > 
> > > Christian.
> > > 
> > > > 
> > > > Thanks,
> > > > 
> > > > /Thomas
> > > > 
> > > > 
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
