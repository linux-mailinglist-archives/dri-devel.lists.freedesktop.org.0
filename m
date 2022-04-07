Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB5F4F7B8E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD11110E250;
	Thu,  7 Apr 2022 09:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D85010E775;
 Thu,  7 Apr 2022 09:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=7mLWqo55aLIM3ENweBsO1ZtF+sHB9PXi6WrDPhe6EQM=; b=EiDS7Aem9yy9VJQ9e9fyzSDJUH
 VWN4Iw3JnZRPx+65cF9ddkjQWvuLl/ROUJ3jOIKCrqDoCWQGMNfc7xqJJIwxmBtXNkIDxrAfX5cOj
 /s8Dqr6hYphiA+biAzonBOHwiNxVEYw+j3yWTsQxtLVOfnVA6v4/3jhyYfuzYy6GB3lM7uIrutzwq
 MwqAz2fevrfPCI37fjAg27GWrm2WANdkgaEIv8dQ7Q0EYk5K+0wObearqxIvD6KpgG8hMKxzrAIFr
 Nyv8wIsOK8TVmc9glXRgfPROnLK1nxPJSNuCDw+O0fsyzAWd2WQ7FcNEK9/BumXhO/dMFbzg3/ifi
 KvPM0KHg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncOP9-002Rm2-QQ; Thu, 07 Apr 2022 09:26:16 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 692849862CF; Thu,  7 Apr 2022 11:26:15 +0200 (CEST)
Date: Thu, 7 Apr 2022 11:26:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 15/15] seqlock: drop seqcount_ww_mutex_t
Message-ID: <20220407092615.GJ2731@worktop.programming.kicks-ass.net>
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-16-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220407085946.744568-16-christian.koenig@amd.com>
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
Cc: Boqun Feng <boqun.feng@gmail.com>, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 07, 2022 at 10:59:46AM +0200, Christian König wrote:
> Daniel pointed out that this series removes the last user of
> seqcount_ww_mutex_t, so let's drop this.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
