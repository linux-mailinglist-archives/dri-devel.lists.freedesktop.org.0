Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F142FB51D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 11:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF3A6E071;
	Tue, 19 Jan 2021 10:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2CE06E071
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 10:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=WrquiBuG+KVAWHAX4NNrfVFZoP8VccvEDCV+/B/kWxA=; b=Mv6BZgEStVz3JVHNe6c3+s4HIe
 OoMwEPOI+sO4G3onMa4qPV9nO9XRK2JzAGF9W34z4MeTGXJ29NJS2rPRFq3GzV7+mF7oM4JQIRu6r
 JngMshHpLPlw+j98CLG4BxZoEx8/0CgeudMCnEXPd1UB/HiTkjcnN0tHKd6h6InlLQzjc45z3JSK4
 9fshbjLZpDYEGMNK5VRH8ry17mGnDvQ6oU7rNavoSfpqDu/JjbvPSI6OSnwQyzcJ6kTRgQVH2DiWn
 v8D4y/GGxeZchFmcQTx8TrWMJloBvxm+wRGTA2sNFjSa52GEvir2RH38IyeKbPI8iZrdK1jKvwUzn
 gM2EGOvw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l1nsu-00E9ml-90; Tue, 19 Jan 2021 10:05:16 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A01CB3007CD;
 Tue, 19 Jan 2021 11:05:08 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 844672023AA23; Tue, 19 Jan 2021 11:05:08 +0100 (CET)
Date: Tue, 19 Jan 2021 11:05:08 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: christian.koenig@amd.com
Subject: Re: [PATCH] drm/syncobj: make lockdep complain on WAIT_FOR_SUBMIT v2
Message-ID: <YAau1CBmMNPM5KqV@hirez.programming.kicks-ass.net>
References: <20210118180334.43714-1-christian.koenig@amd.com>
 <20210118180334.43714-2-christian.koenig@amd.com>
 <YAan6haGjnIlNIoJ@hirez.programming.kicks-ass.net>
 <019f2342-9d64-f6c6-d03d-0ab8ddce101d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <019f2342-9d64-f6c6-d03d-0ab8ddce101d@gmail.com>
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
Cc: mingo@redhat.com, will@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 19, 2021 at 10:46:53AM +0100, Christian K=F6nig wrote:
> But I'm going to double check if drm_syncobj_fence_add_wait() isn't used
> elsewhere as well.

drm_syncobj_array_wait_timeout()

Which is why I asked.. :-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
