Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AAC44C211
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 14:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C916E150;
	Wed, 10 Nov 2021 13:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710A16E150
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 13:26:25 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t30so3985287wra.10
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 05:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=RSlqknL9m3m8DHE6V4AHjL2Umpp0Dre0vFIBzd0ZIpA=;
 b=I8BYU9ElK86UUI5R0hmucG1yx60aLvsNTs+iS3zDKFb+OlkPMF0HA/RSx6ahg0X3up
 emW2tgsrDdSiGtxK5IFARXR05XVVmMiqj10Oto53ZeML3Qbfr2YFIs0SrLd5LttQOCb8
 mtI2YPHpGbigFFBv5pQDWTk/ojpdx2qq1fl4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RSlqknL9m3m8DHE6V4AHjL2Umpp0Dre0vFIBzd0ZIpA=;
 b=jg2/JPPEuFuwgtvmkeDKHUMccXkD+cIeKhjyR7D1+qC7K0lA2rLKwi6G4DBbz4Xw7G
 yvxAnTWBwufkalUGNV4RqYAI/yQaV2DKMkYo7jz+sft5goYhf3ql5gtvB4JHLLdJaVpe
 pEw/tHmyKUK1dkZCIW7Nahz3aqhICAG+jXLL6UY5j1AGGBQCZkgm2ZC5kom6FeF4gWlE
 n7dgtHdOzvXQtr0f7hoQHCrNnc/ZoJBI+5OMNYfyNZ7u7CbMxnrMWWU2MCMSQiQqP0kK
 uQFVxKc/MYUwUvvrhcz/nA7GB2ZJuPXiXxZ0ooaDk9q89LSE+OI2LAA2bslPUSm2/koO
 kTYg==
X-Gm-Message-State: AOAM532nGMldbNZp4/uWHigz3O4p/wd1kXyjrZdXOKis34r1cttn4fU+
 nbprwx6O8/kWeKTx4wIlI8EO9Q==
X-Google-Smtp-Source: ABdhPJzewAmDYbfMK5sizMYFVpGQo/NoBrdcPmob4J0t21Z1eR3kK9TOlBbzVyNM8Qy+eo6QU3anlw==
X-Received: by 2002:a5d:64a2:: with SMTP id m2mr20198290wrp.248.1636550784050; 
 Wed, 10 Nov 2021 05:26:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l22sm5522954wmp.34.2021.11.10.05.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 05:26:23 -0800 (PST)
Date: Wed, 10 Nov 2021 14:26:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: Questions about KMS flip
Message-ID: <YYvIfXy9bwPokiK9@phenom.ffwll.local>
References: <579d0f44-bb85-11b2-d326-35a0b7c5d0de@amd.com>
 <5c242319-ade3-5621-6429-f77b17c34de5@amd.com>
 <YYV0W1CxT5torU7u@phenom.ffwll.local>
 <64e70779-7c33-7849-aa29-aeaee4a89005@amd.com>
 <YYk7SkflDx8ToqYG@phenom.ffwll.local>
 <4ba7e3f8-7956-882a-6888-57e2448b907d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ba7e3f8-7956-882a-6888-57e2448b907d@amd.com>
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
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 11:18:02AM +0100, Christian König wrote:
> Am 08.11.21 um 15:59 schrieb Daniel Vetter:
> > On Mon, Nov 08, 2021 at 08:44:24AM +0100, Christian König wrote:
> > > Am 05.11.21 um 19:13 schrieb Daniel Vetter:
> > > > On Thu, Nov 04, 2021 at 12:44:34PM -0400, Harry Wentland wrote:
> > > > > +Nick
> > > > > 
> > > > > It looks to be the old drm_plane_state->fb holds that reference. See dm_plane_helper_cleanup_fb() in amdgpu_dm.c.
> > > > Yup plane state holds reference for its entire existing (well this holds
> > > > in general as design principle for atomic state structs, just makes life
> > > > easier). And the plane state is guaranteed to exist from when we first pin
> > > > (prepare_fb plane hook) to when it's getting unpinned (cleanup_fb plane
> > > > hook).
> > > > 
> > > > Out of curiosity, what's blowing up?
> > > The TTM pin count warning. What happens is that we try to free up a BO while
> > > it is still being pinned.
> > > 
> > > My best guess is that some DMA-buf client is doing something wrong, but it
> > > could of course also be that the BO was pinned for scanout.
> > We check in dma_buf_release whether there's anything left over, so I think
> > the dma-buf scenario is rather unlikely.
> 
> That was unfortunately only added quite recently and is currently backported
> to older kernels.
> 
> > I guess worst case we could add a cookie struct to dma_buf_pin that you
> > need to pass to dma_buf_unpin, and wherein we can capture a backtrace. Or
> > maybe implement that in ttm even. Otherwise I don't have good ideas.
> 
> I was thinking about something similar for ttm_bo_pin().
> 
> BTW: How would I do that? I know that dump_stack() prints the current stack
> trace into the system log, but how would I get this as string?

stack depot, not stuff it into a string. stack depot is a lot more
efficient and capturing backtraces, since it de-dupes and hashes and all
you need is a pointer iirc. linux/stackdepot.h for interface, I think we
recently gained a few more users of it in drm. It's _really_ nifty.
-Daniel


> 
> Thanks,
> Christian.
> 
> > -Daniel
> > 
> > > Christian.
> > > 
> > > > -Daniel
> > > > 
> > > > > Harry
> > > > > 
> > > > > On 2021-11-04 08:51, Christian König wrote:
> > > > > > Hi guys,
> > > > > > 
> > > > > > adding the usual suspects which might know that of hand: When we do a KMS page flip, who keeps the reference to the BO while it is scanned out?
> > > > > > 
> > > > > > We are running into warning backtraces from TTM which look more than odd.
> > > > > > 
> > > > > > Thanks,
> > > > > > Christian.
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
