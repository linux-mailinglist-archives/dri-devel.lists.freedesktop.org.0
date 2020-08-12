Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C58624268E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 10:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566436E06D;
	Wed, 12 Aug 2020 08:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E2D6E06D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=273dSJQbCcOMiq+fFE89MQrcZlFAGUoRnWDb1EWwM7U=; b=HOramXFjmkWvW9CgnJwJPceaQo
 4ivL6jDj9wYcYMgK5eUXLfaLtk/XpBTIb0qAN2G7ZbeaHZCsGFz5cqCq4UlSISCZ0UEvaY1KFkuVo
 Cd78HWN1hJRTsJWqcIWzCEUJjjmplxb+3sf9NGWku5bWTqB79TnSwGy0IyVc7r8Kyk3vzs6TcCLHM
 fuXyHuGoVBMwznnI9mHx+i84WeHpsfwWJ5y5hyF7cDQo4eAyLDMQGsEK8XxAFSRkMu9XCrpStSU1j
 O895kuzbHtxasueKidcxaiBh9MpsKxwWv6dFyU4aKgO1kFvHhrURwQAdNfdlr9rv5PI7tdOiw3Ygg
 QPuKZ8Jw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5lqd-0000V2-Op; Wed, 12 Aug 2020 08:10:59 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 43D913028C8;
 Wed, 12 Aug 2020 10:10:57 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2F892220F91A1; Wed, 12 Aug 2020 10:10:57 +0200 (CEST)
Date: Wed, 12 Aug 2020 10:10:57 +0200
From: peterz@infradead.org
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] locking/rwsem: remove redundant semicolon of
 down_write_nest_lock
Message-ID: <20200812081057.GJ2674@hirez.programming.kicks-ass.net>
References: <20200811111852.190209-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200811111852.190209-1-christian.koenig@amd.com>
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
Cc: mingo@redhat.com, will@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 11, 2020 at 01:18:52PM +0200, Christian K=F6nig wrote:
> From: Guchun Chen <guchun.chen@amd.com>
> =

> Otherwise, braces are needed when using it.
> =

> Signed-off-by: Guchun Chen <guchun.chen@amd.com>
> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

Thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
