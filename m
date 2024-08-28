Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35204962931
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 15:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E81E10E51B;
	Wed, 28 Aug 2024 13:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XeCviCSF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDB910E52F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 13:47:25 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4280c55e488so4032225e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 06:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724852844; x=1725457644; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6CtnrKzfAk9H4YuLRTraUVq3RArxarczw7rPkgsodyo=;
 b=XeCviCSF8jkkE5X5AZGmoeOlYjUzU67p388wB8aquUVo1O/KC2MBhnk5mzkHCQVz42
 HXsomIuR/F7BXOqZIRhNAjdXnjK2hnMUzeRRQC/rGmm9IlyK9oV+TlKilFEc2LNJ03QQ
 Zv9hKSLhsiOp6ujQ21hBqkYAPVYFZxeQ+/eDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724852844; x=1725457644;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6CtnrKzfAk9H4YuLRTraUVq3RArxarczw7rPkgsodyo=;
 b=h5dJPnGzj1cFshjH+/6d3WWCfXaj+Kr1qlN3a0aJzfh+qDWOyoCsdXWAYnRD81/7zP
 h7d81M1tFD27aoPjn0vbLUcced8Js4ttYcIrPqn5lQu+MgHBfDbtyJrFaOEaegP5sqG/
 Q6zl11etiR95TY0fZE64fnWfeOdr8NKpYBYOfDX/5tmhvsEv4qLL/YeWYFuHv7K35T54
 +oKLyKd770JH3p/Z9+nsh5r6dnDPbOMFBnpy4gECbfWZhkt9e20IcH01BpJ9f+Lv5Q9T
 yHopIx1epPCiiVABcRwsq6SLFNKSDtBsDbVpEDCeLK8ifsR/BxXMyjUwaJdK+avIyRHM
 kiEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC83vcGzP2jYMrIJhNnuLbvLu47fnsMK0CbfzS65dYEee7KowEtRg2il/6SNFid8fQiEOq5WUDywY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+xxfMmiBYqXzlVdiASzrqiQtpSBTq6igc6fp70y34pmdkBAGg
 ZZM37yUGIQSBlwDmdxTWdUutKx2HLJjAsP8MJjIoBDQkdSXkBfLKfeqtd99fE/0=
X-Google-Smtp-Source: AGHT+IEkP1L92PC6Ka92ChqIF8AHe7DGEoFq7U075lkC3lrM96vIVK5Qx05SmJz3Gz+wKfL+QAxNxw==
X-Received: by 2002:a05:600c:1ca6:b0:424:8dbe:817d with SMTP id
 5b1f17b1804b1-42ba56a9afdmr15048625e9.10.1724852843974; 
 Wed, 28 Aug 2024 06:47:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba6425a13sm22314635e9.42.2024.08.28.06.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 06:47:23 -0700 (PDT)
Date: Wed, 28 Aug 2024 15:47:21 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v3 00/15] CCS static load balance
Message-ID: <Zs8qaZftGbq7Ls00@phenom.ffwll.local>
References: <20240823130855.72436-1-andi.shyti@linux.intel.com>
 <Zs4NaUgcDhcBb4Ok@phenom.ffwll.local>
 <Zs7dv57piSIj3Og4@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zs7dv57piSIj3Og4@ashyti-mobl2.lan>
X-Operating-System: Linux phenom 6.9.12-amd64
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 28, 2024 at 10:20:15AM +0200, Andi Shyti wrote:
> Hi Sima,
> 
> first of all, thanks for looking into this series.
> 
> On Tue, Aug 27, 2024 at 07:31:21PM +0200, Daniel Vetter wrote:
> > On Fri, Aug 23, 2024 at 03:08:40PM +0200, Andi Shyti wrote:
> > > Hi,
> > > 
> > > This patch series introduces static load balancing for GPUs with
> > > multiple compute engines. It's a lengthy series, and some
> > > challenging aspects still need to be resolved.
> > 
> > Do we have an actual user for this, where just reloading the entire driver
> > (or well-rebinding, if you only want to change the value for a specific
> > device) with a new module option isn't enough?
> 
> Yes, we have users for this and this has been already agreed with
> architects and maintainers.

So my understanding is that for upstream, this only applies to dg2,
because the other platforms don't have enough CCS engines to make this a
real issue.

Do we really have upstream demand for this feature on dg2 only?

Also how hard would it be to make these users happy with xe-on-dg2 in
upstream instead?

> Why are you saying that we are reloading/rebinding the driver?

That's the other alternate solution.

> I'm only removing the exposure of user engines, which is
> basically a flag in the engines data structure.
> 
> > There's some really gnarly locking and lifetime fun in there, and it needs
> > a corresponding justification.
> 
> What locking are you referring about?
> 
> I only added one single mutex that has a comment and a
> justification. If you think that's not enough, I can of course
> improve it (please note that the changes have a good amount of
> comments and I tried to be aso more descriptive as I could).
> 
> When I change the engines configurations only for the compute
> engines and only for DG2 platforms, I need to make sure that no
> other user is affected by the change. Thus I need to make sure
> that access to some of the strucures are properly serialized.
> 
> > Which needs to be enormous for this case,
> > meaning actual customers willing to shout on dri-devel that they really,
> > absolutely need this, or their machines will go up in flames.
> > Otherwise this is a nack from me.
> 
> Would you please tell me why are you nacking the patch? So that I
> address your comments for v4?

So for one, this is substantially more flexible than the solution merged
into xe. And the patch set doesn't explain why (the commit messages
actualy describe the design xe has).

That does not inspire confidence at all.

Second, I don't think anyone understands the entire engine/ctx locking
design in i915-gem. And the fix for that was to make as much as absolutely
possible immutable. Yes the implementation looks correct, but when I
looked at the much, much simpler xe implementation I'm pretty sure I've
found an issue there too. Here I can't even tell.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
