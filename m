Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD999B2AE4A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 18:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF80D10E4AE;
	Mon, 18 Aug 2025 16:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="muTQSOON";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AF110E4A3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 16:36:19 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4b109c4af9eso35182231cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 09:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1755534979; x=1756139779; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g8Qw52IvfeGqkNMfZ2jn+p5tbsiqR4BTKmRhpUh8Pow=;
 b=muTQSOONZ5nKNNzuPhoMKY/ui7Jo2XYElwaRh+xhj8vWBN1U5nf4ZgRm/HUGJRAUrb
 Pkm1+fCob/6RlOSn2o4OItNSX3PACLCyE20AZjgl+lWwOEl2sgv+KrwqShWSMKBEDxFq
 kD//ikHdQfI7tCo2oj4GM3+QdSuXWnFYIf9+CzDo0c+uGDgCitRRX06U0tprLay/4j6G
 vJusKBDt8ZjqmSO905C9Zt8g+mqhLjEaYDNrxE7yPRhKnxVXWBPcRDPnRYXoYWFDxMu/
 M7Hks1oGmtcjddc0jD4JJaRpDXV/JeUbi9KsLPwlLjCWlQotegSBW6WdLnWOs/HeNlNV
 Cq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755534979; x=1756139779;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g8Qw52IvfeGqkNMfZ2jn+p5tbsiqR4BTKmRhpUh8Pow=;
 b=bOeqfyec2QwzIKVgZCSBFGbEuoRGAkmkZd9zxiBPTj95vL6TELa6Q9YACT+VocHzm8
 rl7+NTpl7eUAG1qrkpIoFTbLKYFXQnTecVv8tsfb4QFB9fC/sFjJS0KJ3vi4L0FvfVat
 sDi0h86nIgwXNWbdVpaJJZkrQSZkZvEq5FHAF6Rii5r1ZHBdsK3vKJ0pfAacd0ByQi9H
 s4QWQ8iDwiU7H29nX6MF3Hpri+k8E7e7XbbbUB3KhkZIgFsZEUBkmHoMfY16h5OxzC4x
 2WWkJ3bw6uJnYBH2g4XJXzfyt4ykb8/8YLXH+8ou3fwx4cksD6QO3AEjhOoWi5t2wg9K
 jwcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj/U5/fYw7XqprLmcrKNIwfjA+/ti3XKJkoKUvl2qbf0S9KcVNJHBv8Q/a1Pa3Ju5nOq/XNBIrjn0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydDfDG7jHzAo44XYCXSIjdkQZNA/m4xDKW/8YRYb02jwO4NeE/
 7mabj96pEHvBBkUYHe4u7evS4AD3eXGPSjeajOf7ghgBBh10SM6x0X2gr9MchvclETc=
X-Gm-Gg: ASbGncsG2yr+lPE0ynruWuOcZPjYC61j4IIsQNAIl+qtnlO6vSEhldqYbiBdGGf9RZQ
 o8RaWsmF7TAIHVT6Ue3baCWPHqZXx+1uU7xlojk3pSQSHgqSm2Pbhzk/aBTueoM1oTtabeGVlCq
 7LfYeUrkfviSUHDYbCD45c9x6VMTaIeChWQsRUQd06j/nVlY+CgQNE8bLz9vJ7PjQpSvp1LGmI/
 +euqaOx7Xl8H6jluqGy6AHMadlVrKNm2naEB2tyzKC0GOlBF68+CzUSnWNo1Ng9cA52pB51KPHZ
 Rx7zODz5Ojuy2/KSmkhduBUFObblJrE++pC3919BaXpk3OTtbWdLot0jzF5O7PtohrKon+qx
X-Google-Smtp-Source: AGHT+IHVTekjFOmo8tz7Xgwi6XnFUskfa5a09qL5qXfEjb1nIAksYckiRGpg/LVtaH6xVkuRuKrP0g==
X-Received: by 2002:a05:622a:2d5:b0:4b0:b7d2:763f with SMTP id
 d75a77b69052e-4b11e29510cmr187661001cf.47.1755534978599; 
 Mon, 18 Aug 2025 09:36:18 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b11ddd8727sm54906631cf.39.2025.08.18.09.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 09:36:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uo2qH-00000004PiO-1QzU;
 Mon, 18 Aug 2025 13:36:17 -0300
Date: Mon, 18 Aug 2025 13:36:17 -0300
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
Message-ID: <20250818163617.GI599331@ziepe.ca>
References: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
 <20250809135137.259427-2-thomas.hellstrom@linux.intel.com>
 <20250818160726.GH599331@ziepe.ca>
 <aKNT8GUu0r3i4Ikq@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKNT8GUu0r3i4Ikq@lstrano-desk.jf.intel.com>
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

On Mon, Aug 18, 2025 at 09:25:20AM -0700, Matthew Brost wrote:
> I think this choice makes sense: it allows embedding the wait state from
> the initial notifier call into the pass structure. Patch [6] shows this
> by attaching the issued TLB invalidation fences to the pass. Since a
> single notifier may be invoked multiple times with different ranges but
> the same seqno,

That should be explained, but also seems to be a bit of a different
issue..

If the design is really to only have two passes and this linked list
is about retaining state then there should not be so much freedom to
have more passes.

Jason
