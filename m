Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837D8AAE834
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 19:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B191810E86C;
	Wed,  7 May 2025 17:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="PMmzeKPB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD6410E86C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 17:52:43 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6ecfbf8fa76so2348816d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 10:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746640363; x=1747245163;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uwbbKB2TGYLFE4veY3gGLDIpfEXqZNhneox5iaSq2IE=;
 b=PMmzeKPBWmM3XU96L9BDWhzLsvSurbHapYMwIPRs0nT7j/GtKZ16pfQK4vVXoUCtLd
 cmTa31RggBpyM5IIXlhXKzzR4YctlbQLrIBn3aoXE2le4sEsjGzi/yyGJOd5/m2TbNUA
 /csjg6J9njn+4Ng74clgwYIQDwcv1kBysaIBuhU7m+V/Db6Edtwjahp0RWzd1EFFaMRU
 NWa8/zu7u5DWT9ojd8clRzGQG/w4hmq0zzJR0tSacz5vrpdAi6OSjZX5NZLCor+wJTyM
 00pdY/IYSlMLPLiBmpSpvEJu6to+okJ5lthGbn/wHah8rklwlxqFrL1yH1mSJtqMkepa
 4OwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746640363; x=1747245163;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uwbbKB2TGYLFE4veY3gGLDIpfEXqZNhneox5iaSq2IE=;
 b=FDmv6OoCkvJr1/59pnxH8/4Lwj251ctx8QhlB/KC5vmHJGv9g6gOvo6Hl72nnfLcwY
 SQpy2GZdxFFOmJRlF1d8VlVpN3NcoA6NyeClWHlD2TYwTmO+djqMFgt9jty7xX0uxIYA
 dj5QGWnAFJWRXRb7/vqjqK1zImb5TYwfo++gnoTIC2s/33vt4Htfc/CDACyo6cXZ5TJx
 Pbaqdd3eLf0HrT5gYOfIo+/MAUglZ6Jg2IBkqgoPy3LntmTWXTX7WXAphIJvDwv/VGuM
 5TUGqmH2WzG+BmBZkIn38+In0VP+2o6vhSuIxIhTefCjlcuwdKQMfw8rKYexKSpCaP+R
 yr2w==
X-Gm-Message-State: AOJu0YyfGuwW/u5g+QVQirqkBSYc/qsnDEjbsrE8e99qNw/JGUBtCRK+
 7FwPPvG/9TVgLHDwMS3cfFkSyS4R31D40+2glp9rCVmSUmWkO4usNIep1cIL+l0=
X-Gm-Gg: ASbGncuFrvKlfNUDFQ6EBTaHL85LKF9X6RYVYgyv7RmnsoBn7kgDc4qdW1x33802PBv
 /5KdG8qL9GY8KPo6ZHT/jQIfs2liogLFQ1GNic6voCuKjpJcIsOTp41FlRIAu9ZXdJz3UXQeNrB
 E1m+1nIX0ltYCKEEqGxpIHtVbtyT3K+jZbEoNri2aUj61/G4zZz3gTYVCV/yx8nfoArtSUNfkvL
 jl+qZbaTWUnS+tCSWNhWE2+3lIIVGfiFowG0ZsvKOjiGS7Jpk5PMUt389W1PU67ywySR7XMLKoE
 rOWuZ6+nMJwfHTXKAQ1jEGEkzHuzzhZmkMBJ0Aw=
X-Google-Smtp-Source: AGHT+IHH43mAJ6j8NHoQHgd5dHvkco+AvBLpBXk7z7HjmDWyyxQSxP0kD/YiwHsD4miO14w1gFKHwg==
X-Received: by 2002:ad4:5ca5:0:b0:6d8:99cf:d2e3 with SMTP id
 6a1803df08f44-6f542a55c59mr57521136d6.22.1746640363017; 
 Wed, 07 May 2025 10:52:43 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6f542647e0esm17019576d6.30.2025.05.07.10.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 10:52:42 -0700 (PDT)
Date: Wed, 7 May 2025 13:52:38 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org,
 christian.koenig@amd.com, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
Message-ID: <20250507175238.GB276050@cmpxchg.org>
References: <20250502034046.1625896-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502034046.1625896-1-airlied@gmail.com>
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

Hello Dave,

On Fri, May 02, 2025 at 01:35:59PM +1000, Dave Airlie wrote:
> Hey all,
> 
> This is my second attempt at adding the initial simple memcg/ttm
> integration.
> 
> This varies from the first attempt in two major ways:
> 
> 1. Instead of using __GFP_ACCOUNT and direct calling kmem charges
> for pool memory, and directly hitting the GPU statistic, Waiman
> suggested I just do what the network socket stuff did, which looks
> simpler. So this adds two new memcg apis that wrap accounting.
> The pages no longer get assigned the memcg, it's owned by the
> larger BO object which makes more sense.

Unfortunately, this was bad advice :(

Naked-charging like this is quite awkward from the memcg side. It
requires consumer-specific charge paths in the memcg code, adds stat
counters that are memcg-only with no system-wide equivalent, and it's
difficult for the memcg maintainers to keep track of the link between
what's in the counter and the actual physical memory that is supposed
to be tracked.

The network and a few others like it are rather begrudging exceptions
because they do not have a suitable page context or otherwise didn't
fit the charging scheme. They're not good examples to follow if it can
at all be avoided.

__GFP_ACCOUNT and an enum node_stat_item is the much preferred way. I
have no objections to exports if you need to charge and account memory
from a module.
