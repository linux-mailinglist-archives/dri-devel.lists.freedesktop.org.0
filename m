Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3E2984536
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 13:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F6210E88E;
	Tue, 24 Sep 2024 11:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="cxaH2hm0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667B010E892
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 11:51:48 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2f77fe7ccc4so51715881fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 04:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727178706; x=1727783506; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j5Sg1xu00ac914KvYaBgVFfpg+QdE6LOenp8uycdRIc=;
 b=cxaH2hm05uVyjcJPUxxOPzKqvUdUfNbhIu9wDE5PZ9+0zHzI1sOpW+cPcyCwmgcPZw
 apcTbgG8TqeB0ecjYWUXJUI7KijJQKLWqNF7rrqYLB5mGkk6VLi2kvV7tyDKdredkAXA
 ijaFNesgyrjnfNt1+jp7tF+qa9Vgh63DSDSQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727178706; x=1727783506;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j5Sg1xu00ac914KvYaBgVFfpg+QdE6LOenp8uycdRIc=;
 b=ooWbnwimCWz8/YcNLpQgsIRhjQ9hsbaPDF9VYjySSIm/8Vk4CbxpfkJwAfekT9Kbc9
 J/Ac4JBB6V8rekFrN+0QfFhCC7weA42kNoM2Wk1em6nmuyU7jb92QAv1bnXv9bqerBsJ
 nue0F1Bd2SlGZB4g43GOwmE5meWKsJ35x/ROVfsihkh+gj3/Hc9idU6mb73dtGpAMbhA
 m8WCbB0WxRNZuQxLw8wgMrq1zBd8diPNBF6ozCb+ZsCnQzNRIkr0x2tlAw11oxvgBlbq
 pQ3LbDYTSOq4IKg1i4Zz1PmrdeBH2tqStynpyZnf2BmfccY7DC0hrO60rUIJqbhSEqgf
 1HMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE8VgeBHA4tO8ZbS+839aGCtVFBa3G2BSGnA3xi9jxBS9ysFBOoSBhLbv5sMC1IIJx7wDkONP3Tjw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlfpSkm3uUDT1luTOIgun3sGGzYbac3mjCaoEn3DGlKg7Udhk5
 EkfD8IwF9qxPdlnOZ2ws1nPCbPIpRjD8i9eHHQMDUOpYVE8l3j9E51DI7sufe4k=
X-Google-Smtp-Source: AGHT+IHyOMspr60vH80D0irmgDz0HF04iiepmTwjpL26y5GL25/8xcH7v9+GVtxBnKT9XjmoxKFW9w==
X-Received: by 2002:a05:651c:221a:b0:2f3:aed8:aa9b with SMTP id
 38308e7fff4ca-2f8d76d29bdmr1390711fa.5.1727178706495; 
 Tue, 24 Sep 2024 04:51:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4c500dsm656463a12.61.2024.09.24.04.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 04:51:45 -0700 (PDT)
Date: Tue, 24 Sep 2024 13:51:43 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, Sima Vetter <sima@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.12-rc1
Message-ID: <ZvKnz7QzEe3jMbaH@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>, Sima Vetter <sima@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <CAPM=9txujwc-GoV6qB1DpKjbDi-8uDcJLnJFSY4OBgPu=ZAVBw@mail.gmail.com>
 <CAHk-=wiehYLXmbf8eZ080n7LEeS9=O5kEpGKjeP-01dj0EAYbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiehYLXmbf8eZ080n7LEeS9=O5kEpGKjeP-01dj0EAYbA@mail.gmail.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Thu, Sep 19, 2024 at 10:12:39AM +0200, Linus Torvalds wrote:
> On Thu, 19 Sept 2024 at 09:48, Dave Airlie <airlied@gmail.com> wrote:
> >
> > There are some minor conflicts with your tree but none seemed too
> > difficult to solve, let me know if there is any problems on your end.
> 
> Christ. One of them is due to you guys being horrible at merging.
> 
> Your tree had
> 
>     drm/xe/gt: Remove double include
> 
> which removed (surprise surprise) a double instance of
> 
>   #include <generated/xe_wa_oob.h>
> 
> but then in merge commit 4461e9e5c374 ("Merge v6.11-rc5 into
> drm-next") it got added back in!
> 
> Please be more careful with your merges. You can't just look at the
> file contents, you have to look at the actual history of it to see
> what the *cause* of the conflict is.

Uh yeah not sure how I managed to butcher this one. I do check the history
with gitk --merge and then the result by both looking at the merge diff
and the new --remerge-diff output, and that merge looks like nonsense in
all but the last one. Which means I was asleep at the wheel when I did
that :-/
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
