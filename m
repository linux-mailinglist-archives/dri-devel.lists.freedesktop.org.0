Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7063992B4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25146ECED;
	Wed,  2 Jun 2021 18:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BFD6ECED
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 18:40:42 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso4360502wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 11:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XCbkv2ZeII/q7rgZZjd/TMzqZkv1dniRLCwHb/ruWrM=;
 b=LFIg+N5X1BpgOwrSynApuVQQ8MUlyc70PHTHE0G/VC8tc2+KFIoU3EeMYLkm09GfyU
 J7vnz9g35akOJni8TX/+bf/TJND0lb+AtxzjWJ07IjjZ1pMLOfOXa4XCC7FtsFmfIuKb
 uW04jHBAY/OzdiNwfSBkP2Wr7U+S2mfM+y+ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XCbkv2ZeII/q7rgZZjd/TMzqZkv1dniRLCwHb/ruWrM=;
 b=c4LOZdhGdkOOVA5VWXwridpyfVMXxqYteul6lwW5GJkxWJ826ktismPrm1CyH9CbEN
 d6RZuqPd2enLx5wkNgVu3LB2O50LaIAfENO+1LaTngFtgdZsdk+ojRyVAcvel1HJYPwQ
 o/bDprCbl2CeSyzbhUy+6y/MBak3u5GLD2wgdhv4e8xdD2JAhaLYrn5jXJYegqoVDCPJ
 BauQLLzYoXC53N79x3/RVT2gVmE/4mzZaM1zC0uzuXWUoBqmbsfsC8f2yCDRz80uObEV
 88kmekpJfWMkzo58dJlTrATnQ5gPFMVwhovHGxVdHRYt6UnKvAJGd+u0tRDehbm2SO/8
 WUOQ==
X-Gm-Message-State: AOAM530oQpgDnPZWcWuiVUx2dAWkZmP0WdHNbZcCZraRRiIh2sVTdITw
 3S6iLHjJAKSycrjwGRkXuFN2ag==
X-Google-Smtp-Source: ABdhPJyzL8BuRJ9j+Q0W3Op82rXamCB1aKUpBz0VNJ+19h0qzvS8Xs/52XLazljik2mhjBqGkiK/FA==
X-Received: by 2002:a7b:cbc2:: with SMTP id n2mr33387026wmi.69.1622659241081; 
 Wed, 02 Jun 2021 11:40:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q11sm523267wmq.1.2021.06.02.11.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:40:40 -0700 (PDT)
Date: Wed, 2 Jun 2021 20:40:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Intel-gfx] Merging TTM branches through the Intel tree?
Message-ID: <YLfQplT8H6PdCCLX@phenom.ffwll.local>
References: <a29eaef9-2457-1393-6757-40956811daf8@linux.intel.com>
 <a6965639-acf6-b5f5-482c-2715e7fa69d4@amd.com>
 <b4c18e45-98c9-ce7f-b22c-c00c795844c2@shipmail.org>
 <baf4f828-76c8-6b47-5bba-9b9c8e7b307b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <baf4f828-76c8-6b47-5bba-9b9c8e7b307b@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 11:48:41AM +0200, Christian König wrote:
> Am 02.06.21 um 11:16 schrieb Thomas Hellström (Intel):
> > 
> > On 6/2/21 10:32 AM, Christian König wrote:
> > > Uff I'm just waiting for feedback from Philip to merge a large patch
> > > set for TTM through drm-misc-next.
> > > 
> > > I'm pretty sure we will run into merge conflicts if you try to push
> > > your changes through the Intel tree.
> > > 
> > > Christian.
> > 
> > OK, so what would be the best approach here?, Adding the TTM patches to
> > drm-misc-next when your set has landed?
> 
> I think I will send out out my set to Matthew once more for review, then
> push the common TTM stuff to drm-misc-next as much as possible.
> 
> Then you should be able to land your stuff to drm-misc-next and rebase on
> the end result.
> 
> Just need to note to David that drm-misc-next should be merged to drm-next
> before the Intel patches depending on that stuff land as well.

Other option (because the backmerges tend to be slow) is a topic branch,
and we just eat/resolve the conflicts in both drm-misc-next and
drm-intel-gt-next in the merge commit. If it's not too bad (I haven't
looked at what exactly we need for the i915 side from ttm in detail).

But also often figuring out the topic branch logistics takes longer than
just merging to drm-misc-next as the patches get ready.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
