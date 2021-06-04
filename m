Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E165139B59E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 11:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEF26F5E9;
	Fri,  4 Jun 2021 09:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72516F5E9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 09:12:52 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id c5so8520298wrq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=chpk3EQ2hh64dp2WTIOzdpp1txr9bBbfzKuE+CVepDQ=;
 b=OTDC9Dxwwe3JF9gDsQwkUdFwz9Fz/39AZMyVFfV+BKv4STDDZWO4A5MoiANkSW2wzv
 nzUm/BZcIQ+yYfcSUVOrAadWYFILId3jWrQd2vWIlcL+Fxw44r5+CyQRa78F2ijvpFMf
 g2ydOeGcVMRhK6EwfB9dERrX9b9NimRKmYhoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=chpk3EQ2hh64dp2WTIOzdpp1txr9bBbfzKuE+CVepDQ=;
 b=DglrI3zhOBoCj9eFSESHVnUODgm8MAb6Ii5Rc35rpZpch0E0HPlfC9U5G/3XxzEp9p
 6q/MooxVz18/2a3P9BJ+7zCjfANdsG/Zyh1avuLtHx3LzZ+jBUWO69llC8MBIA09V9WQ
 K+tNkn4yUk4kUAuop7iycq7zBa99ZvBIZ3Z2tx9CjoqGNNyjwQuE/uAMIE1R7f5bsV4P
 B+uiY+wr+j8lc8V27sVpYEXhp8kplvduKOs3yTSzAhi5B4cdXe9FTBc+JQXP5Dl9clK+
 2Pdqc6LlYqzhpcjm8XJ8xnpbdnCtEF4RTYA8gii5jOHW0jHnO8UmZ77MrFJGCb2gA/iZ
 deDg==
X-Gm-Message-State: AOAM533/mot0EbYLWXHZmAPDzS/ROHb3z2mMSaUUqibdhTFiq5FfPh8u
 UFOB6zGHOtD5piolHc8GL5uQ3OHfp25X6A==
X-Google-Smtp-Source: ABdhPJy5fEKV+1sE998yeP/bHOn3KEA0UDF+I7Wk8MJkpzDWnBoHnohVMwd7SXZ1nV0GFc3zGYpKXg==
X-Received: by 2002:adf:df09:: with SMTP id y9mr2837085wrl.108.1622797970411; 
 Fri, 04 Jun 2021 02:12:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l10sm3968219wrs.11.2021.06.04.02.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 02:12:49 -0700 (PDT)
Date: Fri, 4 Jun 2021 11:12:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>
Subject: Re: [Intel-gfx] Merging TTM branches through the Intel tree?
Message-ID: <YLnuj0jmF8q05pta@phenom.ffwll.local>
References: <a29eaef9-2457-1393-6757-40956811daf8@linux.intel.com>
 <a6965639-acf6-b5f5-482c-2715e7fa69d4@amd.com>
 <b4c18e45-98c9-ce7f-b22c-c00c795844c2@shipmail.org>
 <baf4f828-76c8-6b47-5bba-9b9c8e7b307b@amd.com>
 <YLfQplT8H6PdCCLX@phenom.ffwll.local>
 <c50fa98f-3735-fe04-d3f9-8a7a08a7562e@linux.intel.com>
 <CAKMK7uE+fB_+UG668O=QMXwQ9_Xb--KhzehT77HLfBoWve-zLg@mail.gmail.com>
 <68e6057c-df17-64ce-3116-cd5e79578795@amd.com>
 <a3f789a0-9e75-280a-7602-4728738024eb@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3f789a0-9e75-280a-7602-4728738024eb@linux.intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 11:01:40AM +0200, Thomas Hellström wrote:
