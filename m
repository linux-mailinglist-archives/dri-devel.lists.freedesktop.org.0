Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 580276887ED
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 21:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C3210E614;
	Thu,  2 Feb 2023 20:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD49D10E614;
 Thu,  2 Feb 2023 20:00:16 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id z1so3010584plg.6;
 Thu, 02 Feb 2023 12:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=KTEXTLdEtQvrB7aVFpBYAbH4Vf/ihPabgDflRw+s72o=;
 b=CuJhJ9UTVuPY/jraolwLg+hw6h/pKxRy1SLRd/hEO8GnE3cDoiPidADrjRGw4Tat7E
 jsPj+B5/JWPEzkR1ov2cP4QLjkGjelgudaCyhdc4WTw+8Tb5Oonu+M6rmd85VoAp+09n
 p29yqXXOCqF9Y85uU7Om7KJ2ttMYgVWNGXZB9YxNzDvxDzbpksNHc1G+p86CxKdlN0Ty
 +rwXXExzAQPU5AL4D29Etk7FWGP466Or/Daf4dCE9QSEqudpR8qq8SpggqjYy48/R5Nd
 XYVHbi+FsHBVz+Wv+DIRXgY0DRGWK3xQsCPpOzfidwB7nrd2hKVFHAH562MKRavuNJmY
 xtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KTEXTLdEtQvrB7aVFpBYAbH4Vf/ihPabgDflRw+s72o=;
 b=cOd056a/GrX8pDWiMPmEczovXW5fRre5zYkRDlcnSekjPs8L9PBKpMH2rItQHddIJa
 zxZMKG68YT/e828qzS7lxnB3WJqVIf8h+jlVLkdqfvj7/BmUz722xTeyuGZCqQaLLosN
 oMkySNy1o0Bk7Gg2plZ1uNIZ3/BAsTOKyk33lhBzxGz72sxGq0fbc/y3cPMxemITxwmy
 o+rhN668Uyp8C//Jl9Yz1QKu2Jhr8ft/0qS+fdagAacdrgblmlNnly/ilzEJU3OCYlyB
 rjMYTeYgd5wknFO42NySWrBeShp288n48Fm7GUsRxGhcL8y/d66pmMqZ+vi4TrzFe4iS
 aASw==
X-Gm-Message-State: AO0yUKVVM6tNk8TWqBYloZd1h3HXfzZvYt05O93EUWsAz0K1MuB8ogYS
 U6ZjEIEJFq2+A4yPVW5BWm4=
X-Google-Smtp-Source: AK7set8Q9bsQxt4cyQu1ye65OLJScIues9R6Sdz55WQAGcTEZjBv9qXC8qRJpwpjQ6p92muQd2Vhww==
X-Received: by 2002:a17:903:1111:b0:196:6ec4:52db with SMTP id
 n17-20020a170903111100b001966ec452dbmr8506618plh.51.1675368016015; 
 Thu, 02 Feb 2023 12:00:16 -0800 (PST)
Received: from localhost ([2620:10d:c090:400::5:48a9])
 by smtp.gmail.com with ESMTPSA id
 10-20020a170902c14a00b001933b4b1a49sm53850plj.183.2023.02.02.12.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 12:00:15 -0800 (PST)
Date: Thu, 2 Feb 2023 10:00:14 -1000
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC 10/12] cgroup/drm: Introduce weight based drm cgroup control
Message-ID: <Y9wWTspETnYYodDc@slm.duckdns.org>
References: <20230112165609.1083270-1-tvrtko.ursulin@linux.intel.com>
 <20230112165609.1083270-11-tvrtko.ursulin@linux.intel.com>
 <Y9R2N8sl+7f8Zacv@slm.duckdns.org>
 <27b7882e-1201-b173-6f56-9ececb5780e8@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27b7882e-1201-b173-6f56-9ececb5780e8@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Thu, Feb 02, 2023 at 02:26:06PM +0000, Tvrtko Ursulin wrote:
> When you say active/inactive - to what you are referring in the cgroup
> world? Offline/online? For those my understanding was offline was a
> temporary state while css is getting destroyed.

Oh, it's just based on activity. So, for example, iocost puts a cgroup on
its active list which is canned periodically when an IO is issued from an
inactive cgroup. If an active cgroup doesn't have any activity between two
scans, it becomes inactive and dropped from the list. drm can prolly use the
same approach?

> Also, I am really postponing implementing those changes until I hear at
> least something from the DRM community.

Yeah, that sounds like a good idea.

Thanks.

-- 
tejun
