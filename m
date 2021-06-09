Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631173A1806
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 16:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667696E0D0;
	Wed,  9 Jun 2021 14:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6476E0D0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 14:54:13 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e11so15640355wrg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=CLK+ljtm5w4gBiYKgr8EQqyQuRm+0J5cmvR4suUCFEI=;
 b=iLj9Q7xwhDFX12eJGc6TyOzHuwRuGT+U2rZwcyt3aIz/e0jkO53ibWrdatj88s68pn
 jHTpWS/i9jANsFWQjlzz/Yye22j2+Apj4/fHOqHc4Qm4Xs8ZoLgSOy4iCSgJ0a9S8oUc
 ohubPAyB9oCFDs2btO5+S3RY77efIIevIFwTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CLK+ljtm5w4gBiYKgr8EQqyQuRm+0J5cmvR4suUCFEI=;
 b=XP/UETtgbhvHhwCs2KX5i/wqO9pBteXXsbJ3N61hiZQz/s6W1CL/3k/lX+HL514uf7
 0BVzkMNDVWq/04wa6g9B5eK0p/Ezx47YdWcf8BQGlGsgi9BaegrS65PLK8sF5oDOsBOg
 fFxhN5rQAGCQ0X2XCvlu85kbabsk1RvFyKEqX9ZiqNuhgSjqmE1q8cLLJfNSEgZSigda
 qBJrQILJufe8IY17EeEKit09FRTrSShyZbqHcgfb2v8jNdq+kCUEqFQhf9QvJQ85eWGd
 GDMaWWzQoa9O5FwZqLZM6J8Qlf91Ogwq82wL/zxasMNTfRxMbvHK92xjBQIKAZW76myp
 qWsg==
X-Gm-Message-State: AOAM532gQ/U22qeDl5+0Kgimb1YzmCMGqFIYs5c+SP4hlMcRtA5XwP8b
 AXZCj5nqpLgi3kXbCIzsjAF1ug==
X-Google-Smtp-Source: ABdhPJzL/RDtqunEEcuDF0SoWdQfET+F04iGVSihasxm/ws/rH8G7pS1fTe+M0lAZYbMvkt2SQLfcg==
X-Received: by 2002:adf:e54f:: with SMTP id z15mr202216wrm.141.1623250452461; 
 Wed, 09 Jun 2021 07:54:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n7sm5937862wmq.37.2021.06.09.07.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 07:54:11 -0700 (PDT)
Date: Wed, 9 Jun 2021 16:54:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 0/9] Prereqs for TTM accelerated migration
Message-ID: <YMDWEluN8WEke/vF@phenom.ffwll.local>
References: <20210609063436.284332-1-thomas.hellstrom@linux.intel.com>
 <YMCqm48rZIKLYk/s@phenom.ffwll.local>
 <9f38fc28-15fb-2736-ba01-503821fdbe54@linux.intel.com>
 <4d570a5b-0ea7-71ab-5082-e67f0cd668a7@intel.com>
 <1cd6b04d-8928-14b3-a63d-c9ac2e81fcca@linux.intel.com>
 <99ff0d9f-9bd4-c27d-45a5-a66d2ad9064f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99ff0d9f-9bd4-c27d-45a5-a66d2ad9064f@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 09, 2021 at 04:35:57PM +0200, Thomas Hellström wrote:
> 
> On 6/9/21 3:08 PM, Thomas Hellström wrote:
> > 
> > On 6/9/21 2:20 PM, Matthew Auld wrote:
> > > On 09/06/2021 13:16, Thomas Hellström wrote:
> > > > 
> > > > On 6/9/21 1:48 PM, Daniel Vetter wrote:
> > > > > On Wed, Jun 09, 2021 at 08:34:27AM +0200, Thomas Hellström wrote:
> > > > > > A couple of patches from Chris which implement pipelined
> > > > > > migration and
> > > > > > clears by atomically writing the PTEs in place before performing the
> > > > > > actual blit.
> > > > > > 
> > > > > > Some ww utilities mainly for the accompanying selftests
> > > > > > added by Thomas,
> > > > > > as well as modified the above patches for ww locking-
> > > > > > and lmem support.
> > > > > > 
> > > > > > The actual hook up to the i915 ttm backend is being worked on and not
> > > > > > included yet, so this is considered to be an early
> > > > > > review opportunity.
> > > > > > 
> > > > > > v2:
> > > > > > - A couple of minor style fixes pointed out by Matthew Auld
> > > > > > - Export and use intel_engine_destroy_pinned_context() to address a
> > > > > > ls   CI warning / failure.
> > > > > Just to check my understanding of the plan: These are the new windowed
> > > > > clear/blt functions which we plan to use everywhere, because
> > > > > less nasty
> > > > > locking implications? And the clear/blt we currently have in
> > > > > upstream will
> > > > > be replaced?
> > > > 
> > > > Yes. These are for LMEM clearing and migration. It looks to me
> > > > like the other ones we have in upstream are actually unused
> > > > except for selftests. We're actually using CPU clearing for now.
> > > > 
> > > > > 
> > > > > If so would be nice if this patch set includes that
> > > > > replacement work (I
> > > > > think right now all we have is the clear for lmem),
> > > > > including updating of
> > > > > selftests and stuff like that. Just to avoid having two ways to do the
> > > > > same thing in the driver.
> > > > 
> > > > OK, I'll have a look at stripping the existing code. If we need
> > > > it moving forward, we can always re-add.
> > > 
> > > Some low hanging fruit would be all the client_blt stuff which can
> > > for sure be deleted now.
> > 
> > What has the client_blt stuff been used for?
> > 
> > In any case, I need 25 commits for commit access to be granted.
> > 
> > /Thomas
> > 
> > 
> Series on trybot now. It's the dg1 live memory_region selftest that changes
> sligthly to use the new migration fill blt.

Thanks a lot for taking care of this!
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