> 
> On 6/4/21 9:51 AM, Christian König wrote:
> > Am 03.06.21 um 09:36 schrieb Daniel Vetter:
> > > On Thu, Jun 3, 2021 at 8:50 AM Thomas Hellström
> > > <thomas.hellstrom@linux.intel.com> wrote:
> > > > 
> > > > On 6/2/21 8:40 PM, Daniel Vetter wrote:
> > > > > On Wed, Jun 02, 2021 at 11:48:41AM +0200, Christian König wrote:
> > > > > > Am 02.06.21 um 11:16 schrieb Thomas Hellström (Intel):
> > > > > > > On 6/2/21 10:32 AM, Christian König wrote:
> > > > > > > > Uff I'm just waiting for feedback from Philip to
> > > > > > > > merge a large patch
> > > > > > > > set for TTM through drm-misc-next.
> > > > > > > > 
> > > > > > > > I'm pretty sure we will run into merge conflicts if you try to push
> > > > > > > > your changes through the Intel tree.
> > > > > > > > 
> > > > > > > > Christian.
> > > > > > > OK, so what would be the best approach here?, Adding
> > > > > > > the TTM patches to
> > > > > > > drm-misc-next when your set has landed?
> > > > > > I think I will send out out my set to Matthew once more
> > > > > > for review, then
> > > > > > push the common TTM stuff to drm-misc-next as much as possible.
> > > > > > 
> > > > > > Then you should be able to land your stuff to
> > > > > > drm-misc-next and rebase on
> > > > > > the end result.
> > > > > > 
> > > > > > Just need to note to David that drm-misc-next should be
> > > > > > merged to drm-next
> > > > > > before the Intel patches depending on that stuff land as well.
> > > > > Other option (because the backmerges tend to be slow) is a
> > > > > topic branch,
> > > > > and we just eat/resolve the conflicts in both drm-misc-next and
> > > > > drm-intel-gt-next in the merge commit. If it's not too bad (I haven't
> > > > > looked at what exactly we need for the i915 side from ttm in detail).
> > > > > 
> > > > > But also often figuring out the topic branch logistics takes
> > > > > longer than
> > > > > just merging to drm-misc-next as the patches get ready.
> > > > > -Daniel
> > > > Daniel: So the thing we need to get into TTM is the iterator-based
> > > > move_memcpy which is more adaptable than the current one and needed to
> > > > support non-linear lmem buffers, some bug-fixes and minor changes to be
> > > > able to keep our short-term-pinning while on the LRU. A necessary evil.
> > > > 
> > > > Christian: it looks like you have landed some TTM changes already, in
> > > > particular the &bo->mem -> bo->resource change which is the main
> > > > conflict I think.
> > 
> > Yes, I thought that pushing this with Matthew rb should solve at least a
> > bit of the conflict.
> > 
> > > > Is the 10 patches self-allocation series the main
> > > > remaining part?
> > 
> > Yes, exactly. I only need Matthew's, Daniel's or your ok and I'm good to
> > go as well
> > 
> > > > That will probably cause some conflicts with already
> > > > pushed i915 TTM setup code, but otherwise will not conflict with the
> > > > rest of the TTM code I think, which should make it possible to bring in
> > > > our TTM changes after conflict resolution with what you've already
> > > > pushed. The memcpy code is pretty self-contained.
> > > I think in that case topic branch on top of drm-next (once the ttm
> > > bits we conflict with are there) is probably best, and then pull that
> > > into drm-misc-next and drm-intel-gt-next. Merge window freeze is also
> > > approach, so without topic branch we'd be stuck until like -rc2 when
> > > drm-next reopens. I guess Maarten can do the topic branch logistics in
> > > drm-misc.git for this.
> > 
> > That approach sounds good to me as well.
> > 
> > The amdgpu branch had some merge conflicts as well, but nothing we
> > couldn't fix.
> 
> OK, so this is going to be a little tricky, I guess.
> 
> From what I can tell, the memcpy TTM stuff is resolved locally and can be
> merged to drm-misc-next immediately. It might have a very minor conflict
> with your 10 patches I think, if any.
> 
> Your 10 patches will conflict slightly with current drm-intel-gt-next I
> think.
> 
> Remaining intel patches will conflict only with current drm-misc-next.
> 
> So We could have pull order
> 
> - drm-misc-next up to bot not including your 10 patches,
> - drm-intel-gt-next
> - drm-misc-next from your 10 paches and onwards,
> - Intel's ttm enablement topic branch.

If it's just slight conflicts then I wouldn't bother with careful merge
order. Because if we do this we can get around to the i915 ttm topic
branch only when we're back to -rc2.

We can also validate any conflicts in drm-tip easily before they get baked
in in drm-next.

So I'd just go with
- drm-misc-next gets those 10 patches from Christian and the memcpy prep
  stuff from you, gets send to drm-next (that's probably the last feature
  pull for 5.14 anyway, maybe another one)
- drm-intel-gt-next gets send to drm-next
- topic branch with remaining i915 ttm work that's in flight on top of
  drm-next and we pull that into drm-misc-next and drm-intel-gt-next as
  needed

Only thing we need for this is a few days of testing to make sure any
conflicts between -misc-next and -gt-next are fully validated.

Adding Dave for that so he knows too.

> Whether I push the ttm memcpy stuff before your 10 patches or after
> shouldn't really matter except it might take some time to resolve the 10
> patches - drm-intel-gt-next conflict in drm-tip.
> 
> So OK to merge the memcpy stuff to drm-misc-next now or do you want me to
> hold on?
> 
> I'll take a look at what's remaining to review in your series. I guess it's
> in our interest that both these series get merged asap.

Yeah that part I think makes sense.
-Daniel

> 
> /Thomas
> 
> 
> 
> > 
> > Christian.
> > 
> > > -Daniel
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
