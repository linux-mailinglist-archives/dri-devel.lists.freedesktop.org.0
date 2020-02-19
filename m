Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F49165980
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45E26ECF2;
	Thu, 20 Feb 2020 08:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1566EC71
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 18:38:44 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id r5so946489qtt.9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8Doxcme7+jrZwJS6ST/rzTNwpMBSbirxVwxv1qEdw5s=;
 b=rYeKImttZI7x6bzjER2czevU8xhzoiO0fHOwBWL2BT4hsGECSGmyqPgoGTV4CucsBZ
 uTnJoXNwR7UAglw3UPw1NxLU5ddpTksdSVtT5QjXF1AnurYfoBBc8IdvY2YodtGt8z0M
 QacjY8wuodiTGBs0IVVATW2YMRzBMkLiyZHVjGvvF9BNoW9pjzl8ft6Qnc6yAvcSuxDs
 UzhfJPLoXJgkQP5KuxvV/2RNezt7UtdUOKjQ2fR59CK2Jo345MJFsX4yD2NmH1oVRyhb
 ArUtmfikqkqsHkSnUBKIK5mbtPTvuTR16p7k9MSKdETJT+ebL/CRLYK+ZgbmmphjUcH0
 eXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8Doxcme7+jrZwJS6ST/rzTNwpMBSbirxVwxv1qEdw5s=;
 b=jFsCPdGlTm/zUrVEkENcSNjQj8seOV/i+ESFgL1GLRnQWBq6+o3Bkovu4cHKwGcFIC
 7pxvTICzZu0n3D+XKmCeknayp3tgyupb1OzKXu9pwsfsrv0QbbgKjqhhTCShP0+QR0BR
 mlqu7iy+AJVsS/TeCft+L4Uz4myM1V9DslM+Wz1idN3RE+EXvaSoHdDAaEOO8E/08jWh
 K8TYXbIIr1vXe33U4W0KGz3X4n7OSxMDrasJSGxhbe+wD31hPY80e8m8V2EzKSLN2Sc9
 DZkUdjaahdx5dZcsel6ETP/WoV6IyAQVzXXlFX5jmCBMaRn+jgqlgTFETIDtMAvOS5Dl
 dU6A==
X-Gm-Message-State: APjAAAVTTozDBqUDWo8Ti6YWyQsLQeRh2e1bLvfQ3ucO3Ja+YnDtrRax
 LDWUXD4IXzwhE1azwAYzYepk+A==
X-Google-Smtp-Source: APXvYqzKQY+wCwO5dOV01Ah7jfljGDG/Ul5zVw7kKLgCnfZrY8hsRus06+mtT0cEH4YRMtnIpYneFg==
X-Received: by 2002:ac8:1ca:: with SMTP id b10mr22890647qtg.314.1582137523279; 
 Wed, 19 Feb 2020 10:38:43 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::2:3bde])
 by smtp.gmail.com with ESMTPSA id z1sm402480qtq.69.2020.02.19.10.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 10:38:41 -0800 (PST)
Date: Wed, 19 Feb 2020 13:38:41 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [PATCH 09/11] drm, cgroup: Introduce lgpu as DRM cgroup resource
Message-ID: <20200219183841.GA54486@cmpxchg.org>
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
 <20200214155650.21203-10-Kenny.Ho@amd.com>
 <CAOFGe96N5gG+08rQCRC+diHKDAfxPFYEnVxDS8_udvjcBYgsPg@mail.gmail.com>
 <CAOWid-f62Uv=GZXX2V2BsQGM5A1JJG_qmyrOwd=KwZBx_sr-bg@mail.gmail.com>
 <20200214183401.GY2363188@phenom.ffwll.local>
 <CAOWid-caJHeXUnQv3MOi=9U+vdBLfewN+CrA-7jRrz0VXqatbQ@mail.gmail.com>
 <20200214191754.GA218629@mtj.thefacebook.com>
 <20200219161850.GB13406@cmpxchg.org>
 <CAOWid-e=7V4TUqK_h5Gs9dUXqH-Vgr-Go8c1dCkMux98Vdd1sQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-e=7V4TUqK_h5Gs9dUXqH-Vgr-Go8c1dCkMux98Vdd1sQ@mail.gmail.com>
X-Mailman-Approved-At: Thu, 20 Feb 2020 08:45:37 +0000
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
Cc: juan.zuniga-anaya@amd.com, Kenny Ho <Kenny.Ho@amd.com>, "Kuehling,
 Felix" <felix.kuehling@amd.com>, jsparks@cray.com, nirmoy.das@amd.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 lkaplan@cray.com, Alex Deucher <alexander.deucher@amd.com>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 damon.mcdougall@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 11:28:48AM -0500, Kenny Ho wrote:
> On Wed, Feb 19, 2020 at 11:18 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > Yes, I'd go with absolute units when it comes to memory, because it's
> > not a renewable resource like CPU and IO, and so we do have cliff
> > behavior around the edge where you transition from ok to not-enough.
> >
> > memory.low is a bit in flux right now, so if anything is unclear
> > around its semantics, please feel free to reach out.
> 
> I am not familiar with the discussion, would you point me to a
> relevant thread please?

Here is a cleanup patch, not yet merged, that documents the exact
semantics and behavioral considerations:

https://lore.kernel.org/linux-mm/20191213192158.188939-3-hannes@cmpxchg.org/

But the high-level idea is this: you assign each cgroup or cgroup
subtree a chunk of the resource that it's guaranteed to be able to
consume. It *can* consume beyond that threshold if available, but that
overage may get reclaimed again if somebody else needs it instead.

This allows you to do a ballpark distribution of the resource between
different workloads, while the kernel retains the ability to optimize
allocation of spare resources - because in practice, workload demand
varies over time, workloads disappear and new ones start up etc.

> In addition, is there some kind of order of preference for
> implementing low vs high vs max?

If you implement only one allocation model, the preference would be on
memory.low. Limits are rigid and per definition waste resources, so in
practice we're moving away from them.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
