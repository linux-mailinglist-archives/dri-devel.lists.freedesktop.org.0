Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE33D44974C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 15:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BE16E9A3;
	Mon,  8 Nov 2021 14:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0039E6E488
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 14:59:25 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b12so27401481wrh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 06:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=S+RzlQF0wFoIQgC5v/TwQIZ9+duGCqlZYcz5HSc4X/M=;
 b=U0845iBSN2FBOm0A4s1eLW65e98XvhIQlCkiQ3Kocou2jGgrRPFZbR0qHa1DAKkpth
 4O8ReRJcn/KVFLpsF8mvMxRSa+DTTgcRE2LzBQOS3wMcNz3efpTwewZL3B5vb3JlSyLP
 zmddos+Va2MiVIhOIMIXYigYfwJknD+zhOTKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=S+RzlQF0wFoIQgC5v/TwQIZ9+duGCqlZYcz5HSc4X/M=;
 b=yxQ+nGe5Cs7hzl0vvbpOhhEZoCPm3DRh6WFAUxyaLAUAcSBdjLW0ZfX8B0CdPTubCX
 f/2ekZGqhM77nBroLAZfiu328nExNx7BCVgZEdxCGVI15NApeepfNAk0xj1rzGDrLLTK
 nBPITRSG43Lelvd3jT+pK5rdpUvcK6DR7mV2E2jYR+WN0cPt2uzJdQa/odgAQrPZqvvZ
 DmDQPJfM1/ZSXxUdDm5Ljcy7zymCHyQMeEoqkECj+1EaJc88llwCuY02NRS4w3FteLg6
 2m2UEc6C9DuADX9QD8mZuCCgOUUwmKXYgHhqi22Ic2pCQNP1zVH6kw8LF5gOALCNF2wE
 Ki/A==
X-Gm-Message-State: AOAM530XxQUG1/5mAGuAVrabP6l3ZOebsW+aZL6oOFtS2j7aba+ufcFd
 rSQIlP+x4HBxxIXAAduRNVo8mw==
X-Google-Smtp-Source: ABdhPJyJ9YHyQsRcLboR7A1C2i9Y9jYI28l4sF5U5ca2SpxnlsdwtY6GBa4TvhkkUploF3We4Zdhng==
X-Received: by 2002:a5d:6d01:: with SMTP id e1mr391983wrq.157.1636383564582;
 Mon, 08 Nov 2021 06:59:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j11sm3013349wrt.3.2021.11.08.06.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:59:24 -0800 (PST)
Date: Mon, 8 Nov 2021 15:59:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: Questions about KMS flip
Message-ID: <YYk7SkflDx8ToqYG@phenom.ffwll.local>
References: <579d0f44-bb85-11b2-d326-35a0b7c5d0de@amd.com>
 <5c242319-ade3-5621-6429-f77b17c34de5@amd.com>
 <YYV0W1CxT5torU7u@phenom.ffwll.local>
 <64e70779-7c33-7849-aa29-aeaee4a89005@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64e70779-7c33-7849-aa29-aeaee4a89005@amd.com>
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

On Mon, Nov 08, 2021 at 08:44:24AM +0100, Christian König wrote:
> Am 05.11.21 um 19:13 schrieb Daniel Vetter:
> > On Thu, Nov 04, 2021 at 12:44:34PM -0400, Harry Wentland wrote:
> > > +Nick
> > > 
> > > It looks to be the old drm_plane_state->fb holds that reference. See dm_plane_helper_cleanup_fb() in amdgpu_dm.c.
> > Yup plane state holds reference for its entire existing (well this holds
> > in general as design principle for atomic state structs, just makes life
> > easier). And the plane state is guaranteed to exist from when we first pin
> > (prepare_fb plane hook) to when it's getting unpinned (cleanup_fb plane
> > hook).
> > 
> > Out of curiosity, what's blowing up?
> 
> The TTM pin count warning. What happens is that we try to free up a BO while
> it is still being pinned.
> 
> My best guess is that some DMA-buf client is doing something wrong, but it
> could of course also be that the BO was pinned for scanout.

We check in dma_buf_release whether there's anything left over, so I think
the dma-buf scenario is rather unlikely.

I guess worst case we could add a cookie struct to dma_buf_pin that you
need to pass to dma_buf_unpin, and wherein we can capture a backtrace. Or
maybe implement that in ttm even. Otherwise I don't have good ideas.
-Daniel

> 
> Christian.
> 
> > -Daniel
> > 
> > > Harry
> > > 
> > > On 2021-11-04 08:51, Christian König wrote:
> > > > Hi guys,
> > > > 
> > > > adding the usual suspects which might know that of hand: When we do a KMS page flip, who keeps the reference to the BO while it is scanned out?
> > > > 
> > > > We are running into warning backtraces from TTM which look more than odd.
> > > > 
> > > > Thanks,
> > > > Christian.
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
