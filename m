Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616F5B2AE7C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 18:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF0610E4A8;
	Mon, 18 Aug 2025 16:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="VuKzKGGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655DF10E4AA
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 16:46:57 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-30ccea8f43cso3240178fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 09:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1755535616; x=1756140416; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FXyiB6hArPVvWf92xe0IOfWpU3yyicTL/mf5Bbgn5dg=;
 b=VuKzKGGCI/VNw6jzMRUEvLPXW+jOfgWgA6v5ySzbjzcdjg9WYxXIeUoo5Jfflv1xDE
 qALlif217g7LruvpepeMUcWqyd/S+FVec6b0Ah8LO0Vi0TdXjHgQWlFg0wGNVXkNEIfJ
 hnfRxAYbB46Z/MAIbmCrhwJvLw795Kd6Dn2oh9Zh5lXMwVK7iZmKA9eG/7sJ1BYY1Bld
 NWSzoAd5GL6QUToaQifC5NOTbKRX+wo1t1Vr3RHJe6wY7b0HrtIzOUqfj84GIWf2xpri
 EfaZgZNc2SjN2RSrsQVnnDSYluVoQL5D8xRTJCF6OyIWNKLj5d+EimEIw42z+e4zbc7O
 Kx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755535616; x=1756140416;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FXyiB6hArPVvWf92xe0IOfWpU3yyicTL/mf5Bbgn5dg=;
 b=tC8+BVt3c86lZtYUOx5q09CGiMmw4NrXK0Bpb6bxneSXj40myW+QbrfKvdUjWE5tDl
 pqIVzeQMiF4i4ZRoS5fplBfFtjBiRswWISbDn4jhZXVR1cVzYLJq6mhKsDgV21Bvhk2G
 BkfLVoiYFkg43zRwBCpoMVH2hm+T6/1SdYo1QDVeUWLBZjTHH+R9VEJyOR6liFEuCPZ/
 qsPfr0OL8/mQRkHzMNtx+2lCgJouxiSU5kEoEDjRhK4WL0H0ySOaFAznPORX4Iugz6Vx
 X9MJobKdSaHpEPLWgE/l4zIk3N63yjtKEEYklDj9tJgyi8W+2S/ljOSns57/d3Mz5K81
 M85A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3yWv7fX6cfALmeo/UcsewPkoC/gp5WftU+9PGTcnH+22UtuWuAqDszd07FbHP6E5ZJXj2PTwW2lc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU4wK8fgycmbJkdSVKr2SjWfF8y4tdHV37N9twM6iNPw8v5nOH
 aHj7R8VfeRxU1PonEQ2mo4e5ZgafKmaEVp1+UuIsn1sH6FCB0CJIcM4+clZHYuQ3IkA=
X-Gm-Gg: ASbGncs+tb1AqUWwiKKtU7YhgU0MibeUFYaXv0rnlrB+1ZjK8lqSVxgyMebJEy+UZAg
 EiEIpV56dfe9iMMpcqIAhM2IGvvqhhIUl3atmqKBRqCtuDtkJbcfwXI3WH0rO4KjsDzlbzoa8nd
 gwqrzv0QOdiwaMDSj7ULqyFgWWveI4NJUd0OVEtJVBo/9aEftxOFL8fLTKExkGOrgyrYuPBns9U
 1Zt9AehXds93RtlVIB48Li7M7guhym4z0PnRb4Ut097QRo55P8EAl4sfPsE1ATOIJo0ufZTCJa8
 3BOAzyyzVwM41Z87cqxSwsG0DAQExdB2d2Li1Ys6/b7niB2A6vcxBsuGmO3PkOmFkvBuPCAX
X-Google-Smtp-Source: AGHT+IFvKK7UXZdTHshbJKUB2QVJXZtwhaBYoKAz5pKipDZGTWMsdrO+WMZc89+L2egtQ6zzR0Akiw==
X-Received: by 2002:a05:6870:cc86:b0:30b:ae4c:2e82 with SMTP id
 586e51a60fabf-31108286d72mr194239fac.12.1755535616469; 
 Mon, 18 Aug 2025 09:46:56 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-310ab952d79sm2706690fac.15.2025.08.18.09.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 09:46:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uo30Z-00000004RPM-04Ii;
 Mon, 18 Aug 2025 13:46:55 -0300
Date: Mon, 18 Aug 2025 13:46:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 1/6] mm/mmu_notifier: Allow multiple struct
 mmu_interval_notifier passes
Message-ID: <20250818164655.GJ599331@ziepe.ca>
References: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
 <20250809135137.259427-2-thomas.hellstrom@linux.intel.com>
 <20250818160726.GH599331@ziepe.ca>
 <aKNT8GUu0r3i4Ikq@lstrano-desk.jf.intel.com>
 <20250818163617.GI599331@ziepe.ca>
 <aKNYUaPS0PiRk/yj@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKNYUaPS0PiRk/yj@lstrano-desk.jf.intel.com>
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

On Mon, Aug 18, 2025 at 09:44:01AM -0700, Matthew Brost wrote:
> On Mon, Aug 18, 2025 at 01:36:17PM -0300, Jason Gunthorpe wrote:
> > On Mon, Aug 18, 2025 at 09:25:20AM -0700, Matthew Brost wrote:
> > > I think this choice makes sense: it allows embedding the wait state from
> > > the initial notifier call into the pass structure. Patch [6] shows this
> > > by attaching the issued TLB invalidation fences to the pass. Since a
> > > single notifier may be invoked multiple times with different ranges but
> > > the same seqno,
> > 
> > That should be explained, but also seems to be a bit of a different
> > issue..
> > 
> > If the design is really to only have two passes and this linked list
> > is about retaining state then there should not be so much freedom to
> > have more passes.
> 
> I’ll let Thomas weigh in on whether we really need more than two passes;
> my feeling is that two passes are likely sufficient. It’s also worth
> noting that the linked list has an added benefit: the notifier tree only
> needs to be walked once (a small time-complexity win).

You may end up keeping the linked list just with no way to add a third
pass.

Jason
